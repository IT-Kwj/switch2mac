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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_16 [[id(8)]];
    sampler vp_t_tcb_16Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d_array<float> vp_t_tcb_14 [[id(14)]];
    sampler vp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_107 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_95 [[user(locn7)]];
    float4 m_99 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_105 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_103 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_73 [[attribute(3)]];
    float4 m_83 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_89 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
    float4 m_87 [[attribute(10)]];
    float4 m_91 [[attribute(11)]];
    float4 m_75 [[attribute(12)]];
    float4 m_77 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3132 = false;
    bool _523 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_142);
        out.gl_Position.z = _3418;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_61.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3482 = as_type<float>(_176);
        out.gl_Position.z = _3482;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = 1.0 / _148;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _152 * _178;
    bool _184 = !_180;
    float _202;
    if (!_184)
    {
        float _186 = in.m_63.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _182;
    }
    _204 = false;
    float _206 = _202;
    float _208 = in.m_63.x;
    float _210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _206 + _212;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_206);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _232;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _254 = _210 * _208;
    float _256 = _216 * _208;
    float _258 = 1.0 / _236;
    float _260 = _214 * _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = trunc(_254);
    int _268 = int(_266);
    bool _270 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_206);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_206);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = trunc(_256);
    int _296 = int(_294);
    int _298 = _268 << 4;
    int _300 = _298 + 1968;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _206 + _302;
    float _306 = 1.0 / _264;
    int _308 = _300 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = _304 * _258;
    float _321 = -_228;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = _206 + _325;
    int _329 = _296 << 4;
    int _331 = _329 + 1712;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = _280 * _323;
    float _339 = -_280;
    float _341 = _339 + 1.0;
    uint _343 = uint(int(uint(_300) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _359;
    float _363 = fma(_335, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _292 * _341;
    float _367 = -_292;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_361, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _377 = _327 * _306;
    uint _379 = uint(int(uint(_331) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = fma(_373, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _397;
    int _401 = _331 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    uint _405 = uint(int(uint(int(_403)) >> uint(2)));
    int _407 = int(_403) & 3;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[int(_405)][_407];
    float _411 = _248 * _369;
    float _413 = _375 * _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _419 = _395 * _411;
    float _421 = _363 * _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_417, _319, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -_248;
    float _435 = _433 + 1.0;
    float _437 = fma(_425, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _443 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _445 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _413);
    float _447 = fma(_439, _365, _441);
    float _449 = fma(_437, _365, _443);
    float _451 = fma(_399, _377, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _453 = _357 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _455 = _349 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _459 = _317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_467, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _463;
    out.m_65.y = _461;
    out.m_65.z = _469;
    float _485 = fma(_477, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = _409 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_427, _365, _445);
    float _491 = fma(_479, _337, _447);
    float _493 = fma(_485, _337, _449);
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = fma(_451, _337, _489);
    float _499 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].x, _491);
    float _501 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].y, _493);
    out.m_67.x = _481;
    out.m_67.y = _483;
    out.m_67.z = _495;
    out.m_67.w = _457;
    float _503 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].z, _497);
    bool _505 = !_252;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _509 = _208 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[14].x, _152);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _182;
    }
    _523 = false;
    float _525 = _521;
    float _527 = in.m_56.x;
    float _529 = in.m_56.y;
    float _531 = in.m_56.z;
    float _533 = in.m_69.x;
    float _535 = in.m_69.y;
    float _537 = in.m_69.z;
    float _539 = in.m_69.w;
    float _541 = in.m_71.x;
    float _543 = in.m_71.y;
    float _545 = in.m_71.z;
    float _547 = in.m_71.w;
    float _549 = in.m_73.x;
    float _551 = in.m_73.y;
    float _553 = in.m_73.z;
    float _555 = in.m_73.w;
    float _557 = in.m_63.w;
    float _559 = in.m_75.y;
    float _561 = in.m_75.x;
    float _563 = _529 * _535;
    float _565 = in.m_63.y;
    float _567 = _529 * _543;
    float _569 = fma(_527, _533, _563);
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _573 = _529 * _551;
    float _575 = fma(_527, _541, _567);
    float _577 = fma(_531, _537, _569);
    float _579 = fma(_527, _549, _573);
    float _581 = fma(_531, _545, _575);
    float _583 = _577 + _539;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _587 = _585 != 0;
    float _589 = fma(_531, _553, _579);
    float _591 = in.m_63.z;
    float _593 = _581 + _547;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _583 + _595;
    bool _599 = _557 > 0.5;
    float _601 = _589 + _555;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _593 + _603;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _601 + _613;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _619 = _617 != 0;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _625 = _623 != 0;
    float _627 = -_559;
    float _629 = _627 + 1.0;
    float _631 = _569;
    float _633 = _575;
    float _635 = _559;
    int _637 = as_type<int>(_531);
    bool _639 = _619;
    float _641 = _629;
    if (!_587)
    {
        _631 = _561;
    }
    float _643 = _631;
    float _645 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    bool _647 = _565 > 0.5;
    float _649 = in.m_77.w;
    int _651 = _599 ? as_type<int>(_629) : as_type<int>(_559);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = _643;
    int _657 = _651;
    bool _659 = _647;
    if (!_587)
    {
        _633 = _643;
    }
    float _661 = _633;
    bool _663 = _645 >= 0.0;
    float _665 = _597 * _597;
    float _667 = _661;
    if (_587)
    {
        _655 = _561;
    }
    float _669 = _655;
    float _671 = _619 ? as_type<float>(_651) : _559;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _675 = fma(_605, _605, _665);
    if (_625)
    {
        float _677 = _647 ? _629 : _559;
        _635 = _677;
    }
    float _679 = _635;
    if (_587)
    {
        float _681 = -_669;
        float _683 = _681 + 1.0;
        _657 = as_type<int>(_683);
    }
    int _685 = _657;
    float _687 = as_type<float>(_685);
    if (_611)
    {
        float _689 = -_669;
        float _691 = _689 + 1.0;
        _637 = as_type<int>(_691);
    }
    int _693 = _637;
    if (_587)
    {
        bool _695 = _208 > 0.5;
        _659 = _695;
    }
    bool _697 = _659;
    float _699 = fma(_615, _615, _675);
    if (_611)
    {
        bool _701 = _591 > 0.5;
        _639 = _701;
    }
    bool _703 = _639;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_611)
    {
        _641 = _669;
    }
    float _707 = _641;
    float _709 = _671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _711 = _707;
    if (_587)
    {
        float _713 = _697 ? as_type<float>(_685) : _669;
        _667 = _713;
    }
    float _715 = _667;
    if (_663)
    {
        out.m_59.x = 0.0;
    }
    if (_611)
    {
        float _717 = _703 ? as_type<float>(_693) : _669;
        _711 = _717;
    }
    float _719 = _711;
    float _721 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _723 = _687;
    float _725 = rsqrt(_699);
    float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _731 = _709 * _673;
    float _733 = _721 * _653;
    float _735 = _727 * _571;
    int _737 = as_type<int>(_723);
    if (_663)
    {
        float _739 = _723 * 5.0;
        _737 = as_type<int>(_739);
    }
    int _741 = _737;
    float _743 = _729 * _705;
    out.m_79.w = _649;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    out.m_81.x = _735;
    out.m_81.y = _733;
    out.m_81.z = _743;
    out.m_81.w = _731;
    bool _757 = !_747;
    int _759 = _757 ? 0 : 1;
    float _761 = as_type<float>(_741);
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4469 = as_type<float>(_741);
        out.gl_Position.z = _4469;
    }
    bool _763 = !_751;
    int _765 = _763 ? 0 : 1;
    float _767 = _597 * _725;
    bool _769 = !_755;
    int _771 = _769 ? 0 : 1;
    float _773 = _605 * _725;
    float _775 = _767;
    if (_663)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _777 = -_767;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _781 = _615 * _725;
    float _783 = -_773;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _779 + _787;
    float _791 = -_781;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = _785 + _795;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _803 = _793 + _801;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _799);
    float _807 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _809 = _807 >= 0.0;
    if (_809)
    {
        _761 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _811 = _761;
    int _813 = as_type<int>(_811);
    if (_809)
    {
        out.m_59.x = 0.0;
    }
    if (_809)
    {
        float _815 = _811 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    if (_809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4574 = as_type<float>(_817);
        out.gl_Position.z = _4574;
    }
    if (_809)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _819 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _821 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _823 = floor(_819);
    float _825 = floor(_821);
    float _827 = -_823;
    float _829 = _819 + _827;
    float _831 = -_825;
    float _833 = _821 + _831;
    float2 _4610 = float2(_829, _833);
    float _835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).x;
    float _837 = _208 * 2.0;
    float _839 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _841 = log2(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _859 = 1.0 / _845;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _869 = -_767;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    bool _873 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _875 = isnan(_525);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = _841 * _152;
    float _887 = 1.0 / _857;
    float _889 = -_781;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    bool _893 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _895 = isnan(_525);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_883;
    float _907 = _905 + 1.0;
    int _909 = abs(_759);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _915 = floor(_837);
    float _917 = 1.0 / _849;
    float _919 = _867 * _887;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _921;
    float _925 = _565 * 2.0;
    float _927 = 1.0 / _853;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _937;
    bool _941 = _915 > 0.0;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _947 = _915 >= 0.0;
    bool _949 = isnan(_915);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = 1.0 / _913;
    float _959 = _591 * 2.0;
    float _961 = _939 * _917;
    float _963 = _945 * _859;
    bool _965 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _967 = isnan(_525);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    int _977 = _955 ? 0 : 1;
    float _979 = 1.0 / _931;
    float _981 = _863 * _927;
    bool _983 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _991 = _987 || _989;
    float _993 = 1.0 / _935;
    float _995 = _923 * _957;
    float _997 = _208 + _591;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1007 = floor(_959);
    float _1009 = _565 + _591;
    float _1011 = _1001 * _979;
    float _1013 = _997 + (-1.0);
    float _1015 = _591 + (-0.5);
    float _1017 = _1009 + (-1.0);
    float _1019 = _208 + _565;
    float _1021 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1023 = floor(_925);
    float _1025 = _1005 * _993;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1029 = _525 + _1027;
    float _1031 = _1019 + (-1.0);
    float _1033 = fma(_961, _1029, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1035 = _1007 > 0.0;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = _1007 >= 0.0;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1053 = _525 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1057 = _525 + _1055;
    bool _1059 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_525);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = exp2(_885);
    bool _1073 = _1023 > 0.0;
    float _1075 = fma(_963, _1053, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1077 = _1023 >= 0.0;
    bool _1079 = isnan(_1023);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_981, _1057, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1089 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1091 = isnan(_525);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1069;
    float _1103 = _1101 + 1.0;
    bool _1105 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1107 = isnan(_525);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    bool _1117 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = isnan(_525);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1099;
    float _1131 = _1129 + 1.0;
    bool _1133 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1135 = isnan(_525);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -_1115;
    float _1147 = _1145 + 1.0;
    float _1149 = _1115 * _1103;
    float _1151 = _1127 * _1131;
    float _1153 = -_1127;
    float _1155 = _1153 + 1.0;
    float _1157 = _1099 * _1147;
    float _1159 = in.m_77.x;
    float _1161 = in.m_77.y;
    float _1163 = in.m_77.z;
    float _1165 = _975 * _1155;
    float _1167 = -_975;
    float _1169 = _1167 + 1.0;
    bool _1171 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1173 = isnan(1.0);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1179 = _1175 || _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    float _1185 = -_1071;
    float _1187 = _1185 + 1.0;
    float _1189 = _883 * _1169;
    float _1191 = _903 * _907;
    float _1193 = -_903;
    float _1195 = _1193 + 1.0;
    float _1197 = 1.0 / _1183;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1201 = _525 + _1199;
    float _1203 = _991 ? _1187 : 0.0;
    float _1205 = _1143 * _1195;
    float _1207 = -_1143;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_919, _1201, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1215 = _525 + _1213;
    float _1217 = _1033 * _1205;
    int _1219 = _1047 ? 0 : 1;
    float _1221 = fma(_1011, _1215, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    int _1225 = ~_977;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = in.m_83.x;
    float _1233 = in.m_83.y;
    float _1235 = in.m_83.z;
    int _1237 = _1229;
    if (!_941)
    {
        int _1239 = ~_977;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    float _1245 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1247 = _1203 * _1197;
        _170 = _1247;
    }
    float _1249 = _170;
    int _1251 = _1085 ? 0 : 1;
    float _1253 = fma(_565, 78.233001708984375, _1245);
    float _1255 = fma(_208, 78.233001708984375, _1245);
    float _1257 = _565 + (-0.5);
    float _1259 = _1253 * 0.15915493667125701904296875;
    int _1261 = abs(_765);
    float _1263 = _1255 * 0.15915493667125701904296875;
    int _1265 = ~_1219;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = _1269;
    if (!_1035)
    {
        int _1273 = ~_1219;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = _1259 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = float(_1243);
    float _1285 = fma(_1075, _1191, _1223);
    float _1287 = float(_1261);
    int _1289 = ~_1251;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1087, _1189, _1285);
    float _1297 = _1263 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1287 * _1283;
    int _1303 = abs(_771);
    float _1305 = fma(_1211, _1165, _1295);
    int _1307 = _1293;
    if (!_1073)
    {
        int _1309 = ~_1251;
        int _1311 = _1309 + 1;
        _1307 = _1311;
    }
    int _1313 = _1307;
    float _1315 = _1301 * (-2.0);
    float _1317 = float(_909);
    float _1319 = fma(_1221, _1151, _1305);
    float _1321 = _1281 * 43758.546875;
    float _1323 = fma(_1315, _1233, _1233);
    float _1325 = float(_1277);
    float _1327 = fma(_1037, _1315, _1037);
    float _1329 = floor(_1321);
    float _1331 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1323);
    float _1333 = -_583;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1317 * _1325;
    float _1339 = _1299 * 43758.546875;
    float _1341 = fma(_1327, _1249, _1331);
    float _1343 = float(_1313);
    float _1345 = _1337 * (-2.0);
    float _1347 = float(_1303);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _208 + (-0.5);
    float _1353 = fma(_1345, _1231, _1231);
    float _1355 = fma(_1049, _1345, _1049);
    float _1357 = _1347 * _1343;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1361 = _525 + _1359;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1353);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1367 = _525 + _1365;
    float _1369 = _1357 * (-2.0);
    float _1371 = floor(_1339);
    float _1373 = fma(_1355, _1249, _1363);
    float _1375 = fma(_1025, _1361, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1377 = fma(_1369, _1235, _1235);
    float _1379 = fma(_1021, _1369, _1021);
    float _1381 = _1373 * 0.15915493667125701904296875;
    float _1383 = fma(_995, _1367, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1385 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1377);
    float _1387 = _871 * _871;
    float _1389 = fma(_1375, _1157, _1319);
    float _1391 = -_1329;
    float _1393 = _1321 + _1391;
    float _1395 = fma(_1379, _1249, _1385);
    float _1397 = -_773;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1401 = in.m_85.x;
    float _1403 = in.m_85.y;
    float _1405 = in.m_85.z;
    float _1407 = fma(_1383, _1149, _1389);
    float _1409 = fma(_1399, _1399, _1387);
    float _1411 = in.m_87.x;
    float _1413 = in.m_87.y;
    float _1415 = in.m_87.z;
    float _1417 = -_1371;
    float _1419 = _1339 + _1417;
    float _1421 = fma(_1393, 4.0, -2.0);
    float _1423 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1407);
    float _1425 = fma(_891, _891, _1409);
    float _1427 = _182 * _182;
    float _1429 = _1419 * 0.5;
    float _1431 = _1423 * _1421;
    float _1433 = _1423 * _1419;
    float _1435 = _1433 * 4.0;
    float _1437 = _1349 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    float _1441 = -_1429;
    float _1443 = fma(_1427, 1.5, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = _1431 * 0.15915493667125701904296875;
    float _1449 = _1395 * 0.15915493667125701904296875;
    float _1451 = -_593;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = -_601;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = -_1405;
    float _1465 = _1163 + _1463;
    float _1467 = -_1159;
    float _1469 = _1467 + _1401;
    float _1471 = _503 * _1415;
    float _1473 = fma(_1445, _1465, _1405);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1481 = _501 * _1413;
    float _1483 = fma(_1435, _1163, _1473);
    float _1485 = -_1161;
    float _1487 = _1485 + _1403;
    float _1489 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1479);
    float _1491 = _499 * _1411;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1489);
    float _1499 = _1349 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1505 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1507 = _1477 * _1487;
    float _1509 = -_1495;
    float _1511 = fma(_1477, _1469, _1509);
    float _1513 = 1.0 / _1503;
    float _1515 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1505);
    float _1517 = fma(_1461, _1469, _1507);
    float _1519 = _1335 * _1335;
    float _1521 = _1511 + _1159;
    float _1523 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1515);
    float _1525 = fma(_1453, _1453, _1519);
    float _1527 = _1381 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = -_1511;
    float _1535 = fma(_1533, _1445, _1521);
    float _1537 = fma(_1457, _1457, _1525);
    float _1539 = _1531 + _1503;
    float _1541 = fma(_1435, _1159, _1535);
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1381 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1539 * _1513;
    float _1551 = _1549 * 0.5;
    float _1553 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1557 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
    float _1559 = _779 + _1553;
    float _1561 = _1449 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1529 * _1439;
    float _1567 = _1529 * _1501;
    float _1569 = sqrt(_1425);
    float _1571 = _1547 * _1501;
    float _1573 = _1547 * _1439;
    float _1575 = rsqrt(_1537);
    float _1577 = fma(_1563, _1571, _1565);
    float _1579 = fma(_1563, _1565, _1571);
    float _1581 = _1517 + _1161;
    float _1583 = -_1573;
    float _1585 = fma(_1563, _1567, _1583);
    float _1587 = -_1567;
    float _1589 = fma(_1563, _1573, _1587);
    float _1591 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = -_1517;
    float _1595 = fma(_1593, _1445, _1581);
    float _1597 = 1.0 / _1557;
    float _1599 = _725 * _1569;
    float _1601 = fma(_1435, _1161, _1595);
    float _1603 = _1599 * _1543;
    float _1605 = _1599 * _1591;
    float _1607 = _1599 * _1493;
    float _1609 = _1453 * _1575;
    float _1611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1541);
    float _1613 = _1457 * _1575;
    float _1615 = _1335 * _1575;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1619 = _1609 * _1617;
    float _1621 = _1611 * _1603;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = _1613 * _1623;
    float _1627 = _1449 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1633 = _1597 * _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1637 = -_1619;
    float _1639 = fma(_1613, _1635, _1637);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1643 = _1615 * _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1647 = -_1625;
    float _1649 = fma(_1615, _1645, _1647);
    float _1651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1483);
    float _1653 = _1639 * _1639;
    bool _1655 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -_1643;
    float _1661 = fma(_1609, _1657, _1659);
    bool _1663 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1665 = fma(_1649, _1649, _1653);
    float _1667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1601);
    float _1669 = _1651 * _1605;
    float _1671 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1673 = fma(_1661, _1661, _1665);
    float _1675 = _1667 * _1607;
    bool _1677 = !_1655;
    int _1679 = _1677 ? 0 : 1;
    float _1681 = _1547 * _1629;
    float _1683 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1671);
    float _1685 = _1529 * _1629;
    int _1687 = 2;
    float _1689 = _1559;
    float _1691 = _1477;
    if (!_1655)
    {
        _1687 = 1;
    }
    int _1693 = _1687;
    float _1695 = rsqrt(_1673);
    int _1697 = _1693;
    if (!_1663)
    {
        _1697 = _1679;
    }
    int _1699 = _1697;
    float _1701 = -_1675;
    float _1703 = _1563 * _1701;
    float _1705 = _1681 * _1675;
    float _1707 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1683);
    float _1709 = _1501 * _1629;
    float _1711 = _1685 * _1675;
    int _1713 = _1699 << 6;
    float _1715 = _1439 * _1629;
    float _1717 = fma(_1709, _1621, _1703);
    float _1719 = fma(_1577, _1621, _1705);
    float _1721 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1723 = fma(_1585, _1621, _1711);
    float _1725 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1727 = _1713 + 96;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    float _1745 = fma(_1589, _1669, _1719);
    float _1747 = _1649 * _1695;
    float _1749 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1725);
    float _1751 = _1639 * _1695;
    float _1753 = _1661 * _1695;
    float _1755 = _1615 * _1747;
    float _1757 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1749);
    int _1759 = _1713 + 104;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = _1613 * _1751;
    float _1779 = -_1755;
    float _1781 = fma(_1609, _1751, _1779);
    float _1783 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1785 = trunc(_1721);
    int _1787 = int(_1785);
    float _1789 = -_1777;
    float _1791 = fma(_1615, _1753, _1789);
    float _1793 = fma(_1715, _1669, _1717);
    float _1795 = _1781 * _1745;
    int _1797 = _1713 + 64;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    float _1815 = fma(_1579, _1669, _1723);
    float _1817 = _1791 * _1745;
    float _1819 = fma(_1753, _1793, _1795);
    float _1821 = trunc(_1783);
    int _1823 = int(_1821);
    bool _1825 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_1747, _1793, _1817);
    float _1837 = fma(_1613, _1815, _1819);
    int _1839 = _1713 + 48;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    float _1857 = fma(_1609, _1815, _1835);
    float _1859 = _601 + _1837;
    int _1861 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1863 = _1787 + _1861;
    int _1865 = _1863 + 1;
    float _1867 = _593 + _1857;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1871 = _1859 + _1869;
    int _1873 = _1713 + 56;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    bool _1891 = _1865 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1895 = _1867 + _1893;
    float _1897 = _1871 * _1871;
    int _1899 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1901 = _1823 + _1899;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1895, _1897);
    int _1907 = _1713 + 72;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = _1865 | _1903;
    float _1927 = sqrt(_1905);
    bool _1929 = _1925 < 0;
    bool _1931 = _1929 || _1891;
    float _1933 = _1609 * _1753;
    int _1935 = _1713 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    bool _1953 = _1903 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1955 = _1953 || _1931;
    float _1957 = _1559 * _1743;
    float _1959 = -_1933;
    float _1961 = fma(_1613, _1747, _1959);
    float _1963 = fma(_785, _1735, _1957);
    float _1965 = _1961 * _1745;
    float _1967 = fma(_793, _1767, _1963);
    float _1969 = fma(_1751, _1793, _1965);
    bool _1971 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1973 = _1865;
    int _1975 = as_type<int>(_1965);
    float _1977 = _1867;
    float _1979 = _1859;
    if (!_1955)
    {
        int _1981 = _1903 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1983 = _1981 + _1865;
        _1973 = _1983;
    }
    int _1985 = _1973;
    float _1987 = _1967 + _1775;
    float _1989 = _1745;
    if (!_1955)
    {
        float _1991 = floor(_1721);
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1559 * _1813;
    int _1997 = as_type<int>(_1813);
    float _1999 = _1995;
    if (!_1955)
    {
        int _2001 = _1985 << 2;
        _1975 = _2001;
    }
    int _2003 = _1975;
    float _2005 = fma(_785, _1805, _1995);
    if (!_1955)
    {
        int _2007 = 12 & _2003;
        _1997 = _2007;
    }
    int _2009 = _1997;
    float _2011 = 1.0 / _1987;
    float _2013 = _1559 * _1855;
    float _2015 = fma(_1615, _1815, _1969);
    float _2017 = fma(_785, _1847, _2013);
    float _2019 = _583 + _2015;
    int _2021 = as_type<int>(_2013);
    if (!_1955)
    {
        uint _2023 = uint(int(uint(_1985) >> uint(2)));
        _2021 = int(_2023);
    }
    int _2025 = _2021;
    float _2027 = fma(_793, _1881, _2017);
    int _2029 = _2025;
    if (!_1955)
    {
        int _2031 = _2025 << 4;
        int _2033 = _2031 + _2009;
        _2029 = _2033;
    }
    int _2035 = _2029;
    if (!_1971)
    {
        _1999 = _2019;
    }
    float _2037 = _1999;
    float _2039 = fma(_793, _1915, _2005);
    bool _2041 = !_1971;
    float _2043 = _2037;
    float _2045 = _1951;
    if (!_2041)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2051 = _1927 + _2049;
        float _2053 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = rsqrt(_1905);
        float _2057 = _2051 * _2047;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = sin(_2061);
        float _2065 = _2059 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = fma(_2063, _2053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2071 = _2055 * _2069;
        float _2073 = _2067 + (-1.0);
        float _2075 = fma(_1895, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2077 = fma(_1871, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2079 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2081 = fma(_2019, _2067, _2079);
        _1977 = _2075;
        _2043 = _2081;
        _1979 = _2077;
    }
    float _2083 = _1977;
    float _2085 = _2043;
    float _2087 = _1979;
    float _2089 = -_773;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2093 = -_767;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2097 = -_781;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2101 = _2027 + _1889;
    float _2103 = _2039 + _1923;
    float _2105 = _2095;
    float _2107 = _2099;
    if (_1833)
    {
        _775 = _2091;
    }
    float _2109 = _775;
    float _2111 = _2109;
    if (!_1833)
    {
        float _2113 = _789 * _789;
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = -_593;
        float _2119 = _2117 + _2083;
        float _2121 = fma(_797, _797, _2113);
        float _2123 = fma(_803, _803, _2121);
        float _2125 = 1.0 / _1599;
        float _2127 = sqrt(_2123);
        float _2129 = precise::min(_2127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2131 = _2129 * _2115;
        float _2133 = -_583;
        float _2135 = _2133 + _2085;
        float _2137 = -_601;
        float _2139 = _2137 + _2087;
        float _2141 = _2131 * _2125;
        float _2143 = fma(_2135, _2141, _779);
        float _2145 = fma(_2119, _2141, _785);
        float _2147 = fma(_2139, _2141, _793);
        _2105 = _2143;
        _2111 = _2145;
        _2107 = _2147;
    }
    float _2149 = _2105;
    float _2151 = _2111;
    float _2153 = _2107;
    int _2155 = _1713 + 88;
    uint _2157 = uint(int(uint(_2155) >> uint(2)));
    uint _2159 = uint(int(uint(int(_2157)) >> uint(2)));
    int _2161 = int(_2157) & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    int _2165 = int(_2157) + 1;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    int _2169 = _2165 & 3;
    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
    float _2173 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = _2101 * _2011;
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2179 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2177);
    float _2187 = _803;
    if (!_1955)
    {
        int _2189 = _2035 + 400;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
        int _2195 = int(_2191) & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        _2187 = _2197;
    }
    float _2199 = _2187;
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2205 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2185);
    bool _2207 = _2175 >= 0.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2201);
    float _2211 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2215 = _2103 * _2011;
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2221 = _2175 <= 1.0;
    bool _2223 = _2221 && _2207;
    float _2225 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2227 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2213);
    float _2229 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2219);
    bool _2231 = _2215 >= 0.0;
    bool _2233 = _2231 && _2223;
    float _2235 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2237 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    bool _2241 = _2215 <= 1.0;
    bool _2243 = _2241 && _2233;
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = _1889;
    if (!_1955)
    {
        float _2249 = floor(_1783);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2255 = _1559 * _1951;
    float _2257 = -_2245;
    float _2259 = fma(_2257, _2235, 1.0);
    float _2261 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2265 = fma(_785, _1943, _2255);
    float _2267 = log2(_2259);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2263);
    float _2273 = _2259;
    if (_2243)
    {
        float _2275 = float(_1699);
        _2045 = _2275;
    }
    float _2277 = _2045;
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2281 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2271);
    float _2283 = 1.0 / _2253;
    float _2285 = _2281;
    if (!_1955)
    {
        float _2287 = -_2251;
        float _2289 = _1783 + _2287;
        _2273 = _2289;
    }
    float _2291 = _2273;
    float _2293 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2279);
    float _2295 = fma(_793, _2163, _2265);
    float _2297 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2281);
    float _2299 = _2295 + _2171;
    float _2301 = _2255;
    if (_2243)
    {
        float _2303 = rint(_2277);
        float _2305 = precise::max(_2303, 0.0);
        uint _2307 = uint(_2305);
        uint _2309 = clamp(_2307, 0u, 65535u);
        _2301 = as_type<float>(_2309);
    }
    float _2311 = _2301;
    float _2313 = _2267 * 0.693147182464599609375;
    float _2315 = _2299 * _2011;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = _2299;
    if (!_1955)
    {
        float _2321 = rint(_2199);
        float _2323 = precise::max(_2321, 0.0);
        uint _2325 = uint(_2323);
        uint _2327 = clamp(_2325, 0u, 65535u);
        _2319 = as_type<float>(_2327);
    }
    float _2329 = _2319;
    float _2331 = _2293 * _2283;
    float _2333 = _2297 * _2283;
    float _2335 = fma(_2331, 0.5, 0.5);
    float _2337 = fma(_2333, -0.5, 0.5);
    float _2339 = _2331;
    if (!_1955)
    {
        float _2341 = -_1993;
        float _2343 = _1721 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = _2215;
    if (_2243)
    {
        float3 _6966 = float3(_2175, _2215, float(as_type<int>(_2311)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2349 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2315, level(0.0));
        _2347 = _2349;
    }
    float _2351 = _2347;
    float3 _6980 = float3(_2335, _2337, _2317);
    float _2353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2335, _2337, _2317);
    float4 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _2356.w;
    float _2366 = _1993;
    if (!_1955)
    {
        float3 _7012 = float3(_2345, _2291, float(as_type<int>(_2329)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (_1955)
    {
        _2285 = 1.0;
    }
    float _2372 = _2285;
    float _2374 = _2372;
    float _2376 = _2370;
    if (!_1955)
    {
        int _2378 = _1985 << 4;
        int _2380 = _2378 + 2048;
        uint _2382 = uint(int(uint(_2380) >> uint(2)));
        uint _2384 = uint(int(uint(int(_2382)) >> uint(2)));
        int _2386 = int(_2382) & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = int(_2382) + 1;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        int _2394 = _2390 & 3;
        float _2396 = (*spvDescriptorSet0.vp_c15)._m0[int(_2392)][_2394];
        int _2398 = _2380 + 8;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        float _2416 = _1559 * _2396;
        float _2418 = fma(_785, _2388, _2416);
        float _2420 = fma(_793, _2406, _2418);
        float _2422 = _2420 + _2414;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = -_2424;
        float _2428 = _2426 + _2370;
        float _2430 = fma(_2428, 500.0, 1.5);
        float _2432 = exp2(_2430);
        float _2434 = 0.0 + _2432;
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        _1689 = _2416;
        _2374 = _2436;
    }
    float _2438 = _1689;
    float _2440 = _2374;
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2444 = _2149 + _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2151 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2452 = _2153 + _2450;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = rsqrt(_2458);
    float _2462 = sqrt(_2458);
    float _2464 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2466 = _2448 * _2464;
    float _2468 = _2452 * _2464;
    float _2470 = _2466 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 + _2472;
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = _2476 + _2480;
    float _2484 = _2438;
    float _2486 = _2474;
    float _2488 = _2482;
    float _2490 = _2444;
    float _2492 = _2466;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    if (_2478)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2500;
    }
    float _2502 = _2484;
    if (_2478)
    {
        float _2504 = rsqrt(_2474);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2478)
    {
        float _2508 = _2482 * _2502;
        _2488 = _2508;
    }
    float _2510 = _2488;
    if (_2478)
    {
        float _2512 = _2510 * 0.15915493667125701904296875;
        _2376 = _2512;
    }
    float _2514 = _2376;
    float _2516 = _793;
    if (_2478)
    {
        float _2518 = _2514 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2526 = precise::max(0.0, _2524);
    float _2528 = _2502;
    float _2530 = _2526;
    if (_2478)
    {
        float _2532 = _2514 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        _2528 = _2534;
    }
    float _2536 = _2528;
    float _2538 = -_2464;
    float _2540 = -_2526;
    float _2542 = fma(_2444, _2538, _2540);
    if (_2478)
    {
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2544;
    }
    float _2546 = _2490;
    float _2548 = _2546;
    float _2550 = _2522;
    if (_2478)
    {
        float _2552 = fma(_2522, _2546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2548 = _2552;
    }
    float _2554 = _2548;
    float _2556 = _2554;
    if (_2478)
    {
        float _2558 = _2536 + (-1.0);
        _2530 = _2558;
    }
    float _2560 = _2530;
    float _2562 = _2560;
    if (_2478)
    {
        float _2564 = _2506 * _2554;
        _2550 = _2564;
    }
    float _2566 = _2550;
    if (!_2478)
    {
        _2556 = _2542;
    }
    float _2568 = _2556;
    float _2570 = _2568;
    if (_2478)
    {
        float _2572 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2572;
    }
    float _2574 = _2562;
    if (_2478)
    {
        float _2576 = _2466 * _2566;
        _2492 = _2576;
    }
    float _2578 = _2492;
    if (_2478)
    {
        float _2580 = _2468 * _2566;
        _2494 = _2580;
    }
    float _2582 = _2494;
    if (_2478)
    {
        float _2584 = fma(_2542, _2536, _2574);
        _2570 = _2584;
    }
    float _2586 = _2570;
    if (_2478)
    {
        float _2588 = _2578 * _2578;
        _2496 = _2588;
    }
    float _2590 = _2496;
    if (_2478)
    {
        float _2592 = _2582 * _2582;
        _2498 = _2592;
    }
    float _2594 = _2498;
    float _2596 = fma(_2586, _2586, _2590);
    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2600 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2598);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = _2596 + _2594;
    float _2606 = -_2602;
    float _2608 = _2606 + 1.0;
    float _2610 = rsqrt(_2604);
    float _2612 = abs(_2608);
    float _2614 = log2(_2612);
    float _2616 = _2610 * _2578;
    float _2618 = _2610 * _2586;
    float _2620 = _2610 * _2582;
    float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = -_2622;
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2624);
    float _2628 = -_2620;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2626);
    float _2632 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = exp2(_2632);
    float _2638 = fma(_2630, 0.5, 0.5);
    float _2640 = fma(_2638, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2642 = sqrt(_2634);
    float _2644 = fma(_2638, _2640, -0.212114393711090087890625);
    float _2646 = _2618 + 1.0;
    float _2648 = fma(_2638, _2644, 1.570728778839111328125);
    float _2650 = -_2618;
    float _2652 = fma(_2636, _2646, _2650);
    float _2654 = fma(_2652, 0.5, 0.5);
    float _2656 = _2642 * 0.636619746685028076171875;
    float _2658 = -_2648;
    float _2660 = fma(_2656, _2658, 1.0);
    float2 _7461 = float2(_2660, _2654);
    float3 _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2666 = _2664.x;
    float _2668 = _2664.y;
    float _2670 = _2664.z;
    float _2672 = in.m_89.x;
    float _2674 = in.m_89.y;
    float _2676 = abs(_1633);
    float _2678 = log2(_2676);
    bool _2680 = _1601 != 0.0;
    bool _2682 = isnan(_1601);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    float _2690 = _1681 * _1791;
    float _2692 = in.m_89.z;
    float _2694 = _1681 * _1961;
    bool _2696 = _1541 == 0.0;
    bool _2698 = !_2688;
    bool _2700 = _2696 && _2698;
    float _2702 = in.m_91.x;
    float _2704 = in.m_91.y;
    float _2706 = in.m_91.z;
    float _2708 = in.m_91.w;
    float _2710 = _1681 * _1781;
    bool _2712 = _1483 == 0.0;
    bool _2714 = _2712 && _2700;
    float _2716 = -_1563;
    float _2718 = fma(_2716, _1747, _2690);
    float _2720 = -_1563;
    float _2722 = fma(_2720, _1751, _2694);
    float _2724 = -_1563;
    float _2726 = fma(_2724, _1753, _2710);
    float _2728 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2730 = _1633 <= 8000.0;
    bool _2732 = isnan(_1633);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(8000.0);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2744 = fma(_1685, _1615, _2722);
    float _2746 = -_835;
    float _2748 = _2746 + 1.0;
    float _2750 = exp2(_2728);
    float _2752 = _1477 * _2674;
    float _2754 = _1461 * _2674;
    float _2756 = fma(_1461, _2672, _2752);
    float _2758 = exp2(_2742);
    float _2760 = _2752;
    float _2762 = _2674;
    float _2764 = _2672;
    if (_2714)
    {
        _2760 = _2692;
    }
    float _2766 = _2760;
    float _2768 = -_2754;
    float _2770 = fma(_1477, _2672, _2768);
    float _2772 = _2756 * _2702;
    float _2774 = _2766;
    if (_2714)
    {
        _2762 = _2756;
    }
    float _2776 = _2762;
    float _2778 = _2776;
    if (!_2714)
    {
        float _2780 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2778 = _2780;
    }
    float _2782 = _2778;
    if (_2714)
    {
        _1691 = _2766;
    }
    float _2784 = _1691;
    float _2786 = _1577 * _1791;
    float _2788 = _2784;
    if (!_2714)
    {
        _2774 = _2692;
    }
    float _2790 = _2774;
    float _2792 = -_2772;
    float _2794 = fma(_2770, _2704, _2792);
    if (_2714)
    {
        _2764 = _2770;
    }
    float _2796 = _2764;
    float _2798 = _2796;
    if (!_2714)
    {
        float _2800 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2770);
        _2798 = _2800;
    }
    float _2802 = _2798;
    float _2804 = _2770 * _2706;
    float _2806 = _2704 * _2790;
    float _2808 = _1577 * _1781;
    float _2810 = _1589 * _1781;
    float _2812 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2806;
    float _2818 = fma(_2756, _2706, _2816);
    float _2820 = fma(_1709, _1747, _2786);
    if (!_2714)
    {
        float _2822 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2788 = _2822;
    }
    float _2824 = _2788;
    float _2826 = fma(_2814, -2.0, 3.0);
    float _2828 = _2814 * _2814;
    float _2830 = _1577 * _1961;
    float _2832 = _1589 * _1791;
    float _2834 = _1589 * _1961;
    float _2836 = -_2804;
    float _2838 = fma(_2702, _2790, _2836);
    float _2840 = fma(_1709, _1751, _2830);
    float _2842 = fma(_1715, _1747, _2832);
    float _2844 = fma(_1709, _1753, _2808);
    float _2846 = fma(_1685, _1609, _2718);
    float _2848 = fma(_1715, _1751, _2834);
    float _2850 = fma(_1715, _1753, _2810);
    float _2852 = fma(_1585, _1615, _2840);
    float _2854 = fma(_1685, _1613, _2726);
    float _2856 = fma(_1579, _1609, _2842);
    float _2858 = fma(_1585, _1609, _2820);
    float _2860 = _2846 * _2704;
    float _2862 = fma(_1579, _1615, _2848);
    float _2864 = _2838 * _2708;
    float _2866 = fma(_1579, _1613, _2850);
    float _2868 = fma(_1585, _1613, _2844);
    float _2870 = _2744 * _2704;
    float _2872 = _2854 * _2704;
    float _2874 = fma(_2858, _2702, _2860);
    float _2876 = _2846 * _2782;
    float _2878 = _2744 * _2782;
    float _2880 = _2854 * _2782;
    float _2882 = _2864 * _2846;
    float _2884 = _2864 * _2744;
    float _2886 = _2864 * _2854;
    float _2888 = fma(_2852, _2702, _2870);
    float _2890 = fma(_2868, _2702, _2872);
    float _2892 = _2794 * _2708;
    float _2894 = fma(_2856, _2706, _2874);
    float _2896 = _2818 * _2708;
    float _2898 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2900 = fma(_2858, _2802, _2876);
    float _2902 = _2828 * _2826;
    float _2904 = fma(_2896, _2858, _2882);
    float _2906 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2898);
    float _2908 = fma(_2896, _2852, _2884);
    float _2910 = fma(_2896, _2868, _2886);
    float _2912 = fma(_2868, _2802, _2880);
    float _2914 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2906);
    float _2916 = fma(_2862, _2706, _2888);
    float _2918 = fma(_2852, _2802, _2878);
    float _2920 = fma(_2866, _2706, _2890);
    float _2922 = fma(_2892, _2866, _2910);
    float _2924 = fma(_2866, _2824, _2912);
    float _2926 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2914);
    float _2928 = -_2902;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2856, _2824, _2900);
    float _2934 = fma(_2862, _2824, _2918);
    float _2936 = _2926 + _2253;
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2902);
    float _2940 = -_2750;
    float _2942 = _2940 + 1.0;
    float _2944 = fma(_2892, _2856, _2904);
    float _2946 = _2936 * 0.5;
    float _2948 = _2740 * _2938;
    float _2950 = _2936;
    float _2952 = _2946;
    if (!_2243)
    {
        _2950 = 1.0;
    }
    float _2954 = _2950;
    float _2956 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = _2954;
    if (_2243)
    {
        bool _2960 = _2351 >= _2315;
        bool _2962 = isnan(_2351);
        bool _2964 = _2960 || _2962;
        bool _2966 = isnan(_2315);
        bool _2968 = _2964 || _2966;
        float _2970 = float(_2968);
        _2958 = _2970;
    }
    float _2972 = _2958;
    float _2974 = _2948 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2976 = fma(_2892, _2862, _2908);
    float _2978 = _2956 * _2353;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2748 * _2974;
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2972 * _2440;
    float _2990 = _2364 * _2978;
    float _2992 = -_2986;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2996 = _2364 * _2982;
    out.m_93.x = _2894;
    out.m_93.y = _2916;
    out.m_93.z = _2920;
    bool _2998 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3000 = isnan(_2462);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3006 = _3002 || _3004;
    float _3008 = -_2988;
    float _3010 = fma(_3008, _2994, 1.0);
    float _3012 = precise::clamp(_3010, 0.0, 1.0);
    out.m_95.x = _2944;
    out.m_95.y = _2976;
    out.m_95.z = _2922;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2297;
    out.gl_Position.z = _2926;
    out.gl_Position.w = _2253;
    out.m_97.x = _3014;
    float _3016 = _2974;
    float _3018 = _2988;
    float _3020 = _2982;
    float _3022 = _3012;
    float _3024 = _2253;
    if (!_3006)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3016;
    out.m_99.x = _2932;
    out.m_99.y = _2934;
    out.m_99.z = _2924;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3006)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3018;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3006)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3020;
    out.m_101.z = _2946;
    out.m_101.w = _2253;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3006)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3006)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _2952;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3006)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _3024;
    float _3058 = _2670 * _2978;
    float _3060 = fma(_2666, _2990, _2358);
    float _3062 = fma(_2668, _2990, _2360);
    float _3064 = fma(_2364, _3058, _2362);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2996;
    bool _3066 = !_3006;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2462);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2462 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = 1.0 / _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3090;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3120 = fma(_3114, _3094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3120;
            _3042 = _3128;
            _3054 = _3122;
            _3036 = _3126;
            _3070 = _3124;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2462);
            bool _3138 = _3134 || _3136;
            bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3142 = _3138 || _3140;
            if (!_3142)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3144 = _3052;
            _3054 = _3144;
            if (!_3142)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3146 = _3028;
            _3030 = _3146;
            if (!_3142)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3148 = _3068;
            _3070 = _3148;
            if (!_3142)
            {
                _3034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3150 = _3034;
            _3036 = _3150;
            if (!_3142)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3142)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3154 = _3046;
            bool _3156 = !_3142;
            _3048 = _3154;
            if (!_3156)
            {
                bool _3158 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2462);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2462 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = 1.0 / _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3176;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3206 = fma(_3200, _3180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3206;
                    _3042 = _3214;
                    _3054 = _3208;
                    _3036 = _3212;
                    _3070 = _3210;
                    _3048 = _3216;
                    _3132 = true;
                }
                else
                {
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3132 = false;
    float _3218 = _3030;
    float _3220 = _3042;
    float _3222 = _3054;
    float _3224 = _3036;
    float _3226 = _3070;
    float _3228 = _3048;
    float _3230 = fma(_2934, -0.5, 0.5);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3218;
    float _3236 = _3234 + _3220;
    float _3238 = -_3222;
    float _3240 = _3238 + _3224;
    float _3242 = -_3226;
    float _3244 = _3242 + _3228;
    bool _3246 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3248 = fma(_3232, _3236, _3218);
    float _3250 = fma(_3232, _3240, _3222);
    float _3252 = fma(_3232, _3244, _3226);
    float _3254 = _3248 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
    out.m_105.x = 0.0;
    float _3260 = -_3258;
    float _3262 = _3250 + _3260;
    float _3264 = -_3258;
    float _3266 = _3248 + _3264;
    float _3268 = -_3258;
    float _3270 = _3252 + _3268;
    float _3272 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3274 = fma(_3262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3278 = fma(_3270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    out.m_97.w = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3280 = -_2149;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2151;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2153;
    float _3290 = _3288 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3292 = _3282 * _3282;
    float _3294 = fma(_3286, _3286, _3292);
    float _3296 = fma(_3290, _3290, _3294);
    float _3298 = sqrt(_3296);
    float _3300 = rsqrt(_3296);
    float _3302 = -_3298;
    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3306 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3286 * _3300;
    float _3312 = _3282 * _3300;
    float _3314 = abs(_3308);
    float _3316 = log2(_3314);
    float _3318 = _3290 * _3300;
    float _3320 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3322 = _2934 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2932, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2924, _3318, _3330);
    float _3338 = precise::clamp(_3336, 0.0, 1.0);
    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3342 = _3334 + _3340;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3346 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = exp2(_3344);
    float _3352 = _3350 * _3348;
    float _3354 = _3338 * _3352;
    float _3356 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3358 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3360 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3356;
    out.m_105.y = _3358;
    out.m_105.z = _3360;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3132 = false;
    bool _523 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_142);
        out.gl_Position.z = _3418;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_61.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3482 = as_type<float>(_176);
        out.gl_Position.z = _3482;
    }
    if (_168)
    {
        return out;
    }
    float _178 = 1.0 / _148;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _152 * _178;
    bool _184 = !_180;
    float _202;
    if (!_184)
    {
        float _186 = in.m_63.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _182;
    }
    _204 = false;
    float _206 = _202;
    float _208 = in.m_63.x;
    float _210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _206 + _212;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_206);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _232;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _254 = _210 * _208;
    float _256 = _216 * _208;
    float _258 = 1.0 / _236;
    float _260 = _214 * _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = trunc(_254);
    int _268 = int(_266);
    bool _270 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_206);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_206);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = trunc(_256);
    int _296 = int(_294);
    int _298 = _268 << 4;
    int _300 = _298 + 1968;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _206 + _302;
    float _306 = 1.0 / _264;
    int _308 = _300 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = _304 * _258;
    float _321 = -_228;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = _206 + _325;
    int _329 = _296 << 4;
    int _331 = _329 + 1712;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = _280 * _323;
    float _339 = -_280;
    float _341 = _339 + 1.0;
    uint _343 = uint(int(uint(_300) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _359;
    float _363 = fma(_335, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _292 * _341;
    float _367 = -_292;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_361, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _377 = _327 * _306;
    uint _379 = uint(int(uint(_331) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = fma(_373, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _397;
    int _401 = _331 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    uint _405 = uint(int(uint(int(_403)) >> uint(2)));
    int _407 = int(_403) & 3;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[int(_405)][_407];
    float _411 = _248 * _369;
    float _413 = _375 * _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _419 = _395 * _411;
    float _421 = _363 * _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_417, _319, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -_248;
    float _435 = _433 + 1.0;
    float _437 = fma(_425, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _443 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _445 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _413);
    float _447 = fma(_439, _365, _441);
    float _449 = fma(_437, _365, _443);
    float _451 = fma(_399, _377, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _453 = _357 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _455 = _349 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _459 = _317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_467, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _463;
    out.m_65.y = _461;
    out.m_65.z = _469;
    float _485 = fma(_477, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = _409 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_427, _365, _445);
    float _491 = fma(_479, _337, _447);
    float _493 = fma(_485, _337, _449);
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = fma(_451, _337, _489);
    float _499 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].x, _491);
    float _501 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].y, _493);
    out.m_67.x = _481;
    out.m_67.y = _483;
    out.m_67.z = _495;
    out.m_67.w = _457;
    float _503 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].z, _497);
    bool _505 = !_252;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _509 = _208 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[14].x, _152);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _182;
    }
    _523 = false;
    float _525 = _521;
    float _527 = in.m_56.x;
    float _529 = in.m_56.y;
    float _531 = in.m_56.z;
    float _533 = in.m_69.x;
    float _535 = in.m_69.y;
    float _537 = in.m_69.z;
    float _539 = in.m_69.w;
    float _541 = in.m_71.x;
    float _543 = in.m_71.y;
    float _545 = in.m_71.z;
    float _547 = in.m_71.w;
    float _549 = in.m_73.x;
    float _551 = in.m_73.y;
    float _553 = in.m_73.z;
    float _555 = in.m_73.w;
    float _557 = in.m_63.w;
    float _559 = in.m_75.y;
    float _561 = in.m_75.x;
    float _563 = _529 * _535;
    float _565 = in.m_63.y;
    float _567 = _529 * _543;
    float _569 = fma(_527, _533, _563);
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _573 = _529 * _551;
    float _575 = fma(_527, _541, _567);
    float _577 = fma(_531, _537, _569);
    float _579 = fma(_527, _549, _573);
    float _581 = fma(_531, _545, _575);
    float _583 = _577 + _539;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _587 = _585 != 0;
    float _589 = fma(_531, _553, _579);
    float _591 = in.m_63.z;
    float _593 = _581 + _547;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _583 + _595;
    bool _599 = _557 > 0.5;
    float _601 = _589 + _555;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _593 + _603;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _601 + _613;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _619 = _617 != 0;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _625 = _623 != 0;
    float _627 = -_559;
    float _629 = _627 + 1.0;
    float _631 = _569;
    float _633 = _575;
    float _635 = _559;
    int _637 = as_type<int>(_531);
    bool _639 = _619;
    float _641 = _629;
    if (!_587)
    {
        _631 = _561;
    }
    float _643 = _631;
    float _645 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    bool _647 = _565 > 0.5;
    float _649 = in.m_77.w;
    int _651 = _599 ? as_type<int>(_629) : as_type<int>(_559);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = _643;
    int _657 = _651;
    bool _659 = _647;
    if (!_587)
    {
        _633 = _643;
    }
    float _661 = _633;
    bool _663 = _645 >= 0.0;
    float _665 = _597 * _597;
    float _667 = _661;
    if (_587)
    {
        _655 = _561;
    }
    float _669 = _655;
    float _671 = _619 ? as_type<float>(_651) : _559;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _675 = fma(_605, _605, _665);
    if (_625)
    {
        float _677 = _647 ? _629 : _559;
        _635 = _677;
    }
    float _679 = _635;
    if (_587)
    {
        float _681 = -_669;
        float _683 = _681 + 1.0;
        _657 = as_type<int>(_683);
    }
    int _685 = _657;
    float _687 = as_type<float>(_685);
    if (_611)
    {
        float _689 = -_669;
        float _691 = _689 + 1.0;
        _637 = as_type<int>(_691);
    }
    int _693 = _637;
    if (_587)
    {
        bool _695 = _208 > 0.5;
        _659 = _695;
    }
    bool _697 = _659;
    float _699 = fma(_615, _615, _675);
    if (_611)
    {
        bool _701 = _591 > 0.5;
        _639 = _701;
    }
    bool _703 = _639;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_611)
    {
        _641 = _669;
    }
    float _707 = _641;
    float _709 = _671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _711 = _707;
    if (_587)
    {
        float _713 = _697 ? as_type<float>(_685) : _669;
        _667 = _713;
    }
    float _715 = _667;
    if (_663)
    {
        out.m_59.x = 0.0;
    }
    if (_611)
    {
        float _717 = _703 ? as_type<float>(_693) : _669;
        _711 = _717;
    }
    float _719 = _711;
    float _721 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _723 = _687;
    float _725 = rsqrt(_699);
    float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _731 = _709 * _673;
    float _733 = _721 * _653;
    float _735 = _727 * _571;
    int _737 = as_type<int>(_723);
    if (_663)
    {
        float _739 = _723 * 5.0;
        _737 = as_type<int>(_739);
    }
    int _741 = _737;
    float _743 = _729 * _705;
    out.m_79.w = _649;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    out.m_81.x = _735;
    out.m_81.y = _733;
    out.m_81.z = _743;
    out.m_81.w = _731;
    bool _757 = !_747;
    int _759 = _757 ? 0 : 1;
    float _761 = as_type<float>(_741);
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4469 = as_type<float>(_741);
        out.gl_Position.z = _4469;
    }
    bool _763 = !_751;
    int _765 = _763 ? 0 : 1;
    float _767 = _597 * _725;
    bool _769 = !_755;
    int _771 = _769 ? 0 : 1;
    float _773 = _605 * _725;
    float _775 = _767;
    if (_663)
    {
        return out;
    }
    float _777 = -_767;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _781 = _615 * _725;
    float _783 = -_773;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _779 + _787;
    float _791 = -_781;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = _785 + _795;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _803 = _793 + _801;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _799);
    float _807 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _809 = _807 >= 0.0;
    if (_809)
    {
        _761 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _811 = _761;
    int _813 = as_type<int>(_811);
    if (_809)
    {
        out.m_59.x = 0.0;
    }
    if (_809)
    {
        float _815 = _811 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    if (_809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4574 = as_type<float>(_817);
        out.gl_Position.z = _4574;
    }
    if (_809)
    {
        return out;
    }
    float _819 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _821 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _823 = floor(_819);
    float _825 = floor(_821);
    float _827 = -_823;
    float _829 = _819 + _827;
    float _831 = -_825;
    float _833 = _821 + _831;
    float2 _4610 = float2(_829, _833);
    float _835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).x;
    float _837 = _208 * 2.0;
    float _839 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _841 = log2(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _859 = 1.0 / _845;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _869 = -_767;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    bool _873 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _875 = isnan(_525);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = _841 * _152;
    float _887 = 1.0 / _857;
    float _889 = -_781;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    bool _893 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _895 = isnan(_525);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_883;
    float _907 = _905 + 1.0;
    int _909 = abs(_759);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _915 = floor(_837);
    float _917 = 1.0 / _849;
    float _919 = _867 * _887;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _921;
    float _925 = _565 * 2.0;
    float _927 = 1.0 / _853;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _937;
    bool _941 = _915 > 0.0;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _947 = _915 >= 0.0;
    bool _949 = isnan(_915);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = 1.0 / _913;
    float _959 = _591 * 2.0;
    float _961 = _939 * _917;
    float _963 = _945 * _859;
    bool _965 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _967 = isnan(_525);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    int _977 = _955 ? 0 : 1;
    float _979 = 1.0 / _931;
    float _981 = _863 * _927;
    bool _983 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _991 = _987 || _989;
    float _993 = 1.0 / _935;
    float _995 = _923 * _957;
    float _997 = _208 + _591;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1007 = floor(_959);
    float _1009 = _565 + _591;
    float _1011 = _1001 * _979;
    float _1013 = _997 + (-1.0);
    float _1015 = _591 + (-0.5);
    float _1017 = _1009 + (-1.0);
    float _1019 = _208 + _565;
    float _1021 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1023 = floor(_925);
    float _1025 = _1005 * _993;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1029 = _525 + _1027;
    float _1031 = _1019 + (-1.0);
    float _1033 = fma(_961, _1029, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1035 = _1007 > 0.0;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = _1007 >= 0.0;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1053 = _525 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1057 = _525 + _1055;
    bool _1059 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_525);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = exp2(_885);
    bool _1073 = _1023 > 0.0;
    float _1075 = fma(_963, _1053, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1077 = _1023 >= 0.0;
    bool _1079 = isnan(_1023);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_981, _1057, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1089 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1091 = isnan(_525);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1069;
    float _1103 = _1101 + 1.0;
    bool _1105 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1107 = isnan(_525);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    bool _1117 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = isnan(_525);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1099;
    float _1131 = _1129 + 1.0;
    bool _1133 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1135 = isnan(_525);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -_1115;
    float _1147 = _1145 + 1.0;
    float _1149 = _1115 * _1103;
    float _1151 = _1127 * _1131;
    float _1153 = -_1127;
    float _1155 = _1153 + 1.0;
    float _1157 = _1099 * _1147;
    float _1159 = in.m_77.x;
    float _1161 = in.m_77.y;
    float _1163 = in.m_77.z;
    float _1165 = _975 * _1155;
    float _1167 = -_975;
    float _1169 = _1167 + 1.0;
    bool _1171 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1173 = isnan(1.0);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1179 = _1175 || _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    float _1185 = -_1071;
    float _1187 = _1185 + 1.0;
    float _1189 = _883 * _1169;
    float _1191 = _903 * _907;
    float _1193 = -_903;
    float _1195 = _1193 + 1.0;
    float _1197 = 1.0 / _1183;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1201 = _525 + _1199;
    float _1203 = _991 ? _1187 : 0.0;
    float _1205 = _1143 * _1195;
    float _1207 = -_1143;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_919, _1201, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1215 = _525 + _1213;
    float _1217 = _1033 * _1205;
    int _1219 = _1047 ? 0 : 1;
    float _1221 = fma(_1011, _1215, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    int _1225 = ~_977;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = in.m_83.x;
    float _1233 = in.m_83.y;
    float _1235 = in.m_83.z;
    int _1237 = _1229;
    if (!_941)
    {
        int _1239 = ~_977;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    float _1245 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1247 = _1203 * _1197;
        _170 = _1247;
    }
    float _1249 = _170;
    int _1251 = _1085 ? 0 : 1;
    float _1253 = fma(_565, 78.233001708984375, _1245);
    float _1255 = fma(_208, 78.233001708984375, _1245);
    float _1257 = _565 + (-0.5);
    float _1259 = _1253 * 0.15915493667125701904296875;
    int _1261 = abs(_765);
    float _1263 = _1255 * 0.15915493667125701904296875;
    int _1265 = ~_1219;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = _1269;
    if (!_1035)
    {
        int _1273 = ~_1219;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = _1259 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = float(_1243);
    float _1285 = fma(_1075, _1191, _1223);
    float _1287 = float(_1261);
    int _1289 = ~_1251;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1087, _1189, _1285);
    float _1297 = _1263 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1287 * _1283;
    int _1303 = abs(_771);
    float _1305 = fma(_1211, _1165, _1295);
    int _1307 = _1293;
    if (!_1073)
    {
        int _1309 = ~_1251;
        int _1311 = _1309 + 1;
        _1307 = _1311;
    }
    int _1313 = _1307;
    float _1315 = _1301 * (-2.0);
    float _1317 = float(_909);
    float _1319 = fma(_1221, _1151, _1305);
    float _1321 = _1281 * 43758.546875;
    float _1323 = fma(_1315, _1233, _1233);
    float _1325 = float(_1277);
    float _1327 = fma(_1037, _1315, _1037);
    float _1329 = floor(_1321);
    float _1331 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1323);
    float _1333 = -_583;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1317 * _1325;
    float _1339 = _1299 * 43758.546875;
    float _1341 = fma(_1327, _1249, _1331);
    float _1343 = float(_1313);
    float _1345 = _1337 * (-2.0);
    float _1347 = float(_1303);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _208 + (-0.5);
    float _1353 = fma(_1345, _1231, _1231);
    float _1355 = fma(_1049, _1345, _1049);
    float _1357 = _1347 * _1343;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1361 = _525 + _1359;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1353);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1367 = _525 + _1365;
    float _1369 = _1357 * (-2.0);
    float _1371 = floor(_1339);
    float _1373 = fma(_1355, _1249, _1363);
    float _1375 = fma(_1025, _1361, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1377 = fma(_1369, _1235, _1235);
    float _1379 = fma(_1021, _1369, _1021);
    float _1381 = _1373 * 0.15915493667125701904296875;
    float _1383 = fma(_995, _1367, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1385 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1377);
    float _1387 = _871 * _871;
    float _1389 = fma(_1375, _1157, _1319);
    float _1391 = -_1329;
    float _1393 = _1321 + _1391;
    float _1395 = fma(_1379, _1249, _1385);
    float _1397 = -_773;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1401 = in.m_85.x;
    float _1403 = in.m_85.y;
    float _1405 = in.m_85.z;
    float _1407 = fma(_1383, _1149, _1389);
    float _1409 = fma(_1399, _1399, _1387);
    float _1411 = in.m_87.x;
    float _1413 = in.m_87.y;
    float _1415 = in.m_87.z;
    float _1417 = -_1371;
    float _1419 = _1339 + _1417;
    float _1421 = fma(_1393, 4.0, -2.0);
    float _1423 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1407);
    float _1425 = fma(_891, _891, _1409);
    float _1427 = _182 * _182;
    float _1429 = _1419 * 0.5;
    float _1431 = _1423 * _1421;
    float _1433 = _1423 * _1419;
    float _1435 = _1433 * 4.0;
    float _1437 = _1349 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    float _1441 = -_1429;
    float _1443 = fma(_1427, 1.5, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = _1431 * 0.15915493667125701904296875;
    float _1449 = _1395 * 0.15915493667125701904296875;
    float _1451 = -_593;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = -_601;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = -_1405;
    float _1465 = _1163 + _1463;
    float _1467 = -_1159;
    float _1469 = _1467 + _1401;
    float _1471 = _503 * _1415;
    float _1473 = fma(_1445, _1465, _1405);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1481 = _501 * _1413;
    float _1483 = fma(_1435, _1163, _1473);
    float _1485 = -_1161;
    float _1487 = _1485 + _1403;
    float _1489 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1479);
    float _1491 = _499 * _1411;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1489);
    float _1499 = _1349 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1505 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1507 = _1477 * _1487;
    float _1509 = -_1495;
    float _1511 = fma(_1477, _1469, _1509);
    float _1513 = 1.0 / _1503;
    float _1515 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1505);
    float _1517 = fma(_1461, _1469, _1507);
    float _1519 = _1335 * _1335;
    float _1521 = _1511 + _1159;
    float _1523 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1515);
    float _1525 = fma(_1453, _1453, _1519);
    float _1527 = _1381 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = -_1511;
    float _1535 = fma(_1533, _1445, _1521);
    float _1537 = fma(_1457, _1457, _1525);
    float _1539 = _1531 + _1503;
    float _1541 = fma(_1435, _1159, _1535);
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1381 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1539 * _1513;
    float _1551 = _1549 * 0.5;
    float _1553 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1557 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
    float _1559 = _779 + _1553;
    float _1561 = _1449 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1529 * _1439;
    float _1567 = _1529 * _1501;
    float _1569 = sqrt(_1425);
    float _1571 = _1547 * _1501;
    float _1573 = _1547 * _1439;
    float _1575 = rsqrt(_1537);
    float _1577 = fma(_1563, _1571, _1565);
    float _1579 = fma(_1563, _1565, _1571);
    float _1581 = _1517 + _1161;
    float _1583 = -_1573;
    float _1585 = fma(_1563, _1567, _1583);
    float _1587 = -_1567;
    float _1589 = fma(_1563, _1573, _1587);
    float _1591 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = -_1517;
    float _1595 = fma(_1593, _1445, _1581);
    float _1597 = 1.0 / _1557;
    float _1599 = _725 * _1569;
    float _1601 = fma(_1435, _1161, _1595);
    float _1603 = _1599 * _1543;
    float _1605 = _1599 * _1591;
    float _1607 = _1599 * _1493;
    float _1609 = _1453 * _1575;
    float _1611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1541);
    float _1613 = _1457 * _1575;
    float _1615 = _1335 * _1575;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1619 = _1609 * _1617;
    float _1621 = _1611 * _1603;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = _1613 * _1623;
    float _1627 = _1449 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1633 = _1597 * _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1637 = -_1619;
    float _1639 = fma(_1613, _1635, _1637);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1643 = _1615 * _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1647 = -_1625;
    float _1649 = fma(_1615, _1645, _1647);
    float _1651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1483);
    float _1653 = _1639 * _1639;
    bool _1655 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -_1643;
    float _1661 = fma(_1609, _1657, _1659);
    bool _1663 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1665 = fma(_1649, _1649, _1653);
    float _1667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1601);
    float _1669 = _1651 * _1605;
    float _1671 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1673 = fma(_1661, _1661, _1665);
    float _1675 = _1667 * _1607;
    bool _1677 = !_1655;
    int _1679 = _1677 ? 0 : 1;
    float _1681 = _1547 * _1629;
    float _1683 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1671);
    float _1685 = _1529 * _1629;
    int _1687 = 2;
    float _1689 = _1559;
    float _1691 = _1477;
    if (!_1655)
    {
        _1687 = 1;
    }
    int _1693 = _1687;
    float _1695 = rsqrt(_1673);
    int _1697 = _1693;
    if (!_1663)
    {
        _1697 = _1679;
    }
    int _1699 = _1697;
    float _1701 = -_1675;
    float _1703 = _1563 * _1701;
    float _1705 = _1681 * _1675;
    float _1707 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1683);
    float _1709 = _1501 * _1629;
    float _1711 = _1685 * _1675;
    int _1713 = _1699 << 6;
    float _1715 = _1439 * _1629;
    float _1717 = fma(_1709, _1621, _1703);
    float _1719 = fma(_1577, _1621, _1705);
    float _1721 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1723 = fma(_1585, _1621, _1711);
    float _1725 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1727 = _1713 + 96;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    float _1745 = fma(_1589, _1669, _1719);
    float _1747 = _1649 * _1695;
    float _1749 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1725);
    float _1751 = _1639 * _1695;
    float _1753 = _1661 * _1695;
    float _1755 = _1615 * _1747;
    float _1757 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1749);
    int _1759 = _1713 + 104;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = _1613 * _1751;
    float _1779 = -_1755;
    float _1781 = fma(_1609, _1751, _1779);
    float _1783 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1785 = trunc(_1721);
    int _1787 = int(_1785);
    float _1789 = -_1777;
    float _1791 = fma(_1615, _1753, _1789);
    float _1793 = fma(_1715, _1669, _1717);
    float _1795 = _1781 * _1745;
    int _1797 = _1713 + 64;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    float _1815 = fma(_1579, _1669, _1723);
    float _1817 = _1791 * _1745;
    float _1819 = fma(_1753, _1793, _1795);
    float _1821 = trunc(_1783);
    int _1823 = int(_1821);
    bool _1825 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_1747, _1793, _1817);
    float _1837 = fma(_1613, _1815, _1819);
    int _1839 = _1713 + 48;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    float _1857 = fma(_1609, _1815, _1835);
    float _1859 = _601 + _1837;
    int _1861 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1863 = _1787 + _1861;
    int _1865 = _1863 + 1;
    float _1867 = _593 + _1857;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1871 = _1859 + _1869;
    int _1873 = _1713 + 56;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    bool _1891 = _1865 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1895 = _1867 + _1893;
    float _1897 = _1871 * _1871;
    int _1899 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1901 = _1823 + _1899;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1895, _1897);
    int _1907 = _1713 + 72;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = _1865 | _1903;
    float _1927 = sqrt(_1905);
    bool _1929 = _1925 < 0;
    bool _1931 = _1929 || _1891;
    float _1933 = _1609 * _1753;
    int _1935 = _1713 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    bool _1953 = _1903 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1955 = _1953 || _1931;
    float _1957 = _1559 * _1743;
    float _1959 = -_1933;
    float _1961 = fma(_1613, _1747, _1959);
    float _1963 = fma(_785, _1735, _1957);
    float _1965 = _1961 * _1745;
    float _1967 = fma(_793, _1767, _1963);
    float _1969 = fma(_1751, _1793, _1965);
    bool _1971 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1973 = _1865;
    int _1975 = as_type<int>(_1965);
    float _1977 = _1867;
    float _1979 = _1859;
    if (!_1955)
    {
        int _1981 = _1903 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1983 = _1981 + _1865;
        _1973 = _1983;
    }
    int _1985 = _1973;
    float _1987 = _1967 + _1775;
    float _1989 = _1745;
    if (!_1955)
    {
        float _1991 = floor(_1721);
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1559 * _1813;
    int _1997 = as_type<int>(_1813);
    float _1999 = _1995;
    if (!_1955)
    {
        int _2001 = _1985 << 2;
        _1975 = _2001;
    }
    int _2003 = _1975;
    float _2005 = fma(_785, _1805, _1995);
    if (!_1955)
    {
        int _2007 = 12 & _2003;
        _1997 = _2007;
    }
    int _2009 = _1997;
    float _2011 = 1.0 / _1987;
    float _2013 = _1559 * _1855;
    float _2015 = fma(_1615, _1815, _1969);
    float _2017 = fma(_785, _1847, _2013);
    float _2019 = _583 + _2015;
    int _2021 = as_type<int>(_2013);
    if (!_1955)
    {
        uint _2023 = uint(int(uint(_1985) >> uint(2)));
        _2021 = int(_2023);
    }
    int _2025 = _2021;
    float _2027 = fma(_793, _1881, _2017);
    int _2029 = _2025;
    if (!_1955)
    {
        int _2031 = _2025 << 4;
        int _2033 = _2031 + _2009;
        _2029 = _2033;
    }
    int _2035 = _2029;
    if (!_1971)
    {
        _1999 = _2019;
    }
    float _2037 = _1999;
    float _2039 = fma(_793, _1915, _2005);
    bool _2041 = !_1971;
    float _2043 = _2037;
    float _2045 = _1951;
    if (!_2041)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2051 = _1927 + _2049;
        float _2053 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = rsqrt(_1905);
        float _2057 = _2051 * _2047;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = sin(_2061);
        float _2065 = _2059 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = fma(_2063, _2053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2071 = _2055 * _2069;
        float _2073 = _2067 + (-1.0);
        float _2075 = fma(_1895, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2077 = fma(_1871, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2079 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2081 = fma(_2019, _2067, _2079);
        _1977 = _2075;
        _2043 = _2081;
        _1979 = _2077;
    }
    float _2083 = _1977;
    float _2085 = _2043;
    float _2087 = _1979;
    float _2089 = -_773;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2093 = -_767;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2097 = -_781;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2101 = _2027 + _1889;
    float _2103 = _2039 + _1923;
    float _2105 = _2095;
    float _2107 = _2099;
    if (_1833)
    {
        _775 = _2091;
    }
    float _2109 = _775;
    float _2111 = _2109;
    if (!_1833)
    {
        float _2113 = _789 * _789;
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = -_593;
        float _2119 = _2117 + _2083;
        float _2121 = fma(_797, _797, _2113);
        float _2123 = fma(_803, _803, _2121);
        float _2125 = 1.0 / _1599;
        float _2127 = sqrt(_2123);
        float _2129 = precise::min(_2127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2131 = _2129 * _2115;
        float _2133 = -_583;
        float _2135 = _2133 + _2085;
        float _2137 = -_601;
        float _2139 = _2137 + _2087;
        float _2141 = _2131 * _2125;
        float _2143 = fma(_2135, _2141, _779);
        float _2145 = fma(_2119, _2141, _785);
        float _2147 = fma(_2139, _2141, _793);
        _2105 = _2143;
        _2111 = _2145;
        _2107 = _2147;
    }
    float _2149 = _2105;
    float _2151 = _2111;
    float _2153 = _2107;
    int _2155 = _1713 + 88;
    uint _2157 = uint(int(uint(_2155) >> uint(2)));
    uint _2159 = uint(int(uint(int(_2157)) >> uint(2)));
    int _2161 = int(_2157) & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    int _2165 = int(_2157) + 1;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    int _2169 = _2165 & 3;
    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
    float _2173 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = _2101 * _2011;
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2179 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2177);
    float _2187 = _803;
    if (!_1955)
    {
        int _2189 = _2035 + 400;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
        int _2195 = int(_2191) & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        _2187 = _2197;
    }
    float _2199 = _2187;
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2205 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2185);
    bool _2207 = _2175 >= 0.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2201);
    float _2211 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2215 = _2103 * _2011;
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2221 = _2175 <= 1.0;
    bool _2223 = _2221 && _2207;
    float _2225 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2227 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2213);
    float _2229 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2219);
    bool _2231 = _2215 >= 0.0;
    bool _2233 = _2231 && _2223;
    float _2235 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2237 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    bool _2241 = _2215 <= 1.0;
    bool _2243 = _2241 && _2233;
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = _1889;
    if (!_1955)
    {
        float _2249 = floor(_1783);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2255 = _1559 * _1951;
    float _2257 = -_2245;
    float _2259 = fma(_2257, _2235, 1.0);
    float _2261 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2265 = fma(_785, _1943, _2255);
    float _2267 = log2(_2259);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2263);
    float _2273 = _2259;
    if (_2243)
    {
        float _2275 = float(_1699);
        _2045 = _2275;
    }
    float _2277 = _2045;
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2281 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2271);
    float _2283 = 1.0 / _2253;
    float _2285 = _2281;
    if (!_1955)
    {
        float _2287 = -_2251;
        float _2289 = _1783 + _2287;
        _2273 = _2289;
    }
    float _2291 = _2273;
    float _2293 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2279);
    float _2295 = fma(_793, _2163, _2265);
    float _2297 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2281);
    float _2299 = _2295 + _2171;
    float _2301 = _2255;
    if (_2243)
    {
        float _2303 = rint(_2277);
        float _2305 = precise::max(_2303, 0.0);
        uint _2307 = uint(_2305);
        uint _2309 = clamp(_2307, 0u, 65535u);
        _2301 = as_type<float>(_2309);
    }
    float _2311 = _2301;
    float _2313 = _2267 * 0.693147182464599609375;
    float _2315 = _2299 * _2011;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = _2299;
    if (!_1955)
    {
        float _2321 = rint(_2199);
        float _2323 = precise::max(_2321, 0.0);
        uint _2325 = uint(_2323);
        uint _2327 = clamp(_2325, 0u, 65535u);
        _2319 = as_type<float>(_2327);
    }
    float _2329 = _2319;
    float _2331 = _2293 * _2283;
    float _2333 = _2297 * _2283;
    float _2335 = fma(_2331, 0.5, 0.5);
    float _2337 = fma(_2333, -0.5, 0.5);
    float _2339 = _2331;
    if (!_1955)
    {
        float _2341 = -_1993;
        float _2343 = _1721 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = _2215;
    if (_2243)
    {
        float3 _6966 = float3(_2175, _2215, float(as_type<int>(_2311)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2349 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2315, level(0.0));
        _2347 = _2349;
    }
    float _2351 = _2347;
    float3 _6980 = float3(_2335, _2337, _2317);
    float _2353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2335, _2337, _2317);
    float4 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _2356.w;
    float _2366 = _1993;
    if (!_1955)
    {
        float3 _7012 = float3(_2345, _2291, float(as_type<int>(_2329)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (_1955)
    {
        _2285 = 1.0;
    }
    float _2372 = _2285;
    float _2374 = _2372;
    float _2376 = _2370;
    if (!_1955)
    {
        int _2378 = _1985 << 4;
        int _2380 = _2378 + 2048;
        uint _2382 = uint(int(uint(_2380) >> uint(2)));
        uint _2384 = uint(int(uint(int(_2382)) >> uint(2)));
        int _2386 = int(_2382) & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = int(_2382) + 1;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        int _2394 = _2390 & 3;
        float _2396 = (*spvDescriptorSet0.vp_c15)._m0[int(_2392)][_2394];
        int _2398 = _2380 + 8;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        float _2416 = _1559 * _2396;
        float _2418 = fma(_785, _2388, _2416);
        float _2420 = fma(_793, _2406, _2418);
        float _2422 = _2420 + _2414;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = -_2424;
        float _2428 = _2426 + _2370;
        float _2430 = fma(_2428, 500.0, 1.5);
        float _2432 = exp2(_2430);
        float _2434 = 0.0 + _2432;
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        _1689 = _2416;
        _2374 = _2436;
    }
    float _2438 = _1689;
    float _2440 = _2374;
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2444 = _2149 + _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2151 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2452 = _2153 + _2450;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = rsqrt(_2458);
    float _2462 = sqrt(_2458);
    float _2464 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2466 = _2448 * _2464;
    float _2468 = _2452 * _2464;
    float _2470 = _2466 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 + _2472;
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = _2476 + _2480;
    float _2484 = _2438;
    float _2486 = _2474;
    float _2488 = _2482;
    float _2490 = _2444;
    float _2492 = _2466;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    if (_2478)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2500;
    }
    float _2502 = _2484;
    if (_2478)
    {
        float _2504 = rsqrt(_2474);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2478)
    {
        float _2508 = _2482 * _2502;
        _2488 = _2508;
    }
    float _2510 = _2488;
    if (_2478)
    {
        float _2512 = _2510 * 0.15915493667125701904296875;
        _2376 = _2512;
    }
    float _2514 = _2376;
    float _2516 = _793;
    if (_2478)
    {
        float _2518 = _2514 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2526 = precise::max(0.0, _2524);
    float _2528 = _2502;
    float _2530 = _2526;
    if (_2478)
    {
        float _2532 = _2514 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        _2528 = _2534;
    }
    float _2536 = _2528;
    float _2538 = -_2464;
    float _2540 = -_2526;
    float _2542 = fma(_2444, _2538, _2540);
    if (_2478)
    {
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2544;
    }
    float _2546 = _2490;
    float _2548 = _2546;
    float _2550 = _2522;
    if (_2478)
    {
        float _2552 = fma(_2522, _2546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2548 = _2552;
    }
    float _2554 = _2548;
    float _2556 = _2554;
    if (_2478)
    {
        float _2558 = _2536 + (-1.0);
        _2530 = _2558;
    }
    float _2560 = _2530;
    float _2562 = _2560;
    if (_2478)
    {
        float _2564 = _2506 * _2554;
        _2550 = _2564;
    }
    float _2566 = _2550;
    if (!_2478)
    {
        _2556 = _2542;
    }
    float _2568 = _2556;
    float _2570 = _2568;
    if (_2478)
    {
        float _2572 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2572;
    }
    float _2574 = _2562;
    if (_2478)
    {
        float _2576 = _2466 * _2566;
        _2492 = _2576;
    }
    float _2578 = _2492;
    if (_2478)
    {
        float _2580 = _2468 * _2566;
        _2494 = _2580;
    }
    float _2582 = _2494;
    if (_2478)
    {
        float _2584 = fma(_2542, _2536, _2574);
        _2570 = _2584;
    }
    float _2586 = _2570;
    if (_2478)
    {
        float _2588 = _2578 * _2578;
        _2496 = _2588;
    }
    float _2590 = _2496;
    if (_2478)
    {
        float _2592 = _2582 * _2582;
        _2498 = _2592;
    }
    float _2594 = _2498;
    float _2596 = fma(_2586, _2586, _2590);
    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2600 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2598);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = _2596 + _2594;
    float _2606 = -_2602;
    float _2608 = _2606 + 1.0;
    float _2610 = rsqrt(_2604);
    float _2612 = abs(_2608);
    float _2614 = log2(_2612);
    float _2616 = _2610 * _2578;
    float _2618 = _2610 * _2586;
    float _2620 = _2610 * _2582;
    float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = -_2622;
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2624);
    float _2628 = -_2620;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2626);
    float _2632 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = exp2(_2632);
    float _2638 = fma(_2630, 0.5, 0.5);
    float _2640 = fma(_2638, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2642 = sqrt(_2634);
    float _2644 = fma(_2638, _2640, -0.212114393711090087890625);
    float _2646 = _2618 + 1.0;
    float _2648 = fma(_2638, _2644, 1.570728778839111328125);
    float _2650 = -_2618;
    float _2652 = fma(_2636, _2646, _2650);
    float _2654 = fma(_2652, 0.5, 0.5);
    float _2656 = _2642 * 0.636619746685028076171875;
    float _2658 = -_2648;
    float _2660 = fma(_2656, _2658, 1.0);
    float2 _7461 = float2(_2660, _2654);
    float3 _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2666 = _2664.x;
    float _2668 = _2664.y;
    float _2670 = _2664.z;
    float _2672 = in.m_89.x;
    float _2674 = in.m_89.y;
    float _2676 = abs(_1633);
    float _2678 = log2(_2676);
    bool _2680 = _1601 != 0.0;
    bool _2682 = isnan(_1601);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    float _2690 = _1681 * _1791;
    float _2692 = in.m_89.z;
    float _2694 = _1681 * _1961;
    bool _2696 = _1541 == 0.0;
    bool _2698 = !_2688;
    bool _2700 = _2696 && _2698;
    float _2702 = in.m_91.x;
    float _2704 = in.m_91.y;
    float _2706 = in.m_91.z;
    float _2708 = in.m_91.w;
    float _2710 = _1681 * _1781;
    bool _2712 = _1483 == 0.0;
    bool _2714 = _2712 && _2700;
    float _2716 = -_1563;
    float _2718 = fma(_2716, _1747, _2690);
    float _2720 = -_1563;
    float _2722 = fma(_2720, _1751, _2694);
    float _2724 = -_1563;
    float _2726 = fma(_2724, _1753, _2710);
    float _2728 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2730 = _1633 <= 8000.0;
    bool _2732 = isnan(_1633);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(8000.0);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2744 = fma(_1685, _1615, _2722);
    float _2746 = -_835;
    float _2748 = _2746 + 1.0;
    float _2750 = exp2(_2728);
    float _2752 = _1477 * _2674;
    float _2754 = _1461 * _2674;
    float _2756 = fma(_1461, _2672, _2752);
    float _2758 = exp2(_2742);
    float _2760 = _2752;
    float _2762 = _2674;
    float _2764 = _2672;
    if (_2714)
    {
        _2760 = _2692;
    }
    float _2766 = _2760;
    float _2768 = -_2754;
    float _2770 = fma(_1477, _2672, _2768);
    float _2772 = _2756 * _2702;
    float _2774 = _2766;
    if (_2714)
    {
        _2762 = _2756;
    }
    float _2776 = _2762;
    float _2778 = _2776;
    if (!_2714)
    {
        float _2780 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2778 = _2780;
    }
    float _2782 = _2778;
    if (_2714)
    {
        _1691 = _2766;
    }
    float _2784 = _1691;
    float _2786 = _1577 * _1791;
    float _2788 = _2784;
    if (!_2714)
    {
        _2774 = _2692;
    }
    float _2790 = _2774;
    float _2792 = -_2772;
    float _2794 = fma(_2770, _2704, _2792);
    if (_2714)
    {
        _2764 = _2770;
    }
    float _2796 = _2764;
    float _2798 = _2796;
    if (!_2714)
    {
        float _2800 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2770);
        _2798 = _2800;
    }
    float _2802 = _2798;
    float _2804 = _2770 * _2706;
    float _2806 = _2704 * _2790;
    float _2808 = _1577 * _1781;
    float _2810 = _1589 * _1781;
    float _2812 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2806;
    float _2818 = fma(_2756, _2706, _2816);
    float _2820 = fma(_1709, _1747, _2786);
    if (!_2714)
    {
        float _2822 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2788 = _2822;
    }
    float _2824 = _2788;
    float _2826 = fma(_2814, -2.0, 3.0);
    float _2828 = _2814 * _2814;
    float _2830 = _1577 * _1961;
    float _2832 = _1589 * _1791;
    float _2834 = _1589 * _1961;
    float _2836 = -_2804;
    float _2838 = fma(_2702, _2790, _2836);
    float _2840 = fma(_1709, _1751, _2830);
    float _2842 = fma(_1715, _1747, _2832);
    float _2844 = fma(_1709, _1753, _2808);
    float _2846 = fma(_1685, _1609, _2718);
    float _2848 = fma(_1715, _1751, _2834);
    float _2850 = fma(_1715, _1753, _2810);
    float _2852 = fma(_1585, _1615, _2840);
    float _2854 = fma(_1685, _1613, _2726);
    float _2856 = fma(_1579, _1609, _2842);
    float _2858 = fma(_1585, _1609, _2820);
    float _2860 = _2846 * _2704;
    float _2862 = fma(_1579, _1615, _2848);
    float _2864 = _2838 * _2708;
    float _2866 = fma(_1579, _1613, _2850);
    float _2868 = fma(_1585, _1613, _2844);
    float _2870 = _2744 * _2704;
    float _2872 = _2854 * _2704;
    float _2874 = fma(_2858, _2702, _2860);
    float _2876 = _2846 * _2782;
    float _2878 = _2744 * _2782;
    float _2880 = _2854 * _2782;
    float _2882 = _2864 * _2846;
    float _2884 = _2864 * _2744;
    float _2886 = _2864 * _2854;
    float _2888 = fma(_2852, _2702, _2870);
    float _2890 = fma(_2868, _2702, _2872);
    float _2892 = _2794 * _2708;
    float _2894 = fma(_2856, _2706, _2874);
    float _2896 = _2818 * _2708;
    float _2898 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2900 = fma(_2858, _2802, _2876);
    float _2902 = _2828 * _2826;
    float _2904 = fma(_2896, _2858, _2882);
    float _2906 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2898);
    float _2908 = fma(_2896, _2852, _2884);
    float _2910 = fma(_2896, _2868, _2886);
    float _2912 = fma(_2868, _2802, _2880);
    float _2914 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2906);
    float _2916 = fma(_2862, _2706, _2888);
    float _2918 = fma(_2852, _2802, _2878);
    float _2920 = fma(_2866, _2706, _2890);
    float _2922 = fma(_2892, _2866, _2910);
    float _2924 = fma(_2866, _2824, _2912);
    float _2926 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2914);
    float _2928 = -_2902;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2856, _2824, _2900);
    float _2934 = fma(_2862, _2824, _2918);
    float _2936 = _2926 + _2253;
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2902);
    float _2940 = -_2750;
    float _2942 = _2940 + 1.0;
    float _2944 = fma(_2892, _2856, _2904);
    float _2946 = _2936 * 0.5;
    float _2948 = _2740 * _2938;
    float _2950 = _2936;
    float _2952 = _2946;
    if (!_2243)
    {
        _2950 = 1.0;
    }
    float _2954 = _2950;
    float _2956 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = _2954;
    if (_2243)
    {
        bool _2960 = _2351 >= _2315;
        bool _2962 = isnan(_2351);
        bool _2964 = _2960 || _2962;
        bool _2966 = isnan(_2315);
        bool _2968 = _2964 || _2966;
        float _2970 = float(_2968);
        _2958 = _2970;
    }
    float _2972 = _2958;
    float _2974 = _2948 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2976 = fma(_2892, _2862, _2908);
    float _2978 = _2956 * _2353;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2748 * _2974;
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2972 * _2440;
    float _2990 = _2364 * _2978;
    float _2992 = -_2986;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2996 = _2364 * _2982;
    out.m_93.x = _2894;
    out.m_93.y = _2916;
    out.m_93.z = _2920;
    bool _2998 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3000 = isnan(_2462);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3006 = _3002 || _3004;
    float _3008 = -_2988;
    float _3010 = fma(_3008, _2994, 1.0);
    float _3012 = precise::clamp(_3010, 0.0, 1.0);
    out.m_95.x = _2944;
    out.m_95.y = _2976;
    out.m_95.z = _2922;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2297;
    out.gl_Position.z = _2926;
    out.gl_Position.w = _2253;
    out.m_97.x = _3014;
    float _3016 = _2974;
    float _3018 = _2988;
    float _3020 = _2982;
    float _3022 = _3012;
    float _3024 = _2253;
    if (!_3006)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3016;
    out.m_99.x = _2932;
    out.m_99.y = _2934;
    out.m_99.z = _2924;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3006)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3018;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3006)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3020;
    out.m_101.z = _2946;
    out.m_101.w = _2253;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3006)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3006)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _2952;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3006)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _3024;
    float _3058 = _2670 * _2978;
    float _3060 = fma(_2666, _2990, _2358);
    float _3062 = fma(_2668, _2990, _2360);
    float _3064 = fma(_2364, _3058, _2362);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2996;
    bool _3066 = !_3006;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2462);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2462 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = 1.0 / _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3090;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3120 = fma(_3114, _3094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3120;
            _3042 = _3128;
            _3054 = _3122;
            _3036 = _3126;
            _3070 = _3124;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2462);
            bool _3138 = _3134 || _3136;
            bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3142 = _3138 || _3140;
            if (!_3142)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3144 = _3052;
            _3054 = _3144;
            if (!_3142)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3146 = _3028;
            _3030 = _3146;
            if (!_3142)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3148 = _3068;
            _3070 = _3148;
            if (!_3142)
            {
                _3034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3150 = _3034;
            _3036 = _3150;
            if (!_3142)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3142)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3154 = _3046;
            bool _3156 = !_3142;
            _3048 = _3154;
            if (!_3156)
            {
                bool _3158 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2462);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2462 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = 1.0 / _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3176;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3206 = fma(_3200, _3180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3206;
                    _3042 = _3214;
                    _3054 = _3208;
                    _3036 = _3212;
                    _3070 = _3210;
                    _3048 = _3216;
                    _3132 = true;
                }
                else
                {
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3132 = false;
    float _3218 = _3030;
    float _3220 = _3042;
    float _3222 = _3054;
    float _3224 = _3036;
    float _3226 = _3070;
    float _3228 = _3048;
    float _3230 = fma(_2934, -0.5, 0.5);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3218;
    float _3236 = _3234 + _3220;
    float _3238 = -_3222;
    float _3240 = _3238 + _3224;
    float _3242 = -_3226;
    float _3244 = _3242 + _3228;
    bool _3246 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3248 = fma(_3232, _3236, _3218);
    float _3250 = fma(_3232, _3240, _3222);
    float _3252 = fma(_3232, _3244, _3226);
    float _3254 = _3248 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
    out.m_105.x = 0.0;
    float _3260 = -_3258;
    float _3262 = _3250 + _3260;
    float _3264 = -_3258;
    float _3266 = _3248 + _3264;
    float _3268 = -_3258;
    float _3270 = _3252 + _3268;
    float _3272 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3274 = fma(_3262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3278 = fma(_3270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    out.m_97.w = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        return out;
    }
    float _3280 = -_2149;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2151;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2153;
    float _3290 = _3288 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3292 = _3282 * _3282;
    float _3294 = fma(_3286, _3286, _3292);
    float _3296 = fma(_3290, _3290, _3294);
    float _3298 = sqrt(_3296);
    float _3300 = rsqrt(_3296);
    float _3302 = -_3298;
    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3306 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3286 * _3300;
    float _3312 = _3282 * _3300;
    float _3314 = abs(_3308);
    float _3316 = log2(_3314);
    float _3318 = _3290 * _3300;
    float _3320 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3322 = _2934 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2932, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2924, _3318, _3330);
    float _3338 = precise::clamp(_3336, 0.0, 1.0);
    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3342 = _3334 + _3340;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3346 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = exp2(_3344);
    float _3352 = _3350 * _3348;
    float _3354 = _3338 * _3352;
    float _3356 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3358 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3360 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3356;
    out.m_105.y = _3358;
    out.m_105.z = _3360;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3132 = false;
    bool _523 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_56.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_126);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_59.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3418 = as_type<float>(_142);
        out.gl_Position.z = _3418;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_61.w;
    float _148 = float(_126);
    float _150 = -_146;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_146);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    bool _164 = _152 >= _148;
    bool _166 = !_162;
    bool _168 = _164 || _166;
    float _170 = _152;
    if (_168)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _134;
    if (_168)
    {
        out.m_59.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _144 = as_type<int>(_174);
    }
    int _176 = _144;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3482 = as_type<float>(_176);
        out.gl_Position.z = _3482;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = 1.0 / _148;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _152 * _178;
    bool _184 = !_180;
    float _202;
    if (!_184)
    {
        float _186 = in.m_63.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _182;
    }
    _204 = false;
    float _206 = _202;
    float _208 = in.m_63.x;
    float _210 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = _206 + _212;
    float _216 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _218 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _220 = isnan(_206);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _238 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_206);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _232;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _254 = _210 * _208;
    float _256 = _216 * _208;
    float _258 = 1.0 / _236;
    float _260 = _214 * _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _262;
    float _266 = trunc(_254);
    int _268 = int(_266);
    bool _270 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _272 = isnan(_206);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    bool _282 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _284 = isnan(_206);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = trunc(_256);
    int _296 = int(_294);
    int _298 = _268 << 4;
    int _300 = _298 + 1968;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _304 = _206 + _302;
    float _306 = 1.0 / _264;
    int _308 = _300 + 8;
    uint _311 = uint(int(uint(_308) >> uint(2)));
    uint _313 = uint(int(uint(int(_311)) >> uint(2)));
    int _315 = int(_311) & 3;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[int(_313)][_315];
    float _319 = _304 * _258;
    float _321 = -_228;
    float _323 = _321 + 1.0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = _206 + _325;
    int _329 = _296 << 4;
    int _331 = _329 + 1712;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = _280 * _323;
    float _339 = -_280;
    float _341 = _339 + 1.0;
    uint _343 = uint(int(uint(_300) >> uint(2)));
    uint _345 = uint(int(uint(int(_343)) >> uint(2)));
    int _347 = int(_343) & 3;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[int(_345)][_347];
    int _351 = int(_343) + 1;
    uint _353 = uint(int(uint(_351) >> uint(2)));
    int _355 = _351 & 3;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[int(_353)][_355];
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _359;
    float _363 = fma(_335, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _365 = _292 * _341;
    float _367 = -_292;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _371;
    float _375 = fma(_361, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _377 = _327 * _306;
    uint _379 = uint(int(uint(_331) >> uint(2)));
    uint _381 = uint(int(uint(int(_379)) >> uint(2)));
    int _383 = int(_379) & 3;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[int(_381)][_383];
    int _387 = int(_379) + 1;
    uint _389 = uint(int(uint(_387) >> uint(2)));
    int _391 = _387 & 3;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[int(_389)][_391];
    float _395 = fma(_373, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _397;
    int _401 = _331 + 8;
    uint _403 = uint(int(uint(_401) >> uint(2)));
    uint _405 = uint(int(uint(int(_403)) >> uint(2)));
    int _407 = int(_403) & 3;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[int(_405)][_407];
    float _411 = _248 * _369;
    float _413 = _375 * _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _419 = _395 * _411;
    float _421 = _363 * _411;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _425 = _423 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _427 = fma(_417, _319, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _433 = -_248;
    float _435 = _433 + 1.0;
    float _437 = fma(_425, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_431, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].x, _421);
    float _443 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].y, _419);
    float _445 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[143].z, _413);
    float _447 = fma(_439, _365, _441);
    float _449 = fma(_437, _365, _443);
    float _451 = fma(_399, _377, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _453 = _357 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _455 = _349 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _459 = _317 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _461 = _453 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _463 = _455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _465;
    float _469 = _459 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = _385 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _393 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _475;
    float _479 = fma(_467, _377, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _481 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _483 = _473 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.x = _463;
    out.m_65.y = _461;
    out.m_65.z = _469;
    float _485 = fma(_477, _377, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _487 = _409 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_427, _365, _445);
    float _491 = fma(_479, _337, _447);
    float _493 = fma(_485, _337, _449);
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = fma(_451, _337, _489);
    float _499 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].x, _491);
    float _501 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].y, _493);
    out.m_67.x = _481;
    out.m_67.y = _483;
    out.m_67.z = _495;
    out.m_67.w = _457;
    float _503 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[146].z, _497);
    bool _505 = !_252;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _509 = _208 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[14].x, _152);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _182;
    }
    _523 = false;
    float _525 = _521;
    float _527 = in.m_56.x;
    float _529 = in.m_56.y;
    float _531 = in.m_56.z;
    float _533 = in.m_69.x;
    float _535 = in.m_69.y;
    float _537 = in.m_69.z;
    float _539 = in.m_69.w;
    float _541 = in.m_71.x;
    float _543 = in.m_71.y;
    float _545 = in.m_71.z;
    float _547 = in.m_71.w;
    float _549 = in.m_73.x;
    float _551 = in.m_73.y;
    float _553 = in.m_73.z;
    float _555 = in.m_73.w;
    float _557 = in.m_63.w;
    float _559 = in.m_75.y;
    float _561 = in.m_75.x;
    float _563 = _529 * _535;
    float _565 = in.m_63.y;
    float _567 = _529 * _543;
    float _569 = fma(_527, _533, _563);
    float _571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _573 = _529 * _551;
    float _575 = fma(_527, _541, _567);
    float _577 = fma(_531, _537, _569);
    float _579 = fma(_527, _549, _573);
    float _581 = fma(_531, _545, _575);
    float _583 = _577 + _539;
    int _585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _587 = _585 != 0;
    float _589 = fma(_531, _553, _579);
    float _591 = in.m_63.z;
    float _593 = _581 + _547;
    float _595 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _597 = _583 + _595;
    bool _599 = _557 > 0.5;
    float _601 = _589 + _555;
    float _603 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _605 = _593 + _603;
    float _607 = _597 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _609 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _611 = _609 != 0;
    float _613 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _615 = _601 + _613;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _619 = _617 != 0;
    float _621 = fma(_605, (*spvDescriptorSet0.vp_c8)._m0[28].x, _607);
    int _623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _625 = _623 != 0;
    float _627 = -_559;
    float _629 = _627 + 1.0;
    float _631 = _569;
    float _633 = _575;
    float _635 = _559;
    int _637 = as_type<int>(_531);
    bool _639 = _619;
    float _641 = _629;
    if (!_587)
    {
        _631 = _561;
    }
    float _643 = _631;
    float _645 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[28].z, _621);
    bool _647 = _565 > 0.5;
    float _649 = in.m_77.w;
    int _651 = _599 ? as_type<int>(_629) : as_type<int>(_559);
    float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _655 = _643;
    int _657 = _651;
    bool _659 = _647;
    if (!_587)
    {
        _633 = _643;
    }
    float _661 = _633;
    bool _663 = _645 >= 0.0;
    float _665 = _597 * _597;
    float _667 = _661;
    if (_587)
    {
        _655 = _561;
    }
    float _669 = _655;
    float _671 = _619 ? as_type<float>(_651) : _559;
    float _673 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _675 = fma(_605, _605, _665);
    if (_625)
    {
        float _677 = _647 ? _629 : _559;
        _635 = _677;
    }
    float _679 = _635;
    if (_587)
    {
        float _681 = -_669;
        float _683 = _681 + 1.0;
        _657 = as_type<int>(_683);
    }
    int _685 = _657;
    float _687 = as_type<float>(_685);
    if (_611)
    {
        float _689 = -_669;
        float _691 = _689 + 1.0;
        _637 = as_type<int>(_691);
    }
    int _693 = _637;
    if (_587)
    {
        bool _695 = _208 > 0.5;
        _659 = _695;
    }
    bool _697 = _659;
    float _699 = fma(_615, _615, _675);
    if (_611)
    {
        bool _701 = _591 > 0.5;
        _639 = _701;
    }
    bool _703 = _639;
    float _705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_611)
    {
        _641 = _669;
    }
    float _707 = _641;
    float _709 = _671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _711 = _707;
    if (_587)
    {
        float _713 = _697 ? as_type<float>(_685) : _669;
        _667 = _713;
    }
    float _715 = _667;
    if (_663)
    {
        out.m_59.x = 0.0;
    }
    if (_611)
    {
        float _717 = _703 ? as_type<float>(_693) : _669;
        _711 = _717;
    }
    float _719 = _711;
    float _721 = _679 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_663)
    {
        _687 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _723 = _687;
    float _725 = rsqrt(_699);
    float _727 = _715 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _729 = _719 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _731 = _709 * _673;
    float _733 = _721 * _653;
    float _735 = _727 * _571;
    int _737 = as_type<int>(_723);
    if (_663)
    {
        float _739 = _723 * 5.0;
        _737 = as_type<int>(_739);
    }
    int _741 = _737;
    float _743 = _729 * _705;
    out.m_79.w = _649;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    out.m_81.x = _735;
    out.m_81.y = _733;
    out.m_81.z = _743;
    out.m_81.w = _731;
    bool _757 = !_747;
    int _759 = _757 ? 0 : 1;
    float _761 = as_type<float>(_741);
    if (_663)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4469 = as_type<float>(_741);
        out.gl_Position.z = _4469;
    }
    bool _763 = !_751;
    int _765 = _763 ? 0 : 1;
    float _767 = _597 * _725;
    bool _769 = !_755;
    int _771 = _769 ? 0 : 1;
    float _773 = _605 * _725;
    float _775 = _767;
    if (_663)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _777 = -_767;
    float _779 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _583);
    float _781 = _615 * _725;
    float _783 = -_773;
    float _785 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[18].w, _593);
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _789 = _779 + _787;
    float _791 = -_781;
    float _793 = fma(_791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _601);
    float _795 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _797 = _785 + _795;
    float _799 = _789 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _803 = _793 + _801;
    float _805 = fma(_797, (*spvDescriptorSet0.vp_c8)._m0[28].x, _799);
    float _807 = fma(_803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _805);
    bool _809 = _807 >= 0.0;
    if (_809)
    {
        _761 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _811 = _761;
    int _813 = as_type<int>(_811);
    if (_809)
    {
        out.m_59.x = 0.0;
    }
    if (_809)
    {
        float _815 = _811 * 5.0;
        _813 = as_type<int>(_815);
    }
    int _817 = _813;
    if (_809)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4574 = as_type<float>(_817);
        out.gl_Position.z = _4574;
    }
    if (_809)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _819 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _821 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _823 = floor(_819);
    float _825 = floor(_821);
    float _827 = -_823;
    float _829 = _819 + _827;
    float _831 = -_825;
    float _833 = _821 + _831;
    float2 _4610 = float2(_829, _833);
    float _835 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4610, float2(0.0), isnan(_4610)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4610, float2(0.0), isnan(_4610)), level(0.0)).x;
    float _837 = _208 * 2.0;
    float _839 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _841 = log2(_839);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _859 = 1.0 / _845;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _869 = -_767;
    float _871 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[18].w, _597);
    bool _873 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _875 = isnan(_525);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = _841 * _152;
    float _887 = 1.0 / _857;
    float _889 = -_781;
    float _891 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _615);
    bool _893 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _895 = isnan(_525);
    bool _897 = _893 || _895;
    bool _899 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _901 = _897 || _899;
    float _903 = float(_901);
    float _905 = -_883;
    float _907 = _905 + 1.0;
    int _909 = abs(_759);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _915 = floor(_837);
    float _917 = 1.0 / _849;
    float _919 = _867 * _887;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _921;
    float _925 = _565 * 2.0;
    float _927 = 1.0 / _853;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _937;
    bool _941 = _915 > 0.0;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _947 = _915 >= 0.0;
    bool _949 = isnan(_915);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = 1.0 / _913;
    float _959 = _591 * 2.0;
    float _961 = _939 * _917;
    float _963 = _945 * _859;
    bool _965 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _967 = isnan(_525);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    int _977 = _955 ? 0 : 1;
    float _979 = 1.0 / _931;
    float _981 = _863 * _927;
    bool _983 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    bool _989 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _991 = _987 || _989;
    float _993 = 1.0 / _935;
    float _995 = _923 * _957;
    float _997 = _208 + _591;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _999;
    float _1003 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1005 = _1003 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1007 = floor(_959);
    float _1009 = _565 + _591;
    float _1011 = _1001 * _979;
    float _1013 = _997 + (-1.0);
    float _1015 = _591 + (-0.5);
    float _1017 = _1009 + (-1.0);
    float _1019 = _208 + _565;
    float _1021 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1023 = floor(_925);
    float _1025 = _1005 * _993;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1029 = _525 + _1027;
    float _1031 = _1019 + (-1.0);
    float _1033 = fma(_961, _1029, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1035 = _1007 > 0.0;
    float _1037 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1039 = _1007 >= 0.0;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan(0.0);
    bool _1047 = _1043 || _1045;
    float _1049 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1051 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1053 = _525 + _1051;
    float _1055 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1057 = _525 + _1055;
    bool _1059 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1061 = isnan(_525);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1067 = _1063 || _1065;
    float _1069 = float(_1067);
    float _1071 = exp2(_885);
    bool _1073 = _1023 > 0.0;
    float _1075 = fma(_963, _1053, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1077 = _1023 >= 0.0;
    bool _1079 = isnan(_1023);
    bool _1081 = _1077 || _1079;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    float _1087 = fma(_981, _1057, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1089 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1091 = isnan(_525);
    bool _1093 = _1089 || _1091;
    bool _1095 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1097 = _1093 || _1095;
    float _1099 = float(_1097);
    float _1101 = -_1069;
    float _1103 = _1101 + 1.0;
    bool _1105 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1107 = isnan(_525);
    bool _1109 = _1105 || _1107;
    bool _1111 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1113 = _1109 || _1111;
    float _1115 = float(_1113);
    bool _1117 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1119 = isnan(_525);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = -_1099;
    float _1131 = _1129 + 1.0;
    bool _1133 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1135 = isnan(_525);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = -_1115;
    float _1147 = _1145 + 1.0;
    float _1149 = _1115 * _1103;
    float _1151 = _1127 * _1131;
    float _1153 = -_1127;
    float _1155 = _1153 + 1.0;
    float _1157 = _1099 * _1147;
    float _1159 = in.m_77.x;
    float _1161 = in.m_77.y;
    float _1163 = in.m_77.z;
    float _1165 = _975 * _1155;
    float _1167 = -_975;
    float _1169 = _1167 + 1.0;
    bool _1171 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1173 = isnan(1.0);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1179 = _1175 || _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1183 = 1.0 + _1181;
    float _1185 = -_1071;
    float _1187 = _1185 + 1.0;
    float _1189 = _883 * _1169;
    float _1191 = _903 * _907;
    float _1193 = -_903;
    float _1195 = _1193 + 1.0;
    float _1197 = 1.0 / _1183;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1201 = _525 + _1199;
    float _1203 = _991 ? _1187 : 0.0;
    float _1205 = _1143 * _1195;
    float _1207 = -_1143;
    float _1209 = _1207 + 1.0;
    float _1211 = fma(_919, _1201, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1215 = _525 + _1213;
    float _1217 = _1033 * _1205;
    int _1219 = _1047 ? 0 : 1;
    float _1221 = fma(_1011, _1215, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1217);
    int _1225 = ~_977;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = in.m_83.x;
    float _1233 = in.m_83.y;
    float _1235 = in.m_83.z;
    int _1237 = _1229;
    if (!_941)
    {
        int _1239 = ~_977;
        int _1241 = _1239 + 1;
        _1237 = _1241;
    }
    int _1243 = _1237;
    float _1245 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1247 = _1203 * _1197;
        _170 = _1247;
    }
    float _1249 = _170;
    int _1251 = _1085 ? 0 : 1;
    float _1253 = fma(_565, 78.233001708984375, _1245);
    float _1255 = fma(_208, 78.233001708984375, _1245);
    float _1257 = _565 + (-0.5);
    float _1259 = _1253 * 0.15915493667125701904296875;
    int _1261 = abs(_765);
    float _1263 = _1255 * 0.15915493667125701904296875;
    int _1265 = ~_1219;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    int _1271 = _1269;
    if (!_1035)
    {
        int _1273 = ~_1219;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = _1259 * 6.283185482025146484375;
    float _1281 = sin(_1279);
    float _1283 = float(_1243);
    float _1285 = fma(_1075, _1191, _1223);
    float _1287 = float(_1261);
    int _1289 = ~_1251;
    int _1291 = _1289 + 1;
    int _1293 = _1291 + 1;
    float _1295 = fma(_1087, _1189, _1285);
    float _1297 = _1263 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1287 * _1283;
    int _1303 = abs(_771);
    float _1305 = fma(_1211, _1165, _1295);
    int _1307 = _1293;
    if (!_1073)
    {
        int _1309 = ~_1251;
        int _1311 = _1309 + 1;
        _1307 = _1311;
    }
    int _1313 = _1307;
    float _1315 = _1301 * (-2.0);
    float _1317 = float(_909);
    float _1319 = fma(_1221, _1151, _1305);
    float _1321 = _1281 * 43758.546875;
    float _1323 = fma(_1315, _1233, _1233);
    float _1325 = float(_1277);
    float _1327 = fma(_1037, _1315, _1037);
    float _1329 = floor(_1321);
    float _1331 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1323);
    float _1333 = -_583;
    float _1335 = _1333 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1337 = _1317 * _1325;
    float _1339 = _1299 * 43758.546875;
    float _1341 = fma(_1327, _1249, _1331);
    float _1343 = float(_1313);
    float _1345 = _1337 * (-2.0);
    float _1347 = float(_1303);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _208 + (-0.5);
    float _1353 = fma(_1345, _1231, _1231);
    float _1355 = fma(_1049, _1345, _1049);
    float _1357 = _1347 * _1343;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1361 = _525 + _1359;
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1353);
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1367 = _525 + _1365;
    float _1369 = _1357 * (-2.0);
    float _1371 = floor(_1339);
    float _1373 = fma(_1355, _1249, _1363);
    float _1375 = fma(_1025, _1361, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1377 = fma(_1369, _1235, _1235);
    float _1379 = fma(_1021, _1369, _1021);
    float _1381 = _1373 * 0.15915493667125701904296875;
    float _1383 = fma(_995, _1367, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1385 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1377);
    float _1387 = _871 * _871;
    float _1389 = fma(_1375, _1157, _1319);
    float _1391 = -_1329;
    float _1393 = _1321 + _1391;
    float _1395 = fma(_1379, _1249, _1385);
    float _1397 = -_773;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1401 = in.m_85.x;
    float _1403 = in.m_85.y;
    float _1405 = in.m_85.z;
    float _1407 = fma(_1383, _1149, _1389);
    float _1409 = fma(_1399, _1399, _1387);
    float _1411 = in.m_87.x;
    float _1413 = in.m_87.y;
    float _1415 = in.m_87.z;
    float _1417 = -_1371;
    float _1419 = _1339 + _1417;
    float _1421 = fma(_1393, 4.0, -2.0);
    float _1423 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1407);
    float _1425 = fma(_891, _891, _1409);
    float _1427 = _182 * _182;
    float _1429 = _1419 * 0.5;
    float _1431 = _1423 * _1421;
    float _1433 = _1423 * _1419;
    float _1435 = _1433 * 4.0;
    float _1437 = _1349 * 6.283185482025146484375;
    float _1439 = sin(_1437);
    float _1441 = -_1429;
    float _1443 = fma(_1427, 1.5, _1441);
    float _1445 = precise::clamp(_1443, 0.0, 1.0);
    float _1447 = _1431 * 0.15915493667125701904296875;
    float _1449 = _1395 * 0.15915493667125701904296875;
    float _1451 = -_593;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1455 = -_601;
    float _1457 = _1455 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1459 = _1447 * 6.283185482025146484375;
    float _1461 = sin(_1459);
    float _1463 = -_1405;
    float _1465 = _1163 + _1463;
    float _1467 = -_1159;
    float _1469 = _1467 + _1401;
    float _1471 = _503 * _1415;
    float _1473 = fma(_1445, _1465, _1405);
    float _1475 = _1447 * 6.283185482025146484375;
    float _1477 = cos(_1475);
    float _1479 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1481 = _501 * _1413;
    float _1483 = fma(_1435, _1163, _1473);
    float _1485 = -_1161;
    float _1487 = _1485 + _1403;
    float _1489 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1479);
    float _1491 = _499 * _1411;
    float _1493 = _1481 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1495 = _1461 * _1487;
    float _1497 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1489);
    float _1499 = _1349 * 6.283185482025146484375;
    float _1501 = cos(_1499);
    float _1503 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1505 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1507 = _1477 * _1487;
    float _1509 = -_1495;
    float _1511 = fma(_1477, _1469, _1509);
    float _1513 = 1.0 / _1503;
    float _1515 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1505);
    float _1517 = fma(_1461, _1469, _1507);
    float _1519 = _1335 * _1335;
    float _1521 = _1511 + _1159;
    float _1523 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1515);
    float _1525 = fma(_1453, _1453, _1519);
    float _1527 = _1381 * 6.283185482025146484375;
    float _1529 = sin(_1527);
    float _1531 = _1523 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1533 = -_1511;
    float _1535 = fma(_1533, _1445, _1521);
    float _1537 = fma(_1457, _1457, _1525);
    float _1539 = _1531 + _1503;
    float _1541 = fma(_1435, _1159, _1535);
    float _1543 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1545 = _1381 * 6.283185482025146484375;
    float _1547 = cos(_1545);
    float _1549 = _1539 * _1513;
    float _1551 = _1549 * 0.5;
    float _1553 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1557 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1555);
    float _1559 = _779 + _1553;
    float _1561 = _1449 * 6.283185482025146484375;
    float _1563 = sin(_1561);
    float _1565 = _1529 * _1439;
    float _1567 = _1529 * _1501;
    float _1569 = sqrt(_1425);
    float _1571 = _1547 * _1501;
    float _1573 = _1547 * _1439;
    float _1575 = rsqrt(_1537);
    float _1577 = fma(_1563, _1571, _1565);
    float _1579 = fma(_1563, _1565, _1571);
    float _1581 = _1517 + _1161;
    float _1583 = -_1573;
    float _1585 = fma(_1563, _1567, _1583);
    float _1587 = -_1567;
    float _1589 = fma(_1563, _1573, _1587);
    float _1591 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1593 = -_1517;
    float _1595 = fma(_1593, _1445, _1581);
    float _1597 = 1.0 / _1557;
    float _1599 = _725 * _1569;
    float _1601 = fma(_1435, _1161, _1595);
    float _1603 = _1599 * _1543;
    float _1605 = _1599 * _1591;
    float _1607 = _1599 * _1493;
    float _1609 = _1453 * _1575;
    float _1611 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1541);
    float _1613 = _1457 * _1575;
    float _1615 = _1335 * _1575;
    float _1617 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1619 = _1609 * _1617;
    float _1621 = _1611 * _1603;
    float _1623 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1625 = _1613 * _1623;
    float _1627 = _1449 * 6.283185482025146484375;
    float _1629 = cos(_1627);
    float _1631 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1633 = _1597 * _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1637 = -_1619;
    float _1639 = fma(_1613, _1635, _1637);
    float _1641 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1643 = _1615 * _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1647 = -_1625;
    float _1649 = fma(_1615, _1645, _1647);
    float _1651 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1483);
    float _1653 = _1639 * _1639;
    bool _1655 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -_1643;
    float _1661 = fma(_1609, _1657, _1659);
    bool _1663 = _1633 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1665 = fma(_1649, _1649, _1653);
    float _1667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1601);
    float _1669 = _1651 * _1605;
    float _1671 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1673 = fma(_1661, _1661, _1665);
    float _1675 = _1667 * _1607;
    bool _1677 = !_1655;
    int _1679 = _1677 ? 0 : 1;
    float _1681 = _1547 * _1629;
    float _1683 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1671);
    float _1685 = _1529 * _1629;
    int _1687 = 2;
    float _1689 = _1559;
    float _1691 = _1477;
    if (!_1655)
    {
        _1687 = 1;
    }
    int _1693 = _1687;
    float _1695 = rsqrt(_1673);
    int _1697 = _1693;
    if (!_1663)
    {
        _1697 = _1679;
    }
    int _1699 = _1697;
    float _1701 = -_1675;
    float _1703 = _1563 * _1701;
    float _1705 = _1681 * _1675;
    float _1707 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1683);
    float _1709 = _1501 * _1629;
    float _1711 = _1685 * _1675;
    int _1713 = _1699 << 6;
    float _1715 = _1439 * _1629;
    float _1717 = fma(_1709, _1621, _1703);
    float _1719 = fma(_1577, _1621, _1705);
    float _1721 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1723 = fma(_1585, _1621, _1711);
    float _1725 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1727 = _1713 + 96;
    uint _1729 = uint(int(uint(_1727) >> uint(2)));
    uint _1731 = uint(int(uint(int(_1729)) >> uint(2)));
    int _1733 = int(_1729) & 3;
    float _1735 = (*spvDescriptorSet0.vp_c15)._m0[int(_1731)][_1733];
    int _1737 = int(_1729) + 1;
    uint _1739 = uint(int(uint(_1737) >> uint(2)));
    int _1741 = _1737 & 3;
    float _1743 = (*spvDescriptorSet0.vp_c15)._m0[int(_1739)][_1741];
    float _1745 = fma(_1589, _1669, _1719);
    float _1747 = _1649 * _1695;
    float _1749 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1725);
    float _1751 = _1639 * _1695;
    float _1753 = _1661 * _1695;
    float _1755 = _1615 * _1747;
    float _1757 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1749);
    int _1759 = _1713 + 104;
    uint _1761 = uint(int(uint(_1759) >> uint(2)));
    uint _1763 = uint(int(uint(int(_1761)) >> uint(2)));
    int _1765 = int(_1761) & 3;
    float _1767 = (*spvDescriptorSet0.vp_c15)._m0[int(_1763)][_1765];
    int _1769 = int(_1761) + 1;
    uint _1771 = uint(int(uint(_1769) >> uint(2)));
    int _1773 = _1769 & 3;
    float _1775 = (*spvDescriptorSet0.vp_c15)._m0[int(_1771)][_1773];
    float _1777 = _1613 * _1751;
    float _1779 = -_1755;
    float _1781 = fma(_1609, _1751, _1779);
    float _1783 = _1757 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1785 = trunc(_1721);
    int _1787 = int(_1785);
    float _1789 = -_1777;
    float _1791 = fma(_1615, _1753, _1789);
    float _1793 = fma(_1715, _1669, _1717);
    float _1795 = _1781 * _1745;
    int _1797 = _1713 + 64;
    uint _1799 = uint(int(uint(_1797) >> uint(2)));
    uint _1801 = uint(int(uint(int(_1799)) >> uint(2)));
    int _1803 = int(_1799) & 3;
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[int(_1801)][_1803];
    int _1807 = int(_1799) + 1;
    uint _1809 = uint(int(uint(_1807) >> uint(2)));
    int _1811 = _1807 & 3;
    float _1813 = (*spvDescriptorSet0.vp_c15)._m0[int(_1809)][_1811];
    float _1815 = fma(_1579, _1669, _1723);
    float _1817 = _1791 * _1745;
    float _1819 = fma(_1753, _1793, _1795);
    float _1821 = trunc(_1783);
    int _1823 = int(_1821);
    bool _1825 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1833 = _1829 || _1831;
    float _1835 = fma(_1747, _1793, _1817);
    float _1837 = fma(_1613, _1815, _1819);
    int _1839 = _1713 + 48;
    uint _1841 = uint(int(uint(_1839) >> uint(2)));
    uint _1843 = uint(int(uint(int(_1841)) >> uint(2)));
    int _1845 = int(_1841) & 3;
    float _1847 = (*spvDescriptorSet0.vp_c15)._m0[int(_1843)][_1845];
    int _1849 = int(_1841) + 1;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    int _1853 = _1849 & 3;
    float _1855 = (*spvDescriptorSet0.vp_c15)._m0[int(_1851)][_1853];
    float _1857 = fma(_1609, _1815, _1835);
    float _1859 = _601 + _1837;
    int _1861 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1863 = _1787 + _1861;
    int _1865 = _1863 + 1;
    float _1867 = _593 + _1857;
    float _1869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1871 = _1859 + _1869;
    int _1873 = _1713 + 56;
    uint _1875 = uint(int(uint(_1873) >> uint(2)));
    uint _1877 = uint(int(uint(int(_1875)) >> uint(2)));
    int _1879 = int(_1875) & 3;
    float _1881 = (*spvDescriptorSet0.vp_c15)._m0[int(_1877)][_1879];
    int _1883 = int(_1875) + 1;
    uint _1885 = uint(int(uint(_1883) >> uint(2)));
    int _1887 = _1883 & 3;
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[int(_1885)][_1887];
    bool _1891 = _1865 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1895 = _1867 + _1893;
    float _1897 = _1871 * _1871;
    int _1899 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1901 = _1823 + _1899;
    int _1903 = _1901 + 1;
    float _1905 = fma(_1895, _1895, _1897);
    int _1907 = _1713 + 72;
    uint _1909 = uint(int(uint(_1907) >> uint(2)));
    uint _1911 = uint(int(uint(int(_1909)) >> uint(2)));
    int _1913 = int(_1909) & 3;
    float _1915 = (*spvDescriptorSet0.vp_c15)._m0[int(_1911)][_1913];
    int _1917 = int(_1909) + 1;
    uint _1919 = uint(int(uint(_1917) >> uint(2)));
    int _1921 = _1917 & 3;
    float _1923 = (*spvDescriptorSet0.vp_c15)._m0[int(_1919)][_1921];
    int _1925 = _1865 | _1903;
    float _1927 = sqrt(_1905);
    bool _1929 = _1925 < 0;
    bool _1931 = _1929 || _1891;
    float _1933 = _1609 * _1753;
    int _1935 = _1713 + 80;
    uint _1937 = uint(int(uint(_1935) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c15)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c15)._m0[int(_1947)][_1949];
    bool _1953 = _1903 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1955 = _1953 || _1931;
    float _1957 = _1559 * _1743;
    float _1959 = -_1933;
    float _1961 = fma(_1613, _1747, _1959);
    float _1963 = fma(_785, _1735, _1957);
    float _1965 = _1961 * _1745;
    float _1967 = fma(_793, _1767, _1963);
    float _1969 = fma(_1751, _1793, _1965);
    bool _1971 = _1927 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1973 = _1865;
    int _1975 = as_type<int>(_1965);
    float _1977 = _1867;
    float _1979 = _1859;
    if (!_1955)
    {
        int _1981 = _1903 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1983 = _1981 + _1865;
        _1973 = _1983;
    }
    int _1985 = _1973;
    float _1987 = _1967 + _1775;
    float _1989 = _1745;
    if (!_1955)
    {
        float _1991 = floor(_1721);
        _1989 = _1991;
    }
    float _1993 = _1989;
    float _1995 = _1559 * _1813;
    int _1997 = as_type<int>(_1813);
    float _1999 = _1995;
    if (!_1955)
    {
        int _2001 = _1985 << 2;
        _1975 = _2001;
    }
    int _2003 = _1975;
    float _2005 = fma(_785, _1805, _1995);
    if (!_1955)
    {
        int _2007 = 12 & _2003;
        _1997 = _2007;
    }
    int _2009 = _1997;
    float _2011 = 1.0 / _1987;
    float _2013 = _1559 * _1855;
    float _2015 = fma(_1615, _1815, _1969);
    float _2017 = fma(_785, _1847, _2013);
    float _2019 = _583 + _2015;
    int _2021 = as_type<int>(_2013);
    if (!_1955)
    {
        uint _2023 = uint(int(uint(_1985) >> uint(2)));
        _2021 = int(_2023);
    }
    int _2025 = _2021;
    float _2027 = fma(_793, _1881, _2017);
    int _2029 = _2025;
    if (!_1955)
    {
        int _2031 = _2025 << 4;
        int _2033 = _2031 + _2009;
        _2029 = _2033;
    }
    int _2035 = _2029;
    if (!_1971)
    {
        _1999 = _2019;
    }
    float _2037 = _1999;
    float _2039 = fma(_793, _1915, _2005);
    bool _2041 = !_1971;
    float _2043 = _2037;
    float _2045 = _1951;
    if (!_2041)
    {
        float _2047 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2051 = _1927 + _2049;
        float _2053 = _2019 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2055 = rsqrt(_1905);
        float _2057 = _2051 * _2047;
        float _2059 = _2057 * 0.15915493667125701904296875;
        float _2061 = _2059 * 6.283185482025146484375;
        float _2063 = sin(_2061);
        float _2065 = _2059 * 6.283185482025146484375;
        float _2067 = cos(_2065);
        float _2069 = fma(_2063, _2053, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2071 = _2055 * _2069;
        float _2073 = _2067 + (-1.0);
        float _2075 = fma(_1895, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2077 = fma(_1871, _2071, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2079 = _2073 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2081 = fma(_2019, _2067, _2079);
        _1977 = _2075;
        _2043 = _2081;
        _1979 = _2077;
    }
    float _2083 = _1977;
    float _2085 = _2043;
    float _2087 = _1979;
    float _2089 = -_773;
    float _2091 = fma(_2089, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2083);
    float _2093 = -_767;
    float _2095 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2097 = -_781;
    float _2099 = fma(_2097, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2101 = _2027 + _1889;
    float _2103 = _2039 + _1923;
    float _2105 = _2095;
    float _2107 = _2099;
    if (_1833)
    {
        _775 = _2091;
    }
    float _2109 = _775;
    float _2111 = _2109;
    if (!_1833)
    {
        float _2113 = _789 * _789;
        float _2115 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2117 = -_593;
        float _2119 = _2117 + _2083;
        float _2121 = fma(_797, _797, _2113);
        float _2123 = fma(_803, _803, _2121);
        float _2125 = 1.0 / _1599;
        float _2127 = sqrt(_2123);
        float _2129 = precise::min(_2127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2131 = _2129 * _2115;
        float _2133 = -_583;
        float _2135 = _2133 + _2085;
        float _2137 = -_601;
        float _2139 = _2137 + _2087;
        float _2141 = _2131 * _2125;
        float _2143 = fma(_2135, _2141, _779);
        float _2145 = fma(_2119, _2141, _785);
        float _2147 = fma(_2139, _2141, _793);
        _2105 = _2143;
        _2111 = _2145;
        _2107 = _2147;
    }
    float _2149 = _2105;
    float _2151 = _2111;
    float _2153 = _2107;
    int _2155 = _1713 + 88;
    uint _2157 = uint(int(uint(_2155) >> uint(2)));
    uint _2159 = uint(int(uint(int(_2157)) >> uint(2)));
    int _2161 = int(_2157) & 3;
    float _2163 = (*spvDescriptorSet0.vp_c15)._m0[int(_2159)][_2161];
    int _2165 = int(_2157) + 1;
    uint _2167 = uint(int(uint(_2165) >> uint(2)));
    int _2169 = _2165 & 3;
    float _2171 = (*spvDescriptorSet0.vp_c15)._m0[int(_2167)][_2169];
    float _2173 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2175 = _2101 * _2011;
    float _2177 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2179 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2181 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2173);
    float _2183 = _2149 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2185 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2177);
    float _2187 = _803;
    if (!_1955)
    {
        int _2189 = _2035 + 400;
        uint _2191 = uint(int(uint(_2189) >> uint(2)));
        uint _2193 = uint(int(uint(int(_2191)) >> uint(2)));
        int _2195 = int(_2191) & 3;
        float _2197 = (*spvDescriptorSet0.vp_c15)._m0[int(_2193)][_2195];
        _2187 = _2197;
    }
    float _2199 = _2187;
    float _2201 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2179);
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2181);
    float _2205 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2185);
    bool _2207 = _2175 >= 0.0;
    float _2209 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2201);
    float _2211 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2213 = fma(_2151, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2183);
    float _2215 = _2103 * _2011;
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2219 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2221 = _2175 <= 1.0;
    bool _2223 = _2221 && _2207;
    float _2225 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2227 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2213);
    float _2229 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2219);
    bool _2231 = _2215 >= 0.0;
    bool _2233 = _2231 && _2223;
    float _2235 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2237 = _2227 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2229);
    bool _2241 = _2215 <= 1.0;
    bool _2243 = _2241 && _2233;
    float _2245 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2247 = _1889;
    if (!_1955)
    {
        float _2249 = floor(_1783);
        _2247 = _2249;
    }
    float _2251 = _2247;
    float _2253 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2255 = _1559 * _1951;
    float _2257 = -_2245;
    float _2259 = fma(_2257, _2235, 1.0);
    float _2261 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2263 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2265 = fma(_785, _1943, _2255);
    float _2267 = log2(_2259);
    float _2269 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2261);
    float _2271 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2263);
    float _2273 = _2259;
    if (_2243)
    {
        float _2275 = float(_1699);
        _2045 = _2275;
    }
    float _2277 = _2045;
    float _2279 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2281 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2271);
    float _2283 = 1.0 / _2253;
    float _2285 = _2281;
    if (!_1955)
    {
        float _2287 = -_2251;
        float _2289 = _1783 + _2287;
        _2273 = _2289;
    }
    float _2291 = _2273;
    float _2293 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2279);
    float _2295 = fma(_793, _2163, _2265);
    float _2297 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2281);
    float _2299 = _2295 + _2171;
    float _2301 = _2255;
    if (_2243)
    {
        float _2303 = rint(_2277);
        float _2305 = precise::max(_2303, 0.0);
        uint _2307 = uint(_2305);
        uint _2309 = clamp(_2307, 0u, 65535u);
        _2301 = as_type<float>(_2309);
    }
    float _2311 = _2301;
    float _2313 = _2267 * 0.693147182464599609375;
    float _2315 = _2299 * _2011;
    float _2317 = _2313 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2319 = _2299;
    if (!_1955)
    {
        float _2321 = rint(_2199);
        float _2323 = precise::max(_2321, 0.0);
        uint _2325 = uint(_2323);
        uint _2327 = clamp(_2325, 0u, 65535u);
        _2319 = as_type<float>(_2327);
    }
    float _2329 = _2319;
    float _2331 = _2293 * _2283;
    float _2333 = _2297 * _2283;
    float _2335 = fma(_2331, 0.5, 0.5);
    float _2337 = fma(_2333, -0.5, 0.5);
    float _2339 = _2331;
    if (!_1955)
    {
        float _2341 = -_1993;
        float _2343 = _1721 + _2341;
        _2339 = _2343;
    }
    float _2345 = _2339;
    float _2347 = _2215;
    if (_2243)
    {
        float3 _6966 = float3(_2175, _2215, float(as_type<int>(_2311)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2349 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2315, level(0.0));
        _2347 = _2349;
    }
    float _2351 = _2347;
    float3 _6980 = float3(_2335, _2337, _2317);
    float _2353 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2335, _2337, _2317);
    float4 _2356 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2358 = _2356.x;
    float _2360 = _2356.y;
    float _2362 = _2356.z;
    float _2364 = _2356.w;
    float _2366 = _1993;
    if (!_1955)
    {
        float3 _7012 = float3(_2345, _2291, float(as_type<int>(_2329)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2366 = _2368;
    }
    float _2370 = _2366;
    if (_1955)
    {
        _2285 = 1.0;
    }
    float _2372 = _2285;
    float _2374 = _2372;
    float _2376 = _2370;
    if (!_1955)
    {
        int _2378 = _1985 << 4;
        int _2380 = _2378 + 2048;
        uint _2382 = uint(int(uint(_2380) >> uint(2)));
        uint _2384 = uint(int(uint(int(_2382)) >> uint(2)));
        int _2386 = int(_2382) & 3;
        float _2388 = (*spvDescriptorSet0.vp_c15)._m0[int(_2384)][_2386];
        int _2390 = int(_2382) + 1;
        uint _2392 = uint(int(uint(_2390) >> uint(2)));
        int _2394 = _2390 & 3;
        float _2396 = (*spvDescriptorSet0.vp_c15)._m0[int(_2392)][_2394];
        int _2398 = _2380 + 8;
        uint _2400 = uint(int(uint(_2398) >> uint(2)));
        uint _2402 = uint(int(uint(int(_2400)) >> uint(2)));
        int _2404 = int(_2400) & 3;
        float _2406 = (*spvDescriptorSet0.vp_c15)._m0[int(_2402)][_2404];
        int _2408 = int(_2400) + 1;
        uint _2410 = uint(int(uint(_2408) >> uint(2)));
        int _2412 = _2408 & 3;
        float _2414 = (*spvDescriptorSet0.vp_c15)._m0[int(_2410)][_2412];
        float _2416 = _1559 * _2396;
        float _2418 = fma(_785, _2388, _2416);
        float _2420 = fma(_793, _2406, _2418);
        float _2422 = _2420 + _2414;
        float _2424 = precise::clamp(_2422, 0.0, 1.0);
        float _2426 = -_2424;
        float _2428 = _2426 + _2370;
        float _2430 = fma(_2428, 500.0, 1.5);
        float _2432 = exp2(_2430);
        float _2434 = 0.0 + _2432;
        float _2436 = precise::clamp(_2434, 0.0, 1.0);
        _1689 = _2416;
        _2374 = _2436;
    }
    float _2438 = _1689;
    float _2440 = _2374;
    float _2442 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2444 = _2149 + _2442;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2448 = _2151 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2452 = _2153 + _2450;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = rsqrt(_2458);
    float _2462 = sqrt(_2458);
    float _2464 = _2460 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2466 = _2448 * _2464;
    float _2468 = _2452 * _2464;
    float _2470 = _2466 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 + _2472;
    float _2476 = sqrt(_2474);
    bool _2478 = _2476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = _2476 + _2480;
    float _2484 = _2438;
    float _2486 = _2474;
    float _2488 = _2482;
    float _2490 = _2444;
    float _2492 = _2466;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    if (_2478)
    {
        float _2500 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2484 = _2500;
    }
    float _2502 = _2484;
    if (_2478)
    {
        float _2504 = rsqrt(_2474);
        _2486 = _2504;
    }
    float _2506 = _2486;
    if (_2478)
    {
        float _2508 = _2482 * _2502;
        _2488 = _2508;
    }
    float _2510 = _2488;
    if (_2478)
    {
        float _2512 = _2510 * 0.15915493667125701904296875;
        _2376 = _2512;
    }
    float _2514 = _2376;
    float _2516 = _793;
    if (_2478)
    {
        float _2518 = _2514 * 6.283185482025146484375;
        float _2520 = sin(_2518);
        _2516 = _2520;
    }
    float _2522 = _2516;
    float _2524 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2526 = precise::max(0.0, _2524);
    float _2528 = _2502;
    float _2530 = _2526;
    if (_2478)
    {
        float _2532 = _2514 * 6.283185482025146484375;
        float _2534 = cos(_2532);
        _2528 = _2534;
    }
    float _2536 = _2528;
    float _2538 = -_2464;
    float _2540 = -_2526;
    float _2542 = fma(_2444, _2538, _2540);
    if (_2478)
    {
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2490 = _2544;
    }
    float _2546 = _2490;
    float _2548 = _2546;
    float _2550 = _2522;
    if (_2478)
    {
        float _2552 = fma(_2522, _2546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2548 = _2552;
    }
    float _2554 = _2548;
    float _2556 = _2554;
    if (_2478)
    {
        float _2558 = _2536 + (-1.0);
        _2530 = _2558;
    }
    float _2560 = _2530;
    float _2562 = _2560;
    if (_2478)
    {
        float _2564 = _2506 * _2554;
        _2550 = _2564;
    }
    float _2566 = _2550;
    if (!_2478)
    {
        _2556 = _2542;
    }
    float _2568 = _2556;
    float _2570 = _2568;
    if (_2478)
    {
        float _2572 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2562 = _2572;
    }
    float _2574 = _2562;
    if (_2478)
    {
        float _2576 = _2466 * _2566;
        _2492 = _2576;
    }
    float _2578 = _2492;
    if (_2478)
    {
        float _2580 = _2468 * _2566;
        _2494 = _2580;
    }
    float _2582 = _2494;
    if (_2478)
    {
        float _2584 = fma(_2542, _2536, _2574);
        _2570 = _2584;
    }
    float _2586 = _2570;
    if (_2478)
    {
        float _2588 = _2578 * _2578;
        _2496 = _2588;
    }
    float _2590 = _2496;
    if (_2478)
    {
        float _2592 = _2582 * _2582;
        _2498 = _2592;
    }
    float _2594 = _2498;
    float _2596 = fma(_2586, _2586, _2590);
    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2600 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2598);
    float _2602 = precise::clamp(_2600, 0.0, 1.0);
    float _2604 = _2596 + _2594;
    float _2606 = -_2602;
    float _2608 = _2606 + 1.0;
    float _2610 = rsqrt(_2604);
    float _2612 = abs(_2608);
    float _2614 = log2(_2612);
    float _2616 = _2610 * _2578;
    float _2618 = _2610 * _2586;
    float _2620 = _2610 * _2582;
    float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2624 = -_2622;
    float _2626 = fma(_2618, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2624);
    float _2628 = -_2620;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2626);
    float _2632 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2634 = fma(_2630, -0.5, 0.5);
    float _2636 = exp2(_2632);
    float _2638 = fma(_2630, 0.5, 0.5);
    float _2640 = fma(_2638, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2642 = sqrt(_2634);
    float _2644 = fma(_2638, _2640, -0.212114393711090087890625);
    float _2646 = _2618 + 1.0;
    float _2648 = fma(_2638, _2644, 1.570728778839111328125);
    float _2650 = -_2618;
    float _2652 = fma(_2636, _2646, _2650);
    float _2654 = fma(_2652, 0.5, 0.5);
    float _2656 = _2642 * 0.636619746685028076171875;
    float _2658 = -_2648;
    float _2660 = fma(_2656, _2658, 1.0);
    float2 _7461 = float2(_2660, _2654);
    float3 _2664 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2666 = _2664.x;
    float _2668 = _2664.y;
    float _2670 = _2664.z;
    float _2672 = in.m_89.x;
    float _2674 = in.m_89.y;
    float _2676 = abs(_1633);
    float _2678 = log2(_2676);
    bool _2680 = _1601 != 0.0;
    bool _2682 = isnan(_1601);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan(0.0);
    bool _2688 = _2684 || _2686;
    float _2690 = _1681 * _1791;
    float _2692 = in.m_89.z;
    float _2694 = _1681 * _1961;
    bool _2696 = _1541 == 0.0;
    bool _2698 = !_2688;
    bool _2700 = _2696 && _2698;
    float _2702 = in.m_91.x;
    float _2704 = in.m_91.y;
    float _2706 = in.m_91.z;
    float _2708 = in.m_91.w;
    float _2710 = _1681 * _1781;
    bool _2712 = _1483 == 0.0;
    bool _2714 = _2712 && _2700;
    float _2716 = -_1563;
    float _2718 = fma(_2716, _1747, _2690);
    float _2720 = -_1563;
    float _2722 = fma(_2720, _1751, _2694);
    float _2724 = -_1563;
    float _2726 = fma(_2724, _1753, _2710);
    float _2728 = _2614 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2730 = _1633 <= 8000.0;
    bool _2732 = isnan(_1633);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(8000.0);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2744 = fma(_1685, _1615, _2722);
    float _2746 = -_835;
    float _2748 = _2746 + 1.0;
    float _2750 = exp2(_2728);
    float _2752 = _1477 * _2674;
    float _2754 = _1461 * _2674;
    float _2756 = fma(_1461, _2672, _2752);
    float _2758 = exp2(_2742);
    float _2760 = _2752;
    float _2762 = _2674;
    float _2764 = _2672;
    if (_2714)
    {
        _2760 = _2692;
    }
    float _2766 = _2760;
    float _2768 = -_2754;
    float _2770 = fma(_1477, _2672, _2768);
    float _2772 = _2756 * _2702;
    float _2774 = _2766;
    if (_2714)
    {
        _2762 = _2756;
    }
    float _2776 = _2762;
    float _2778 = _2776;
    if (!_2714)
    {
        float _2780 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2756);
        _2778 = _2780;
    }
    float _2782 = _2778;
    if (_2714)
    {
        _1691 = _2766;
    }
    float _2784 = _1691;
    float _2786 = _1577 * _1791;
    float _2788 = _2784;
    if (!_2714)
    {
        _2774 = _2692;
    }
    float _2790 = _2774;
    float _2792 = -_2772;
    float _2794 = fma(_2770, _2704, _2792);
    if (_2714)
    {
        _2764 = _2770;
    }
    float _2796 = _2764;
    float _2798 = _2796;
    if (!_2714)
    {
        float _2800 = fma(_1541, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2770);
        _2798 = _2800;
    }
    float _2802 = _2798;
    float _2804 = _2770 * _2706;
    float _2806 = _2704 * _2790;
    float _2808 = _1577 * _1781;
    float _2810 = _1589 * _1781;
    float _2812 = fma(_2758, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2806;
    float _2818 = fma(_2756, _2706, _2816);
    float _2820 = fma(_1709, _1747, _2786);
    if (!_2714)
    {
        float _2822 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2790);
        _2788 = _2822;
    }
    float _2824 = _2788;
    float _2826 = fma(_2814, -2.0, 3.0);
    float _2828 = _2814 * _2814;
    float _2830 = _1577 * _1961;
    float _2832 = _1589 * _1791;
    float _2834 = _1589 * _1961;
    float _2836 = -_2804;
    float _2838 = fma(_2702, _2790, _2836);
    float _2840 = fma(_1709, _1751, _2830);
    float _2842 = fma(_1715, _1747, _2832);
    float _2844 = fma(_1709, _1753, _2808);
    float _2846 = fma(_1685, _1609, _2718);
    float _2848 = fma(_1715, _1751, _2834);
    float _2850 = fma(_1715, _1753, _2810);
    float _2852 = fma(_1585, _1615, _2840);
    float _2854 = fma(_1685, _1613, _2726);
    float _2856 = fma(_1579, _1609, _2842);
    float _2858 = fma(_1585, _1609, _2820);
    float _2860 = _2846 * _2704;
    float _2862 = fma(_1579, _1615, _2848);
    float _2864 = _2838 * _2708;
    float _2866 = fma(_1579, _1613, _2850);
    float _2868 = fma(_1585, _1613, _2844);
    float _2870 = _2744 * _2704;
    float _2872 = _2854 * _2704;
    float _2874 = fma(_2858, _2702, _2860);
    float _2876 = _2846 * _2782;
    float _2878 = _2744 * _2782;
    float _2880 = _2854 * _2782;
    float _2882 = _2864 * _2846;
    float _2884 = _2864 * _2744;
    float _2886 = _2864 * _2854;
    float _2888 = fma(_2852, _2702, _2870);
    float _2890 = fma(_2868, _2702, _2872);
    float _2892 = _2794 * _2708;
    float _2894 = fma(_2856, _2706, _2874);
    float _2896 = _2818 * _2708;
    float _2898 = _2211 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2900 = fma(_2858, _2802, _2876);
    float _2902 = _2828 * _2826;
    float _2904 = fma(_2896, _2858, _2882);
    float _2906 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2898);
    float _2908 = fma(_2896, _2852, _2884);
    float _2910 = fma(_2896, _2868, _2886);
    float _2912 = fma(_2868, _2802, _2880);
    float _2914 = fma(_2225, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2906);
    float _2916 = fma(_2862, _2706, _2888);
    float _2918 = fma(_2852, _2802, _2878);
    float _2920 = fma(_2866, _2706, _2890);
    float _2922 = fma(_2892, _2866, _2910);
    float _2924 = fma(_2866, _2824, _2912);
    float _2926 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2914);
    float _2928 = -_2902;
    float _2930 = _2928 + 1.0;
    float _2932 = fma(_2856, _2824, _2900);
    float _2934 = fma(_2862, _2824, _2918);
    float _2936 = _2926 + _2253;
    float _2938 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2902);
    float _2940 = -_2750;
    float _2942 = _2940 + 1.0;
    float _2944 = fma(_2892, _2856, _2904);
    float _2946 = _2936 * 0.5;
    float _2948 = _2740 * _2938;
    float _2950 = _2936;
    float _2952 = _2946;
    if (!_2243)
    {
        _2950 = 1.0;
    }
    float _2954 = _2950;
    float _2956 = _2942 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = _2954;
    if (_2243)
    {
        bool _2960 = _2351 >= _2315;
        bool _2962 = isnan(_2351);
        bool _2964 = _2960 || _2962;
        bool _2966 = isnan(_2315);
        bool _2968 = _2964 || _2966;
        float _2970 = float(_2968);
        _2958 = _2970;
    }
    float _2972 = _2958;
    float _2974 = _2948 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2976 = fma(_2892, _2862, _2908);
    float _2978 = _2956 * _2353;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2748 * _2974;
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2972 * _2440;
    float _2990 = _2364 * _2978;
    float _2992 = -_2986;
    float _2994 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2996 = _2364 * _2982;
    out.m_93.x = _2894;
    out.m_93.y = _2916;
    out.m_93.z = _2920;
    bool _2998 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3000 = isnan(_2462);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3006 = _3002 || _3004;
    float _3008 = -_2988;
    float _3010 = fma(_3008, _2994, 1.0);
    float _3012 = precise::clamp(_3010, 0.0, 1.0);
    out.m_95.x = _2944;
    out.m_95.y = _2976;
    out.m_95.z = _2922;
    float _3014 = _3012 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2293;
    out.gl_Position.y = _2297;
    out.gl_Position.z = _2926;
    out.gl_Position.w = _2253;
    out.m_97.x = _3014;
    float _3016 = _2974;
    float _3018 = _2988;
    float _3020 = _2982;
    float _3022 = _3012;
    float _3024 = _2253;
    if (!_3006)
    {
        _3016 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3016;
    out.m_99.x = _2932;
    out.m_99.y = _2934;
    out.m_99.z = _2924;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3006)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3018;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3006)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3020;
    out.m_101.z = _2946;
    out.m_101.w = _2253;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3006)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _3022;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3006)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _2952;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3006)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _3024;
    float _3058 = _2670 * _2978;
    float _3060 = fma(_2666, _2990, _2358);
    float _3062 = fma(_2668, _2990, _2360);
    float _3064 = fma(_2364, _3058, _2362);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2996;
    bool _3066 = !_3006;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2462);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2462 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = 1.0 / _3088;
            float _3092 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3094 = _3092 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3090;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3120 = fma(_3114, _3094, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3120;
            _3042 = _3128;
            _3054 = _3122;
            _3036 = _3126;
            _3070 = _3124;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2462);
            bool _3138 = _3134 || _3136;
            bool _3140 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3142 = _3138 || _3140;
            if (!_3142)
            {
                _3052 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3144 = _3052;
            _3054 = _3144;
            if (!_3142)
            {
                _3028 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3146 = _3028;
            _3030 = _3146;
            if (!_3142)
            {
                _3068 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3148 = _3068;
            _3070 = _3148;
            if (!_3142)
            {
                _3034 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3150 = _3034;
            _3036 = _3150;
            if (!_3142)
            {
                _3040 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3152 = _3040;
            _3042 = _3152;
            if (!_3142)
            {
                _3046 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3154 = _3046;
            bool _3156 = !_3142;
            _3048 = _3154;
            if (!_3156)
            {
                bool _3158 = _2462 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2462);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2462 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = 1.0 / _3174;
                    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3180 = _3178 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3176;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3206 = fma(_3200, _3180, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3206;
                    _3042 = _3214;
                    _3054 = _3208;
                    _3036 = _3212;
                    _3070 = _3210;
                    _3048 = _3216;
                    _3132 = true;
                }
                else
                {
                    _3030 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3042 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3054 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3036 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3070 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3048 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3132 = false;
    float _3218 = _3030;
    float _3220 = _3042;
    float _3222 = _3054;
    float _3224 = _3036;
    float _3226 = _3070;
    float _3228 = _3048;
    float _3230 = fma(_2934, -0.5, 0.5);
    float _3232 = precise::clamp(_3230, 0.0, 1.0);
    float _3234 = -_3218;
    float _3236 = _3234 + _3220;
    float _3238 = -_3222;
    float _3240 = _3238 + _3224;
    float _3242 = -_3226;
    float _3244 = _3242 + _3228;
    bool _3246 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3248 = fma(_3232, _3236, _3218);
    float _3250 = fma(_3232, _3240, _3222);
    float _3252 = fma(_3232, _3244, _3226);
    float _3254 = _3248 * 0.586610972881317138671875;
    out.m_59.x = 1.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
    out.m_105.x = 0.0;
    float _3260 = -_3258;
    float _3262 = _3250 + _3260;
    float _3264 = -_3258;
    float _3266 = _3248 + _3264;
    float _3268 = -_3258;
    float _3270 = _3252 + _3268;
    float _3272 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3274 = fma(_3262, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3276 = fma(_3266, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    float _3278 = fma(_3270, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3258);
    out.m_97.w = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3280 = -_2149;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2151;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2153;
    float _3290 = _3288 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3292 = _3282 * _3282;
    float _3294 = fma(_3286, _3286, _3292);
    float _3296 = fma(_3290, _3290, _3294);
    float _3298 = sqrt(_3296);
    float _3300 = rsqrt(_3296);
    float _3302 = -_3298;
    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3306 = _3304 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3308 = precise::clamp(_3306, 0.0, 1.0);
    float _3310 = _3286 * _3300;
    float _3312 = _3282 * _3300;
    float _3314 = abs(_3308);
    float _3316 = log2(_3314);
    float _3318 = _3290 * _3300;
    float _3320 = _3310 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3322 = _2934 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2932, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2924, _3318, _3330);
    float _3338 = precise::clamp(_3336, 0.0, 1.0);
    float _3340 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3342 = _3334 + _3340;
    float _3344 = _3316 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3346 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = exp2(_3344);
    float _3352 = _3350 * _3348;
    float _3354 = _3338 * _3352;
    float _3356 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3358 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3360 = _3354 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_105.x = _3356;
    out.m_105.y = _3358;
    out.m_105.z = _3360;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

