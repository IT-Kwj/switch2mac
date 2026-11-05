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
    float2 _924 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_924, float2(0.0), isnan(_924)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _941 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_941, float2(0.0), isnan(_941))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_941, float2(0.0), isnan(_941))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_62;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _90;
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _86;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _70 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = 1.0 / _98;
    float _116 = -_106;
    float _118 = fma(_112, _72, _116);
    float _120 = -_108;
    float _122 = fma(_112, _76, _120);
    float _124 = -_104;
    float _126 = _124 + _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _100 * _128;
    float _132 = _118 * _118;
    float _134 = -_106;
    float _136 = fma(_130, _74, _134);
    float _138 = -_108;
    float _140 = fma(_130, _78, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_104;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = _114 * _150;
    float _154 = fma(_126, _126, _142);
    float _156 = fma(_140, _140, _148);
    float _158 = _152 * _68;
    float _160 = fma(_146, _146, _156);
    float _162 = rsqrt(_154);
    float _164 = rsqrt(_160);
    float _166 = _122 * _162;
    float _168 = _126 * _162;
    float _170 = _118 * _162;
    float _172 = _146 * _164;
    float _174 = _136 * _164;
    float _176 = _140 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -_180;
    float _188 = fma(_170, _172, _186);
    float _190 = _170 * _176;
    float _192 = _184 * _184;
    float _194 = -_190;
    float _196 = fma(_166, _174, _194);
    float _198 = fma(_188, _188, _192);
    float _200 = fma(_196, _196, _198);
    float _202 = rsqrt(_200);
    float _204 = _184 * _202;
    float _206 = _188 * _202;
    float _208 = _196 * _202;
    float _210 = _152 * _70;
    float _212 = _204 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _214 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[35].x, _212);
    float _216 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].z, _214);
    float _218 = abs(_216);
    float _220 = -_218;
    float _222 = _220 + 1.0;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = abs(_224);
    float _228 = log2(_226);
    float _230 = _228 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _232 = exp2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _236 = fma(_204, _234, _158);
    float _238 = fma(_206, _234, _210);
    float _240 = fma(_208, _234, _152);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _244 = _236 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[3].x, _242);
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].z, _246);
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _254 = _236 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _256 = 1.0 / _250;
    float _258 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _260 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _262 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _254);
    float _264 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _266 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _260);
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].z, _262);
    float _270 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].z, _266);
    float _272 = _268 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _274 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _276 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _278 = _264 * _256;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _270 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _284 = _272 * _256;
    float _286 = _282 * _256;
    float _288 = rint(_280);
    float _290 = precise::max(_288, 0.0);
    uint _293 = uint(_290);
    uint _295 = clamp(_293, 0u, 65535u);
    float _297 = fma(_274, 0.5, _284);
    float _299 = fma(_274, 1.5, _284);
    float _301 = fma(_274, -0.5, _284);
    float _303 = fma(_274, -1.5, _284);
    float _305 = fma(_276, 1.5, _286);
    float _307 = fma(_276, 0.5, _286);
    float3 _1344 = float3(_299, _305, float(int(_295)));
    float3 _1348 = select(_1344, float3(0.0), isnan(_1344));
    float _309 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1348.xy, uint(rint(_1348.z)), 1.0);
    float3 _1356 = float3(_297, _305, float(int(_295)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _311 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1358.xy, uint(rint(_1358.z)), 1.0);
    float3 _1366 = float3(_301, _305, float(int(_295)));
    float3 _1368 = select(_1366, float3(0.0), isnan(_1366));
    float _313 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1368.xy, uint(rint(_1368.z)), 1.0);
    float3 _1376 = float3(_303, _305, float(int(_295)));
    float3 _1378 = select(_1376, float3(0.0), isnan(_1376));
    float _315 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1378.xy, uint(rint(_1378.z)), 1.0);
    float3 _1386 = float3(_297, _307, float(int(_295)));
    float3 _1388 = select(_1386, float3(0.0), isnan(_1386));
    float _317 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1388.xy, uint(rint(_1388.z)), 1.0);
    float3 _1396 = float3(_301, _307, float(int(_295)));
    float3 _1398 = select(_1396, float3(0.0), isnan(_1396));
    float _319 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1398.xy, uint(rint(_1398.z)), 1.0);
    float3 _1406 = float3(_299, _307, float(int(_295)));
    float3 _1408 = select(_1406, float3(0.0), isnan(_1406));
    float _321 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1408.xy, uint(rint(_1408.z)), 1.0);
    float _323 = fma(_276, -0.5, _286);
    float3 _1419 = float3(_303, _307, float(int(_295)));
    float3 _1421 = select(_1419, float3(0.0), isnan(_1419));
    float _325 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1421.xy, uint(rint(_1421.z)), 1.0);
    float3 _1429 = float3(_299, _323, float(int(_295)));
    float3 _1431 = select(_1429, float3(0.0), isnan(_1429));
    float _327 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1431.xy, uint(rint(_1431.z)), 1.0);
    float3 _1439 = float3(_297, _323, float(int(_295)));
    float3 _1441 = select(_1439, float3(0.0), isnan(_1439));
    float _329 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1441.xy, uint(rint(_1441.z)), 1.0);
    float3 _1449 = float3(_301, _323, float(int(_295)));
    float3 _1451 = select(_1449, float3(0.0), isnan(_1449));
    float _331 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1451.xy, uint(rint(_1451.z)), 1.0);
    float3 _1459 = float3(_303, _323, float(int(_295)));
    float3 _1461 = select(_1459, float3(0.0), isnan(_1459));
    float _333 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1461.xy, uint(rint(_1461.z)), 1.0);
    float _335 = -_158;
    float _337 = _335 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _339 = -_210;
    float _341 = _339 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _343 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _345 = _309 + _311;
    float _347 = fma(_276, -1.5, _286);
    float _349 = _337 * _337;
    float _351 = _345 + _313;
    float _353 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _355 = fma(_341, _341, _349);
    float _357 = _351 + _315;
    float _359 = -_152;
    float _361 = _359 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _363 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[19].x, _353);
    float _365 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _367 = _357 + _321;
    float _369 = fma(_361, _361, _355);
    float _371 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _373 = _367 + _317;
    float _375 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _363);
    float _377 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[20].x, _365);
    float _379 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[21].x, _371);
    float _381 = _373 + _319;
    float _383 = sqrt(_369);
    float _385 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _387 = _375 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _389 = _381 + _325;
    float _391 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _377);
    float _393 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _395 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[22].x, _385);
    float _397 = _389 + _327;
    float _399 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _401 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _403 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _395);
    float _405 = _397 + _329;
    float _407 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[24].x, _399);
    float _409 = _405 + _331;
    bool _413 = _383 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _415 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _407);
    bool _417 = _383 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _419 = _409 + _333;
    float _421 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _423 = !_413;
    int _426 = _423 ? 0 : 1;
    float3 _1645 = float3(_299, _347, float(int(_295)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1647.xy, uint(rint(_1647.z)), 1.0);
    float3 _1655 = float3(_297, _347, float(int(_295)));
    float3 _1657 = select(_1655, float3(0.0), isnan(_1655));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1657.xy, uint(rint(_1657.z)), 1.0);
    float3 _1665 = float3(_301, _347, float(int(_295)));
    float3 _1667 = select(_1665, float3(0.0), isnan(_1665));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1667.xy, uint(rint(_1667.z)), 1.0);
    float _434 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[23].x, _421);
    int _436 = 2;
    float _438 = _387;
    if (!_413)
    {
        _436 = 1;
    }
    int _440 = _436;
    float _442 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _434);
    int _444 = _440;
    if (!_417)
    {
        _444 = _426;
    }
    int _446 = _444;
    float _448 = float(_446);
    float _450 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _379);
    float _452 = _391 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _454 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[16].x, _393);
    float _456 = precise::min(_448, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _458 = _450 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _460 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _454);
    bool _462 = _456 != 1.0;
    bool _464 = isnan(_456);
    bool _466 = _462 || _464;
    bool _468 = isnan(1.0);
    bool _470 = _466 || _468;
    float _472 = rint(_456);
    float _474 = precise::max(_472, 0.0);
    uint _476 = uint(_474);
    uint _478 = clamp(_476, 0u, 65535u);
    bool _480 = _456 != 0.0;
    bool _482 = isnan(_456);
    bool _484 = _480 || _482;
    bool _486 = isnan(0.0);
    bool _488 = _484 || _486;
    float _490 = _458;
    float _492 = _452;
    if (_470)
    {
        float _494 = _403 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _438 = _494;
    }
    float _496 = _438;
    float _498 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _500 = _496;
    if (!_488)
    {
        float _502 = _460 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _500 = _502;
    }
    float _504 = _500;
    float _506 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    if (_470)
    {
        float _508 = _415 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _490 = _508;
    }
    float _510 = _490;
    float _512 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[17].x, _498);
    float _514 = _510;
    if (_470)
    {
        float _516 = _442 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _492 = _516;
    }
    float _518 = _492;
    float _520 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[18].x, _506);
    float _522 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _512);
    float _524 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _520);
    float _526 = _518;
    if (!_488)
    {
        float _528 = _522 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _526 = _528;
    }
    float _530 = _526;
    if (!_488)
    {
        float _532 = _524 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _514 = _532;
    }
    float _534 = _514;
    float _536 = 0.0 + _534;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _538 * _343;
    float _542 = _538 * _401;
    float _544 = fma(_540, 1.5, _530);
    float _546 = fma(_542, 0.5, _504);
    float _548 = fma(_542, -0.5, _504);
    float3 _1868 = float3(_303, _347, float(int(_295)));
    float3 _1870 = select(_1868, float3(0.0), isnan(_1868));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1870.xy, uint(rint(_1870.z)), 1.0);
    float3 _1878 = float3(_546, _544, float(int(_478)));
    float3 _1880 = select(_1878, float3(0.0), isnan(_1878));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1880.xy, uint(rint(_1880.z)), _538);
    float3 _1889 = float3(_548, _544, float(int(_478)));
    float3 _1891 = select(_1889, float3(0.0), isnan(_1889));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1891.xy, uint(rint(_1891.z)), _538);
    float _556 = fma(_542, 1.5, _504);
    float _558 = fma(_542, -1.5, _504);
    float _560 = fma(_540, 0.5, _530);
    float _562 = _419 + _428;
    float _564 = _562 + _430;
    float3 _1915 = float3(_558, _544, float(int(_478)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1917.xy, uint(rint(_1917.z)), _538);
    float3 _1926 = float3(_556, _544, float(int(_478)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1928.xy, uint(rint(_1928.z)), _538);
    float3 _1937 = float3(_556, _560, float(int(_478)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1939.xy, uint(rint(_1939.z)), _538);
    float3 _1948 = float3(_546, _560, float(int(_478)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1950.xy, uint(rint(_1950.z)), _538);
    float3 _1959 = float3(_548, _560, float(int(_478)));
    float3 _1961 = select(_1959, float3(0.0), isnan(_1959));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1961.xy, uint(rint(_1961.z)), _538);
    float3 _1970 = float3(_558, _560, float(int(_478)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1972.xy, uint(rint(_1972.z)), _538);
    float _578 = _564 + _432;
    float _580 = fma(_540, -1.5, _530);
    float _582 = _578 + _550;
    float _584 = _568 + _552;
    float _586 = fma(_540, -0.5, _530);
    float _588 = _584 + _554;
    float _590 = _588 + _566;
    float3 _2002 = float3(_546, _586, float(int(_478)));
    float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2004.xy, uint(rint(_2004.z)), _538);
    float3 _2013 = float3(_556, _586, float(int(_478)));
    float3 _2015 = select(_2013, float3(0.0), isnan(_2013));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2015.xy, uint(rint(_2015.z)), _538);
    float3 _2024 = float3(_548, _586, float(int(_478)));
    float3 _2026 = select(_2024, float3(0.0), isnan(_2024));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2026.xy, uint(rint(_2026.z)), _538);
    float3 _2035 = float3(_558, _586, float(int(_478)));
    float3 _2037 = select(_2035, float3(0.0), isnan(_2035));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2037.xy, uint(rint(_2037.z)), _538);
    float3 _2046 = float3(_556, _580, float(int(_478)));
    float3 _2048 = select(_2046, float3(0.0), isnan(_2046));
    float _600 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2048.xy, uint(rint(_2048.z)), _538);
    float3 _2057 = float3(_546, _580, float(int(_478)));
    float3 _2059 = select(_2057, float3(0.0), isnan(_2057));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2059.xy, uint(rint(_2059.z)), _538);
    float _604 = -_158;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _608 = -_210;
    float _610 = _608 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _612 = _590 + _570;
    float _614 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _616 = _606 * _606;
    float _618 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _620 = _612 + _572;
    float _622 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _624 = fma(_610, _610, _616);
    float _626 = -_152;
    float _628 = _626 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _630 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[33].x, _614);
    float _632 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[27].x, _622);
    float _634 = fma(_628, _628, _624);
    float _636 = _620 + _574;
    float _638 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _640 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _630);
    float _642 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _632);
    float _644 = sqrt(_634);
    float _646 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[30].x, _638);
    float _648 = _636 + _576;
    float _650 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _652 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _654 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _646);
    float _656 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _658 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _660 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _662 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[25].x, _650);
    float _664 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[26].x, _652);
    float _666 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[28].x, _656);
    float _668 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[29].x, _658);
    float _670 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[31].x, _660);
    float _672 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[32].x, _618);
    float _674 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _666);
    bool _676 = _644 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _678 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _668);
    bool _680 = _644 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _682 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _670);
    bool _684 = !_676;
    int _686 = _684 ? 0 : 1;
    float _688 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _672);
    float _690 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _662);
    float _692 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _664);
    float _694 = _674 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _696 = _678 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _698 = 2;
    float _700 = _694;
    float _702 = _696;
    if (!_676)
    {
        _698 = 1;
    }
    int _704 = _698;
    int _706 = _704;
    if (!_680)
    {
        _706 = _686;
    }
    int _708 = _706;
    float _710 = float(_708);
    float _712 = _654 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _714 = precise::min(_710, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _716 = _714 != 1.0;
    bool _718 = isnan(_714);
    bool _720 = _716 || _718;
    bool _722 = isnan(1.0);
    bool _724 = _720 || _722;
    float _726 = rint(_714);
    float _728 = precise::max(_726, 0.0);
    uint _730 = uint(_728);
    uint _732 = clamp(_730, 0u, 65535u);
    bool _734 = _714 != 0.0;
    bool _736 = isnan(_714);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = _712;
    if (_724)
    {
        float _746 = _640 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _744 = _746;
    }
    float _748 = _744;
    float _750 = _748;
    if (_724)
    {
        float _752 = _682 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _700 = _752;
    }
    float _754 = _700;
    float _756 = _754;
    if (!_742)
    {
        float _758 = _642 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _750 = _758;
    }
    float _760 = _750;
    if (_724)
    {
        float _762 = _688 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _702 = _762;
    }
    float _764 = _702;
    float _766 = _764;
    if (!_742)
    {
        float _768 = _690 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _756 = _768;
    }
    float _770 = _756;
    if (!_742)
    {
        float _772 = _692 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _766 = _772;
    }
    float _774 = _766;
    float3 _2382 = float3(_548, _580, float(int(_478)));
    float3 _2384 = select(_2382, float3(0.0), isnan(_2382));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2384.xy, uint(rint(_2384.z)), _538);
    float3 _2393 = float3(_558, _580, float(int(_478)));
    float3 _2395 = select(_2393, float3(0.0), isnan(_2393));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2395.xy, uint(rint(_2395.z)), _538);
    float _780 = _648 + _594;
    float _782 = _780 + _592;
    float _784 = _782 + _596;
    float _786 = -_152;
    float _788 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _790 = _786 + _788;
    float _792 = _784 + _598;
    float _794 = 0.0 + _760;
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _790 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _800 = precise::clamp(_798, 0.0, 1.0);
    float _802 = _792 + _600;
    float _804 = _401 * _796;
    float _806 = _343 * _796;
    float _808 = _802 + _602;
    float _810 = fma(_804, 0.5, _770);
    float _812 = fma(_806, 1.5, _774);
    float _814 = fma(_806, 0.5, _774);
    float _816 = fma(_804, 1.5, _770);
    float _818 = fma(_804, -0.5, _770);
    float3 _2461 = float3(_810, _812, float(int(_732)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2463.xy, uint(rint(_2463.z)), _796);
    float3 _2472 = float3(_816, _812, float(int(_732)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2474.xy, uint(rint(_2474.z)), _796);
    float3 _2483 = float3(_818, _812, float(int(_732)));
    float3 _2485 = select(_2483, float3(0.0), isnan(_2483));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2485.xy, uint(rint(_2485.z)), _796);
    float3 _2494 = float3(_810, _814, float(int(_732)));
    float3 _2496 = select(_2494, float3(0.0), isnan(_2494));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2496.xy, uint(rint(_2496.z)), _796);
    float _828 = fma(_804, -1.5, _770);
    float _830 = fma(_582, 0.0625, _800);
    float3 _2512 = float3(_828, _812, float(int(_732)));
    float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2514.xy, uint(rint(_2514.z)), _796);
    float3 _2523 = float3(_816, _814, float(int(_732)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2525.xy, uint(rint(_2525.z)), _796);
    float3 _2534 = float3(_818, _814, float(int(_732)));
    float3 _2536 = select(_2534, float3(0.0), isnan(_2534));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2536.xy, uint(rint(_2536.z)), _796);
    float _838 = fma(_806, -0.5, _774);
    float _840 = _808 + _776;
    float3 _2551 = float3(_828, _814, float(int(_732)));
    float3 _2553 = select(_2551, float3(0.0), isnan(_2551));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2553.xy, uint(rint(_2553.z)), _796);
    float3 _2562 = float3(_816, _838, float(int(_732)));
    float3 _2564 = select(_2562, float3(0.0), isnan(_2562));
    float _844 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2564.xy, uint(rint(_2564.z)), _796);
    float3 _2573 = float3(_810, _838, float(int(_732)));
    float3 _2575 = select(_2573, float3(0.0), isnan(_2573));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2575.xy, uint(rint(_2575.z)), _796);
    float _848 = fma(_806, -1.5, _774);
    float3 _2587 = float3(_818, _838, float(int(_732)));
    float3 _2589 = select(_2587, float3(0.0), isnan(_2587));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2589.xy, uint(rint(_2589.z)), _796);
    float3 _2598 = float3(_828, _838, float(int(_732)));
    float3 _2600 = select(_2598, float3(0.0), isnan(_2598));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2600.xy, uint(rint(_2600.z)), _796);
    float _854 = _840 + _778;
    float3 _2612 = float3(_816, _848, float(int(_732)));
    float3 _2614 = select(_2612, float3(0.0), isnan(_2612));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2614.xy, uint(rint(_2614.z)), _796);
    float3 _2623 = float3(_810, _848, float(int(_732)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2625.xy, uint(rint(_2625.z)), _796);
    float3 _2634 = float3(_818, _848, float(int(_732)));
    float3 _2636 = select(_2634, float3(0.0), isnan(_2634));
    float _860 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2636.xy, uint(rint(_2636.z)), _796);
    float3 _2645 = float3(_828, _848, float(int(_732)));
    float3 _2647 = select(_2645, float3(0.0), isnan(_2645));
    float _862 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2647.xy, uint(rint(_2647.z)), _796);
    float _864 = -_152;
    float _866 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _868 = _864 + _866;
    float _870 = _854 * 0.0625;
    float _872 = _868 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = _822 + _820;
    float _878 = _876 + _824;
    float _880 = _878 + _832;
    float _882 = _880 + _834;
    float _884 = _882 + _826;
    float _886 = _884 + _836;
    float _888 = _886 + _842;
    float _890 = _888 + _844;
    float _892 = _890 + _846;
    float _894 = _892 + _850;
    float _896 = _894 + _852;
    float _898 = _896 + _856;
    float _900 = _898 + _858;
    float _902 = _900 + _860;
    float _904 = _902 + _862;
    float _906 = _904 * 0.0625;
    float _908 = _906 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _910 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[49].z, _908);
    float _912 = _874 + _910;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _830;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _912;
    return out;
}

