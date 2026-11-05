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
    texture2d_array<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _1783 = float3(_63, _65, float(int(_74)));
    float3 _1787 = select(_1783, float3(0.0), isnan(_1783));
    float2 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1787.xy, uint(rint(_1787.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1787.xy, uint(rint(_1787.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xy;
    float _80 = _78.x;
    float _82 = _78.y;
    float3 _1805 = float3(_63, _65, float(int(_74)));
    float3 _1807 = select(_1805, float3(0.0), isnan(_1805));
    float2 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1807.xy, uint(rint(_1807.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1807.xy, uint(rint(_1807.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xy;
    float _86 = _84.x;
    float _88 = _84.y;
    float3 _1823 = float3(_63, _65, float(int(_74)));
    float3 _1825 = select(_1823, float3(0.0), isnan(_1823));
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1825.xy, uint(rint(_1825.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1825.xy, uint(rint(_1825.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float3 _1841 = float3(_63, _65, float(int(_74)));
    float3 _1843 = select(_1841, float3(0.0), isnan(_1841));
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1843.xy, uint(rint(_1843.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1843.xy, uint(rint(_1843.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xy;
    float _98 = _96.x;
    float _100 = _96.y;
    float3 _1859 = float3(_63, _65, float(int(_74)));
    float3 _1861 = select(_1859, float3(0.0), isnan(_1859));
    float2 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1861.xy, uint(rint(_1861.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1861.xy, uint(rint(_1861.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xy;
    float _104 = _102.x;
    float _106 = _102.y;
    float3 _1877 = float3(_63, _65, float(int(_74)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float2 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1879.xy, uint(rint(_1879.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1879.xy, uint(rint(_1879.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xy;
    float _110 = _108.x;
    float _112 = _108.y;
    float3 _1895 = float3(_63, _65, float(int(_74)));
    float3 _1897 = select(_1895, float3(0.0), isnan(_1895));
    float2 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1897.xy, uint(rint(_1897.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1897.xy, uint(rint(_1897.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xy;
    float _116 = _114.x;
    float _118 = _114.y;
    float3 _1913 = float3(_63, _65, float(int(_74)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float2 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1915.xy, uint(rint(_1915.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1915.xy, uint(rint(_1915.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    float3 _1931 = float3(_63, _65, float(int(_74)));
    float3 _1933 = select(_1931, float3(0.0), isnan(_1931));
    float2 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1933.xy, uint(rint(_1933.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1933.xy, uint(rint(_1933.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xy;
    float _128 = _126.x;
    float _130 = _126.y;
    float3 _1949 = float3(_63, _65, float(int(_74)));
    float3 _1951 = select(_1949, float3(0.0), isnan(_1949));
    float2 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1951.xy, uint(rint(_1951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1951.xy, uint(rint(_1951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float3 _1967 = float3(_63, _65, float(int(_74)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float2 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1969.xy, uint(rint(_1969.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1969.xy, uint(rint(_1969.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float3 _1984 = float3(_63, _65, float(int(_74)));
    float3 _1986 = select(_1984, float3(0.0), isnan(_1984));
    float2 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1986.xy, uint(rint(_1986.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1986.xy, uint(rint(_1986.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float3 _2002 = float3(_63, _65, float(int(_74)));
    float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
    float2 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2004.xy, uint(rint(_2004.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2004.xy, uint(rint(_2004.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xy;
    float _152 = _150.x;
    float _154 = _150.y;
    float3 _2020 = float3(_63, _65, float(int(_74)));
    float3 _2022 = select(_2020, float3(0.0), isnan(_2020));
    float2 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2022.xy, uint(rint(_2022.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2022.xy, uint(rint(_2022.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xy;
    float _158 = _156.x;
    float _160 = _156.y;
    float3 _2038 = float3(_63, _65, float(int(_74)));
    float3 _2040 = select(_2038, float3(0.0), isnan(_2038));
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2040.xy, uint(rint(_2040.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2040.xy, uint(rint(_2040.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xy;
    float _164 = _162.x;
    float _166 = _162.y;
    float3 _2056 = float3(_63, _65, float(int(_74)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2058.xy, uint(rint(_2058.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2058.xy, uint(rint(_2058.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xy;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = precise::min(_80, _86);
    float _176 = precise::min(_92, _98);
    float _178 = precise::max(_82, _88);
    float _180 = precise::min(_174, _176);
    float _182 = precise::max(_94, _100);
    float _184 = precise::min(_82, _88);
    float _186 = precise::min(_94, _100);
    float _188 = precise::max(_178, _182);
    float _190 = precise::min(_184, _186);
    float _192 = precise::max(_80, _86);
    float _194 = precise::max(_92, _98);
    float _196 = precise::max(_104, _110);
    float _198 = precise::max(_116, _122);
    float _200 = precise::min(_104, _110);
    float _202 = precise::min(_116, _122);
    float _204 = precise::max(_196, _198);
    float _206 = precise::min(_200, _202);
    float _208 = precise::max(_106, _112);
    float _210 = precise::max(_118, _124);
    float _212 = precise::max(_128, _134);
    float _214 = precise::max(_140, _146);
    float _216 = precise::min(_128, _134);
    float _218 = precise::min(_140, _146);
    float _220 = precise::max(_208, _210);
    float _222 = precise::min(_106, _112);
    float _224 = precise::min(_118, _124);
    float _226 = precise::max(_214, _212);
    float _228 = precise::min(_218, _216);
    float _230 = precise::max(_152, _158);
    float _232 = precise::max(_164, _170);
    float _234 = precise::min(_222, _224);
    float _236 = precise::max(_130, _136);
    float _238 = precise::max(_142, _148);
    float _240 = precise::max(_192, _194);
    float _242 = precise::max(_230, _232);
    float _244 = precise::max(_238, _236);
    float _246 = precise::max(_226, _240);
    float _248 = precise::max(_204, _242);
    float _250 = precise::min(_152, _158);
    float _252 = precise::min(_164, _170);
    float _254 = precise::min(_228, _180);
    float _256 = precise::max(_246, _248);
    float _258 = precise::min(_130, _136);
    float _260 = precise::min(_142, _148);
    float _262 = precise::min(_250, _252);
    float _264 = precise::min(_154, _160);
    float _266 = precise::min(_166, _172);
    float _268 = precise::max(_154, _160);
    float _270 = precise::max(_166, _172);
    float _272 = precise::min(_260, _258);
    float _274 = precise::min(_206, _262);
    float _276 = _256 * 255.0;
    float _278 = precise::min(_264, _266);
    float _280 = precise::max(_268, _270);
    float _282 = precise::min(_272, _190);
    float _284 = precise::min(_254, _274);
    float _286 = precise::min(_234, _278);
    float _288 = trunc(_276);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    float _294 = precise::max(_220, _280);
    float _296 = precise::max(_244, _188);
    float _298 = _284 * 255.0;
    float _300 = precise::min(_282, _286);
    float _302 = precise::max(_296, _294);
    float _304 = trunc(_298);
    float _306 = precise::max(_304, 0.0);
    uint _308 = uint(_306);
    float _310 = _300 * 255.0;
    float _312 = _302 * 255.0;
    float _314 = trunc(_310);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    float _320 = trunc(_312);
    float _322 = precise::max(_320, 0.0);
    uint _324 = uint(_322);
    bool _328 = _292 > _308;
    int _331 = int(_308) << 8;
    int _333 = _331 & 65280;
    int _335 = int(_318) * 256;
    int _337 = 255 & int(_292);
    int _339 = _333 | _337;
    int _341 = _335 & 65280;
    int _343 = _333;
    int _345 = int(_292);
    int _347 = int(_318);
    int _349 = _341;
    int _351 = as_type<int>(_284);
    int _353 = as_type<int>(_256);
    if (!_328)
    {
        _343 = 0;
    }
    int _355 = _343;
    int _357 = _355;
    if (!_328)
    {
        _345 = 0;
    }
    int _359 = _345;
    bool _361 = _324 > _318;
    int _363 = 255 & int(_324);
    int _365 = _341 | _363;
    int _367 = _359;
    if (!_328)
    {
        _347 = 0;
    }
    int _369 = _347;
    bool _371 = !_328;
    int _373 = _369;
    if (!_371)
    {
        float _375 = -_284;
        float _377 = _256 + _375;
        float _379 = -_284;
        float _381 = _140 + _379;
        float _383 = -_284;
        float _385 = _146 + _383;
        float _387 = -_284;
        float _389 = _128 + _387;
        float _391 = 1.0 / _377;
        float _393 = -_284;
        float _395 = _80 + _393;
        float _397 = -_284;
        float _399 = _134 + _397;
        float _401 = -_284;
        float _403 = _86 + _401;
        float _405 = -_284;
        float _407 = _92 + _405;
        float _409 = -_284;
        float _411 = _98 + _409;
        float _413 = -_284;
        float _415 = _104 + _413;
        float _417 = -_284;
        float _419 = _110 + _417;
        float _421 = -_284;
        float _423 = _116 + _421;
        float _425 = -_284;
        float _427 = _122 + _425;
        float _429 = -_284;
        float _431 = _152 + _429;
        float _433 = -_284;
        float _435 = _158 + _433;
        float _437 = -_284;
        float _439 = _164 + _437;
        float _441 = -_284;
        float _443 = _170 + _441;
        float _445 = _385 * _391;
        float _447 = _389 * _391;
        float _449 = _381 * _391;
        float _451 = _395 * _391;
        float _453 = fma(_445, -1.99999904632568359375, 1.99999904632568359375);
        float _455 = fma(_445, -7.99999904632568359375, 7.99999904632568359375);
        float _457 = fma(_447, -1.99999904632568359375, 1.99999904632568359375);
        float _459 = fma(_447, -7.99999904632568359375, 7.99999904632568359375);
        float _461 = _399 * _391;
        float _463 = _403 * _391;
        float _465 = _407 * _391;
        float _467 = _411 * _391;
        float _469 = _415 * _391;
        float _471 = _419 * _391;
        float _473 = _423 * _391;
        float _475 = _427 * _391;
        float _477 = _431 * _391;
        float _479 = _435 * _391;
        float _481 = _439 * _391;
        float _483 = _443 * _391;
        float _485 = fma(_449, -1.99999904632568359375, 1.99999904632568359375);
        float _487 = fma(_449, -7.99999904632568359375, 7.99999904632568359375);
        float _489 = fma(_451, -1.99999904632568359375, 1.99999904632568359375);
        float _491 = fma(_451, -7.99999904632568359375, 7.99999904632568359375);
        float _493 = -_445;
        float _495 = _493 + 0.5;
        float _497 = -_447;
        float _499 = _497 + 0.5;
        float _501 = -_451;
        float _503 = _501 + 0.5;
        float _505 = trunc(_453);
        float _507 = precise::max(_505, 0.0);
        uint _509 = uint(_507);
        float _511 = fma(_461, -1.99999904632568359375, 1.99999904632568359375);
        float _513 = fma(_461, -7.99999904632568359375, 7.99999904632568359375);
        float _515 = -_449;
        float _517 = _515 + 0.5;
        float _519 = abs(_495);
        bool _521 = _519 >= 0.375;
        float _523 = -_461;
        float _525 = _523 + 0.5;
        float _527 = abs(_499);
        bool _529 = _527 >= 0.375;
        float _531 = fma(_463, -7.99999904632568359375, 7.99999904632568359375);
        float _533 = trunc(_455);
        float _535 = precise::max(_533, 0.0);
        uint _537 = uint(_535);
        float _539 = abs(_503);
        bool _541 = _539 >= 0.375;
        float _543 = -_463;
        float _545 = _543 + 0.5;
        float _547 = abs(_517);
        bool _549 = _547 >= 0.375;
        float _551 = fma(_463, -1.99999904632568359375, 1.99999904632568359375);
        float _553 = abs(_525);
        bool _555 = _553 >= 0.375;
        float _557 = fma(_467, -1.99999904632568359375, 1.99999904632568359375);
        float _559 = abs(_545);
        bool _561 = _559 >= 0.375;
        float _563 = trunc(_457);
        float _565 = precise::max(_563, 0.0);
        uint _567 = uint(_565);
        float _569 = fma(_467, -7.99999904632568359375, 7.99999904632568359375);
        float _571 = fma(_465, -1.99999904632568359375, 1.99999904632568359375);
        float _573 = fma(_465, -7.99999904632568359375, 7.99999904632568359375);
        float _575 = -_467;
        float _577 = _575 + 0.5;
        float _579 = -_465;
        float _581 = _579 + 0.5;
        float _583 = trunc(_459);
        float _585 = precise::max(_583, 0.0);
        uint _587 = uint(_585);
        int _589 = int(_509);
        int _591 = int(_567);
        if (!_521)
        {
            int _593 = int(_537) + 1;
            _589 = _593;
        }
        int _595 = _589;
        float _597 = fma(_471, -1.99999904632568359375, 1.99999904632568359375);
        float _599 = abs(_577);
        bool _601 = _599 >= 0.375;
        float _603 = fma(_471, -7.99999904632568359375, 7.99999904632568359375);
        float _605 = -_471;
        float _607 = _605 + 0.5;
        int _609 = _595 << 3;
        float _611 = trunc(_485);
        float _613 = precise::max(_611, 0.0);
        uint _615 = uint(_613);
        float _617 = trunc(_487);
        float _619 = precise::max(_617, 0.0);
        uint _621 = uint(_619);
        int _623 = int(_615);
        if (!_529)
        {
            int _625 = int(_587) + 1;
            _591 = _625;
        }
        int _627 = _591;
        float _629 = -_469;
        float _631 = _629 + 0.5;
        int _633 = _627 << 6;
        float _635 = abs(_631);
        bool _637 = _635 >= 0.375;
        float _639 = trunc(_511);
        float _641 = precise::max(_639, 0.0);
        uint _643 = uint(_641);
        float _645 = fma(_473, -7.99999904632568359375, 7.99999904632568359375);
        float _647 = trunc(_513);
        float _649 = precise::max(_647, 0.0);
        uint _651 = uint(_649);
        int _653 = int(_643);
        if (!_549)
        {
            int _655 = int(_621) + 1;
            _623 = _655;
        }
        int _657 = _623;
        float _659 = fma(_469, -1.99999904632568359375, 1.99999904632568359375);
        float _661 = abs(_581);
        bool _663 = _661 >= 0.375;
        float _665 = fma(_469, -7.99999904632568359375, 7.99999904632568359375);
        float _667 = fma(_473, -1.99999904632568359375, 1.99999904632568359375);
        float _669 = -_473;
        float _671 = _669 + 0.5;
        int _673 = _657 | _609;
        float _675 = trunc(_489);
        float _677 = precise::max(_675, 0.0);
        uint _679 = uint(_677);
        float _681 = trunc(_491);
        float _683 = precise::max(_681, 0.0);
        uint _685 = uint(_683);
        int _687 = int(_679);
        if (!_555)
        {
            int _689 = int(_651) + 1;
            _653 = _689;
        }
        int _691 = _653;
        float _693 = fma(_475, -1.99999904632568359375, 1.99999904632568359375);
        float _695 = abs(_607);
        bool _697 = _695 >= 0.375;
        float _699 = fma(_475, -7.99999904632568359375, 7.99999904632568359375);
        float _701 = -_475;
        float _703 = _701 + 0.5;
        float _705 = fma(_483, -7.99999904632568359375, 7.99999904632568359375);
        int _707 = _691 << 9;
        float _709 = trunc(_551);
        float _711 = precise::max(_709, 0.0);
        uint _713 = uint(_711);
        int _715 = _673 | _633;
        int _717 = _707 | _715;
        float _719 = trunc(_531);
        float _721 = precise::max(_719, 0.0);
        uint _723 = uint(_721);
        int _725 = int(_713);
        if (!_541)
        {
            int _727 = int(_685) + 1;
            _687 = _727;
        }
        int _729 = _687;
        float _731 = fma(_477, -1.99999904632568359375, 1.99999904632568359375);
        float _733 = abs(_671);
        bool _735 = _733 >= 0.375;
        float _737 = fma(_477, -7.99999904632568359375, 7.99999904632568359375);
        float _739 = -_477;
        float _741 = _739 + 0.5;
        float _743 = trunc(_571);
        float _745 = precise::max(_743, 0.0);
        uint _747 = uint(_745);
        float _749 = trunc(_573);
        float _751 = precise::max(_749, 0.0);
        uint _753 = uint(_751);
        int _755 = int(_747);
        if (!_561)
        {
            int _757 = int(_723) + 1;
            _725 = _757;
        }
        int _759 = _725;
        float _761 = fma(_479, -1.99999904632568359375, 1.99999904632568359375);
        float _763 = abs(_703);
        bool _765 = _763 >= 0.375;
        float _767 = fma(_479, -7.99999904632568359375, 7.99999904632568359375);
        float _769 = -_479;
        float _771 = _769 + 0.5;
        int _773 = _759 * 32768;
        float _775 = trunc(_557);
        float _777 = precise::max(_775, 0.0);
        uint _779 = uint(_777);
        float _781 = trunc(_569);
        float _783 = precise::max(_781, 0.0);
        uint _785 = uint(_783);
        int _787 = int(_779);
        if (!_663)
        {
            int _789 = int(_753) + 1;
            _755 = _789;
        }
        int _791 = _755;
        float _793 = fma(_481, -1.99999904632568359375, 1.99999904632568359375);
        float _795 = fma(_483, -1.99999904632568359375, 1.99999904632568359375);
        float _797 = abs(_741);
        bool _799 = _797 >= 0.375;
        float _801 = fma(_481, -7.99999904632568359375, 7.99999904632568359375);
        float _803 = -_481;
        float _805 = _803 + 0.5;
        float _807 = -_483;
        float _809 = _807 + 0.5;
        float _811 = trunc(_597);
        float _813 = precise::max(_811, 0.0);
        uint _815 = uint(_813);
        float _817 = trunc(_603);
        float _819 = precise::max(_817, 0.0);
        uint _821 = uint(_819);
        int _823 = int(_815);
        if (!_601)
        {
            int _825 = int(_785) + 1;
            _787 = _825;
        }
        int _827 = _787;
        float _829 = abs(_771);
        bool _831 = _829 >= 0.375;
        int _833 = _827 * 2097152;
        float _835 = trunc(_659);
        float _837 = precise::max(_835, 0.0);
        uint _839 = uint(_837);
        float _841 = trunc(_665);
        float _843 = precise::max(_841, 0.0);
        uint _845 = uint(_843);
        int _847 = int(_839);
        if (!_697)
        {
            int _849 = int(_821) + 1;
            _823 = _849;
        }
        int _851 = _823;
        float _853 = abs(_809);
        bool _855 = _853 >= 0.375;
        int _857 = _851 * 8;
        float _859 = trunc(_667);
        float _861 = precise::max(_859, 0.0);
        uint _863 = uint(_861);
        float _865 = trunc(_645);
        float _867 = precise::max(_865, 0.0);
        uint _869 = uint(_867);
        int _871 = int(_863);
        if (!_637)
        {
            int _873 = int(_845) + 1;
            _847 = _873;
        }
        int _875 = _847;
        float _877 = abs(_805);
        bool _879 = _877 >= 0.375;
        int _881 = _875 | _857;
        float _883 = trunc(_693);
        float _885 = precise::max(_883, 0.0);
        uint _887 = uint(_885);
        float _889 = trunc(_699);
        float _891 = precise::max(_889, 0.0);
        uint _893 = uint(_891);
        int _895 = int(_887);
        if (!_735)
        {
            int _897 = int(_869) + 1;
            _871 = _897;
        }
        int _899 = _871;
        int _901 = _899 * 64;
        float _903 = trunc(_731);
        float _905 = precise::max(_903, 0.0);
        uint _907 = uint(_905);
        float _909 = trunc(_737);
        float _911 = precise::max(_909, 0.0);
        uint _913 = uint(_911);
        int _915 = int(_907);
        if (!_765)
        {
            int _917 = int(_893) + 1;
            _895 = _917;
        }
        int _919 = _895;
        int _921 = _919 << 9;
        float _923 = trunc(_761);
        float _925 = precise::max(_923, 0.0);
        uint _927 = uint(_925);
        int _929 = _881 | _901;
        int _931 = _921 | _929;
        int _933 = _729 << 12;
        int _935 = _717 | _933;
        int _937 = _773 | _935;
        float _939 = trunc(_767);
        float _941 = precise::max(_939, 0.0);
        uint _943 = uint(_941);
        int _945 = int(_927);
        if (!_799)
        {
            int _947 = int(_913) + 1;
            _915 = _947;
        }
        int _949 = _915;
        int _951 = _949 << 12;
        int _953 = _791 * 262144;
        float _955 = trunc(_793);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        int _961 = _937 | _953;
        int _963 = _833 | _961;
        uint _965 = uint(int(uint(_963) >> uint(16)));
        float _967 = trunc(_801);
        float _969 = precise::max(_967, 0.0);
        uint _971 = uint(_969);
        int _973 = int(_959);
        _351 = int(_965);
        if (!_831)
        {
            int _975 = int(_943) + 1;
            _945 = _975;
        }
        int _977 = _945;
        int _979 = _977 << 15;
        float _981 = trunc(_795);
        float _983 = precise::max(_981, 0.0);
        uint _985 = uint(_983);
        int _987 = _931 | _951;
        int _989 = _979 | _987;
        float _991 = trunc(_705);
        float _993 = precise::max(_991, 0.0);
        uint _995 = uint(_993);
        int _997 = int(_985);
        _349 = _989;
        if (!_879)
        {
            int _999 = int(_971) + 1;
            _973 = _999;
        }
        int _1001 = _973;
        int _1003 = _1001 << 18;
        if (!_855)
        {
            int _1005 = int(_995) + 1;
            _997 = _1005;
        }
        int _1007 = _997;
        int _1009 = _1007 << 21;
        int _1011 = _989 | _1003;
        int _1013 = _1009 | _1011;
        int _1015 = _1013 << 8;
        uint _1017 = uint(int(uint(_1013) >> uint(8)));
        int _1019 = _963 << 16;
        int _1021 = 65280 & _1015;
        int _1023 = int(_965) | _1021;
        int _1025 = int(_1017) * 65536;
        _373 = _1019;
        _367 = _1025;
        _357 = _1023;
        _353 = int(_1017);
    }
    int _1027 = _373;
    int _1029 = _367;
    int _1031 = _357;
    int _1033 = _349;
    int _1035 = _351;
    int _1037 = _353;
    int _1039 = _1033;
    int _1041 = _1037;
    int _1043 = _1035;
    if (!_361)
    {
        _1039 = 0;
        _1041 = 0;
    }
    int _1045 = _1039;
    int _1047 = _1041;
    int _1049 = _1045;
    int _1051 = _1047;
    if (!_361)
    {
        _1043 = 0;
    }
    int _1053 = _1043;
    bool _1055 = !_361;
    int _1057 = _1053;
    if (!_1055)
    {
        float _1059 = -_300;
        float _1061 = _302 + _1059;
        float _1063 = -_300;
        float _1065 = _118 + _1063;
        float _1067 = -_300;
        float _1069 = _148 + _1067;
        float _1071 = -_300;
        float _1073 = _142 + _1071;
        float _1075 = -_300;
        float _1077 = _82 + _1075;
        float _1079 = 1.0 / _1061;
        float _1081 = -_300;
        float _1083 = _160 + _1081;
        float _1085 = -_300;
        float _1087 = _136 + _1085;
        float _1089 = -_300;
        float _1091 = _94 + _1089;
        float _1093 = -_300;
        float _1095 = _100 + _1093;
        float _1097 = -_300;
        float _1099 = _106 + _1097;
        float _1101 = -_300;
        float _1103 = _112 + _1101;
        float _1105 = -_300;
        float _1107 = _166 + _1105;
        float _1109 = -_300;
        float _1111 = _172 + _1109;
        float _1113 = _1065 * _1079;
        float _1115 = -_300;
        float _1117 = _124 + _1115;
        float _1119 = _1069 * _1079;
        float _1121 = _1073 * _1079;
        float _1123 = -_300;
        float _1125 = _130 + _1123;
        float _1127 = _1117 * _1079;
        float _1129 = -_300;
        float _1131 = _154 + _1129;
        float _1133 = _1077 * _1079;
        float _1135 = -_300;
        float _1137 = _88 + _1135;
        float _1139 = fma(_1121, -1.99999904632568359375, 1.99999904632568359375);
        float _1141 = _1131 * _1079;
        float _1143 = fma(_1121, -7.99999904632568359375, 7.99999904632568359375);
        float _1145 = _1125 * _1079;
        float _1147 = -_1121;
        float _1149 = _1147 + 0.5;
        float _1151 = fma(_1119, -1.99999904632568359375, 1.99999904632568359375);
        float _1153 = fma(_1119, -7.99999904632568359375, 7.99999904632568359375);
        float _1155 = _1137 * _1079;
        float _1157 = fma(_1145, -1.99999904632568359375, 1.99999904632568359375);
        float _1159 = fma(_1145, -7.99999904632568359375, 7.99999904632568359375);
        float _1161 = _1087 * _1079;
        float _1163 = abs(_1149);
        bool _1165 = _1163 >= 0.375;
        float _1167 = trunc(_1139);
        float _1169 = precise::max(_1167, 0.0);
        uint _1171 = uint(_1169);
        float _1173 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1175 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1177 = fma(_1155, -1.99999904632568359375, 1.99999904632568359375);
        float _1179 = fma(_1155, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = -_1119;
        float _1183 = _1181 + 0.5;
        float _1185 = fma(_1161, -1.99999904632568359375, 1.99999904632568359375);
        float _1187 = fma(_1161, -7.99999904632568359375, 7.99999904632568359375);
        float _1189 = trunc(_1143);
        float _1191 = precise::max(_1189, 0.0);
        uint _1193 = uint(_1191);
        float _1195 = _1091 * _1079;
        float _1197 = -_1145;
        float _1199 = _1197 + 0.5;
        float _1201 = _1095 * _1079;
        float _1203 = -_1133;
        float _1205 = _1203 + 0.5;
        float _1207 = -_1155;
        float _1209 = _1207 + 0.5;
        float _1211 = abs(_1183);
        bool _1213 = _1211 >= 0.375;
        float _1215 = fma(_1195, -1.99999904632568359375, 1.99999904632568359375);
        float _1217 = trunc(_1151);
        float _1219 = precise::max(_1217, 0.0);
        uint _1221 = uint(_1219);
        float _1223 = fma(_1195, -7.99999904632568359375, 7.99999904632568359375);
        float _1225 = _1099 * _1079;
        float _1227 = -_1161;
        float _1229 = _1227 + 0.5;
        float _1231 = abs(_1199);
        bool _1233 = _1231 >= 0.375;
        float _1235 = fma(_1201, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = fma(_1201, -7.99999904632568359375, 7.99999904632568359375);
        float _1239 = _1103 * _1079;
        float _1241 = trunc(_1153);
        float _1243 = precise::max(_1241, 0.0);
        uint _1245 = uint(_1243);
        float _1247 = abs(_1205);
        bool _1249 = _1247 >= 0.375;
        float _1251 = fma(_1225, -1.99999904632568359375, 1.99999904632568359375);
        float _1253 = abs(_1209);
        bool _1255 = _1253 >= 0.375;
        float _1257 = fma(_1225, -7.99999904632568359375, 7.99999904632568359375);
        float _1259 = -_1195;
        float _1261 = _1259 + 0.5;
        float _1263 = abs(_1229);
        bool _1265 = _1263 >= 0.375;
        float _1267 = fma(_1239, -1.99999904632568359375, 1.99999904632568359375);
        float _1269 = trunc(_1157);
        float _1271 = precise::max(_1269, 0.0);
        uint _1273 = uint(_1271);
        float _1275 = fma(_1239, -7.99999904632568359375, 7.99999904632568359375);
        float _1277 = -_1201;
        float _1279 = _1277 + 0.5;
        float _1281 = -_1225;
        float _1283 = _1281 + 0.5;
        float _1285 = abs(_1261);
        bool _1287 = _1285 >= 0.375;
        float _1289 = fma(_1113, -1.99999904632568359375, 1.99999904632568359375);
        float _1291 = fma(_1113, -7.99999904632568359375, 7.99999904632568359375);
        float _1293 = fma(_1127, -1.99999904632568359375, 1.99999904632568359375);
        float _1295 = trunc(_1159);
        float _1297 = precise::max(_1295, 0.0);
        uint _1299 = uint(_1297);
        float _1301 = fma(_1127, -7.99999904632568359375, 7.99999904632568359375);
        float _1303 = _1083 * _1079;
        int _1305 = int(_1171);
        int _1307 = int(_1221);
        int _1309 = int(_1273);
        if (!_1165)
        {
            int _1311 = int(_1193) + 1;
            _1305 = _1311;
        }
        int _1313 = _1305;
        float _1315 = -_1239;
        float _1317 = _1315 + 0.5;
        float _1319 = fma(_1141, -1.99999904632568359375, 1.99999904632568359375);
        float _1321 = fma(_1141, -7.99999904632568359375, 7.99999904632568359375);
        float _1323 = abs(_1279);
        bool _1325 = _1323 >= 0.375;
        float _1327 = trunc(_1173);
        float _1329 = precise::max(_1327, 0.0);
        uint _1331 = uint(_1329);
        float _1333 = _1107 * _1079;
        int _1335 = int(_1331);
        if (!_1213)
        {
            int _1337 = int(_1245) + 1;
            _1307 = _1337;
        }
        int _1339 = _1307;
        float _1341 = -_1127;
        float _1343 = _1341 + 0.5;
        float _1345 = -_1141;
        float _1347 = _1345 + 0.5;
        float _1349 = _1111 * _1079;
        float _1351 = abs(_1283);
        bool _1353 = _1351 >= 0.375;
        float _1355 = fma(_1303, -7.99999904632568359375, 7.99999904632568359375);
        float _1357 = trunc(_1175);
        float _1359 = precise::max(_1357, 0.0);
        uint _1361 = uint(_1359);
        if (!_1233)
        {
            int _1363 = int(_1299) + 1;
            _1309 = _1363;
        }
        int _1365 = _1309;
        float _1367 = -_1113;
        float _1369 = _1367 + 0.5;
        float _1371 = abs(_1317);
        bool _1373 = _1371 >= 0.375;
        float _1375 = fma(_1303, -1.99999904632568359375, 1.99999904632568359375);
        float _1377 = fma(_1333, -1.99999904632568359375, 1.99999904632568359375);
        float _1379 = fma(_1333, -7.99999904632568359375, 7.99999904632568359375);
        float _1381 = -_1303;
        float _1383 = _1381 + 0.5;
        float _1385 = trunc(_1177);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        float _1391 = fma(_1349, -1.99999904632568359375, 1.99999904632568359375);
        float _1393 = -_1333;
        float _1395 = _1393 + 0.5;
        int _1397 = _1339 << 3;
        int _1399 = _1313 | _1397;
        float _1401 = trunc(_1179);
        float _1403 = precise::max(_1401, 0.0);
        uint _1405 = uint(_1403);
        int _1407 = int(_1389);
        if (!_1249)
        {
            int _1409 = int(_1361) + 1;
            _1335 = _1409;
        }
        int _1411 = _1335;
        float _1413 = abs(_1343);
        bool _1415 = _1413 >= 0.375;
        float _1417 = trunc(_1185);
        float _1419 = precise::max(_1417, 0.0);
        uint _1421 = uint(_1419);
        float _1423 = trunc(_1187);
        float _1425 = precise::max(_1423, 0.0);
        uint _1427 = uint(_1425);
        int _1429 = int(_1421);
        if (!_1255)
        {
            int _1431 = int(_1405) + 1;
            _1407 = _1431;
        }
        int _1433 = _1407;
        float _1435 = abs(_1347);
        bool _1437 = _1435 >= 0.375;
        float _1439 = fma(_1349, -7.99999904632568359375, 7.99999904632568359375);
        float _1441 = -_1349;
        float _1443 = _1441 + 0.5;
        int _1445 = _1433 << 15;
        float _1447 = trunc(_1215);
        float _1449 = precise::max(_1447, 0.0);
        uint _1451 = uint(_1449);
        float _1453 = trunc(_1223);
        float _1455 = precise::max(_1453, 0.0);
        uint _1457 = uint(_1455);
        int _1459 = int(_1451);
        if (!_1265)
        {
            int _1461 = int(_1427) + 1;
            _1429 = _1461;
        }
        int _1463 = _1429;
        float _1465 = abs(_1369);
        bool _1467 = _1465 >= 0.375;
        int _1469 = _1463 << 9;
        float _1471 = trunc(_1235);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        float _1477 = trunc(_1237);
        float _1479 = precise::max(_1477, 0.0);
        uint _1481 = uint(_1479);
        int _1483 = int(_1475);
        if (!_1287)
        {
            int _1485 = int(_1457) + 1;
            _1459 = _1485;
        }
        int _1487 = _1459;
        float _1489 = abs(_1383);
        bool _1491 = _1489 >= 0.375;
        int _1493 = _1487 << 18;
        float _1495 = trunc(_1251);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        float _1501 = trunc(_1257);
        float _1503 = precise::max(_1501, 0.0);
        uint _1505 = uint(_1503);
        int _1507 = int(_1499);
        if (!_1325)
        {
            int _1509 = int(_1481) + 1;
            _1483 = _1509;
        }
        int _1511 = _1483;
        float _1513 = abs(_1395);
        bool _1515 = _1513 >= 0.375;
        int _1517 = _1511 << 21;
        float _1519 = trunc(_1267);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        float _1525 = trunc(_1275);
        float _1527 = precise::max(_1525, 0.0);
        uint _1529 = uint(_1527);
        int _1531 = int(_1523);
        if (!_1353)
        {
            int _1533 = int(_1505) + 1;
            _1507 = _1533;
        }
        int _1535 = _1507;
        float _1537 = abs(_1443);
        bool _1539 = _1537 >= 0.375;
        float _1541 = trunc(_1293);
        float _1543 = precise::max(_1541, 0.0);
        uint _1545 = uint(_1543);
        float _1547 = trunc(_1301);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        int _1553 = int(_1545);
        if (!_1373)
        {
            int _1555 = int(_1529) + 1;
            _1531 = _1555;
        }
        int _1557 = _1531;
        int _1559 = _1557 << 3;
        float _1561 = trunc(_1289);
        float _1563 = precise::max(_1561, 0.0);
        uint _1565 = uint(_1563);
        int _1567 = _1535 | _1559;
        float _1569 = trunc(_1291);
        float _1571 = precise::max(_1569, 0.0);
        uint _1573 = uint(_1571);
        int _1575 = int(_1565);
        if (!_1415)
        {
            int _1577 = int(_1551) + 1;
            _1553 = _1577;
        }
        int _1579 = _1553;
        int _1581 = _1365 * 64;
        int _1583 = _1579 * 512;
        int _1585 = _1399 | _1581;
        int _1587 = _1469 | _1585;
        float _1589 = trunc(_1319);
        float _1591 = precise::max(_1589, 0.0);
        uint _1593 = uint(_1591);
        int _1595 = _1411 << 12;
        int _1597 = _1587 | _1595;
        int _1599 = _1445 | _1597;
        float _1601 = trunc(_1321);
        float _1603 = precise::max(_1601, 0.0);
        uint _1605 = uint(_1603);
        int _1607 = int(_1593);
        if (!_1467)
        {
            int _1609 = int(_1573) + 1;
            _1575 = _1609;
        }
        int _1611 = _1575;
        int _1613 = _1599 | _1493;
        int _1615 = _1517 | _1613;
        int _1617 = _1611 << 6;
        float _1619 = trunc(_1375);
        float _1621 = precise::max(_1619, 0.0);
        uint _1623 = uint(_1621);
        int _1625 = _1567 | _1617;
        int _1627 = _1583 | _1625;
        float _1629 = trunc(_1355);
        float _1631 = precise::max(_1629, 0.0);
        uint _1633 = uint(_1631);
        int _1635 = int(_1623);
        if (!_1437)
        {
            int _1637 = int(_1605) + 1;
            _1607 = _1637;
        }
        int _1639 = _1607;
        int _1641 = _1639 * 4096;
        float _1643 = trunc(_1377);
        float _1645 = precise::max(_1643, 0.0);
        uint _1647 = uint(_1645);
        float _1649 = trunc(_1379);
        float _1651 = precise::max(_1649, 0.0);
        uint _1653 = uint(_1651);
        int _1655 = int(_1647);
        if (!_1491)
        {
            int _1657 = int(_1633) + 1;
            _1635 = _1657;
        }
        int _1659 = _1635;
        int _1661 = _1659 << 15;
        float _1663 = trunc(_1391);
        float _1665 = precise::max(_1663, 0.0);
        uint _1667 = uint(_1665);
        int _1669 = _1627 | _1641;
        int _1671 = _1661 | _1669;
        float _1673 = trunc(_1439);
        float _1675 = precise::max(_1673, 0.0);
        uint _1677 = uint(_1675);
        int _1679 = int(_1667);
        if (!_1515)
        {
            int _1681 = int(_1653) + 1;
            _1655 = _1681;
        }
        int _1683 = _1655;
        int _1685 = _1683 * 262144;
        if (!_1539)
        {
            int _1687 = int(_1677) + 1;
            _1679 = _1687;
        }
        int _1689 = _1679;
        uint _1691 = uint(int(uint(_1615) >> uint(16)));
        int _1693 = _1689 << 21;
        int _1695 = _1671 | _1685;
        int _1697 = _1693 | _1695;
        uint _1699 = uint(int(uint(_1697) >> uint(8)));
        int _1701 = _1697 * 256;
        int _1703 = _1615 << 16;
        int _1705 = int(_1699) << 16;
        int _1707 = 65280 & _1701;
        int _1709 = int(_1691) | _1707;
        _1049 = _1703;
        _1057 = _1705;
        _1051 = _1709;
    }
    int _1711 = _1049;
    int _1713 = _1057;
    int _1715 = _1051;
    int _1717 = _1027 | _339;
    int _1719 = _1029 | _1031;
    int _1721 = _1711 | _365;
    int _1723 = _1713 | _1715;
    out.m_32.x = as_type<float>(_1717);
    out.m_32.y = as_type<float>(_1719);
    out.m_32.z = as_type<float>(_1721);
    out.m_32.w = as_type<float>(_1723);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _39;
    float _61 = _59 * _45;
    float _63 = _59 * _51;
    float _65 = _59 * _57;
    float _67 = rint(_61);
    float _69 = precise::max(_67, 0.0);
    uint _72 = uint(_69);
    uint _74 = clamp(_72, 0u, 65535u);
    float3 _1783 = float3(_63, _65, float(int(_74)));
    float3 _1787 = select(_1783, float3(0.0), isnan(_1783));
    float2 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1787.xy, uint(rint(_1787.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1787.xy, uint(rint(_1787.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 1)).xy;
    float _80 = _78.x;
    float _82 = _78.y;
    float3 _1805 = float3(_63, _65, float(int(_74)));
    float3 _1807 = select(_1805, float3(0.0), isnan(_1805));
    float2 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1807.xy, uint(rint(_1807.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1807.xy, uint(rint(_1807.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1)).xy;
    float _86 = _84.x;
    float _88 = _84.y;
    float3 _1823 = float3(_63, _65, float(int(_74)));
    float3 _1825 = select(_1823, float3(0.0), isnan(_1823));
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1825.xy, uint(rint(_1825.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1825.xy, uint(rint(_1825.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 1)).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float3 _1841 = float3(_63, _65, float(int(_74)));
    float3 _1843 = select(_1841, float3(0.0), isnan(_1841));
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1843.xy, uint(rint(_1843.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1843.xy, uint(rint(_1843.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 1)).xy;
    float _98 = _96.x;
    float _100 = _96.y;
    float3 _1859 = float3(_63, _65, float(int(_74)));
    float3 _1861 = select(_1859, float3(0.0), isnan(_1859));
    float2 _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1861.xy, uint(rint(_1861.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1861.xy, uint(rint(_1861.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 2)).xy;
    float _104 = _102.x;
    float _106 = _102.y;
    float3 _1877 = float3(_63, _65, float(int(_74)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float2 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1879.xy, uint(rint(_1879.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1879.xy, uint(rint(_1879.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 2)).xy;
    float _110 = _108.x;
    float _112 = _108.y;
    float3 _1895 = float3(_63, _65, float(int(_74)));
    float3 _1897 = select(_1895, float3(0.0), isnan(_1895));
    float2 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1897.xy, uint(rint(_1897.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1897.xy, uint(rint(_1897.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2)).xy;
    float _116 = _114.x;
    float _118 = _114.y;
    float3 _1913 = float3(_63, _65, float(int(_74)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float2 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1915.xy, uint(rint(_1915.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1915.xy, uint(rint(_1915.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 2)).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    float3 _1931 = float3(_63, _65, float(int(_74)));
    float3 _1933 = select(_1931, float3(0.0), isnan(_1931));
    float2 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1933.xy, uint(rint(_1933.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1933.xy, uint(rint(_1933.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 0)).xy;
    float _128 = _126.x;
    float _130 = _126.y;
    float3 _1949 = float3(_63, _65, float(int(_74)));
    float3 _1951 = select(_1949, float3(0.0), isnan(_1949));
    float2 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1951.xy, uint(rint(_1951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1951.xy, uint(rint(_1951.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3, 0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float3 _1967 = float3(_63, _65, float(int(_74)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float2 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1969.xy, uint(rint(_1969.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1969.xy, uint(rint(_1969.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xy;
    float _140 = _138.x;
    float _142 = _138.y;
    float3 _1984 = float3(_63, _65, float(int(_74)));
    float3 _1986 = select(_1984, float3(0.0), isnan(_1984));
    float2 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1986.xy, uint(rint(_1986.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1986.xy, uint(rint(_1986.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 0)).xy;
    float _146 = _144.x;
    float _148 = _144.y;
    float3 _2002 = float3(_63, _65, float(int(_74)));
    float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
    float2 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2004.xy, uint(rint(_2004.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2004.xy, uint(rint(_2004.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(0, 3)).xy;
    float _152 = _150.x;
    float _154 = _150.y;
    float3 _2020 = float3(_63, _65, float(int(_74)));
    float3 _2022 = select(_2020, float3(0.0), isnan(_2020));
    float2 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2022.xy, uint(rint(_2022.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2022.xy, uint(rint(_2022.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(1, 3)).xy;
    float _158 = _156.x;
    float _160 = _156.y;
    float3 _2038 = float3(_63, _65, float(int(_74)));
    float3 _2040 = select(_2038, float3(0.0), isnan(_2038));
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2040.xy, uint(rint(_2040.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2040.xy, uint(rint(_2040.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(2, 3)).xy;
    float _164 = _162.x;
    float _166 = _162.y;
    float3 _2056 = float3(_63, _65, float(int(_74)));
    float3 _2058 = select(_2056, float3(0.0), isnan(_2056));
    float2 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2058.xy, uint(rint(_2058.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2058.xy, uint(rint(_2058.z)), level((*spvDescriptorSet0.fp_c3)._m0[1].x), int2(3)).xy;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = precise::min(_80, _86);
    float _176 = precise::min(_92, _98);
    float _178 = precise::max(_82, _88);
    float _180 = precise::min(_174, _176);
    float _182 = precise::max(_94, _100);
    float _184 = precise::min(_82, _88);
    float _186 = precise::min(_94, _100);
    float _188 = precise::max(_178, _182);
    float _190 = precise::min(_184, _186);
    float _192 = precise::max(_80, _86);
    float _194 = precise::max(_92, _98);
    float _196 = precise::max(_104, _110);
    float _198 = precise::max(_116, _122);
    float _200 = precise::min(_104, _110);
    float _202 = precise::min(_116, _122);
    float _204 = precise::max(_196, _198);
    float _206 = precise::min(_200, _202);
    float _208 = precise::max(_106, _112);
    float _210 = precise::max(_118, _124);
    float _212 = precise::max(_128, _134);
    float _214 = precise::max(_140, _146);
    float _216 = precise::min(_128, _134);
    float _218 = precise::min(_140, _146);
    float _220 = precise::max(_208, _210);
    float _222 = precise::min(_106, _112);
    float _224 = precise::min(_118, _124);
    float _226 = precise::max(_214, _212);
    float _228 = precise::min(_218, _216);
    float _230 = precise::max(_152, _158);
    float _232 = precise::max(_164, _170);
    float _234 = precise::min(_222, _224);
    float _236 = precise::max(_130, _136);
    float _238 = precise::max(_142, _148);
    float _240 = precise::max(_192, _194);
    float _242 = precise::max(_230, _232);
    float _244 = precise::max(_238, _236);
    float _246 = precise::max(_226, _240);
    float _248 = precise::max(_204, _242);
    float _250 = precise::min(_152, _158);
    float _252 = precise::min(_164, _170);
    float _254 = precise::min(_228, _180);
    float _256 = precise::max(_246, _248);
    float _258 = precise::min(_130, _136);
    float _260 = precise::min(_142, _148);
    float _262 = precise::min(_250, _252);
    float _264 = precise::min(_154, _160);
    float _266 = precise::min(_166, _172);
    float _268 = precise::max(_154, _160);
    float _270 = precise::max(_166, _172);
    float _272 = precise::min(_260, _258);
    float _274 = precise::min(_206, _262);
    float _276 = _256 * 255.0;
    float _278 = precise::min(_264, _266);
    float _280 = precise::max(_268, _270);
    float _282 = precise::min(_272, _190);
    float _284 = precise::min(_254, _274);
    float _286 = precise::min(_234, _278);
    float _288 = trunc(_276);
    float _290 = precise::max(_288, 0.0);
    uint _292 = uint(_290);
    float _294 = precise::max(_220, _280);
    float _296 = precise::max(_244, _188);
    float _298 = _284 * 255.0;
    float _300 = precise::min(_282, _286);
    float _302 = precise::max(_296, _294);
    float _304 = trunc(_298);
    float _306 = precise::max(_304, 0.0);
    uint _308 = uint(_306);
    float _310 = _300 * 255.0;
    float _312 = _302 * 255.0;
    float _314 = trunc(_310);
    float _316 = precise::max(_314, 0.0);
    uint _318 = uint(_316);
    float _320 = trunc(_312);
    float _322 = precise::max(_320, 0.0);
    uint _324 = uint(_322);
    bool _328 = _292 > _308;
    int _331 = int(_308) << 8;
    int _333 = _331 & 65280;
    int _335 = int(_318) * 256;
    int _337 = 255 & int(_292);
    int _339 = _333 | _337;
    int _341 = _335 & 65280;
    int _343 = _333;
    int _345 = int(_292);
    int _347 = int(_318);
    int _349 = _341;
    int _351 = as_type<int>(_284);
    int _353 = as_type<int>(_256);
    if (!_328)
    {
        _343 = 0;
    }
    int _355 = _343;
    int _357 = _355;
    if (!_328)
    {
        _345 = 0;
    }
    int _359 = _345;
    bool _361 = _324 > _318;
    int _363 = 255 & int(_324);
    int _365 = _341 | _363;
    int _367 = _359;
    if (!_328)
    {
        _347 = 0;
    }
    int _369 = _347;
    bool _371 = !_328;
    int _373 = _369;
    if (!_371)
    {
        float _375 = -_284;
        float _377 = _256 + _375;
        float _379 = -_284;
        float _381 = _140 + _379;
        float _383 = -_284;
        float _385 = _146 + _383;
        float _387 = -_284;
        float _389 = _128 + _387;
        float _391 = 1.0 / _377;
        float _393 = -_284;
        float _395 = _80 + _393;
        float _397 = -_284;
        float _399 = _134 + _397;
        float _401 = -_284;
        float _403 = _86 + _401;
        float _405 = -_284;
        float _407 = _92 + _405;
        float _409 = -_284;
        float _411 = _98 + _409;
        float _413 = -_284;
        float _415 = _104 + _413;
        float _417 = -_284;
        float _419 = _110 + _417;
        float _421 = -_284;
        float _423 = _116 + _421;
        float _425 = -_284;
        float _427 = _122 + _425;
        float _429 = -_284;
        float _431 = _152 + _429;
        float _433 = -_284;
        float _435 = _158 + _433;
        float _437 = -_284;
        float _439 = _164 + _437;
        float _441 = -_284;
        float _443 = _170 + _441;
        float _445 = _385 * _391;
        float _447 = _389 * _391;
        float _449 = _381 * _391;
        float _451 = _395 * _391;
        float _453 = fma(_445, -1.99999904632568359375, 1.99999904632568359375);
        float _455 = fma(_445, -7.99999904632568359375, 7.99999904632568359375);
        float _457 = fma(_447, -1.99999904632568359375, 1.99999904632568359375);
        float _459 = fma(_447, -7.99999904632568359375, 7.99999904632568359375);
        float _461 = _399 * _391;
        float _463 = _403 * _391;
        float _465 = _407 * _391;
        float _467 = _411 * _391;
        float _469 = _415 * _391;
        float _471 = _419 * _391;
        float _473 = _423 * _391;
        float _475 = _427 * _391;
        float _477 = _431 * _391;
        float _479 = _435 * _391;
        float _481 = _439 * _391;
        float _483 = _443 * _391;
        float _485 = fma(_449, -1.99999904632568359375, 1.99999904632568359375);
        float _487 = fma(_449, -7.99999904632568359375, 7.99999904632568359375);
        float _489 = fma(_451, -1.99999904632568359375, 1.99999904632568359375);
        float _491 = fma(_451, -7.99999904632568359375, 7.99999904632568359375);
        float _493 = -_445;
        float _495 = _493 + 0.5;
        float _497 = -_447;
        float _499 = _497 + 0.5;
        float _501 = -_451;
        float _503 = _501 + 0.5;
        float _505 = trunc(_453);
        float _507 = precise::max(_505, 0.0);
        uint _509 = uint(_507);
        float _511 = fma(_461, -1.99999904632568359375, 1.99999904632568359375);
        float _513 = fma(_461, -7.99999904632568359375, 7.99999904632568359375);
        float _515 = -_449;
        float _517 = _515 + 0.5;
        float _519 = abs(_495);
        bool _521 = _519 >= 0.375;
        float _523 = -_461;
        float _525 = _523 + 0.5;
        float _527 = abs(_499);
        bool _529 = _527 >= 0.375;
        float _531 = fma(_463, -7.99999904632568359375, 7.99999904632568359375);
        float _533 = trunc(_455);
        float _535 = precise::max(_533, 0.0);
        uint _537 = uint(_535);
        float _539 = abs(_503);
        bool _541 = _539 >= 0.375;
        float _543 = -_463;
        float _545 = _543 + 0.5;
        float _547 = abs(_517);
        bool _549 = _547 >= 0.375;
        float _551 = fma(_463, -1.99999904632568359375, 1.99999904632568359375);
        float _553 = abs(_525);
        bool _555 = _553 >= 0.375;
        float _557 = fma(_467, -1.99999904632568359375, 1.99999904632568359375);
        float _559 = abs(_545);
        bool _561 = _559 >= 0.375;
        float _563 = trunc(_457);
        float _565 = precise::max(_563, 0.0);
        uint _567 = uint(_565);
        float _569 = fma(_467, -7.99999904632568359375, 7.99999904632568359375);
        float _571 = fma(_465, -1.99999904632568359375, 1.99999904632568359375);
        float _573 = fma(_465, -7.99999904632568359375, 7.99999904632568359375);
        float _575 = -_467;
        float _577 = _575 + 0.5;
        float _579 = -_465;
        float _581 = _579 + 0.5;
        float _583 = trunc(_459);
        float _585 = precise::max(_583, 0.0);
        uint _587 = uint(_585);
        int _589 = int(_509);
        int _591 = int(_567);
        if (!_521)
        {
            int _593 = int(_537) + 1;
            _589 = _593;
        }
        int _595 = _589;
        float _597 = fma(_471, -1.99999904632568359375, 1.99999904632568359375);
        float _599 = abs(_577);
        bool _601 = _599 >= 0.375;
        float _603 = fma(_471, -7.99999904632568359375, 7.99999904632568359375);
        float _605 = -_471;
        float _607 = _605 + 0.5;
        int _609 = _595 << 3;
        float _611 = trunc(_485);
        float _613 = precise::max(_611, 0.0);
        uint _615 = uint(_613);
        float _617 = trunc(_487);
        float _619 = precise::max(_617, 0.0);
        uint _621 = uint(_619);
        int _623 = int(_615);
        if (!_529)
        {
            int _625 = int(_587) + 1;
            _591 = _625;
        }
        int _627 = _591;
        float _629 = -_469;
        float _631 = _629 + 0.5;
        int _633 = _627 << 6;
        float _635 = abs(_631);
        bool _637 = _635 >= 0.375;
        float _639 = trunc(_511);
        float _641 = precise::max(_639, 0.0);
        uint _643 = uint(_641);
        float _645 = fma(_473, -7.99999904632568359375, 7.99999904632568359375);
        float _647 = trunc(_513);
        float _649 = precise::max(_647, 0.0);
        uint _651 = uint(_649);
        int _653 = int(_643);
        if (!_549)
        {
            int _655 = int(_621) + 1;
            _623 = _655;
        }
        int _657 = _623;
        float _659 = fma(_469, -1.99999904632568359375, 1.99999904632568359375);
        float _661 = abs(_581);
        bool _663 = _661 >= 0.375;
        float _665 = fma(_469, -7.99999904632568359375, 7.99999904632568359375);
        float _667 = fma(_473, -1.99999904632568359375, 1.99999904632568359375);
        float _669 = -_473;
        float _671 = _669 + 0.5;
        int _673 = _657 | _609;
        float _675 = trunc(_489);
        float _677 = precise::max(_675, 0.0);
        uint _679 = uint(_677);
        float _681 = trunc(_491);
        float _683 = precise::max(_681, 0.0);
        uint _685 = uint(_683);
        int _687 = int(_679);
        if (!_555)
        {
            int _689 = int(_651) + 1;
            _653 = _689;
        }
        int _691 = _653;
        float _693 = fma(_475, -1.99999904632568359375, 1.99999904632568359375);
        float _695 = abs(_607);
        bool _697 = _695 >= 0.375;
        float _699 = fma(_475, -7.99999904632568359375, 7.99999904632568359375);
        float _701 = -_475;
        float _703 = _701 + 0.5;
        float _705 = fma(_483, -7.99999904632568359375, 7.99999904632568359375);
        int _707 = _691 << 9;
        float _709 = trunc(_551);
        float _711 = precise::max(_709, 0.0);
        uint _713 = uint(_711);
        int _715 = _673 | _633;
        int _717 = _707 | _715;
        float _719 = trunc(_531);
        float _721 = precise::max(_719, 0.0);
        uint _723 = uint(_721);
        int _725 = int(_713);
        if (!_541)
        {
            int _727 = int(_685) + 1;
            _687 = _727;
        }
        int _729 = _687;
        float _731 = fma(_477, -1.99999904632568359375, 1.99999904632568359375);
        float _733 = abs(_671);
        bool _735 = _733 >= 0.375;
        float _737 = fma(_477, -7.99999904632568359375, 7.99999904632568359375);
        float _739 = -_477;
        float _741 = _739 + 0.5;
        float _743 = trunc(_571);
        float _745 = precise::max(_743, 0.0);
        uint _747 = uint(_745);
        float _749 = trunc(_573);
        float _751 = precise::max(_749, 0.0);
        uint _753 = uint(_751);
        int _755 = int(_747);
        if (!_561)
        {
            int _757 = int(_723) + 1;
            _725 = _757;
        }
        int _759 = _725;
        float _761 = fma(_479, -1.99999904632568359375, 1.99999904632568359375);
        float _763 = abs(_703);
        bool _765 = _763 >= 0.375;
        float _767 = fma(_479, -7.99999904632568359375, 7.99999904632568359375);
        float _769 = -_479;
        float _771 = _769 + 0.5;
        int _773 = _759 * 32768;
        float _775 = trunc(_557);
        float _777 = precise::max(_775, 0.0);
        uint _779 = uint(_777);
        float _781 = trunc(_569);
        float _783 = precise::max(_781, 0.0);
        uint _785 = uint(_783);
        int _787 = int(_779);
        if (!_663)
        {
            int _789 = int(_753) + 1;
            _755 = _789;
        }
        int _791 = _755;
        float _793 = fma(_481, -1.99999904632568359375, 1.99999904632568359375);
        float _795 = fma(_483, -1.99999904632568359375, 1.99999904632568359375);
        float _797 = abs(_741);
        bool _799 = _797 >= 0.375;
        float _801 = fma(_481, -7.99999904632568359375, 7.99999904632568359375);
        float _803 = -_481;
        float _805 = _803 + 0.5;
        float _807 = -_483;
        float _809 = _807 + 0.5;
        float _811 = trunc(_597);
        float _813 = precise::max(_811, 0.0);
        uint _815 = uint(_813);
        float _817 = trunc(_603);
        float _819 = precise::max(_817, 0.0);
        uint _821 = uint(_819);
        int _823 = int(_815);
        if (!_601)
        {
            int _825 = int(_785) + 1;
            _787 = _825;
        }
        int _827 = _787;
        float _829 = abs(_771);
        bool _831 = _829 >= 0.375;
        int _833 = _827 * 2097152;
        float _835 = trunc(_659);
        float _837 = precise::max(_835, 0.0);
        uint _839 = uint(_837);
        float _841 = trunc(_665);
        float _843 = precise::max(_841, 0.0);
        uint _845 = uint(_843);
        int _847 = int(_839);
        if (!_697)
        {
            int _849 = int(_821) + 1;
            _823 = _849;
        }
        int _851 = _823;
        float _853 = abs(_809);
        bool _855 = _853 >= 0.375;
        int _857 = _851 * 8;
        float _859 = trunc(_667);
        float _861 = precise::max(_859, 0.0);
        uint _863 = uint(_861);
        float _865 = trunc(_645);
        float _867 = precise::max(_865, 0.0);
        uint _869 = uint(_867);
        int _871 = int(_863);
        if (!_637)
        {
            int _873 = int(_845) + 1;
            _847 = _873;
        }
        int _875 = _847;
        float _877 = abs(_805);
        bool _879 = _877 >= 0.375;
        int _881 = _875 | _857;
        float _883 = trunc(_693);
        float _885 = precise::max(_883, 0.0);
        uint _887 = uint(_885);
        float _889 = trunc(_699);
        float _891 = precise::max(_889, 0.0);
        uint _893 = uint(_891);
        int _895 = int(_887);
        if (!_735)
        {
            int _897 = int(_869) + 1;
            _871 = _897;
        }
        int _899 = _871;
        int _901 = _899 * 64;
        float _903 = trunc(_731);
        float _905 = precise::max(_903, 0.0);
        uint _907 = uint(_905);
        float _909 = trunc(_737);
        float _911 = precise::max(_909, 0.0);
        uint _913 = uint(_911);
        int _915 = int(_907);
        if (!_765)
        {
            int _917 = int(_893) + 1;
            _895 = _917;
        }
        int _919 = _895;
        int _921 = _919 << 9;
        float _923 = trunc(_761);
        float _925 = precise::max(_923, 0.0);
        uint _927 = uint(_925);
        int _929 = _881 | _901;
        int _931 = _921 | _929;
        int _933 = _729 << 12;
        int _935 = _717 | _933;
        int _937 = _773 | _935;
        float _939 = trunc(_767);
        float _941 = precise::max(_939, 0.0);
        uint _943 = uint(_941);
        int _945 = int(_927);
        if (!_799)
        {
            int _947 = int(_913) + 1;
            _915 = _947;
        }
        int _949 = _915;
        int _951 = _949 << 12;
        int _953 = _791 * 262144;
        float _955 = trunc(_793);
        float _957 = precise::max(_955, 0.0);
        uint _959 = uint(_957);
        int _961 = _937 | _953;
        int _963 = _833 | _961;
        uint _965 = uint(int(uint(_963) >> uint(16)));
        float _967 = trunc(_801);
        float _969 = precise::max(_967, 0.0);
        uint _971 = uint(_969);
        int _973 = int(_959);
        _351 = int(_965);
        if (!_831)
        {
            int _975 = int(_943) + 1;
            _945 = _975;
        }
        int _977 = _945;
        int _979 = _977 << 15;
        float _981 = trunc(_795);
        float _983 = precise::max(_981, 0.0);
        uint _985 = uint(_983);
        int _987 = _931 | _951;
        int _989 = _979 | _987;
        float _991 = trunc(_705);
        float _993 = precise::max(_991, 0.0);
        uint _995 = uint(_993);
        int _997 = int(_985);
        _349 = _989;
        if (!_879)
        {
            int _999 = int(_971) + 1;
            _973 = _999;
        }
        int _1001 = _973;
        int _1003 = _1001 << 18;
        if (!_855)
        {
            int _1005 = int(_995) + 1;
            _997 = _1005;
        }
        int _1007 = _997;
        int _1009 = _1007 << 21;
        int _1011 = _989 | _1003;
        int _1013 = _1009 | _1011;
        int _1015 = _1013 << 8;
        uint _1017 = uint(int(uint(_1013) >> uint(8)));
        int _1019 = _963 << 16;
        int _1021 = 65280 & _1015;
        int _1023 = int(_965) | _1021;
        int _1025 = int(_1017) * 65536;
        _373 = _1019;
        _367 = _1025;
        _357 = _1023;
        _353 = int(_1017);
    }
    int _1027 = _373;
    int _1029 = _367;
    int _1031 = _357;
    int _1033 = _349;
    int _1035 = _351;
    int _1037 = _353;
    int _1039 = _1033;
    int _1041 = _1037;
    int _1043 = _1035;
    if (!_361)
    {
        _1039 = 0;
        _1041 = 0;
    }
    int _1045 = _1039;
    int _1047 = _1041;
    int _1049 = _1045;
    int _1051 = _1047;
    if (!_361)
    {
        _1043 = 0;
    }
    int _1053 = _1043;
    bool _1055 = !_361;
    int _1057 = _1053;
    if (!_1055)
    {
        float _1059 = -_300;
        float _1061 = _302 + _1059;
        float _1063 = -_300;
        float _1065 = _118 + _1063;
        float _1067 = -_300;
        float _1069 = _148 + _1067;
        float _1071 = -_300;
        float _1073 = _142 + _1071;
        float _1075 = -_300;
        float _1077 = _82 + _1075;
        float _1079 = 1.0 / _1061;
        float _1081 = -_300;
        float _1083 = _160 + _1081;
        float _1085 = -_300;
        float _1087 = _136 + _1085;
        float _1089 = -_300;
        float _1091 = _94 + _1089;
        float _1093 = -_300;
        float _1095 = _100 + _1093;
        float _1097 = -_300;
        float _1099 = _106 + _1097;
        float _1101 = -_300;
        float _1103 = _112 + _1101;
        float _1105 = -_300;
        float _1107 = _166 + _1105;
        float _1109 = -_300;
        float _1111 = _172 + _1109;
        float _1113 = _1065 * _1079;
        float _1115 = -_300;
        float _1117 = _124 + _1115;
        float _1119 = _1069 * _1079;
        float _1121 = _1073 * _1079;
        float _1123 = -_300;
        float _1125 = _130 + _1123;
        float _1127 = _1117 * _1079;
        float _1129 = -_300;
        float _1131 = _154 + _1129;
        float _1133 = _1077 * _1079;
        float _1135 = -_300;
        float _1137 = _88 + _1135;
        float _1139 = fma(_1121, -1.99999904632568359375, 1.99999904632568359375);
        float _1141 = _1131 * _1079;
        float _1143 = fma(_1121, -7.99999904632568359375, 7.99999904632568359375);
        float _1145 = _1125 * _1079;
        float _1147 = -_1121;
        float _1149 = _1147 + 0.5;
        float _1151 = fma(_1119, -1.99999904632568359375, 1.99999904632568359375);
        float _1153 = fma(_1119, -7.99999904632568359375, 7.99999904632568359375);
        float _1155 = _1137 * _1079;
        float _1157 = fma(_1145, -1.99999904632568359375, 1.99999904632568359375);
        float _1159 = fma(_1145, -7.99999904632568359375, 7.99999904632568359375);
        float _1161 = _1087 * _1079;
        float _1163 = abs(_1149);
        bool _1165 = _1163 >= 0.375;
        float _1167 = trunc(_1139);
        float _1169 = precise::max(_1167, 0.0);
        uint _1171 = uint(_1169);
        float _1173 = fma(_1133, -1.99999904632568359375, 1.99999904632568359375);
        float _1175 = fma(_1133, -7.99999904632568359375, 7.99999904632568359375);
        float _1177 = fma(_1155, -1.99999904632568359375, 1.99999904632568359375);
        float _1179 = fma(_1155, -7.99999904632568359375, 7.99999904632568359375);
        float _1181 = -_1119;
        float _1183 = _1181 + 0.5;
        float _1185 = fma(_1161, -1.99999904632568359375, 1.99999904632568359375);
        float _1187 = fma(_1161, -7.99999904632568359375, 7.99999904632568359375);
        float _1189 = trunc(_1143);
        float _1191 = precise::max(_1189, 0.0);
        uint _1193 = uint(_1191);
        float _1195 = _1091 * _1079;
        float _1197 = -_1145;
        float _1199 = _1197 + 0.5;
        float _1201 = _1095 * _1079;
        float _1203 = -_1133;
        float _1205 = _1203 + 0.5;
        float _1207 = -_1155;
        float _1209 = _1207 + 0.5;
        float _1211 = abs(_1183);
        bool _1213 = _1211 >= 0.375;
        float _1215 = fma(_1195, -1.99999904632568359375, 1.99999904632568359375);
        float _1217 = trunc(_1151);
        float _1219 = precise::max(_1217, 0.0);
        uint _1221 = uint(_1219);
        float _1223 = fma(_1195, -7.99999904632568359375, 7.99999904632568359375);
        float _1225 = _1099 * _1079;
        float _1227 = -_1161;
        float _1229 = _1227 + 0.5;
        float _1231 = abs(_1199);
        bool _1233 = _1231 >= 0.375;
        float _1235 = fma(_1201, -1.99999904632568359375, 1.99999904632568359375);
        float _1237 = fma(_1201, -7.99999904632568359375, 7.99999904632568359375);
        float _1239 = _1103 * _1079;
        float _1241 = trunc(_1153);
        float _1243 = precise::max(_1241, 0.0);
        uint _1245 = uint(_1243);
        float _1247 = abs(_1205);
        bool _1249 = _1247 >= 0.375;
        float _1251 = fma(_1225, -1.99999904632568359375, 1.99999904632568359375);
        float _1253 = abs(_1209);
        bool _1255 = _1253 >= 0.375;
        float _1257 = fma(_1225, -7.99999904632568359375, 7.99999904632568359375);
        float _1259 = -_1195;
        float _1261 = _1259 + 0.5;
        float _1263 = abs(_1229);
        bool _1265 = _1263 >= 0.375;
        float _1267 = fma(_1239, -1.99999904632568359375, 1.99999904632568359375);
        float _1269 = trunc(_1157);
        float _1271 = precise::max(_1269, 0.0);
        uint _1273 = uint(_1271);
        float _1275 = fma(_1239, -7.99999904632568359375, 7.99999904632568359375);
        float _1277 = -_1201;
        float _1279 = _1277 + 0.5;
        float _1281 = -_1225;
        float _1283 = _1281 + 0.5;
        float _1285 = abs(_1261);
        bool _1287 = _1285 >= 0.375;
        float _1289 = fma(_1113, -1.99999904632568359375, 1.99999904632568359375);
        float _1291 = fma(_1113, -7.99999904632568359375, 7.99999904632568359375);
        float _1293 = fma(_1127, -1.99999904632568359375, 1.99999904632568359375);
        float _1295 = trunc(_1159);
        float _1297 = precise::max(_1295, 0.0);
        uint _1299 = uint(_1297);
        float _1301 = fma(_1127, -7.99999904632568359375, 7.99999904632568359375);
        float _1303 = _1083 * _1079;
        int _1305 = int(_1171);
        int _1307 = int(_1221);
        int _1309 = int(_1273);
        if (!_1165)
        {
            int _1311 = int(_1193) + 1;
            _1305 = _1311;
        }
        int _1313 = _1305;
        float _1315 = -_1239;
        float _1317 = _1315 + 0.5;
        float _1319 = fma(_1141, -1.99999904632568359375, 1.99999904632568359375);
        float _1321 = fma(_1141, -7.99999904632568359375, 7.99999904632568359375);
        float _1323 = abs(_1279);
        bool _1325 = _1323 >= 0.375;
        float _1327 = trunc(_1173);
        float _1329 = precise::max(_1327, 0.0);
        uint _1331 = uint(_1329);
        float _1333 = _1107 * _1079;
        int _1335 = int(_1331);
        if (!_1213)
        {
            int _1337 = int(_1245) + 1;
            _1307 = _1337;
        }
        int _1339 = _1307;
        float _1341 = -_1127;
        float _1343 = _1341 + 0.5;
        float _1345 = -_1141;
        float _1347 = _1345 + 0.5;
        float _1349 = _1111 * _1079;
        float _1351 = abs(_1283);
        bool _1353 = _1351 >= 0.375;
        float _1355 = fma(_1303, -7.99999904632568359375, 7.99999904632568359375);
        float _1357 = trunc(_1175);
        float _1359 = precise::max(_1357, 0.0);
        uint _1361 = uint(_1359);
        if (!_1233)
        {
            int _1363 = int(_1299) + 1;
            _1309 = _1363;
        }
        int _1365 = _1309;
        float _1367 = -_1113;
        float _1369 = _1367 + 0.5;
        float _1371 = abs(_1317);
        bool _1373 = _1371 >= 0.375;
        float _1375 = fma(_1303, -1.99999904632568359375, 1.99999904632568359375);
        float _1377 = fma(_1333, -1.99999904632568359375, 1.99999904632568359375);
        float _1379 = fma(_1333, -7.99999904632568359375, 7.99999904632568359375);
        float _1381 = -_1303;
        float _1383 = _1381 + 0.5;
        float _1385 = trunc(_1177);
        float _1387 = precise::max(_1385, 0.0);
        uint _1389 = uint(_1387);
        float _1391 = fma(_1349, -1.99999904632568359375, 1.99999904632568359375);
        float _1393 = -_1333;
        float _1395 = _1393 + 0.5;
        int _1397 = _1339 << 3;
        int _1399 = _1313 | _1397;
        float _1401 = trunc(_1179);
        float _1403 = precise::max(_1401, 0.0);
        uint _1405 = uint(_1403);
        int _1407 = int(_1389);
        if (!_1249)
        {
            int _1409 = int(_1361) + 1;
            _1335 = _1409;
        }
        int _1411 = _1335;
        float _1413 = abs(_1343);
        bool _1415 = _1413 >= 0.375;
        float _1417 = trunc(_1185);
        float _1419 = precise::max(_1417, 0.0);
        uint _1421 = uint(_1419);
        float _1423 = trunc(_1187);
        float _1425 = precise::max(_1423, 0.0);
        uint _1427 = uint(_1425);
        int _1429 = int(_1421);
        if (!_1255)
        {
            int _1431 = int(_1405) + 1;
            _1407 = _1431;
        }
        int _1433 = _1407;
        float _1435 = abs(_1347);
        bool _1437 = _1435 >= 0.375;
        float _1439 = fma(_1349, -7.99999904632568359375, 7.99999904632568359375);
        float _1441 = -_1349;
        float _1443 = _1441 + 0.5;
        int _1445 = _1433 << 15;
        float _1447 = trunc(_1215);
        float _1449 = precise::max(_1447, 0.0);
        uint _1451 = uint(_1449);
        float _1453 = trunc(_1223);
        float _1455 = precise::max(_1453, 0.0);
        uint _1457 = uint(_1455);
        int _1459 = int(_1451);
        if (!_1265)
        {
            int _1461 = int(_1427) + 1;
            _1429 = _1461;
        }
        int _1463 = _1429;
        float _1465 = abs(_1369);
        bool _1467 = _1465 >= 0.375;
        int _1469 = _1463 << 9;
        float _1471 = trunc(_1235);
        float _1473 = precise::max(_1471, 0.0);
        uint _1475 = uint(_1473);
        float _1477 = trunc(_1237);
        float _1479 = precise::max(_1477, 0.0);
        uint _1481 = uint(_1479);
        int _1483 = int(_1475);
        if (!_1287)
        {
            int _1485 = int(_1457) + 1;
            _1459 = _1485;
        }
        int _1487 = _1459;
        float _1489 = abs(_1383);
        bool _1491 = _1489 >= 0.375;
        int _1493 = _1487 << 18;
        float _1495 = trunc(_1251);
        float _1497 = precise::max(_1495, 0.0);
        uint _1499 = uint(_1497);
        float _1501 = trunc(_1257);
        float _1503 = precise::max(_1501, 0.0);
        uint _1505 = uint(_1503);
        int _1507 = int(_1499);
        if (!_1325)
        {
            int _1509 = int(_1481) + 1;
            _1483 = _1509;
        }
        int _1511 = _1483;
        float _1513 = abs(_1395);
        bool _1515 = _1513 >= 0.375;
        int _1517 = _1511 << 21;
        float _1519 = trunc(_1267);
        float _1521 = precise::max(_1519, 0.0);
        uint _1523 = uint(_1521);
        float _1525 = trunc(_1275);
        float _1527 = precise::max(_1525, 0.0);
        uint _1529 = uint(_1527);
        int _1531 = int(_1523);
        if (!_1353)
        {
            int _1533 = int(_1505) + 1;
            _1507 = _1533;
        }
        int _1535 = _1507;
        float _1537 = abs(_1443);
        bool _1539 = _1537 >= 0.375;
        float _1541 = trunc(_1293);
        float _1543 = precise::max(_1541, 0.0);
        uint _1545 = uint(_1543);
        float _1547 = trunc(_1301);
        float _1549 = precise::max(_1547, 0.0);
        uint _1551 = uint(_1549);
        int _1553 = int(_1545);
        if (!_1373)
        {
            int _1555 = int(_1529) + 1;
            _1531 = _1555;
        }
        int _1557 = _1531;
        int _1559 = _1557 << 3;
        float _1561 = trunc(_1289);
        float _1563 = precise::max(_1561, 0.0);
        uint _1565 = uint(_1563);
        int _1567 = _1535 | _1559;
        float _1569 = trunc(_1291);
        float _1571 = precise::max(_1569, 0.0);
        uint _1573 = uint(_1571);
        int _1575 = int(_1565);
        if (!_1415)
        {
            int _1577 = int(_1551) + 1;
            _1553 = _1577;
        }
        int _1579 = _1553;
        int _1581 = _1365 * 64;
        int _1583 = _1579 * 512;
        int _1585 = _1399 | _1581;
        int _1587 = _1469 | _1585;
        float _1589 = trunc(_1319);
        float _1591 = precise::max(_1589, 0.0);
        uint _1593 = uint(_1591);
        int _1595 = _1411 << 12;
        int _1597 = _1587 | _1595;
        int _1599 = _1445 | _1597;
        float _1601 = trunc(_1321);
        float _1603 = precise::max(_1601, 0.0);
        uint _1605 = uint(_1603);
        int _1607 = int(_1593);
        if (!_1467)
        {
            int _1609 = int(_1573) + 1;
            _1575 = _1609;
        }
        int _1611 = _1575;
        int _1613 = _1599 | _1493;
        int _1615 = _1517 | _1613;
        int _1617 = _1611 << 6;
        float _1619 = trunc(_1375);
        float _1621 = precise::max(_1619, 0.0);
        uint _1623 = uint(_1621);
        int _1625 = _1567 | _1617;
        int _1627 = _1583 | _1625;
        float _1629 = trunc(_1355);
        float _1631 = precise::max(_1629, 0.0);
        uint _1633 = uint(_1631);
        int _1635 = int(_1623);
        if (!_1437)
        {
            int _1637 = int(_1605) + 1;
            _1607 = _1637;
        }
        int _1639 = _1607;
        int _1641 = _1639 * 4096;
        float _1643 = trunc(_1377);
        float _1645 = precise::max(_1643, 0.0);
        uint _1647 = uint(_1645);
        float _1649 = trunc(_1379);
        float _1651 = precise::max(_1649, 0.0);
        uint _1653 = uint(_1651);
        int _1655 = int(_1647);
        if (!_1491)
        {
            int _1657 = int(_1633) + 1;
            _1635 = _1657;
        }
        int _1659 = _1635;
        int _1661 = _1659 << 15;
        float _1663 = trunc(_1391);
        float _1665 = precise::max(_1663, 0.0);
        uint _1667 = uint(_1665);
        int _1669 = _1627 | _1641;
        int _1671 = _1661 | _1669;
        float _1673 = trunc(_1439);
        float _1675 = precise::max(_1673, 0.0);
        uint _1677 = uint(_1675);
        int _1679 = int(_1667);
        if (!_1515)
        {
            int _1681 = int(_1653) + 1;
            _1655 = _1681;
        }
        int _1683 = _1655;
        int _1685 = _1683 * 262144;
        if (!_1539)
        {
            int _1687 = int(_1677) + 1;
            _1679 = _1687;
        }
        int _1689 = _1679;
        uint _1691 = uint(int(uint(_1615) >> uint(16)));
        int _1693 = _1689 << 21;
        int _1695 = _1671 | _1685;
        int _1697 = _1693 | _1695;
        uint _1699 = uint(int(uint(_1697) >> uint(8)));
        int _1701 = _1697 * 256;
        int _1703 = _1615 << 16;
        int _1705 = int(_1699) << 16;
        int _1707 = 65280 & _1701;
        int _1709 = int(_1691) | _1707;
        _1049 = _1703;
        _1057 = _1705;
        _1051 = _1709;
    }
    int _1711 = _1049;
    int _1713 = _1057;
    int _1715 = _1051;
    int _1717 = _1027 | _339;
    int _1719 = _1029 | _1031;
    int _1721 = _1711 | _365;
    int _1723 = _1713 | _1715;
    out.m_32.x = as_type<float>(_1717);
    out.m_32.y = as_type<float>(_1719);
    out.m_32.z = as_type<float>(_1721);
    out.m_32.w = as_type<float>(_1723);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

