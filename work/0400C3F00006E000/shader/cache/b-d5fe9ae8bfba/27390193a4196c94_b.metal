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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _929 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_929, float2(0.0), isnan(_929)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _946 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_946, float2(0.0), isnan(_946))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_946, float2(0.0), isnan(_946))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = _116 * _142;
    float _148 = _128 * _142;
    float _150 = _108 * _142;
    float _152 = _132 * _144;
    float _154 = _112 * _144;
    float _156 = _120 * _144;
    float _158 = _146 * _152;
    float _160 = _148 * _154;
    float _162 = -_158;
    float _164 = fma(_148, _156, _162);
    float _166 = _150 * _156;
    float _168 = -_160;
    float _170 = fma(_150, _152, _168);
    float _172 = _164 * _164;
    float _174 = -_166;
    float _176 = fma(_146, _154, _174);
    float _178 = fma(_170, _170, _172);
    float _180 = fma(_176, _176, _178);
    float _182 = rsqrt(_180);
    float _184 = _164 * _182;
    float _186 = _170 * _182;
    float _188 = _176 * _182;
    float _190 = -_70;
    float _192 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[46].z, _192);
    float _196 = _184 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _198 = _194 * _72;
    float _200 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].x, _196);
    float _202 = _194 * _74;
    float _204 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = abs(_212);
    float _216 = log2(_214);
    float _218 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _220 = exp2(_218);
    float _222 = _220 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _224 = fma(_184, _222, _198);
    float _226 = fma(_186, _222, _202);
    float _228 = fma(_188, _222, _194);
    float _230 = _224 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _232 = _224 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _236 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].x, _230);
    float _238 = _224 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _236);
    float _246 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _240);
    float _248 = _244 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _250 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].x, _238);
    float _252 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].x, _234);
    float _254 = _246 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _256 = 1.0 / _248;
    float _258 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].z, _250);
    float _260 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _252);
    float _262 = _258 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _264 = _260 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _266 = _254 * _256;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _272 = _262 * _256;
    float _274 = _264 * _256;
    float _276 = _268 * _242;
    float _278 = _268 * _270;
    float _280 = fma(_276, 1.5, _272);
    float _282 = fma(_278, 1.5, _274);
    float _284 = fma(_276, 0.5, _272);
    float3 _1316 = float3(_280, _282, float(0));
    float3 _1320 = select(_1316, float3(0.0), isnan(_1316));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1320.xy, uint(rint(_1320.z)), _268);
    float3 _1327 = float3(_284, _282, float(0));
    float3 _1329 = select(_1327, float3(0.0), isnan(_1327));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1329.xy, uint(rint(_1329.z)), _268);
    float _290 = -_198;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _294 = -_202;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _298 = _198 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _300 = _198 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _302 = _292 * _292;
    float _304 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].x, _298);
    float _306 = fma(_296, _296, _302);
    float _308 = -_194;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _312 = _198 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _314 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].x, _300);
    float _316 = fma(_310, _310, _306);
    float _318 = _198 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _320 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].x, _312);
    float _322 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[24].z, _304);
    float _324 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[23].z, _314);
    float _326 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].x, _318);
    float _328 = sqrt(_316);
    float _330 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[22].z, _320);
    float _332 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[21].z, _326);
    float _334 = _332 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _338 = _328 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _340 = _328 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _342 = !_338;
    int _345 = _342 ? 0 : 1;
    int _347 = 2;
    float _349 = _334;
    if (!_338)
    {
        _347 = 1;
    }
    int _351 = _347;
    int _353 = _351;
    if (!_340)
    {
        _353 = _345;
    }
    int _355 = _353;
    float _357 = _198 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _359 = _198 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _361 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].x, _357);
    float _363 = fma(_278, 0.5, _274);
    float _365 = float(_355);
    float _367 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].x, _359);
    float _369 = fma(_278, -0.5, _274);
    float _371 = fma(_278, -1.5, _274);
    float _373 = precise::min(_365, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _375 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[20].z, _367);
    float _377 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[19].z, _361);
    float _379 = _375 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _381 = fma(_276, -0.5, _272);
    bool _383 = _373 != 1.0;
    bool _385 = isnan(_373);
    bool _387 = _383 || _385;
    bool _389 = isnan(1.0);
    bool _391 = _387 || _389;
    float _393 = fma(_276, -1.5, _272);
    float _395 = _198 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float3 _1532 = float3(_381, _282, float(0));
    float3 _1534 = select(_1532, float3(0.0), isnan(_1532));
    float _397 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1534.xy, uint(rint(_1534.z)), _268);
    float _399 = _377 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float3 _1545 = float3(_393, _282, float(0));
    float3 _1547 = select(_1545, float3(0.0), isnan(_1545));
    float _401 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1547.xy, uint(rint(_1547.z)), _268);
    float _403 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].x, _395);
    float _405 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[16].z, _403);
    float _407 = _399;
    float _409 = _379;
    if (_391)
    {
        float _411 = _330 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _407 = _411;
    }
    float _413 = _407;
    float3 _1575 = float3(_280, _363, float(0));
    float3 _1577 = select(_1575, float3(0.0), isnan(_1575));
    float _415 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1577.xy, uint(rint(_1577.z)), _268);
    float _417 = _413;
    if (_391)
    {
        float _419 = _322 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _349 = _419;
    }
    float _421 = _349;
    float _423 = _421;
    if (_391)
    {
        float _425 = _324 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _409 = _425;
    }
    float _427 = _409;
    bool _429 = _373 != 0.0;
    bool _431 = isnan(_373);
    bool _433 = _429 || _431;
    bool _435 = isnan(0.0);
    bool _437 = _433 || _435;
    float _439 = _286 + _288;
    float3 _1618 = float3(_284, _363, float(0));
    float3 _1620 = select(_1618, float3(0.0), isnan(_1618));
    float _441 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1620.xy, uint(rint(_1620.z)), _268);
    float3 _1627 = float3(_381, _363, float(0));
    float3 _1629 = select(_1627, float3(0.0), isnan(_1627));
    float _443 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1629.xy, uint(rint(_1629.z)), _268);
    float3 _1636 = float3(_393, _363, float(0));
    float3 _1638 = select(_1636, float3(0.0), isnan(_1636));
    float _445 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1638.xy, uint(rint(_1638.z)), _268);
    float _447 = _427;
    if (!_437)
    {
        float _449 = _405 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _417 = _449;
    }
    float _451 = _417;
    float _453 = _198 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _455 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].x, _453);
    float _457 = _198 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _459 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[17].z, _455);
    if (!_437)
    {
        float _461 = _459 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _447 = _461;
    }
    float _463 = _447;
    float _465 = _439 + _397;
    float _467 = _465 + _401;
    float _469 = _467 + _415;
    float _471 = _469 + _441;
    float3 _1698 = float3(_280, _369, float(0));
    float3 _1700 = select(_1698, float3(0.0), isnan(_1698));
    float _473 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1700.xy, uint(rint(_1700.z)), _268);
    float3 _1707 = float3(_284, _369, float(0));
    float3 _1709 = select(_1707, float3(0.0), isnan(_1707));
    float _475 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1709.xy, uint(rint(_1709.z)), _268);
    float3 _1716 = float3(_381, _369, float(0));
    float3 _1718 = select(_1716, float3(0.0), isnan(_1716));
    float _477 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1718.xy, uint(rint(_1718.z)), _268);
    float3 _1725 = float3(_393, _369, float(0));
    float3 _1727 = select(_1725, float3(0.0), isnan(_1725));
    float _479 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1727.xy, uint(rint(_1727.z)), _268);
    float _481 = _471 + _443;
    float _483 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].x, _457);
    float _485 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _487 = rint(_373);
    float _489 = precise::max(_487, 0.0);
    uint _492 = uint(_489);
    uint _494 = clamp(_492, 0u, 65535u);
    float _496 = _481 + _445;
    float _498 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[18].z, _483);
    if (!_437)
    {
        float _500 = _498 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _423 = _500;
    }
    float _502 = _423;
    float _504 = 0.0 + _502;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _506 * _485;
    float _510 = fma(_508, 1.5, _463);
    float _512 = _496 + _473;
    float _514 = _512 + _475;
    float _516 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _518 = _514 + _477;
    float _520 = _506 * _516;
    float3 _1802 = float3(_280, _371, float(0));
    float3 _1804 = select(_1802, float3(0.0), isnan(_1802));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1804.xy, uint(rint(_1804.z)), _268);
    float3 _1811 = float3(_284, _371, float(0));
    float3 _1813 = select(_1811, float3(0.0), isnan(_1811));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1813.xy, uint(rint(_1813.z)), _268);
    float3 _1820 = float3(_381, _371, float(0));
    float3 _1822 = select(_1820, float3(0.0), isnan(_1820));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1822.xy, uint(rint(_1822.z)), _268);
    float3 _1829 = float3(_393, _371, float(0));
    float3 _1831 = select(_1829, float3(0.0), isnan(_1829));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1831.xy, uint(rint(_1831.z)), _268);
    float _530 = fma(_520, 0.5, _451);
    float _532 = fma(_520, 1.5, _451);
    float3 _1846 = float3(_530, _510, float(int(_494)));
    float3 _1848 = select(_1846, float3(0.0), isnan(_1846));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1848.xy, uint(rint(_1848.z)), _506);
    float3 _1857 = float3(_532, _510, float(int(_494)));
    float3 _1859 = select(_1857, float3(0.0), isnan(_1857));
    float _536 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1859.xy, uint(rint(_1859.z)), _506);
    float _538 = _518 + _479;
    float _540 = fma(_520, -0.5, _451);
    float _542 = fma(_520, -1.5, _451);
    float _544 = fma(_508, 0.5, _463);
    float3 _1880 = float3(_540, _510, float(int(_494)));
    float3 _1882 = select(_1880, float3(0.0), isnan(_1880));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1882.xy, uint(rint(_1882.z)), _506);
    float _548 = fma(_508, -0.5, _463);
    float _550 = _538 + _522;
    float _552 = _550 + _524;
    float _554 = _552 + _526;
    float _556 = _536 + _534;
    float _558 = _554 + _528;
    float3 _1909 = float3(_542, _510, float(int(_494)));
    float3 _1911 = select(_1909, float3(0.0), isnan(_1909));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1911.xy, uint(rint(_1911.z)), _506);
    float3 _1920 = float3(_532, _544, float(int(_494)));
    float3 _1922 = select(_1920, float3(0.0), isnan(_1920));
    float _562 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1922.xy, uint(rint(_1922.z)), _506);
    float3 _1931 = float3(_530, _544, float(int(_494)));
    float3 _1933 = select(_1931, float3(0.0), isnan(_1931));
    float _564 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1933.xy, uint(rint(_1933.z)), _506);
    float3 _1942 = float3(_540, _544, float(int(_494)));
    float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1944.xy, uint(rint(_1944.z)), _506);
    float3 _1953 = float3(_542, _544, float(int(_494)));
    float3 _1955 = select(_1953, float3(0.0), isnan(_1953));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1955.xy, uint(rint(_1955.z)), _506);
    float3 _1964 = float3(_532, _548, float(int(_494)));
    float3 _1966 = select(_1964, float3(0.0), isnan(_1964));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1966.xy, uint(rint(_1966.z)), _506);
    float _572 = _556 + _546;
    float _574 = fma(_508, -1.5, _463);
    float3 _1981 = float3(_530, _548, float(int(_494)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1983.xy, uint(rint(_1983.z)), _506);
    float _578 = _572 + _560;
    float _580 = _578 + _562;
    float _582 = _580 + _564;
    float3 _2001 = float3(_540, _548, float(int(_494)));
    float3 _2003 = select(_2001, float3(0.0), isnan(_2001));
    float _584 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2003.xy, uint(rint(_2003.z)), _506);
    float _586 = _582 + _566;
    float3 _2015 = float3(_542, _548, float(int(_494)));
    float3 _2017 = select(_2015, float3(0.0), isnan(_2015));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2017.xy, uint(rint(_2017.z)), _506);
    float3 _2026 = float3(_532, _574, float(int(_494)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2028.xy, uint(rint(_2028.z)), _506);
    float3 _2037 = float3(_530, _574, float(int(_494)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2039.xy, uint(rint(_2039.z)), _506);
    float _594 = _586 + _568;
    float _596 = _594 + _570;
    float3 _2054 = float3(_540, _574, float(int(_494)));
    float3 _2056 = select(_2054, float3(0.0), isnan(_2054));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2056.xy, uint(rint(_2056.z)), _506);
    float _600 = -_198;
    float _602 = _600 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _604 = -_202;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _608 = _602 * _602;
    float _610 = fma(_606, _606, _608);
    float _612 = -_194;
    float _614 = _612 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _616 = fma(_614, _614, _610);
    float _618 = sqrt(_616);
    float _620 = _198 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _622 = _198 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _624 = _198 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _626 = _198 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _628 = _198 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _630 = _198 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _632 = _198 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _634 = _198 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _636 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].x, _628);
    float _638 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].x, _626);
    float _640 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].x, _624);
    float _642 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].x, _630);
    float _644 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].x, _632);
    float _646 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].x, _634);
    bool _648 = _618 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _650 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[30].z, _636);
    bool _652 = _618 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _654 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[33].z, _646);
    bool _656 = !_648;
    int _658 = _656 ? 0 : 1;
    float _660 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[28].z, _638);
    float _662 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[31].z, _642);
    float _664 = _650 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _666 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[29].z, _640);
    float _668 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[32].z, _644);
    float _670 = _596 + _576;
    float _672 = _666 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _674 = 2;
    float _676 = _664;
    float _678 = _672;
    if (!_648)
    {
        _674 = 1;
    }
    int _680 = _674;
    int _682 = _680;
    if (!_652)
    {
        _682 = _658;
    }
    int _684 = _682;
    float _686 = _198 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _688 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].x, _620);
    float _690 = float(_684);
    float _692 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].x, _622);
    float _694 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].x, _686);
    float _696 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[25].z, _688);
    float _698 = precise::min(_690, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _700 = _660 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _702 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[27].z, _694);
    float _704 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[26].z, _692);
    bool _706 = _698 != 1.0;
    bool _708 = isnan(_698);
    bool _710 = _706 || _708;
    bool _712 = isnan(1.0);
    bool _714 = _710 || _712;
    float _716 = rint(_698);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    uint _722 = clamp(_720, 0u, 65535u);
    bool _724 = _698 != 0.0;
    bool _726 = isnan(_698);
    bool _728 = _724 || _726;
    bool _730 = isnan(0.0);
    bool _732 = _728 || _730;
    float _734 = _700;
    if (_714)
    {
        float _736 = _654 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _676 = _736;
    }
    float _738 = _676;
    float _740 = _738;
    if (_714)
    {
        float _742 = _662 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _734 = _742;
    }
    float _744 = _734;
    float _746 = _744;
    if (!_732)
    {
        float _748 = _702 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _740 = _748;
    }
    float _750 = _740;
    if (!_732)
    {
        float _752 = _696 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _746 = _752;
    }
    float _754 = _746;
    if (_714)
    {
        float _756 = _668 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _678 = _756;
    }
    float _758 = _678;
    float _760 = _758;
    if (!_732)
    {
        float _762 = _704 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _760 = _762;
    }
    float _764 = _760;
    float _766 = 0.0 + _750;
    float _768 = precise::clamp(_766, 0.0, 1.0);
    float _770 = _516 * _768;
    float _772 = _485 * _768;
    float3 _2380 = float3(_542, _574, float(int(_494)));
    float3 _2382 = select(_2380, float3(0.0), isnan(_2380));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2382.xy, uint(rint(_2382.z)), _506);
    float _776 = fma(_770, 0.5, _754);
    float _778 = fma(_772, 1.5, _764);
    float _780 = fma(_772, 0.5, _764);
    float _782 = -_194;
    float _784 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _786 = _782 + _784;
    float3 _2408 = float3(_776, _778, float(int(_722)));
    float3 _2410 = select(_2408, float3(0.0), isnan(_2408));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2410.xy, uint(rint(_2410.z)), _768);
    float _790 = _786 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _792 = precise::clamp(_790, 0.0, 1.0);
    float _794 = _670 + _584;
    float _796 = _794 + _588;
    float _798 = fma(_770, 1.5, _754);
    float _800 = _796 + _590;
    float _802 = fma(_770, -0.5, _754);
    float3 _2440 = float3(_798, _778, float(int(_722)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2442.xy, uint(rint(_2442.z)), _768);
    float _806 = _800 + _592;
    float3 _2454 = float3(_802, _778, float(int(_722)));
    float3 _2456 = select(_2454, float3(0.0), isnan(_2454));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2456.xy, uint(rint(_2456.z)), _768);
    float _810 = fma(_770, -1.5, _754);
    float _812 = _806 + _598;
    float3 _2471 = float3(_810, _778, float(int(_722)));
    float3 _2473 = select(_2471, float3(0.0), isnan(_2471));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2473.xy, uint(rint(_2473.z)), _768);
    float3 _2482 = float3(_798, _780, float(int(_722)));
    float3 _2484 = select(_2482, float3(0.0), isnan(_2482));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2484.xy, uint(rint(_2484.z)), _768);
    float3 _2493 = float3(_776, _780, float(int(_722)));
    float3 _2495 = select(_2493, float3(0.0), isnan(_2493));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2495.xy, uint(rint(_2495.z)), _768);
    float _820 = fma(_558, 0.0625, _792);
    float _822 = fma(_772, -0.5, _764);
    float _824 = fma(_772, -1.5, _764);
    float _826 = _804 + _788;
    float _828 = _812 + _774;
    float _830 = _826 + _808;
    float3 _2523 = float3(_802, _780, float(int(_722)));
    float3 _2525 = select(_2523, float3(0.0), isnan(_2523));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2525.xy, uint(rint(_2525.z)), _768);
    float2 _2531 = float2(_56, _58);
    float2 _836 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2531, float2(0.0), isnan(_2531))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2531, float2(0.0), isnan(_2531))).xy;
    float _838 = _836.x;
    float _840 = _836.y;
    float _842 = _830 + _814;
    float _844 = _842 + _816;
    float3 _2552 = float3(_810, _780, float(int(_722)));
    float3 _2554 = select(_2552, float3(0.0), isnan(_2552));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2554.xy, uint(rint(_2554.z)), _768);
    float3 _2563 = float3(_798, _822, float(int(_722)));
    float3 _2565 = select(_2563, float3(0.0), isnan(_2563));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2565.xy, uint(rint(_2565.z)), _768);
    float3 _2574 = float3(_776, _822, float(int(_722)));
    float3 _2576 = select(_2574, float3(0.0), isnan(_2574));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2576.xy, uint(rint(_2576.z)), _768);
    float3 _2585 = float3(_802, _822, float(int(_722)));
    float3 _2587 = select(_2585, float3(0.0), isnan(_2585));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2587.xy, uint(rint(_2587.z)), _768);
    float3 _2596 = float3(_810, _822, float(int(_722)));
    float3 _2598 = select(_2596, float3(0.0), isnan(_2596));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2598.xy, uint(rint(_2598.z)), _768);
    float _856 = _844 + _818;
    float _858 = fma(_838, 2.0, -1.0);
    float _860 = fma(_840, 2.0, -1.0);
    float _862 = _858 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _864 = _860 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _866 = _856 + _832;
    float _868 = fma(_862, 2.0, _56);
    float _870 = fma(_864, 2.0, _58);
    float3 _2634 = float3(_798, _824, float(int(_722)));
    float3 _2636 = select(_2634, float3(0.0), isnan(_2634));
    float _872 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2636.xy, uint(rint(_2636.z)), _768);
    float3 _2645 = float3(_776, _824, float(int(_722)));
    float3 _2647 = select(_2645, float3(0.0), isnan(_2645));
    float _874 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2647.xy, uint(rint(_2647.z)), _768);
    float3 _2656 = float3(_802, _824, float(int(_722)));
    float3 _2658 = select(_2656, float3(0.0), isnan(_2656));
    float _876 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2658.xy, uint(rint(_2658.z)), _768);
    float3 _2667 = float3(_810, _824, float(int(_722)));
    float3 _2669 = select(_2667, float3(0.0), isnan(_2667));
    float _878 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2669.xy, uint(rint(_2669.z)), _768);
    float2 _2675 = float2(_868, _870);
    float _880 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2675, float2(0.0), isnan(_2675))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2675, float2(0.0), isnan(_2675))).x;
    float _882 = _866 + _846;
    float _884 = _828 * 0.0625;
    float _886 = _882 + _848;
    float _888 = _886 + _850;
    float _890 = _888 + _852;
    float _892 = _890 + _854;
    float _894 = -_194;
    float _896 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _898 = _894 + _896;
    float _900 = _898 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _902 = precise::clamp(_900, 0.0, 1.0);
    float _904 = _892 + _872;
    float _906 = _904 + _874;
    float _908 = _906 + _876;
    float _910 = _908 + _878;
    float _912 = _910 * 0.0625;
    float _914 = _912 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _916 = fma(_884, (*spvDescriptorSet0.fp_c3)._m0[49].z, _914);
    float _918 = _902 + _916;
    out.m_49.x = _880;
    out.m_49.y = _820;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _918;
    return out;
}

