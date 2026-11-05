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
    float _1239 = 1.0;
    if (!_941)
    {
        int _1241 = ~_977;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1249 = _1203 * _1197;
        _170 = _1249;
    }
    float _1251 = _170;
    int _1253 = _1085 ? 0 : 1;
    float _1255 = fma(_565, 78.233001708984375, _1247);
    float _1257 = fma(_208, 78.233001708984375, _1247);
    float _1259 = _565 + (-0.5);
    float _1261 = _1255 * 0.15915493667125701904296875;
    int _1263 = abs(_765);
    float _1265 = _1257 * 0.15915493667125701904296875;
    int _1267 = ~_1219;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1035)
    {
        int _1275 = ~_1219;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = _1261 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = float(_1245);
    float _1287 = fma(_1075, _1191, _1223);
    float _1289 = float(_1263);
    int _1291 = ~_1253;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1087, _1189, _1287);
    float _1299 = _1265 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    float _1303 = _1289 * _1285;
    int _1305 = abs(_771);
    float _1307 = fma(_1211, _1165, _1297);
    int _1309 = _1295;
    if (!_1073)
    {
        int _1311 = ~_1253;
        int _1313 = _1311 + 1;
        _1309 = _1313;
    }
    int _1315 = _1309;
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_909);
    float _1321 = fma(_1221, _1151, _1307);
    float _1323 = _1283 * 43758.546875;
    float _1325 = fma(_1317, _1233, _1233);
    float _1327 = float(_1279);
    float _1329 = fma(_1037, _1317, _1037);
    float _1331 = floor(_1323);
    float _1333 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1325);
    float _1335 = -_583;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1319 * _1327;
    float _1341 = _1301 * 43758.546875;
    float _1343 = fma(_1329, _1251, _1333);
    float _1345 = float(_1315);
    float _1347 = _1339 * (-2.0);
    float _1349 = float(_1305);
    float _1351 = _1343 * 0.15915493667125701904296875;
    float _1353 = _208 + (-0.5);
    float _1355 = fma(_1347, _1231, _1231);
    float _1357 = fma(_1049, _1347, _1049);
    float _1359 = _1349 * _1345;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1363 = _525 + _1361;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1355);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = _525 + _1367;
    float _1371 = _1359 * (-2.0);
    float _1373 = floor(_1341);
    float _1375 = fma(_1357, _1251, _1365);
    float _1377 = fma(_1025, _1363, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1379 = fma(_1371, _1235, _1235);
    float _1381 = fma(_1021, _1371, _1021);
    float _1383 = _1375 * 0.15915493667125701904296875;
    float _1385 = fma(_995, _1369, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1387 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1379);
    float _1389 = _871 * _871;
    float _1391 = fma(_1377, _1157, _1321);
    float _1393 = -_1331;
    float _1395 = _1323 + _1393;
    float _1397 = fma(_1381, _1251, _1387);
    float _1399 = -_773;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1403 = in.m_85.x;
    float _1405 = in.m_85.y;
    float _1407 = in.m_85.z;
    float _1409 = fma(_1385, _1149, _1391);
    float _1411 = fma(_1401, _1401, _1389);
    float _1413 = in.m_87.x;
    float _1415 = in.m_87.y;
    float _1417 = in.m_87.z;
    float _1419 = -_1373;
    float _1421 = _1341 + _1419;
    float _1423 = fma(_1395, 4.0, -2.0);
    float _1425 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1409);
    float _1427 = fma(_891, _891, _1411);
    float _1429 = _182 * _182;
    float _1431 = _1421 * 0.5;
    float _1433 = _1425 * _1423;
    float _1435 = _1425 * _1421;
    float _1437 = _1435 * 4.0;
    float _1439 = _1351 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = -_1431;
    float _1445 = fma(_1429, 1.5, _1443);
    float _1447 = precise::clamp(_1445, 0.0, 1.0);
    float _1449 = _1433 * 0.15915493667125701904296875;
    float _1451 = _1397 * 0.15915493667125701904296875;
    float _1453 = -_593;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = -_601;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = -_1407;
    float _1467 = _1163 + _1465;
    float _1469 = -_1159;
    float _1471 = _1469 + _1403;
    float _1473 = _503 * _1417;
    float _1475 = fma(_1447, _1467, _1407);
    float _1477 = _1449 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1483 = _501 * _1415;
    float _1485 = fma(_1437, _1163, _1475);
    float _1487 = -_1161;
    float _1489 = _1487 + _1405;
    float _1491 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1481);
    float _1493 = _499 * _1413;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1497 = _1463 * _1489;
    float _1499 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1501 = _1351 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1509 = _1479 * _1489;
    float _1511 = -_1497;
    float _1513 = fma(_1479, _1471, _1511);
    float _1515 = 1.0 / _1505;
    float _1517 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1507);
    float _1519 = fma(_1463, _1471, _1509);
    float _1521 = _1337 * _1337;
    float _1523 = _1513 + _1159;
    float _1525 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1517);
    float _1527 = fma(_1455, _1455, _1521);
    float _1529 = _1383 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1535 = -_1513;
    float _1537 = fma(_1535, _1447, _1523);
    float _1539 = fma(_1459, _1459, _1527);
    float _1541 = _1533 + _1505;
    float _1543 = fma(_1437, _1159, _1537);
    float _1545 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1547 = _1383 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1541 * _1515;
    float _1553 = _1551 * 0.5;
    float _1555 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1559 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1557);
    float _1561 = _779 + _1555;
    float _1563 = _1451 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1531 * _1441;
    float _1569 = _1531 * _1503;
    float _1571 = sqrt(_1427);
    float _1573 = _1549 * _1503;
    float _1575 = _1549 * _1441;
    float _1577 = rsqrt(_1539);
    float _1579 = fma(_1565, _1573, _1567);
    float _1581 = fma(_1565, _1567, _1573);
    float _1583 = _1519 + _1161;
    float _1585 = -_1575;
    float _1587 = fma(_1565, _1569, _1585);
    float _1589 = -_1569;
    float _1591 = fma(_1565, _1575, _1589);
    float _1593 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1595 = -_1519;
    float _1597 = fma(_1595, _1447, _1583);
    float _1599 = 1.0 / _1559;
    float _1601 = _725 * _1571;
    float _1603 = fma(_1437, _1161, _1597);
    float _1605 = _1601 * _1545;
    float _1607 = _1601 * _1593;
    float _1609 = _1601 * _1495;
    float _1611 = _1455 * _1577;
    float _1613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1543);
    float _1615 = _1459 * _1577;
    float _1617 = _1337 * _1577;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1621 = _1611 * _1619;
    float _1623 = _1613 * _1605;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1627 = _1615 * _1625;
    float _1629 = _1451 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1635 = _1599 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1621;
    float _1641 = fma(_1615, _1637, _1639);
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1617 * _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1649 = -_1627;
    float _1651 = fma(_1617, _1647, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1655 = _1641 * _1641;
    bool _1657 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1645;
    float _1663 = fma(_1611, _1659, _1661);
    bool _1665 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1667 = fma(_1651, _1651, _1655);
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1603);
    float _1671 = _1653 * _1607;
    float _1673 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1675 = fma(_1663, _1663, _1667);
    float _1677 = _1669 * _1609;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1549 * _1631;
    float _1685 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1673);
    float _1687 = _1531 * _1631;
    int _1689 = 2;
    float _1691 = _1561;
    float _1693 = _1479;
    if (!_1657)
    {
        _1689 = 1;
    }
    int _1695 = _1689;
    float _1697 = rsqrt(_1675);
    int _1699 = _1695;
    if (!_1665)
    {
        _1699 = _1681;
    }
    int _1701 = _1699;
    float _1703 = -_1677;
    float _1705 = _1565 * _1703;
    float _1707 = _1683 * _1677;
    float _1709 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1685);
    float _1711 = _1503 * _1631;
    float _1713 = _1687 * _1677;
    int _1715 = _1701 << 6;
    float _1717 = _1441 * _1631;
    float _1719 = fma(_1711, _1623, _1705);
    float _1721 = fma(_1579, _1623, _1707);
    float _1723 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1725 = fma(_1587, _1623, _1713);
    float _1727 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1729 = _1715 + 96;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1591, _1671, _1721);
    float _1749 = _1651 * _1697;
    float _1751 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1727);
    float _1753 = _1641 * _1697;
    float _1755 = _1663 * _1697;
    float _1757 = _1617 * _1749;
    float _1759 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1751);
    int _1761 = _1715 + 104;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
    int _1771 = int(_1763) + 1;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    int _1775 = _1771 & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    float _1779 = _1615 * _1753;
    float _1781 = -_1757;
    float _1783 = fma(_1611, _1753, _1781);
    float _1785 = _1759 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1787 = trunc(_1723);
    int _1789 = int(_1787);
    float _1791 = -_1779;
    float _1793 = fma(_1617, _1755, _1791);
    float _1795 = fma(_1717, _1671, _1719);
    float _1797 = _1783 * _1747;
    int _1799 = _1715 + 64;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
    int _1805 = int(_1801) & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = int(_1801) + 1;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    int _1813 = _1809 & 3;
    float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
    float _1817 = fma(_1581, _1671, _1725);
    float _1819 = _1793 * _1747;
    float _1821 = fma(_1755, _1795, _1797);
    float _1823 = trunc(_1785);
    int _1825 = int(_1823);
    bool _1827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1829 = isnan(0.5);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1749, _1795, _1819);
    float _1839 = fma(_1615, _1817, _1821);
    int _1841 = _1715 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_1611, _1817, _1837);
    float _1861 = _601 + _1839;
    int _1863 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1865 = _1789 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = _593 + _1859;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1873 = _1861 + _1871;
    int _1875 = _1715 + 56;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    uint _1879 = uint(int(uint(int(_1877)) >> uint(2)));
    int _1881 = int(_1877) & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    int _1885 = int(_1877) + 1;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    int _1889 = _1885 & 3;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
    bool _1893 = _1867 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1897 = _1869 + _1895;
    float _1899 = _1873 * _1873;
    int _1901 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1903 = _1825 + _1901;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1897, _1899);
    int _1909 = _1715 + 72;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    int _1927 = _1867 | _1905;
    float _1929 = sqrt(_1907);
    bool _1931 = _1927 < 0;
    bool _1933 = _1931 || _1893;
    float _1935 = _1611 * _1755;
    int _1937 = _1715 + 80;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    bool _1955 = _1905 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1957 = _1955 || _1933;
    float _1959 = _1561 * _1745;
    float _1961 = -_1935;
    float _1963 = fma(_1615, _1749, _1961);
    float _1965 = fma(_785, _1737, _1959);
    float _1967 = _1963 * _1747;
    float _1969 = fma(_793, _1769, _1965);
    float _1971 = fma(_1753, _1795, _1967);
    bool _1973 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1975 = _1867;
    int _1977 = as_type<int>(_1967);
    float _1979 = _1869;
    float _1981 = _1861;
    if (!_1957)
    {
        int _1983 = _1905 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1985 = _1983 + _1867;
        _1975 = _1985;
    }
    int _1987 = _1975;
    float _1989 = _1969 + _1777;
    float _1991 = _1747;
    if (!_1957)
    {
        float _1993 = floor(_1723);
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1561 * _1815;
    int _1999 = as_type<int>(_1815);
    float _2001 = _1997;
    if (!_1957)
    {
        int _2003 = _1987 << 2;
        _1977 = _2003;
    }
    int _2005 = _1977;
    float _2007 = fma(_785, _1807, _1997);
    if (!_1957)
    {
        int _2009 = 12 & _2005;
        _1999 = _2009;
    }
    int _2011 = _1999;
    float _2013 = 1.0 / _1989;
    float _2015 = _1561 * _1857;
    float _2017 = fma(_1617, _1817, _1971);
    float _2019 = fma(_785, _1849, _2015);
    float _2021 = _583 + _2017;
    int _2023 = as_type<int>(_2015);
    if (!_1957)
    {
        uint _2025 = uint(int(uint(_1987) >> uint(2)));
        _2023 = int(_2025);
    }
    int _2027 = _2023;
    float _2029 = fma(_793, _1883, _2019);
    int _2031 = _2027;
    if (!_1957)
    {
        int _2033 = _2027 << 4;
        int _2035 = _2033 + _2011;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1973)
    {
        _2001 = _2021;
    }
    float _2039 = _2001;
    float _2041 = fma(_793, _1917, _2007);
    bool _2043 = !_1973;
    float _2045 = _2039;
    float _2047 = _1953;
    if (!_2043)
    {
        float _2049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2053 = _1929 + _2051;
        float _2055 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2057 = rsqrt(_1907);
        float _2059 = _2053 * _2049;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = _2061 * 6.283185482025146484375;
        float _2065 = sin(_2063);
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = fma(_2065, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2073 = _2057 * _2071;
        float _2075 = _2069 + (-1.0);
        float _2077 = fma(_1897, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2079 = fma(_1873, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2081 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2083 = fma(_2021, _2069, _2081);
        _1979 = _2077;
        _2045 = _2083;
        _1981 = _2079;
    }
    float _2085 = _1979;
    float _2087 = _2045;
    float _2089 = _1981;
    float _2091 = -_773;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2095 = -_767;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2099 = -_781;
    float _2101 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2089);
    float _2103 = _2029 + _1891;
    float _2105 = _2041 + _1925;
    float _2107 = _2097;
    float _2109 = _2101;
    if (_1835)
    {
        _775 = _2093;
    }
    float _2111 = _775;
    float _2113 = _2111;
    if (!_1835)
    {
        float _2115 = _789 * _789;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_593;
        float _2121 = _2119 + _2085;
        float _2123 = fma(_797, _797, _2115);
        float _2125 = fma(_803, _803, _2123);
        float _2127 = 1.0 / _1601;
        float _2129 = sqrt(_2125);
        float _2131 = precise::min(_2129, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2117;
        float _2135 = -_583;
        float _2137 = _2135 + _2087;
        float _2139 = -_601;
        float _2141 = _2139 + _2089;
        float _2143 = _2133 * _2127;
        float _2145 = fma(_2137, _2143, _779);
        float _2147 = fma(_2121, _2143, _785);
        float _2149 = fma(_2141, _2143, _793);
        _2107 = _2145;
        _2113 = _2147;
        _2109 = _2149;
    }
    float _2151 = _2107;
    float _2153 = _2113;
    float _2155 = _2109;
    int _2157 = _1715 + 88;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    float _2175 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = _2103 * _2013;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2181 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2183 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2187 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2179);
    float _2189 = _803;
    if (!_1957)
    {
        int _2191 = _2037 + 400;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
        int _2197 = int(_2193) & 3;
        float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
        _2189 = _2199;
    }
    float _2201 = _2189;
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2181);
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2183);
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2187);
    bool _2209 = _2177 >= 0.0;
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2185);
    float _2217 = _2105 * _2013;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2223 = _2177 <= 1.0;
    bool _2225 = _2223 && _2209;
    float _2227 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2229 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    bool _2233 = _2217 >= 0.0;
    bool _2235 = _2233 && _2225;
    float _2237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2239 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    bool _2243 = _2217 <= 1.0;
    bool _2245 = _2243 && _2235;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2249 = _1891;
    if (!_1957)
    {
        float _2251 = floor(_1785);
        _2249 = _2251;
    }
    float _2253 = _2249;
    float _2255 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2241);
    float _2257 = _1561 * _1953;
    float _2259 = -_2247;
    float _2261 = fma(_2259, _2237, 1.0);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2267 = fma(_785, _1945, _2257);
    float _2269 = log2(_2261);
    float _2271 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2273 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2265);
    float _2275 = _2261;
    if (_2245)
    {
        float _2277 = float(_1701);
        _2047 = _2277;
    }
    float _2279 = _2047;
    float _2281 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2271);
    float _2283 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2273);
    float _2285 = 1.0 / _2255;
    float _2287 = _2283;
    if (!_1957)
    {
        float _2289 = -_2253;
        float _2291 = _1785 + _2289;
        _2275 = _2291;
    }
    float _2293 = _2275;
    float _2295 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2281);
    float _2297 = fma(_793, _2165, _2267);
    float _2299 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2283);
    float _2301 = _2297 + _2173;
    float _2303 = _2257;
    if (_2245)
    {
        float _2305 = rint(_2279);
        float _2307 = precise::max(_2305, 0.0);
        uint _2309 = uint(_2307);
        uint _2311 = clamp(_2309, 0u, 65535u);
        _2303 = as_type<float>(_2311);
    }
    float _2313 = _2303;
    float _2315 = _2269 * 0.693147182464599609375;
    float _2317 = _2301 * _2013;
    float _2319 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2321 = _2301;
    if (!_1957)
    {
        float _2323 = rint(_2201);
        float _2325 = precise::max(_2323, 0.0);
        uint _2327 = uint(_2325);
        uint _2329 = clamp(_2327, 0u, 65535u);
        _2321 = as_type<float>(_2329);
    }
    float _2331 = _2321;
    float _2333 = _2295 * _2285;
    float _2335 = _2299 * _2285;
    float _2337 = fma(_2333, 0.5, 0.5);
    float _2339 = fma(_2335, -0.5, 0.5);
    float _2341 = _2333;
    if (!_1957)
    {
        float _2343 = -_1995;
        float _2345 = _1723 + _2343;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = _2217;
    if (_2245)
    {
        float3 _6966 = float3(_2177, _2217, float(as_type<int>(_2313)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2351 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2317, level(0.0));
        _2349 = _2351;
    }
    float _2353 = _2349;
    float3 _6980 = float3(_2337, _2339, _2319);
    float _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2337, _2339, _2319);
    float4 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = _2358.w;
    float _2368 = _1995;
    if (!_1957)
    {
        float3 _7012 = float3(_2347, _2293, float(as_type<int>(_2331)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2370 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2368 = _2370;
    }
    float _2372 = _2368;
    if (_1957)
    {
        _2287 = 1.0;
    }
    float _2374 = _2287;
    float _2376 = _2374;
    float _2378 = _2372;
    if (!_1957)
    {
        int _2380 = _1987 << 4;
        int _2382 = _2380 + 2048;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        int _2392 = int(_2384) + 1;
        uint _2394 = uint(int(uint(_2392) >> uint(2)));
        int _2396 = _2392 & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = _2382 + 8;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        float _2418 = _1561 * _2398;
        float _2420 = fma(_785, _2390, _2418);
        float _2422 = fma(_793, _2408, _2420);
        float _2424 = _2422 + _2416;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = -_2426;
        float _2430 = _2428 + _2372;
        float _2432 = fma(_2430, 500.0, 1.5);
        float _2434 = exp2(_2432);
        float _2436 = 0.0 + _2434;
        float _2438 = precise::clamp(_2436, 0.0, 1.0);
        _1691 = _2418;
        _2376 = _2438;
    }
    float _2440 = _1691;
    float _2442 = _2376;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2151 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2153 + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2454 = _2155 + _2452;
    float _2456 = _2446 * _2446;
    float _2458 = fma(_2450, _2450, _2456);
    float _2460 = fma(_2454, _2454, _2458);
    float _2462 = rsqrt(_2460);
    float _2464 = sqrt(_2460);
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2450 * _2466;
    float _2470 = _2454 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2440;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2446;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    float _2500 = _2474;
    if (_2480)
    {
        float _2502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2502;
    }
    float _2504 = _2486;
    if (_2480)
    {
        float _2506 = rsqrt(_2476);
        _2488 = _2506;
    }
    float _2508 = _2488;
    if (_2480)
    {
        float _2510 = _2484 * _2504;
        _2490 = _2510;
    }
    float _2512 = _2490;
    if (_2480)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2378 = _2514;
    }
    float _2516 = _2378;
    float _2518 = _793;
    if (_2480)
    {
        float _2520 = _2516 * 6.283185482025146484375;
        float _2522 = sin(_2520);
        _2518 = _2522;
    }
    float _2524 = _2518;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2528 = precise::max(0.0, _2526);
    float _2530 = _2504;
    float _2532 = _2528;
    if (_2480)
    {
        float _2534 = _2516 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        _2530 = _2536;
    }
    float _2538 = _2530;
    float _2540 = -_2466;
    float _2542 = -_2528;
    float _2544 = fma(_2446, _2540, _2542);
    if (_2480)
    {
        float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2546;
    }
    float _2548 = _2492;
    float _2550 = _2548;
    float _2552 = _2524;
    if (_2480)
    {
        float _2554 = fma(_2524, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = _2556;
    if (_2480)
    {
        float _2560 = _2538 + (-1.0);
        _2532 = _2560;
    }
    float _2562 = _2532;
    float _2564 = _2562;
    if (_2480)
    {
        float _2566 = _2508 * _2556;
        _2552 = _2566;
    }
    float _2568 = _2552;
    if (!_2480)
    {
        _2558 = _2544;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2480)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2574;
    }
    float _2576 = _2564;
    if (_2480)
    {
        float _2578 = _2468 * _2568;
        _2494 = _2578;
    }
    float _2580 = _2494;
    if (_2480)
    {
        float _2582 = _2470 * _2568;
        _2496 = _2582;
    }
    float _2584 = _2496;
    if (_2480)
    {
        float _2586 = fma(_2544, _2538, _2576);
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2480)
    {
        float _2590 = _2580 * _2580;
        _2498 = _2590;
    }
    float _2592 = _2498;
    if (_2480)
    {
        float _2594 = _2584 * _2584;
        _2500 = _2594;
    }
    float _2596 = _2500;
    float _2598 = fma(_2588, _2588, _2592);
    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2602 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2600);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = _2598 + _2596;
    float _2608 = -_2604;
    float _2610 = _2608 + 1.0;
    float _2612 = rsqrt(_2606);
    float _2614 = abs(_2610);
    float _2616 = log2(_2614);
    float _2618 = _2612 * _2580;
    float _2620 = _2612 * _2588;
    float _2622 = _2612 * _2584;
    float _2624 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = -_2624;
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2626);
    float _2630 = -_2622;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2628);
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2636 = fma(_2632, -0.5, 0.5);
    float _2638 = exp2(_2634);
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = fma(_2640, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2644 = sqrt(_2636);
    float _2646 = fma(_2640, _2642, -0.212114393711090087890625);
    float _2648 = _2620 + 1.0;
    float _2650 = fma(_2640, _2646, 1.570728778839111328125);
    float _2652 = -_2620;
    float _2654 = fma(_2638, _2648, _2652);
    float _2656 = fma(_2654, 0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2650;
    float _2662 = fma(_2658, _2660, 1.0);
    float2 _7461 = float2(_2662, _2656);
    float3 _2666 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2668 = _2666.x;
    float _2670 = _2666.y;
    float _2672 = _2666.z;
    float _2674 = in.m_89.x;
    float _2676 = in.m_89.y;
    float _2678 = abs(_1635);
    float _2680 = log2(_2678);
    bool _2682 = _1603 != 0.0;
    bool _2684 = isnan(_1603);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = _1683 * _1793;
    float _2694 = in.m_89.z;
    float _2696 = _1683 * _1963;
    bool _2698 = _1543 == 0.0;
    bool _2700 = !_2690;
    bool _2702 = _2698 && _2700;
    float _2704 = in.m_91.x;
    float _2706 = in.m_91.y;
    float _2708 = in.m_91.z;
    float _2710 = in.m_91.w;
    float _2712 = _1683 * _1783;
    bool _2714 = _1485 == 0.0;
    bool _2716 = _2714 && _2702;
    float _2718 = -_1565;
    float _2720 = fma(_2718, _1749, _2692);
    float _2722 = -_1565;
    float _2724 = fma(_2722, _1753, _2696);
    float _2726 = -_1565;
    float _2728 = fma(_2726, _1755, _2712);
    float _2730 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2732 = _1635 <= 8000.0;
    bool _2734 = isnan(_1635);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan(8000.0);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2746 = fma(_1687, _1617, _2724);
    float _2748 = -_835;
    float _2750 = _2748 + 1.0;
    float _2752 = exp2(_2730);
    float _2754 = _1479 * _2676;
    float _2756 = _1463 * _2676;
    float _2758 = fma(_1463, _2674, _2754);
    float _2760 = exp2(_2744);
    float _2762 = _2754;
    float _2764 = _2676;
    float _2766 = _2674;
    if (_2716)
    {
        _2762 = _2694;
    }
    float _2768 = _2762;
    float _2770 = -_2756;
    float _2772 = fma(_1479, _2674, _2770);
    float _2774 = _2758 * _2704;
    float _2776 = _2768;
    if (_2716)
    {
        _2764 = _2758;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (!_2716)
    {
        float _2782 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2716)
    {
        _1693 = _2768;
    }
    float _2786 = _1693;
    float _2788 = _1579 * _1793;
    float _2790 = _2786;
    if (!_2716)
    {
        _2776 = _2694;
    }
    float _2792 = _2776;
    float _2794 = -_2774;
    float _2796 = fma(_2772, _2706, _2794);
    if (_2716)
    {
        _2766 = _2772;
    }
    float _2798 = _2766;
    float _2800 = _2798;
    if (!_2716)
    {
        float _2802 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2772);
        _2800 = _2802;
    }
    float _2804 = _2800;
    float _2806 = _2772 * _2708;
    float _2808 = _2706 * _2792;
    float _2810 = _1579 * _1783;
    float _2812 = _1591 * _1783;
    float _2814 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -_2808;
    float _2820 = fma(_2758, _2708, _2818);
    float _2822 = fma(_1711, _1749, _2788);
    if (!_2716)
    {
        float _2824 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2792);
        _2790 = _2824;
    }
    float _2826 = _2790;
    float _2828 = fma(_2816, -2.0, 3.0);
    float _2830 = _2816 * _2816;
    float _2832 = _1579 * _1963;
    float _2834 = _1591 * _1793;
    float _2836 = _1591 * _1963;
    float _2838 = -_2806;
    float _2840 = fma(_2704, _2792, _2838);
    float _2842 = fma(_1711, _1753, _2832);
    float _2844 = fma(_1717, _1749, _2834);
    float _2846 = fma(_1711, _1755, _2810);
    float _2848 = fma(_1687, _1611, _2720);
    float _2850 = fma(_1717, _1753, _2836);
    float _2852 = fma(_1717, _1755, _2812);
    float _2854 = fma(_1587, _1617, _2842);
    float _2856 = fma(_1687, _1615, _2728);
    float _2858 = fma(_1581, _1611, _2844);
    float _2860 = fma(_1587, _1611, _2822);
    float _2862 = _2848 * _2706;
    float _2864 = fma(_1581, _1617, _2850);
    float _2866 = _2840 * _2710;
    float _2868 = fma(_1581, _1615, _2852);
    float _2870 = fma(_1587, _1615, _2846);
    float _2872 = _2746 * _2706;
    float _2874 = _2856 * _2706;
    float _2876 = fma(_2860, _2704, _2862);
    float _2878 = _2848 * _2784;
    float _2880 = _2746 * _2784;
    float _2882 = _2856 * _2784;
    float _2884 = _2866 * _2848;
    float _2886 = _2866 * _2746;
    float _2888 = _2866 * _2856;
    float _2890 = fma(_2854, _2704, _2872);
    float _2892 = fma(_2870, _2704, _2874);
    float _2894 = _2796 * _2710;
    float _2896 = fma(_2858, _2708, _2876);
    float _2898 = _2820 * _2710;
    float _2900 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2902 = fma(_2860, _2804, _2878);
    float _2904 = _2830 * _2828;
    float _2906 = fma(_2898, _2860, _2884);
    float _2908 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2900);
    float _2910 = fma(_2898, _2854, _2886);
    float _2912 = fma(_2898, _2870, _2888);
    float _2914 = fma(_2870, _2804, _2882);
    float _2916 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2908);
    float _2918 = fma(_2864, _2708, _2890);
    float _2920 = fma(_2854, _2804, _2880);
    float _2922 = fma(_2868, _2708, _2892);
    float _2924 = fma(_2894, _2868, _2912);
    float _2926 = fma(_2868, _2826, _2914);
    float _2928 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2916);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2858, _2826, _2902);
    float _2936 = fma(_2864, _2826, _2920);
    float _2938 = _2928 + _2255;
    float _2940 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2904);
    float _2942 = -_2752;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2894, _2858, _2906);
    float _2948 = _2938 * 0.5;
    float _2950 = _2742 * _2940;
    float _2952 = _2938;
    float _2954 = _2948;
    if (!_2245)
    {
        _2952 = 1.0;
    }
    float _2956 = _2952;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2960 = _2956;
    if (_2245)
    {
        bool _2962 = _2353 >= _2317;
        bool _2964 = isnan(_2353);
        bool _2966 = _2962 || _2964;
        bool _2968 = isnan(_2317);
        bool _2970 = _2966 || _2968;
        float _2972 = float(_2970);
        _2960 = _2972;
    }
    float _2974 = _2960;
    float _2976 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2978 = fma(_2894, _2864, _2910);
    float _2980 = _2958 * _2355;
    float _2982 = -_2958;
    float _2984 = _2982 + 1.0;
    float _2986 = _2750 * _2976;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2974 * _2442;
    float _2992 = _2366 * _2980;
    float _2994 = -_2988;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2366 * _2984;
    out.m_93.x = _2896;
    out.m_93.y = _2918;
    out.m_93.z = _2922;
    bool _3000 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3002 = isnan(_2464);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3008 = _3004 || _3006;
    float _3010 = -_2990;
    float _3012 = fma(_3010, _2996, 1.0);
    float _3014 = precise::clamp(_3012, 0.0, 1.0);
    out.m_95.x = _2946;
    out.m_95.y = _2978;
    out.m_95.z = _2924;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2295;
    out.gl_Position.y = _2299;
    out.gl_Position.z = _2928;
    out.gl_Position.w = _2255;
    out.m_97.x = _3016;
    float _3018 = _2990;
    float _3020 = _2984;
    float _3022 = _3014;
    float _3024 = _2255;
    if (!_3008)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3018;
    out.m_99.x = _2934;
    out.m_99.y = _2936;
    out.m_99.z = _2926;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3008)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3020;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3008)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3022;
    out.m_101.z = _2948;
    out.m_101.w = _2255;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3008)
    {
        _1239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _1239;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3008)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _3024;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3008)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _2954;
    float _3058 = _2672 * _2980;
    float _3060 = fma(_2668, _2992, _2360);
    float _3062 = fma(_2670, _2992, _2362);
    float _3064 = fma(_2366, _3058, _2364);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2998;
    bool _3066 = !_3008;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2464);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2464 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = 1.0 / _3088;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3094;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3120 = fma(_3114, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3124;
            _3042 = _3128;
            _3054 = _3120;
            _3036 = _3126;
            _3070 = _3122;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2464);
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
                bool _3158 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2464);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2464 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = 1.0 / _3174;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3180;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3206 = fma(_3200, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3210;
                    _3042 = _3214;
                    _3054 = _3206;
                    _3036 = _3212;
                    _3070 = _3208;
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
    float _3230 = fma(_2936, -0.5, 0.5);
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
    out.m_105.x = 0.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
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
    out.m_59.x = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3280 = -_2151;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2153;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2155;
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
    float _3322 = _2936 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2934, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2926, _3318, _3330);
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
    float _1239 = 1.0;
    if (!_941)
    {
        int _1241 = ~_977;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1249 = _1203 * _1197;
        _170 = _1249;
    }
    float _1251 = _170;
    int _1253 = _1085 ? 0 : 1;
    float _1255 = fma(_565, 78.233001708984375, _1247);
    float _1257 = fma(_208, 78.233001708984375, _1247);
    float _1259 = _565 + (-0.5);
    float _1261 = _1255 * 0.15915493667125701904296875;
    int _1263 = abs(_765);
    float _1265 = _1257 * 0.15915493667125701904296875;
    int _1267 = ~_1219;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1035)
    {
        int _1275 = ~_1219;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = _1261 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = float(_1245);
    float _1287 = fma(_1075, _1191, _1223);
    float _1289 = float(_1263);
    int _1291 = ~_1253;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1087, _1189, _1287);
    float _1299 = _1265 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    float _1303 = _1289 * _1285;
    int _1305 = abs(_771);
    float _1307 = fma(_1211, _1165, _1297);
    int _1309 = _1295;
    if (!_1073)
    {
        int _1311 = ~_1253;
        int _1313 = _1311 + 1;
        _1309 = _1313;
    }
    int _1315 = _1309;
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_909);
    float _1321 = fma(_1221, _1151, _1307);
    float _1323 = _1283 * 43758.546875;
    float _1325 = fma(_1317, _1233, _1233);
    float _1327 = float(_1279);
    float _1329 = fma(_1037, _1317, _1037);
    float _1331 = floor(_1323);
    float _1333 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1325);
    float _1335 = -_583;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1319 * _1327;
    float _1341 = _1301 * 43758.546875;
    float _1343 = fma(_1329, _1251, _1333);
    float _1345 = float(_1315);
    float _1347 = _1339 * (-2.0);
    float _1349 = float(_1305);
    float _1351 = _1343 * 0.15915493667125701904296875;
    float _1353 = _208 + (-0.5);
    float _1355 = fma(_1347, _1231, _1231);
    float _1357 = fma(_1049, _1347, _1049);
    float _1359 = _1349 * _1345;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1363 = _525 + _1361;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1355);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = _525 + _1367;
    float _1371 = _1359 * (-2.0);
    float _1373 = floor(_1341);
    float _1375 = fma(_1357, _1251, _1365);
    float _1377 = fma(_1025, _1363, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1379 = fma(_1371, _1235, _1235);
    float _1381 = fma(_1021, _1371, _1021);
    float _1383 = _1375 * 0.15915493667125701904296875;
    float _1385 = fma(_995, _1369, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1387 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1379);
    float _1389 = _871 * _871;
    float _1391 = fma(_1377, _1157, _1321);
    float _1393 = -_1331;
    float _1395 = _1323 + _1393;
    float _1397 = fma(_1381, _1251, _1387);
    float _1399 = -_773;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1403 = in.m_85.x;
    float _1405 = in.m_85.y;
    float _1407 = in.m_85.z;
    float _1409 = fma(_1385, _1149, _1391);
    float _1411 = fma(_1401, _1401, _1389);
    float _1413 = in.m_87.x;
    float _1415 = in.m_87.y;
    float _1417 = in.m_87.z;
    float _1419 = -_1373;
    float _1421 = _1341 + _1419;
    float _1423 = fma(_1395, 4.0, -2.0);
    float _1425 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1409);
    float _1427 = fma(_891, _891, _1411);
    float _1429 = _182 * _182;
    float _1431 = _1421 * 0.5;
    float _1433 = _1425 * _1423;
    float _1435 = _1425 * _1421;
    float _1437 = _1435 * 4.0;
    float _1439 = _1351 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = -_1431;
    float _1445 = fma(_1429, 1.5, _1443);
    float _1447 = precise::clamp(_1445, 0.0, 1.0);
    float _1449 = _1433 * 0.15915493667125701904296875;
    float _1451 = _1397 * 0.15915493667125701904296875;
    float _1453 = -_593;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = -_601;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = -_1407;
    float _1467 = _1163 + _1465;
    float _1469 = -_1159;
    float _1471 = _1469 + _1403;
    float _1473 = _503 * _1417;
    float _1475 = fma(_1447, _1467, _1407);
    float _1477 = _1449 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1483 = _501 * _1415;
    float _1485 = fma(_1437, _1163, _1475);
    float _1487 = -_1161;
    float _1489 = _1487 + _1405;
    float _1491 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1481);
    float _1493 = _499 * _1413;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1497 = _1463 * _1489;
    float _1499 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1501 = _1351 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1509 = _1479 * _1489;
    float _1511 = -_1497;
    float _1513 = fma(_1479, _1471, _1511);
    float _1515 = 1.0 / _1505;
    float _1517 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1507);
    float _1519 = fma(_1463, _1471, _1509);
    float _1521 = _1337 * _1337;
    float _1523 = _1513 + _1159;
    float _1525 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1517);
    float _1527 = fma(_1455, _1455, _1521);
    float _1529 = _1383 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1535 = -_1513;
    float _1537 = fma(_1535, _1447, _1523);
    float _1539 = fma(_1459, _1459, _1527);
    float _1541 = _1533 + _1505;
    float _1543 = fma(_1437, _1159, _1537);
    float _1545 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1547 = _1383 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1541 * _1515;
    float _1553 = _1551 * 0.5;
    float _1555 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1559 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1557);
    float _1561 = _779 + _1555;
    float _1563 = _1451 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1531 * _1441;
    float _1569 = _1531 * _1503;
    float _1571 = sqrt(_1427);
    float _1573 = _1549 * _1503;
    float _1575 = _1549 * _1441;
    float _1577 = rsqrt(_1539);
    float _1579 = fma(_1565, _1573, _1567);
    float _1581 = fma(_1565, _1567, _1573);
    float _1583 = _1519 + _1161;
    float _1585 = -_1575;
    float _1587 = fma(_1565, _1569, _1585);
    float _1589 = -_1569;
    float _1591 = fma(_1565, _1575, _1589);
    float _1593 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1595 = -_1519;
    float _1597 = fma(_1595, _1447, _1583);
    float _1599 = 1.0 / _1559;
    float _1601 = _725 * _1571;
    float _1603 = fma(_1437, _1161, _1597);
    float _1605 = _1601 * _1545;
    float _1607 = _1601 * _1593;
    float _1609 = _1601 * _1495;
    float _1611 = _1455 * _1577;
    float _1613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1543);
    float _1615 = _1459 * _1577;
    float _1617 = _1337 * _1577;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1621 = _1611 * _1619;
    float _1623 = _1613 * _1605;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1627 = _1615 * _1625;
    float _1629 = _1451 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1635 = _1599 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1621;
    float _1641 = fma(_1615, _1637, _1639);
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1617 * _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1649 = -_1627;
    float _1651 = fma(_1617, _1647, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1655 = _1641 * _1641;
    bool _1657 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1645;
    float _1663 = fma(_1611, _1659, _1661);
    bool _1665 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1667 = fma(_1651, _1651, _1655);
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1603);
    float _1671 = _1653 * _1607;
    float _1673 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1675 = fma(_1663, _1663, _1667);
    float _1677 = _1669 * _1609;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1549 * _1631;
    float _1685 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1673);
    float _1687 = _1531 * _1631;
    int _1689 = 2;
    float _1691 = _1561;
    float _1693 = _1479;
    if (!_1657)
    {
        _1689 = 1;
    }
    int _1695 = _1689;
    float _1697 = rsqrt(_1675);
    int _1699 = _1695;
    if (!_1665)
    {
        _1699 = _1681;
    }
    int _1701 = _1699;
    float _1703 = -_1677;
    float _1705 = _1565 * _1703;
    float _1707 = _1683 * _1677;
    float _1709 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1685);
    float _1711 = _1503 * _1631;
    float _1713 = _1687 * _1677;
    int _1715 = _1701 << 6;
    float _1717 = _1441 * _1631;
    float _1719 = fma(_1711, _1623, _1705);
    float _1721 = fma(_1579, _1623, _1707);
    float _1723 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1725 = fma(_1587, _1623, _1713);
    float _1727 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1729 = _1715 + 96;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1591, _1671, _1721);
    float _1749 = _1651 * _1697;
    float _1751 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1727);
    float _1753 = _1641 * _1697;
    float _1755 = _1663 * _1697;
    float _1757 = _1617 * _1749;
    float _1759 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1751);
    int _1761 = _1715 + 104;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
    int _1771 = int(_1763) + 1;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    int _1775 = _1771 & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    float _1779 = _1615 * _1753;
    float _1781 = -_1757;
    float _1783 = fma(_1611, _1753, _1781);
    float _1785 = _1759 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1787 = trunc(_1723);
    int _1789 = int(_1787);
    float _1791 = -_1779;
    float _1793 = fma(_1617, _1755, _1791);
    float _1795 = fma(_1717, _1671, _1719);
    float _1797 = _1783 * _1747;
    int _1799 = _1715 + 64;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
    int _1805 = int(_1801) & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = int(_1801) + 1;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    int _1813 = _1809 & 3;
    float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
    float _1817 = fma(_1581, _1671, _1725);
    float _1819 = _1793 * _1747;
    float _1821 = fma(_1755, _1795, _1797);
    float _1823 = trunc(_1785);
    int _1825 = int(_1823);
    bool _1827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1829 = isnan(0.5);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1749, _1795, _1819);
    float _1839 = fma(_1615, _1817, _1821);
    int _1841 = _1715 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_1611, _1817, _1837);
    float _1861 = _601 + _1839;
    int _1863 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1865 = _1789 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = _593 + _1859;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1873 = _1861 + _1871;
    int _1875 = _1715 + 56;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    uint _1879 = uint(int(uint(int(_1877)) >> uint(2)));
    int _1881 = int(_1877) & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    int _1885 = int(_1877) + 1;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    int _1889 = _1885 & 3;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
    bool _1893 = _1867 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1897 = _1869 + _1895;
    float _1899 = _1873 * _1873;
    int _1901 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1903 = _1825 + _1901;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1897, _1899);
    int _1909 = _1715 + 72;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    int _1927 = _1867 | _1905;
    float _1929 = sqrt(_1907);
    bool _1931 = _1927 < 0;
    bool _1933 = _1931 || _1893;
    float _1935 = _1611 * _1755;
    int _1937 = _1715 + 80;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    bool _1955 = _1905 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1957 = _1955 || _1933;
    float _1959 = _1561 * _1745;
    float _1961 = -_1935;
    float _1963 = fma(_1615, _1749, _1961);
    float _1965 = fma(_785, _1737, _1959);
    float _1967 = _1963 * _1747;
    float _1969 = fma(_793, _1769, _1965);
    float _1971 = fma(_1753, _1795, _1967);
    bool _1973 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1975 = _1867;
    int _1977 = as_type<int>(_1967);
    float _1979 = _1869;
    float _1981 = _1861;
    if (!_1957)
    {
        int _1983 = _1905 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1985 = _1983 + _1867;
        _1975 = _1985;
    }
    int _1987 = _1975;
    float _1989 = _1969 + _1777;
    float _1991 = _1747;
    if (!_1957)
    {
        float _1993 = floor(_1723);
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1561 * _1815;
    int _1999 = as_type<int>(_1815);
    float _2001 = _1997;
    if (!_1957)
    {
        int _2003 = _1987 << 2;
        _1977 = _2003;
    }
    int _2005 = _1977;
    float _2007 = fma(_785, _1807, _1997);
    if (!_1957)
    {
        int _2009 = 12 & _2005;
        _1999 = _2009;
    }
    int _2011 = _1999;
    float _2013 = 1.0 / _1989;
    float _2015 = _1561 * _1857;
    float _2017 = fma(_1617, _1817, _1971);
    float _2019 = fma(_785, _1849, _2015);
    float _2021 = _583 + _2017;
    int _2023 = as_type<int>(_2015);
    if (!_1957)
    {
        uint _2025 = uint(int(uint(_1987) >> uint(2)));
        _2023 = int(_2025);
    }
    int _2027 = _2023;
    float _2029 = fma(_793, _1883, _2019);
    int _2031 = _2027;
    if (!_1957)
    {
        int _2033 = _2027 << 4;
        int _2035 = _2033 + _2011;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1973)
    {
        _2001 = _2021;
    }
    float _2039 = _2001;
    float _2041 = fma(_793, _1917, _2007);
    bool _2043 = !_1973;
    float _2045 = _2039;
    float _2047 = _1953;
    if (!_2043)
    {
        float _2049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2053 = _1929 + _2051;
        float _2055 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2057 = rsqrt(_1907);
        float _2059 = _2053 * _2049;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = _2061 * 6.283185482025146484375;
        float _2065 = sin(_2063);
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = fma(_2065, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2073 = _2057 * _2071;
        float _2075 = _2069 + (-1.0);
        float _2077 = fma(_1897, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2079 = fma(_1873, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2081 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2083 = fma(_2021, _2069, _2081);
        _1979 = _2077;
        _2045 = _2083;
        _1981 = _2079;
    }
    float _2085 = _1979;
    float _2087 = _2045;
    float _2089 = _1981;
    float _2091 = -_773;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2095 = -_767;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2099 = -_781;
    float _2101 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2089);
    float _2103 = _2029 + _1891;
    float _2105 = _2041 + _1925;
    float _2107 = _2097;
    float _2109 = _2101;
    if (_1835)
    {
        _775 = _2093;
    }
    float _2111 = _775;
    float _2113 = _2111;
    if (!_1835)
    {
        float _2115 = _789 * _789;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_593;
        float _2121 = _2119 + _2085;
        float _2123 = fma(_797, _797, _2115);
        float _2125 = fma(_803, _803, _2123);
        float _2127 = 1.0 / _1601;
        float _2129 = sqrt(_2125);
        float _2131 = precise::min(_2129, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2117;
        float _2135 = -_583;
        float _2137 = _2135 + _2087;
        float _2139 = -_601;
        float _2141 = _2139 + _2089;
        float _2143 = _2133 * _2127;
        float _2145 = fma(_2137, _2143, _779);
        float _2147 = fma(_2121, _2143, _785);
        float _2149 = fma(_2141, _2143, _793);
        _2107 = _2145;
        _2113 = _2147;
        _2109 = _2149;
    }
    float _2151 = _2107;
    float _2153 = _2113;
    float _2155 = _2109;
    int _2157 = _1715 + 88;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    float _2175 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = _2103 * _2013;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2181 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2183 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2187 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2179);
    float _2189 = _803;
    if (!_1957)
    {
        int _2191 = _2037 + 400;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
        int _2197 = int(_2193) & 3;
        float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
        _2189 = _2199;
    }
    float _2201 = _2189;
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2181);
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2183);
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2187);
    bool _2209 = _2177 >= 0.0;
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2185);
    float _2217 = _2105 * _2013;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2223 = _2177 <= 1.0;
    bool _2225 = _2223 && _2209;
    float _2227 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2229 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    bool _2233 = _2217 >= 0.0;
    bool _2235 = _2233 && _2225;
    float _2237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2239 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    bool _2243 = _2217 <= 1.0;
    bool _2245 = _2243 && _2235;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2249 = _1891;
    if (!_1957)
    {
        float _2251 = floor(_1785);
        _2249 = _2251;
    }
    float _2253 = _2249;
    float _2255 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2241);
    float _2257 = _1561 * _1953;
    float _2259 = -_2247;
    float _2261 = fma(_2259, _2237, 1.0);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2267 = fma(_785, _1945, _2257);
    float _2269 = log2(_2261);
    float _2271 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2273 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2265);
    float _2275 = _2261;
    if (_2245)
    {
        float _2277 = float(_1701);
        _2047 = _2277;
    }
    float _2279 = _2047;
    float _2281 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2271);
    float _2283 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2273);
    float _2285 = 1.0 / _2255;
    float _2287 = _2283;
    if (!_1957)
    {
        float _2289 = -_2253;
        float _2291 = _1785 + _2289;
        _2275 = _2291;
    }
    float _2293 = _2275;
    float _2295 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2281);
    float _2297 = fma(_793, _2165, _2267);
    float _2299 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2283);
    float _2301 = _2297 + _2173;
    float _2303 = _2257;
    if (_2245)
    {
        float _2305 = rint(_2279);
        float _2307 = precise::max(_2305, 0.0);
        uint _2309 = uint(_2307);
        uint _2311 = clamp(_2309, 0u, 65535u);
        _2303 = as_type<float>(_2311);
    }
    float _2313 = _2303;
    float _2315 = _2269 * 0.693147182464599609375;
    float _2317 = _2301 * _2013;
    float _2319 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2321 = _2301;
    if (!_1957)
    {
        float _2323 = rint(_2201);
        float _2325 = precise::max(_2323, 0.0);
        uint _2327 = uint(_2325);
        uint _2329 = clamp(_2327, 0u, 65535u);
        _2321 = as_type<float>(_2329);
    }
    float _2331 = _2321;
    float _2333 = _2295 * _2285;
    float _2335 = _2299 * _2285;
    float _2337 = fma(_2333, 0.5, 0.5);
    float _2339 = fma(_2335, -0.5, 0.5);
    float _2341 = _2333;
    if (!_1957)
    {
        float _2343 = -_1995;
        float _2345 = _1723 + _2343;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = _2217;
    if (_2245)
    {
        float3 _6966 = float3(_2177, _2217, float(as_type<int>(_2313)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2351 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2317, level(0.0));
        _2349 = _2351;
    }
    float _2353 = _2349;
    float3 _6980 = float3(_2337, _2339, _2319);
    float _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2337, _2339, _2319);
    float4 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = _2358.w;
    float _2368 = _1995;
    if (!_1957)
    {
        float3 _7012 = float3(_2347, _2293, float(as_type<int>(_2331)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2370 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2368 = _2370;
    }
    float _2372 = _2368;
    if (_1957)
    {
        _2287 = 1.0;
    }
    float _2374 = _2287;
    float _2376 = _2374;
    float _2378 = _2372;
    if (!_1957)
    {
        int _2380 = _1987 << 4;
        int _2382 = _2380 + 2048;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        int _2392 = int(_2384) + 1;
        uint _2394 = uint(int(uint(_2392) >> uint(2)));
        int _2396 = _2392 & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = _2382 + 8;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        float _2418 = _1561 * _2398;
        float _2420 = fma(_785, _2390, _2418);
        float _2422 = fma(_793, _2408, _2420);
        float _2424 = _2422 + _2416;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = -_2426;
        float _2430 = _2428 + _2372;
        float _2432 = fma(_2430, 500.0, 1.5);
        float _2434 = exp2(_2432);
        float _2436 = 0.0 + _2434;
        float _2438 = precise::clamp(_2436, 0.0, 1.0);
        _1691 = _2418;
        _2376 = _2438;
    }
    float _2440 = _1691;
    float _2442 = _2376;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2151 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2153 + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2454 = _2155 + _2452;
    float _2456 = _2446 * _2446;
    float _2458 = fma(_2450, _2450, _2456);
    float _2460 = fma(_2454, _2454, _2458);
    float _2462 = rsqrt(_2460);
    float _2464 = sqrt(_2460);
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2450 * _2466;
    float _2470 = _2454 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2440;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2446;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    float _2500 = _2474;
    if (_2480)
    {
        float _2502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2502;
    }
    float _2504 = _2486;
    if (_2480)
    {
        float _2506 = rsqrt(_2476);
        _2488 = _2506;
    }
    float _2508 = _2488;
    if (_2480)
    {
        float _2510 = _2484 * _2504;
        _2490 = _2510;
    }
    float _2512 = _2490;
    if (_2480)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2378 = _2514;
    }
    float _2516 = _2378;
    float _2518 = _793;
    if (_2480)
    {
        float _2520 = _2516 * 6.283185482025146484375;
        float _2522 = sin(_2520);
        _2518 = _2522;
    }
    float _2524 = _2518;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2528 = precise::max(0.0, _2526);
    float _2530 = _2504;
    float _2532 = _2528;
    if (_2480)
    {
        float _2534 = _2516 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        _2530 = _2536;
    }
    float _2538 = _2530;
    float _2540 = -_2466;
    float _2542 = -_2528;
    float _2544 = fma(_2446, _2540, _2542);
    if (_2480)
    {
        float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2546;
    }
    float _2548 = _2492;
    float _2550 = _2548;
    float _2552 = _2524;
    if (_2480)
    {
        float _2554 = fma(_2524, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = _2556;
    if (_2480)
    {
        float _2560 = _2538 + (-1.0);
        _2532 = _2560;
    }
    float _2562 = _2532;
    float _2564 = _2562;
    if (_2480)
    {
        float _2566 = _2508 * _2556;
        _2552 = _2566;
    }
    float _2568 = _2552;
    if (!_2480)
    {
        _2558 = _2544;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2480)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2574;
    }
    float _2576 = _2564;
    if (_2480)
    {
        float _2578 = _2468 * _2568;
        _2494 = _2578;
    }
    float _2580 = _2494;
    if (_2480)
    {
        float _2582 = _2470 * _2568;
        _2496 = _2582;
    }
    float _2584 = _2496;
    if (_2480)
    {
        float _2586 = fma(_2544, _2538, _2576);
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2480)
    {
        float _2590 = _2580 * _2580;
        _2498 = _2590;
    }
    float _2592 = _2498;
    if (_2480)
    {
        float _2594 = _2584 * _2584;
        _2500 = _2594;
    }
    float _2596 = _2500;
    float _2598 = fma(_2588, _2588, _2592);
    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2602 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2600);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = _2598 + _2596;
    float _2608 = -_2604;
    float _2610 = _2608 + 1.0;
    float _2612 = rsqrt(_2606);
    float _2614 = abs(_2610);
    float _2616 = log2(_2614);
    float _2618 = _2612 * _2580;
    float _2620 = _2612 * _2588;
    float _2622 = _2612 * _2584;
    float _2624 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = -_2624;
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2626);
    float _2630 = -_2622;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2628);
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2636 = fma(_2632, -0.5, 0.5);
    float _2638 = exp2(_2634);
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = fma(_2640, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2644 = sqrt(_2636);
    float _2646 = fma(_2640, _2642, -0.212114393711090087890625);
    float _2648 = _2620 + 1.0;
    float _2650 = fma(_2640, _2646, 1.570728778839111328125);
    float _2652 = -_2620;
    float _2654 = fma(_2638, _2648, _2652);
    float _2656 = fma(_2654, 0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2650;
    float _2662 = fma(_2658, _2660, 1.0);
    float2 _7461 = float2(_2662, _2656);
    float3 _2666 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2668 = _2666.x;
    float _2670 = _2666.y;
    float _2672 = _2666.z;
    float _2674 = in.m_89.x;
    float _2676 = in.m_89.y;
    float _2678 = abs(_1635);
    float _2680 = log2(_2678);
    bool _2682 = _1603 != 0.0;
    bool _2684 = isnan(_1603);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = _1683 * _1793;
    float _2694 = in.m_89.z;
    float _2696 = _1683 * _1963;
    bool _2698 = _1543 == 0.0;
    bool _2700 = !_2690;
    bool _2702 = _2698 && _2700;
    float _2704 = in.m_91.x;
    float _2706 = in.m_91.y;
    float _2708 = in.m_91.z;
    float _2710 = in.m_91.w;
    float _2712 = _1683 * _1783;
    bool _2714 = _1485 == 0.0;
    bool _2716 = _2714 && _2702;
    float _2718 = -_1565;
    float _2720 = fma(_2718, _1749, _2692);
    float _2722 = -_1565;
    float _2724 = fma(_2722, _1753, _2696);
    float _2726 = -_1565;
    float _2728 = fma(_2726, _1755, _2712);
    float _2730 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2732 = _1635 <= 8000.0;
    bool _2734 = isnan(_1635);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan(8000.0);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2746 = fma(_1687, _1617, _2724);
    float _2748 = -_835;
    float _2750 = _2748 + 1.0;
    float _2752 = exp2(_2730);
    float _2754 = _1479 * _2676;
    float _2756 = _1463 * _2676;
    float _2758 = fma(_1463, _2674, _2754);
    float _2760 = exp2(_2744);
    float _2762 = _2754;
    float _2764 = _2676;
    float _2766 = _2674;
    if (_2716)
    {
        _2762 = _2694;
    }
    float _2768 = _2762;
    float _2770 = -_2756;
    float _2772 = fma(_1479, _2674, _2770);
    float _2774 = _2758 * _2704;
    float _2776 = _2768;
    if (_2716)
    {
        _2764 = _2758;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (!_2716)
    {
        float _2782 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2716)
    {
        _1693 = _2768;
    }
    float _2786 = _1693;
    float _2788 = _1579 * _1793;
    float _2790 = _2786;
    if (!_2716)
    {
        _2776 = _2694;
    }
    float _2792 = _2776;
    float _2794 = -_2774;
    float _2796 = fma(_2772, _2706, _2794);
    if (_2716)
    {
        _2766 = _2772;
    }
    float _2798 = _2766;
    float _2800 = _2798;
    if (!_2716)
    {
        float _2802 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2772);
        _2800 = _2802;
    }
    float _2804 = _2800;
    float _2806 = _2772 * _2708;
    float _2808 = _2706 * _2792;
    float _2810 = _1579 * _1783;
    float _2812 = _1591 * _1783;
    float _2814 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -_2808;
    float _2820 = fma(_2758, _2708, _2818);
    float _2822 = fma(_1711, _1749, _2788);
    if (!_2716)
    {
        float _2824 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2792);
        _2790 = _2824;
    }
    float _2826 = _2790;
    float _2828 = fma(_2816, -2.0, 3.0);
    float _2830 = _2816 * _2816;
    float _2832 = _1579 * _1963;
    float _2834 = _1591 * _1793;
    float _2836 = _1591 * _1963;
    float _2838 = -_2806;
    float _2840 = fma(_2704, _2792, _2838);
    float _2842 = fma(_1711, _1753, _2832);
    float _2844 = fma(_1717, _1749, _2834);
    float _2846 = fma(_1711, _1755, _2810);
    float _2848 = fma(_1687, _1611, _2720);
    float _2850 = fma(_1717, _1753, _2836);
    float _2852 = fma(_1717, _1755, _2812);
    float _2854 = fma(_1587, _1617, _2842);
    float _2856 = fma(_1687, _1615, _2728);
    float _2858 = fma(_1581, _1611, _2844);
    float _2860 = fma(_1587, _1611, _2822);
    float _2862 = _2848 * _2706;
    float _2864 = fma(_1581, _1617, _2850);
    float _2866 = _2840 * _2710;
    float _2868 = fma(_1581, _1615, _2852);
    float _2870 = fma(_1587, _1615, _2846);
    float _2872 = _2746 * _2706;
    float _2874 = _2856 * _2706;
    float _2876 = fma(_2860, _2704, _2862);
    float _2878 = _2848 * _2784;
    float _2880 = _2746 * _2784;
    float _2882 = _2856 * _2784;
    float _2884 = _2866 * _2848;
    float _2886 = _2866 * _2746;
    float _2888 = _2866 * _2856;
    float _2890 = fma(_2854, _2704, _2872);
    float _2892 = fma(_2870, _2704, _2874);
    float _2894 = _2796 * _2710;
    float _2896 = fma(_2858, _2708, _2876);
    float _2898 = _2820 * _2710;
    float _2900 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2902 = fma(_2860, _2804, _2878);
    float _2904 = _2830 * _2828;
    float _2906 = fma(_2898, _2860, _2884);
    float _2908 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2900);
    float _2910 = fma(_2898, _2854, _2886);
    float _2912 = fma(_2898, _2870, _2888);
    float _2914 = fma(_2870, _2804, _2882);
    float _2916 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2908);
    float _2918 = fma(_2864, _2708, _2890);
    float _2920 = fma(_2854, _2804, _2880);
    float _2922 = fma(_2868, _2708, _2892);
    float _2924 = fma(_2894, _2868, _2912);
    float _2926 = fma(_2868, _2826, _2914);
    float _2928 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2916);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2858, _2826, _2902);
    float _2936 = fma(_2864, _2826, _2920);
    float _2938 = _2928 + _2255;
    float _2940 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2904);
    float _2942 = -_2752;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2894, _2858, _2906);
    float _2948 = _2938 * 0.5;
    float _2950 = _2742 * _2940;
    float _2952 = _2938;
    float _2954 = _2948;
    if (!_2245)
    {
        _2952 = 1.0;
    }
    float _2956 = _2952;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2960 = _2956;
    if (_2245)
    {
        bool _2962 = _2353 >= _2317;
        bool _2964 = isnan(_2353);
        bool _2966 = _2962 || _2964;
        bool _2968 = isnan(_2317);
        bool _2970 = _2966 || _2968;
        float _2972 = float(_2970);
        _2960 = _2972;
    }
    float _2974 = _2960;
    float _2976 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2978 = fma(_2894, _2864, _2910);
    float _2980 = _2958 * _2355;
    float _2982 = -_2958;
    float _2984 = _2982 + 1.0;
    float _2986 = _2750 * _2976;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2974 * _2442;
    float _2992 = _2366 * _2980;
    float _2994 = -_2988;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2366 * _2984;
    out.m_93.x = _2896;
    out.m_93.y = _2918;
    out.m_93.z = _2922;
    bool _3000 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3002 = isnan(_2464);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3008 = _3004 || _3006;
    float _3010 = -_2990;
    float _3012 = fma(_3010, _2996, 1.0);
    float _3014 = precise::clamp(_3012, 0.0, 1.0);
    out.m_95.x = _2946;
    out.m_95.y = _2978;
    out.m_95.z = _2924;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2295;
    out.gl_Position.y = _2299;
    out.gl_Position.z = _2928;
    out.gl_Position.w = _2255;
    out.m_97.x = _3016;
    float _3018 = _2990;
    float _3020 = _2984;
    float _3022 = _3014;
    float _3024 = _2255;
    if (!_3008)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3018;
    out.m_99.x = _2934;
    out.m_99.y = _2936;
    out.m_99.z = _2926;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3008)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3020;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3008)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3022;
    out.m_101.z = _2948;
    out.m_101.w = _2255;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3008)
    {
        _1239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _1239;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3008)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _3024;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3008)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _2954;
    float _3058 = _2672 * _2980;
    float _3060 = fma(_2668, _2992, _2360);
    float _3062 = fma(_2670, _2992, _2362);
    float _3064 = fma(_2366, _3058, _2364);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2998;
    bool _3066 = !_3008;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2464);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2464 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = 1.0 / _3088;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3094;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3120 = fma(_3114, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3124;
            _3042 = _3128;
            _3054 = _3120;
            _3036 = _3126;
            _3070 = _3122;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2464);
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
                bool _3158 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2464);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2464 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = 1.0 / _3174;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3180;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3206 = fma(_3200, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3210;
                    _3042 = _3214;
                    _3054 = _3206;
                    _3036 = _3212;
                    _3070 = _3208;
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
    float _3230 = fma(_2936, -0.5, 0.5);
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
    out.m_105.x = 0.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
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
    out.m_59.x = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        return out;
    }
    float _3280 = -_2151;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2153;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2155;
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
    float _3322 = _2936 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2934, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2926, _3318, _3330);
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
    float _1239 = 1.0;
    if (!_941)
    {
        int _1241 = ~_977;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    float _1247 = _1163 * 12.98980045318603515625;
    if (_1179)
    {
        float _1249 = _1203 * _1197;
        _170 = _1249;
    }
    float _1251 = _170;
    int _1253 = _1085 ? 0 : 1;
    float _1255 = fma(_565, 78.233001708984375, _1247);
    float _1257 = fma(_208, 78.233001708984375, _1247);
    float _1259 = _565 + (-0.5);
    float _1261 = _1255 * 0.15915493667125701904296875;
    int _1263 = abs(_765);
    float _1265 = _1257 * 0.15915493667125701904296875;
    int _1267 = ~_1219;
    int _1269 = _1267 + 1;
    int _1271 = _1269 + 1;
    int _1273 = _1271;
    if (!_1035)
    {
        int _1275 = ~_1219;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = _1261 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = float(_1245);
    float _1287 = fma(_1075, _1191, _1223);
    float _1289 = float(_1263);
    int _1291 = ~_1253;
    int _1293 = _1291 + 1;
    int _1295 = _1293 + 1;
    float _1297 = fma(_1087, _1189, _1287);
    float _1299 = _1265 * 6.283185482025146484375;
    float _1301 = sin(_1299);
    float _1303 = _1289 * _1285;
    int _1305 = abs(_771);
    float _1307 = fma(_1211, _1165, _1297);
    int _1309 = _1295;
    if (!_1073)
    {
        int _1311 = ~_1253;
        int _1313 = _1311 + 1;
        _1309 = _1313;
    }
    int _1315 = _1309;
    float _1317 = _1303 * (-2.0);
    float _1319 = float(_909);
    float _1321 = fma(_1221, _1151, _1307);
    float _1323 = _1283 * 43758.546875;
    float _1325 = fma(_1317, _1233, _1233);
    float _1327 = float(_1279);
    float _1329 = fma(_1037, _1317, _1037);
    float _1331 = floor(_1323);
    float _1333 = fma(_1259, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1325);
    float _1335 = -_583;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1339 = _1319 * _1327;
    float _1341 = _1301 * 43758.546875;
    float _1343 = fma(_1329, _1251, _1333);
    float _1345 = float(_1315);
    float _1347 = _1339 * (-2.0);
    float _1349 = float(_1305);
    float _1351 = _1343 * 0.15915493667125701904296875;
    float _1353 = _208 + (-0.5);
    float _1355 = fma(_1347, _1231, _1231);
    float _1357 = fma(_1049, _1347, _1049);
    float _1359 = _1349 * _1345;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1363 = _525 + _1361;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1355);
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1369 = _525 + _1367;
    float _1371 = _1359 * (-2.0);
    float _1373 = floor(_1341);
    float _1375 = fma(_1357, _1251, _1365);
    float _1377 = fma(_1025, _1363, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1379 = fma(_1371, _1235, _1235);
    float _1381 = fma(_1021, _1371, _1021);
    float _1383 = _1375 * 0.15915493667125701904296875;
    float _1385 = fma(_995, _1369, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1387 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1379);
    float _1389 = _871 * _871;
    float _1391 = fma(_1377, _1157, _1321);
    float _1393 = -_1331;
    float _1395 = _1323 + _1393;
    float _1397 = fma(_1381, _1251, _1387);
    float _1399 = -_773;
    float _1401 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[18].w, _605);
    float _1403 = in.m_85.x;
    float _1405 = in.m_85.y;
    float _1407 = in.m_85.z;
    float _1409 = fma(_1385, _1149, _1391);
    float _1411 = fma(_1401, _1401, _1389);
    float _1413 = in.m_87.x;
    float _1415 = in.m_87.y;
    float _1417 = in.m_87.z;
    float _1419 = -_1373;
    float _1421 = _1341 + _1419;
    float _1423 = fma(_1395, 4.0, -2.0);
    float _1425 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1409);
    float _1427 = fma(_891, _891, _1411);
    float _1429 = _182 * _182;
    float _1431 = _1421 * 0.5;
    float _1433 = _1425 * _1423;
    float _1435 = _1425 * _1421;
    float _1437 = _1435 * 4.0;
    float _1439 = _1351 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = -_1431;
    float _1445 = fma(_1429, 1.5, _1443);
    float _1447 = precise::clamp(_1445, 0.0, 1.0);
    float _1449 = _1433 * 0.15915493667125701904296875;
    float _1451 = _1397 * 0.15915493667125701904296875;
    float _1453 = -_593;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1457 = -_601;
    float _1459 = _1457 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1461 = _1449 * 6.283185482025146484375;
    float _1463 = sin(_1461);
    float _1465 = -_1407;
    float _1467 = _1163 + _1465;
    float _1469 = -_1159;
    float _1471 = _1469 + _1403;
    float _1473 = _503 * _1417;
    float _1475 = fma(_1447, _1467, _1407);
    float _1477 = _1449 * 6.283185482025146484375;
    float _1479 = cos(_1477);
    float _1481 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1483 = _501 * _1415;
    float _1485 = fma(_1437, _1163, _1475);
    float _1487 = -_1161;
    float _1489 = _1487 + _1405;
    float _1491 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1481);
    float _1493 = _499 * _1413;
    float _1495 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1497 = _1463 * _1489;
    float _1499 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1501 = _1351 * 6.283185482025146484375;
    float _1503 = cos(_1501);
    float _1505 = _1499 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1509 = _1479 * _1489;
    float _1511 = -_1497;
    float _1513 = fma(_1479, _1471, _1511);
    float _1515 = 1.0 / _1505;
    float _1517 = fma(_785, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1507);
    float _1519 = fma(_1463, _1471, _1509);
    float _1521 = _1337 * _1337;
    float _1523 = _1513 + _1159;
    float _1525 = fma(_793, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1517);
    float _1527 = fma(_1455, _1455, _1521);
    float _1529 = _1383 * 6.283185482025146484375;
    float _1531 = sin(_1529);
    float _1533 = _1525 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1535 = -_1513;
    float _1537 = fma(_1535, _1447, _1523);
    float _1539 = fma(_1459, _1459, _1527);
    float _1541 = _1533 + _1505;
    float _1543 = fma(_1437, _1159, _1537);
    float _1545 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1547 = _1383 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _1541 * _1515;
    float _1553 = _1551 * 0.5;
    float _1555 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1559 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1557);
    float _1561 = _779 + _1555;
    float _1563 = _1451 * 6.283185482025146484375;
    float _1565 = sin(_1563);
    float _1567 = _1531 * _1441;
    float _1569 = _1531 * _1503;
    float _1571 = sqrt(_1427);
    float _1573 = _1549 * _1503;
    float _1575 = _1549 * _1441;
    float _1577 = rsqrt(_1539);
    float _1579 = fma(_1565, _1573, _1567);
    float _1581 = fma(_1565, _1567, _1573);
    float _1583 = _1519 + _1161;
    float _1585 = -_1575;
    float _1587 = fma(_1565, _1569, _1585);
    float _1589 = -_1569;
    float _1591 = fma(_1565, _1575, _1589);
    float _1593 = _1473 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1595 = -_1519;
    float _1597 = fma(_1595, _1447, _1583);
    float _1599 = 1.0 / _1559;
    float _1601 = _725 * _1571;
    float _1603 = fma(_1437, _1161, _1597);
    float _1605 = _1601 * _1545;
    float _1607 = _1601 * _1593;
    float _1609 = _1601 * _1495;
    float _1611 = _1455 * _1577;
    float _1613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1543);
    float _1615 = _1459 * _1577;
    float _1617 = _1337 * _1577;
    float _1619 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1621 = _1611 * _1619;
    float _1623 = _1613 * _1605;
    float _1625 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1627 = _1615 * _1625;
    float _1629 = _1451 * 6.283185482025146484375;
    float _1631 = cos(_1629);
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1635 = _1599 * _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1639 = -_1621;
    float _1641 = fma(_1615, _1637, _1639);
    float _1643 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1645 = _1617 * _1643;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1649 = -_1627;
    float _1651 = fma(_1617, _1647, _1649);
    float _1653 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1485);
    float _1655 = _1641 * _1641;
    bool _1657 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1659 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1661 = -_1645;
    float _1663 = fma(_1611, _1659, _1661);
    bool _1665 = _1635 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1667 = fma(_1651, _1651, _1655);
    float _1669 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1603);
    float _1671 = _1653 * _1607;
    float _1673 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1675 = fma(_1663, _1663, _1667);
    float _1677 = _1669 * _1609;
    bool _1679 = !_1657;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = _1549 * _1631;
    float _1685 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1673);
    float _1687 = _1531 * _1631;
    int _1689 = 2;
    float _1691 = _1561;
    float _1693 = _1479;
    if (!_1657)
    {
        _1689 = 1;
    }
    int _1695 = _1689;
    float _1697 = rsqrt(_1675);
    int _1699 = _1695;
    if (!_1665)
    {
        _1699 = _1681;
    }
    int _1701 = _1699;
    float _1703 = -_1677;
    float _1705 = _1565 * _1703;
    float _1707 = _1683 * _1677;
    float _1709 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1685);
    float _1711 = _1503 * _1631;
    float _1713 = _1687 * _1677;
    int _1715 = _1701 << 6;
    float _1717 = _1441 * _1631;
    float _1719 = fma(_1711, _1623, _1705);
    float _1721 = fma(_1579, _1623, _1707);
    float _1723 = _1709 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1725 = fma(_1587, _1623, _1713);
    float _1727 = _1561 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    int _1729 = _1715 + 96;
    uint _1731 = uint(int(uint(_1729) >> uint(2)));
    uint _1733 = uint(int(uint(int(_1731)) >> uint(2)));
    int _1735 = int(_1731) & 3;
    float _1737 = (*spvDescriptorSet0.vp_c15)._m0[int(_1733)][_1735];
    int _1739 = int(_1731) + 1;
    uint _1741 = uint(int(uint(_1739) >> uint(2)));
    int _1743 = _1739 & 3;
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[int(_1741)][_1743];
    float _1747 = fma(_1591, _1671, _1721);
    float _1749 = _1651 * _1697;
    float _1751 = fma(_785, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1727);
    float _1753 = _1641 * _1697;
    float _1755 = _1663 * _1697;
    float _1757 = _1617 * _1749;
    float _1759 = fma(_793, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1751);
    int _1761 = _1715 + 104;
    uint _1763 = uint(int(uint(_1761) >> uint(2)));
    uint _1765 = uint(int(uint(int(_1763)) >> uint(2)));
    int _1767 = int(_1763) & 3;
    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[int(_1765)][_1767];
    int _1771 = int(_1763) + 1;
    uint _1773 = uint(int(uint(_1771) >> uint(2)));
    int _1775 = _1771 & 3;
    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[int(_1773)][_1775];
    float _1779 = _1615 * _1753;
    float _1781 = -_1757;
    float _1783 = fma(_1611, _1753, _1781);
    float _1785 = _1759 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _1787 = trunc(_1723);
    int _1789 = int(_1787);
    float _1791 = -_1779;
    float _1793 = fma(_1617, _1755, _1791);
    float _1795 = fma(_1717, _1671, _1719);
    float _1797 = _1783 * _1747;
    int _1799 = _1715 + 64;
    uint _1801 = uint(int(uint(_1799) >> uint(2)));
    uint _1803 = uint(int(uint(int(_1801)) >> uint(2)));
    int _1805 = int(_1801) & 3;
    float _1807 = (*spvDescriptorSet0.vp_c15)._m0[int(_1803)][_1805];
    int _1809 = int(_1801) + 1;
    uint _1811 = uint(int(uint(_1809) >> uint(2)));
    int _1813 = _1809 & 3;
    float _1815 = (*spvDescriptorSet0.vp_c15)._m0[int(_1811)][_1813];
    float _1817 = fma(_1581, _1671, _1725);
    float _1819 = _1793 * _1747;
    float _1821 = fma(_1755, _1795, _1797);
    float _1823 = trunc(_1785);
    int _1825 = int(_1823);
    bool _1827 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1829 = isnan(0.5);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1835 = _1831 || _1833;
    float _1837 = fma(_1749, _1795, _1819);
    float _1839 = fma(_1615, _1817, _1821);
    int _1841 = _1715 + 48;
    uint _1843 = uint(int(uint(_1841) >> uint(2)));
    uint _1845 = uint(int(uint(int(_1843)) >> uint(2)));
    int _1847 = int(_1843) & 3;
    float _1849 = (*spvDescriptorSet0.vp_c15)._m0[int(_1845)][_1847];
    int _1851 = int(_1843) + 1;
    uint _1853 = uint(int(uint(_1851) >> uint(2)));
    int _1855 = _1851 & 3;
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[int(_1853)][_1855];
    float _1859 = fma(_1611, _1817, _1837);
    float _1861 = _601 + _1839;
    int _1863 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1865 = _1789 + _1863;
    int _1867 = _1865 + 1;
    float _1869 = _593 + _1859;
    float _1871 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1873 = _1861 + _1871;
    int _1875 = _1715 + 56;
    uint _1877 = uint(int(uint(_1875) >> uint(2)));
    uint _1879 = uint(int(uint(int(_1877)) >> uint(2)));
    int _1881 = int(_1877) & 3;
    float _1883 = (*spvDescriptorSet0.vp_c15)._m0[int(_1879)][_1881];
    int _1885 = int(_1877) + 1;
    uint _1887 = uint(int(uint(_1885) >> uint(2)));
    int _1889 = _1885 & 3;
    float _1891 = (*spvDescriptorSet0.vp_c15)._m0[int(_1887)][_1889];
    bool _1893 = _1867 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1897 = _1869 + _1895;
    float _1899 = _1873 * _1873;
    int _1901 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1903 = _1825 + _1901;
    int _1905 = _1903 + 1;
    float _1907 = fma(_1897, _1897, _1899);
    int _1909 = _1715 + 72;
    uint _1911 = uint(int(uint(_1909) >> uint(2)));
    uint _1913 = uint(int(uint(int(_1911)) >> uint(2)));
    int _1915 = int(_1911) & 3;
    float _1917 = (*spvDescriptorSet0.vp_c15)._m0[int(_1913)][_1915];
    int _1919 = int(_1911) + 1;
    uint _1921 = uint(int(uint(_1919) >> uint(2)));
    int _1923 = _1919 & 3;
    float _1925 = (*spvDescriptorSet0.vp_c15)._m0[int(_1921)][_1923];
    int _1927 = _1867 | _1905;
    float _1929 = sqrt(_1907);
    bool _1931 = _1927 < 0;
    bool _1933 = _1931 || _1893;
    float _1935 = _1611 * _1755;
    int _1937 = _1715 + 80;
    uint _1939 = uint(int(uint(_1937) >> uint(2)));
    uint _1941 = uint(int(uint(int(_1939)) >> uint(2)));
    int _1943 = int(_1939) & 3;
    float _1945 = (*spvDescriptorSet0.vp_c15)._m0[int(_1941)][_1943];
    int _1947 = int(_1939) + 1;
    uint _1949 = uint(int(uint(_1947) >> uint(2)));
    int _1951 = _1947 & 3;
    float _1953 = (*spvDescriptorSet0.vp_c15)._m0[int(_1949)][_1951];
    bool _1955 = _1905 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1957 = _1955 || _1933;
    float _1959 = _1561 * _1745;
    float _1961 = -_1935;
    float _1963 = fma(_1615, _1749, _1961);
    float _1965 = fma(_785, _1737, _1959);
    float _1967 = _1963 * _1747;
    float _1969 = fma(_793, _1769, _1965);
    float _1971 = fma(_1753, _1795, _1967);
    bool _1973 = _1929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1975 = _1867;
    int _1977 = as_type<int>(_1967);
    float _1979 = _1869;
    float _1981 = _1861;
    if (!_1957)
    {
        int _1983 = _1905 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1985 = _1983 + _1867;
        _1975 = _1985;
    }
    int _1987 = _1975;
    float _1989 = _1969 + _1777;
    float _1991 = _1747;
    if (!_1957)
    {
        float _1993 = floor(_1723);
        _1991 = _1993;
    }
    float _1995 = _1991;
    float _1997 = _1561 * _1815;
    int _1999 = as_type<int>(_1815);
    float _2001 = _1997;
    if (!_1957)
    {
        int _2003 = _1987 << 2;
        _1977 = _2003;
    }
    int _2005 = _1977;
    float _2007 = fma(_785, _1807, _1997);
    if (!_1957)
    {
        int _2009 = 12 & _2005;
        _1999 = _2009;
    }
    int _2011 = _1999;
    float _2013 = 1.0 / _1989;
    float _2015 = _1561 * _1857;
    float _2017 = fma(_1617, _1817, _1971);
    float _2019 = fma(_785, _1849, _2015);
    float _2021 = _583 + _2017;
    int _2023 = as_type<int>(_2015);
    if (!_1957)
    {
        uint _2025 = uint(int(uint(_1987) >> uint(2)));
        _2023 = int(_2025);
    }
    int _2027 = _2023;
    float _2029 = fma(_793, _1883, _2019);
    int _2031 = _2027;
    if (!_1957)
    {
        int _2033 = _2027 << 4;
        int _2035 = _2033 + _2011;
        _2031 = _2035;
    }
    int _2037 = _2031;
    if (!_1973)
    {
        _2001 = _2021;
    }
    float _2039 = _2001;
    float _2041 = fma(_793, _1917, _2007);
    bool _2043 = !_1973;
    float _2045 = _2039;
    float _2047 = _1953;
    if (!_2043)
    {
        float _2049 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2053 = _1929 + _2051;
        float _2055 = _2021 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2057 = rsqrt(_1907);
        float _2059 = _2053 * _2049;
        float _2061 = _2059 * 0.15915493667125701904296875;
        float _2063 = _2061 * 6.283185482025146484375;
        float _2065 = sin(_2063);
        float _2067 = _2061 * 6.283185482025146484375;
        float _2069 = cos(_2067);
        float _2071 = fma(_2065, _2055, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2073 = _2057 * _2071;
        float _2075 = _2069 + (-1.0);
        float _2077 = fma(_1897, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2079 = fma(_1873, _2073, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2081 = _2075 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2083 = fma(_2021, _2069, _2081);
        _1979 = _2077;
        _2045 = _2083;
        _1981 = _2079;
    }
    float _2085 = _1979;
    float _2087 = _2045;
    float _2089 = _1981;
    float _2091 = -_773;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2085);
    float _2095 = -_767;
    float _2097 = fma(_2095, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2087);
    float _2099 = -_781;
    float _2101 = fma(_2099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2089);
    float _2103 = _2029 + _1891;
    float _2105 = _2041 + _1925;
    float _2107 = _2097;
    float _2109 = _2101;
    if (_1835)
    {
        _775 = _2093;
    }
    float _2111 = _775;
    float _2113 = _2111;
    if (!_1835)
    {
        float _2115 = _789 * _789;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -_593;
        float _2121 = _2119 + _2085;
        float _2123 = fma(_797, _797, _2115);
        float _2125 = fma(_803, _803, _2123);
        float _2127 = 1.0 / _1601;
        float _2129 = sqrt(_2125);
        float _2131 = precise::min(_2129, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2133 = _2131 * _2117;
        float _2135 = -_583;
        float _2137 = _2135 + _2087;
        float _2139 = -_601;
        float _2141 = _2139 + _2089;
        float _2143 = _2133 * _2127;
        float _2145 = fma(_2137, _2143, _779);
        float _2147 = fma(_2121, _2143, _785);
        float _2149 = fma(_2141, _2143, _793);
        _2107 = _2145;
        _2113 = _2147;
        _2109 = _2149;
    }
    float _2151 = _2107;
    float _2153 = _2113;
    float _2155 = _2109;
    int _2157 = _1715 + 88;
    uint _2159 = uint(int(uint(_2157) >> uint(2)));
    uint _2161 = uint(int(uint(int(_2159)) >> uint(2)));
    int _2163 = int(_2159) & 3;
    float _2165 = (*spvDescriptorSet0.vp_c15)._m0[int(_2161)][_2163];
    int _2167 = int(_2159) + 1;
    uint _2169 = uint(int(uint(_2167) >> uint(2)));
    int _2171 = _2167 & 3;
    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[int(_2169)][_2171];
    float _2175 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2177 = _2103 * _2013;
    float _2179 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2181 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2183 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2175);
    float _2185 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2187 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2179);
    float _2189 = _803;
    if (!_1957)
    {
        int _2191 = _2037 + 400;
        uint _2193 = uint(int(uint(_2191) >> uint(2)));
        uint _2195 = uint(int(uint(int(_2193)) >> uint(2)));
        int _2197 = int(_2193) & 3;
        float _2199 = (*spvDescriptorSet0.vp_c15)._m0[int(_2195)][_2197];
        _2189 = _2199;
    }
    float _2201 = _2189;
    float _2203 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2181);
    float _2205 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2183);
    float _2207 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2187);
    bool _2209 = _2177 >= 0.0;
    float _2211 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_2153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2185);
    float _2217 = _2105 * _2013;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _2223 = _2177 <= 1.0;
    bool _2225 = _2223 && _2209;
    float _2227 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2229 = fma(_2155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    bool _2233 = _2217 >= 0.0;
    bool _2235 = _2233 && _2225;
    float _2237 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2239 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2241 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    bool _2243 = _2217 <= 1.0;
    bool _2245 = _2243 && _2235;
    float _2247 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2249 = _1891;
    if (!_1957)
    {
        float _2251 = floor(_1785);
        _2249 = _2251;
    }
    float _2253 = _2249;
    float _2255 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2241);
    float _2257 = _1561 * _1953;
    float _2259 = -_2247;
    float _2261 = fma(_2259, _2237, 1.0);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2267 = fma(_785, _1945, _2257);
    float _2269 = log2(_2261);
    float _2271 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2273 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2265);
    float _2275 = _2261;
    if (_2245)
    {
        float _2277 = float(_1701);
        _2047 = _2277;
    }
    float _2279 = _2047;
    float _2281 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2271);
    float _2283 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2273);
    float _2285 = 1.0 / _2255;
    float _2287 = _2283;
    if (!_1957)
    {
        float _2289 = -_2253;
        float _2291 = _1785 + _2289;
        _2275 = _2291;
    }
    float _2293 = _2275;
    float _2295 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2281);
    float _2297 = fma(_793, _2165, _2267);
    float _2299 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2283);
    float _2301 = _2297 + _2173;
    float _2303 = _2257;
    if (_2245)
    {
        float _2305 = rint(_2279);
        float _2307 = precise::max(_2305, 0.0);
        uint _2309 = uint(_2307);
        uint _2311 = clamp(_2309, 0u, 65535u);
        _2303 = as_type<float>(_2311);
    }
    float _2313 = _2303;
    float _2315 = _2269 * 0.693147182464599609375;
    float _2317 = _2301 * _2013;
    float _2319 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2321 = _2301;
    if (!_1957)
    {
        float _2323 = rint(_2201);
        float _2325 = precise::max(_2323, 0.0);
        uint _2327 = uint(_2325);
        uint _2329 = clamp(_2327, 0u, 65535u);
        _2321 = as_type<float>(_2329);
    }
    float _2331 = _2321;
    float _2333 = _2295 * _2285;
    float _2335 = _2299 * _2285;
    float _2337 = fma(_2333, 0.5, 0.5);
    float _2339 = fma(_2335, -0.5, 0.5);
    float _2341 = _2333;
    if (!_1957)
    {
        float _2343 = -_1995;
        float _2345 = _1723 + _2343;
        _2341 = _2345;
    }
    float _2347 = _2341;
    float _2349 = _2217;
    if (_2245)
    {
        float3 _6966 = float3(_2177, _2217, float(as_type<int>(_2313)));
        float3 _6970 = select(_6966, float3(0.0), isnan(_6966));
        float _2351 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6970.xy, uint(rint(_6970.z)), _2317, level(0.0));
        _2349 = _2351;
    }
    float _2353 = _2349;
    float3 _6980 = float3(_2337, _2339, _2319);
    float _2355 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6980, float3(0.0), isnan(_6980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6980, float3(0.0), isnan(_6980)), level(0.0)).x;
    float3 _6989 = float3(_2337, _2339, _2319);
    float4 _2358 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6989, float3(0.0), isnan(_6989)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6989, float3(0.0), isnan(_6989)), level(0.0)).xyzw;
    float _2360 = _2358.x;
    float _2362 = _2358.y;
    float _2364 = _2358.z;
    float _2366 = _2358.w;
    float _2368 = _1995;
    if (!_1957)
    {
        float3 _7012 = float3(_2347, _2293, float(as_type<int>(_2331)));
        float3 _7014 = select(_7012, float3(0.0), isnan(_7012));
        float _2370 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7014.xy, uint(rint(_7014.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7014.xy, uint(rint(_7014.z)), level(0.0)).x;
        _2368 = _2370;
    }
    float _2372 = _2368;
    if (_1957)
    {
        _2287 = 1.0;
    }
    float _2374 = _2287;
    float _2376 = _2374;
    float _2378 = _2372;
    if (!_1957)
    {
        int _2380 = _1987 << 4;
        int _2382 = _2380 + 2048;
        uint _2384 = uint(int(uint(_2382) >> uint(2)));
        uint _2386 = uint(int(uint(int(_2384)) >> uint(2)));
        int _2388 = int(_2384) & 3;
        float _2390 = (*spvDescriptorSet0.vp_c15)._m0[int(_2386)][_2388];
        int _2392 = int(_2384) + 1;
        uint _2394 = uint(int(uint(_2392) >> uint(2)));
        int _2396 = _2392 & 3;
        float _2398 = (*spvDescriptorSet0.vp_c15)._m0[int(_2394)][_2396];
        int _2400 = _2382 + 8;
        uint _2402 = uint(int(uint(_2400) >> uint(2)));
        uint _2404 = uint(int(uint(int(_2402)) >> uint(2)));
        int _2406 = int(_2402) & 3;
        float _2408 = (*spvDescriptorSet0.vp_c15)._m0[int(_2404)][_2406];
        int _2410 = int(_2402) + 1;
        uint _2412 = uint(int(uint(_2410) >> uint(2)));
        int _2414 = _2410 & 3;
        float _2416 = (*spvDescriptorSet0.vp_c15)._m0[int(_2412)][_2414];
        float _2418 = _1561 * _2398;
        float _2420 = fma(_785, _2390, _2418);
        float _2422 = fma(_793, _2408, _2420);
        float _2424 = _2422 + _2416;
        float _2426 = precise::clamp(_2424, 0.0, 1.0);
        float _2428 = -_2426;
        float _2430 = _2428 + _2372;
        float _2432 = fma(_2430, 500.0, 1.5);
        float _2434 = exp2(_2432);
        float _2436 = 0.0 + _2434;
        float _2438 = precise::clamp(_2436, 0.0, 1.0);
        _1691 = _2418;
        _2376 = _2438;
    }
    float _2440 = _1691;
    float _2442 = _2376;
    float _2444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2446 = _2151 + _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2450 = _2153 + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2454 = _2155 + _2452;
    float _2456 = _2446 * _2446;
    float _2458 = fma(_2450, _2450, _2456);
    float _2460 = fma(_2454, _2454, _2458);
    float _2462 = rsqrt(_2460);
    float _2464 = sqrt(_2460);
    float _2466 = _2462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2450 * _2466;
    float _2470 = _2454 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2440;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2446;
    float _2494 = _2468;
    float _2496 = _2470;
    float _2498 = _2472;
    float _2500 = _2474;
    if (_2480)
    {
        float _2502 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2502;
    }
    float _2504 = _2486;
    if (_2480)
    {
        float _2506 = rsqrt(_2476);
        _2488 = _2506;
    }
    float _2508 = _2488;
    if (_2480)
    {
        float _2510 = _2484 * _2504;
        _2490 = _2510;
    }
    float _2512 = _2490;
    if (_2480)
    {
        float _2514 = _2512 * 0.15915493667125701904296875;
        _2378 = _2514;
    }
    float _2516 = _2378;
    float _2518 = _793;
    if (_2480)
    {
        float _2520 = _2516 * 6.283185482025146484375;
        float _2522 = sin(_2520);
        _2518 = _2522;
    }
    float _2524 = _2518;
    float _2526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2528 = precise::max(0.0, _2526);
    float _2530 = _2504;
    float _2532 = _2528;
    if (_2480)
    {
        float _2534 = _2516 * 6.283185482025146484375;
        float _2536 = cos(_2534);
        _2530 = _2536;
    }
    float _2538 = _2530;
    float _2540 = -_2466;
    float _2542 = -_2528;
    float _2544 = fma(_2446, _2540, _2542);
    if (_2480)
    {
        float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2492 = _2546;
    }
    float _2548 = _2492;
    float _2550 = _2548;
    float _2552 = _2524;
    if (_2480)
    {
        float _2554 = fma(_2524, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = _2556;
    if (_2480)
    {
        float _2560 = _2538 + (-1.0);
        _2532 = _2560;
    }
    float _2562 = _2532;
    float _2564 = _2562;
    if (_2480)
    {
        float _2566 = _2508 * _2556;
        _2552 = _2566;
    }
    float _2568 = _2552;
    if (!_2480)
    {
        _2558 = _2544;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (_2480)
    {
        float _2574 = _2562 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2574;
    }
    float _2576 = _2564;
    if (_2480)
    {
        float _2578 = _2468 * _2568;
        _2494 = _2578;
    }
    float _2580 = _2494;
    if (_2480)
    {
        float _2582 = _2470 * _2568;
        _2496 = _2582;
    }
    float _2584 = _2496;
    if (_2480)
    {
        float _2586 = fma(_2544, _2538, _2576);
        _2572 = _2586;
    }
    float _2588 = _2572;
    if (_2480)
    {
        float _2590 = _2580 * _2580;
        _2498 = _2590;
    }
    float _2592 = _2498;
    if (_2480)
    {
        float _2594 = _2584 * _2584;
        _2500 = _2594;
    }
    float _2596 = _2500;
    float _2598 = fma(_2588, _2588, _2592);
    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2602 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2600);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = _2598 + _2596;
    float _2608 = -_2604;
    float _2610 = _2608 + 1.0;
    float _2612 = rsqrt(_2606);
    float _2614 = abs(_2610);
    float _2616 = log2(_2614);
    float _2618 = _2612 * _2580;
    float _2620 = _2612 * _2588;
    float _2622 = _2612 * _2584;
    float _2624 = _2618 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2626 = -_2624;
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2626);
    float _2630 = -_2622;
    float _2632 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2628);
    float _2634 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2636 = fma(_2632, -0.5, 0.5);
    float _2638 = exp2(_2634);
    float _2640 = fma(_2632, 0.5, 0.5);
    float _2642 = fma(_2640, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2644 = sqrt(_2636);
    float _2646 = fma(_2640, _2642, -0.212114393711090087890625);
    float _2648 = _2620 + 1.0;
    float _2650 = fma(_2640, _2646, 1.570728778839111328125);
    float _2652 = -_2620;
    float _2654 = fma(_2638, _2648, _2652);
    float _2656 = fma(_2654, 0.5, 0.5);
    float _2658 = _2644 * 0.636619746685028076171875;
    float _2660 = -_2650;
    float _2662 = fma(_2658, _2660, 1.0);
    float2 _7461 = float2(_2662, _2656);
    float3 _2666 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7461, float2(0.0), isnan(_7461)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7461, float2(0.0), isnan(_7461)), level(0.0)).xyz;
    float _2668 = _2666.x;
    float _2670 = _2666.y;
    float _2672 = _2666.z;
    float _2674 = in.m_89.x;
    float _2676 = in.m_89.y;
    float _2678 = abs(_1635);
    float _2680 = log2(_2678);
    bool _2682 = _1603 != 0.0;
    bool _2684 = isnan(_1603);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = _1683 * _1793;
    float _2694 = in.m_89.z;
    float _2696 = _1683 * _1963;
    bool _2698 = _1543 == 0.0;
    bool _2700 = !_2690;
    bool _2702 = _2698 && _2700;
    float _2704 = in.m_91.x;
    float _2706 = in.m_91.y;
    float _2708 = in.m_91.z;
    float _2710 = in.m_91.w;
    float _2712 = _1683 * _1783;
    bool _2714 = _1485 == 0.0;
    bool _2716 = _2714 && _2702;
    float _2718 = -_1565;
    float _2720 = fma(_2718, _1749, _2692);
    float _2722 = -_1565;
    float _2724 = fma(_2722, _1753, _2696);
    float _2726 = -_1565;
    float _2728 = fma(_2726, _1755, _2712);
    float _2730 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2732 = _1635 <= 8000.0;
    bool _2734 = isnan(_1635);
    bool _2736 = _2732 || _2734;
    bool _2738 = isnan(8000.0);
    bool _2740 = _2736 || _2738;
    float _2742 = float(_2740);
    float _2744 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2746 = fma(_1687, _1617, _2724);
    float _2748 = -_835;
    float _2750 = _2748 + 1.0;
    float _2752 = exp2(_2730);
    float _2754 = _1479 * _2676;
    float _2756 = _1463 * _2676;
    float _2758 = fma(_1463, _2674, _2754);
    float _2760 = exp2(_2744);
    float _2762 = _2754;
    float _2764 = _2676;
    float _2766 = _2674;
    if (_2716)
    {
        _2762 = _2694;
    }
    float _2768 = _2762;
    float _2770 = -_2756;
    float _2772 = fma(_1479, _2674, _2770);
    float _2774 = _2758 * _2704;
    float _2776 = _2768;
    if (_2716)
    {
        _2764 = _2758;
    }
    float _2778 = _2764;
    float _2780 = _2778;
    if (!_2716)
    {
        float _2782 = fma(_1603, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2758);
        _2780 = _2782;
    }
    float _2784 = _2780;
    if (_2716)
    {
        _1693 = _2768;
    }
    float _2786 = _1693;
    float _2788 = _1579 * _1793;
    float _2790 = _2786;
    if (!_2716)
    {
        _2776 = _2694;
    }
    float _2792 = _2776;
    float _2794 = -_2774;
    float _2796 = fma(_2772, _2706, _2794);
    if (_2716)
    {
        _2766 = _2772;
    }
    float _2798 = _2766;
    float _2800 = _2798;
    if (!_2716)
    {
        float _2802 = fma(_1543, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2772);
        _2800 = _2802;
    }
    float _2804 = _2800;
    float _2806 = _2772 * _2708;
    float _2808 = _2706 * _2792;
    float _2810 = _1579 * _1783;
    float _2812 = _1591 * _1783;
    float _2814 = fma(_2760, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = -_2808;
    float _2820 = fma(_2758, _2708, _2818);
    float _2822 = fma(_1711, _1749, _2788);
    if (!_2716)
    {
        float _2824 = fma(_1485, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2792);
        _2790 = _2824;
    }
    float _2826 = _2790;
    float _2828 = fma(_2816, -2.0, 3.0);
    float _2830 = _2816 * _2816;
    float _2832 = _1579 * _1963;
    float _2834 = _1591 * _1793;
    float _2836 = _1591 * _1963;
    float _2838 = -_2806;
    float _2840 = fma(_2704, _2792, _2838);
    float _2842 = fma(_1711, _1753, _2832);
    float _2844 = fma(_1717, _1749, _2834);
    float _2846 = fma(_1711, _1755, _2810);
    float _2848 = fma(_1687, _1611, _2720);
    float _2850 = fma(_1717, _1753, _2836);
    float _2852 = fma(_1717, _1755, _2812);
    float _2854 = fma(_1587, _1617, _2842);
    float _2856 = fma(_1687, _1615, _2728);
    float _2858 = fma(_1581, _1611, _2844);
    float _2860 = fma(_1587, _1611, _2822);
    float _2862 = _2848 * _2706;
    float _2864 = fma(_1581, _1617, _2850);
    float _2866 = _2840 * _2710;
    float _2868 = fma(_1581, _1615, _2852);
    float _2870 = fma(_1587, _1615, _2846);
    float _2872 = _2746 * _2706;
    float _2874 = _2856 * _2706;
    float _2876 = fma(_2860, _2704, _2862);
    float _2878 = _2848 * _2784;
    float _2880 = _2746 * _2784;
    float _2882 = _2856 * _2784;
    float _2884 = _2866 * _2848;
    float _2886 = _2866 * _2746;
    float _2888 = _2866 * _2856;
    float _2890 = fma(_2854, _2704, _2872);
    float _2892 = fma(_2870, _2704, _2874);
    float _2894 = _2796 * _2710;
    float _2896 = fma(_2858, _2708, _2876);
    float _2898 = _2820 * _2710;
    float _2900 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2902 = fma(_2860, _2804, _2878);
    float _2904 = _2830 * _2828;
    float _2906 = fma(_2898, _2860, _2884);
    float _2908 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2900);
    float _2910 = fma(_2898, _2854, _2886);
    float _2912 = fma(_2898, _2870, _2888);
    float _2914 = fma(_2870, _2804, _2882);
    float _2916 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2908);
    float _2918 = fma(_2864, _2708, _2890);
    float _2920 = fma(_2854, _2804, _2880);
    float _2922 = fma(_2868, _2708, _2892);
    float _2924 = fma(_2894, _2868, _2912);
    float _2926 = fma(_2868, _2826, _2914);
    float _2928 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2916);
    float _2930 = -_2904;
    float _2932 = _2930 + 1.0;
    float _2934 = fma(_2858, _2826, _2902);
    float _2936 = fma(_2864, _2826, _2920);
    float _2938 = _2928 + _2255;
    float _2940 = fma(_2932, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2904);
    float _2942 = -_2752;
    float _2944 = _2942 + 1.0;
    float _2946 = fma(_2894, _2858, _2906);
    float _2948 = _2938 * 0.5;
    float _2950 = _2742 * _2940;
    float _2952 = _2938;
    float _2954 = _2948;
    if (!_2245)
    {
        _2952 = 1.0;
    }
    float _2956 = _2952;
    float _2958 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2960 = _2956;
    if (_2245)
    {
        bool _2962 = _2353 >= _2317;
        bool _2964 = isnan(_2353);
        bool _2966 = _2962 || _2964;
        bool _2968 = isnan(_2317);
        bool _2970 = _2966 || _2968;
        float _2972 = float(_2970);
        _2960 = _2972;
    }
    float _2974 = _2960;
    float _2976 = _2950 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2978 = fma(_2894, _2864, _2910);
    float _2980 = _2958 * _2355;
    float _2982 = -_2958;
    float _2984 = _2982 + 1.0;
    float _2986 = _2750 * _2976;
    float _2988 = precise::clamp(_2986, 0.0, 1.0);
    float _2990 = _2974 * _2442;
    float _2992 = _2366 * _2980;
    float _2994 = -_2988;
    float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2998 = _2366 * _2984;
    out.m_93.x = _2896;
    out.m_93.y = _2918;
    out.m_93.z = _2922;
    bool _3000 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3002 = isnan(_2464);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3008 = _3004 || _3006;
    float _3010 = -_2990;
    float _3012 = fma(_3010, _2996, 1.0);
    float _3014 = precise::clamp(_3012, 0.0, 1.0);
    out.m_95.x = _2946;
    out.m_95.y = _2978;
    out.m_95.z = _2924;
    float _3016 = _3014 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _2295;
    out.gl_Position.y = _2299;
    out.gl_Position.z = _2928;
    out.gl_Position.w = _2255;
    out.m_97.x = _3016;
    float _3018 = _2990;
    float _3020 = _2984;
    float _3022 = _3014;
    float _3024 = _2255;
    if (!_3008)
    {
        _3018 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3026 = _3018;
    out.m_99.x = _2934;
    out.m_99.y = _2936;
    out.m_99.z = _2926;
    float _3028 = _3026;
    float _3030 = _3026;
    if (!_3008)
    {
        _3020 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3032 = _3020;
    float _3034 = _3032;
    float _3036 = _3032;
    if (!_3008)
    {
        _3022 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3038 = _3022;
    out.m_101.z = _2948;
    out.m_101.w = _2255;
    float _3040 = _3038;
    float _3042 = _3038;
    if (!_3008)
    {
        _1239 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3044 = _1239;
    float _3046 = _3044;
    float _3048 = _3044;
    if (!_3008)
    {
        _3024 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3050 = _3024;
    float _3052 = _3050;
    float _3054 = _3050;
    if (!_3008)
    {
        _2954 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3056 = _2954;
    float _3058 = _2672 * _2980;
    float _3060 = fma(_2668, _2992, _2360);
    float _3062 = fma(_2670, _2992, _2362);
    float _3064 = fma(_2366, _3058, _2364);
    out.m_103.x = _3060;
    out.m_103.y = _3062;
    out.m_103.z = _3064;
    out.m_103.w = _2998;
    bool _3066 = !_3008;
    float _3068 = _3056;
    float _3070 = _3056;
    if (!_3066)
    {
        bool _3072 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3074 = isnan(_2464);
        bool _3076 = _3072 || _3074;
        bool _3078 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3080 = _3076 || _3078;
        if (!_3080)
        {
            float _3082 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3084 = _2464 + _3082;
            float _3086 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3088 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3086;
            float _3090 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3092 = _3090 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3094 = 1.0 / _3088;
            float _3096 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3098 = _3096 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3102 = _3100 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3104 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3106 = _3104 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3108 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3110 = _3108 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3112 = _3084 * _3094;
            float _3114 = precise::clamp(_3112, 0.0, 1.0);
            float _3116 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3118 = _3116 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3120 = fma(_3114, _3092, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3122 = fma(_3114, _3118, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3124 = fma(_3114, _3098, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3126 = fma(_3114, _3102, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3128 = fma(_3114, _3106, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3130 = fma(_3114, _3110, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3030 = _3124;
            _3042 = _3128;
            _3054 = _3120;
            _3036 = _3126;
            _3070 = _3122;
            _3048 = _3130;
            _3132 = true;
        }
        else
        {
            bool _3134 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3136 = isnan(_2464);
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
                bool _3158 = _2464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3160 = isnan(_2464);
                bool _3162 = _3158 || _3160;
                bool _3164 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3166 = _3162 || _3164;
                if (!_3166)
                {
                    float _3168 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3170 = _2464 + _3168;
                    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3174 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3172;
                    float _3176 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3178 = _3176 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3180 = 1.0 / _3174;
                    float _3182 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3184 = _3182 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3186 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3188 = _3186 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3190 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3192 = _3190 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3194 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3196 = _3194 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3198 = _3170 * _3180;
                    float _3200 = precise::clamp(_3198, 0.0, 1.0);
                    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3204 = _3202 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3206 = fma(_3200, _3178, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3208 = fma(_3200, _3204, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3210 = fma(_3200, _3184, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3212 = fma(_3200, _3188, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3214 = fma(_3200, _3192, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3216 = fma(_3200, _3196, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3030 = _3210;
                    _3042 = _3214;
                    _3054 = _3206;
                    _3036 = _3212;
                    _3070 = _3208;
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
    float _3230 = fma(_2936, -0.5, 0.5);
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
    out.m_105.x = 0.0;
    float _3256 = fma(_3250, 0.298911988735198974609375, _3254);
    float _3258 = fma(_3252, 0.114477999508380889892578125, _3256);
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
    out.m_59.x = _3272;
    out.m_107.x = _3274;
    out.m_107.y = _3276;
    out.m_107.z = _3278;
    if (!_3246)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3280 = -_2151;
    float _3282 = _3280 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3284 = -_2153;
    float _3286 = _3284 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3288 = -_2155;
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
    float _3322 = _2936 * _3312;
    float _3324 = -_3312;
    float _3326 = -_3320;
    float _3328 = fma(_3324, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3326);
    float _3330 = fma(_2934, _3310, _3322);
    float _3332 = -_3318;
    float _3334 = fma(_3332, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3328);
    float _3336 = fma(_2926, _3318, _3330);
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

