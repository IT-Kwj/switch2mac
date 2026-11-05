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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
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
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _800 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_800, float2(0.0), isnan(_800)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _817 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_817, float2(0.0), isnan(_817))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_817, float2(0.0), isnan(_817))).x;
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
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_98;
    float _110 = fma(_90, _72, _108);
    float _112 = -_98;
    float _114 = fma(_96, _74, _112);
    float _116 = -_100;
    float _118 = fma(_90, _76, _116);
    float _120 = -_100;
    float _122 = fma(_96, _78, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_84;
    float _130 = _128 + _90;
    float _132 = -_84;
    float _134 = _132 + _96;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = _106 * _70;
    float _142 = fma(_130, _130, _136);
    float _144 = fma(_134, _134, _138);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _118 * _146;
    float _152 = _130 * _146;
    float _154 = _110 * _146;
    float _156 = _134 * _148;
    float _158 = _114 * _148;
    float _160 = _122 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = _154 * _160;
    float _172 = -_164;
    float _174 = fma(_154, _156, _172);
    float _176 = _106 * _68;
    float _178 = _168 * _168;
    float _180 = -_170;
    float _182 = fma(_150, _158, _180);
    float _184 = fma(_174, _174, _178);
    float _186 = fma(_182, _182, _184);
    float _188 = rsqrt(_186);
    float _190 = _168 * _188;
    float _192 = _174 * _188;
    float _194 = _182 * _188;
    float _196 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _200 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _198);
    float _202 = abs(_200);
    float _204 = -_202;
    float _206 = _204 + 1.0;
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = abs(_208);
    float _212 = log2(_210);
    float _214 = _212 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _216 = exp2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _220 = -_106;
    float _222 = _220 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _224 = fma(_190, _218, _176);
    float _226 = fma(_192, _218, _140);
    float _228 = fma(_194, _218, _106);
    float _230 = -_176;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _234 = _224 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _236 = _232 * _232;
    float _238 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].x, _234);
    float _240 = -_140;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _244 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _238);
    float _246 = fma(_242, _242, _236);
    float _248 = -_176;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _252 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _254 = fma(_222, _222, _246);
    float _256 = _224 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _258 = _250 * _250;
    float _260 = 1.0 / _252;
    float _262 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].x, _256);
    float _264 = _224 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _266 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _268 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _262);
    float _270 = sqrt(_254);
    float _272 = _268 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _274 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].x, _264);
    float _276 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].x, _266);
    float _278 = -_140;
    float _280 = _278 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _282 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _274);
    float _284 = _272 * _260;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _276);
    float _290 = fma(_280, _280, _258);
    float _292 = _282 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _294 = rint(_286);
    float _296 = precise::max(_294, 0.0);
    uint _299 = uint(_296);
    uint _301 = clamp(_299, 0u, 65535u);
    float _303 = _288 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _305 = _292 * _260;
    bool _309 = _270 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _311 = _303 * _260;
    bool _313 = _270 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _315 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _305);
    float _317 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _319 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _317, _305);
    float _321 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _311);
    bool _323 = !_309;
    int _326 = _323 ? 0 : 1;
    float _328 = -_106;
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float3 _1264 = float3(_315, _321, float(int(_301)));
    float3 _1268 = select(_1264, float3(0.0), isnan(_1264));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1268.xy, uint(rint(_1268.z)), 1.0);
    float3 _1276 = float3(_305, _321, float(int(_301)));
    float3 _1278 = select(_1276, float3(0.0), isnan(_1276));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1278.xy, uint(rint(_1278.z)), 1.0);
    int _336 = 2;
    if (!_309)
    {
        _336 = 1;
    }
    int _338 = _336;
    float3 _1291 = float3(_319, _321, float(int(_301)));
    float3 _1293 = select(_1291, float3(0.0), isnan(_1291));
    float _340 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1293.xy, uint(rint(_1293.z)), 1.0);
    int _342 = _338;
    if (!_313)
    {
        _342 = _326;
    }
    int _344 = _342;
    float _346 = _176 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _348 = fma(_330, _330, _290);
    float _350 = _176 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _352 = _176 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _354 = _176 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _356 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[20].x, _346);
    float _358 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].x, _350);
    float _360 = _176 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _362 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[22].x, _352);
    float _364 = _176 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _366 = _176 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _368 = _176 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _370 = _176 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _372 = float(_344);
    float _374 = sqrt(_348);
    float _376 = _176 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _378 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[21].x, _354);
    float _380 = precise::min(_372, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _382 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _356);
    float _384 = _176 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _386 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _358);
    bool _388 = _380 != 1.0;
    bool _390 = isnan(_380);
    bool _392 = _388 || _390;
    bool _394 = isnan(1.0);
    bool _396 = _392 || _394;
    float _398 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[24].x, _360);
    bool _400 = _380 != 0.0;
    bool _402 = isnan(_380);
    bool _404 = _400 || _402;
    bool _406 = isnan(0.0);
    bool _408 = _404 || _406;
    float _410 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _362);
    float _412 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[18].x, _364);
    float _414 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[30].x, _376);
    float _416 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[31].x, _366);
    float _418 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _378);
    float _420 = _382 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _422 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[32].x, _384);
    float _424 = _386 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _426 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[28].x, _368);
    float _428 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _398);
    float _430 = _424;
    float _432 = _420;
    if (_396)
    {
        float _434 = _410 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _430 = _434;
    }
    float _436 = _430;
    float _438 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _412);
    float _440 = _418 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _442 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _414);
    float _444 = _440;
    float _446 = _436;
    if (_396)
    {
        float _448 = _428 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _444 = _448;
    }
    float _450 = _444;
    float _452 = _450;
    if (!_408)
    {
        float _454 = _438 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _452 = _454;
    }
    float _456 = _452;
    float _458 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _416);
    float3 _1532 = float3(_305, _311, float(int(_301)));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1534.xy, uint(rint(_1534.z)), 1.0);
    float3 _1542 = float3(_315, _311, float(int(_301)));
    float3 _1544 = select(_1542, float3(0.0), isnan(_1542));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1544.xy, uint(rint(_1544.z)), 1.0);
    float _464 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _426);
    bool _466 = _374 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _468 = _442 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _470 = _374 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _472 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[25].x, _370);
    float _474 = _176 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _476 = _176 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _478 = _176 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _480 = _176 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _482 = _176 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _484 = _176 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _486 = _176 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float3 _1609 = float3(_319, _311, float(int(_301)));
    float3 _1611 = select(_1609, float3(0.0), isnan(_1609));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1611.xy, uint(rint(_1611.z)), 1.0);
    float _490 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[23].x, _474);
    float _492 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[16].x, _476);
    float _494 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[17].x, _478);
    float _496 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[26].x, _480);
    float _498 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[27].x, _482);
    float _500 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[29].x, _484);
    bool _502 = !_466;
    int _504 = _502 ? 0 : 1;
    float _506 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[33].x, _486);
    float _508 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _490);
    int _510 = 2;
    float _512 = _468;
    if (!_466)
    {
        _510 = 1;
    }
    int _514 = _510;
    float _516 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _500);
    int _518 = _514;
    if (!_470)
    {
        _518 = _504;
    }
    int _520 = _518;
    if (_396)
    {
        float _522 = _508 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _432 = _522;
    }
    float _524 = _432;
    float _526 = _516 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _528 = float(_520);
    float _530 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _532 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _530, _311);
    float _534 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _422);
    float _536 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float3 _1713 = float3(_315, _532, float(int(_301)));
    float3 _1715 = select(_1713, float3(0.0), isnan(_1713));
    float _538 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1715.xy, uint(rint(_1715.z)), 1.0);
    float _540 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _506);
    bool _542 = _536 != 1.0;
    bool _544 = isnan(_536);
    bool _546 = _542 || _544;
    bool _548 = isnan(1.0);
    bool _550 = _546 || _548;
    float _552 = _464 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float3 _1743 = float3(_305, _532, float(int(_301)));
    float3 _1745 = select(_1743, float3(0.0), isnan(_1743));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1745.xy, uint(rint(_1745.z)), 1.0);
    float3 _1753 = float3(_319, _532, float(int(_301)));
    float3 _1755 = select(_1753, float3(0.0), isnan(_1753));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1755.xy, uint(rint(_1755.z)), 1.0);
    float _558 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _492);
    float _560 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _494);
    float _562 = 0.0 + _456;
    float _564 = precise::clamp(_562, 0.0, 1.0);
    float _566 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _472);
    float _568 = _526;
    float _570 = _552;
    float _572 = _524;
    if (_550)
    {
        float _574 = _534 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _568 = _574;
    }
    float _576 = _568;
    float _578 = _576;
    if (_550)
    {
        float _580 = _540 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _512 = _580;
    }
    float _582 = _512;
    float _584 = _582;
    if (_550)
    {
        float _586 = _458 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _570 = _586;
    }
    float _588 = _570;
    bool _590 = _536 != 0.0;
    bool _592 = isnan(_536);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _602 = _588;
    if (!_408)
    {
        float _604 = _558 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _446 = _604;
    }
    float _606 = _446;
    if (!_408)
    {
        float _608 = _560 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _572 = _608;
    }
    float _610 = _572;
    float _612 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _614 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _498);
    float _616 = rint(_536);
    float _618 = precise::max(_616, 0.0);
    uint _620 = uint(_618);
    uint _622 = clamp(_620, 0u, 65535u);
    float _624 = fma(_564, _612, _610);
    float _626 = rint(_380);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    uint _632 = clamp(_630, 0u, 65535u);
    if (!_598)
    {
        float _634 = _566 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _602 = _634;
    }
    float _636 = _602;
    if (!_598)
    {
        float _638 = _614 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _584 = _638;
    }
    float _640 = _584;
    float _642 = fma(_564, _600, _606);
    float _644 = _332 + _334;
    float _646 = _644 + _340;
    float _648 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _496);
    float3 _1916 = float3(_606, _624, float(int(_632)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1918.xy, uint(rint(_1918.z)), _564);
    float _652 = _646 + _462;
    float _654 = _652 + _460;
    float _656 = _654 + _488;
    float _658 = -_600;
    float _660 = fma(_564, _658, _606);
    float3 _1942 = float3(_660, _624, float(int(_632)));
    float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1944.xy, uint(rint(_1944.z)), _564);
    float3 _1953 = float3(_642, _624, float(int(_632)));
    float3 _1955 = select(_1953, float3(0.0), isnan(_1953));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1955.xy, uint(rint(_1955.z)), _564);
    float3 _1964 = float3(_642, _610, float(int(_632)));
    float3 _1966 = select(_1964, float3(0.0), isnan(_1964));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1966.xy, uint(rint(_1966.z)), _564);
    float3 _1975 = float3(_606, _610, float(int(_632)));
    float3 _1977 = select(_1975, float3(0.0), isnan(_1975));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1977.xy, uint(rint(_1977.z)), _564);
    float3 _1986 = float3(_660, _610, float(int(_632)));
    float3 _1988 = select(_1986, float3(0.0), isnan(_1986));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1988.xy, uint(rint(_1988.z)), _564);
    if (!_598)
    {
        float _672 = _648 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _578 = _672;
    }
    float _674 = _578;
    float _676 = -_612;
    float _678 = fma(_564, _676, _610);
    float _680 = 0.0 + _640;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    float _684 = _656 + _538;
    float _686 = fma(_600, _682, _636);
    float _688 = -_600;
    float _690 = fma(_688, _682, _636);
    float _692 = fma(_612, _682, _674);
    float3 _2034 = float3(_642, _678, float(int(_632)));
    float3 _2036 = select(_2034, float3(0.0), isnan(_2034));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2036.xy, uint(rint(_2036.z)), _564);
    float3 _2045 = float3(_606, _678, float(int(_632)));
    float3 _2047 = select(_2045, float3(0.0), isnan(_2045));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2047.xy, uint(rint(_2047.z)), _564);
    float3 _2056 = float3(_660, _678, float(int(_632)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2058.xy, uint(rint(_2058.z)), _564);
    float3 _2067 = float3(_636, _692, float(int(_622)));
    float3 _2069 = select(_2067, float3(0.0), isnan(_2067));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2069.xy, uint(rint(_2069.z)), _682);
    float3 _2078 = float3(_686, _692, float(int(_622)));
    float3 _2080 = select(_2078, float3(0.0), isnan(_2078));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2080.xy, uint(rint(_2080.z)), _682);
    float3 _2089 = float3(_690, _692, float(int(_622)));
    float3 _2091 = select(_2089, float3(0.0), isnan(_2089));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2091.xy, uint(rint(_2091.z)), _682);
    float _706 = -_612;
    float _708 = fma(_706, _682, _674);
    float3 _2106 = float3(_686, _674, float(int(_622)));
    float3 _2108 = select(_2106, float3(0.0), isnan(_2106));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2108.xy, uint(rint(_2108.z)), _682);
    float3 _2117 = float3(_636, _674, float(int(_622)));
    float3 _2119 = select(_2117, float3(0.0), isnan(_2117));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2119.xy, uint(rint(_2119.z)), _682);
    float3 _2128 = float3(_690, _674, float(int(_622)));
    float3 _2130 = select(_2128, float3(0.0), isnan(_2128));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2130.xy, uint(rint(_2130.z)), _682);
    float3 _2139 = float3(_686, _708, float(int(_622)));
    float3 _2141 = select(_2139, float3(0.0), isnan(_2139));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2141.xy, uint(rint(_2141.z)), _682);
    float3 _2150 = float3(_636, _708, float(int(_622)));
    float3 _2152 = select(_2150, float3(0.0), isnan(_2150));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2152.xy, uint(rint(_2152.z)), _682);
    float3 _2161 = float3(_690, _708, float(int(_622)));
    float3 _2163 = select(_2161, float3(0.0), isnan(_2161));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2163.xy, uint(rint(_2163.z)), _682);
    float _722 = _684 + _554;
    float _724 = _722 + _556;
    float _726 = -_106;
    float _728 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _730 = _726 + _728;
    float _732 = _730 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _734 = precise::clamp(_732, 0.0, 1.0);
    float _736 = fma(_724, 0.111111111938953399658203125, _734);
    float _738 = -_106;
    float _740 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _742 = _738 + _740;
    float _744 = _742 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _664 + _650;
    float _750 = _748 + _662;
    float _752 = _750 + _666;
    float _754 = _752 + _668;
    float _756 = _754 + _670;
    float _758 = _756 + _694;
    float _760 = _758 + _696;
    float _762 = _702 + _700;
    float _764 = _760 + _698;
    float _766 = _762 + _704;
    float _768 = _764 * 0.111111111938953399658203125;
    float _770 = _766 + _710;
    float _772 = _770 + _712;
    float _774 = _772 + _714;
    float _776 = _774 + _716;
    float _778 = _776 + _718;
    float _780 = _778 + _720;
    float _782 = _780 * 0.111111111938953399658203125;
    float _784 = _782 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _786 = fma(_768, (*spvDescriptorSet0.fp_c3)._m0[49].z, _784);
    float _788 = _746 + _786;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _736;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _788;
    return out;
}

