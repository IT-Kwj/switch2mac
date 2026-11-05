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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
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
    float2 _498 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_498, float2(0.0), isnan(_498)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _515 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).x;
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
    float _144 = _110 * _140;
    float _146 = _114 * _140;
    float _148 = _100 * _140;
    float _150 = _128 * _142;
    float _152 = _120 * _142;
    float _154 = _124 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = -_68;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _168 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[46].z, _166);
    float _170 = _148 * _154;
    float _172 = -_158;
    float _174 = fma(_148, _150, _172);
    float _176 = _162 * _162;
    float _178 = -_170;
    float _180 = fma(_144, _152, _178);
    float _182 = -_168;
    bool _186 = _182 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _188 = fma(_174, _174, _176);
    float _190 = -_168;
    bool _192 = _190 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _194 = -_168;
    bool _196 = _194 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _198 = fma(_180, _180, _188);
    bool _200 = !_186;
    int _203 = _200 ? 0 : 1;
    float _205 = rsqrt(_198);
    int _207 = 2;
    if (!_186)
    {
        _207 = 1;
    }
    int _209 = _207;
    int _211 = _209;
    if (!_192)
    {
        _211 = _203;
    }
    int _213 = _211;
    int _215 = _213 + 1;
    uint _218 = uint(_215);
    if (!_196)
    {
        _218 = uint(_213);
    }
    uint _220 = _218;
    uint _222 = min(_220, 2u);
    float _224 = _162 * _205;
    float _226 = _174 * _205;
    float _228 = _180 * _205;
    int _230 = int(_222) << 2;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _234 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].x, _232);
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].z, _234);
    uint _238 = uint(int(uint(_230) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = abs(_236);
    float _248 = -_246;
    float _250 = _248 + 1.0;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = abs(_252);
    float _256 = log2(_254);
    float _258 = _256 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _260 = exp2(_258);
    float _262 = _260 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _264 = _226 * _262;
    float _266 = _224 * _262;
    float _268 = fma(_228, _262, _168);
    float _270 = fma(_168, _74, _264);
    float _272 = fma(_168, _70, _266);
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
            float _282 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _290 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _282);
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _288);
            float _298 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
            float _300 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
            float _302 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[2].z, _294);
            float _304 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[3].z, _296);
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _314 = _312;
            _316 = _310;
            _318 = _306;
            _320 = _308;
        }
    }
    if ((false || _280) || _278)
    {
        if ((!_280) || _278)
        {
            _278 = false;
            float _322 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _324 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _330 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _322);
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _328);
            float _338 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[4].z, _330);
            float _340 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[5].z, _332);
            float _342 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[6].z, _334);
            float _344 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[7].z, _336);
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _314 = _352;
            _316 = _350;
            _318 = _346;
            _320 = _348;
        }
        if (false || _280)
        {
            _280 = false;
            float _354 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _356 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _362 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _354);
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _360);
            float _370 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[8].z, _362);
            float _372 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[9].z, _364);
            float _374 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[10].z, _366);
            float _376 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[11].z, _368);
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _314 = _384;
            _316 = _382;
            _318 = _378;
            _320 = _380;
        }
    }
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float2 _1121 = float2(_54, _56);
    float2 _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1121, float2(0.0), isnan(_1121))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1121, float2(0.0), isnan(_1121))).xy;
    float _398 = _396.x;
    float _400 = _396.y;
    float _402 = 1.0 / _386;
    float _404 = float(int(_220));
    float _406 = rint(_404);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _402 * _388;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _402 * _390;
    float _420 = _402 * _392;
    float _422 = _416 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _424 = _422 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _426 = _422 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _428 = fma(_424, -0.5, _418);
    float _430 = fma(_426, -0.5, _420);
    float _432 = fma(_424, 0.5, _418);
    float _434 = fma(_426, 0.5, _420);
    float3 _1190 = float3(_428, _434, float(int(_412)));
    float3 _1194 = select(_1190, float3(0.0), isnan(_1190));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1194.xy, uint(rint(_1194.z)), _416);
    float3 _1203 = float3(_432, _434, float(int(_412)));
    float3 _1205 = select(_1203, float3(0.0), isnan(_1203));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1205.xy, uint(rint(_1205.z)), _416);
    float3 _1214 = float3(_432, _430, float(int(_412)));
    float3 _1216 = select(_1214, float3(0.0), isnan(_1214));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1216.xy, uint(rint(_1216.z)), _416);
    float3 _1225 = float3(_428, _430, float(int(_412)));
    float3 _1227 = select(_1225, float3(0.0), isnan(_1225));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1227.xy, uint(rint(_1227.z)), _416);
    float _444 = fma(_398, 2.0, -1.0);
    float _446 = fma(_400, 2.0, -1.0);
    float _448 = _444 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _450 = _446 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _452 = fma(_448, 2.0, _54);
    float _454 = fma(_450, 2.0, _56);
    float2 _1254 = float2(_452, _454);
    float _456 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1254, float2(0.0), isnan(_1254))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1254, float2(0.0), isnan(_1254))).x;
    float _458 = -_168;
    float _460 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _462 = _458 + _460;
    float _464 = _462 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    float _468 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[48].w, _466);
    float _470 = _438 + _436;
    float _472 = -_168;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _476 = _472 + _474;
    float _478 = _470 + _440;
    float _480 = _476 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _478 + _442;
    float _486 = fma(_484, 0.25, _482);
    out.m_47.x = _456;
    out.m_47.y = _486;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _468;
    return out;
}

