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
    bool _118 = false;
    bool _116 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _779 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_779, float2(0.0), isnan(_779))).x;
    float _58 = in.m_42.y;
    float _60 = -_56;
    float _62 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _64 = 1.0 / _62;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = _64 * _66;
    float _70 = in.m_42.x;
    float _72 = _68 * _58;
    float _74 = -_68;
    bool _78 = _74 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _84 = !_78;
    uint _87 = uint(_84 ? 0 : 1);
    uint _89 = 2u;
    if (!_78)
    {
        _89 = 1u;
    }
    uint _91 = _89;
    uint _93 = _91;
    if (!_82)
    {
        _93 = _87;
    }
    uint _95 = _93;
    uint _97 = min(_95, 2u);
    int _100 = int(_97) << 2;
    uint _102 = uint(int(uint(_100) >> uint(2)));
    uint _104 = uint(int(uint(int(_102)) >> uint(2)));
    int _106 = int(_102) & 3;
    float _108 = (*spvDescriptorSet0.fp_c1)._m0[int(_104)][_106];
    float _110 = _68 * _70;
    bool _112 = as_type<int>(_108) == 368;
    if (!_112)
    {
        bool _114 = as_type<int>(_108) == 640;
        _116 = _114;
        if (!_116)
        {
            _118 = true;
        }
    }
    float _152;
    float _154;
    float _156;
    float _158;
    if (!_116)
    {
        if (!_118)
        {
            float _120 = _72 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _122 = _72 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _124 = _72 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _126 = _72 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _128 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[0].x, _120);
            float _130 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[1].x, _122);
            float _132 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
            float _134 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[3].x, _126);
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
            float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _134);
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _152 = _150;
            _154 = _148;
            _156 = _146;
            _158 = _144;
        }
    }
    if ((false || _118) || _116)
    {
        if ((!_118) || _116)
        {
            _116 = false;
            float _160 = _72 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _162 = _72 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _164 = _72 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _166 = _72 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _168 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[4].x, _160);
            float _170 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[5].x, _162);
            float _172 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[6].x, _164);
            float _174 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[7].x, _166);
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _172);
            float _182 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _174);
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _152 = _190;
            _154 = _188;
            _156 = _186;
            _158 = _184;
        }
        if (false || _118)
        {
            _118 = false;
            float _192 = _72 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _194 = _72 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _196 = _72 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _198 = _72 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _200 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[8].x, _192);
            float _202 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[9].x, _194);
            float _204 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[10].x, _196);
            float _206 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[11].x, _198);
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _204);
            float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _206);
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _152 = _222;
            _154 = _220;
            _156 = _218;
            _158 = _216;
        }
    }
    float _224 = _152;
    float _226 = _154;
    float _228 = _156;
    float _230 = _158;
    float _232 = float(int(_95));
    float _234 = 1.0 / _224;
    float _236 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _238 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _240 = rint(_232);
    float _242 = precise::max(_240, 0.0);
    uint _244 = uint(_242);
    uint _246 = clamp(_244, 0u, 65535u);
    float _248 = _234 * _226;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _234 * _228;
    float _254 = _234 * _230;
    float _256 = fma(_250, _236, _252);
    float _258 = fma(_250, _238, _254);
    float _260 = -_238;
    float _262 = fma(_250, _260, _254);
    float3 _1211 = float3(_254, _256, float(int(_246)));
    float3 _1215 = select(_1211, float3(0.0), isnan(_1211));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1215.xy, uint(rint(_1215.z)), _250);
    float3 _1224 = float3(_258, _256, float(int(_246)));
    float3 _1226 = select(_1224, float3(0.0), isnan(_1224));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1226.xy, uint(rint(_1226.z)), _250);
    float3 _1235 = float3(_262, _256, float(int(_246)));
    float3 _1237 = select(_1235, float3(0.0), isnan(_1235));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1237.xy, uint(rint(_1237.z)), _250);
    float3 _1246 = float3(_258, _252, float(int(_246)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), _250);
    float3 _1257 = float3(_254, _252, float(int(_246)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1259.xy, uint(rint(_1259.z)), _250);
    float3 _1268 = float3(_262, _252, float(int(_246)));
    float3 _1270 = select(_1268, float3(0.0), isnan(_1268));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1270.xy, uint(rint(_1270.z)), _250);
    float _276 = -_72;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _280 = -_110;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _286 = -_236;
    float _288 = fma(_250, _286, _252);
    float _290 = _278 * _278;
    float _292 = _72 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _294 = _72 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _296 = fma(_282, _282, _290);
    float _298 = -_68;
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _302 = _72 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _304 = _72 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _306 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[24].x, _292);
    float _308 = fma(_300, _300, _296);
    float _310 = _72 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _312 = _72 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _314 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[22].x, _302);
    float _316 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[23].x, _304);
    float _318 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[19].x, _310);
    float _320 = sqrt(_308);
    float _322 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[20].x, _312);
    float _324 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _314);
    float _326 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _318);
    float _328 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _316);
    float _330 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _322);
    float _332 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[18].x, _294);
    float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _336 = _72 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _338 = _330 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _306);
    float _342 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _332);
    float _344 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _346 = _320 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _348 = _320 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _350 = !_346;
    int _352 = _350 ? 0 : 1;
    int _354 = 2;
    float _356 = _334;
    float _358 = _338;
    if (!_346)
    {
        _354 = 1;
    }
    int _360 = _354;
    int _362 = _360;
    if (!_348)
    {
        _362 = _352;
    }
    int _364 = _362;
    float _366 = float(_364);
    float _368 = precise::min(_366, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _370 = _368 != 1.0;
    bool _372 = isnan(_368);
    bool _374 = _370 || _372;
    bool _376 = isnan(1.0);
    bool _378 = _374 || _376;
    bool _380 = _368 != 0.0;
    bool _382 = isnan(_368);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    float _390 = rint(_368);
    float _392 = precise::max(_390, 0.0);
    uint _394 = uint(_392);
    uint _396 = clamp(_394, 0u, 65535u);
    if (_378)
    {
        float _398 = _324 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _356 = _398;
    }
    float _400 = _356;
    float _402 = _72 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _404 = _400;
    if (_378)
    {
        float _406 = _328 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _358 = _406;
    }
    float _408 = _358;
    float _410 = _72 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _412 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[21].x, _402);
    float _414 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[17].x, _410);
    float _416 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _412);
    float _418 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[16].x, _336);
    float _420 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _414);
    float _422 = _416 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _424 = _422;
    float _426 = _408;
    if (_378)
    {
        float _428 = _340 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _424 = _428;
    }
    float _430 = _424;
    float _432 = _430;
    if (!_388)
    {
        float _434 = _342 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _432 = _434;
    }
    float _436 = _432;
    float _438 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _418);
    if (!_388)
    {
        float _440 = _420 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _426 = _440;
    }
    float _442 = _426;
    float _444 = 0.0 + _436;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    if (!_388)
    {
        float _448 = _438 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _404 = _448;
    }
    float _450 = _404;
    float3 _1603 = float3(_258, _288, float(int(_246)));
    float3 _1605 = select(_1603, float3(0.0), isnan(_1603));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1605.xy, uint(rint(_1605.z)), _250);
    float _454 = fma(_446, _344, _442);
    float _456 = _266 + _264;
    float _458 = _456 + _268;
    float3 _1624 = float3(_254, _288, float(int(_246)));
    float3 _1626 = select(_1624, float3(0.0), isnan(_1624));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1626.xy, uint(rint(_1626.z)), _250);
    float3 _1635 = float3(_262, _288, float(int(_246)));
    float3 _1637 = select(_1635, float3(0.0), isnan(_1635));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1637.xy, uint(rint(_1637.z)), _250);
    float3 _1646 = float3(_450, _454, float(int(_396)));
    float3 _1648 = select(_1646, float3(0.0), isnan(_1646));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1648.xy, uint(rint(_1648.z)), _446);
    float _466 = _458 + _270;
    float _468 = -_284;
    float _470 = fma(_446, _468, _450);
    float3 _1666 = float3(_470, _454, float(int(_396)));
    float3 _1668 = select(_1666, float3(0.0), isnan(_1666));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1668.xy, uint(rint(_1668.z)), _446);
    float3 _1677 = float3(_450, _442, float(int(_396)));
    float3 _1679 = select(_1677, float3(0.0), isnan(_1677));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1679.xy, uint(rint(_1679.z)), _446);
    float _476 = _466 + _272;
    float _478 = -_344;
    float _480 = fma(_446, _478, _442);
    float _482 = _476 + _274;
    float _484 = fma(_446, _284, _450);
    float3 _1704 = float3(_484, _442, float(int(_396)));
    float3 _1706 = select(_1704, float3(0.0), isnan(_1704));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1706.xy, uint(rint(_1706.z)), _446);
    float3 _1715 = float3(_484, _454, float(int(_396)));
    float3 _1717 = select(_1715, float3(0.0), isnan(_1715));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1717.xy, uint(rint(_1717.z)), _446);
    float3 _1726 = float3(_470, _442, float(int(_396)));
    float3 _1728 = select(_1726, float3(0.0), isnan(_1726));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1728.xy, uint(rint(_1728.z)), _446);
    float3 _1737 = float3(_484, _480, float(int(_396)));
    float3 _1739 = select(_1737, float3(0.0), isnan(_1737));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1739.xy, uint(rint(_1739.z)), _446);
    float3 _1748 = float3(_450, _480, float(int(_396)));
    float3 _1750 = select(_1748, float3(0.0), isnan(_1748));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1750.xy, uint(rint(_1750.z)), _446);
    float3 _1759 = float3(_470, _480, float(int(_396)));
    float3 _1761 = select(_1759, float3(0.0), isnan(_1759));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1761.xy, uint(rint(_1761.z)), _446);
    float _498 = _72 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _500 = _72 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _502 = _72 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _504 = _72 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _506 = _72 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _508 = _72 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _510 = _72 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _512 = _72 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _514 = -_110;
    float _516 = _514 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _518 = _72 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _520 = -_72;
    float _522 = _520 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _524 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[27].x, _504);
    float _526 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[28].x, _502);
    float _528 = _522 * _522;
    float _530 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[29].x, _518);
    float _532 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[30].x, _498);
    float _534 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[31].x, _508);
    float _536 = fma(_516, _516, _528);
    float _538 = -_68;
    float _540 = _538 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _542 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[32].x, _510);
    float _544 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[33].x, _512);
    float _546 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _526);
    float _548 = fma(_540, _540, _536);
    float _550 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _530);
    float _552 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _532);
    float _554 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _534);
    float _556 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _542);
    float _558 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _544);
    float _560 = sqrt(_548);
    float _562 = _546 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _564 = _552 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _566 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[26].x, _506);
    float _568 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _524);
    float _570 = fma(_110, (*spvDescriptorSet0.fp_c3)._m0[25].x, _500);
    float _572 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _566);
    float _574 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _570);
    bool _576 = _560 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _578 = _560 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _580 = !_576;
    int _582 = _580 ? 0 : 1;
    int _584 = 2;
    float _586 = _562;
    float _588 = _564;
    if (!_576)
    {
        _584 = 1;
    }
    int _590 = _584;
    int _592 = _590;
    if (!_578)
    {
        _592 = _582;
    }
    int _594 = _592;
    float _596 = float(_594);
    float _598 = _550 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _600 = precise::min(_596, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _602 = _600 != 1.0;
    bool _604 = isnan(_600);
    bool _606 = _602 || _604;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    float _612 = _598;
    if (_610)
    {
        float _614 = _554 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _586 = _614;
    }
    float _616 = _586;
    float _618 = _616;
    if (_610)
    {
        float _620 = _556 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _612 = _620;
    }
    float _622 = _612;
    float _624 = _622;
    if (_610)
    {
        float _626 = _558 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _588 = _626;
    }
    float _628 = _588;
    bool _630 = _600 != 0.0;
    bool _632 = isnan(_600);
    bool _634 = _630 || _632;
    bool _636 = isnan(0.0);
    bool _638 = _634 || _636;
    float _640 = rint(_600);
    float _642 = precise::max(_640, 0.0);
    uint _644 = uint(_642);
    uint _646 = clamp(_644, 0u, 65535u);
    float _648 = _628;
    if (!_638)
    {
        float _650 = _568 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _648 = _650;
    }
    float _652 = _648;
    if (!_638)
    {
        float _654 = _572 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _624 = _654;
    }
    float _656 = _624;
    if (!_638)
    {
        float _658 = _574 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _618 = _658;
    }
    float _660 = _618;
    float _662 = 0.0 + _652;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    float _666 = fma(_344, _664, _656);
    float _668 = -_284;
    float _670 = fma(_668, _664, _660);
    float _672 = fma(_284, _664, _660);
    float3 _2090 = float3(_660, _666, float(int(_646)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2092.xy, uint(rint(_2092.z)), _664);
    float3 _2101 = float3(_670, _666, float(int(_646)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2103.xy, uint(rint(_2103.z)), _664);
    float3 _2112 = float3(_672, _666, float(int(_646)));
    float3 _2114 = select(_2112, float3(0.0), isnan(_2112));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2114.xy, uint(rint(_2114.z)), _664);
    float3 _2123 = float3(_672, _656, float(int(_646)));
    float3 _2125 = select(_2123, float3(0.0), isnan(_2123));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2125.xy, uint(rint(_2125.z)), _664);
    float3 _2134 = float3(_660, _656, float(int(_646)));
    float3 _2136 = select(_2134, float3(0.0), isnan(_2134));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2136.xy, uint(rint(_2136.z)), _664);
    float _684 = -_344;
    float _686 = fma(_684, _664, _656);
    float3 _2151 = float3(_670, _656, float(int(_646)));
    float3 _2153 = select(_2151, float3(0.0), isnan(_2151));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2153.xy, uint(rint(_2153.z)), _664);
    float3 _2162 = float3(_672, _686, float(int(_646)));
    float3 _2164 = select(_2162, float3(0.0), isnan(_2162));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2164.xy, uint(rint(_2164.z)), _664);
    float3 _2173 = float3(_660, _686, float(int(_646)));
    float3 _2175 = select(_2173, float3(0.0), isnan(_2173));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2175.xy, uint(rint(_2175.z)), _664);
    float3 _2184 = float3(_670, _686, float(int(_646)));
    float3 _2186 = select(_2184, float3(0.0), isnan(_2184));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2186.xy, uint(rint(_2186.z)), _664);
    float2 _2192 = float2(_52, _54);
    float _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2192, float2(0.0), isnan(_2192))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2192, float2(0.0), isnan(_2192))).x;
    float _698 = _482 + _452;
    float _700 = -_68;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _704 = _700 + _702;
    float _706 = -_68;
    float _708 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _710 = _706 + _708;
    float _712 = _704 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = _698 + _460;
    float _718 = _716 + _462;
    float _720 = _488 + _464;
    float _722 = _720 + _472;
    float _724 = _722 + _486;
    float _726 = _724 + _474;
    float _728 = _726 + _490;
    float _730 = _728 + _492;
    float _732 = _730 + _494;
    float _734 = fma(_718, 0.111111111938953399658203125, _714);
    float _736 = _732 + _496;
    float _738 = _736 * 0.111111111938953399658203125;
    float _740 = _678 + _674;
    float _742 = _740 + _676;
    float _744 = _742 + _680;
    float _746 = _744 + _682;
    float _748 = _746 + _688;
    float _750 = _748 + _690;
    float _752 = _750 + _692;
    float _754 = _752 + _694;
    float _756 = _754 * 0.111111111938953399658203125;
    float _758 = _756 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _760 = fma(_738, (*spvDescriptorSet0.fp_c3)._m0[49].z, _758);
    float _762 = _710 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    float _766 = _760 + _764;
    out.m_45.x = _696;
    out.m_45.y = _734;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _766;
    return out;
}

