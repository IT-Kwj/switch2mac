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
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _278 = false;
    bool _276 = false;
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _518 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _535 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_535, float2(0.0), isnan(_535))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_535, float2(0.0), isnan(_535))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_98;
    float _104 = fma(_90, _72, _102);
    float _106 = -_98;
    float _108 = fma(_96, _74, _106);
    float _110 = -_100;
    float _112 = fma(_90, _76, _110);
    float _114 = -_100;
    float _116 = fma(_96, _78, _114);
    float _118 = _104 * _104;
    float _120 = _108 * _108;
    float _122 = -_84;
    float _124 = _122 + _90;
    float _126 = -_84;
    float _128 = _126 + _96;
    float _130 = fma(_112, _112, _118);
    float _132 = fma(_116, _116, _120);
    float _134 = fma(_124, _124, _130);
    float _136 = fma(_128, _128, _132);
    float _138 = -_66;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = rsqrt(_136);
    float _146 = _142 * _68;
    float _148 = -_142;
    bool _152 = _148 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _154 = -_142;
    bool _156 = _154 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _158 = -_142;
    bool _160 = _158 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _162 = rsqrt(_134);
    float _164 = _128 * _144;
    float _166 = _108 * _144;
    float _168 = _116 * _144;
    float _170 = _112 * _162;
    float _172 = _124 * _162;
    float _174 = _104 * _162;
    float _176 = _170 * _164;
    float _178 = _172 * _166;
    float _180 = _174 * _168;
    float _182 = -_176;
    float _184 = fma(_172, _168, _182);
    float _186 = -_178;
    float _188 = fma(_174, _164, _186);
    float _190 = -_180;
    float _192 = fma(_170, _166, _190);
    bool _194 = !_152;
    int _197 = _194 ? 0 : 1;
    float _199 = _184 * _184;
    int _201 = 2;
    if (!_152)
    {
        _201 = 1;
    }
    int _203 = _201;
    float _205 = fma(_188, _188, _199);
    int _207 = _203;
    if (!_156)
    {
        _207 = _197;
    }
    int _209 = _207;
    float _211 = fma(_192, _192, _205);
    int _213 = _209 + 1;
    uint _216 = uint(_213);
    if (!_160)
    {
        _216 = uint(_209);
    }
    uint _218 = _216;
    float _220 = rsqrt(_211);
    uint _222 = min(_218, 2u);
    int _224 = int(_222) << 2;
    float _226 = _184 * _220;
    float _228 = _188 * _220;
    float _230 = _192 * _220;
    float _232 = _142 * _70;
    float _234 = _226 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _236 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].x, _234);
    uint _238 = uint(int(uint(_224) >> uint(2)));
    uint _240 = uint(int(uint(int(_238)) >> uint(2)));
    int _242 = int(_238) & 3;
    float _244 = (*spvDescriptorSet0.fp_c1)._m0[int(_240)][_242];
    float _246 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[35].z, _236);
    float _248 = abs(_246);
    float _250 = -_248;
    float _252 = _250 + 1.0;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = abs(_254);
    float _258 = log2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _262 = exp2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _266 = fma(_228, _264, _232);
    float _268 = fma(_226, _264, _146);
    float _270 = fma(_230, _264, _142);
    bool _272 = as_type<int>(_244) == 1264;
    if (!_272)
    {
        bool _274 = as_type<int>(_244) == 1536;
        _276 = _274;
        if (!_276)
        {
            _278 = true;
        }
    }
    float _312;
    float _314;
    float _316;
    float _318;
    if (!_276)
    {
        if (!_278)
        {
            float _280 = _268 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _282 = _268 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _284 = _268 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _286 = _268 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _288 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
            float _290 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].x, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].z, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].z, _290);
            float _300 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
            float _302 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].z, _294);
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _312 = _310;
            _314 = _304;
            _316 = _306;
            _318 = _308;
        }
    }
    if ((false || _278) || _276)
    {
        if ((!_278) || _276)
        {
            _276 = false;
            float _320 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _322 = _268 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _324 = _268 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _326 = _268 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _328 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].x, _320);
            float _330 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].x, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].z, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].z, _330);
            float _340 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].z, _332);
            float _342 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].z, _334);
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _312 = _350;
            _314 = _344;
            _316 = _346;
            _318 = _348;
        }
        if (false || _278)
        {
            _278 = false;
            float _352 = _268 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _354 = _268 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _356 = _268 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _358 = _268 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _360 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].x, _352);
            float _362 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].x, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].z, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].z, _362);
            float _372 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].z, _364);
            float _374 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].z, _366);
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _312 = _382;
            _314 = _376;
            _316 = _378;
            _318 = _380;
        }
    }
    float _384 = _312;
    float _386 = _314;
    float _388 = _316;
    float _390 = _318;
    float _392 = _146 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _394 = _146 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _396 = 1.0 / _384;
    float _398 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[15].x, _392);
    float _400 = _146 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _402 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[13].x, _394);
    float _404 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[15].z, _398);
    float _406 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[13].z, _402);
    float _408 = _404 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _410 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[12].x, _400);
    float _412 = _406 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _414 = 1.0 / _408;
    float _416 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[12].z, _410);
    float _418 = _396 * _386;
    float _420 = _396 * _388;
    float _422 = _396 * _390;
    float _424 = precise::clamp(_422, 0.0, 1.0);
    float _426 = _416 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _428 = _426 * _414;
    float _430 = _412 * _414;
    float _432 = float(int(_218));
    float2 _1222 = float2(_428, _430);
    float2 _436 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1222, float2(0.0), isnan(_1222))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1222, float2(0.0), isnan(_1222))).xy;
    float _438 = _436.x;
    float _440 = _436.y;
    float _442 = rint(_432);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    uint _448 = clamp(_446, 0u, 65535u);
    float3 _1247 = float3(_418, _420, float(int(_448)));
    float3 _1251 = select(_1247, float3(0.0), isnan(_1247));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1251.xy, uint(rint(_1251.z)), _424);
    float _452 = _146 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _454 = -_142;
    float _456 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _458 = _454 + _456;
    float _460 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[14].x, _452);
    float _462 = _458 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    float _466 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[14].z, _460);
    float _468 = _466 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _470 = precise::min(_468, 1.0);
    float _472 = -_142;
    float _474 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _476 = _472 + _474;
    float _478 = _476 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = -_438;
    float _484 = fma(_482, _438, _440);
    float _486 = -_438;
    float _488 = _470 + _486;
    float _490 = fma(_488, _488, _484);
    bool _492 = _488 <= 0.001000000047497451305389404296875;
    float _494 = float(_492);
    float _496 = 1.0 / _490;
    float _498 = _484 * _496;
    float _500 = _450 + _464;
    float _502 = precise::max(_498, _494);
    float _504 = precise::min(_502, 1.0);
    float _506 = _504 + _480;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _500;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _506;
    return out;
}

