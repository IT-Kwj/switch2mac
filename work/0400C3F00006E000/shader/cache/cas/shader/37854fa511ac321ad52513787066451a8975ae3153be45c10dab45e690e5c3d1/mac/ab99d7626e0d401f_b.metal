#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _280 = false;
    bool _278 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _548 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _565 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_565, float2(0.0), isnan(_565))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_565, float2(0.0), isnan(_565))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = _70 * _86;
    float _96 = _74 * _86;
    float _98 = -_94;
    float _100 = fma(_92, _72, _98);
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_96;
    float _110 = fma(_92, _78, _108);
    float _112 = -_86;
    float _114 = _112 + _92;
    float _116 = _100 * _100;
    float _118 = -_94;
    float _120 = fma(_106, _76, _118);
    float _122 = -_96;
    float _124 = fma(_106, _80, _122);
    float _126 = -_86;
    float _128 = _126 + _106;
    float _130 = fma(_110, _110, _116);
    float _132 = _120 * _120;
    float _134 = fma(_114, _114, _130);
    float _136 = fma(_124, _124, _132);
    float _138 = fma(_128, _128, _136);
    float _140 = rsqrt(_134);
    float _142 = rsqrt(_138);
    float _144 = -_68;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[46].z, _146);
    float _150 = _148 * _74;
    float _152 = -_148;
    bool _156 = _152 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _158 = _148 * _70;
    float _160 = _110 * _140;
    float _162 = _114 * _140;
    float _164 = _100 * _140;
    float _166 = -_148;
    bool _168 = _166 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _170 = -_148;
    bool _172 = _170 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _174 = _128 * _142;
    float _176 = _120 * _142;
    float _178 = _124 * _142;
    float _180 = _160 * _174;
    float _182 = _162 * _176;
    float _184 = _164 * _178;
    int _187 = 2;
    if (!_156)
    {
        _187 = 1;
    }
    int _189 = _187;
    float _191 = -_180;
    float _193 = fma(_162, _178, _191);
    float _195 = -_182;
    float _197 = fma(_164, _174, _195);
    float _199 = -_184;
    float _201 = fma(_160, _176, _199);
    float _203 = _193 * _193;
    float _205 = fma(_197, _197, _203);
    bool _207 = !_156;
    int _209 = _207 ? 0 : 1;
    float _211 = fma(_201, _201, _205);
    int _213 = _189;
    if (!_168)
    {
        _213 = _209;
    }
    int _215 = _213;
    int _217 = _215 + 1;
    float _219 = rsqrt(_211);
    uint _222 = uint(_217);
    if (!_172)
    {
        _222 = uint(_215);
    }
    uint _224 = _222;
    uint _226 = min(_224, 2u);
    int _228 = int(_226) << 2;
    float _230 = _193 * _219;
    float _232 = _197 * _219;
    float _234 = _201 * _219;
    float _236 = _230 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _238 = uint(int(uint(_228) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[35].x, _236);
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _250 = abs(_248);
    float _252 = -_250;
    float _254 = _252 + 1.0;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = abs(_256);
    float _260 = log2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _264 = exp2(_262);
    float _266 = _264 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _268 = fma(_232, _266, _150);
    float _270 = fma(_230, _266, _158);
    float _272 = fma(_234, _266, _148);
    bool _274 = as_type<int>(_244) == 1264;
    if (!_274)
    {
        bool _276 = as_type<int>(_244) == 1536;
        _278 = _276;
        if (!_278)
        {
            _280 = true;
        }
    }
    float _314;
    float _316;
    float _318;
    float _320;
    if (!_278)
    {
        if (!_280)
        {
            float _282 = _270 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _284 = _270 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _286 = _270 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _288 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _290 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _308;
            _318 = _310;
            _320 = _306;
        }
    }
    if ((false || _280) || _278)
    {
        if ((!_280) || _278)
        {
            _278 = false;
            float _322 = _270 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _324 = _270 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _326 = _270 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _328 = _270 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _330 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _348;
            _318 = _350;
            _320 = _346;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _270 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _270 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _270 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _270 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _380;
            _318 = _382;
            _320 = _378;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _158 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _396 = 1.0 / _386;
    float _398 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _400 = float(int(_224));
    float _402 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].x, _394);
    float _404 = _158 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _406 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].x, _398);
    float _408 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[15].z, _402);
    float _410 = rint(_400);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[13].z, _406);
    float _420 = _408 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _422 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].x, _404);
    float _424 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[12].z, _422);
    float _426 = 1.0 / _420;
    float _428 = _396 * _388;
    float _430 = _418 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _432 = _424 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _434 = _396 * _390;
    float _436 = precise::clamp(_434, 0.0, 1.0);
    float _438 = _396 * _392;
    float _440 = _436 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _442 = _440 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _444 = _440 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _446 = _432 * _426;
    float _448 = _430 * _426;
    float _450 = fma(_442, 0.5, _438);
    float _452 = fma(_442, -0.5, _438);
    float _454 = fma(_444, 0.5, _428);
    float _456 = fma(_444, -0.5, _428);
    float2 _1290 = float2(_446, _448);
    float2 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1290, float2(0.0), isnan(_1290))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1290, float2(0.0), isnan(_1290))).xy;
    float _462 = _460.x;
    float _464 = _460.y;
    float3 _1305 = float3(_452, _454, float(int(_416)));
    float3 _1309 = select(_1305, float3(0.0), isnan(_1305));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1309.xy, uint(rint(_1309.z)), _436);
    float3 _1318 = float3(_450, _454, float(int(_416)));
    float3 _1320 = select(_1318, float3(0.0), isnan(_1318));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1320.xy, uint(rint(_1320.z)), _436);
    float3 _1329 = float3(_450, _456, float(int(_416)));
    float3 _1331 = select(_1329, float3(0.0), isnan(_1329));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1331.xy, uint(rint(_1331.z)), _436);
    float3 _1340 = float3(_452, _456, float(int(_416)));
    float3 _1342 = select(_1340, float3(0.0), isnan(_1340));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1342.xy, uint(rint(_1342.z)), _436);
    float2 _1348 = float2(_54, _56);
    float _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1348, float2(0.0), isnan(_1348))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1348, float2(0.0), isnan(_1348))).x;
    float _476 = _158 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _478 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].x, _476);
    float _480 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[14].z, _478);
    float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _484 = precise::min(_482, 1.0);
    float _486 = -_148;
    float _488 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _490 = _486 + _488;
    float _492 = -_148;
    float _494 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _496 = _492 + _494;
    float _498 = _490 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    float _502 = -_462;
    float _504 = fma(_502, _462, _464);
    float _506 = -_462;
    float _508 = _484 + _506;
    float _510 = _468 + _466;
    float _512 = fma(_508, _508, _504);
    bool _514 = _508 <= 0.001000000047497451305389404296875;
    float _516 = float(_514);
    float _518 = 1.0 / _512;
    float _520 = _510 + _470;
    float _522 = _520 + _472;
    float _524 = fma(_522, 0.25, _500);
    float _526 = _504 * _518;
    float _528 = _496 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = precise::max(_526, _516);
    float _534 = precise::min(_532, 1.0);
    float _536 = _534 + _530;
    out.m_47.x = _474;
    out.m_47.y = _524;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _536;
    return out;
}

