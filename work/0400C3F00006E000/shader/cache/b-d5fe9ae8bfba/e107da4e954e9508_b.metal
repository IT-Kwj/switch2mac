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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_80 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_98 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_88 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_96 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_92 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
    float4 m_70 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4063 = false;
    bool _901 = false;
    bool _733 = false;
    bool _515 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_133);
        out.gl_Position.z = _4295;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_117);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    int _167 = 0;
    if (_163)
    {
        float _169 = _165 * 5.0;
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4364 = as_type<float>(_171);
        out.gl_Position.z = _4364;
    }
    if (_163)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_66.x;
    float _177 = in.m_66.y;
    float _179 = in.m_66.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    float _235;
    if (!_217)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_117);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_70.x;
    float _351 = in.m_70.y;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _371 = _347 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _381 = 1.0 / _375;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _379;
    float _387 = _317 * _351;
    bool _389 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_347);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_347);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _355 * _381;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _423;
    float _427 = _315 * _349;
    float _429 = _415 * _403;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _441 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _443 = _399 * _433;
    float _445 = fma(_437, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _447 = _371 * _385;
    float _449 = -_399;
    float _451 = _449 + 1.0;
    float _453 = _439 * _443;
    float _455 = _445 * _443;
    float _457 = _441 * _443;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _455);
    float _473 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _475 = fma(_465, _447, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _477 = fma(_469, _447, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _453);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _457);
    float _483 = fma(_473, _429, _471);
    float _485 = fma(_475, _429, _479);
    float _487 = fma(_477, _429, _481);
    float _489 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].x, _483);
    float _491 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].y, _485);
    float _493 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].z, _487);
    bool _495 = !_383;
    float _513;
    if (!_495)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_117);
        float _519 = 1.0 / _517;
        float _521 = _149 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    bool _541 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _543 = isnan(_523);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _563 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_523);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _535;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = _539 * _553;
    bool _593 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_523);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _557;
    float _607 = -_551;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _527, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _613;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = _603 * _609;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = -_585;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _561;
    float _633 = _573 * _619;
    float _635 = _625 * _587;
    float _637 = -_573;
    float _639 = _637 + 1.0;
    float _641 = _551 * _629;
    float _643 = _611 * _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _523 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _651 = _523 + _649;
    float _653 = _615 * _605;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _671 = fma(_635, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _675 = fma(_653, _651, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _677 = -_665;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _523 + _681;
    float _685 = _669 * _631;
    float _687 = fma(_671, _621, _673);
    float _689 = _585 * _679;
    float _691 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = fma(_685, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _695 = fma(_675, _641, _687);
    float _697 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_693, _689, _695);
    float _703 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _699;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _711;
    bool _713 = !_589;
    float _731;
    if (!_713)
    {
        float _715 = in.m_68.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_117);
        float _737 = 1.0 / _735;
        float _739 = _149 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _761 = _741 + _759;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_741);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_757;
    float _797 = _795 + 1.0;
    float _799 = 1.0 / _777;
    float _801 = _793 * _797;
    float _803 = -_793;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _807;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = 1.0 / _781;
    float _815 = _773 * _805;
    float _817 = -_773;
    float _819 = _817 + 1.0;
    float _821 = _745 * _799;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _827;
    float _831 = fma(_809, _821, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _833 = fma(_825, _821, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = fma(_829, _821, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _761 * _813;
    float _839 = _831 * _815;
    float _841 = _833 * _815;
    float _843 = _835 * _815;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _859 = fma(_847, _837, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _861 = fma(_851, _837, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _865 = fma(_855, _837, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _867 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _843);
    float _869 = fma(_859, _801, _857);
    float _871 = fma(_861, _801, _863);
    float _873 = fma(_865, _801, _867);
    float _875 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].x, _869);
    float _877 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].y, _871);
    float _879 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].z, _873);
    bool _881 = !_811;
    float _899;
    if (!_881)
    {
        float _883 = in.m_68.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_117);
        float _905 = 1.0 / _903;
        float _907 = _149 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = in.m_56.x;
    float _913 = in.m_56.y;
    float _915 = in.m_56.z;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = _913 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[6].x, _919);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[4].z, _921);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _929 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _933 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _937 = floor(_933);
    float _939 = floor(_935);
    float _941 = -_937;
    float _943 = _933 + _941;
    float _945 = -_939;
    float _947 = _935 + _945;
    float2 _5630 = float2(_943, _947);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5630, float2(0.0), isnan(_5630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5630, float2(0.0), isnan(_5630)), level(0.0)).x;
    float _951 = in.m_68.x;
    float _953 = in.m_68.y;
    float _955 = in.m_68.z;
    float _957 = in.m_68.w;
    float _959 = _913 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _963 = log2(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _973 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _975 = float(_117);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _981 = int(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _987 = as_type<int>(_911);
    float _989 = _969;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_967)
    {
        _987 = 0;
    }
    int _993 = _987;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _997 = _993;
    if (!_967)
    {
        _997 = 1;
    }
    int _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1003 = 1.0 / _975;
    float _1005 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1007 = _953 * 2.0;
    float _1009 = _951 * 2.0;
    float _1011 = _955 * 2.0;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1015 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = floor(_1007);
    float _1019 = -_977;
    float _1021 = fma(_1013, 2.0, _1019);
    float _1023 = fma(_1015, -2.0, _971);
    float _1025 = -_149;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    float _1029 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1031 = floor(_1009);
    float _1033 = _951 + (-0.5);
    float _1035 = _1003 * _149;
    float _1037 = floor(_1011);
    bool _1039 = _1017 > 0.0;
    float _1041 = _951 + _953;
    bool _1043 = _1017 >= 0.0;
    bool _1045 = isnan(_1017);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = _999 != 1;
    float _1055 = _1041 + (-1.0);
    bool _1057 = _1031 >= 0.0;
    bool _1059 = isnan(_1031);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1069 = int(_1067);
    bool _1071 = _1031 > 0.0;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1075 = _1051 ? 0 : 1;
    float _1077 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1079 = _1037 >= 0.0;
    bool _1081 = isnan(_1037);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = _1037 > 0.0;
    int _1091 = ~_1075;
    int _1093 = _1091 + 1;
    int _1095 = _1093 + 1;
    int _1097 = _1095;
    float _1099 = _1077;
    int _1101 = 2;
    if (!_1039)
    {
        int _1103 = ~_1075;
        int _1105 = _1103 + 1;
        _1097 = _1105;
    }
    int _1107 = _1097;
    int _1109 = _1087 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1121 = _1119 != 0;
    if (!_1053)
    {
        _989 = _953;
    }
    float _1123 = _989;
    float _1125 = _1123;
    if (_1053)
    {
        _1125 = _951;
    }
    float _1127 = _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1131 = !_1117;
    int _1133 = _1131 ? 0 : 1;
    bool _1135 = !_1113;
    int _1137 = _1135 ? 0 : 1;
    bool _1139 = !_1121;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1153 = _1151 != 0;
    int _1155 = ~as_type<int>(_1077);
    int _1157 = _1155 + 1;
    int _1159 = _1157 + 1;
    int _1161 = _1159;
    float _1163 = _1127;
    if (!_1071)
    {
        int _1165 = ~as_type<int>(_1077);
        int _1167 = _1165 + 1;
        _1161 = _1167;
    }
    int _1169 = _1161;
    int _1171 = ~_1109;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1053)
    {
        _1099 = _955;
    }
    float _1179 = _1099;
    float _1181 = _1179;
    if (!_1089)
    {
        int _1183 = ~_1109;
        int _1185 = _1183 + 1;
        _1177 = _1185;
    }
    int _1187 = _1177;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    if (_1053)
    {
        _1181 = _953;
    }
    float _1191 = _1181;
    bool _1193 = !_1149;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    bool _1199 = !_1145;
    int _1201 = _1199 ? 0 : 1;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].w, _995);
    float _1205 = _1191;
    if (!_1053)
    {
        _1163 = _953;
    }
    float _1207 = _1163;
    int _1209 = abs(_1195);
    float _1211 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    int _1213 = abs(_1201);
    float _1215 = _1207;
    if (!_1053)
    {
        _1205 = _955;
    }
    float _1217 = _1205;
    float _1219 = _1217;
    if (_1053)
    {
        _1215 = _951;
    }
    float _1221 = _1215;
    if (_1053)
    {
        _1219 = _953;
    }
    float _1223 = _1219;
    float _1225 = float(_1069);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1229 = float(_1169);
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1225;
    float _1237 = float(_1213);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = float(_1187);
    float _1243 = -_1001;
    float _1245 = fma(_1227, 2.0, _1243);
    float _1247 = float(_981);
    float _1249 = fma(_1231, -2.0, _1239);
    float _1251 = _1237 * _1241;
    float _1253 = _1233 * _1229;
    float _1255 = _963 * _149;
    float _1257 = in.m_74.x;
    float _1259 = in.m_74.y;
    float _1261 = in.m_74.z;
    float _1263 = 1.0 / _1247;
    float _1265 = _1251 * (-2.0);
    float _1267 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1269 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1271 = isnan(1.0);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1277 = _1273 || _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1281 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1283 = isnan(0.0);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1289 = _1285 || _1287;
    float _1291 = exp2(_1255);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1295 = 1.0 + _1293;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1299 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1301 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1303 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1267);
    float _1305 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1297);
    float _1307 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1299);
    float _1309 = 1.0 / _1295;
    float _1311 = _1235 * _149;
    float _1313 = _1263 * _149;
    float _1315 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1301);
    float _1317 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1319 = -_149;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1245);
    float _1323 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1249);
    float _1325 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    float _1331 = fma(_1265, _1257, _1257);
    bool _1333 = !_1153;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(_1073, _1265, _1073);
    float _1339 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1341 = _1289 ? _1329 : 0.0;
    float _1343 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1331);
    int _1345 = abs(_1335);
    float _1347 = _955 + _953;
    float _1349 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1351 = 1.0;
    if (_1277)
    {
        float _1353 = _1341 * _1309;
        _153 = _1353;
    }
    float _1355 = _153;
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1359 = _1347 + (-1.0);
    float _1361 = fma(_1337, _1355, _1343);
    float _1363 = float(_1107);
    float _1365 = _1253 * (-2.0);
    float _1367 = float(_1345);
    float _1369 = _1357 + _1349;
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1373 = 1.0 / _1349;
    float _1375 = fma(_1365, _1259, _1259);
    float _1377 = _1367 * _1363;
    float _1379 = _953 + (-0.5);
    float _1381 = _955 + _951;
    float _1383 = fma(_1371, _1365, _1371);
    float _1385 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    float _1387 = _1381 + (-1.0);
    float _1389 = _1377 * (-2.0);
    float _1391 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1393 = fma(_1383, _1355, _1385);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1397 = fma(_1389, _1261, _1261);
    float _1399 = _955 + (-0.5);
    float _1401 = _1393 * 0.15915493667125701904296875;
    float _1403 = fma(_1395, _1389, _1395);
    float _1405 = _1369 * _1373;
    float _1407 = _1405 * 0.5;
    float _1409 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1397);
    float _1411 = _1401 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = fma(_1403, _1355, _1409);
    float _1423 = _1361 * 0.15915493667125701904296875;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1427 = _985 * _1415;
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1005 * _1425;
    float _1437 = _983 + _1391;
    float _1439 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1441 = _1401 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1439);
    float _1447 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1445);
    float _1449 = _1423 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = _1433 * _1413;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1457 = _1429 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1433 * _1443;
    float _1463 = 1.0 / _1419;
    float _1465 = _1451 * _1443;
    float _1467 = _1451 * _1413;
    float _1469 = _1429 * 6.283185482025146484375;
    float _1471 = sin(_1469);
    float _1473 = _1433 * _1459;
    float _1475 = _1451 * _1459;
    float _1477 = _1413 * _1459;
    float _1479 = _1443 * _1459;
    float _1481 = _1473 * _1427;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1485 = _1463 * _1483;
    float _1487 = _1475 * _1427;
    float _1489 = trunc(_1455);
    int _1491 = int(_1489);
    bool _1493 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1495 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1497 = fma(_1471, _1453, _1465);
    float _1499 = -_1461;
    float _1501 = fma(_1471, _1467, _1499);
    float _1503 = -_1467;
    float _1505 = fma(_1471, _1461, _1503);
    float _1507 = fma(_1471, _1465, _1453);
    float _1509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = -_1427;
    float _1513 = _1471 * _1511;
    float _1515 = fma(_1497, _1435, _1481);
    float _1517 = fma(_1501, _1435, _1487);
    float _1519 = fma(_1477, _1435, _1513);
    float _1521 = fma(_1505, _1509, _1515);
    float _1523 = fma(_1507, _1509, _1517);
    float _1525 = _1437;
    if (!_1493)
    {
        _1101 = 1;
    }
    int _1527 = _1101;
    float _1529 = fma(_1479, _1509, _1519);
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1533 = !_1493;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1531);
    int _1543 = _1527;
    if (!_1495)
    {
        _1543 = _1535;
    }
    int _1545 = _1543;
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1539);
    float _1551 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1541);
    int _1553 = _1545 << 6;
    float _1555 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1547);
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1567 = _1565 != 0;
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1571 = _1569 != 0;
    float _1573 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1575 = _1553 + 56;
    uint _1578 = uint(int(uint(_1575) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1596 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    float _1598 = _931 + _1573;
    bool _1600 = !_1563;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _929 + _1594;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1598 + _1608;
    int _1612 = _1553 + 48;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1604 + _1630;
    float _1634 = _983 + _1606;
    float _1636 = _1610 * _1610;
    bool _1638 = !_1559;
    int _1640 = _1638 ? 0 : 1;
    bool _1642 = !_1567;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = fma(_1632, _1632, _1636);
    int _1648 = _1553 + 64;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    uint _1652 = uint(int(uint(int(_1650)) >> uint(2)));
    int _1654 = int(_1650) & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = int(_1650) + 1;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    int _1662 = _1658 & 3;
    float _1664 = (*spvDescriptorSet0.vp_c15)._m0[int(_1660)][_1662];
    float _1666 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1668 = !_1571;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = sqrt(_1646);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1491 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1666);
    int _1682 = _1553 + 72;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    uint _1686 = uint(int(uint(int(_1684)) >> uint(2)));
    int _1688 = int(_1684) & 3;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[int(_1686)][_1688];
    int _1692 = int(_1684) + 1;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    int _1696 = _1692 & 3;
    float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
    float _1700 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1680);
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1704 = _1553 + 96;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = trunc(_1702);
    int _1724 = int(_1722);
    bool _1726 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1728 = _1553 + 104;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    float _1746 = _1606;
    float _1748 = _1598;
    float _1750 = _1604;
    int _1752 = _1678;
    float _1754 = as_type<float>(_1545);
    if (!_1726)
    {
        _1746 = _1598;
    }
    float _1756 = _1746;
    int _1758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1760 = _1724 + _1758;
    int _1762 = _1760 + 1;
    float _1764 = _1756;
    int _1766 = as_type<int>(_1584);
    if (!_1726)
    {
        _1748 = _1634;
    }
    float _1768 = _1748;
    bool _1770 = !_1726;
    float _1772 = _1768;
    int _1774 = as_type<int>(_1628);
    int _1776 = as_type<int>(_1690);
    if (!_1770)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1782 = _1672 + _1780;
        float _1784 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = rsqrt(_1646);
        float _1788 = _1782 * _1778;
        float _1790 = _1788 * 0.15915493667125701904296875;
        float _1792 = _1790 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = fma(_1794, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1802 = _1786 * _1800;
        float _1804 = _1798 + (-1.0);
        float _1806 = fma(_1632, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1610, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = fma(_1634, _1798, _1810);
        _1772 = _1812;
        _1750 = _1806;
        _1764 = _1808;
    }
    float _1814 = _1772;
    float _1816 = _1750;
    float _1818 = _1764;
    float _1820 = -_983;
    float _1822 = _1820 + _1814;
    bool _1824 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1826 = _1553 + 80;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    int _1844 = _1678 | _1762;
    float _1846 = -_929;
    float _1848 = _1846 + _1816;
    float _1850 = _1822 * _1822;
    float _1852 = _1437 * _1720;
    bool _1854 = _1844 < 0;
    bool _1856 = _1854 || _1824;
    float _1858 = -_931;
    float _1860 = _1858 + _1818;
    float _1862 = fma(_1848, _1848, _1850);
    float _1864 = fma(_929, _1712, _1852);
    bool _1866 = _1762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1868 = _1866 || _1856;
    float _1870 = _1437 * _1628;
    float _1872 = fma(_1860, _1860, _1862);
    float _1874 = fma(_931, _1736, _1864);
    float _1876 = _1437 * _1664;
    float _1878 = fma(_929, _1620, _1870);
    float _1880 = sqrt(_1872);
    float _1882 = _1874 + _1744;
    float _1884 = fma(_929, _1656, _1876);
    float _1886 = fma(_931, _1584, _1878);
    bool _1888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1890 = isnan(0.5);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    float _1898 = fma(_931, _1690, _1884);
    int _1900 = as_type<int>(_1876);
    float _1902 = _1816;
    float _1904 = _1814;
    float _1906 = _1818;
    float _1908 = _1886;
    float _1910 = _1822;
    if (!_1868)
    {
        int _1912 = _1762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1914 = _1912 + _1678;
        _1752 = _1914;
    }
    int _1916 = _1752;
    float _1918 = _1850;
    if (!_1868)
    {
        float _1920 = floor(_1455);
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = _1886 + _1592;
    float _1926 = _1898 + _1698;
    if (!_1868)
    {
        int _1928 = _1916 << 2;
        _1900 = _1928;
    }
    int _1930 = _1900;
    if (!_1868)
    {
        uint _1932 = uint(int(uint(_1916) >> uint(2)));
        _1774 = int(_1932);
    }
    int _1934 = _1774;
    bool _1936 = _1880 > 0.0;
    float _1938 = 1.0 / _1882;
    float _1940 = as_type<float>(_1934);
    if (!_1868)
    {
        int _1942 = 12 & _1930;
        _1766 = _1942;
    }
    int _1944 = _1766;
    if (!_1868)
    {
        int _1946 = _1934 << 4;
        int _1948 = _1946 + _1944;
        _1776 = _1948;
    }
    int _1950 = _1776;
    bool _1952 = !_1936;
    if (!_1952)
    {
        float _1954 = _213 * _213;
        float _1956 = rsqrt(_1872);
        float _1958 = fma(_211, _211, _1954);
        float _1960 = fma(_215, _215, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = _1848 * _1956;
        float _1966 = _1822 * _1956;
        float _1968 = _1860 * _1956;
        bool _1970 = _1962 > 0.0;
        bool _1972 = !_1970;
        _1940 = _1962;
        _1908 = _1960;
        _1910 = _1966;
        if (!_1972)
        {
            float _1974 = rsqrt(_1960);
            float _1976 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1978 = _213 * _1974;
            float _1980 = _211 * _1974;
            float _1982 = _1966 * _1978;
            float _1984 = _215 * _1974;
            float _1986 = fma(_1964, _1980, _1982);
            float _1988 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1990 = fma(_1968, _1984, _1986);
            float _1992 = _1990 * _1988;
            float _1994 = fma(_211, _1992, _1816);
            float _1996 = fma(_213, _1992, _1814);
            float _1998 = fma(_215, _1992, _1818);
            _1902 = _1994;
            _1904 = _1996;
            _1906 = _1998;
            _1940 = _1992;
            _1908 = _1974;
        }
    }
    float _2000 = _1902;
    float _2002 = _1904;
    float _2004 = _1906;
    float _2006 = _1940;
    float _2008 = _1908;
    float _2010 = _1910;
    float _2012 = _2008;
    float _2014 = _2006;
    float _2016 = _2004;
    if (_1896)
    {
        _2012 = _2000;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1896)
    {
        _2014 = _2002;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (!_1896)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2028 = _983 + _2026;
        float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2032 = _929 + _2030;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2036 = -_983;
        float _2038 = _2036 + _2002;
        float _2040 = _2028 * _2028;
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2044 = _931 + _2042;
        float _2046 = -_931;
        float _2048 = _2046 + _2004;
        float _2050 = fma(_2032, _2032, _2040);
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2054 = fma(_2044, _2044, _2050);
        float _2056 = sqrt(_2054);
        float _2058 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2060 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2062 = _2060 * _2052;
        float _2064 = _2058 * _2062;
        float _2066 = -_929;
        float _2068 = _2066 + _2000;
        float _2070 = fma(_2038, _2064, _983);
        float _2072 = fma(_2068, _2064, _929);
        float _2074 = fma(_2048, _2064, _931);
        _2024 = _2070;
        _2020 = _2072;
        _2016 = _2074;
    }
    float _2076 = _2024;
    float _2078 = _2020;
    float _2080 = _2016;
    int _2082 = _1553 + 88;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    uint _2086 = uint(int(uint(int(_2084)) >> uint(2)));
    int _2088 = int(_2084) & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    int _2092 = int(_2084) + 1;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    int _2096 = _2092 & 3;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[int(_2094)][_2096];
    float _2100 = _1924 * _1938;
    float _2102 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = _1926 * _1938;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2112 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2114 = _2010;
    if (!_1868)
    {
        int _2116 = _1950 + 400;
        uint _2118 = uint(int(uint(_2116) >> uint(2)));
        uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
        int _2122 = int(_2118) & 3;
        float _2124 = (*spvDescriptorSet0.vp_c15)._m0[int(_2120)][_2122];
        _2114 = _2124;
    }
    float _2126 = _2114;
    bool _2128 = _2100 >= 0.0;
    float _2130 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2110);
    float _2132 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2108);
    float _2134 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2112);
    float _2138 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2140 = _2100 <= 1.0;
    bool _2142 = _2140 && _2128;
    float _2144 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2132);
    float _2146 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2134);
    float _2148 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2154 = _2106 >= 0.0;
    bool _2156 = _2154 && _2142;
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2150);
    float _2162 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2166 = _2106 <= 1.0;
    bool _2168 = _2166 && _2156;
    float _2170 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = _1437 * _1842;
    float _2176 = -_2164;
    float _2178 = fma(_2176, _2162, 1.0);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = fma(_929, _1834, _2174);
    float _2186 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2180);
    float _2190 = 1.0 / _2182;
    float _2192 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2194 = _2184;
    if (_2168)
    {
        float _2196 = float(_1545);
        _1754 = _2196;
    }
    float _2198 = _1754;
    float _2200 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2188);
    float _2202 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = log2(_2178);
    float _2206 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_931, _2090, _2184);
    float _2212 = _1744;
    float _2214 = _2198;
    float _2216 = _2206;
    if (!_1868)
    {
        float _2218 = floor(_1702);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = _2210 + _2098;
    float _2224 = _2208 * _2190;
    float _2226 = _2206 * _2190;
    float _2228 = _2222 * _1938;
    float _2230 = fma(_2226, -0.5, 0.5);
    float _2232 = _2180;
    if (_2168)
    {
        float _2234 = rint(_2198);
        float _2236 = precise::max(_2234, 0.0);
        uint _2238 = uint(_2236);
        uint _2240 = clamp(_2238, 0u, 65535u);
        _2232 = as_type<float>(_2240);
    }
    float _2242 = _2232;
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = _1938;
    float _2250 = _2126;
    if (!_1868)
    {
        float _2252 = rint(_2126);
        float _2254 = precise::max(_2252, 0.0);
        uint _2256 = uint(_2254);
        uint _2258 = clamp(_2256, 0u, 65535u);
        _2248 = as_type<float>(_2258);
    }
    float _2260 = _2248;
    float _2262 = _2220;
    if (!_1868)
    {
        float _2264 = -_2220;
        float _2266 = _1702 + _2264;
        _2194 = _2266;
    }
    float _2268 = _2194;
    float _2270 = fma(_2224, 0.5, 0.5);
    float _2272 = _2268;
    if (!_1868)
    {
        float _2274 = -_1922;
        float _2276 = _1455 + _2274;
        _2262 = _2276;
    }
    float _2278 = _2262;
    float _2280 = _2106;
    if (_2168)
    {
        float3 _7752 = float3(_2100, _2106, float(as_type<int>(_2242)));
        float3 _7756 = select(_7752, float3(0.0), isnan(_7752));
        float _2282 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7756.xy, uint(rint(_7756.z)), _2228, level(0.0));
        _2280 = _2282;
    }
    float _2284 = _2280;
    float3 _7766 = float3(_2270, _2230, _2246);
    float _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7766, float3(0.0), isnan(_7766)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7766, float3(0.0), isnan(_7766)), level(0.0)).x;
    float3 _7775 = float3(_2270, _2230, _2246);
    float4 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7775, float3(0.0), isnan(_7775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7775, float3(0.0), isnan(_7775)), level(0.0)).xyzw;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2289.w;
    float _2299 = _1922;
    if (!_1868)
    {
        float3 _7798 = float3(_2278, _2268, float(as_type<int>(_2260)));
        float3 _7800 = select(_7798, float3(0.0), isnan(_7798));
        float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7800.xy, uint(rint(_7800.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7800.xy, uint(rint(_7800.z)), level(0.0)).x;
        _2299 = _2301;
    }
    float _2303 = _2299;
    if (_1868)
    {
        _2214 = 1.0;
    }
    float _2305 = _2214;
    float _2307 = _2305;
    if (!_1868)
    {
        int _2309 = _1916 << 4;
        int _2311 = _2309 + 2048;
        uint _2313 = uint(int(uint(_2311) >> uint(2)));
        uint _2315 = uint(int(uint(int(_2313)) >> uint(2)));
        int _2317 = int(_2313) & 3;
        float _2319 = (*spvDescriptorSet0.vp_c15)._m0[int(_2315)][_2317];
        int _2321 = int(_2313) + 1;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        int _2325 = _2321 & 3;
        float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
        int _2329 = _2311 + 8;
        uint _2331 = uint(int(uint(_2329) >> uint(2)));
        uint _2333 = uint(int(uint(int(_2331)) >> uint(2)));
        int _2335 = int(_2331) & 3;
        float _2337 = (*spvDescriptorSet0.vp_c15)._m0[int(_2333)][_2335];
        int _2339 = int(_2331) + 1;
        uint _2341 = uint(int(uint(_2339) >> uint(2)));
        int _2343 = _2339 & 3;
        float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
        float _2347 = _1437 * _2327;
        float _2349 = fma(_929, _2319, _2347);
        float _2351 = fma(_931, _2337, _2349);
        float _2353 = _2351 + _2345;
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -_2355;
        float _2359 = _2357 + _2303;
        float _2361 = fma(_2359, 500.0, 1.5);
        float _2363 = exp2(_2361);
        float _2365 = 0.0 + _2363;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _1525 = _2347;
        _2307 = _2367;
    }
    float _2369 = _1525;
    float _2371 = _2307;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2375 = _2076 + _2373;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2078 + _2377;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2383 = _2080 + _2381;
    float _2385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2387 = int(_2385);
    float _2389 = _2375 * _2375;
    int _2391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2379, _2379, _2389);
    float _2397 = fma(_2383, _2383, _2395);
    float _2399 = rsqrt(_2397);
    float _2401 = _2375;
    if (_2393)
    {
        float _2403 = in.m_68.x;
        _991 = _2403;
    }
    float _2405 = _991;
    float _2407 = _2405;
    if (!_2393)
    {
        float _2409 = in.m_68.y;
        _2407 = _2409;
    }
    float _2411 = _2407;
    float _2413 = sqrt(_2397);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2417 = _2379 * _2415;
    float _2419 = _2383 * _2415;
    float _2421 = _2417 * _2417;
    float _2423 = _2419 * _2419;
    float _2425 = _2421 + _2423;
    float _2427 = sqrt(_2425);
    bool _2429 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2433 = _2427 + _2431;
    float _2435 = _2369;
    float _2437 = _2433;
    float _2439 = _2425;
    float _2441 = _2417;
    float _2443 = _2421;
    float _2445 = _2423;
    if (_2429)
    {
        float _2447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2447;
    }
    float _2449 = _2435;
    if (_2429)
    {
        float _2451 = rsqrt(_2425);
        _2272 = _2451;
    }
    float _2453 = _2272;
    float _2455 = _2453;
    if (_2429)
    {
        float _2457 = _2433 * _2449;
        _2437 = _2457;
    }
    float _2459 = _2437;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2463 = int(_2461);
    if (_2429)
    {
        float _2465 = _2459 * 0.15915493667125701904296875;
        _2250 = _2465;
    }
    float _2467 = _2250;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = _2303;
    if (_2429)
    {
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        _2471 = _2475;
    }
    float _2477 = _2471;
    float _2479 = precise::max(0.0, _2469);
    float _2481 = _929;
    if (_2429)
    {
        float _2483 = _2467 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        _2481 = _2485;
    }
    float _2487 = _2481;
    float _2489 = -_2415;
    float _2491 = -_2479;
    float _2493 = fma(_2375, _2489, _2491);
    float _2495 = float(uint(_2387));
    if (_2429)
    {
        float _2497 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2497;
    }
    float _2499 = _2401;
    float _2501 = 1.0 / _2495;
    float _2503 = _2477;
    float _2505 = _2499;
    if (_2429)
    {
        float _2507 = fma(_2477, _2499, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2503 = _2507;
    }
    float _2509 = _2503;
    float _2511 = float(uint(_2463));
    float _2513 = _2509;
    if (_2429)
    {
        float _2515 = _2453 * _2509;
        _2439 = _2515;
    }
    float _2517 = _2439;
    if (!_2429)
    {
        _2513 = _2493;
    }
    float _2519 = _2513;
    float _2521 = _2519;
    if (_2429)
    {
        float _2523 = _2487 + (-1.0);
        _2505 = _2523;
    }
    float _2525 = _2505;
    float _2527 = _2525;
    if (_2429)
    {
        float _2529 = _2417 * _2517;
        _2441 = _2529;
    }
    float _2531 = _2441;
    if (!_2429)
    {
        _2455 = _2419;
    }
    float _2533 = _2455;
    float _2535 = _2533;
    if (_2429)
    {
        float _2537 = _2419 * _2517;
        _2535 = _2537;
    }
    float _2539 = _2535;
    if (_2429)
    {
        float _2541 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    if (_2429)
    {
        float _2545 = _2531 * _2531;
        _2443 = _2545;
    }
    float _2547 = _2443;
    float _2549 = 1.0 / _2511;
    if (_2429)
    {
        float _2551 = _2539 * _2539;
        _2445 = _2551;
    }
    float _2553 = _2445;
    if (_2429)
    {
        float _2555 = fma(_2493, _2487, _2543);
        _2521 = _2555;
    }
    float _2557 = _2521;
    float _2559 = fma(_2557, _2557, _2547);
    float _2561 = trunc(_1311);
    int _2563 = int(_2561);
    float _2565 = _2559 + _2553;
    float _2567 = rsqrt(_2565);
    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2571 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2569);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    int _2575 = as_type<int>(_2549) + (-2);
    float _2577 = -_2573;
    float _2579 = _2577 + 1.0;
    int _2581 = as_type<int>(_2501) + (-2);
    float _2583 = float(uint(_2563));
    float _2585 = trunc(_1313);
    int _2587 = int(_2585);
    float _2589 = as_type<float>(_2581) * _2583;
    float _2591 = _2567 * _2531;
    float _2593 = abs(_2579);
    float _2595 = log2(_2593);
    float _2597 = _2567 * _2557;
    float _2599 = _2567 * _2539;
    float _2601 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _2603 = ~_2387;
    int _2605 = _2603 + 1;
    float _2607 = -_2601;
    float _2609 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2607);
    float _2611 = trunc(_2589);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    float _2617 = float(uint(_2587));
    float _2619 = -_2599;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2609);
    float _2623 = as_type<float>(_2575) * _2617;
    float _2625 = fma(_2621, -0.5, 0.5);
    float _2627 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = exp2(_2627);
    int _2631 = _2605 * int(_2615);
    int _2633 = _2631 + _2563;
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2597 + 1.0;
    float _2639 = sqrt(_2625);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = float(uint(_2633));
    int _2645 = ~_2463;
    int _2647 = _2645 + 1;
    float _2649 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2651 = as_type<float>(_2581) * _2643;
    float _2653 = trunc(_2623);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = -_2597;
    float _2661 = fma(_2629, _2637, _2659);
    float _2663 = fma(_2635, _2649, 1.570728778839111328125);
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = _2597;
    if (_2393)
    {
        _2667 = 1.0;
    }
    float _2669 = _2667;
    float _2671 = trunc(_2651);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = _2639 * 0.636619746685028076171875;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2683 = -_2663;
    float _2685 = fma(_2677, _2683, 1.0);
    float _2687 = _2669;
    if (!_2393)
    {
        _2687 = 7.345489978790283203125;
    }
    float _2689 = _2687;
    int _2691 = _2647 * int(_2657);
    int _2693 = _2691 + _2587;
    float _2695 = 1.0 / _2681;
    float2 _8393 = float2(_2685, _2665);
    float3 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8393, float2(0.0), isnan(_8393)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8393, float2(0.0), isnan(_8393)), level(0.0)).xyz;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2689 * _951;
    int _2709 = ~_2387;
    int _2711 = _2709 + 1;
    float _2713 = -_1317;
    float _2715 = _2713 + 1.0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2719 = _2717 != 0;
    float _2721 = -_1197;
    float _2723 = _2721 + 1.0;
    bool _2725 = _957 > 0.5;
    float _2727 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2729 = float(uint(_2693));
    float _2731 = floor(_2707);
    int _2733 = int(_2615) + int(_2675);
    float _2735 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2737 = as_type<float>(_2575) * _2729;
    float _2739 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2735);
    int _2741 = _2711 * _2733;
    int _2743 = _2741 + _2563;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = as_type<float>(_2675);
    if (_2393)
    {
        _2749 = 1.0;
    }
    float _2751 = _2749;
    float _2753 = trunc(_2737);
    float _2755 = precise::max(_2753, 0.0);
    uint _2757 = uint(_2755);
    int _2759 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2761 = _2759 != 0;
    float _2763 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    float _2765 = _2751;
    if (!_2393)
    {
        _2765 = 1.2345600128173828125;
    }
    float _2767 = _2765;
    float _2769 = -_2731;
    float _2771 = _2707 + _2769;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2775 = _909 + _2773;
    bool _2777 = uint(_2743) >= uint(_2387);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2779;
    bool _2783 = _951 > 0.5;
    float _2785 = 1.0 / _2747;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2789 = _2787 != 0;
    float _2791 = _2411 * _2767;
    bool _2793 = !_2777;
    int _2795 = _2793 ? 0 : (-1);
    float _2797 = _2781 * _2695;
    bool _2799 = _953 > 0.5;
    float _2801 = -_949;
    float _2803 = _2801 + 1.0;
    float _2805 = float(_2387);
    float _2807 = floor(_2791);
    int _2809 = ~_2463;
    int _2811 = _2809 + 1;
    float _2813 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    out.m_76.x = _2078;
    out.m_76.y = _2076;
    out.m_76.z = _2080;
    bool _2819 = _955 > 0.5;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2825 = _2771 * _2805;
    float _2827 = float(_2563);
    float _2829 = _2823 * _2785;
    int _2831 = int(_2657) + int(_2757);
    float _2833 = exp2(_2727);
    bool _2835 = _2827 >= _2805;
    bool _2837 = isnan(_2827);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan(_2805);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    bool _2847 = !_2719;
    int _2849 = _2847 ? 0 : 1;
    int _2851 = _2811 * _2831;
    int _2853 = _2851 + _2587;
    float _2855 = -_2807;
    float _2857 = _2791 + _2855;
    float _2859 = float(_2587);
    float _2861 = trunc(_2825);
    int _2863 = int(_2861);
    bool _2865 = uint(_2853) >= uint(_2463);
    float _2867 = float(_2463);
    int _2869 = ~_2733;
    int _2871 = _2869 + _2795;
    int _2873 = _2871 + 1;
    float _2875 = _2805 * _1035;
    int _2877 = abs(_2817);
    float _2879 = trunc(_2845);
    int _2881 = int(_2879);
    bool _2883 = !_2865;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = _2867 * _1035;
    int _2889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2891 = _2889 != 0;
    float _2893 = _2857 * _2867;
    bool _2895 = _2859 >= _2867;
    bool _2897 = isnan(_2859);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(_2867);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    int _2907 = _2387 * _2873;
    int _2909 = _2907 + _2563;
    int _2911 = ~_2831;
    int _2913 = _2911 + _2885;
    int _2915 = _2913 + 1;
    int _2917 = _2863 * _2877;
    int _2919 = _2917 + _2563;
    bool _2921 = !_2891;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = trunc(_2905);
    int _2927 = int(_2925);
    bool _2929 = _2387 == 0;
    int _2931 = _2463 * _2915;
    int _2933 = _2931 + _2587;
    float _2935 = -_199;
    int _2937 = _2783 ? as_type<int>(_2935) : as_type<int>(_199);
    float _2939 = -_2833;
    float _2941 = _2939 + 1.0;
    bool _2943 = !_2929;
    int _2945 = _2943 ? _2909 : (-1);
    int _2947 = ~_2881;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    float _2953 = trunc(_2875);
    int _2955 = int(_2953);
    int _2957 = _2387 + (-1);
    float _2959 = _2941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2961 = _2463 == 0;
    int _2963 = _2945 * _2951;
    int _2965 = abs(_1133);
    float _2967 = _2959 * _2286;
    bool _2969 = !_2961;
    int _2971 = _2969 ? _2933 : (-1);
    int _2973 = _2881 * _2957;
    int _2975 = _2973 + _2963;
    bool _2977 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2979 = isnan(_909);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = trunc(_2893);
    int _2991 = int(_2989);
    int _2993 = ~_2927;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = _2975 * _2965;
    bool _3001 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3003 = isnan(_909);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -_2987;
    float _3015 = _3013 + 1.0;
    int _3017 = abs(_1137);
    int _3019 = _2971 * _2997;
    bool _3021 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3023 = isnan(_909);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3029 = _3025 || _3027;
    float _3031 = float(_3029);
    float _3033 = _3011 * _3015;
    float _3035 = -_3011;
    float _3037 = _3035 + 1.0;
    float _3039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3041 = _909 + _3039;
    int _3043 = abs(_1141);
    float _3045 = _3031 * _3037;
    float _3047 = fma(_2829, _3041, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -_3031;
    float _3051 = _3049 + 1.0;
    float _3053 = _2813 * _3045;
    int _3055 = _2955 * _3017;
    int _3057 = _3055 + _2999;
    float _3059 = trunc(_2887);
    int _3061 = int(_3059);
    int _3063 = _2463 + (-1);
    int _3065 = abs(_2849);
    int _3067 = _2919 * _3043;
    int _3069 = _3067 + _3057;
    int _3071 = abs(_2923);
    int _3073 = _2927 * _3063;
    int _3075 = _3073 + _3019;
    int _3077 = abs(_1602);
    int _3079 = _2863 * _3065;
    int _3081 = _3079 + _3069;
    int _3083 = abs(_1640);
    int _3085 = _3075 * _3077;
    bool _3087 = !_2761;
    float _3089 = _3087 ? _199 : as_type<float>(_2937);
    int _3091 = _2991 * _3071;
    int _3093 = _3091 + _2587;
    float _3095 = float(uint(_3081));
    int _3097 = _3061 * _3083;
    int _3099 = _3097 + _3085;
    int _3101 = abs(_1644);
    float _3103 = _3089 + 0.5;
    int _3105 = abs(_1670);
    float _3107 = as_type<float>(_2581) * _3095;
    int _3109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3111 = _3109 != 0;
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1027);
    int _3115 = _3093 * _3101;
    int _3117 = _3115 + _3099;
    float _3119 = -_209;
    int _3121 = _2799 ? as_type<int>(_3119) : as_type<int>(_209);
    float _3123 = trunc(_3107);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    bool _3129 = !_3111;
    float _3131 = _3129 ? _209 : as_type<float>(_3121);
    float _3133 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3053);
    float _3135 = float(uint(_2919));
    int _3137 = _2991 * _3105;
    int _3139 = _3137 + _3117;
    float _3141 = float(uint(_3093));
    float _3143 = _3131 + (-0.5);
    float _3145 = fma(_3047, _3033, _3133);
    float _3147 = as_type<float>(_2581) * _3135;
    float _3149 = float(uint(_3139));
    float _3151 = -_3143;
    float _3153 = -_1029;
    float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3153);
    float _3157 = as_type<float>(_2575) * _3141;
    int _3159 = ~_2387;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3145);
    float _3165 = as_type<float>(_2575) * _3149;
    float _3167 = trunc(_3147);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3175 = _3173 != 0;
    int _3177 = _3161 * int(_3127);
    int _3179 = _3177 + _3081;
    int _3181 = ~_2463;
    int _3183 = _3181 + 1;
    int _3185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3187 = _3185 != 0;
    float _3189 = float(uint(_3179));
    float _3191 = trunc(_3165);
    float _3193 = precise::max(_3191, 0.0);
    uint _3195 = uint(_3193);
    float _3197 = -_199;
    int _3199 = _2819 ? as_type<int>(_3197) : as_type<int>(_199);
    int _3201 = ~_2463;
    int _3203 = _3201 + 1;
    float _3205 = as_type<float>(_2581) * _3189;
    float _3207 = -_209;
    int _3209 = _2725 ? as_type<int>(_3207) : as_type<int>(_209);
    bool _3211 = !_3175;
    float _3213 = _3211 ? _199 : as_type<float>(_3199);
    float _3215 = trunc(_3157);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    int _3221 = _3161 * int(_3171);
    int _3223 = _3221 + _2919;
    bool _3225 = !_3187;
    float _3227 = _3225 ? _209 : as_type<float>(_3209);
    float _3229 = _3213 + 0.5;
    int _3231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3233 = _3231 != 0;
    float _3235 = float(uint(_3223));
    float _3237 = trunc(_3205);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    int _3243 = _3183 * int(_3195);
    int _3245 = _3243 + _3139;
    float _3247 = _3227 + (-0.5);
    float _3249 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1321);
    float _3251 = as_type<float>(_2581) * _3235;
    float _3253 = -_1315;
    float _3255 = _3253 + 1.0;
    float _3257 = float(uint(_3245));
    float _3259 = -_3247;
    float _3261 = -_1323;
    float _3263 = fma(_3259, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3261);
    int _3265 = _3203 * int(_3219);
    int _3267 = _3265 + _3093;
    float _3269 = trunc(_3251);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = -_3255;
    float _3277 = fma(_3089, _3275, _3113);
    float _3279 = as_type<float>(_2575) * _3257;
    float _3281 = fma(_3131, _2715, _3155);
    float _3283 = float(uint(_3267));
    float _3285 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3287 = -_1211;
    float _3289 = _3287 + 1.0;
    int _3291 = int(_3127) + int(_3241);
    float _3293 = trunc(_3279);
    float _3295 = precise::max(_3293, 0.0);
    uint _3297 = uint(_3295);
    float _3299 = as_type<float>(_2575) * _3283;
    float _3301 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3303 = ~_2387;
    int _3305 = _3303 + 1;
    float _3307 = -_2723;
    float _3309 = fma(_3213, _3307, _3249);
    float _3311 = fma(_3227, _3289, _3263);
    float _3313 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3315 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3317 = abs(_1485);
    float _3319 = log2(_3317);
    int _3321 = _3305 * _3291;
    int _3323 = _3321 + _3081;
    int _3325 = int(_3171) + int(_3273);
    float _3327 = _3313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3329 = ~_2463;
    int _3331 = _3329 + 1;
    float _3333 = _3285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3335 = uint(_3323) >= uint(_2387);
    float _3337 = _3163 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _3277;
    out.m_78.y = _3281;
    out.m_78.z = _3309;
    out.m_78.w = _3311;
    int _3339 = int(_3195) + int(_3297);
    float _3341 = trunc(_3299);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    bool _3347 = !_3335;
    int _3349 = _3347 ? 0 : (-1);
    out.m_80.x = _3327;
    out.m_80.y = _3315;
    out.m_80.z = _3333;
    out.m_80.w = _3337;
    int _3351 = ~_3291;
    int _3353 = _3351 + _3349;
    int _3355 = _3353 + 1;
    float _3357 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3361 = _3359 != 0;
    bool _3363 = _1485 <= 8000.0;
    bool _3365 = isnan(_1485);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(8000.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = exp2(_3357);
    float _3377 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3379 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3383 = -_1471;
    float _3385 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3377);
    int _3387 = _3331 * _3339;
    int _3389 = _3387 + _3139;
    float _3391 = -_1471;
    float _3393 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    int _3395 = _2387 * _3355;
    int _3397 = _3395 + _3081;
    float _3399 = -_1471;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3381);
    float _3403 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3385);
    bool _3405 = uint(_3389) >= uint(_2463);
    float _3407 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3409 = !_2929;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3393);
    int _3421 = _3411 & 3;
    bool _3423 = _3421 != 0;
    float _3425 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    int _3427 = _3411 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3433 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3435 = ~_3339;
    int _3437 = _3435 + _3417;
    int _3439 = _3437 + 1;
    float _3441 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3407);
    int _3443 = _3423 ? 0 : 1;
    float _3445 = fma(_3375, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    bool _3449 = uint(_3427) > 1u;
    float _3451 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3453 = _2463 * _3439;
    int _3455 = _3453 + _3139;
    float _3457 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3459 = ~_3443;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    float _3465 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3451);
    float _3467 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3469 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3457);
    bool _3471 = !_2961;
    int _3473 = _3471 ? _3455 : (-1);
    float _3475 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3477 = _3411 >> 31;
    float _3479 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3467);
    int _3481 = int(_3219) + int(_3345);
    float _3483 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3475);
    int _3485 = _3463;
    if (!_3449)
    {
        int _3487 = ~_3443;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    int _3495 = _3473 >> 31;
    float _3497 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3479);
    int _3499 = ~_2387;
    int _3501 = _3499 + 1;
    float _3503 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    bool _3505 = !_3429;
    int _3507 = _3505 ? 0 : 1;
    float _3509 = _3433 * _3403;
    int _3511 = _3477 & 3;
    int _3513 = _3501 * _3325;
    int _3515 = _3513 + _2919;
    bool _3517 = _3427 != 3;
    int _3519 = _3495 & 3;
    int _3521 = _3411 + _3511;
    int _3523 = ~_2463;
    int _3525 = _3523 + 1;
    bool _3527 = uint(_3427) >= 2u;
    int _3529 = _3473 + _3519;
    int _3531 = _3525 * _3481;
    int _3533 = _3531 + _3093;
    int _3535 = _3521 >> 2;
    int _3537 = _3527 ? 0 : 1;
    bool _3539 = uint(_3515) >= uint(_2387);
    int _3541 = _3529 >> 2;
    int _3543 = _3535 << 4;
    int _3545 = _3543 + 368;
    float _3547 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3441);
    int _3549 = ~_3537;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3553;
    if (_3517)
    {
        int _3557 = ~_3537;
        int _3559 = _3557 + 1;
        _3555 = _3559;
    }
    int _3561 = _3555;
    int _3563 = _3545 + 8;
    uint _3565 = uint(int(uint(_3563) >> uint(2)));
    uint _3567 = uint(int(uint(int(_3565)) >> uint(2)));
    int _3569 = int(_3565) & 3;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[int(_3567)][_3569];
    int _3573 = int(_3565) + 1;
    uint _3575 = uint(int(uint(_3573) >> uint(2)));
    int _3577 = _3573 & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    bool _3581 = uint(_3533) >= uint(_2463);
    int _3583 = _3541 << 4;
    int _3585 = _3583 + 512;
    float _3587 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3425);
    bool _3589 = !_3539;
    int _3591 = _3589 ? 0 : (-1);
    int _3593 = _3473 & 3;
    bool _3595 = _3593 != 0;
    uint _3597 = uint(int(uint(_3545) >> uint(2)));
    uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
    int _3601 = int(_3597) & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    int _3605 = int(_3597) + 1;
    uint _3607 = uint(int(uint(_3605) >> uint(2)));
    int _3609 = _3605 & 3;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[int(_3607)][_3609];
    bool _3613 = !_3595;
    int _3615 = _3613 ? 0 : 1;
    int _3617 = _3473 & 3;
    bool _3619 = _3617 != 0;
    float _3621 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3465);
    float _3623 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _3625 = uint(int(uint(_3585) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = _3619 ? 0 : 1;
    float _3643 = fma(_3447, -2.0, 3.0);
    bool _3645 = uint(_3593) >= 2u;
    float _3647 = _3447 * _3447;
    bool _3649 = !_3581;
    int _3651 = _3649 ? 0 : (-1);
    float _3653 = fma(_3623, _3547, _3509);
    int _3655 = _3645 ? 0 : 1;
    int _3657 = _3585 + 8;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    uint _3661 = uint(int(uint(int(_3659)) >> uint(2)));
    int _3663 = int(_3659) & 3;
    float _3665 = (*spvDescriptorSet0.vp_c9)._m0[int(_3661)][_3663];
    int _3667 = int(_3659) + 1;
    uint _3669 = uint(int(uint(_3667) >> uint(2)));
    int _3671 = _3667 & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    bool _3675 = uint(_3593) > 1u;
    out.m_82.x = _3547;
    out.m_82.y = _3621;
    out.m_82.z = _3587;
    bool _3677 = _3593 != 3;
    float _3679 = _3647 * _3643;
    int _3681 = abs(_3491);
    int _3683 = ~_3481;
    int _3685 = _3683 + _3651;
    int _3687 = _3685 + 1;
    int _3689 = ~_3641;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = ~_3655;
    int _3697 = _3695 + 1;
    int _3699 = _3697 + 1;
    int _3701 = _2463 * _3687;
    int _3703 = _3701 + _3093;
    int _3705 = ~_3325;
    int _3707 = _3705 + _3591;
    int _3709 = _3707 + 1;
    int _3711 = _3693;
    int _3713 = _3699;
    if (!_3675)
    {
        int _3715 = ~_3641;
        int _3717 = _3715 + 1;
        _3711 = _3717;
    }
    int _3719 = _3711;
    int _3721 = _2387 * _3709;
    int _3723 = _3721 + _2919;
    if (_3677)
    {
        int _3725 = ~_3655;
        int _3727 = _3725 + 1;
        _3713 = _3727;
    }
    int _3729 = _3713;
    int _3731 = abs(_3719);
    int _3733 = abs(_3507);
    int _3735 = ~_3681;
    int _3737 = _3735 + 1;
    int _3739 = _3737 + 1;
    int _3741 = ~_3731;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    int _3747 = abs(_3561);
    int _3749 = ~_3733;
    int _3751 = _3749 + 1;
    int _3753 = _3751 + 1;
    int _3755 = _3739 * as_type<int>(_3611);
    int _3757 = abs(_3615);
    bool _3759 = _3427 != 3;
    int _3761 = _3753 * as_type<int>(_3603);
    int _3763 = _3761 + _3755;
    int _3765 = ~_3747;
    int _3767 = _3765 + 1;
    int _3769 = _3767 + 1;
    bool _3771 = _3593 != 3;
    int _3773 = _3745 * as_type<int>(_3639);
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    int _3781 = _3769 * as_type<int>(_3571);
    int _3783 = _3781 + _3763;
    bool _3785 = !_3759;
    int _3787 = _3785 ? 0 : (-1);
    float _3789 = fma(_3433, _3433, 1.0);
    bool _3791 = !_3771;
    int _3793 = _3791 ? 0 : (-1);
    int _3795 = _3779 * as_type<int>(_3631);
    int _3797 = _3795 + _3773;
    int _3799 = abs(_3729);
    int _3801 = abs(_3787);
    float _3803 = rsqrt(_3789);
    int _3805 = abs(_3793);
    int _3807 = ~_3799;
    int _3809 = _3807 + 1;
    int _3811 = _3809 + 1;
    bool _3813 = !_3233;
    int _3815 = _3813 ? 0 : 1;
    int _3817 = ~_3801;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3811 * as_type<int>(_3665);
    int _3825 = _3823 + _3797;
    int _3827 = abs(_3815);
    bool _3829 = !_3361;
    int _3831 = _3829 ? 0 : 1;
    int _3833 = _3821 * as_type<int>(_3579);
    int _3835 = _3833 + _3783;
    int _3837 = ~_3805;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = abs(_3831);
    int _3845 = _3841 * as_type<int>(_3673);
    int _3847 = _3845 + _3825;
    int _3849 = ~_3827;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = _3433 * _3803;
    int _3857 = ~_3843;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    bool _3863 = !_2929;
    int _3865 = _3863 ? _3723 : (-1);
    int _3867 = _3835 * _3853;
    bool _3869 = !_2961;
    int _3871 = _3869 ? _3703 : (-1);
    int _3873 = _3847 * _3861;
    float _3875 = -_3497;
    float _3877 = _3855 * _3875;
    int _3879 = _3865 * _3827;
    int _3881 = _3879 + _3867;
    float _3883 = -_3493;
    float _3885 = _3855 * _3883;
    int _3887 = _3871 * _3843;
    int _3889 = _3887 + _3873;
    float _3891 = fma(_3803, _3419, _3877);
    float _3893 = _3433 * _3419;
    float _3895 = -_3679;
    float _3897 = _3895 + 1.0;
    float _3899 = fma(_3803, _3403, _3885);
    float _3901 = -_3503;
    float _3903 = _3855 * _3901;
    float _3905 = fma(_3623, _3621, _3893);
    float _3907 = _3493 + _3653;
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3679);
    float _3911 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _3913 = fma(_3803, _3431, _3903);
    float _3915 = _3433 * _3431;
    float _3917 = _3373 * _3909;
    float _3919 = _3911 + _2182;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _3911;
    out.gl_Position.w = _2182;
    float _3921 = fma(_3623, _3587, _3915);
    float _3923 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _2705 * _2967;
    out.m_84.x = _3899;
    out.m_84.y = _3891;
    out.m_84.z = _3913;
    float _3927 = float(_3881);
    float _3929 = _2803 * _3923;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = float(_3889);
    float _3935 = _3497 + _3905;
    float _3937 = _3503 + _3921;
    float _3939 = -_3931;
    float _3941 = fma(_3939, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_86.x = _3927;
    out.m_86.y = _3933;
    float _3943 = -_2959;
    float _3945 = _3943 + 1.0;
    float _3947 = _3919 * 0.5;
    float _3949 = _3919;
    float _3951 = _3945;
    if (!_2168)
    {
        _3949 = 1.0;
    }
    float _3953 = _3949;
    out.m_88.x = _3907;
    out.m_88.y = _3935;
    out.m_88.z = _3937;
    float _3955 = _3953;
    if (_2168)
    {
        bool _3957 = _2284 >= _2228;
        bool _3959 = isnan(_2284);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_2228);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _2297 * _2967;
    bool _3973 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_2413);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = _3969 * _2371;
    float _3985 = fma(_2701, _3971, _2291);
    float _3987 = fma(_2703, _3971, _2293);
    float _3989 = _2297 * _3945;
    float _3991 = -_3983;
    float _3993 = fma(_3991, _3941, 1.0);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_2297, _3925, _2295);
    out.m_90.z = _3947;
    out.m_90.w = _2182;
    float _3999 = _3995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3985;
    out.m_92.y = _3987;
    out.m_92.z = _3997;
    out.m_92.w = _3989;
    if (!_3981)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4001 = _2216;
    out.m_94.x = _3999;
    float _4003 = _4001;
    float _4005 = _4001;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4007 = _3951;
    float _4009 = _4007;
    float _4011 = _4007;
    if (!_3981)
    {
        _1351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4013 = _1351;
    bool _4015 = !_3981;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_4015)
    {
        bool _4021 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4023 = isnan(_2413);
        bool _4025 = _4021 || _4023;
        bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4029 = _4025 || _4027;
        if (!_4029)
        {
            float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4033 = _2413 + _4031;
            float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4035;
            float _4039 = 1.0 / _4037;
            float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4049 = _4033 * _4039;
            float _4051 = precise::clamp(_4049, 0.0, 1.0);
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4061 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4011 = _4061;
            _4005 = _4059;
            _4019 = _4057;
            _4063 = true;
        }
        else
        {
            bool _4065 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4067 = isnan(_2413);
            bool _4069 = _4065 || _4067;
            bool _4071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4073 = _4069 || _4071;
            if (!_4073)
            {
                _4003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4075 = _4003;
            _4005 = _4075;
            if (!_4073)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4077 = _4009;
            _4011 = _4077;
            if (!_4073)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4079 = _4017;
            bool _4081 = !_4073;
            _4019 = _4079;
            if (!_4081)
            {
                bool _4083 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4085 = isnan(_2413);
                bool _4087 = _4083 || _4085;
                bool _4089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4091 = _4087 || _4089;
                if (!_4091)
                {
                    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4095 = _2413 + _4093;
                    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4097;
                    float _4101 = 1.0 / _4099;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = _4095 * _4101;
                    float _4113 = precise::clamp(_4111, 0.0, 1.0);
                    float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4119 = fma(_4113, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4121 = fma(_4113, _4117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4123 = fma(_4113, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4011 = _4123;
                    _4005 = _4121;
                    _4019 = _4119;
                    _4063 = true;
                }
                else
                {
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4063 = false;
    float _4125 = _4011;
    float _4127 = _4005;
    float _4129 = _4019;
    float _4131 = _4125 * 0.586610972881317138671875;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _4135 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4137 = fma(_4129, 0.114477999508380889892578125, _4135);
    float _4139 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4141 = -_4137;
    float _4143 = _4141 + _4127;
    float _4145 = -_4137;
    float _4147 = _4145 + _4125;
    float _4149 = -_4137;
    float _4151 = _4149 + _4129;
    out.m_59.x = _4139;
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4157 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    out.m_98.x = _4153;
    out.m_98.y = _4155;
    out.m_98.z = _4157;
    if (!_4133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4159 = -_2076;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4163 = -_2078;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4167 = -_2080;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4171 = _4161 * _4161;
    float _4173 = fma(_4165, _4165, _4171);
    float _4175 = fma(_4169, _4169, _4173);
    float _4177 = sqrt(_4175);
    float _4179 = rsqrt(_4175);
    float _4181 = -_4177;
    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = _4165 * _4179;
    float _4191 = _4161 * _4179;
    float _4193 = abs(_4187);
    float _4195 = log2(_4193);
    float _4197 = _4169 * _4179;
    float _4199 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4201 = _3935 * _4191;
    float _4203 = -_4191;
    float _4205 = -_4199;
    float _4207 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4205);
    float _4209 = fma(_3907, _4189, _4201);
    float _4211 = -_4197;
    float _4213 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4207);
    float _4215 = fma(_3937, _4197, _4209);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4221 = _4213 + _4219;
    float _4223 = _4195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4225 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4227 = precise::clamp(_4225, 0.0, 1.0);
    float _4229 = exp2(_4223);
    float _4231 = _4229 * _4227;
    float _4233 = _4217 * _4231;
    float _4235 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4237 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4239 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4235;
    out.m_96.y = _4237;
    out.m_96.z = _4239;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4063 = false;
    bool _901 = false;
    bool _733 = false;
    bool _515 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_133);
        out.gl_Position.z = _4295;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_117);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    int _167 = 0;
    if (_163)
    {
        float _169 = _165 * 5.0;
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4364 = as_type<float>(_171);
        out.gl_Position.z = _4364;
    }
    if (_163)
    {
        return out;
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_66.x;
    float _177 = in.m_66.y;
    float _179 = in.m_66.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    float _235;
    if (!_217)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_117);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_70.x;
    float _351 = in.m_70.y;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _371 = _347 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _381 = 1.0 / _375;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _379;
    float _387 = _317 * _351;
    bool _389 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_347);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_347);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _355 * _381;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _423;
    float _427 = _315 * _349;
    float _429 = _415 * _403;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _441 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _443 = _399 * _433;
    float _445 = fma(_437, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _447 = _371 * _385;
    float _449 = -_399;
    float _451 = _449 + 1.0;
    float _453 = _439 * _443;
    float _455 = _445 * _443;
    float _457 = _441 * _443;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _455);
    float _473 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _475 = fma(_465, _447, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _477 = fma(_469, _447, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _453);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _457);
    float _483 = fma(_473, _429, _471);
    float _485 = fma(_475, _429, _479);
    float _487 = fma(_477, _429, _481);
    float _489 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].x, _483);
    float _491 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].y, _485);
    float _493 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].z, _487);
    bool _495 = !_383;
    float _513;
    if (!_495)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_117);
        float _519 = 1.0 / _517;
        float _521 = _149 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    bool _541 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _543 = isnan(_523);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _563 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_523);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _535;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = _539 * _553;
    bool _593 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_523);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _557;
    float _607 = -_551;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _527, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _613;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = _603 * _609;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = -_585;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _561;
    float _633 = _573 * _619;
    float _635 = _625 * _587;
    float _637 = -_573;
    float _639 = _637 + 1.0;
    float _641 = _551 * _629;
    float _643 = _611 * _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _523 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _651 = _523 + _649;
    float _653 = _615 * _605;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _671 = fma(_635, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _675 = fma(_653, _651, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _677 = -_665;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _523 + _681;
    float _685 = _669 * _631;
    float _687 = fma(_671, _621, _673);
    float _689 = _585 * _679;
    float _691 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = fma(_685, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _695 = fma(_675, _641, _687);
    float _697 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_693, _689, _695);
    float _703 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _699;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _711;
    bool _713 = !_589;
    float _731;
    if (!_713)
    {
        float _715 = in.m_68.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_117);
        float _737 = 1.0 / _735;
        float _739 = _149 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _761 = _741 + _759;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_741);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_757;
    float _797 = _795 + 1.0;
    float _799 = 1.0 / _777;
    float _801 = _793 * _797;
    float _803 = -_793;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _807;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = 1.0 / _781;
    float _815 = _773 * _805;
    float _817 = -_773;
    float _819 = _817 + 1.0;
    float _821 = _745 * _799;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _827;
    float _831 = fma(_809, _821, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _833 = fma(_825, _821, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = fma(_829, _821, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _761 * _813;
    float _839 = _831 * _815;
    float _841 = _833 * _815;
    float _843 = _835 * _815;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _859 = fma(_847, _837, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _861 = fma(_851, _837, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _865 = fma(_855, _837, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _867 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _843);
    float _869 = fma(_859, _801, _857);
    float _871 = fma(_861, _801, _863);
    float _873 = fma(_865, _801, _867);
    float _875 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].x, _869);
    float _877 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].y, _871);
    float _879 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].z, _873);
    bool _881 = !_811;
    float _899;
    if (!_881)
    {
        float _883 = in.m_68.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_117);
        float _905 = 1.0 / _903;
        float _907 = _149 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = in.m_56.x;
    float _913 = in.m_56.y;
    float _915 = in.m_56.z;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = _913 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[6].x, _919);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[4].z, _921);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _929 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _933 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _937 = floor(_933);
    float _939 = floor(_935);
    float _941 = -_937;
    float _943 = _933 + _941;
    float _945 = -_939;
    float _947 = _935 + _945;
    float2 _5630 = float2(_943, _947);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5630, float2(0.0), isnan(_5630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5630, float2(0.0), isnan(_5630)), level(0.0)).x;
    float _951 = in.m_68.x;
    float _953 = in.m_68.y;
    float _955 = in.m_68.z;
    float _957 = in.m_68.w;
    float _959 = _913 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _963 = log2(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _973 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _975 = float(_117);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _981 = int(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _987 = as_type<int>(_911);
    float _989 = _969;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_967)
    {
        _987 = 0;
    }
    int _993 = _987;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _997 = _993;
    if (!_967)
    {
        _997 = 1;
    }
    int _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1003 = 1.0 / _975;
    float _1005 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1007 = _953 * 2.0;
    float _1009 = _951 * 2.0;
    float _1011 = _955 * 2.0;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1015 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = floor(_1007);
    float _1019 = -_977;
    float _1021 = fma(_1013, 2.0, _1019);
    float _1023 = fma(_1015, -2.0, _971);
    float _1025 = -_149;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    float _1029 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1031 = floor(_1009);
    float _1033 = _951 + (-0.5);
    float _1035 = _1003 * _149;
    float _1037 = floor(_1011);
    bool _1039 = _1017 > 0.0;
    float _1041 = _951 + _953;
    bool _1043 = _1017 >= 0.0;
    bool _1045 = isnan(_1017);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = _999 != 1;
    float _1055 = _1041 + (-1.0);
    bool _1057 = _1031 >= 0.0;
    bool _1059 = isnan(_1031);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1069 = int(_1067);
    bool _1071 = _1031 > 0.0;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1075 = _1051 ? 0 : 1;
    float _1077 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1079 = _1037 >= 0.0;
    bool _1081 = isnan(_1037);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = _1037 > 0.0;
    int _1091 = ~_1075;
    int _1093 = _1091 + 1;
    int _1095 = _1093 + 1;
    int _1097 = _1095;
    float _1099 = _1077;
    int _1101 = 2;
    if (!_1039)
    {
        int _1103 = ~_1075;
        int _1105 = _1103 + 1;
        _1097 = _1105;
    }
    int _1107 = _1097;
    int _1109 = _1087 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1121 = _1119 != 0;
    if (!_1053)
    {
        _989 = _953;
    }
    float _1123 = _989;
    float _1125 = _1123;
    if (_1053)
    {
        _1125 = _951;
    }
    float _1127 = _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1131 = !_1117;
    int _1133 = _1131 ? 0 : 1;
    bool _1135 = !_1113;
    int _1137 = _1135 ? 0 : 1;
    bool _1139 = !_1121;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1153 = _1151 != 0;
    int _1155 = ~as_type<int>(_1077);
    int _1157 = _1155 + 1;
    int _1159 = _1157 + 1;
    int _1161 = _1159;
    float _1163 = _1127;
    if (!_1071)
    {
        int _1165 = ~as_type<int>(_1077);
        int _1167 = _1165 + 1;
        _1161 = _1167;
    }
    int _1169 = _1161;
    int _1171 = ~_1109;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1053)
    {
        _1099 = _955;
    }
    float _1179 = _1099;
    float _1181 = _1179;
    if (!_1089)
    {
        int _1183 = ~_1109;
        int _1185 = _1183 + 1;
        _1177 = _1185;
    }
    int _1187 = _1177;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    if (_1053)
    {
        _1181 = _953;
    }
    float _1191 = _1181;
    bool _1193 = !_1149;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    bool _1199 = !_1145;
    int _1201 = _1199 ? 0 : 1;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].w, _995);
    float _1205 = _1191;
    if (!_1053)
    {
        _1163 = _953;
    }
    float _1207 = _1163;
    int _1209 = abs(_1195);
    float _1211 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    int _1213 = abs(_1201);
    float _1215 = _1207;
    if (!_1053)
    {
        _1205 = _955;
    }
    float _1217 = _1205;
    float _1219 = _1217;
    if (_1053)
    {
        _1215 = _951;
    }
    float _1221 = _1215;
    if (_1053)
    {
        _1219 = _953;
    }
    float _1223 = _1219;
    float _1225 = float(_1069);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1229 = float(_1169);
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1225;
    float _1237 = float(_1213);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = float(_1187);
    float _1243 = -_1001;
    float _1245 = fma(_1227, 2.0, _1243);
    float _1247 = float(_981);
    float _1249 = fma(_1231, -2.0, _1239);
    float _1251 = _1237 * _1241;
    float _1253 = _1233 * _1229;
    float _1255 = _963 * _149;
    float _1257 = in.m_74.x;
    float _1259 = in.m_74.y;
    float _1261 = in.m_74.z;
    float _1263 = 1.0 / _1247;
    float _1265 = _1251 * (-2.0);
    float _1267 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1269 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1271 = isnan(1.0);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1277 = _1273 || _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1281 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1283 = isnan(0.0);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1289 = _1285 || _1287;
    float _1291 = exp2(_1255);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1295 = 1.0 + _1293;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1299 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1301 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1303 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1267);
    float _1305 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1297);
    float _1307 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1299);
    float _1309 = 1.0 / _1295;
    float _1311 = _1235 * _149;
    float _1313 = _1263 * _149;
    float _1315 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1301);
    float _1317 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1319 = -_149;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1245);
    float _1323 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1249);
    float _1325 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    float _1331 = fma(_1265, _1257, _1257);
    bool _1333 = !_1153;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(_1073, _1265, _1073);
    float _1339 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1341 = _1289 ? _1329 : 0.0;
    float _1343 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1331);
    int _1345 = abs(_1335);
    float _1347 = _955 + _953;
    float _1349 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1351 = 1.0;
    if (_1277)
    {
        float _1353 = _1341 * _1309;
        _153 = _1353;
    }
    float _1355 = _153;
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1359 = _1347 + (-1.0);
    float _1361 = fma(_1337, _1355, _1343);
    float _1363 = float(_1107);
    float _1365 = _1253 * (-2.0);
    float _1367 = float(_1345);
    float _1369 = _1357 + _1349;
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1373 = 1.0 / _1349;
    float _1375 = fma(_1365, _1259, _1259);
    float _1377 = _1367 * _1363;
    float _1379 = _953 + (-0.5);
    float _1381 = _955 + _951;
    float _1383 = fma(_1371, _1365, _1371);
    float _1385 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    float _1387 = _1381 + (-1.0);
    float _1389 = _1377 * (-2.0);
    float _1391 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1393 = fma(_1383, _1355, _1385);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1397 = fma(_1389, _1261, _1261);
    float _1399 = _955 + (-0.5);
    float _1401 = _1393 * 0.15915493667125701904296875;
    float _1403 = fma(_1395, _1389, _1395);
    float _1405 = _1369 * _1373;
    float _1407 = _1405 * 0.5;
    float _1409 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1397);
    float _1411 = _1401 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = fma(_1403, _1355, _1409);
    float _1423 = _1361 * 0.15915493667125701904296875;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1427 = _985 * _1415;
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1005 * _1425;
    float _1437 = _983 + _1391;
    float _1439 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1441 = _1401 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1439);
    float _1447 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1445);
    float _1449 = _1423 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = _1433 * _1413;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1457 = _1429 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1433 * _1443;
    float _1463 = 1.0 / _1419;
    float _1465 = _1451 * _1443;
    float _1467 = _1451 * _1413;
    float _1469 = _1429 * 6.283185482025146484375;
    float _1471 = sin(_1469);
    float _1473 = _1433 * _1459;
    float _1475 = _1451 * _1459;
    float _1477 = _1413 * _1459;
    float _1479 = _1443 * _1459;
    float _1481 = _1473 * _1427;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1485 = _1463 * _1483;
    float _1487 = _1475 * _1427;
    float _1489 = trunc(_1455);
    int _1491 = int(_1489);
    bool _1493 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1495 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1497 = fma(_1471, _1453, _1465);
    float _1499 = -_1461;
    float _1501 = fma(_1471, _1467, _1499);
    float _1503 = -_1467;
    float _1505 = fma(_1471, _1461, _1503);
    float _1507 = fma(_1471, _1465, _1453);
    float _1509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = -_1427;
    float _1513 = _1471 * _1511;
    float _1515 = fma(_1497, _1435, _1481);
    float _1517 = fma(_1501, _1435, _1487);
    float _1519 = fma(_1477, _1435, _1513);
    float _1521 = fma(_1505, _1509, _1515);
    float _1523 = fma(_1507, _1509, _1517);
    float _1525 = _1437;
    if (!_1493)
    {
        _1101 = 1;
    }
    int _1527 = _1101;
    float _1529 = fma(_1479, _1509, _1519);
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1533 = !_1493;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1531);
    int _1543 = _1527;
    if (!_1495)
    {
        _1543 = _1535;
    }
    int _1545 = _1543;
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1539);
    float _1551 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1541);
    int _1553 = _1545 << 6;
    float _1555 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1547);
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1567 = _1565 != 0;
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1571 = _1569 != 0;
    float _1573 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1575 = _1553 + 56;
    uint _1578 = uint(int(uint(_1575) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1596 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    float _1598 = _931 + _1573;
    bool _1600 = !_1563;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _929 + _1594;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1598 + _1608;
    int _1612 = _1553 + 48;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1604 + _1630;
    float _1634 = _983 + _1606;
    float _1636 = _1610 * _1610;
    bool _1638 = !_1559;
    int _1640 = _1638 ? 0 : 1;
    bool _1642 = !_1567;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = fma(_1632, _1632, _1636);
    int _1648 = _1553 + 64;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    uint _1652 = uint(int(uint(int(_1650)) >> uint(2)));
    int _1654 = int(_1650) & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = int(_1650) + 1;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    int _1662 = _1658 & 3;
    float _1664 = (*spvDescriptorSet0.vp_c15)._m0[int(_1660)][_1662];
    float _1666 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1668 = !_1571;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = sqrt(_1646);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1491 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1666);
    int _1682 = _1553 + 72;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    uint _1686 = uint(int(uint(int(_1684)) >> uint(2)));
    int _1688 = int(_1684) & 3;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[int(_1686)][_1688];
    int _1692 = int(_1684) + 1;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    int _1696 = _1692 & 3;
    float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
    float _1700 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1680);
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1704 = _1553 + 96;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = trunc(_1702);
    int _1724 = int(_1722);
    bool _1726 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1728 = _1553 + 104;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    float _1746 = _1606;
    float _1748 = _1598;
    float _1750 = _1604;
    int _1752 = _1678;
    float _1754 = as_type<float>(_1545);
    if (!_1726)
    {
        _1746 = _1598;
    }
    float _1756 = _1746;
    int _1758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1760 = _1724 + _1758;
    int _1762 = _1760 + 1;
    float _1764 = _1756;
    int _1766 = as_type<int>(_1584);
    if (!_1726)
    {
        _1748 = _1634;
    }
    float _1768 = _1748;
    bool _1770 = !_1726;
    float _1772 = _1768;
    int _1774 = as_type<int>(_1628);
    int _1776 = as_type<int>(_1690);
    if (!_1770)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1782 = _1672 + _1780;
        float _1784 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = rsqrt(_1646);
        float _1788 = _1782 * _1778;
        float _1790 = _1788 * 0.15915493667125701904296875;
        float _1792 = _1790 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = fma(_1794, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1802 = _1786 * _1800;
        float _1804 = _1798 + (-1.0);
        float _1806 = fma(_1632, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1610, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = fma(_1634, _1798, _1810);
        _1772 = _1812;
        _1750 = _1806;
        _1764 = _1808;
    }
    float _1814 = _1772;
    float _1816 = _1750;
    float _1818 = _1764;
    float _1820 = -_983;
    float _1822 = _1820 + _1814;
    bool _1824 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1826 = _1553 + 80;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    int _1844 = _1678 | _1762;
    float _1846 = -_929;
    float _1848 = _1846 + _1816;
    float _1850 = _1822 * _1822;
    float _1852 = _1437 * _1720;
    bool _1854 = _1844 < 0;
    bool _1856 = _1854 || _1824;
    float _1858 = -_931;
    float _1860 = _1858 + _1818;
    float _1862 = fma(_1848, _1848, _1850);
    float _1864 = fma(_929, _1712, _1852);
    bool _1866 = _1762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1868 = _1866 || _1856;
    float _1870 = _1437 * _1628;
    float _1872 = fma(_1860, _1860, _1862);
    float _1874 = fma(_931, _1736, _1864);
    float _1876 = _1437 * _1664;
    float _1878 = fma(_929, _1620, _1870);
    float _1880 = sqrt(_1872);
    float _1882 = _1874 + _1744;
    float _1884 = fma(_929, _1656, _1876);
    float _1886 = fma(_931, _1584, _1878);
    bool _1888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1890 = isnan(0.5);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    float _1898 = fma(_931, _1690, _1884);
    int _1900 = as_type<int>(_1876);
    float _1902 = _1816;
    float _1904 = _1814;
    float _1906 = _1818;
    float _1908 = _1886;
    float _1910 = _1822;
    if (!_1868)
    {
        int _1912 = _1762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1914 = _1912 + _1678;
        _1752 = _1914;
    }
    int _1916 = _1752;
    float _1918 = _1850;
    if (!_1868)
    {
        float _1920 = floor(_1455);
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = _1886 + _1592;
    float _1926 = _1898 + _1698;
    if (!_1868)
    {
        int _1928 = _1916 << 2;
        _1900 = _1928;
    }
    int _1930 = _1900;
    if (!_1868)
    {
        uint _1932 = uint(int(uint(_1916) >> uint(2)));
        _1774 = int(_1932);
    }
    int _1934 = _1774;
    bool _1936 = _1880 > 0.0;
    float _1938 = 1.0 / _1882;
    float _1940 = as_type<float>(_1934);
    if (!_1868)
    {
        int _1942 = 12 & _1930;
        _1766 = _1942;
    }
    int _1944 = _1766;
    if (!_1868)
    {
        int _1946 = _1934 << 4;
        int _1948 = _1946 + _1944;
        _1776 = _1948;
    }
    int _1950 = _1776;
    bool _1952 = !_1936;
    if (!_1952)
    {
        float _1954 = _213 * _213;
        float _1956 = rsqrt(_1872);
        float _1958 = fma(_211, _211, _1954);
        float _1960 = fma(_215, _215, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = _1848 * _1956;
        float _1966 = _1822 * _1956;
        float _1968 = _1860 * _1956;
        bool _1970 = _1962 > 0.0;
        bool _1972 = !_1970;
        _1940 = _1962;
        _1908 = _1960;
        _1910 = _1966;
        if (!_1972)
        {
            float _1974 = rsqrt(_1960);
            float _1976 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1978 = _213 * _1974;
            float _1980 = _211 * _1974;
            float _1982 = _1966 * _1978;
            float _1984 = _215 * _1974;
            float _1986 = fma(_1964, _1980, _1982);
            float _1988 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1990 = fma(_1968, _1984, _1986);
            float _1992 = _1990 * _1988;
            float _1994 = fma(_211, _1992, _1816);
            float _1996 = fma(_213, _1992, _1814);
            float _1998 = fma(_215, _1992, _1818);
            _1902 = _1994;
            _1904 = _1996;
            _1906 = _1998;
            _1940 = _1992;
            _1908 = _1974;
        }
    }
    float _2000 = _1902;
    float _2002 = _1904;
    float _2004 = _1906;
    float _2006 = _1940;
    float _2008 = _1908;
    float _2010 = _1910;
    float _2012 = _2008;
    float _2014 = _2006;
    float _2016 = _2004;
    if (_1896)
    {
        _2012 = _2000;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1896)
    {
        _2014 = _2002;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (!_1896)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2028 = _983 + _2026;
        float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2032 = _929 + _2030;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2036 = -_983;
        float _2038 = _2036 + _2002;
        float _2040 = _2028 * _2028;
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2044 = _931 + _2042;
        float _2046 = -_931;
        float _2048 = _2046 + _2004;
        float _2050 = fma(_2032, _2032, _2040);
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2054 = fma(_2044, _2044, _2050);
        float _2056 = sqrt(_2054);
        float _2058 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2060 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2062 = _2060 * _2052;
        float _2064 = _2058 * _2062;
        float _2066 = -_929;
        float _2068 = _2066 + _2000;
        float _2070 = fma(_2038, _2064, _983);
        float _2072 = fma(_2068, _2064, _929);
        float _2074 = fma(_2048, _2064, _931);
        _2024 = _2070;
        _2020 = _2072;
        _2016 = _2074;
    }
    float _2076 = _2024;
    float _2078 = _2020;
    float _2080 = _2016;
    int _2082 = _1553 + 88;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    uint _2086 = uint(int(uint(int(_2084)) >> uint(2)));
    int _2088 = int(_2084) & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    int _2092 = int(_2084) + 1;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    int _2096 = _2092 & 3;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[int(_2094)][_2096];
    float _2100 = _1924 * _1938;
    float _2102 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = _1926 * _1938;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2112 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2114 = _2010;
    if (!_1868)
    {
        int _2116 = _1950 + 400;
        uint _2118 = uint(int(uint(_2116) >> uint(2)));
        uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
        int _2122 = int(_2118) & 3;
        float _2124 = (*spvDescriptorSet0.vp_c15)._m0[int(_2120)][_2122];
        _2114 = _2124;
    }
    float _2126 = _2114;
    bool _2128 = _2100 >= 0.0;
    float _2130 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2110);
    float _2132 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2108);
    float _2134 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2112);
    float _2138 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2140 = _2100 <= 1.0;
    bool _2142 = _2140 && _2128;
    float _2144 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2132);
    float _2146 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2134);
    float _2148 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2154 = _2106 >= 0.0;
    bool _2156 = _2154 && _2142;
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2150);
    float _2162 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2166 = _2106 <= 1.0;
    bool _2168 = _2166 && _2156;
    float _2170 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = _1437 * _1842;
    float _2176 = -_2164;
    float _2178 = fma(_2176, _2162, 1.0);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = fma(_929, _1834, _2174);
    float _2186 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2180);
    float _2190 = 1.0 / _2182;
    float _2192 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2194 = _2184;
    if (_2168)
    {
        float _2196 = float(_1545);
        _1754 = _2196;
    }
    float _2198 = _1754;
    float _2200 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2188);
    float _2202 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = log2(_2178);
    float _2206 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_931, _2090, _2184);
    float _2212 = _1744;
    float _2214 = _2198;
    float _2216 = _2206;
    if (!_1868)
    {
        float _2218 = floor(_1702);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = _2210 + _2098;
    float _2224 = _2208 * _2190;
    float _2226 = _2206 * _2190;
    float _2228 = _2222 * _1938;
    float _2230 = fma(_2226, -0.5, 0.5);
    float _2232 = _2180;
    if (_2168)
    {
        float _2234 = rint(_2198);
        float _2236 = precise::max(_2234, 0.0);
        uint _2238 = uint(_2236);
        uint _2240 = clamp(_2238, 0u, 65535u);
        _2232 = as_type<float>(_2240);
    }
    float _2242 = _2232;
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = _1938;
    float _2250 = _2126;
    if (!_1868)
    {
        float _2252 = rint(_2126);
        float _2254 = precise::max(_2252, 0.0);
        uint _2256 = uint(_2254);
        uint _2258 = clamp(_2256, 0u, 65535u);
        _2248 = as_type<float>(_2258);
    }
    float _2260 = _2248;
    float _2262 = _2220;
    if (!_1868)
    {
        float _2264 = -_2220;
        float _2266 = _1702 + _2264;
        _2194 = _2266;
    }
    float _2268 = _2194;
    float _2270 = fma(_2224, 0.5, 0.5);
    float _2272 = _2268;
    if (!_1868)
    {
        float _2274 = -_1922;
        float _2276 = _1455 + _2274;
        _2262 = _2276;
    }
    float _2278 = _2262;
    float _2280 = _2106;
    if (_2168)
    {
        float3 _7752 = float3(_2100, _2106, float(as_type<int>(_2242)));
        float3 _7756 = select(_7752, float3(0.0), isnan(_7752));
        float _2282 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7756.xy, uint(rint(_7756.z)), _2228, level(0.0));
        _2280 = _2282;
    }
    float _2284 = _2280;
    float3 _7766 = float3(_2270, _2230, _2246);
    float _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7766, float3(0.0), isnan(_7766)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7766, float3(0.0), isnan(_7766)), level(0.0)).x;
    float3 _7775 = float3(_2270, _2230, _2246);
    float4 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7775, float3(0.0), isnan(_7775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7775, float3(0.0), isnan(_7775)), level(0.0)).xyzw;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2289.w;
    float _2299 = _1922;
    if (!_1868)
    {
        float3 _7798 = float3(_2278, _2268, float(as_type<int>(_2260)));
        float3 _7800 = select(_7798, float3(0.0), isnan(_7798));
        float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7800.xy, uint(rint(_7800.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7800.xy, uint(rint(_7800.z)), level(0.0)).x;
        _2299 = _2301;
    }
    float _2303 = _2299;
    if (_1868)
    {
        _2214 = 1.0;
    }
    float _2305 = _2214;
    float _2307 = _2305;
    if (!_1868)
    {
        int _2309 = _1916 << 4;
        int _2311 = _2309 + 2048;
        uint _2313 = uint(int(uint(_2311) >> uint(2)));
        uint _2315 = uint(int(uint(int(_2313)) >> uint(2)));
        int _2317 = int(_2313) & 3;
        float _2319 = (*spvDescriptorSet0.vp_c15)._m0[int(_2315)][_2317];
        int _2321 = int(_2313) + 1;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        int _2325 = _2321 & 3;
        float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
        int _2329 = _2311 + 8;
        uint _2331 = uint(int(uint(_2329) >> uint(2)));
        uint _2333 = uint(int(uint(int(_2331)) >> uint(2)));
        int _2335 = int(_2331) & 3;
        float _2337 = (*spvDescriptorSet0.vp_c15)._m0[int(_2333)][_2335];
        int _2339 = int(_2331) + 1;
        uint _2341 = uint(int(uint(_2339) >> uint(2)));
        int _2343 = _2339 & 3;
        float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
        float _2347 = _1437 * _2327;
        float _2349 = fma(_929, _2319, _2347);
        float _2351 = fma(_931, _2337, _2349);
        float _2353 = _2351 + _2345;
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -_2355;
        float _2359 = _2357 + _2303;
        float _2361 = fma(_2359, 500.0, 1.5);
        float _2363 = exp2(_2361);
        float _2365 = 0.0 + _2363;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _1525 = _2347;
        _2307 = _2367;
    }
    float _2369 = _1525;
    float _2371 = _2307;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2375 = _2076 + _2373;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2078 + _2377;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2383 = _2080 + _2381;
    float _2385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2387 = int(_2385);
    float _2389 = _2375 * _2375;
    int _2391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2379, _2379, _2389);
    float _2397 = fma(_2383, _2383, _2395);
    float _2399 = rsqrt(_2397);
    float _2401 = _2375;
    if (_2393)
    {
        float _2403 = in.m_68.x;
        _991 = _2403;
    }
    float _2405 = _991;
    float _2407 = _2405;
    if (!_2393)
    {
        float _2409 = in.m_68.y;
        _2407 = _2409;
    }
    float _2411 = _2407;
    float _2413 = sqrt(_2397);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2417 = _2379 * _2415;
    float _2419 = _2383 * _2415;
    float _2421 = _2417 * _2417;
    float _2423 = _2419 * _2419;
    float _2425 = _2421 + _2423;
    float _2427 = sqrt(_2425);
    bool _2429 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2433 = _2427 + _2431;
    float _2435 = _2369;
    float _2437 = _2433;
    float _2439 = _2425;
    float _2441 = _2417;
    float _2443 = _2421;
    float _2445 = _2423;
    if (_2429)
    {
        float _2447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2447;
    }
    float _2449 = _2435;
    if (_2429)
    {
        float _2451 = rsqrt(_2425);
        _2272 = _2451;
    }
    float _2453 = _2272;
    float _2455 = _2453;
    if (_2429)
    {
        float _2457 = _2433 * _2449;
        _2437 = _2457;
    }
    float _2459 = _2437;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2463 = int(_2461);
    if (_2429)
    {
        float _2465 = _2459 * 0.15915493667125701904296875;
        _2250 = _2465;
    }
    float _2467 = _2250;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = _2303;
    if (_2429)
    {
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        _2471 = _2475;
    }
    float _2477 = _2471;
    float _2479 = precise::max(0.0, _2469);
    float _2481 = _929;
    if (_2429)
    {
        float _2483 = _2467 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        _2481 = _2485;
    }
    float _2487 = _2481;
    float _2489 = -_2415;
    float _2491 = -_2479;
    float _2493 = fma(_2375, _2489, _2491);
    float _2495 = float(uint(_2387));
    if (_2429)
    {
        float _2497 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2497;
    }
    float _2499 = _2401;
    float _2501 = 1.0 / _2495;
    float _2503 = _2477;
    float _2505 = _2499;
    if (_2429)
    {
        float _2507 = fma(_2477, _2499, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2503 = _2507;
    }
    float _2509 = _2503;
    float _2511 = float(uint(_2463));
    float _2513 = _2509;
    if (_2429)
    {
        float _2515 = _2453 * _2509;
        _2439 = _2515;
    }
    float _2517 = _2439;
    if (!_2429)
    {
        _2513 = _2493;
    }
    float _2519 = _2513;
    float _2521 = _2519;
    if (_2429)
    {
        float _2523 = _2487 + (-1.0);
        _2505 = _2523;
    }
    float _2525 = _2505;
    float _2527 = _2525;
    if (_2429)
    {
        float _2529 = _2417 * _2517;
        _2441 = _2529;
    }
    float _2531 = _2441;
    if (!_2429)
    {
        _2455 = _2419;
    }
    float _2533 = _2455;
    float _2535 = _2533;
    if (_2429)
    {
        float _2537 = _2419 * _2517;
        _2535 = _2537;
    }
    float _2539 = _2535;
    if (_2429)
    {
        float _2541 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    if (_2429)
    {
        float _2545 = _2531 * _2531;
        _2443 = _2545;
    }
    float _2547 = _2443;
    float _2549 = 1.0 / _2511;
    if (_2429)
    {
        float _2551 = _2539 * _2539;
        _2445 = _2551;
    }
    float _2553 = _2445;
    if (_2429)
    {
        float _2555 = fma(_2493, _2487, _2543);
        _2521 = _2555;
    }
    float _2557 = _2521;
    float _2559 = fma(_2557, _2557, _2547);
    float _2561 = trunc(_1311);
    int _2563 = int(_2561);
    float _2565 = _2559 + _2553;
    float _2567 = rsqrt(_2565);
    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2571 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2569);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    int _2575 = as_type<int>(_2549) + (-2);
    float _2577 = -_2573;
    float _2579 = _2577 + 1.0;
    int _2581 = as_type<int>(_2501) + (-2);
    float _2583 = float(uint(_2563));
    float _2585 = trunc(_1313);
    int _2587 = int(_2585);
    float _2589 = as_type<float>(_2581) * _2583;
    float _2591 = _2567 * _2531;
    float _2593 = abs(_2579);
    float _2595 = log2(_2593);
    float _2597 = _2567 * _2557;
    float _2599 = _2567 * _2539;
    float _2601 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _2603 = ~_2387;
    int _2605 = _2603 + 1;
    float _2607 = -_2601;
    float _2609 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2607);
    float _2611 = trunc(_2589);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    float _2617 = float(uint(_2587));
    float _2619 = -_2599;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2609);
    float _2623 = as_type<float>(_2575) * _2617;
    float _2625 = fma(_2621, -0.5, 0.5);
    float _2627 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = exp2(_2627);
    int _2631 = _2605 * int(_2615);
    int _2633 = _2631 + _2563;
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2597 + 1.0;
    float _2639 = sqrt(_2625);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = float(uint(_2633));
    int _2645 = ~_2463;
    int _2647 = _2645 + 1;
    float _2649 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2651 = as_type<float>(_2581) * _2643;
    float _2653 = trunc(_2623);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = -_2597;
    float _2661 = fma(_2629, _2637, _2659);
    float _2663 = fma(_2635, _2649, 1.570728778839111328125);
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = _2597;
    if (_2393)
    {
        _2667 = 1.0;
    }
    float _2669 = _2667;
    float _2671 = trunc(_2651);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = _2639 * 0.636619746685028076171875;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2683 = -_2663;
    float _2685 = fma(_2677, _2683, 1.0);
    float _2687 = _2669;
    if (!_2393)
    {
        _2687 = 7.345489978790283203125;
    }
    float _2689 = _2687;
    int _2691 = _2647 * int(_2657);
    int _2693 = _2691 + _2587;
    float _2695 = 1.0 / _2681;
    float2 _8393 = float2(_2685, _2665);
    float3 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8393, float2(0.0), isnan(_8393)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8393, float2(0.0), isnan(_8393)), level(0.0)).xyz;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2689 * _951;
    int _2709 = ~_2387;
    int _2711 = _2709 + 1;
    float _2713 = -_1317;
    float _2715 = _2713 + 1.0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2719 = _2717 != 0;
    float _2721 = -_1197;
    float _2723 = _2721 + 1.0;
    bool _2725 = _957 > 0.5;
    float _2727 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2729 = float(uint(_2693));
    float _2731 = floor(_2707);
    int _2733 = int(_2615) + int(_2675);
    float _2735 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2737 = as_type<float>(_2575) * _2729;
    float _2739 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2735);
    int _2741 = _2711 * _2733;
    int _2743 = _2741 + _2563;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = as_type<float>(_2675);
    if (_2393)
    {
        _2749 = 1.0;
    }
    float _2751 = _2749;
    float _2753 = trunc(_2737);
    float _2755 = precise::max(_2753, 0.0);
    uint _2757 = uint(_2755);
    int _2759 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2761 = _2759 != 0;
    float _2763 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    float _2765 = _2751;
    if (!_2393)
    {
        _2765 = 1.2345600128173828125;
    }
    float _2767 = _2765;
    float _2769 = -_2731;
    float _2771 = _2707 + _2769;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2775 = _909 + _2773;
    bool _2777 = uint(_2743) >= uint(_2387);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2779;
    bool _2783 = _951 > 0.5;
    float _2785 = 1.0 / _2747;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2789 = _2787 != 0;
    float _2791 = _2411 * _2767;
    bool _2793 = !_2777;
    int _2795 = _2793 ? 0 : (-1);
    float _2797 = _2781 * _2695;
    bool _2799 = _953 > 0.5;
    float _2801 = -_949;
    float _2803 = _2801 + 1.0;
    float _2805 = float(_2387);
    float _2807 = floor(_2791);
    int _2809 = ~_2463;
    int _2811 = _2809 + 1;
    float _2813 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    out.m_76.x = _2078;
    out.m_76.y = _2076;
    out.m_76.z = _2080;
    bool _2819 = _955 > 0.5;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2825 = _2771 * _2805;
    float _2827 = float(_2563);
    float _2829 = _2823 * _2785;
    int _2831 = int(_2657) + int(_2757);
    float _2833 = exp2(_2727);
    bool _2835 = _2827 >= _2805;
    bool _2837 = isnan(_2827);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan(_2805);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    bool _2847 = !_2719;
    int _2849 = _2847 ? 0 : 1;
    int _2851 = _2811 * _2831;
    int _2853 = _2851 + _2587;
    float _2855 = -_2807;
    float _2857 = _2791 + _2855;
    float _2859 = float(_2587);
    float _2861 = trunc(_2825);
    int _2863 = int(_2861);
    bool _2865 = uint(_2853) >= uint(_2463);
    float _2867 = float(_2463);
    int _2869 = ~_2733;
    int _2871 = _2869 + _2795;
    int _2873 = _2871 + 1;
    float _2875 = _2805 * _1035;
    int _2877 = abs(_2817);
    float _2879 = trunc(_2845);
    int _2881 = int(_2879);
    bool _2883 = !_2865;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = _2867 * _1035;
    int _2889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2891 = _2889 != 0;
    float _2893 = _2857 * _2867;
    bool _2895 = _2859 >= _2867;
    bool _2897 = isnan(_2859);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(_2867);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    int _2907 = _2387 * _2873;
    int _2909 = _2907 + _2563;
    int _2911 = ~_2831;
    int _2913 = _2911 + _2885;
    int _2915 = _2913 + 1;
    int _2917 = _2863 * _2877;
    int _2919 = _2917 + _2563;
    bool _2921 = !_2891;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = trunc(_2905);
    int _2927 = int(_2925);
    bool _2929 = _2387 == 0;
    int _2931 = _2463 * _2915;
    int _2933 = _2931 + _2587;
    float _2935 = -_199;
    int _2937 = _2783 ? as_type<int>(_2935) : as_type<int>(_199);
    float _2939 = -_2833;
    float _2941 = _2939 + 1.0;
    bool _2943 = !_2929;
    int _2945 = _2943 ? _2909 : (-1);
    int _2947 = ~_2881;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    float _2953 = trunc(_2875);
    int _2955 = int(_2953);
    int _2957 = _2387 + (-1);
    float _2959 = _2941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2961 = _2463 == 0;
    int _2963 = _2945 * _2951;
    int _2965 = abs(_1133);
    float _2967 = _2959 * _2286;
    bool _2969 = !_2961;
    int _2971 = _2969 ? _2933 : (-1);
    int _2973 = _2881 * _2957;
    int _2975 = _2973 + _2963;
    bool _2977 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2979 = isnan(_909);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = trunc(_2893);
    int _2991 = int(_2989);
    int _2993 = ~_2927;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = _2975 * _2965;
    bool _3001 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3003 = isnan(_909);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -_2987;
    float _3015 = _3013 + 1.0;
    int _3017 = abs(_1137);
    int _3019 = _2971 * _2997;
    bool _3021 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3023 = isnan(_909);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3029 = _3025 || _3027;
    float _3031 = float(_3029);
    float _3033 = _3011 * _3015;
    float _3035 = -_3011;
    float _3037 = _3035 + 1.0;
    float _3039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3041 = _909 + _3039;
    int _3043 = abs(_1141);
    float _3045 = _3031 * _3037;
    float _3047 = fma(_2829, _3041, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -_3031;
    float _3051 = _3049 + 1.0;
    float _3053 = _2813 * _3045;
    int _3055 = _2955 * _3017;
    int _3057 = _3055 + _2999;
    float _3059 = trunc(_2887);
    int _3061 = int(_3059);
    int _3063 = _2463 + (-1);
    int _3065 = abs(_2849);
    int _3067 = _2919 * _3043;
    int _3069 = _3067 + _3057;
    int _3071 = abs(_2923);
    int _3073 = _2927 * _3063;
    int _3075 = _3073 + _3019;
    int _3077 = abs(_1602);
    int _3079 = _2863 * _3065;
    int _3081 = _3079 + _3069;
    int _3083 = abs(_1640);
    int _3085 = _3075 * _3077;
    bool _3087 = !_2761;
    float _3089 = _3087 ? _199 : as_type<float>(_2937);
    int _3091 = _2991 * _3071;
    int _3093 = _3091 + _2587;
    float _3095 = float(uint(_3081));
    int _3097 = _3061 * _3083;
    int _3099 = _3097 + _3085;
    int _3101 = abs(_1644);
    float _3103 = _3089 + 0.5;
    int _3105 = abs(_1670);
    float _3107 = as_type<float>(_2581) * _3095;
    int _3109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3111 = _3109 != 0;
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1027);
    int _3115 = _3093 * _3101;
    int _3117 = _3115 + _3099;
    float _3119 = -_209;
    int _3121 = _2799 ? as_type<int>(_3119) : as_type<int>(_209);
    float _3123 = trunc(_3107);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    bool _3129 = !_3111;
    float _3131 = _3129 ? _209 : as_type<float>(_3121);
    float _3133 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3053);
    float _3135 = float(uint(_2919));
    int _3137 = _2991 * _3105;
    int _3139 = _3137 + _3117;
    float _3141 = float(uint(_3093));
    float _3143 = _3131 + (-0.5);
    float _3145 = fma(_3047, _3033, _3133);
    float _3147 = as_type<float>(_2581) * _3135;
    float _3149 = float(uint(_3139));
    float _3151 = -_3143;
    float _3153 = -_1029;
    float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3153);
    float _3157 = as_type<float>(_2575) * _3141;
    int _3159 = ~_2387;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3145);
    float _3165 = as_type<float>(_2575) * _3149;
    float _3167 = trunc(_3147);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3175 = _3173 != 0;
    int _3177 = _3161 * int(_3127);
    int _3179 = _3177 + _3081;
    int _3181 = ~_2463;
    int _3183 = _3181 + 1;
    int _3185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3187 = _3185 != 0;
    float _3189 = float(uint(_3179));
    float _3191 = trunc(_3165);
    float _3193 = precise::max(_3191, 0.0);
    uint _3195 = uint(_3193);
    float _3197 = -_199;
    int _3199 = _2819 ? as_type<int>(_3197) : as_type<int>(_199);
    int _3201 = ~_2463;
    int _3203 = _3201 + 1;
    float _3205 = as_type<float>(_2581) * _3189;
    float _3207 = -_209;
    int _3209 = _2725 ? as_type<int>(_3207) : as_type<int>(_209);
    bool _3211 = !_3175;
    float _3213 = _3211 ? _199 : as_type<float>(_3199);
    float _3215 = trunc(_3157);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    int _3221 = _3161 * int(_3171);
    int _3223 = _3221 + _2919;
    bool _3225 = !_3187;
    float _3227 = _3225 ? _209 : as_type<float>(_3209);
    float _3229 = _3213 + 0.5;
    int _3231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3233 = _3231 != 0;
    float _3235 = float(uint(_3223));
    float _3237 = trunc(_3205);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    int _3243 = _3183 * int(_3195);
    int _3245 = _3243 + _3139;
    float _3247 = _3227 + (-0.5);
    float _3249 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1321);
    float _3251 = as_type<float>(_2581) * _3235;
    float _3253 = -_1315;
    float _3255 = _3253 + 1.0;
    float _3257 = float(uint(_3245));
    float _3259 = -_3247;
    float _3261 = -_1323;
    float _3263 = fma(_3259, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3261);
    int _3265 = _3203 * int(_3219);
    int _3267 = _3265 + _3093;
    float _3269 = trunc(_3251);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = -_3255;
    float _3277 = fma(_3089, _3275, _3113);
    float _3279 = as_type<float>(_2575) * _3257;
    float _3281 = fma(_3131, _2715, _3155);
    float _3283 = float(uint(_3267));
    float _3285 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3287 = -_1211;
    float _3289 = _3287 + 1.0;
    int _3291 = int(_3127) + int(_3241);
    float _3293 = trunc(_3279);
    float _3295 = precise::max(_3293, 0.0);
    uint _3297 = uint(_3295);
    float _3299 = as_type<float>(_2575) * _3283;
    float _3301 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3303 = ~_2387;
    int _3305 = _3303 + 1;
    float _3307 = -_2723;
    float _3309 = fma(_3213, _3307, _3249);
    float _3311 = fma(_3227, _3289, _3263);
    float _3313 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3315 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3317 = abs(_1485);
    float _3319 = log2(_3317);
    int _3321 = _3305 * _3291;
    int _3323 = _3321 + _3081;
    int _3325 = int(_3171) + int(_3273);
    float _3327 = _3313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3329 = ~_2463;
    int _3331 = _3329 + 1;
    float _3333 = _3285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3335 = uint(_3323) >= uint(_2387);
    float _3337 = _3163 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _3277;
    out.m_78.y = _3281;
    out.m_78.z = _3309;
    out.m_78.w = _3311;
    int _3339 = int(_3195) + int(_3297);
    float _3341 = trunc(_3299);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    bool _3347 = !_3335;
    int _3349 = _3347 ? 0 : (-1);
    out.m_80.x = _3327;
    out.m_80.y = _3315;
    out.m_80.z = _3333;
    out.m_80.w = _3337;
    int _3351 = ~_3291;
    int _3353 = _3351 + _3349;
    int _3355 = _3353 + 1;
    float _3357 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3361 = _3359 != 0;
    bool _3363 = _1485 <= 8000.0;
    bool _3365 = isnan(_1485);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(8000.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = exp2(_3357);
    float _3377 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3379 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3383 = -_1471;
    float _3385 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3377);
    int _3387 = _3331 * _3339;
    int _3389 = _3387 + _3139;
    float _3391 = -_1471;
    float _3393 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    int _3395 = _2387 * _3355;
    int _3397 = _3395 + _3081;
    float _3399 = -_1471;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3381);
    float _3403 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3385);
    bool _3405 = uint(_3389) >= uint(_2463);
    float _3407 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3409 = !_2929;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3393);
    int _3421 = _3411 & 3;
    bool _3423 = _3421 != 0;
    float _3425 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    int _3427 = _3411 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3433 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3435 = ~_3339;
    int _3437 = _3435 + _3417;
    int _3439 = _3437 + 1;
    float _3441 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3407);
    int _3443 = _3423 ? 0 : 1;
    float _3445 = fma(_3375, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    bool _3449 = uint(_3427) > 1u;
    float _3451 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3453 = _2463 * _3439;
    int _3455 = _3453 + _3139;
    float _3457 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3459 = ~_3443;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    float _3465 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3451);
    float _3467 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3469 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3457);
    bool _3471 = !_2961;
    int _3473 = _3471 ? _3455 : (-1);
    float _3475 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3477 = _3411 >> 31;
    float _3479 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3467);
    int _3481 = int(_3219) + int(_3345);
    float _3483 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3475);
    int _3485 = _3463;
    if (!_3449)
    {
        int _3487 = ~_3443;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    int _3495 = _3473 >> 31;
    float _3497 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3479);
    int _3499 = ~_2387;
    int _3501 = _3499 + 1;
    float _3503 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    bool _3505 = !_3429;
    int _3507 = _3505 ? 0 : 1;
    float _3509 = _3433 * _3403;
    int _3511 = _3477 & 3;
    int _3513 = _3501 * _3325;
    int _3515 = _3513 + _2919;
    bool _3517 = _3427 != 3;
    int _3519 = _3495 & 3;
    int _3521 = _3411 + _3511;
    int _3523 = ~_2463;
    int _3525 = _3523 + 1;
    bool _3527 = uint(_3427) >= 2u;
    int _3529 = _3473 + _3519;
    int _3531 = _3525 * _3481;
    int _3533 = _3531 + _3093;
    int _3535 = _3521 >> 2;
    int _3537 = _3527 ? 0 : 1;
    bool _3539 = uint(_3515) >= uint(_2387);
    int _3541 = _3529 >> 2;
    int _3543 = _3535 << 4;
    int _3545 = _3543 + 368;
    float _3547 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3441);
    int _3549 = ~_3537;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3553;
    if (_3517)
    {
        int _3557 = ~_3537;
        int _3559 = _3557 + 1;
        _3555 = _3559;
    }
    int _3561 = _3555;
    int _3563 = _3545 + 8;
    uint _3565 = uint(int(uint(_3563) >> uint(2)));
    uint _3567 = uint(int(uint(int(_3565)) >> uint(2)));
    int _3569 = int(_3565) & 3;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[int(_3567)][_3569];
    int _3573 = int(_3565) + 1;
    uint _3575 = uint(int(uint(_3573) >> uint(2)));
    int _3577 = _3573 & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    bool _3581 = uint(_3533) >= uint(_2463);
    int _3583 = _3541 << 4;
    int _3585 = _3583 + 512;
    float _3587 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3425);
    bool _3589 = !_3539;
    int _3591 = _3589 ? 0 : (-1);
    int _3593 = _3473 & 3;
    bool _3595 = _3593 != 0;
    uint _3597 = uint(int(uint(_3545) >> uint(2)));
    uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
    int _3601 = int(_3597) & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    int _3605 = int(_3597) + 1;
    uint _3607 = uint(int(uint(_3605) >> uint(2)));
    int _3609 = _3605 & 3;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[int(_3607)][_3609];
    bool _3613 = !_3595;
    int _3615 = _3613 ? 0 : 1;
    int _3617 = _3473 & 3;
    bool _3619 = _3617 != 0;
    float _3621 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3465);
    float _3623 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _3625 = uint(int(uint(_3585) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = _3619 ? 0 : 1;
    float _3643 = fma(_3447, -2.0, 3.0);
    bool _3645 = uint(_3593) >= 2u;
    float _3647 = _3447 * _3447;
    bool _3649 = !_3581;
    int _3651 = _3649 ? 0 : (-1);
    float _3653 = fma(_3623, _3547, _3509);
    int _3655 = _3645 ? 0 : 1;
    int _3657 = _3585 + 8;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    uint _3661 = uint(int(uint(int(_3659)) >> uint(2)));
    int _3663 = int(_3659) & 3;
    float _3665 = (*spvDescriptorSet0.vp_c9)._m0[int(_3661)][_3663];
    int _3667 = int(_3659) + 1;
    uint _3669 = uint(int(uint(_3667) >> uint(2)));
    int _3671 = _3667 & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    bool _3675 = uint(_3593) > 1u;
    out.m_82.x = _3547;
    out.m_82.y = _3621;
    out.m_82.z = _3587;
    bool _3677 = _3593 != 3;
    float _3679 = _3647 * _3643;
    int _3681 = abs(_3491);
    int _3683 = ~_3481;
    int _3685 = _3683 + _3651;
    int _3687 = _3685 + 1;
    int _3689 = ~_3641;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = ~_3655;
    int _3697 = _3695 + 1;
    int _3699 = _3697 + 1;
    int _3701 = _2463 * _3687;
    int _3703 = _3701 + _3093;
    int _3705 = ~_3325;
    int _3707 = _3705 + _3591;
    int _3709 = _3707 + 1;
    int _3711 = _3693;
    int _3713 = _3699;
    if (!_3675)
    {
        int _3715 = ~_3641;
        int _3717 = _3715 + 1;
        _3711 = _3717;
    }
    int _3719 = _3711;
    int _3721 = _2387 * _3709;
    int _3723 = _3721 + _2919;
    if (_3677)
    {
        int _3725 = ~_3655;
        int _3727 = _3725 + 1;
        _3713 = _3727;
    }
    int _3729 = _3713;
    int _3731 = abs(_3719);
    int _3733 = abs(_3507);
    int _3735 = ~_3681;
    int _3737 = _3735 + 1;
    int _3739 = _3737 + 1;
    int _3741 = ~_3731;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    int _3747 = abs(_3561);
    int _3749 = ~_3733;
    int _3751 = _3749 + 1;
    int _3753 = _3751 + 1;
    int _3755 = _3739 * as_type<int>(_3611);
    int _3757 = abs(_3615);
    bool _3759 = _3427 != 3;
    int _3761 = _3753 * as_type<int>(_3603);
    int _3763 = _3761 + _3755;
    int _3765 = ~_3747;
    int _3767 = _3765 + 1;
    int _3769 = _3767 + 1;
    bool _3771 = _3593 != 3;
    int _3773 = _3745 * as_type<int>(_3639);
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    int _3781 = _3769 * as_type<int>(_3571);
    int _3783 = _3781 + _3763;
    bool _3785 = !_3759;
    int _3787 = _3785 ? 0 : (-1);
    float _3789 = fma(_3433, _3433, 1.0);
    bool _3791 = !_3771;
    int _3793 = _3791 ? 0 : (-1);
    int _3795 = _3779 * as_type<int>(_3631);
    int _3797 = _3795 + _3773;
    int _3799 = abs(_3729);
    int _3801 = abs(_3787);
    float _3803 = rsqrt(_3789);
    int _3805 = abs(_3793);
    int _3807 = ~_3799;
    int _3809 = _3807 + 1;
    int _3811 = _3809 + 1;
    bool _3813 = !_3233;
    int _3815 = _3813 ? 0 : 1;
    int _3817 = ~_3801;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3811 * as_type<int>(_3665);
    int _3825 = _3823 + _3797;
    int _3827 = abs(_3815);
    bool _3829 = !_3361;
    int _3831 = _3829 ? 0 : 1;
    int _3833 = _3821 * as_type<int>(_3579);
    int _3835 = _3833 + _3783;
    int _3837 = ~_3805;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = abs(_3831);
    int _3845 = _3841 * as_type<int>(_3673);
    int _3847 = _3845 + _3825;
    int _3849 = ~_3827;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = _3433 * _3803;
    int _3857 = ~_3843;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    bool _3863 = !_2929;
    int _3865 = _3863 ? _3723 : (-1);
    int _3867 = _3835 * _3853;
    bool _3869 = !_2961;
    int _3871 = _3869 ? _3703 : (-1);
    int _3873 = _3847 * _3861;
    float _3875 = -_3497;
    float _3877 = _3855 * _3875;
    int _3879 = _3865 * _3827;
    int _3881 = _3879 + _3867;
    float _3883 = -_3493;
    float _3885 = _3855 * _3883;
    int _3887 = _3871 * _3843;
    int _3889 = _3887 + _3873;
    float _3891 = fma(_3803, _3419, _3877);
    float _3893 = _3433 * _3419;
    float _3895 = -_3679;
    float _3897 = _3895 + 1.0;
    float _3899 = fma(_3803, _3403, _3885);
    float _3901 = -_3503;
    float _3903 = _3855 * _3901;
    float _3905 = fma(_3623, _3621, _3893);
    float _3907 = _3493 + _3653;
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3679);
    float _3911 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _3913 = fma(_3803, _3431, _3903);
    float _3915 = _3433 * _3431;
    float _3917 = _3373 * _3909;
    float _3919 = _3911 + _2182;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _3911;
    out.gl_Position.w = _2182;
    float _3921 = fma(_3623, _3587, _3915);
    float _3923 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _2705 * _2967;
    out.m_84.x = _3899;
    out.m_84.y = _3891;
    out.m_84.z = _3913;
    float _3927 = float(_3881);
    float _3929 = _2803 * _3923;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = float(_3889);
    float _3935 = _3497 + _3905;
    float _3937 = _3503 + _3921;
    float _3939 = -_3931;
    float _3941 = fma(_3939, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_86.x = _3927;
    out.m_86.y = _3933;
    float _3943 = -_2959;
    float _3945 = _3943 + 1.0;
    float _3947 = _3919 * 0.5;
    float _3949 = _3919;
    float _3951 = _3945;
    if (!_2168)
    {
        _3949 = 1.0;
    }
    float _3953 = _3949;
    out.m_88.x = _3907;
    out.m_88.y = _3935;
    out.m_88.z = _3937;
    float _3955 = _3953;
    if (_2168)
    {
        bool _3957 = _2284 >= _2228;
        bool _3959 = isnan(_2284);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_2228);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _2297 * _2967;
    bool _3973 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_2413);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = _3969 * _2371;
    float _3985 = fma(_2701, _3971, _2291);
    float _3987 = fma(_2703, _3971, _2293);
    float _3989 = _2297 * _3945;
    float _3991 = -_3983;
    float _3993 = fma(_3991, _3941, 1.0);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_2297, _3925, _2295);
    out.m_90.z = _3947;
    out.m_90.w = _2182;
    float _3999 = _3995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3985;
    out.m_92.y = _3987;
    out.m_92.z = _3997;
    out.m_92.w = _3989;
    if (!_3981)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4001 = _2216;
    out.m_94.x = _3999;
    float _4003 = _4001;
    float _4005 = _4001;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4007 = _3951;
    float _4009 = _4007;
    float _4011 = _4007;
    if (!_3981)
    {
        _1351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4013 = _1351;
    bool _4015 = !_3981;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_4015)
    {
        bool _4021 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4023 = isnan(_2413);
        bool _4025 = _4021 || _4023;
        bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4029 = _4025 || _4027;
        if (!_4029)
        {
            float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4033 = _2413 + _4031;
            float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4035;
            float _4039 = 1.0 / _4037;
            float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4049 = _4033 * _4039;
            float _4051 = precise::clamp(_4049, 0.0, 1.0);
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4061 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4011 = _4061;
            _4005 = _4059;
            _4019 = _4057;
            _4063 = true;
        }
        else
        {
            bool _4065 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4067 = isnan(_2413);
            bool _4069 = _4065 || _4067;
            bool _4071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4073 = _4069 || _4071;
            if (!_4073)
            {
                _4003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4075 = _4003;
            _4005 = _4075;
            if (!_4073)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4077 = _4009;
            _4011 = _4077;
            if (!_4073)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4079 = _4017;
            bool _4081 = !_4073;
            _4019 = _4079;
            if (!_4081)
            {
                bool _4083 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4085 = isnan(_2413);
                bool _4087 = _4083 || _4085;
                bool _4089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4091 = _4087 || _4089;
                if (!_4091)
                {
                    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4095 = _2413 + _4093;
                    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4097;
                    float _4101 = 1.0 / _4099;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = _4095 * _4101;
                    float _4113 = precise::clamp(_4111, 0.0, 1.0);
                    float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4119 = fma(_4113, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4121 = fma(_4113, _4117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4123 = fma(_4113, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4011 = _4123;
                    _4005 = _4121;
                    _4019 = _4119;
                    _4063 = true;
                }
                else
                {
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4063 = false;
    float _4125 = _4011;
    float _4127 = _4005;
    float _4129 = _4019;
    float _4131 = _4125 * 0.586610972881317138671875;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _4135 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4137 = fma(_4129, 0.114477999508380889892578125, _4135);
    float _4139 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4141 = -_4137;
    float _4143 = _4141 + _4127;
    float _4145 = -_4137;
    float _4147 = _4145 + _4125;
    float _4149 = -_4137;
    float _4151 = _4149 + _4129;
    out.m_59.x = _4139;
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4157 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    out.m_98.x = _4153;
    out.m_98.y = _4155;
    out.m_98.z = _4157;
    if (!_4133)
    {
        return out;
    }
    float _4159 = -_2076;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4163 = -_2078;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4167 = -_2080;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4171 = _4161 * _4161;
    float _4173 = fma(_4165, _4165, _4171);
    float _4175 = fma(_4169, _4169, _4173);
    float _4177 = sqrt(_4175);
    float _4179 = rsqrt(_4175);
    float _4181 = -_4177;
    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = _4165 * _4179;
    float _4191 = _4161 * _4179;
    float _4193 = abs(_4187);
    float _4195 = log2(_4193);
    float _4197 = _4169 * _4179;
    float _4199 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4201 = _3935 * _4191;
    float _4203 = -_4191;
    float _4205 = -_4199;
    float _4207 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4205);
    float _4209 = fma(_3907, _4189, _4201);
    float _4211 = -_4197;
    float _4213 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4207);
    float _4215 = fma(_3937, _4197, _4209);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4221 = _4213 + _4219;
    float _4223 = _4195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4225 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4227 = precise::clamp(_4225, 0.0, 1.0);
    float _4229 = exp2(_4223);
    float _4231 = _4229 * _4227;
    float _4233 = _4217 * _4231;
    float _4235 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4237 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4239 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4235;
    out.m_96.y = _4237;
    out.m_96.z = _4239;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4063 = false;
    bool _901 = false;
    bool _733 = false;
    bool _515 = false;
    bool _339 = false;
    bool _237 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_56.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_59.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4295 = as_type<float>(_133);
        out.gl_Position.z = _4295;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_61.w;
    bool _137 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_135);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = -_135;
    float _149 = _147 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _151 = 0.0;
    float _153 = _149;
    if (_145)
    {
        float _155 = float(_117);
        _151 = _155;
    }
    float _157 = _151;
    bool _159 = _149 >= _157;
    bool _161 = !_145;
    bool _163 = _159 || _161;
    if (_163)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _127;
    if (_163)
    {
        out.m_59.x = 0.0;
    }
    int _167 = 0;
    if (_163)
    {
        float _169 = _165 * 5.0;
        _167 = as_type<int>(_169);
    }
    int _171 = _167;
    if (_163)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4364 = as_type<float>(_171);
        out.gl_Position.z = _4364;
    }
    if (_163)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _173 = as_type<float>(int(gl_VertexIndex));
    float _175 = in.m_66.x;
    float _177 = in.m_66.y;
    float _179 = in.m_66.z;
    int _181 = as_type<int>(_173) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_173) & 2;
    bool _187 = _185 != 0;
    bool _189 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _191 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _193 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _195 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _197 = !_183;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _191);
    float _203 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _193);
    float _205 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _195);
    bool _207 = !_187;
    float _209 = _207 ? (-0.5) : 0.5;
    float _211 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _201);
    float _213 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _203);
    float _215 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _205);
    bool _217 = !_189;
    float _235;
    if (!_217)
    {
        float _219 = in.m_68.x;
        float _221 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _223 = _219 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[12].x, _149);
        float _227 = _225 * _221;
        float _229 = floor(_227);
        float _231 = -_229;
        float _233 = _227 + _231;
        _235 = _233;
        _237 = true;
    }
    else
    {
        float _239 = float(_117);
        float _241 = 1.0 / _239;
        float _243 = _149 * _241;
        _235 = _243;
    }
    _237 = false;
    float _245 = _235;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = _245 + _247;
    bool _251 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _253 = isnan(_245);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -_261;
    float _269 = _267 + 1.0;
    bool _271 = _245 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _273 = isnan(_245);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _283;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _289 = 1.0 / _265;
    float _291 = _281 * _269;
    float _293 = -_281;
    float _295 = _293 + 1.0;
    float _297 = _249 * _289;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = fma(_285, _297, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _305 = fma(_301, _297, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _307 = _303 * _291;
    float _309 = _305 * _291;
    float _311 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].x, _307);
    float _313 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[143].y, _309);
    float _315 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].x, _311);
    float _317 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[144].y, _313);
    bool _319 = !_287;
    float _337;
    if (!_319)
    {
        float _321 = in.m_68.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[11].x, _149);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        float _341 = float(_117);
        float _343 = 1.0 / _341;
        float _345 = _149 * _343;
        _337 = _345;
    }
    _339 = false;
    float _347 = _337;
    float _349 = in.m_70.x;
    float _351 = in.m_70.y;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _355 = _347 + _353;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _371 = _347 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _381 = 1.0 / _375;
    bool _383 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _385 = 1.0 / _379;
    float _387 = _317 * _351;
    bool _389 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _391 = isnan(_347);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_367;
    float _403 = _401 + 1.0;
    bool _405 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _407 = isnan(_347);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = _355 * _381;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _423;
    float _427 = _315 * _349;
    float _429 = _415 * _403;
    float _431 = -_415;
    float _433 = _431 + 1.0;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _435;
    float _439 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _441 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _443 = _399 * _433;
    float _445 = fma(_437, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _447 = _371 * _385;
    float _449 = -_399;
    float _451 = _449 + 1.0;
    float _453 = _439 * _443;
    float _455 = _445 * _443;
    float _457 = _441 * _443;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _471 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].x, _455);
    float _473 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _475 = fma(_465, _447, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _477 = fma(_469, _447, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].y, _453);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[107].z, _457);
    float _483 = fma(_473, _429, _471);
    float _485 = fma(_475, _429, _479);
    float _487 = fma(_477, _429, _481);
    float _489 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].x, _483);
    float _491 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].y, _485);
    float _493 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[109].z, _487);
    bool _495 = !_383;
    float _513;
    if (!_495)
    {
        float _497 = in.m_68.x;
        float _499 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _501 = _497 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _503 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[11].y, _149);
        float _505 = _503 * _499;
        float _507 = floor(_505);
        float _509 = -_507;
        float _511 = _505 + _509;
        _513 = _511;
        _515 = true;
    }
    else
    {
        float _517 = float(_117);
        float _519 = 1.0 / _517;
        float _521 = _149 * _519;
        _513 = _521;
    }
    _515 = false;
    float _523 = _513;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    bool _541 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _543 = isnan(_523);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = 1.0 / _531;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _563 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_523);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    bool _575 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = isnan(_523);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = 1.0 / _535;
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _591 = _539 * _553;
    bool _593 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _595 = isnan(_523);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _557;
    float _607 = -_551;
    float _609 = _607 + 1.0;
    float _611 = fma(_591, _527, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _613;
    float _617 = -_603;
    float _619 = _617 + 1.0;
    float _621 = _603 * _609;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = -_585;
    float _629 = _627 + 1.0;
    float _631 = 1.0 / _561;
    float _633 = _573 * _619;
    float _635 = _625 * _587;
    float _637 = -_573;
    float _639 = _637 + 1.0;
    float _641 = _551 * _629;
    float _643 = _611 * _633;
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _647 = _523 + _645;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _651 = _523 + _649;
    float _653 = _615 * _605;
    bool _655 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _657 = isnan(_523);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _671 = fma(_635, _647, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _673 = fma(_639, (*spvDescriptorSet0.vp_c9)._m0[115].x, _643);
    float _675 = fma(_653, _651, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _677 = -_665;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _683 = _523 + _681;
    float _685 = _669 * _631;
    float _687 = fma(_671, _621, _673);
    float _689 = _585 * _679;
    float _691 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _693 = fma(_685, _683, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _695 = fma(_675, _641, _687);
    float _697 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = fma(_693, _689, _695);
    float _703 = _493 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _705 = _697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[119].x, _701);
    float _709 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _707 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _699;
    out.m_72.y = _705;
    out.m_72.z = _709;
    out.m_72.w = _711;
    bool _713 = !_589;
    float _731;
    if (!_713)
    {
        float _715 = in.m_68.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _149);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_117);
        float _737 = 1.0 / _735;
        float _739 = _149 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _761 = _741 + _759;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _781 = _779 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _783 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _785 = isnan(_741);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_757;
    float _797 = _795 + 1.0;
    float _799 = 1.0 / _777;
    float _801 = _793 * _797;
    float _803 = -_793;
    float _805 = _803 + 1.0;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _807;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = 1.0 / _781;
    float _815 = _773 * _805;
    float _817 = -_773;
    float _819 = _817 + 1.0;
    float _821 = _745 * _799;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _823;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _827;
    float _831 = fma(_809, _821, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _833 = fma(_825, _821, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _835 = fma(_829, _821, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _761 * _813;
    float _839 = _831 * _815;
    float _841 = _833 * _815;
    float _843 = _835 * _815;
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _851 = _849 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _855 = _853 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _857 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].x, _839);
    float _859 = fma(_847, _837, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _861 = fma(_851, _837, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _863 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].y, _841);
    float _865 = fma(_855, _837, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _867 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[123].z, _843);
    float _869 = fma(_859, _801, _857);
    float _871 = fma(_861, _801, _863);
    float _873 = fma(_865, _801, _867);
    float _875 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].x, _869);
    float _877 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].y, _871);
    float _879 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[125].z, _873);
    bool _881 = !_811;
    float _899;
    if (!_881)
    {
        float _883 = in.m_68.x;
        float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _887 = _883 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[11].w, _149);
        float _891 = _889 * _885;
        float _893 = floor(_891);
        float _895 = -_893;
        float _897 = _891 + _895;
        _899 = _897;
        _901 = true;
    }
    else
    {
        float _903 = float(_117);
        float _905 = 1.0 / _903;
        float _907 = _149 * _905;
        _899 = _907;
    }
    _901 = false;
    float _909 = _899;
    float _911 = in.m_56.x;
    float _913 = in.m_56.y;
    float _915 = in.m_56.z;
    float _917 = _913 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = _913 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _921 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _923 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[6].x, _919);
    float _925 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[4].z, _921);
    float _927 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _929 = _925 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _931 = _927 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _933 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _935 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _937 = floor(_933);
    float _939 = floor(_935);
    float _941 = -_937;
    float _943 = _933 + _941;
    float _945 = -_939;
    float _947 = _935 + _945;
    float2 _5630 = float2(_943, _947);
    float _949 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5630, float2(0.0), isnan(_5630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5630, float2(0.0), isnan(_5630)), level(0.0)).x;
    float _951 = in.m_68.x;
    float _953 = in.m_68.y;
    float _955 = in.m_68.z;
    float _957 = in.m_68.w;
    float _959 = _913 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _961 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _963 = log2(_961);
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _967 = _965 != 0;
    float _969 = fma(_911, (*spvDescriptorSet0.vp_c10)._m0[5].x, _959);
    float _971 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _973 = fma(_915, (*spvDescriptorSet0.vp_c10)._m0[5].z, _969);
    float _975 = float(_117);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _981 = int(_979);
    float _983 = _973 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _985 = _387 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _987 = as_type<int>(_911);
    float _989 = _969;
    float _991 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_967)
    {
        _987 = 0;
    }
    int _993 = _987;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _997 = _993;
    if (!_967)
    {
        _997 = 1;
    }
    int _999 = _997;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1003 = 1.0 / _975;
    float _1005 = _427 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1007 = _953 * 2.0;
    float _1009 = _951 * 2.0;
    float _1011 = _955 * 2.0;
    float _1013 = _951 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1015 = _953 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1017 = floor(_1007);
    float _1019 = -_977;
    float _1021 = fma(_1013, 2.0, _1019);
    float _1023 = fma(_1015, -2.0, _971);
    float _1025 = -_149;
    float _1027 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1021);
    float _1029 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1023);
    float _1031 = floor(_1009);
    float _1033 = _951 + (-0.5);
    float _1035 = _1003 * _149;
    float _1037 = floor(_1011);
    bool _1039 = _1017 > 0.0;
    float _1041 = _951 + _953;
    bool _1043 = _1017 >= 0.0;
    bool _1045 = isnan(_1017);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan(0.0);
    bool _1051 = _1047 || _1049;
    bool _1053 = _999 != 1;
    float _1055 = _1041 + (-1.0);
    bool _1057 = _1031 >= 0.0;
    bool _1059 = isnan(_1031);
    bool _1061 = _1057 || _1059;
    bool _1063 = isnan(0.0);
    bool _1065 = _1061 || _1063;
    float _1067 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1069 = int(_1067);
    bool _1071 = _1031 > 0.0;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1075 = _1051 ? 0 : 1;
    float _1077 = _1065 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1079 = _1037 >= 0.0;
    bool _1081 = isnan(_1037);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    bool _1089 = _1037 > 0.0;
    int _1091 = ~_1075;
    int _1093 = _1091 + 1;
    int _1095 = _1093 + 1;
    int _1097 = _1095;
    float _1099 = _1077;
    int _1101 = 2;
    if (!_1039)
    {
        int _1103 = ~_1075;
        int _1105 = _1103 + 1;
        _1097 = _1105;
    }
    int _1107 = _1097;
    int _1109 = _1087 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1121 = _1119 != 0;
    if (!_1053)
    {
        _989 = _953;
    }
    float _1123 = _989;
    float _1125 = _1123;
    if (_1053)
    {
        _1125 = _951;
    }
    float _1127 = _1125;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1131 = !_1117;
    int _1133 = _1131 ? 0 : 1;
    bool _1135 = !_1113;
    int _1137 = _1135 ? 0 : 1;
    bool _1139 = !_1121;
    int _1141 = _1139 ? 0 : 1;
    int _1143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1145 = _1143 != 0;
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1149 = _1147 != 0;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1153 = _1151 != 0;
    int _1155 = ~as_type<int>(_1077);
    int _1157 = _1155 + 1;
    int _1159 = _1157 + 1;
    int _1161 = _1159;
    float _1163 = _1127;
    if (!_1071)
    {
        int _1165 = ~as_type<int>(_1077);
        int _1167 = _1165 + 1;
        _1161 = _1167;
    }
    int _1169 = _1161;
    int _1171 = ~_1109;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    int _1177 = _1175;
    if (!_1053)
    {
        _1099 = _955;
    }
    float _1179 = _1099;
    float _1181 = _1179;
    if (!_1089)
    {
        int _1183 = ~_1109;
        int _1185 = _1183 + 1;
        _1177 = _1185;
    }
    int _1187 = _1177;
    float _1189 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1129);
    if (_1053)
    {
        _1181 = _953;
    }
    float _1191 = _1181;
    bool _1193 = !_1149;
    int _1195 = _1193 ? 0 : 1;
    float _1197 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1189);
    bool _1199 = !_1145;
    int _1201 = _1199 ? 0 : 1;
    float _1203 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[83].w, _995);
    float _1205 = _1191;
    if (!_1053)
    {
        _1163 = _953;
    }
    float _1207 = _1163;
    int _1209 = abs(_1195);
    float _1211 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1203);
    int _1213 = abs(_1201);
    float _1215 = _1207;
    if (!_1053)
    {
        _1205 = _955;
    }
    float _1217 = _1205;
    float _1219 = _1217;
    if (_1053)
    {
        _1215 = _951;
    }
    float _1221 = _1215;
    if (_1053)
    {
        _1219 = _953;
    }
    float _1223 = _1219;
    float _1225 = float(_1069);
    float _1227 = _1221 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1229 = float(_1169);
    float _1231 = _1223 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = float(_1209);
    float _1235 = 1.0 / _1225;
    float _1237 = float(_1213);
    float _1239 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1241 = float(_1187);
    float _1243 = -_1001;
    float _1245 = fma(_1227, 2.0, _1243);
    float _1247 = float(_981);
    float _1249 = fma(_1231, -2.0, _1239);
    float _1251 = _1237 * _1241;
    float _1253 = _1233 * _1229;
    float _1255 = _963 * _149;
    float _1257 = in.m_74.x;
    float _1259 = in.m_74.y;
    float _1261 = in.m_74.z;
    float _1263 = 1.0 / _1247;
    float _1265 = _1251 * (-2.0);
    float _1267 = _983 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1269 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1271 = isnan(1.0);
    bool _1273 = _1269 || _1271;
    bool _1275 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1277 = _1273 || _1275;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1281 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1283 = isnan(0.0);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1289 = _1285 || _1287;
    float _1291 = exp2(_1255);
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1295 = 1.0 + _1293;
    float _1297 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1299 = _983 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1301 = fma(_951, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1279);
    float _1303 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1267);
    float _1305 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1297);
    float _1307 = fma(_929, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1299);
    float _1309 = 1.0 / _1295;
    float _1311 = _1235 * _149;
    float _1313 = _1263 * _149;
    float _1315 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1301);
    float _1317 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1305);
    float _1319 = -_149;
    float _1321 = fma(_1319, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1245);
    float _1323 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1249);
    float _1325 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1303);
    float _1327 = -_1291;
    float _1329 = _1327 + 1.0;
    float _1331 = fma(_1265, _1257, _1257);
    bool _1333 = !_1153;
    int _1335 = _1333 ? 0 : 1;
    float _1337 = fma(_1073, _1265, _1073);
    float _1339 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1307);
    float _1341 = _1289 ? _1329 : 0.0;
    float _1343 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1331);
    int _1345 = abs(_1335);
    float _1347 = _955 + _953;
    float _1349 = _1325 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1351 = 1.0;
    if (_1277)
    {
        float _1353 = _1341 * _1309;
        _153 = _1353;
    }
    float _1355 = _153;
    float _1357 = _1339 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1359 = _1347 + (-1.0);
    float _1361 = fma(_1337, _1355, _1343);
    float _1363 = float(_1107);
    float _1365 = _1253 * (-2.0);
    float _1367 = float(_1345);
    float _1369 = _1357 + _1349;
    float _1371 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1373 = 1.0 / _1349;
    float _1375 = fma(_1365, _1259, _1259);
    float _1377 = _1367 * _1363;
    float _1379 = _953 + (-0.5);
    float _1381 = _955 + _951;
    float _1383 = fma(_1371, _1365, _1371);
    float _1385 = fma(_1379, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1375);
    float _1387 = _1381 + (-1.0);
    float _1389 = _1377 * (-2.0);
    float _1391 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _1393 = fma(_1383, _1355, _1385);
    float _1395 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1397 = fma(_1389, _1261, _1261);
    float _1399 = _955 + (-0.5);
    float _1401 = _1393 * 0.15915493667125701904296875;
    float _1403 = fma(_1395, _1389, _1395);
    float _1405 = _1369 * _1373;
    float _1407 = _1405 * 0.5;
    float _1409 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1397);
    float _1411 = _1401 * 6.283185482025146484375;
    float _1413 = cos(_1411);
    float _1415 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _209);
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1407, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = fma(_1403, _1355, _1409);
    float _1423 = _1361 * 0.15915493667125701904296875;
    float _1425 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1427 = _985 * _1415;
    float _1429 = _1421 * 0.15915493667125701904296875;
    float _1431 = _1423 * 6.283185482025146484375;
    float _1433 = cos(_1431);
    float _1435 = _1005 * _1425;
    float _1437 = _983 + _1391;
    float _1439 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1441 = _1401 * 6.283185482025146484375;
    float _1443 = sin(_1441);
    float _1445 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1439);
    float _1447 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1445);
    float _1449 = _1423 * 6.283185482025146484375;
    float _1451 = sin(_1449);
    float _1453 = _1433 * _1413;
    float _1455 = _1447 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _1457 = _1429 * 6.283185482025146484375;
    float _1459 = cos(_1457);
    float _1461 = _1433 * _1443;
    float _1463 = 1.0 / _1419;
    float _1465 = _1451 * _1443;
    float _1467 = _1451 * _1413;
    float _1469 = _1429 * 6.283185482025146484375;
    float _1471 = sin(_1469);
    float _1473 = _1433 * _1459;
    float _1475 = _1451 * _1459;
    float _1477 = _1413 * _1459;
    float _1479 = _1443 * _1459;
    float _1481 = _1473 * _1427;
    float _1483 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1485 = _1463 * _1483;
    float _1487 = _1475 * _1427;
    float _1489 = trunc(_1455);
    int _1491 = int(_1489);
    bool _1493 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1495 = _1485 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1497 = fma(_1471, _1453, _1465);
    float _1499 = -_1461;
    float _1501 = fma(_1471, _1467, _1499);
    float _1503 = -_1467;
    float _1505 = fma(_1471, _1461, _1503);
    float _1507 = fma(_1471, _1465, _1453);
    float _1509 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1511 = -_1427;
    float _1513 = _1471 * _1511;
    float _1515 = fma(_1497, _1435, _1481);
    float _1517 = fma(_1501, _1435, _1487);
    float _1519 = fma(_1477, _1435, _1513);
    float _1521 = fma(_1505, _1509, _1515);
    float _1523 = fma(_1507, _1509, _1517);
    float _1525 = _1437;
    if (!_1493)
    {
        _1101 = 1;
    }
    int _1527 = _1101;
    float _1529 = fma(_1479, _1509, _1519);
    float _1531 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1533 = !_1493;
    int _1535 = _1533 ? 0 : 1;
    float _1537 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1539 = _1521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1541 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1531);
    int _1543 = _1527;
    if (!_1495)
    {
        _1543 = _1535;
    }
    int _1545 = _1543;
    float _1547 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1537);
    float _1549 = fma(_1529, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1539);
    float _1551 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1541);
    int _1553 = _1545 << 6;
    float _1555 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1547);
    int _1557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1559 = _1557 != 0;
    int _1561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1563 = _1561 != 0;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1567 = _1565 != 0;
    int _1569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1571 = _1569 != 0;
    float _1573 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1575 = _1553 + 56;
    uint _1578 = uint(int(uint(_1575) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1596 = fma(_1523, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1549);
    float _1598 = _931 + _1573;
    bool _1600 = !_1563;
    int _1602 = _1600 ? 0 : 1;
    float _1604 = _929 + _1594;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1610 = _1598 + _1608;
    int _1612 = _1553 + 48;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    uint _1616 = uint(int(uint(int(_1614)) >> uint(2)));
    int _1618 = int(_1614) & 3;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[int(_1616)][_1618];
    int _1622 = int(_1614) + 1;
    uint _1624 = uint(int(uint(_1622) >> uint(2)));
    int _1626 = _1622 & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1632 = _1604 + _1630;
    float _1634 = _983 + _1606;
    float _1636 = _1610 * _1610;
    bool _1638 = !_1559;
    int _1640 = _1638 ? 0 : 1;
    bool _1642 = !_1567;
    int _1644 = _1642 ? 0 : 1;
    float _1646 = fma(_1632, _1632, _1636);
    int _1648 = _1553 + 64;
    uint _1650 = uint(int(uint(_1648) >> uint(2)));
    uint _1652 = uint(int(uint(int(_1650)) >> uint(2)));
    int _1654 = int(_1650) & 3;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[int(_1652)][_1654];
    int _1658 = int(_1650) + 1;
    uint _1660 = uint(int(uint(_1658) >> uint(2)));
    int _1662 = _1658 & 3;
    float _1664 = (*spvDescriptorSet0.vp_c15)._m0[int(_1660)][_1662];
    float _1666 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    bool _1668 = !_1571;
    int _1670 = _1668 ? 0 : 1;
    float _1672 = sqrt(_1646);
    int _1674 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1676 = _1491 + _1674;
    int _1678 = _1676 + 1;
    float _1680 = fma(_929, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1666);
    int _1682 = _1553 + 72;
    uint _1684 = uint(int(uint(_1682) >> uint(2)));
    uint _1686 = uint(int(uint(int(_1684)) >> uint(2)));
    int _1688 = int(_1684) & 3;
    float _1690 = (*spvDescriptorSet0.vp_c15)._m0[int(_1686)][_1688];
    int _1692 = int(_1684) + 1;
    uint _1694 = uint(int(uint(_1692) >> uint(2)));
    int _1696 = _1692 & 3;
    float _1698 = (*spvDescriptorSet0.vp_c15)._m0[int(_1694)][_1696];
    float _1700 = fma(_931, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1680);
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1704 = _1553 + 96;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    uint _1708 = uint(int(uint(int(_1706)) >> uint(2)));
    int _1710 = int(_1706) & 3;
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[int(_1708)][_1710];
    int _1714 = int(_1706) + 1;
    uint _1716 = uint(int(uint(_1714) >> uint(2)));
    int _1718 = _1714 & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    float _1722 = trunc(_1702);
    int _1724 = int(_1722);
    bool _1726 = _1672 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1728 = _1553 + 104;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[int(_1740)][_1742];
    float _1746 = _1606;
    float _1748 = _1598;
    float _1750 = _1604;
    int _1752 = _1678;
    float _1754 = as_type<float>(_1545);
    if (!_1726)
    {
        _1746 = _1598;
    }
    float _1756 = _1746;
    int _1758 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1760 = _1724 + _1758;
    int _1762 = _1760 + 1;
    float _1764 = _1756;
    int _1766 = as_type<int>(_1584);
    if (!_1726)
    {
        _1748 = _1634;
    }
    float _1768 = _1748;
    bool _1770 = !_1726;
    float _1772 = _1768;
    int _1774 = as_type<int>(_1628);
    int _1776 = as_type<int>(_1690);
    if (!_1770)
    {
        float _1778 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1780 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1782 = _1672 + _1780;
        float _1784 = _1634 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = rsqrt(_1646);
        float _1788 = _1782 * _1778;
        float _1790 = _1788 * 0.15915493667125701904296875;
        float _1792 = _1790 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = _1790 * 6.283185482025146484375;
        float _1798 = cos(_1796);
        float _1800 = fma(_1794, _1784, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1802 = _1786 * _1800;
        float _1804 = _1798 + (-1.0);
        float _1806 = fma(_1632, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1808 = fma(_1610, _1802, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = fma(_1634, _1798, _1810);
        _1772 = _1812;
        _1750 = _1806;
        _1764 = _1808;
    }
    float _1814 = _1772;
    float _1816 = _1750;
    float _1818 = _1764;
    float _1820 = -_983;
    float _1822 = _1820 + _1814;
    bool _1824 = _1678 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1826 = _1553 + 80;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c15)._m0[int(_1838)][_1840];
    int _1844 = _1678 | _1762;
    float _1846 = -_929;
    float _1848 = _1846 + _1816;
    float _1850 = _1822 * _1822;
    float _1852 = _1437 * _1720;
    bool _1854 = _1844 < 0;
    bool _1856 = _1854 || _1824;
    float _1858 = -_931;
    float _1860 = _1858 + _1818;
    float _1862 = fma(_1848, _1848, _1850);
    float _1864 = fma(_929, _1712, _1852);
    bool _1866 = _1762 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1868 = _1866 || _1856;
    float _1870 = _1437 * _1628;
    float _1872 = fma(_1860, _1860, _1862);
    float _1874 = fma(_931, _1736, _1864);
    float _1876 = _1437 * _1664;
    float _1878 = fma(_929, _1620, _1870);
    float _1880 = sqrt(_1872);
    float _1882 = _1874 + _1744;
    float _1884 = fma(_929, _1656, _1876);
    float _1886 = fma(_931, _1584, _1878);
    bool _1888 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1890 = isnan(0.5);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1896 = _1892 || _1894;
    float _1898 = fma(_931, _1690, _1884);
    int _1900 = as_type<int>(_1876);
    float _1902 = _1816;
    float _1904 = _1814;
    float _1906 = _1818;
    float _1908 = _1886;
    float _1910 = _1822;
    if (!_1868)
    {
        int _1912 = _1762 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1914 = _1912 + _1678;
        _1752 = _1914;
    }
    int _1916 = _1752;
    float _1918 = _1850;
    if (!_1868)
    {
        float _1920 = floor(_1455);
        _1918 = _1920;
    }
    float _1922 = _1918;
    float _1924 = _1886 + _1592;
    float _1926 = _1898 + _1698;
    if (!_1868)
    {
        int _1928 = _1916 << 2;
        _1900 = _1928;
    }
    int _1930 = _1900;
    if (!_1868)
    {
        uint _1932 = uint(int(uint(_1916) >> uint(2)));
        _1774 = int(_1932);
    }
    int _1934 = _1774;
    bool _1936 = _1880 > 0.0;
    float _1938 = 1.0 / _1882;
    float _1940 = as_type<float>(_1934);
    if (!_1868)
    {
        int _1942 = 12 & _1930;
        _1766 = _1942;
    }
    int _1944 = _1766;
    if (!_1868)
    {
        int _1946 = _1934 << 4;
        int _1948 = _1946 + _1944;
        _1776 = _1948;
    }
    int _1950 = _1776;
    bool _1952 = !_1936;
    if (!_1952)
    {
        float _1954 = _213 * _213;
        float _1956 = rsqrt(_1872);
        float _1958 = fma(_211, _211, _1954);
        float _1960 = fma(_215, _215, _1958);
        float _1962 = sqrt(_1960);
        float _1964 = _1848 * _1956;
        float _1966 = _1822 * _1956;
        float _1968 = _1860 * _1956;
        bool _1970 = _1962 > 0.0;
        bool _1972 = !_1970;
        _1940 = _1962;
        _1908 = _1960;
        _1910 = _1966;
        if (!_1972)
        {
            float _1974 = rsqrt(_1960);
            float _1976 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1978 = _213 * _1974;
            float _1980 = _211 * _1974;
            float _1982 = _1966 * _1978;
            float _1984 = _215 * _1974;
            float _1986 = fma(_1964, _1980, _1982);
            float _1988 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1990 = fma(_1968, _1984, _1986);
            float _1992 = _1990 * _1988;
            float _1994 = fma(_211, _1992, _1816);
            float _1996 = fma(_213, _1992, _1814);
            float _1998 = fma(_215, _1992, _1818);
            _1902 = _1994;
            _1904 = _1996;
            _1906 = _1998;
            _1940 = _1992;
            _1908 = _1974;
        }
    }
    float _2000 = _1902;
    float _2002 = _1904;
    float _2004 = _1906;
    float _2006 = _1940;
    float _2008 = _1908;
    float _2010 = _1910;
    float _2012 = _2008;
    float _2014 = _2006;
    float _2016 = _2004;
    if (_1896)
    {
        _2012 = _2000;
    }
    float _2018 = _2012;
    float _2020 = _2018;
    if (_1896)
    {
        _2014 = _2002;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (!_1896)
    {
        float _2026 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2028 = _983 + _2026;
        float _2030 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2032 = _929 + _2030;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2036 = -_983;
        float _2038 = _2036 + _2002;
        float _2040 = _2028 * _2028;
        float _2042 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2044 = _931 + _2042;
        float _2046 = -_931;
        float _2048 = _2046 + _2004;
        float _2050 = fma(_2032, _2032, _2040);
        float _2052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2054 = fma(_2044, _2044, _2050);
        float _2056 = sqrt(_2054);
        float _2058 = _2034 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2060 = precise::min(_2056, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2062 = _2060 * _2052;
        float _2064 = _2058 * _2062;
        float _2066 = -_929;
        float _2068 = _2066 + _2000;
        float _2070 = fma(_2038, _2064, _983);
        float _2072 = fma(_2068, _2064, _929);
        float _2074 = fma(_2048, _2064, _931);
        _2024 = _2070;
        _2020 = _2072;
        _2016 = _2074;
    }
    float _2076 = _2024;
    float _2078 = _2020;
    float _2080 = _2016;
    int _2082 = _1553 + 88;
    uint _2084 = uint(int(uint(_2082) >> uint(2)));
    uint _2086 = uint(int(uint(int(_2084)) >> uint(2)));
    int _2088 = int(_2084) & 3;
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[int(_2086)][_2088];
    int _2092 = int(_2084) + 1;
    uint _2094 = uint(int(uint(_2092) >> uint(2)));
    int _2096 = _2092 & 3;
    float _2098 = (*spvDescriptorSet0.vp_c15)._m0[int(_2094)][_2096];
    float _2100 = _1924 * _1938;
    float _2102 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2104 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = _1926 * _1938;
    float _2108 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2110 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2102);
    float _2112 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2114 = _2010;
    if (!_1868)
    {
        int _2116 = _1950 + 400;
        uint _2118 = uint(int(uint(_2116) >> uint(2)));
        uint _2120 = uint(int(uint(int(_2118)) >> uint(2)));
        int _2122 = int(_2118) & 3;
        float _2124 = (*spvDescriptorSet0.vp_c15)._m0[int(_2120)][_2122];
        _2114 = _2124;
    }
    float _2126 = _2114;
    bool _2128 = _2100 >= 0.0;
    float _2130 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2110);
    float _2132 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2108);
    float _2134 = _2076 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2112);
    float _2138 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _2140 = _2100 <= 1.0;
    bool _2142 = _2140 && _2128;
    float _2144 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2132);
    float _2146 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2134);
    float _2148 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2152 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2154 = _2106 >= 0.0;
    bool _2156 = _2154 && _2142;
    float _2158 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2160 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2150);
    float _2162 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2164 = _2152 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    bool _2166 = _2106 <= 1.0;
    bool _2168 = _2166 && _2156;
    float _2170 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2172 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2160);
    float _2174 = _1437 * _1842;
    float _2176 = -_2164;
    float _2178 = fma(_2176, _2162, 1.0);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2182 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2172);
    float _2184 = fma(_929, _1834, _2174);
    float _2186 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2188 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2180);
    float _2190 = 1.0 / _2182;
    float _2192 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2186);
    float _2194 = _2184;
    if (_2168)
    {
        float _2196 = float(_1545);
        _1754 = _2196;
    }
    float _2198 = _1754;
    float _2200 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2188);
    float _2202 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2192);
    float _2204 = log2(_2178);
    float _2206 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2208 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2202);
    float _2210 = fma(_931, _2090, _2184);
    float _2212 = _1744;
    float _2214 = _2198;
    float _2216 = _2206;
    if (!_1868)
    {
        float _2218 = floor(_1702);
        _2212 = _2218;
    }
    float _2220 = _2212;
    float _2222 = _2210 + _2098;
    float _2224 = _2208 * _2190;
    float _2226 = _2206 * _2190;
    float _2228 = _2222 * _1938;
    float _2230 = fma(_2226, -0.5, 0.5);
    float _2232 = _2180;
    if (_2168)
    {
        float _2234 = rint(_2198);
        float _2236 = precise::max(_2234, 0.0);
        uint _2238 = uint(_2236);
        uint _2240 = clamp(_2238, 0u, 65535u);
        _2232 = as_type<float>(_2240);
    }
    float _2242 = _2232;
    float _2244 = _2204 * 0.693147182464599609375;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2248 = _1938;
    float _2250 = _2126;
    if (!_1868)
    {
        float _2252 = rint(_2126);
        float _2254 = precise::max(_2252, 0.0);
        uint _2256 = uint(_2254);
        uint _2258 = clamp(_2256, 0u, 65535u);
        _2248 = as_type<float>(_2258);
    }
    float _2260 = _2248;
    float _2262 = _2220;
    if (!_1868)
    {
        float _2264 = -_2220;
        float _2266 = _1702 + _2264;
        _2194 = _2266;
    }
    float _2268 = _2194;
    float _2270 = fma(_2224, 0.5, 0.5);
    float _2272 = _2268;
    if (!_1868)
    {
        float _2274 = -_1922;
        float _2276 = _1455 + _2274;
        _2262 = _2276;
    }
    float _2278 = _2262;
    float _2280 = _2106;
    if (_2168)
    {
        float3 _7752 = float3(_2100, _2106, float(as_type<int>(_2242)));
        float3 _7756 = select(_7752, float3(0.0), isnan(_7752));
        float _2282 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _7756.xy, uint(rint(_7756.z)), _2228, level(0.0));
        _2280 = _2282;
    }
    float _2284 = _2280;
    float3 _7766 = float3(_2270, _2230, _2246);
    float _2286 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7766, float3(0.0), isnan(_7766)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7766, float3(0.0), isnan(_7766)), level(0.0)).x;
    float3 _7775 = float3(_2270, _2230, _2246);
    float4 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7775, float3(0.0), isnan(_7775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7775, float3(0.0), isnan(_7775)), level(0.0)).xyzw;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2289.w;
    float _2299 = _1922;
    if (!_1868)
    {
        float3 _7798 = float3(_2278, _2268, float(as_type<int>(_2260)));
        float3 _7800 = select(_7798, float3(0.0), isnan(_7798));
        float _2301 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7800.xy, uint(rint(_7800.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7800.xy, uint(rint(_7800.z)), level(0.0)).x;
        _2299 = _2301;
    }
    float _2303 = _2299;
    if (_1868)
    {
        _2214 = 1.0;
    }
    float _2305 = _2214;
    float _2307 = _2305;
    if (!_1868)
    {
        int _2309 = _1916 << 4;
        int _2311 = _2309 + 2048;
        uint _2313 = uint(int(uint(_2311) >> uint(2)));
        uint _2315 = uint(int(uint(int(_2313)) >> uint(2)));
        int _2317 = int(_2313) & 3;
        float _2319 = (*spvDescriptorSet0.vp_c15)._m0[int(_2315)][_2317];
        int _2321 = int(_2313) + 1;
        uint _2323 = uint(int(uint(_2321) >> uint(2)));
        int _2325 = _2321 & 3;
        float _2327 = (*spvDescriptorSet0.vp_c15)._m0[int(_2323)][_2325];
        int _2329 = _2311 + 8;
        uint _2331 = uint(int(uint(_2329) >> uint(2)));
        uint _2333 = uint(int(uint(int(_2331)) >> uint(2)));
        int _2335 = int(_2331) & 3;
        float _2337 = (*spvDescriptorSet0.vp_c15)._m0[int(_2333)][_2335];
        int _2339 = int(_2331) + 1;
        uint _2341 = uint(int(uint(_2339) >> uint(2)));
        int _2343 = _2339 & 3;
        float _2345 = (*spvDescriptorSet0.vp_c15)._m0[int(_2341)][_2343];
        float _2347 = _1437 * _2327;
        float _2349 = fma(_929, _2319, _2347);
        float _2351 = fma(_931, _2337, _2349);
        float _2353 = _2351 + _2345;
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -_2355;
        float _2359 = _2357 + _2303;
        float _2361 = fma(_2359, 500.0, 1.5);
        float _2363 = exp2(_2361);
        float _2365 = 0.0 + _2363;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _1525 = _2347;
        _2307 = _2367;
    }
    float _2369 = _1525;
    float _2371 = _2307;
    float _2373 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2375 = _2076 + _2373;
    float _2377 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2379 = _2078 + _2377;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2383 = _2080 + _2381;
    float _2385 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _2387 = int(_2385);
    float _2389 = _2375 * _2375;
    int _2391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2393 = _2391 != 0;
    float _2395 = fma(_2379, _2379, _2389);
    float _2397 = fma(_2383, _2383, _2395);
    float _2399 = rsqrt(_2397);
    float _2401 = _2375;
    if (_2393)
    {
        float _2403 = in.m_68.x;
        _991 = _2403;
    }
    float _2405 = _991;
    float _2407 = _2405;
    if (!_2393)
    {
        float _2409 = in.m_68.y;
        _2407 = _2409;
    }
    float _2411 = _2407;
    float _2413 = sqrt(_2397);
    float _2415 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2417 = _2379 * _2415;
    float _2419 = _2383 * _2415;
    float _2421 = _2417 * _2417;
    float _2423 = _2419 * _2419;
    float _2425 = _2421 + _2423;
    float _2427 = sqrt(_2425);
    bool _2429 = _2427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2433 = _2427 + _2431;
    float _2435 = _2369;
    float _2437 = _2433;
    float _2439 = _2425;
    float _2441 = _2417;
    float _2443 = _2421;
    float _2445 = _2423;
    if (_2429)
    {
        float _2447 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2435 = _2447;
    }
    float _2449 = _2435;
    if (_2429)
    {
        float _2451 = rsqrt(_2425);
        _2272 = _2451;
    }
    float _2453 = _2272;
    float _2455 = _2453;
    if (_2429)
    {
        float _2457 = _2433 * _2449;
        _2437 = _2457;
    }
    float _2459 = _2437;
    float _2461 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2463 = int(_2461);
    if (_2429)
    {
        float _2465 = _2459 * 0.15915493667125701904296875;
        _2250 = _2465;
    }
    float _2467 = _2250;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = _2303;
    if (_2429)
    {
        float _2473 = _2467 * 6.283185482025146484375;
        float _2475 = sin(_2473);
        _2471 = _2475;
    }
    float _2477 = _2471;
    float _2479 = precise::max(0.0, _2469);
    float _2481 = _929;
    if (_2429)
    {
        float _2483 = _2467 * 6.283185482025146484375;
        float _2485 = cos(_2483);
        _2481 = _2485;
    }
    float _2487 = _2481;
    float _2489 = -_2415;
    float _2491 = -_2479;
    float _2493 = fma(_2375, _2489, _2491);
    float _2495 = float(uint(_2387));
    if (_2429)
    {
        float _2497 = _2493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2401 = _2497;
    }
    float _2499 = _2401;
    float _2501 = 1.0 / _2495;
    float _2503 = _2477;
    float _2505 = _2499;
    if (_2429)
    {
        float _2507 = fma(_2477, _2499, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2503 = _2507;
    }
    float _2509 = _2503;
    float _2511 = float(uint(_2463));
    float _2513 = _2509;
    if (_2429)
    {
        float _2515 = _2453 * _2509;
        _2439 = _2515;
    }
    float _2517 = _2439;
    if (!_2429)
    {
        _2513 = _2493;
    }
    float _2519 = _2513;
    float _2521 = _2519;
    if (_2429)
    {
        float _2523 = _2487 + (-1.0);
        _2505 = _2523;
    }
    float _2525 = _2505;
    float _2527 = _2525;
    if (_2429)
    {
        float _2529 = _2417 * _2517;
        _2441 = _2529;
    }
    float _2531 = _2441;
    if (!_2429)
    {
        _2455 = _2419;
    }
    float _2533 = _2455;
    float _2535 = _2533;
    if (_2429)
    {
        float _2537 = _2419 * _2517;
        _2535 = _2537;
    }
    float _2539 = _2535;
    if (_2429)
    {
        float _2541 = _2525 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2527 = _2541;
    }
    float _2543 = _2527;
    if (_2429)
    {
        float _2545 = _2531 * _2531;
        _2443 = _2545;
    }
    float _2547 = _2443;
    float _2549 = 1.0 / _2511;
    if (_2429)
    {
        float _2551 = _2539 * _2539;
        _2445 = _2551;
    }
    float _2553 = _2445;
    if (_2429)
    {
        float _2555 = fma(_2493, _2487, _2543);
        _2521 = _2555;
    }
    float _2557 = _2521;
    float _2559 = fma(_2557, _2557, _2547);
    float _2561 = trunc(_1311);
    int _2563 = int(_2561);
    float _2565 = _2559 + _2553;
    float _2567 = rsqrt(_2565);
    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2571 = fma(_2413, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2569);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    int _2575 = as_type<int>(_2549) + (-2);
    float _2577 = -_2573;
    float _2579 = _2577 + 1.0;
    int _2581 = as_type<int>(_2501) + (-2);
    float _2583 = float(uint(_2563));
    float _2585 = trunc(_1313);
    int _2587 = int(_2585);
    float _2589 = as_type<float>(_2581) * _2583;
    float _2591 = _2567 * _2531;
    float _2593 = abs(_2579);
    float _2595 = log2(_2593);
    float _2597 = _2567 * _2557;
    float _2599 = _2567 * _2539;
    float _2601 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    int _2603 = ~_2387;
    int _2605 = _2603 + 1;
    float _2607 = -_2601;
    float _2609 = fma(_2597, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2607);
    float _2611 = trunc(_2589);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    float _2617 = float(uint(_2587));
    float _2619 = -_2599;
    float _2621 = fma(_2619, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2609);
    float _2623 = as_type<float>(_2575) * _2617;
    float _2625 = fma(_2621, -0.5, 0.5);
    float _2627 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2629 = exp2(_2627);
    int _2631 = _2605 * int(_2615);
    int _2633 = _2631 + _2563;
    float _2635 = fma(_2621, 0.5, 0.5);
    float _2637 = _2597 + 1.0;
    float _2639 = sqrt(_2625);
    float _2641 = fma(_2635, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2643 = float(uint(_2633));
    int _2645 = ~_2463;
    int _2647 = _2645 + 1;
    float _2649 = fma(_2635, _2641, -0.212114393711090087890625);
    float _2651 = as_type<float>(_2581) * _2643;
    float _2653 = trunc(_2623);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = -_2597;
    float _2661 = fma(_2629, _2637, _2659);
    float _2663 = fma(_2635, _2649, 1.570728778839111328125);
    float _2665 = fma(_2661, 0.5, 0.5);
    float _2667 = _2597;
    if (_2393)
    {
        _2667 = 1.0;
    }
    float _2669 = _2667;
    float _2671 = trunc(_2651);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    float _2677 = _2639 * 0.636619746685028076171875;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2683 = -_2663;
    float _2685 = fma(_2677, _2683, 1.0);
    float _2687 = _2669;
    if (!_2393)
    {
        _2687 = 7.345489978790283203125;
    }
    float _2689 = _2687;
    int _2691 = _2647 * int(_2657);
    int _2693 = _2691 + _2587;
    float _2695 = 1.0 / _2681;
    float2 _8393 = float2(_2685, _2665);
    float3 _2699 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8393, float2(0.0), isnan(_8393)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8393, float2(0.0), isnan(_8393)), level(0.0)).xyz;
    float _2701 = _2699.x;
    float _2703 = _2699.y;
    float _2705 = _2699.z;
    float _2707 = _2689 * _951;
    int _2709 = ~_2387;
    int _2711 = _2709 + 1;
    float _2713 = -_1317;
    float _2715 = _2713 + 1.0;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2719 = _2717 != 0;
    float _2721 = -_1197;
    float _2723 = _2721 + 1.0;
    bool _2725 = _957 > 0.5;
    float _2727 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2729 = float(uint(_2693));
    float _2731 = floor(_2707);
    int _2733 = int(_2615) + int(_2675);
    float _2735 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2737 = as_type<float>(_2575) * _2729;
    float _2739 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2735);
    int _2741 = _2711 * _2733;
    int _2743 = _2741 + _2563;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2749 = as_type<float>(_2675);
    if (_2393)
    {
        _2749 = 1.0;
    }
    float _2751 = _2749;
    float _2753 = trunc(_2737);
    float _2755 = precise::max(_2753, 0.0);
    uint _2757 = uint(_2755);
    int _2759 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2761 = _2759 != 0;
    float _2763 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2739);
    float _2765 = _2751;
    if (!_2393)
    {
        _2765 = 1.2345600128173828125;
    }
    float _2767 = _2765;
    float _2769 = -_2731;
    float _2771 = _2707 + _2769;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2775 = _909 + _2773;
    bool _2777 = uint(_2743) >= uint(_2387);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2779;
    bool _2783 = _951 > 0.5;
    float _2785 = 1.0 / _2747;
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2789 = _2787 != 0;
    float _2791 = _2411 * _2767;
    bool _2793 = !_2777;
    int _2795 = _2793 ? 0 : (-1);
    float _2797 = _2781 * _2695;
    bool _2799 = _953 > 0.5;
    float _2801 = -_949;
    float _2803 = _2801 + 1.0;
    float _2805 = float(_2387);
    float _2807 = floor(_2791);
    int _2809 = ~_2463;
    int _2811 = _2809 + 1;
    float _2813 = fma(_2797, _2775, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2815 = !_2789;
    int _2817 = _2815 ? 0 : 1;
    out.m_76.x = _2078;
    out.m_76.y = _2076;
    out.m_76.z = _2080;
    bool _2819 = _955 > 0.5;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2825 = _2771 * _2805;
    float _2827 = float(_2563);
    float _2829 = _2823 * _2785;
    int _2831 = int(_2657) + int(_2757);
    float _2833 = exp2(_2727);
    bool _2835 = _2827 >= _2805;
    bool _2837 = isnan(_2827);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan(_2805);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    bool _2847 = !_2719;
    int _2849 = _2847 ? 0 : 1;
    int _2851 = _2811 * _2831;
    int _2853 = _2851 + _2587;
    float _2855 = -_2807;
    float _2857 = _2791 + _2855;
    float _2859 = float(_2587);
    float _2861 = trunc(_2825);
    int _2863 = int(_2861);
    bool _2865 = uint(_2853) >= uint(_2463);
    float _2867 = float(_2463);
    int _2869 = ~_2733;
    int _2871 = _2869 + _2795;
    int _2873 = _2871 + 1;
    float _2875 = _2805 * _1035;
    int _2877 = abs(_2817);
    float _2879 = trunc(_2845);
    int _2881 = int(_2879);
    bool _2883 = !_2865;
    int _2885 = _2883 ? 0 : (-1);
    float _2887 = _2867 * _1035;
    int _2889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2891 = _2889 != 0;
    float _2893 = _2857 * _2867;
    bool _2895 = _2859 >= _2867;
    bool _2897 = isnan(_2859);
    bool _2899 = _2895 || _2897;
    bool _2901 = isnan(_2867);
    bool _2903 = _2899 || _2901;
    float _2905 = float(_2903);
    int _2907 = _2387 * _2873;
    int _2909 = _2907 + _2563;
    int _2911 = ~_2831;
    int _2913 = _2911 + _2885;
    int _2915 = _2913 + 1;
    int _2917 = _2863 * _2877;
    int _2919 = _2917 + _2563;
    bool _2921 = !_2891;
    int _2923 = _2921 ? 0 : 1;
    float _2925 = trunc(_2905);
    int _2927 = int(_2925);
    bool _2929 = _2387 == 0;
    int _2931 = _2463 * _2915;
    int _2933 = _2931 + _2587;
    float _2935 = -_199;
    int _2937 = _2783 ? as_type<int>(_2935) : as_type<int>(_199);
    float _2939 = -_2833;
    float _2941 = _2939 + 1.0;
    bool _2943 = !_2929;
    int _2945 = _2943 ? _2909 : (-1);
    int _2947 = ~_2881;
    int _2949 = _2947 + 1;
    int _2951 = _2949 + 1;
    float _2953 = trunc(_2875);
    int _2955 = int(_2953);
    int _2957 = _2387 + (-1);
    float _2959 = _2941 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2961 = _2463 == 0;
    int _2963 = _2945 * _2951;
    int _2965 = abs(_1133);
    float _2967 = _2959 * _2286;
    bool _2969 = !_2961;
    int _2971 = _2969 ? _2933 : (-1);
    int _2973 = _2881 * _2957;
    int _2975 = _2973 + _2963;
    bool _2977 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2979 = isnan(_909);
    bool _2981 = _2977 || _2979;
    bool _2983 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2985 = _2981 || _2983;
    float _2987 = float(_2985);
    float _2989 = trunc(_2893);
    int _2991 = int(_2989);
    int _2993 = ~_2927;
    int _2995 = _2993 + 1;
    int _2997 = _2995 + 1;
    int _2999 = _2975 * _2965;
    bool _3001 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3003 = isnan(_909);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3009 = _3005 || _3007;
    float _3011 = float(_3009);
    float _3013 = -_2987;
    float _3015 = _3013 + 1.0;
    int _3017 = abs(_1137);
    int _3019 = _2971 * _2997;
    bool _3021 = _909 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3023 = isnan(_909);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3029 = _3025 || _3027;
    float _3031 = float(_3029);
    float _3033 = _3011 * _3015;
    float _3035 = -_3011;
    float _3037 = _3035 + 1.0;
    float _3039 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3041 = _909 + _3039;
    int _3043 = abs(_1141);
    float _3045 = _3031 * _3037;
    float _3047 = fma(_2829, _3041, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _3049 = -_3031;
    float _3051 = _3049 + 1.0;
    float _3053 = _2813 * _3045;
    int _3055 = _2955 * _3017;
    int _3057 = _3055 + _2999;
    float _3059 = trunc(_2887);
    int _3061 = int(_3059);
    int _3063 = _2463 + (-1);
    int _3065 = abs(_2849);
    int _3067 = _2919 * _3043;
    int _3069 = _3067 + _3057;
    int _3071 = abs(_2923);
    int _3073 = _2927 * _3063;
    int _3075 = _3073 + _3019;
    int _3077 = abs(_1602);
    int _3079 = _2863 * _3065;
    int _3081 = _3079 + _3069;
    int _3083 = abs(_1640);
    int _3085 = _3075 * _3077;
    bool _3087 = !_2761;
    float _3089 = _3087 ? _199 : as_type<float>(_2937);
    int _3091 = _2991 * _3071;
    int _3093 = _3091 + _2587;
    float _3095 = float(uint(_3081));
    int _3097 = _3061 * _3083;
    int _3099 = _3097 + _3085;
    int _3101 = abs(_1644);
    float _3103 = _3089 + 0.5;
    int _3105 = abs(_1670);
    float _3107 = as_type<float>(_2581) * _3095;
    int _3109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3111 = _3109 != 0;
    float _3113 = fma(_3103, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1027);
    int _3115 = _3093 * _3101;
    int _3117 = _3115 + _3099;
    float _3119 = -_209;
    int _3121 = _2799 ? as_type<int>(_3119) : as_type<int>(_209);
    float _3123 = trunc(_3107);
    float _3125 = precise::max(_3123, 0.0);
    uint _3127 = uint(_3125);
    bool _3129 = !_3111;
    float _3131 = _3129 ? _209 : as_type<float>(_3121);
    float _3133 = fma(_3051, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3053);
    float _3135 = float(uint(_2919));
    int _3137 = _2991 * _3105;
    int _3139 = _3137 + _3117;
    float _3141 = float(uint(_3093));
    float _3143 = _3131 + (-0.5);
    float _3145 = fma(_3047, _3033, _3133);
    float _3147 = as_type<float>(_2581) * _3135;
    float _3149 = float(uint(_3139));
    float _3151 = -_3143;
    float _3153 = -_1029;
    float _3155 = fma(_3151, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3153);
    float _3157 = as_type<float>(_2575) * _3141;
    int _3159 = ~_2387;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[133].x, _3145);
    float _3165 = as_type<float>(_2575) * _3149;
    float _3167 = trunc(_3147);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3175 = _3173 != 0;
    int _3177 = _3161 * int(_3127);
    int _3179 = _3177 + _3081;
    int _3181 = ~_2463;
    int _3183 = _3181 + 1;
    int _3185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3187 = _3185 != 0;
    float _3189 = float(uint(_3179));
    float _3191 = trunc(_3165);
    float _3193 = precise::max(_3191, 0.0);
    uint _3195 = uint(_3193);
    float _3197 = -_199;
    int _3199 = _2819 ? as_type<int>(_3197) : as_type<int>(_199);
    int _3201 = ~_2463;
    int _3203 = _3201 + 1;
    float _3205 = as_type<float>(_2581) * _3189;
    float _3207 = -_209;
    int _3209 = _2725 ? as_type<int>(_3207) : as_type<int>(_209);
    bool _3211 = !_3175;
    float _3213 = _3211 ? _199 : as_type<float>(_3199);
    float _3215 = trunc(_3157);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    int _3221 = _3161 * int(_3171);
    int _3223 = _3221 + _2919;
    bool _3225 = !_3187;
    float _3227 = _3225 ? _209 : as_type<float>(_3209);
    float _3229 = _3213 + 0.5;
    int _3231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3233 = _3231 != 0;
    float _3235 = float(uint(_3223));
    float _3237 = trunc(_3205);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    int _3243 = _3183 * int(_3195);
    int _3245 = _3243 + _3139;
    float _3247 = _3227 + (-0.5);
    float _3249 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1321);
    float _3251 = as_type<float>(_2581) * _3235;
    float _3253 = -_1315;
    float _3255 = _3253 + 1.0;
    float _3257 = float(uint(_3245));
    float _3259 = -_3247;
    float _3261 = -_1323;
    float _3263 = fma(_3259, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3261);
    int _3265 = _3203 * int(_3219);
    int _3267 = _3265 + _3093;
    float _3269 = trunc(_3251);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = -_3255;
    float _3277 = fma(_3089, _3275, _3113);
    float _3279 = as_type<float>(_2575) * _3257;
    float _3281 = fma(_3131, _2715, _3155);
    float _3283 = float(uint(_3267));
    float _3285 = _879 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3287 = -_1211;
    float _3289 = _3287 + 1.0;
    int _3291 = int(_3127) + int(_3241);
    float _3293 = trunc(_3279);
    float _3295 = precise::max(_3293, 0.0);
    uint _3297 = uint(_3295);
    float _3299 = as_type<float>(_2575) * _3283;
    float _3301 = _877 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3303 = ~_2387;
    int _3305 = _3303 + 1;
    float _3307 = -_2723;
    float _3309 = fma(_3213, _3307, _3249);
    float _3311 = fma(_3227, _3289, _3263);
    float _3313 = _875 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3315 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3317 = abs(_1485);
    float _3319 = log2(_3317);
    int _3321 = _3305 * _3291;
    int _3323 = _3321 + _3081;
    int _3325 = int(_3171) + int(_3273);
    float _3327 = _3313 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3329 = ~_2463;
    int _3331 = _3329 + 1;
    float _3333 = _3285 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3335 = uint(_3323) >= uint(_2387);
    float _3337 = _3163 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_78.x = _3277;
    out.m_78.y = _3281;
    out.m_78.z = _3309;
    out.m_78.w = _3311;
    int _3339 = int(_3195) + int(_3297);
    float _3341 = trunc(_3299);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    bool _3347 = !_3335;
    int _3349 = _3347 ? 0 : (-1);
    out.m_80.x = _3327;
    out.m_80.y = _3315;
    out.m_80.z = _3333;
    out.m_80.w = _3337;
    int _3351 = ~_3291;
    int _3353 = _3351 + _3349;
    int _3355 = _3353 + 1;
    float _3357 = _3319 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _3359 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3361 = _3359 != 0;
    bool _3363 = _1485 <= 8000.0;
    bool _3365 = isnan(_1485);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(8000.0);
    bool _3371 = _3367 || _3369;
    float _3373 = float(_3371);
    float _3375 = exp2(_3357);
    float _3377 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3379 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3381 = _1473 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3383 = -_1471;
    float _3385 = fma(_3383, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3377);
    int _3387 = _3331 * _3339;
    int _3389 = _3387 + _3139;
    float _3391 = -_1471;
    float _3393 = fma(_3391, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3379);
    int _3395 = _2387 * _3355;
    int _3397 = _3395 + _3081;
    float _3399 = -_1471;
    float _3401 = fma(_3399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3381);
    float _3403 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3385);
    bool _3405 = uint(_3389) >= uint(_2463);
    float _3407 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _3409 = !_2929;
    int _3411 = _3409 ? _3397 : (-1);
    float _3413 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3393);
    int _3421 = _3411 & 3;
    bool _3423 = _3421 != 0;
    float _3425 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3413);
    int _3427 = _3411 & 3;
    bool _3429 = _3427 != 0;
    float _3431 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3433 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3435 = ~_3339;
    int _3437 = _3435 + _3417;
    int _3439 = _3437 + 1;
    float _3441 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3407);
    int _3443 = _3423 ? 0 : 1;
    float _3445 = fma(_3375, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3447 = precise::clamp(_3445, 0.0, 1.0);
    bool _3449 = uint(_3427) > 1u;
    float _3451 = _1497 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3453 = _2463 * _3439;
    int _3455 = _3453 + _3139;
    float _3457 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3459 = ~_3443;
    int _3461 = _3459 + 1;
    int _3463 = _3461 + 1;
    float _3465 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3451);
    float _3467 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3469 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3457);
    bool _3471 = !_2961;
    int _3473 = _3471 ? _3455 : (-1);
    float _3475 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3477 = _3411 >> 31;
    float _3479 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3467);
    int _3481 = int(_3219) + int(_3345);
    float _3483 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3475);
    int _3485 = _3463;
    if (!_3449)
    {
        int _3487 = ~_3443;
        int _3489 = _3487 + 1;
        _3485 = _3489;
    }
    int _3491 = _3485;
    float _3493 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3469);
    int _3495 = _3473 >> 31;
    float _3497 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3479);
    int _3499 = ~_2387;
    int _3501 = _3499 + 1;
    float _3503 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3483);
    bool _3505 = !_3429;
    int _3507 = _3505 ? 0 : 1;
    float _3509 = _3433 * _3403;
    int _3511 = _3477 & 3;
    int _3513 = _3501 * _3325;
    int _3515 = _3513 + _2919;
    bool _3517 = _3427 != 3;
    int _3519 = _3495 & 3;
    int _3521 = _3411 + _3511;
    int _3523 = ~_2463;
    int _3525 = _3523 + 1;
    bool _3527 = uint(_3427) >= 2u;
    int _3529 = _3473 + _3519;
    int _3531 = _3525 * _3481;
    int _3533 = _3531 + _3093;
    int _3535 = _3521 >> 2;
    int _3537 = _3527 ? 0 : 1;
    bool _3539 = uint(_3515) >= uint(_2387);
    int _3541 = _3529 >> 2;
    int _3543 = _3535 << 4;
    int _3545 = _3543 + 368;
    float _3547 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3441);
    int _3549 = ~_3537;
    int _3551 = _3549 + 1;
    int _3553 = _3551 + 1;
    int _3555 = _3553;
    if (_3517)
    {
        int _3557 = ~_3537;
        int _3559 = _3557 + 1;
        _3555 = _3559;
    }
    int _3561 = _3555;
    int _3563 = _3545 + 8;
    uint _3565 = uint(int(uint(_3563) >> uint(2)));
    uint _3567 = uint(int(uint(int(_3565)) >> uint(2)));
    int _3569 = int(_3565) & 3;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[int(_3567)][_3569];
    int _3573 = int(_3565) + 1;
    uint _3575 = uint(int(uint(_3573) >> uint(2)));
    int _3577 = _3573 & 3;
    float _3579 = (*spvDescriptorSet0.vp_c9)._m0[int(_3575)][_3577];
    bool _3581 = uint(_3533) >= uint(_2463);
    int _3583 = _3541 << 4;
    int _3585 = _3583 + 512;
    float _3587 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3425);
    bool _3589 = !_3539;
    int _3591 = _3589 ? 0 : (-1);
    int _3593 = _3473 & 3;
    bool _3595 = _3593 != 0;
    uint _3597 = uint(int(uint(_3545) >> uint(2)));
    uint _3599 = uint(int(uint(int(_3597)) >> uint(2)));
    int _3601 = int(_3597) & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    int _3605 = int(_3597) + 1;
    uint _3607 = uint(int(uint(_3605) >> uint(2)));
    int _3609 = _3605 & 3;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[int(_3607)][_3609];
    bool _3613 = !_3595;
    int _3615 = _3613 ? 0 : 1;
    int _3617 = _3473 & 3;
    bool _3619 = _3617 != 0;
    float _3621 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3465);
    float _3623 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _3625 = uint(int(uint(_3585) >> uint(2)));
    uint _3627 = uint(int(uint(int(_3625)) >> uint(2)));
    int _3629 = int(_3625) & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    int _3633 = int(_3625) + 1;
    uint _3635 = uint(int(uint(_3633) >> uint(2)));
    int _3637 = _3633 & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = _3619 ? 0 : 1;
    float _3643 = fma(_3447, -2.0, 3.0);
    bool _3645 = uint(_3593) >= 2u;
    float _3647 = _3447 * _3447;
    bool _3649 = !_3581;
    int _3651 = _3649 ? 0 : (-1);
    float _3653 = fma(_3623, _3547, _3509);
    int _3655 = _3645 ? 0 : 1;
    int _3657 = _3585 + 8;
    uint _3659 = uint(int(uint(_3657) >> uint(2)));
    uint _3661 = uint(int(uint(int(_3659)) >> uint(2)));
    int _3663 = int(_3659) & 3;
    float _3665 = (*spvDescriptorSet0.vp_c9)._m0[int(_3661)][_3663];
    int _3667 = int(_3659) + 1;
    uint _3669 = uint(int(uint(_3667) >> uint(2)));
    int _3671 = _3667 & 3;
    float _3673 = (*spvDescriptorSet0.vp_c9)._m0[int(_3669)][_3671];
    bool _3675 = uint(_3593) > 1u;
    out.m_82.x = _3547;
    out.m_82.y = _3621;
    out.m_82.z = _3587;
    bool _3677 = _3593 != 3;
    float _3679 = _3647 * _3643;
    int _3681 = abs(_3491);
    int _3683 = ~_3481;
    int _3685 = _3683 + _3651;
    int _3687 = _3685 + 1;
    int _3689 = ~_3641;
    int _3691 = _3689 + 1;
    int _3693 = _3691 + 1;
    int _3695 = ~_3655;
    int _3697 = _3695 + 1;
    int _3699 = _3697 + 1;
    int _3701 = _2463 * _3687;
    int _3703 = _3701 + _3093;
    int _3705 = ~_3325;
    int _3707 = _3705 + _3591;
    int _3709 = _3707 + 1;
    int _3711 = _3693;
    int _3713 = _3699;
    if (!_3675)
    {
        int _3715 = ~_3641;
        int _3717 = _3715 + 1;
        _3711 = _3717;
    }
    int _3719 = _3711;
    int _3721 = _2387 * _3709;
    int _3723 = _3721 + _2919;
    if (_3677)
    {
        int _3725 = ~_3655;
        int _3727 = _3725 + 1;
        _3713 = _3727;
    }
    int _3729 = _3713;
    int _3731 = abs(_3719);
    int _3733 = abs(_3507);
    int _3735 = ~_3681;
    int _3737 = _3735 + 1;
    int _3739 = _3737 + 1;
    int _3741 = ~_3731;
    int _3743 = _3741 + 1;
    int _3745 = _3743 + 1;
    int _3747 = abs(_3561);
    int _3749 = ~_3733;
    int _3751 = _3749 + 1;
    int _3753 = _3751 + 1;
    int _3755 = _3739 * as_type<int>(_3611);
    int _3757 = abs(_3615);
    bool _3759 = _3427 != 3;
    int _3761 = _3753 * as_type<int>(_3603);
    int _3763 = _3761 + _3755;
    int _3765 = ~_3747;
    int _3767 = _3765 + 1;
    int _3769 = _3767 + 1;
    bool _3771 = _3593 != 3;
    int _3773 = _3745 * as_type<int>(_3639);
    int _3775 = ~_3757;
    int _3777 = _3775 + 1;
    int _3779 = _3777 + 1;
    int _3781 = _3769 * as_type<int>(_3571);
    int _3783 = _3781 + _3763;
    bool _3785 = !_3759;
    int _3787 = _3785 ? 0 : (-1);
    float _3789 = fma(_3433, _3433, 1.0);
    bool _3791 = !_3771;
    int _3793 = _3791 ? 0 : (-1);
    int _3795 = _3779 * as_type<int>(_3631);
    int _3797 = _3795 + _3773;
    int _3799 = abs(_3729);
    int _3801 = abs(_3787);
    float _3803 = rsqrt(_3789);
    int _3805 = abs(_3793);
    int _3807 = ~_3799;
    int _3809 = _3807 + 1;
    int _3811 = _3809 + 1;
    bool _3813 = !_3233;
    int _3815 = _3813 ? 0 : 1;
    int _3817 = ~_3801;
    int _3819 = _3817 + 1;
    int _3821 = _3819 + 1;
    int _3823 = _3811 * as_type<int>(_3665);
    int _3825 = _3823 + _3797;
    int _3827 = abs(_3815);
    bool _3829 = !_3361;
    int _3831 = _3829 ? 0 : 1;
    int _3833 = _3821 * as_type<int>(_3579);
    int _3835 = _3833 + _3783;
    int _3837 = ~_3805;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    int _3843 = abs(_3831);
    int _3845 = _3841 * as_type<int>(_3673);
    int _3847 = _3845 + _3825;
    int _3849 = ~_3827;
    int _3851 = _3849 + 1;
    int _3853 = _3851 + 1;
    float _3855 = _3433 * _3803;
    int _3857 = ~_3843;
    int _3859 = _3857 + 1;
    int _3861 = _3859 + 1;
    bool _3863 = !_2929;
    int _3865 = _3863 ? _3723 : (-1);
    int _3867 = _3835 * _3853;
    bool _3869 = !_2961;
    int _3871 = _3869 ? _3703 : (-1);
    int _3873 = _3847 * _3861;
    float _3875 = -_3497;
    float _3877 = _3855 * _3875;
    int _3879 = _3865 * _3827;
    int _3881 = _3879 + _3867;
    float _3883 = -_3493;
    float _3885 = _3855 * _3883;
    int _3887 = _3871 * _3843;
    int _3889 = _3887 + _3873;
    float _3891 = fma(_3803, _3419, _3877);
    float _3893 = _3433 * _3419;
    float _3895 = -_3679;
    float _3897 = _3895 + 1.0;
    float _3899 = fma(_3803, _3403, _3885);
    float _3901 = -_3503;
    float _3903 = _3855 * _3901;
    float _3905 = fma(_3623, _3621, _3893);
    float _3907 = _3493 + _3653;
    float _3909 = fma(_3897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3679);
    float _3911 = fma(_2170, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _3913 = fma(_3803, _3431, _3903);
    float _3915 = _3433 * _3431;
    float _3917 = _3373 * _3909;
    float _3919 = _3911 + _2182;
    out.gl_Position.x = _2208;
    out.gl_Position.y = _2206;
    out.gl_Position.z = _3911;
    out.gl_Position.w = _2182;
    float _3921 = fma(_3623, _3587, _3915);
    float _3923 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3925 = _2705 * _2967;
    out.m_84.x = _3899;
    out.m_84.y = _3891;
    out.m_84.z = _3913;
    float _3927 = float(_3881);
    float _3929 = _2803 * _3923;
    float _3931 = precise::clamp(_3929, 0.0, 1.0);
    float _3933 = float(_3889);
    float _3935 = _3497 + _3905;
    float _3937 = _3503 + _3921;
    float _3939 = -_3931;
    float _3941 = fma(_3939, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_86.x = _3927;
    out.m_86.y = _3933;
    float _3943 = -_2959;
    float _3945 = _3943 + 1.0;
    float _3947 = _3919 * 0.5;
    float _3949 = _3919;
    float _3951 = _3945;
    if (!_2168)
    {
        _3949 = 1.0;
    }
    float _3953 = _3949;
    out.m_88.x = _3907;
    out.m_88.y = _3935;
    out.m_88.z = _3937;
    float _3955 = _3953;
    if (_2168)
    {
        bool _3957 = _2284 >= _2228;
        bool _3959 = isnan(_2284);
        bool _3961 = _3957 || _3959;
        bool _3963 = isnan(_2228);
        bool _3965 = _3961 || _3963;
        float _3967 = float(_3965);
        _3955 = _3967;
    }
    float _3969 = _3955;
    float _3971 = _2297 * _2967;
    bool _3973 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3975 = isnan(_2413);
    bool _3977 = _3973 || _3975;
    bool _3979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3981 = _3977 || _3979;
    float _3983 = _3969 * _2371;
    float _3985 = fma(_2701, _3971, _2291);
    float _3987 = fma(_2703, _3971, _2293);
    float _3989 = _2297 * _3945;
    float _3991 = -_3983;
    float _3993 = fma(_3991, _3941, 1.0);
    float _3995 = precise::clamp(_3993, 0.0, 1.0);
    float _3997 = fma(_2297, _3925, _2295);
    out.m_90.z = _3947;
    out.m_90.w = _2182;
    float _3999 = _3995 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3985;
    out.m_92.y = _3987;
    out.m_92.z = _3997;
    out.m_92.w = _3989;
    if (!_3981)
    {
        _2216 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4001 = _2216;
    out.m_94.x = _3999;
    float _4003 = _4001;
    float _4005 = _4001;
    if (!_3981)
    {
        _3951 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4007 = _3951;
    float _4009 = _4007;
    float _4011 = _4007;
    if (!_3981)
    {
        _1351 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4013 = _1351;
    bool _4015 = !_3981;
    float _4017 = _4013;
    float _4019 = _4013;
    if (!_4015)
    {
        bool _4021 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4023 = isnan(_2413);
        bool _4025 = _4021 || _4023;
        bool _4027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4029 = _4025 || _4027;
        if (!_4029)
        {
            float _4031 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4033 = _2413 + _4031;
            float _4035 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4037 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4035;
            float _4039 = 1.0 / _4037;
            float _4041 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4043 = _4041 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4047 = _4045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4049 = _4033 * _4039;
            float _4051 = precise::clamp(_4049, 0.0, 1.0);
            float _4053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4055 = _4053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4057 = fma(_4051, _4047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4059 = fma(_4051, _4055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4061 = fma(_4051, _4043, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4011 = _4061;
            _4005 = _4059;
            _4019 = _4057;
            _4063 = true;
        }
        else
        {
            bool _4065 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4067 = isnan(_2413);
            bool _4069 = _4065 || _4067;
            bool _4071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4073 = _4069 || _4071;
            if (!_4073)
            {
                _4003 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4075 = _4003;
            _4005 = _4075;
            if (!_4073)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4077 = _4009;
            _4011 = _4077;
            if (!_4073)
            {
                _4017 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4079 = _4017;
            bool _4081 = !_4073;
            _4019 = _4079;
            if (!_4081)
            {
                bool _4083 = _2413 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4085 = isnan(_2413);
                bool _4087 = _4083 || _4085;
                bool _4089 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4091 = _4087 || _4089;
                if (!_4091)
                {
                    float _4093 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4095 = _2413 + _4093;
                    float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4099 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4097;
                    float _4101 = 1.0 / _4099;
                    float _4103 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4105 = _4103 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4111 = _4095 * _4101;
                    float _4113 = precise::clamp(_4111, 0.0, 1.0);
                    float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4119 = fma(_4113, _4109, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4121 = fma(_4113, _4117, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4123 = fma(_4113, _4105, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4011 = _4123;
                    _4005 = _4121;
                    _4019 = _4119;
                    _4063 = true;
                }
                else
                {
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4005 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4019 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4063 = false;
    float _4125 = _4011;
    float _4127 = _4005;
    float _4129 = _4019;
    float _4131 = _4125 * 0.586610972881317138671875;
    bool _4133 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_96.x = 0.0;
    float _4135 = fma(_4127, 0.298911988735198974609375, _4131);
    float _4137 = fma(_4129, 0.114477999508380889892578125, _4135);
    float _4139 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4141 = -_4137;
    float _4143 = _4141 + _4127;
    float _4145 = -_4137;
    float _4147 = _4145 + _4125;
    float _4149 = -_4137;
    float _4151 = _4149 + _4129;
    out.m_59.x = _4139;
    float _4153 = fma(_4143, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4155 = fma(_4147, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    float _4157 = fma(_4151, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4137);
    out.m_98.x = _4153;
    out.m_98.y = _4155;
    out.m_98.z = _4157;
    if (!_4133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4159 = -_2076;
    float _4161 = _4159 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4163 = -_2078;
    float _4165 = _4163 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4167 = -_2080;
    float _4169 = _4167 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4171 = _4161 * _4161;
    float _4173 = fma(_4165, _4165, _4171);
    float _4175 = fma(_4169, _4169, _4173);
    float _4177 = sqrt(_4175);
    float _4179 = rsqrt(_4175);
    float _4181 = -_4177;
    float _4183 = _4181 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4185 = _4183 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4187 = precise::clamp(_4185, 0.0, 1.0);
    float _4189 = _4165 * _4179;
    float _4191 = _4161 * _4179;
    float _4193 = abs(_4187);
    float _4195 = log2(_4193);
    float _4197 = _4169 * _4179;
    float _4199 = _4189 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4201 = _3935 * _4191;
    float _4203 = -_4191;
    float _4205 = -_4199;
    float _4207 = fma(_4203, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4205);
    float _4209 = fma(_3907, _4189, _4201);
    float _4211 = -_4197;
    float _4213 = fma(_4211, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4207);
    float _4215 = fma(_3937, _4197, _4209);
    float _4217 = precise::clamp(_4215, 0.0, 1.0);
    float _4219 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4221 = _4213 + _4219;
    float _4223 = _4195 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4225 = _4221 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4227 = precise::clamp(_4225, 0.0, 1.0);
    float _4229 = exp2(_4223);
    float _4231 = _4229 * _4227;
    float _4233 = _4217 * _4231;
    float _4235 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4237 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4239 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _4235;
    out.m_96.y = _4237;
    out.m_96.z = _4239;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

