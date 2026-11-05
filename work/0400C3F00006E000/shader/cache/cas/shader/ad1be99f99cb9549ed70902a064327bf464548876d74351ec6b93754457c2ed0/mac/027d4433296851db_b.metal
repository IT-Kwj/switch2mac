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
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _128 = false;
    bool _126 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _789 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_789, float2(0.0), isnan(_789))).x;
    float _58 = in.m_42.y;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = _68 * _58;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_68;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_68;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    int _99 = _97 + 1;
    uint _102 = uint(_99);
    if (!_84)
    {
        _102 = uint(_97);
    }
    uint _104 = _102;
    uint _106 = min(_104, 2u);
    int _108 = int(_106) << 2;
    float _110 = in.m_42.x;
    uint _112 = uint(int(uint(_108) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    float _120 = _68 * _110;
    bool _122 = as_type<int>(_118) == 416;
    if (!_122)
    {
        bool _124 = as_type<int>(_118) == 688;
        _126 = _124;
        if (!_126)
        {
            _128 = true;
        }
    }
    float _162;
    float _164;
    float _166;
    float _168;
    if (!_126)
    {
        if (!_128)
        {
            float _130 = _70 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _132 = _70 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _134 = _70 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _136 = _70 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _138 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[0].x, _130);
            float _140 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[1].x, _132);
            float _142 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[2].x, _134);
            float _144 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[3].x, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _142);
            float _152 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _144);
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _162 = _160;
            _164 = _158;
            _166 = _156;
            _168 = _154;
        }
    }
    if ((false || _128) || _126)
    {
        if ((!_128) || _126)
        {
            _126 = false;
            float _170 = _70 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _172 = _70 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _174 = _70 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _176 = _70 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _178 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[4].x, _170);
            float _180 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[5].x, _172);
            float _182 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[6].x, _174);
            float _184 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[7].x, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _182);
            float _192 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _184);
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _162 = _200;
            _164 = _198;
            _166 = _196;
            _168 = _194;
        }
        if (false || _128)
        {
            _128 = false;
            float _202 = _70 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _204 = _70 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _206 = _70 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _208 = _70 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _210 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[8].x, _202);
            float _212 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[9].x, _204);
            float _214 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[10].x, _206);
            float _216 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[11].x, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _214);
            float _224 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _216);
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _162 = _232;
            _164 = _230;
            _166 = _228;
            _168 = _226;
        }
    }
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = float(int(_104));
    float _244 = 1.0 / _234;
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _250 = rint(_242);
    float _252 = precise::max(_250, 0.0);
    uint _254 = uint(_252);
    uint _256 = clamp(_254, 0u, 65535u);
    float _258 = _244 * _236;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _244 * _238;
    float _264 = _244 * _240;
    float _266 = fma(_260, _246, _262);
    float _268 = fma(_260, _248, _264);
    float _270 = -_248;
    float _272 = fma(_260, _270, _264);
    float3 _1237 = float3(_264, _266, float(int(_256)));
    float3 _1241 = select(_1237, float3(0.0), isnan(_1237));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1241.xy, uint(rint(_1241.z)), _260);
    float3 _1250 = float3(_268, _266, float(int(_256)));
    float3 _1252 = select(_1250, float3(0.0), isnan(_1250));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1252.xy, uint(rint(_1252.z)), _260);
    float3 _1261 = float3(_272, _266, float(int(_256)));
    float3 _1263 = select(_1261, float3(0.0), isnan(_1261));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1263.xy, uint(rint(_1263.z)), _260);
    float3 _1272 = float3(_268, _262, float(int(_256)));
    float3 _1274 = select(_1272, float3(0.0), isnan(_1272));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1274.xy, uint(rint(_1274.z)), _260);
    float3 _1283 = float3(_264, _262, float(int(_256)));
    float3 _1285 = select(_1283, float3(0.0), isnan(_1283));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1285.xy, uint(rint(_1285.z)), _260);
    float3 _1294 = float3(_272, _262, float(int(_256)));
    float3 _1296 = select(_1294, float3(0.0), isnan(_1294));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1296.xy, uint(rint(_1296.z)), _260);
    float _286 = -_70;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _290 = -_120;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _294 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _296 = -_246;
    float _298 = fma(_260, _296, _262);
    float _300 = _288 * _288;
    float _302 = _70 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _304 = _70 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _306 = fma(_292, _292, _300);
    float _308 = -_68;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _312 = _70 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _314 = _70 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _316 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[24].x, _302);
    float _318 = fma(_310, _310, _306);
    float _320 = _70 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _322 = _70 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _324 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[22].x, _312);
    float _326 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[23].x, _314);
    float _328 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[19].x, _320);
    float _330 = sqrt(_318);
    float _332 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[20].x, _322);
    float _334 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _324);
    float _336 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _328);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _326);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _332);
    float _342 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[18].x, _304);
    float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _346 = _70 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _350 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _316);
    float _352 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _342);
    float _354 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _356 = _330 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _358 = _330 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _360 = !_356;
    int _362 = _360 ? 0 : 1;
    int _364 = 2;
    float _366 = _344;
    float _368 = _348;
    if (!_356)
    {
        _364 = 1;
    }
    int _370 = _364;
    int _372 = _370;
    if (!_358)
    {
        _372 = _362;
    }
    int _374 = _372;
    float _376 = float(_374);
    float _378 = precise::min(_376, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _380 = _378 != 1.0;
    bool _382 = isnan(_378);
    bool _384 = _380 || _382;
    bool _386 = isnan(1.0);
    bool _388 = _384 || _386;
    bool _390 = _378 != 0.0;
    bool _392 = isnan(_378);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    float _400 = rint(_378);
    float _402 = precise::max(_400, 0.0);
    uint _404 = uint(_402);
    uint _406 = clamp(_404, 0u, 65535u);
    if (_388)
    {
        float _408 = _334 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _366 = _408;
    }
    float _410 = _366;
    float _412 = _70 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _414 = _410;
    if (_388)
    {
        float _416 = _338 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _368 = _416;
    }
    float _418 = _368;
    float _420 = _70 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _422 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[21].x, _412);
    float _424 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[17].x, _420);
    float _426 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _422);
    float _428 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[16].x, _346);
    float _430 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _424);
    float _432 = _426 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _434 = _432;
    float _436 = _418;
    if (_388)
    {
        float _438 = _350 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _434 = _438;
    }
    float _440 = _434;
    float _442 = _440;
    if (!_398)
    {
        float _444 = _352 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _442 = _444;
    }
    float _446 = _442;
    float _448 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _428);
    if (!_398)
    {
        float _450 = _430 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _450;
    }
    float _452 = _436;
    float _454 = 0.0 + _446;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    if (!_398)
    {
        float _458 = _448 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _414 = _458;
    }
    float _460 = _414;
    float3 _1629 = float3(_268, _298, float(int(_256)));
    float3 _1631 = select(_1629, float3(0.0), isnan(_1629));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1631.xy, uint(rint(_1631.z)), _260);
    float _464 = fma(_456, _354, _452);
    float _466 = _276 + _274;
    float _468 = _466 + _278;
    float3 _1650 = float3(_264, _298, float(int(_256)));
    float3 _1652 = select(_1650, float3(0.0), isnan(_1650));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1652.xy, uint(rint(_1652.z)), _260);
    float3 _1661 = float3(_272, _298, float(int(_256)));
    float3 _1663 = select(_1661, float3(0.0), isnan(_1661));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1663.xy, uint(rint(_1663.z)), _260);
    float3 _1672 = float3(_460, _464, float(int(_406)));
    float3 _1674 = select(_1672, float3(0.0), isnan(_1672));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1674.xy, uint(rint(_1674.z)), _456);
    float _476 = _468 + _280;
    float _478 = -_294;
    float _480 = fma(_456, _478, _460);
    float3 _1692 = float3(_480, _464, float(int(_406)));
    float3 _1694 = select(_1692, float3(0.0), isnan(_1692));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1694.xy, uint(rint(_1694.z)), _456);
    float3 _1703 = float3(_460, _452, float(int(_406)));
    float3 _1705 = select(_1703, float3(0.0), isnan(_1703));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1705.xy, uint(rint(_1705.z)), _456);
    float _486 = _476 + _282;
    float _488 = -_354;
    float _490 = fma(_456, _488, _452);
    float _492 = _486 + _284;
    float _494 = fma(_456, _294, _460);
    float3 _1730 = float3(_494, _452, float(int(_406)));
    float3 _1732 = select(_1730, float3(0.0), isnan(_1730));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1732.xy, uint(rint(_1732.z)), _456);
    float3 _1741 = float3(_494, _464, float(int(_406)));
    float3 _1743 = select(_1741, float3(0.0), isnan(_1741));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1743.xy, uint(rint(_1743.z)), _456);
    float3 _1752 = float3(_480, _452, float(int(_406)));
    float3 _1754 = select(_1752, float3(0.0), isnan(_1752));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1754.xy, uint(rint(_1754.z)), _456);
    float3 _1763 = float3(_494, _490, float(int(_406)));
    float3 _1765 = select(_1763, float3(0.0), isnan(_1763));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1765.xy, uint(rint(_1765.z)), _456);
    float3 _1774 = float3(_460, _490, float(int(_406)));
    float3 _1776 = select(_1774, float3(0.0), isnan(_1774));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1776.xy, uint(rint(_1776.z)), _456);
    float3 _1785 = float3(_480, _490, float(int(_406)));
    float3 _1787 = select(_1785, float3(0.0), isnan(_1785));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1787.xy, uint(rint(_1787.z)), _456);
    float _508 = _70 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _510 = _70 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _512 = _70 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _514 = _70 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _516 = _70 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _518 = _70 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _520 = _70 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _522 = _70 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _524 = -_120;
    float _526 = _524 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _528 = _70 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _530 = -_70;
    float _532 = _530 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _534 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[27].x, _514);
    float _536 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[28].x, _512);
    float _538 = _532 * _532;
    float _540 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[29].x, _528);
    float _542 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[30].x, _508);
    float _544 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[31].x, _518);
    float _546 = fma(_526, _526, _538);
    float _548 = -_68;
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _552 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[32].x, _520);
    float _554 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[33].x, _522);
    float _556 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _536);
    float _558 = fma(_550, _550, _546);
    float _560 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _540);
    float _562 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _542);
    float _564 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _544);
    float _566 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _552);
    float _568 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _554);
    float _570 = sqrt(_558);
    float _572 = _556 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _574 = _562 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _576 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[26].x, _516);
    float _578 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _534);
    float _580 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[25].x, _510);
    float _582 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _576);
    float _584 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _580);
    bool _586 = _570 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _588 = _570 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _590 = !_586;
    int _592 = _590 ? 0 : 1;
    int _594 = 2;
    float _596 = _572;
    float _598 = _574;
    if (!_586)
    {
        _594 = 1;
    }
    int _600 = _594;
    int _602 = _600;
    if (!_588)
    {
        _602 = _592;
    }
    int _604 = _602;
    float _606 = float(_604);
    float _608 = _560 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _610 = precise::min(_606, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _612 = _610 != 1.0;
    bool _614 = isnan(_610);
    bool _616 = _612 || _614;
    bool _618 = isnan(1.0);
    bool _620 = _616 || _618;
    float _622 = _608;
    if (_620)
    {
        float _624 = _564 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _596 = _624;
    }
    float _626 = _596;
    float _628 = _626;
    if (_620)
    {
        float _630 = _566 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _622 = _630;
    }
    float _632 = _622;
    float _634 = _632;
    if (_620)
    {
        float _636 = _568 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _598 = _636;
    }
    float _638 = _598;
    bool _640 = _610 != 0.0;
    bool _642 = isnan(_610);
    bool _644 = _640 || _642;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    float _650 = rint(_610);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    uint _656 = clamp(_654, 0u, 65535u);
    float _658 = _638;
    if (!_648)
    {
        float _660 = _578 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _658 = _660;
    }
    float _662 = _658;
    if (!_648)
    {
        float _664 = _582 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _634 = _664;
    }
    float _666 = _634;
    if (!_648)
    {
        float _668 = _584 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _628 = _668;
    }
    float _670 = _628;
    float _672 = 0.0 + _662;
    float _674 = precise::clamp(_672, 0.0, 1.0);
    float _676 = fma(_354, _674, _666);
    float _678 = -_294;
    float _680 = fma(_678, _674, _670);
    float _682 = fma(_294, _674, _670);
    float3 _2116 = float3(_670, _676, float(int(_656)));
    float3 _2118 = select(_2116, float3(0.0), isnan(_2116));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2118.xy, uint(rint(_2118.z)), _674);
    float3 _2127 = float3(_680, _676, float(int(_656)));
    float3 _2129 = select(_2127, float3(0.0), isnan(_2127));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2129.xy, uint(rint(_2129.z)), _674);
    float3 _2138 = float3(_682, _676, float(int(_656)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2140.xy, uint(rint(_2140.z)), _674);
    float3 _2149 = float3(_682, _666, float(int(_656)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2151.xy, uint(rint(_2151.z)), _674);
    float3 _2160 = float3(_670, _666, float(int(_656)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2162.xy, uint(rint(_2162.z)), _674);
    float _694 = -_354;
    float _696 = fma(_694, _674, _666);
    float3 _2177 = float3(_680, _666, float(int(_656)));
    float3 _2179 = select(_2177, float3(0.0), isnan(_2177));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2179.xy, uint(rint(_2179.z)), _674);
    float3 _2188 = float3(_682, _696, float(int(_656)));
    float3 _2190 = select(_2188, float3(0.0), isnan(_2188));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2190.xy, uint(rint(_2190.z)), _674);
    float3 _2199 = float3(_670, _696, float(int(_656)));
    float3 _2201 = select(_2199, float3(0.0), isnan(_2199));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2201.xy, uint(rint(_2201.z)), _674);
    float3 _2210 = float3(_680, _696, float(int(_656)));
    float3 _2212 = select(_2210, float3(0.0), isnan(_2210));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2212.xy, uint(rint(_2212.z)), _674);
    float2 _2218 = float2(_52, _54);
    float _706 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2218, float2(0.0), isnan(_2218))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2218, float2(0.0), isnan(_2218))).x;
    float _708 = _492 + _462;
    float _710 = -_68;
    float _712 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _714 = _710 + _712;
    float _716 = -_68;
    float _718 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _720 = _716 + _718;
    float _722 = _714 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _708 + _470;
    float _728 = _726 + _472;
    float _730 = _498 + _474;
    float _732 = _730 + _482;
    float _734 = _732 + _496;
    float _736 = _734 + _484;
    float _738 = _736 + _500;
    float _740 = _738 + _502;
    float _742 = _740 + _504;
    float _744 = fma(_728, 0.111111111938953399658203125, _724);
    float _746 = _742 + _506;
    float _748 = _746 * 0.111111111938953399658203125;
    float _750 = _688 + _684;
    float _752 = _750 + _686;
    float _754 = _752 + _690;
    float _756 = _754 + _692;
    float _758 = _756 + _698;
    float _760 = _758 + _700;
    float _762 = _760 + _702;
    float _764 = _762 + _704;
    float _766 = _764 * 0.111111111938953399658203125;
    float _768 = _766 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _770 = fma(_748, (*spvDescriptorSet0.fp_c3)._m0[49].z, _768);
    float _772 = _720 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _774 = precise::clamp(_772, 0.0, 1.0);
    float _776 = _770 + _774;
    out.m_45.x = _706;
    out.m_45.y = _744;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _776;
    return out;
}

