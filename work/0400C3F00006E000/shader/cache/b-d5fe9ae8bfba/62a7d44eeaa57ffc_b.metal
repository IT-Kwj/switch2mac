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
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c8 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_88 [[user(locn0)]];
    float4 m_84 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_67 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_106 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_104 [[user(locn13)]];
    float4 m_102 [[user(locn14)]];
    float4 m_100 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(1)]];
    float4 m_78 [[attribute(2)]];
    float4 m_76 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_65 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3529 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
    float _122 = in.m_58.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3839 = as_type<float>(_149);
        out.gl_Position.z = _3839;
    }
    if (!_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_183);
        out.gl_Position.z = _3904;
    }
    out.m_61.x = _177;
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _189 = as_type<int>(_185) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_185) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_187;
    float _221;
    if (!_205)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _177;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = in.m_72.x;
    float _249 = in.m_72.y;
    float _251 = 1.0 / _241;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    bool _257 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_225);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _245;
    float _271 = _229 * _255;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _225 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = _275 * _251;
    bool _283 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_225);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _233 * _269;
    float _301 = fma(_279, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -_267;
    float _323 = _321 + 1.0;
    float _325 = _267 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _331 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_225);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _313 * _323;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = fma(_329, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _341 * _347;
    float _357 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = _301 * _355;
    float _365 = _319 * _355;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_357, _343, _375);
    float _385 = fma(_353, _343, _377);
    float _387 = fma(_379, _325, _383);
    float _389 = fma(_381, _325, _385);
    float _391 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _247;
    float _397 = _393 * _249;
    bool _399 = !_253;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _179 = _413;
    }
    float _415 = _179;
    float _417 = in.m_56.x;
    float _419 = in.m_56.y;
    float _421 = in.m_56.z;
    float _423 = in.m_74.x;
    float _425 = in.m_74.y;
    float _427 = in.m_74.z;
    float _429 = in.m_74.w;
    float _431 = in.m_76.x;
    float _433 = in.m_76.y;
    float _435 = in.m_76.z;
    float _437 = in.m_76.w;
    float _439 = _419 * _425;
    float _441 = _419 * _433;
    float _443 = fma(_417, _423, _439);
    float _445 = fma(_417, _431, _441);
    float _447 = fma(_421, _427, _443);
    float _449 = fma(_421, _435, _445);
    float _451 = _447 + _429;
    float _453 = _449 + _437;
    float _455 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _457 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _459 = floor(_455);
    float _461 = floor(_457);
    float _463 = -_459;
    float _465 = _455 + _463;
    float _467 = -_461;
    float _469 = _457 + _467;
    float2 _4361 = float2(_465, _469);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4361, float2(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4361, float2(0.0), isnan(_4361)), level(0.0)).x;
    float _473 = in.m_65.z;
    float _475 = _163 * 2.0;
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    float _481 = in.m_78.x;
    float _483 = in.m_78.y;
    float _485 = in.m_78.z;
    float _487 = in.m_78.w;
    float _489 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _491 = _173 * _131;
    float _493 = in.m_65.y;
    bool _495 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _497 = isnan(0.0);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _503 = _499 || _501;
    float _505 = floor(_475);
    float _507 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _513 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _515 = int(_513);
    float _517 = _479 * _131;
    float _519 = _473 * 2.0;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _523 = int(_521);
    bool _525 = _505 >= 0.0;
    bool _527 = isnan(_505);
    bool _529 = _525 || _527;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    float _535 = _419 * _483;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _541 = _505 > 0.0;
    float _543 = _493 * 2.0;
    float _545 = fma(_417, _481, _535);
    float _547 = floor(_519);
    float _549 = _163 + _493;
    float _551 = -_537;
    float _553 = fma(_489, 2.0, _551);
    float _555 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _557 = _549 + (-1.0);
    float _559 = float(_515);
    float _561 = fma(_421, _485, _545);
    float _563 = floor(_543);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = _533 ? 0 : 1;
    float _569 = fma(_555, -2.0, _539);
    float _571 = float(_523);
    float _573 = _561 + _487;
    float _575 = -_131;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _553);
    bool _579 = _547 > 0.0;
    float _581 = exp2(_517);
    bool _583 = _547 >= 0.0;
    bool _585 = isnan(_547);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _595 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _569);
    float _597 = _573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _599 = _563 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _603 = 1.0 + _601;
    bool _605 = _563 >= 0.0;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = 1.0 / _559;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _619 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _597);
    int _621 = _613 ? 0 : 1;
    float _623 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].w, _617);
    float _625 = -_581;
    float _627 = _625 + 1.0;
    float _629 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _631 = 1.0 / _571;
    int _633 = ~_567;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _623);
    int _641 = _637;
    int _643 = 2;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_541)
    {
        int _647 = ~_567;
        int _649 = _647 + 1;
        _641 = _649;
    }
    int _651 = _641;
    float _653 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _593);
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _667 = _503 ? _627 : 0.0;
    float _669 = 1.0 / _603;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _681 = _679 != 0;
    float _683 = _615 * _131;
    float _685 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _653);
    float _687 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _689 = in.m_80.x;
    float _691 = in.m_80.y;
    float _693 = in.m_80.z;
    bool _695 = !_677;
    int _697 = _695 ? 0 : 1;
    float _699 = _631 * _131;
    bool _701 = !_673;
    int _703 = _701 ? 0 : 1;
    float _705 = _573 + _687;
    bool _707 = !_681;
    int _709 = _707 ? 0 : 1;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _721 = _719 != 0;
    float _723 = float(_651);
    if (_663)
    {
        float _725 = _667 * _669;
        _141 = _725;
    }
    float _727 = _141;
    int _729 = ~_621;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    float _735 = _705 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _737 = _733;
    if (!_599)
    {
        int _739 = ~_621;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _747 = !_717;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[126].x, _735);
    bool _753 = !_713;
    int _755 = _753 ? 0 : 1;
    float _757 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[126].z, _751);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _775 = _773 != 0;
    float _777 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _757);
    int _779 = _591 ? 0 : 1;
    float _781 = _763 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _783 = float(_743);
    float _785 = _777 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _787 = !_771;
    int _789 = _787 ? 0 : 1;
    int _791 = ~_779;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = 1.0 / _785;
    int _799 = abs(_789);
    float _801 = _665 + _785;
    bool _803 = !_767;
    int _805 = _803 ? 0 : 1;
    int _807 = _795;
    if (!_579)
    {
        int _809 = ~_779;
        int _811 = _809 + 1;
        _807 = _811;
    }
    int _813 = _807;
    int _815 = abs(_805);
    float _817 = float(_799);
    float _819 = float(_813);
    float _821 = _817 * _723;
    float _823 = float(_815);
    float _825 = _801 * _797;
    float _827 = _825 * 0.5;
    float _829 = _705 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _831 = _823 * _819;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
    float _837 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[127].x, _829);
    float _839 = _831 * (-2.0);
    bool _841 = !_775;
    int _843 = _841 ? 0 : 1;
    float _845 = trunc(_781);
    int _847 = int(_845);
    float _849 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[127].z, _837);
    float _851 = fma(_565, _839, _565);
    float _853 = fma(_839, _689, _689);
    float _855 = _493 + _473;
    float _857 = _163 + (-0.5);
    int _859 = abs(_843);
    float _861 = _849 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].x, _853);
    float _867 = float(_859);
    float _869 = _821 * (-2.0);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = fma(_851, _727, _865);
    float _875 = trunc(_861);
    int _877 = int(_875);
    float _879 = _867 * _783;
    float _881 = fma(_871, _869, _871);
    float _883 = fma(_869, _691, _691);
    float _885 = _163 + _473;
    float _887 = _493 + (-0.5);
    float _889 = _873 * 0.15915493667125701904296875;
    float _891 = _885 + (-1.0);
    float _893 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _883);
    float _895 = _879 * (-2.0);
    float _897 = 1.0 / _835;
    float _899 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _901 = fma(_881, _727, _893);
    float _903 = fma(_895, _693, _693);
    float _905 = _473 + (-0.5);
    float _907 = fma(_899, _895, _899);
    int _909 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _911 = _847 + _909;
    int _913 = _911 + 1;
    float _915 = _901 * 0.15915493667125701904296875;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _903);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _877 + _919;
    int _923 = _921 + 1;
    float _925 = _889 * 6.283185482025146484375;
    float _927 = sin(_925);
    bool _929 = _913 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_907, _727, _917);
    int _933 = _913 | _923;
    float _935 = _931 * 0.15915493667125701904296875;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _939 = _897 * _937;
    float _941 = _889 * 6.283185482025146484375;
    float _943 = cos(_941);
    bool _945 = _933 < 0;
    bool _947 = _945 || _929;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    bool _951 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _953 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _955 = _953 || _947;
    float _957 = _507 * _949;
    float _959 = _915 * 6.283185482025146484375;
    float _961 = sin(_959);
    bool _963 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _965 = !_951;
    int _967 = _965 ? 0 : 1;
    float _969 = _915 * 6.283185482025146484375;
    float _971 = cos(_969);
    if (!_951)
    {
        _643 = 1;
    }
    int _973 = _643;
    int _975 = 0;
    int _977 = _973;
    if (!_955)
    {
        int _979 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _981 = _979 + _913;
        _975 = _981;
    }
    int _983 = _975;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    if (!_963)
    {
        _977 = _967;
    }
    int _995 = _977;
    float _997 = _935 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = _927 * _961;
    int _1003 = _995 << 6;
    int _1005 = 0;
    float _1007 = as_type<float>(_995);
    float _1009 = as_type<float>(_1003);
    if (!_955)
    {
        int _1011 = _983 << 2;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1003 + 48;
    uint _1018 = uint(int(uint(_1015) >> uint(2)));
    uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
    int _1022 = int(_1018) & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    int _1026 = int(_1018) + 1;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    int _1030 = _1026 & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    float _1034 = _935 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _927 * _971;
    float _1040 = _943 * _971;
    int _1042 = _1013;
    if (!_955)
    {
        int _1044 = 12 & _1013;
        _1042 = _1044;
    }
    int _1046 = _1042;
    int _1048 = _1003 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = fma(_999, _1040, _1001);
    float _1068 = _943 * _961;
    float _1070 = fma(_999, _1001, _1040);
    float _1072 = -_957;
    float _1074 = _999 * _1072;
    float _1076 = 0.0;
    if (!_955)
    {
        float _1078 = floor(_781);
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = -_1068;
    float _1084 = fma(_999, _1038, _1082);
    float _1086 = -_1038;
    float _1088 = fma(_999, _1068, _1086);
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1092 = _927 * _1036;
    float _1094 = _971 * _1036;
    float _1096 = _943 * _1036;
    float _1098 = _961 * _1036;
    float _1100 = _509 * _1090;
    int _1102 = _1003 + 56;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
    float _1120 = _1096 * _957;
    float _1122 = _1092 * _957;
    float _1124 = fma(_1094, _1100, _1074);
    float _1126 = fma(_1066, _1100, _1120);
    float _1128 = fma(_1098, _511, _1124);
    int _1130 = _1003 + 96;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = fma(_1088, _511, _1126);
    float _1150 = fma(_1084, _1100, _1122);
    int _1152 = as_type<int>(_1124);
    if (!_955)
    {
        uint _1154 = uint(int(uint(_983) >> uint(2)));
        _1152 = int(_1154);
    }
    int _1156 = _1152;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = fma(_1070, _511, _1150);
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1164 = _1003 + 104;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1184 = 0.0;
    if (!_955)
    {
        int _1186 = _1156 << 4;
        int _1188 = _1186 + _1046;
        _1184 = as_type<float>(_1188);
    }
    float _1190 = _1184;
    float _1192 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1162);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1196 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1182);
    float _1198 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    int _1200 = _1003 + 72;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    float _1218 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1220 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1194);
    float _1222 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1224 = _705 * _1032;
    float _1226 = _453 + _1218;
    float _1228 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1230 = _451 + _1222;
    int _1232 = _1003 + 80;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1226 + _1250;
    float _1254 = fma(_451, _1024, _1224);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1230 + _1256;
    float _1260 = _1252 * _1252;
    int _1262 = _1003 + 88;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    float _1280 = fma(_1258, _1258, _1260);
    float _1282 = sqrt(_1280);
    float _1284 = _1190;
    float _1286 = _1230;
    float _1288 = _1226;
    float _1290 = _1228;
    float _1292 = _1252;
    float _1294 = _1258;
    if (!_955)
    {
        int _1296 = as_type<int>(_1190) + 400;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
        int _1302 = int(_1298) & 3;
        float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _705 * _1146;
    float _1310 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = fma(_451, _1138, _1308);
    bool _1314 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1308;
    float _1318 = _1310;
    if (!_955)
    {
        float _1320 = floor(_861);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = _573 + _1310;
    float _1326 = fma(_453, _1172, _1312);
    float _1328 = _705 * _1064;
    float _1330 = _1326 + _1180;
    float _1332 = fma(_451, _1056, _1328);
    float _1334 = fma(_453, _1110, _1254);
    float _1336 = fma(_453, _1208, _1332);
    float _1338 = 1.0 / _1330;
    float _1340 = _1334 + _1118;
    float _1342 = _1208;
    float _1344 = _1324;
    if (!_1314)
    {
        _1318 = _1324;
    }
    float _1346 = _1318;
    float _1348 = _1336 + _1216;
    bool _1350 = !_1314;
    float _1352 = _1346;
    float _1354 = _1322;
    if (!_1350)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1360 = _1282 + _1358;
        float _1362 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = rsqrt(_1280);
        float _1366 = _1360 * _1356;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = _1368 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = _1372 + (-1.0);
        float _1380 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = fma(_1376, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1384 = fma(_1324, _1372, _1380);
        float _1386 = _1364 * _1382;
        float _1388 = fma(_1258, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1390 = fma(_1252, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1286 = _1388;
        _1352 = _1384;
        _1288 = _1390;
    }
    float _1392 = _1286;
    float _1394 = _1352;
    float _1396 = _1288;
    float _1398 = _1396;
    if (_993)
    {
        _1290 = _1392;
    }
    float _1400 = _1290;
    float _1402 = _1400;
    if (_993)
    {
        _1292 = _1394;
    }
    float _1404 = _1292;
    float _1406 = _1404;
    if (_993)
    {
        _1294 = _1396;
    }
    float _1408 = _1294;
    float _1410 = _1408;
    if (!_993)
    {
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1414 = _573 + _1412;
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1418 = _451 + _1416;
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = -_573;
        float _1424 = _1422 + _1394;
        float _1426 = _1414 * _1414;
        float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1430 = _453 + _1428;
        float _1432 = -_451;
        float _1434 = _1432 + _1392;
        float _1436 = -_453;
        float _1438 = _1436 + _1396;
        float _1440 = fma(_1418, _1418, _1426);
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1444 = fma(_1430, _1430, _1440);
        float _1446 = sqrt(_1444);
        float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1450 = precise::min(_1446, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1452 = _1450 * _1442;
        float _1454 = _1448 * _1452;
        float _1456 = fma(_1424, _1454, _573);
        float _1458 = fma(_1434, _1454, _451);
        float _1460 = fma(_1438, _1454, _453);
        _1406 = _1456;
        _1402 = _1458;
        _1410 = _1460;
        _1398 = _1438;
    }
    float _1462 = _1406;
    float _1464 = _1402;
    float _1466 = _1410;
    float _1468 = _1398;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = _1340 * _1338;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    if (!_955)
    {
        float _1480 = rint(_1306);
        float _1482 = precise::max(_1480, 0.0);
        uint _1484 = uint(_1482);
        uint _1486 = clamp(_1484, 0u, 65535u);
        _1342 = as_type<float>(_1486);
    }
    float _1488 = _1342;
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1474);
    bool _1492 = _1472 >= 0.0;
    float _1494 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1478);
    float _1496 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1498 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = _1348 * _1338;
    float _1502 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    bool _1504 = _1472 <= 1.0;
    bool _1506 = _1504 && _1492;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1512 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1514 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1518 = _1500 >= 0.0;
    bool _1520 = _1518 && _1506;
    float _1522 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1512);
    float _1526 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    bool _1528 = _1500 <= 1.0;
    bool _1530 = _1528 && _1520;
    float _1532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1526);
    float _1540 = _705 * _1248;
    float _1542 = -_1534;
    float _1544 = fma(_1542, _1532, 1.0);
    float _1546 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1548 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1552 = fma(_451, _1240, _1540);
    float _1554 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1546);
    float _1556 = 1.0 / _1548;
    float _1558 = _1540;
    float _1560 = _1532;
    if (_1530)
    {
        float _1562 = float(_995);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1550);
    float _1568 = fma(_453, _1270, _1552);
    float _1570 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1554);
    if (!_955)
    {
        float _1572 = -_1322;
        float _1574 = _861 + _1572;
        _1354 = _1574;
    }
    float _1576 = _1354;
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1580 = _1568 + _1278;
    float _1582 = log2(_1544);
    float _1584 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1570);
    float _1586 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1578);
    float _1588 = _1586;
    if (!_955)
    {
        float _1590 = -_1080;
        float _1592 = _781 + _1590;
        _1560 = _1592;
    }
    float _1594 = _1560;
    float _1596 = _1580 * _1338;
    float _1598 = _1564;
    if (_1530)
    {
        float _1600 = rint(_1564);
        float _1602 = precise::max(_1600, 0.0);
        uint _1604 = uint(_1602);
        uint _1606 = clamp(_1604, 0u, 65535u);
        _1598 = as_type<float>(_1606);
    }
    float _1608 = _1598;
    float _1610 = _1584 * _1556;
    float _1612 = _1586 * _1556;
    float _1614 = fma(_1610, 0.5, 0.5);
    float _1616 = fma(_1612, -0.5, 0.5);
    float _1618 = _1582 * 0.693147182464599609375;
    float _1620 = _1488;
    if (!_955)
    {
        float3 _6187 = float3(_1594, _1576, float(as_type<int>(_1488)));
        float3 _6191 = select(_6187, float3(0.0), isnan(_6187));
        float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6191.xy, uint(rint(_6191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6191.xy, uint(rint(_6191.z)), level(0.0)).x;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1628 = _1500;
    if (_1530)
    {
        float3 _6210 = float3(_1472, _1500, float(as_type<int>(_1608)));
        float3 _6212 = select(_6210, float3(0.0), isnan(_6210));
        float _1630 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6212.xy, uint(rint(_6212.z)), _1596, level(0.0));
        _1628 = _1630;
    }
    float _1632 = _1628;
    float3 _6222 = float3(_1614, _1616, _1626);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6222, float3(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6222, float3(0.0), isnan(_6222)), level(0.0)).x;
    float3 _6231 = float3(_1614, _1616, _1626);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6231, float3(0.0), isnan(_6231)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6231, float3(0.0), isnan(_6231)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    bool _1647 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1655 = _1651 || _1653;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_955)
    {
        _1007 = 1.0;
    }
    float _1659 = _1007;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1663 = _1661 != 0;
    float _1665 = _1659;
    if (_1655)
    {
        _1657 = 1.0;
    }
    float _1667 = _1657;
    float _1669 = _1667;
    if (!_1655)
    {
        float _1671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = _1671 * 0.15915493667125701904296875;
        float _1675 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1677 = _1673 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 0.15915493667125701904296875;
        float _1683 = _1673 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = 1.0 / _1679;
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = _1681 * 6.283185482025146484375;
        float _1697 = sin(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = 1.0 / _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = 1.0 / _1705;
        float _1709 = _1697 * _1701;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1713 = fma(_939, _1709, _1711);
        float _1715 = _1713 * _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        _1669 = _1717;
    }
    float _1719 = _1669;
    if (!_955)
    {
        int _1721 = _983 << 4;
        int _1723 = _1721 + 2048;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        int _1741 = _1723 + 8;
        uint _1743 = uint(int(uint(_1741) >> uint(2)));
        uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
        int _1747 = int(_1743) & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = int(_1743) + 1;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        int _1755 = _1751 & 3;
        float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
        float _1759 = _705 * _1739;
        float _1761 = fma(_451, _1731, _1759);
        float _1763 = fma(_453, _1749, _1761);
        float _1765 = _1763 + _1757;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = -_1767;
        float _1771 = _1769 + _1624;
        float _1773 = fma(_1771, 500.0, 1.5);
        float _1775 = exp2(_1773);
        float _1777 = 0.0 + _1775;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1665 = _1779;
    }
    float _1781 = _1665;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1462 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1464 + _1787;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1793 = _1466 + _1791;
    float _1795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1797 = int(_1795);
    float _1799 = _1785 * _1785;
    float _1801 = fma(_1789, _1789, _1799);
    float _1803 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1805 = int(_1803);
    float _1807 = fma(_1793, _1793, _1801);
    float _1809 = rsqrt(_1807);
    float _1811 = float(uint(_1797));
    float _1813 = float(uint(_1805));
    float _1815 = 1.0 / _1811;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1819 = sqrt(_1807);
    float _1821 = _1789 * _1817;
    float _1823 = _1793 * _1817;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = 1.0 / _1813;
    int _1831 = as_type<int>(_1815) + (-2);
    float _1833 = _1825 + _1827;
    float _1835 = sqrt(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    bool _1839 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1835 + _1841;
    float _1845 = _1576;
    float _1847 = _1843;
    float _1849 = _1785;
    float _1851 = _1823;
    float _1853 = _1825;
    float _1855 = _1827;
    if (_1839)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1857;
    }
    float _1859 = _1845;
    if (_1839)
    {
        float _1861 = rsqrt(_1833);
        _1344 = _1861;
    }
    float _1863 = _1344;
    float _1865 = _1863;
    if (_1839)
    {
        float _1867 = _1843 * _1859;
        _1847 = _1867;
    }
    float _1869 = _1847;
    if (_1839)
    {
        float _1871 = _1869 * 0.15915493667125701904296875;
        _1009 = _1871;
    }
    float _1873 = _1009;
    float _1875 = _1468;
    if (_1839)
    {
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1885 = precise::max(0.0, _1883);
    float _1887 = _1282;
    float _1889 = _1883;
    if (_1839)
    {
        float _1891 = _1873 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1887 = _1893;
    }
    float _1895 = _1887;
    if (!_1839)
    {
        _1889 = _1821;
    }
    float _1897 = _1889;
    float _1899 = -_1817;
    float _1901 = -_1885;
    float _1903 = fma(_1785, _1899, _1901);
    float _1905 = _1897;
    if (_1839)
    {
        float _1907 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1849 = _1907;
    }
    float _1909 = _1849;
    float _1911 = trunc(_683);
    int _1913 = int(_1911);
    float _1915 = _1881;
    float _1917 = _1909;
    if (_1839)
    {
        float _1919 = fma(_1881, _1909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1839)
    {
        _1917 = _1903;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1839)
    {
        float _1929 = _1863 * _1921;
        _1865 = _1929;
    }
    float _1931 = _1865;
    if (_1839)
    {
        float _1933 = _1895 + (-1.0);
        _1923 = _1933;
    }
    float _1935 = _1923;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1821 * _1931;
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (_1839)
    {
        float _1943 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1839)
    {
        float _1947 = _1823 * _1931;
        _1851 = _1947;
    }
    float _1949 = _1851;
    float _1951 = trunc(_699);
    int _1953 = int(_1951);
    if (_1839)
    {
        float _1955 = _1941 * _1941;
        _1853 = _1955;
    }
    float _1957 = _1853;
    if (_1839)
    {
        float _1959 = fma(_1903, _1895, _1945);
        _1927 = _1959;
    }
    float _1961 = _1927;
    if (_1839)
    {
        float _1963 = _1949 * _1949;
        _1855 = _1963;
    }
    float _1965 = _1855;
    float _1967 = float(uint(_1913));
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = fma(_1961, _1961, _1957);
    int _1977 = ~_1805;
    int _1979 = _1977 + 1;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = _1975 + _1965;
    float _1987 = as_type<float>(_1831) * _1967;
    float _1989 = abs(_1983);
    float _1991 = log2(_1989);
    float _1993 = float(uint(_1953));
    float _1995 = rsqrt(_1985);
    float _1997 = as_type<float>(_1837) * _1993;
    float _1999 = trunc(_1987);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = _1995 * _1941;
    float _2007 = _1995 * _1961;
    float _2009 = trunc(_1997);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = _1995 * _1949;
    float _2017 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2019 = -_2017;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2025 = -_2015;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    int _2029 = ~_1797;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2023);
    float _2035 = fma(_2027, -0.5, 0.5);
    float _2037 = fma(_2027, 0.5, 0.5);
    int _2039 = _2031 * int(_2003);
    int _2041 = _2039 + _1913;
    int _2043 = _1979 * int(_2013);
    int _2045 = _2043 + _1953;
    float _2047 = sqrt(_2035);
    float _2049 = float(uint(_2041));
    float _2051 = fma(_2037, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = float(uint(_2045));
    float _2055 = _2007 + 1.0;
    float _2057 = as_type<float>(_1831) * _2049;
    float _2059 = fma(_2037, _2051, -0.212114393711090087890625);
    float _2061 = as_type<float>(_1837) * _2053;
    float _2063 = -_2007;
    float _2065 = fma(_2033, _2055, _2063);
    float _2067 = trunc(_2057);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    float _2073 = fma(_2037, _2059, 1.570728778839111328125);
    float _2075 = fma(_2065, 0.5, 0.5);
    float _2077 = _2047 * 0.636619746685028076171875;
    float _2079 = trunc(_2061);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = -_2073;
    float _2087 = fma(_2077, _2085, 1.0);
    float2 _6892 = float2(_2087, _2075);
    float3 _2091 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).xyz;
    float _2093 = _2091.x;
    float _2095 = _2091.y;
    float _2097 = _2091.z;
    int _2099 = ~_1797;
    int _2101 = _2099 + 1;
    out.m_82.x = _509;
    float _2103 = as_type<float>(_1979);
    float _2105 = as_type<float>(_2101);
    if (_1663)
    {
        _2103 = _163;
    }
    float _2107 = _2103;
    float _2109 = -_685;
    float _2111 = _2109 + 1.0;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2115 = _2113 != 0;
    float _2117 = -_639;
    float _2119 = _2117 + 1.0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2123 = _2121 != 0;
    float _2125 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _2107;
    if (!_1663)
    {
        _2127 = _473;
    }
    float _2129 = _2127;
    float _2131 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1663)
    {
        _645 = 1.0;
    }
    float _2133 = _645;
    float _2135 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2137 = -_471;
    float _2139 = _2137 + 1.0;
    float _2141 = _2133;
    if (!_1663)
    {
        _2141 = 5.839270114898681640625;
    }
    float _2143 = _2141;
    float _2145 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    int _2147 = int(_2003) + int(_2071);
    float _2149 = exp2(_2131);
    if (_1663)
    {
        _2105 = 1.0;
    }
    float _2151 = _2105;
    float _2153 = _2143 * _2129;
    int _2155 = int(_2013) + int(_2083);
    int _2157 = _2101 * _2147;
    int _2159 = _2157 + _1913;
    int _2161 = ~_1805;
    int _2163 = _2161 + 1;
    float _2165 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = _2151;
    float _2169 = _2165;
    if (!_1663)
    {
        _2167 = 7.345489978790283203125;
    }
    float _2171 = _2167;
    float _2173 = floor(_2153);
    float _2175 = float(_1797);
    int _2177 = _2163 * _2155;
    int _2179 = _2177 + _1953;
    bool _2181 = uint(_2159) >= uint(_1797);
    float _2183 = _2171 * _163;
    float _2185 = float(_1913);
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _1548;
    bool _2187 = uint(_2179) >= uint(_1805);
    float _2189 = floor(_2183);
    bool _2191 = _2185 >= _2175;
    bool _2193 = isnan(_2185);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_2175);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = !_2181;
    int _2205 = _2203 ? 0 : (-1);
    bool _2207 = _163 > 0.5;
    float _2209 = trunc(_2201);
    int _2211 = int(_2209);
    int _2213 = ~_2147;
    int _2215 = _2213 + _2205;
    int _2217 = _2215 + 1;
    bool _2219 = !_2115;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2229 = _2227 != 0;
    float _2231 = -_2189;
    float _2233 = _2183 + _2231;
    float _2235 = float(_1805);
    float _2237 = float(_1953);
    bool _2239 = !_2225;
    int _2241 = _2239 ? 0 : 1;
    bool _2243 = !_2187;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : 1;
    int _2251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2253 = _2251 != 0;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2257 = _2255 != 0;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2265 = _2263 != 0;
    bool _2267 = _2237 >= _2235;
    bool _2269 = isnan(_2237);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(_2235);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    int _2279 = _1797 * _2217;
    int _2281 = _2279 + _1913;
    bool _2283 = !_2123;
    int _2285 = _2283 ? 0 : 1;
    bool _2287 = _1797 == 0;
    float _2289 = -_199;
    int _2291 = _2207 ? as_type<int>(_2289) : as_type<int>(_199);
    float _2293 = trunc(_2277);
    int _2295 = int(_2293);
    bool _2297 = _493 > 0.5;
    float _2299 = _2233 * _2175;
    int _2301 = ~_2211;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    float _2307 = -_2173;
    float _2309 = _2153 + _2307;
    bool _2311 = !_2287;
    int _2313 = _2311 ? _2281 : (-1);
    float _2315 = _2175 * _491;
    int _2317 = _1797 + (-1);
    float _2319 = trunc(_2299);
    int _2321 = int(_2319);
    int _2323 = ~_2155;
    int _2325 = _2323 + _2245;
    int _2327 = _2325 + 1;
    int _2329 = _2313 * _2305;
    float _2331 = _2235 * _491;
    float _2333 = _2309 * _2235;
    int _2335 = abs(_2241);
    int _2337 = _2211 * _2317;
    int _2339 = _2337 + _2329;
    bool _2341 = !_2261;
    float _2343 = _2341 ? _199 : as_type<float>(_2291);
    int _2345 = _1805 * _2327;
    int _2347 = _2345 + _1953;
    bool _2349 = _1805 == 0;
    float _2351 = trunc(_2315);
    int _2353 = int(_2351);
    int _2355 = abs(_697);
    float _2357 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2359 = abs(_703);
    int _2361 = ~_2295;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    bool _2367 = !_2349;
    int _2369 = _2367 ? _2347 : (-1);
    float _2371 = trunc(_2333);
    int _2373 = int(_2371);
    int _2375 = _1805 + (-1);
    int _2377 = _2369 * _2365;
    int _2379 = abs(_761);
    int _2381 = _2321 * _2335;
    int _2383 = _2381 + _1913;
    int _2385 = _2339 * _2355;
    float _2387 = trunc(_2331);
    int _2389 = int(_2387);
    int _2391 = _2295 * _2375;
    int _2393 = _2391 + _2377;
    int _2395 = abs(_749);
    int _2397 = _2353 * _2359;
    int _2399 = _2397 + _2385;
    int _2401 = abs(_709);
    int _2403 = _2393 * _2395;
    int _2405 = abs(_2249);
    int _2407 = _2383 * _2401;
    int _2409 = _2407 + _2399;
    int _2411 = abs(_2221);
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2417 = abs(_755);
    int _2419 = _2373 * _2405;
    int _2421 = _2419 + _1953;
    int _2423 = abs(_2285);
    int _2425 = _2321 * _2411;
    int _2427 = _2425 + _2409;
    float _2429 = 1.0 / _2415;
    int _2431 = _2389 * _2417;
    int _2433 = _2431 + _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2437 = _415 + _2435;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2441 = float(uint(_2427));
    int _2443 = _2421 * _2379;
    int _2445 = _2443 + _2433;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2449;
    float _2453 = as_type<float>(_1831) * _2441;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2459 = _2373 * _2423;
    int _2461 = _2459 + _2445;
    float _2463 = _2451 * _2429;
    float _2465 = trunc(_2453);
    float _2467 = precise::max(_2465, 0.0);
    uint _2469 = uint(_2467);
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2473 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_2463, _2437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2479 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2481 = isnan(_415);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2487 = _2483 || _2485;
    float _2489 = float(_2487);
    bool _2491 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2493 = isnan(_415);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    out.m_84.x = _2473;
    out.m_84.y = _2475;
    out.m_84.z = _2447;
    out.m_84.w = _2471;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2507 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2509 = isnan(_415);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    int _2519 = ~_1797;
    int _2521 = _2519 + 1;
    float _2523 = float(uint(_2461));
    float _2525 = 1.0 / _2505;
    float _2527 = -_2517;
    float _2529 = _2527 + 1.0;
    float _2531 = float(uint(_2383));
    float _2533 = as_type<float>(_1837) * _2523;
    float _2535 = -_2489;
    float _2537 = _2535 + 1.0;
    float _2539 = -_2501;
    float _2541 = _2539 + 1.0;
    bool _2543 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2545 = isnan(_415);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = _2501 * _2537;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2561 = _2517 * _2541;
    int _2563 = _2521 * int(_2469);
    int _2565 = _2563 + _2427;
    float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2571 = _2553 * _2529;
    float _2573 = 1.0 / _2559;
    float _2575 = float(uint(_2565));
    float _2577 = _2477 * _2571;
    float _2579 = _2569 * _2525;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2583 = _415 + _2581;
    float _2585 = -_2553;
    float _2587 = _2585 + 1.0;
    float _2589 = as_type<float>(_1831) * _2575;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2591;
    float _2595 = trunc(_2533);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2579, _2583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2605 = _415 + _2603;
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2577);
    float _2609 = _2343 + 0.5;
    float _2611 = as_type<float>(_1831) * _2531;
    float _2613 = trunc(_2589);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = _2593 * _2573;
    int _2621 = ~_1805;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    float _2627 = float(uint(_2421));
    float _2629 = fma(_2619, _2605, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2631 = fma(_2601, _2561, _2607);
    int _2633 = ~_1797;
    int _2635 = _2633 + 1;
    int _2637 = _2623 * int(_2599);
    int _2639 = _2637 + _2461;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    float _2647 = fma(_2629, _2555, _2631);
    float _2649 = as_type<float>(_1837) * _2627;
    int _2651 = ~_1805;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    int _2657 = int(_2469) + int(_2617);
    float _2659 = trunc(_2649);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = ~_1797;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_1837) * _2655;
    float _2671 = -_203;
    int _2673 = _2297 ? as_type<int>(_2671) : as_type<int>(_203);
    int _2675 = _2667 * _2657;
    int _2677 = _2675 + _2427;
    bool _2679 = !_2265;
    float _2681 = _2679 ? _203 : as_type<float>(_2673);
    float _2683 = trunc(_2669);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2635 * int(_2645);
    int _2691 = _2689 + _2383;
    bool _2693 = uint(_2677) >= uint(_1797);
    float _2695 = _2681 + (-0.5);
    float _2697 = float(uint(_2691));
    float _2699 = -_2695;
    float _2701 = -_595;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2701);
    bool _2705 = !_2693;
    int _2707 = _2705 ? 0 : (-1);
    float _2709 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2647);
    float _2711 = abs(_939);
    float _2713 = log2(_2711);
    float _2715 = as_type<float>(_1831) * _2697;
    int _2717 = ~_2657;
    int _2719 = _2717 + _2707;
    int _2721 = _2719 + 1;
    int _2723 = _2653 * int(_2663);
    int _2725 = _2723 + _2421;
    int _2727 = int(_2599) + int(_2687);
    int _2729 = _1797 * _2721;
    int _2731 = _2729 + _2427;
    float _2733 = -_2111;
    float _2735 = fma(_2343, _2733, _2625);
    float _2737 = trunc(_2715);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = float(uint(_2725));
    float _2745 = fma(_2681, _2119, _2703);
    bool _2747 = !_2287;
    int _2749 = _2747 ? _2731 : (-1);
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2753 = as_type<float>(_1837) * _2743;
    int _2755 = _2749 & 3;
    bool _2757 = _2755 != 0;
    float _2759 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2761 = _2749 & 3;
    bool _2763 = _2761 != 0;
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2767 = _2757 ? 0 : 1;
    float _2769 = trunc(_2753);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    bool _2775 = uint(_2761) > 1u;
    float _2777 = _2709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2781 = ~_1805;
    int _2783 = _2781 + 1;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2795 = exp2(_2759);
    int _2797 = _2783 * _2727;
    int _2799 = _2797 + _2461;
    int _2801 = int(_2645) + int(_2741);
    float _2803 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _2735;
    out.m_86.y = _2745;
    int _2805 = _2791;
    if (!_2775)
    {
        int _2807 = ~_2767;
        int _2809 = _2807 + 1;
        _2805 = _2809;
    }
    int _2811 = _2805;
    int _2813 = ~_1797;
    int _2815 = _2813 + 1;
    out.m_88.x = _2779;
    out.m_88.y = _2785;
    out.m_88.z = _2803;
    out.m_88.w = _2777;
    bool _2817 = uint(_2761) >= 2u;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2823 = uint(_2799) >= uint(_1805);
    int _2825 = ~_1805;
    int _2827 = _2825 + 1;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2663) + int(_2773);
    int _2835 = _2815 * _2801;
    int _2837 = _2835 + _2383;
    float _2839 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2843 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    int _2847 = ~_2727;
    int _2849 = _2847 + _2831;
    int _2851 = _2849 + 1;
    float _2853 = -_999;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    bool _2857 = uint(_2837) >= uint(_1797);
    float _2859 = -_999;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2863 = -_999;
    float _2865 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2867 = _1805 * _2851;
    int _2869 = _2867 + _2461;
    float _2871 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2861);
    int _2873 = _2749 >> 31;
    int _2875 = _2827 * _2833;
    int _2877 = _2875 + _2421;
    float _2879 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2881 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2865);
    float _2883 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2885 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2887 = _2873 & 3;
    float _2889 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2891 = !_2857;
    int _2893 = _2891 ? 0 : (-1);
    float _2895 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2883);
    bool _2897 = !_2349;
    int _2899 = _2897 ? _2869 : (-1);
    float _2901 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2903 = uint(_2877) >= uint(_1805);
    float _2905 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2885);
    int _2907 = _2749 + _2887;
    float _2909 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = _2899 >> 31;
    float _2913 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    int _2915 = _2907 >> 2;
    float _2917 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    int _2919 = _2911 & 3;
    float _2921 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2923 = _2915 << 4;
    int _2925 = _2923 + 368;
    float _2927 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2901);
    int _2929 = _2899 + _2919;
    float _2931 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2921);
    int _2933 = ~_2801;
    int _2935 = _2933 + _2893;
    int _2937 = _2935 + 1;
    uint _2939 = uint(int(uint(_2925) >> uint(2)));
    uint _2941 = uint(int(uint(int(_2939)) >> uint(2)));
    int _2943 = int(_2939) & 3;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[int(_2941)][_2943];
    int _2947 = int(_2939) + 1;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    int _2951 = _2947 & 3;
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[int(_2949)][_2951];
    int _2955 = _2929 >> 2;
    float _2957 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    bool _2959 = !_2903;
    int _2961 = _2959 ? 0 : (-1);
    int _2963 = _1797 * _2937;
    int _2965 = _2963 + _2383;
    int _2967 = _2955 << 4;
    int _2969 = _2967 + 656;
    float _2971 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2931);
    int _2973 = ~_2833;
    int _2975 = _2973 + _2961;
    int _2977 = _2975 + 1;
    float _2979 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2917);
    uint _2981 = uint(int(uint(_2969) >> uint(2)));
    uint _2983 = uint(int(uint(int(_2981)) >> uint(2)));
    int _2985 = int(_2981) & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    int _2989 = int(_2981) + 1;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    int _2993 = _2989 & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    bool _2997 = _2761 != 3;
    float _2999 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2905);
    int _3001 = _1805 * _2977;
    int _3003 = _3001 + _2421;
    int _3005 = ~_2819;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3013 = !_2763;
    int _3015 = _3013 ? 0 : 1;
    float _3017 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2895);
    int _3019 = _2925 + 8;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = _2899 & 3;
    bool _3039 = _3037 != 0;
    float _3041 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2913);
    float _3043 = _3011 * _2881;
    int _3045 = abs(_2811);
    int _3047 = _3009;
    if (_2997)
    {
        int _3049 = ~_2819;
        int _3051 = _3049 + 1;
        _3047 = _3051;
    }
    int _3053 = _3047;
    float _3055 = _3011 * _2871;
    int _3057 = _2969 + 8;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    uint _3061 = uint(int(uint(int(_3059)) >> uint(2)));
    int _3063 = int(_3059) & 3;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[int(_3061)][_3063];
    int _3067 = int(_3059) + 1;
    uint _3069 = uint(int(uint(_3067) >> uint(2)));
    int _3071 = _3067 & 3;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[int(_3069)][_3071];
    int _3075 = _2899 & 3;
    bool _3077 = _3075 != 0;
    float _3079 = _3011 * _2879;
    int _3081 = _3039 ? 0 : 1;
    float _3083 = fma(_2357, _3017, _3055);
    bool _3085 = uint(_3075) > 1u;
    float _3087 = fma(_2357, _2999, _3079);
    bool _3089 = !_3077;
    int _3091 = _3089 ? 0 : 1;
    float _3093 = fma(_2357, _3041, _3043);
    bool _3095 = uint(_3075) >= 2u;
    out.m_90.x = _3017;
    out.m_90.y = _2999;
    out.m_90.z = _3041;
    int _3097 = ~_3081;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = _3095 ? 0 : 1;
    bool _3105 = _3075 != 3;
    int _3107 = _3101;
    if (!_3085)
    {
        int _3109 = ~_3081;
        int _3111 = _3109 + 1;
        _3107 = _3111;
    }
    int _3113 = _3107;
    bool _3115 = _2761 != 3;
    int _3117 = ~_3045;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = abs(_3015);
    int _3125 = abs(_3113);
    int _3127 = _3121 * as_type<int>(_2953);
    int _3129 = ~_3103;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = ~_3123;
    int _3137 = _3135 + 1;
    int _3139 = _3137 + 1;
    int _3141 = _3133;
    if (_3105)
    {
        int _3143 = ~_3103;
        int _3145 = _3143 + 1;
        _3141 = _3145;
    }
    int _3147 = _3141;
    int _3149 = abs(_3091);
    int _3151 = _3139 * as_type<int>(_2945);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3125;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = abs(_3053);
    int _3163 = abs(_3147);
    int _3165 = _3159 * as_type<int>(_2995);
    int _3167 = ~_3149;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    int _3173 = ~_3161;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3011, _3011, 1.0);
    int _3181 = ~_3163;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    int _3187 = _3171 * as_type<int>(_2987);
    int _3189 = _3187 + _3165;
    bool _3191 = _3075 != 3;
    int _3193 = _3177 * as_type<int>(_3027);
    int _3195 = _3193 + _3153;
    bool _3197 = !_3115;
    int _3199 = _3197 ? 0 : (-1);
    int _3201 = _3185 * as_type<int>(_3065);
    int _3203 = _3201 + _3189;
    bool _3205 = !_2253;
    int _3207 = _3205 ? 0 : 1;
    float _3209 = rsqrt(_3179);
    int _3211 = abs(_3199);
    float _3213 = _2979 + _3083;
    bool _3215 = !_3191;
    int _3217 = _3215 ? 0 : (-1);
    float _3219 = _2971 + _3093;
    bool _3221 = !_2257;
    int _3223 = _3221 ? 0 : 1;
    int _3225 = abs(_3207);
    int _3227 = abs(_3217);
    int _3229 = abs(_3223);
    float _3231 = _3011 * _3209;
    int _3233 = ~_3211;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3237 * as_type<int>(_3035);
    int _3241 = _3239 + _3195;
    int _3243 = ~_3225;
    int _3245 = _3243 + 1;
    int _3247 = _3245 + 1;
    float _3249 = _2957 + _3087;
    int _3251 = ~_3227;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    bool _3257 = !_2287;
    int _3259 = _3257 ? _2965 : (-1);
    int _3261 = _3241 * _3247;
    int _3263 = ~_3229;
    int _3265 = _3263 + 1;
    int _3267 = _3265 + 1;
    int _3269 = _3255 * as_type<int>(_3073);
    int _3271 = _3269 + _3203;
    bool _3273 = !_2349;
    int _3275 = _3273 ? _3003 : (-1);
    int _3277 = _3259 * _3225;
    int _3279 = _3277 + _3261;
    float _3281 = -_2979;
    float _3283 = _3231 * _3281;
    int _3285 = _3271 * _3267;
    float _3287 = -_2957;
    float _3289 = _3231 * _3287;
    float _3291 = _1584 + _1548;
    float _3293 = fma(_3209, _2871, _3283);
    int _3295 = _3275 * _3229;
    int _3297 = _3295 + _3285;
    float _3299 = fma(_3209, _2879, _3289);
    float _3301 = _1548 * 0.5;
    bool _3303 = _939 <= 8000.0;
    bool _3305 = isnan(_939);
    bool _3307 = _3303 || _3305;
    bool _3309 = isnan(8000.0);
    bool _3311 = _3307 || _3309;
    float _3313 = float(_3311);
    float _3315 = -_2971;
    float _3317 = _3231 * _3315;
    float _3319 = _2165 + _1548;
    float _3321 = fma(_1586, -0.5, _3301);
    float _3323 = fma(_3209, _2881, _3317);
    float _3325 = _3319 * 0.5;
    float _3327 = _3299;
    float _3329 = _3293;
    if (!_1530)
    {
        _1588 = 1.0;
    }
    float _3331 = _1588;
    float _3333 = fma(_2845, -2.0, 3.0);
    float _3335 = _2845 * _2845;
    float _3337 = _3331;
    if (_1530)
    {
        bool _3339 = _1632 >= _1596;
        bool _3341 = isnan(_1632);
        bool _3343 = _3339 || _3341;
        bool _3345 = isnan(_1596);
        bool _3347 = _3343 || _3345;
        float _3349 = float(_3347);
        _3337 = _3349;
    }
    float _3351 = _3337;
    out.m_92.x = _3293;
    out.m_92.y = _3299;
    out.m_92.z = _3323;
    float _3353 = _3291 * 0.5;
    float _3355 = _3335 * _3333;
    float _3357 = float(_3279);
    float _3359 = _3351 * _1781;
    float _3361 = float(_3297);
    float _3363 = -_3355;
    float _3365 = _3363 + 1.0;
    out.m_94.x = _3353;
    out.m_94.y = _3321;
    out.m_94.z = _3325;
    out.m_94.w = _1548;
    bool _3367 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3369 = isnan(_1819);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3375 = _3371 || _3373;
    float _3377 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3355);
    float _3379 = -_2149;
    float _3381 = _3379 + 1.0;
    out.m_96.x = _3357;
    float _3383 = _3313 * _3377;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_96.z = _3361;
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3389 = _3385 * _1634;
    float _3391 = -_3385;
    float _3393 = _3391 + 1.0;
    out.m_98.x = _3213;
    out.m_98.y = _3249;
    out.m_98.z = _3219;
    float _3395 = _2139 * _3387;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = _1645 * _3389;
    float _3401 = _2097 * _3389;
    float _3403 = _3385;
    float _3405 = _3393;
    if (!_3375)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3407 = _3327;
    float _3409 = -_3397;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3413 = fma(_2093, _3399, _1639);
    float _3415 = fma(_2095, _3399, _1641);
    float _3417 = _1645 * _3393;
    float _3419 = -_3359;
    float _3421 = fma(_3419, _3411, 1.0);
    float _3423 = precise::clamp(_3421, 0.0, 1.0);
    float _3425 = fma(_1645, _3401, _1643);
    float _3427 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3429 = _3423;
    float _3431 = _3407;
    float _3433 = _3407;
    if (!_3375)
    {
        _3329 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3329;
    float _3437 = _3423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3439 = _3435;
    float _3441 = _3435;
    if (!_3375)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3443 = _3403;
    out.m_100.x = _3413;
    out.m_100.y = _3415;
    out.m_100.z = _3425;
    out.m_100.w = _3417;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3375)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3449 = _2169;
    float _3451 = _3449;
    float _3453 = _3449;
    if (!_3375)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3455 = _3429;
    out.m_102.x = _3437;
    float _3457 = _3455;
    float _3459 = _3455;
    if (!_3375)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3461 = _3405;
    bool _3463 = !_3375;
    float _3465 = _3461;
    float _3467 = _3461;
    if (!_3463)
    {
        bool _3469 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3471 = isnan(_1819);
        bool _3473 = _3469 || _3471;
        bool _3475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3477 = _3473 || _3475;
        if (!_3477)
        {
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = _1819 + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3483;
            float _3487 = 1.0 / _3485;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3509 = _3481 * _3487;
            float _3511 = precise::clamp(_3509, 0.0, 1.0);
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = fma(_3511, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3519 = fma(_3511, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3521 = fma(_3511, _3495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3523 = fma(_3511, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3525 = fma(_3511, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3527 = fma(_3511, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3441 = _3519;
            _3459 = _3525;
            _3433 = _3517;
            _3453 = _3523;
            _3447 = _3521;
            _3467 = _3527;
            _3529 = true;
        }
        else
        {
            bool _3531 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3533 = isnan(_1819);
            bool _3535 = _3531 || _3533;
            bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3539 = _3535 || _3537;
            if (!_3539)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3541 = _3431;
            _3433 = _3541;
            if (!_3539)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3543 = _3439;
            _3441 = _3543;
            if (!_3539)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3545 = _3445;
            _3447 = _3545;
            if (!_3539)
            {
                _3451 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3547 = _3451;
            _3453 = _3547;
            if (!_3539)
            {
                _3457 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3549 = _3457;
            _3459 = _3549;
            if (!_3539)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3551 = _3465;
            bool _3553 = !_3539;
            _3467 = _3551;
            if (!_3553)
            {
                bool _3555 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3557 = isnan(_1819);
                bool _3559 = _3555 || _3557;
                bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3563 = _3559 || _3561;
                if (!_3563)
                {
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = _1819 + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3569;
                    float _3573 = 1.0 / _3571;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3595 = _3567 * _3573;
                    float _3597 = precise::clamp(_3595, 0.0, 1.0);
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = fma(_3597, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3441 = _3605;
                    _3459 = _3611;
                    _3433 = _3603;
                    _3453 = _3609;
                    _3447 = _3607;
                    _3467 = _3613;
                    _3529 = true;
                }
                else
                {
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3459 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3453 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3529 = false;
    float _3615 = _3441;
    float _3617 = _3459;
    float _3619 = _3433;
    float _3621 = _3453;
    float _3623 = _3447;
    float _3625 = _3467;
    float _3627 = fma(_3249, -0.5, 0.5);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3615;
    float _3633 = _3631 + _3617;
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    out.m_104.x = 0.0;
    float _3639 = fma(_3629, _3633, _3615);
    float _3641 = -_3623;
    float _3643 = _3641 + _3625;
    float _3645 = fma(_3629, _3637, _3619);
    float _3647 = _3639 * 0.586610972881317138671875;
    bool _3649 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3651 = fma(_3629, _3643, _3623);
    float _3653 = _3427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3655 = fma(_3645, 0.298911988735198974609375, _3647);
    bool _3657 = _1719 > 0.0;
    bool _3659 = isnan(_1719);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = fma(_3651, 0.114477999508380889892578125, _3655);
    out.m_63.x = _3653;
    float _3669 = -_3667;
    float _3671 = _3645 + _3669;
    float _3673 = -_3667;
    float _3675 = _3639 + _3673;
    float _3677 = -_3667;
    float _3679 = _3651 + _3677;
    float _3681 = fma(_3671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3683 = fma(_3675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    bool _3687 = !_3649;
    if (!_3687)
    {
        float _3689 = -_1462;
        float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3693 = -_1464;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3697 = -_1466;
        float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3701 = _3691 * _3691;
        float _3703 = fma(_3695, _3695, _3701);
        float _3705 = fma(_3699, _3699, _3703);
        float _3707 = sqrt(_3705);
        float _3709 = rsqrt(_3705);
        float _3711 = -_3707;
        float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3715 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3717 = precise::clamp(_3715, 0.0, 1.0);
        float _3719 = _3695 * _3709;
        float _3721 = _3691 * _3709;
        float _3723 = abs(_3717);
        float _3725 = log2(_3723);
        float _3727 = _3699 * _3709;
        float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3731 = _3249 * _3721;
        float _3733 = -_3721;
        float _3735 = -_3729;
        float _3737 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3735);
        float _3739 = fma(_3213, _3719, _3731);
        float _3741 = -_3727;
        float _3743 = fma(_3741, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3737);
        float _3745 = fma(_3219, _3727, _3739);
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3751 = _3743 + _3749;
        float _3753 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3755 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3757 = precise::clamp(_3755, 0.0, 1.0);
        float _3759 = exp2(_3753);
        float _3761 = _3759 * _3757;
        float _3763 = _3747 * _3761;
        float _3765 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3767 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3769 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _3765;
        out.m_104.y = _3767;
        out.m_104.z = _3769;
    }
    out.m_106.x = _3681;
    out.m_106.y = _3683;
    out.m_106.z = _3685;
    if (_3665)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_63.x = 0.0;
    float _3771 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3771;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3529 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
    float _122 = in.m_58.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3839 = as_type<float>(_149);
        out.gl_Position.z = _3839;
    }
    if (!_135)
    {
        return out;
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_183);
        out.gl_Position.z = _3904;
    }
    out.m_61.x = _177;
    if (_171)
    {
        return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _189 = as_type<int>(_185) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_185) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_187;
    float _221;
    if (!_205)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _177;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = in.m_72.x;
    float _249 = in.m_72.y;
    float _251 = 1.0 / _241;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    bool _257 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_225);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _245;
    float _271 = _229 * _255;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _225 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = _275 * _251;
    bool _283 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_225);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _233 * _269;
    float _301 = fma(_279, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -_267;
    float _323 = _321 + 1.0;
    float _325 = _267 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _331 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_225);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _313 * _323;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = fma(_329, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _341 * _347;
    float _357 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = _301 * _355;
    float _365 = _319 * _355;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_357, _343, _375);
    float _385 = fma(_353, _343, _377);
    float _387 = fma(_379, _325, _383);
    float _389 = fma(_381, _325, _385);
    float _391 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _247;
    float _397 = _393 * _249;
    bool _399 = !_253;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _179 = _413;
    }
    float _415 = _179;
    float _417 = in.m_56.x;
    float _419 = in.m_56.y;
    float _421 = in.m_56.z;
    float _423 = in.m_74.x;
    float _425 = in.m_74.y;
    float _427 = in.m_74.z;
    float _429 = in.m_74.w;
    float _431 = in.m_76.x;
    float _433 = in.m_76.y;
    float _435 = in.m_76.z;
    float _437 = in.m_76.w;
    float _439 = _419 * _425;
    float _441 = _419 * _433;
    float _443 = fma(_417, _423, _439);
    float _445 = fma(_417, _431, _441);
    float _447 = fma(_421, _427, _443);
    float _449 = fma(_421, _435, _445);
    float _451 = _447 + _429;
    float _453 = _449 + _437;
    float _455 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _457 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _459 = floor(_455);
    float _461 = floor(_457);
    float _463 = -_459;
    float _465 = _455 + _463;
    float _467 = -_461;
    float _469 = _457 + _467;
    float2 _4361 = float2(_465, _469);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4361, float2(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4361, float2(0.0), isnan(_4361)), level(0.0)).x;
    float _473 = in.m_65.z;
    float _475 = _163 * 2.0;
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    float _481 = in.m_78.x;
    float _483 = in.m_78.y;
    float _485 = in.m_78.z;
    float _487 = in.m_78.w;
    float _489 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _491 = _173 * _131;
    float _493 = in.m_65.y;
    bool _495 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _497 = isnan(0.0);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _503 = _499 || _501;
    float _505 = floor(_475);
    float _507 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _513 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _515 = int(_513);
    float _517 = _479 * _131;
    float _519 = _473 * 2.0;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _523 = int(_521);
    bool _525 = _505 >= 0.0;
    bool _527 = isnan(_505);
    bool _529 = _525 || _527;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    float _535 = _419 * _483;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _541 = _505 > 0.0;
    float _543 = _493 * 2.0;
    float _545 = fma(_417, _481, _535);
    float _547 = floor(_519);
    float _549 = _163 + _493;
    float _551 = -_537;
    float _553 = fma(_489, 2.0, _551);
    float _555 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _557 = _549 + (-1.0);
    float _559 = float(_515);
    float _561 = fma(_421, _485, _545);
    float _563 = floor(_543);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = _533 ? 0 : 1;
    float _569 = fma(_555, -2.0, _539);
    float _571 = float(_523);
    float _573 = _561 + _487;
    float _575 = -_131;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _553);
    bool _579 = _547 > 0.0;
    float _581 = exp2(_517);
    bool _583 = _547 >= 0.0;
    bool _585 = isnan(_547);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _595 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _569);
    float _597 = _573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _599 = _563 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _603 = 1.0 + _601;
    bool _605 = _563 >= 0.0;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = 1.0 / _559;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _619 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _597);
    int _621 = _613 ? 0 : 1;
    float _623 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].w, _617);
    float _625 = -_581;
    float _627 = _625 + 1.0;
    float _629 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _631 = 1.0 / _571;
    int _633 = ~_567;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _623);
    int _641 = _637;
    int _643 = 2;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_541)
    {
        int _647 = ~_567;
        int _649 = _647 + 1;
        _641 = _649;
    }
    int _651 = _641;
    float _653 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _593);
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _667 = _503 ? _627 : 0.0;
    float _669 = 1.0 / _603;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _681 = _679 != 0;
    float _683 = _615 * _131;
    float _685 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _653);
    float _687 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _689 = in.m_80.x;
    float _691 = in.m_80.y;
    float _693 = in.m_80.z;
    bool _695 = !_677;
    int _697 = _695 ? 0 : 1;
    float _699 = _631 * _131;
    bool _701 = !_673;
    int _703 = _701 ? 0 : 1;
    float _705 = _573 + _687;
    bool _707 = !_681;
    int _709 = _707 ? 0 : 1;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _721 = _719 != 0;
    float _723 = float(_651);
    if (_663)
    {
        float _725 = _667 * _669;
        _141 = _725;
    }
    float _727 = _141;
    int _729 = ~_621;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    float _735 = _705 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _737 = _733;
    if (!_599)
    {
        int _739 = ~_621;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _747 = !_717;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[126].x, _735);
    bool _753 = !_713;
    int _755 = _753 ? 0 : 1;
    float _757 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[126].z, _751);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _775 = _773 != 0;
    float _777 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _757);
    int _779 = _591 ? 0 : 1;
    float _781 = _763 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _783 = float(_743);
    float _785 = _777 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _787 = !_771;
    int _789 = _787 ? 0 : 1;
    int _791 = ~_779;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = 1.0 / _785;
    int _799 = abs(_789);
    float _801 = _665 + _785;
    bool _803 = !_767;
    int _805 = _803 ? 0 : 1;
    int _807 = _795;
    if (!_579)
    {
        int _809 = ~_779;
        int _811 = _809 + 1;
        _807 = _811;
    }
    int _813 = _807;
    int _815 = abs(_805);
    float _817 = float(_799);
    float _819 = float(_813);
    float _821 = _817 * _723;
    float _823 = float(_815);
    float _825 = _801 * _797;
    float _827 = _825 * 0.5;
    float _829 = _705 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _831 = _823 * _819;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
    float _837 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[127].x, _829);
    float _839 = _831 * (-2.0);
    bool _841 = !_775;
    int _843 = _841 ? 0 : 1;
    float _845 = trunc(_781);
    int _847 = int(_845);
    float _849 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[127].z, _837);
    float _851 = fma(_565, _839, _565);
    float _853 = fma(_839, _689, _689);
    float _855 = _493 + _473;
    float _857 = _163 + (-0.5);
    int _859 = abs(_843);
    float _861 = _849 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].x, _853);
    float _867 = float(_859);
    float _869 = _821 * (-2.0);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = fma(_851, _727, _865);
    float _875 = trunc(_861);
    int _877 = int(_875);
    float _879 = _867 * _783;
    float _881 = fma(_871, _869, _871);
    float _883 = fma(_869, _691, _691);
    float _885 = _163 + _473;
    float _887 = _493 + (-0.5);
    float _889 = _873 * 0.15915493667125701904296875;
    float _891 = _885 + (-1.0);
    float _893 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _883);
    float _895 = _879 * (-2.0);
    float _897 = 1.0 / _835;
    float _899 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _901 = fma(_881, _727, _893);
    float _903 = fma(_895, _693, _693);
    float _905 = _473 + (-0.5);
    float _907 = fma(_899, _895, _899);
    int _909 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _911 = _847 + _909;
    int _913 = _911 + 1;
    float _915 = _901 * 0.15915493667125701904296875;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _903);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _877 + _919;
    int _923 = _921 + 1;
    float _925 = _889 * 6.283185482025146484375;
    float _927 = sin(_925);
    bool _929 = _913 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_907, _727, _917);
    int _933 = _913 | _923;
    float _935 = _931 * 0.15915493667125701904296875;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _939 = _897 * _937;
    float _941 = _889 * 6.283185482025146484375;
    float _943 = cos(_941);
    bool _945 = _933 < 0;
    bool _947 = _945 || _929;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    bool _951 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _953 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _955 = _953 || _947;
    float _957 = _507 * _949;
    float _959 = _915 * 6.283185482025146484375;
    float _961 = sin(_959);
    bool _963 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _965 = !_951;
    int _967 = _965 ? 0 : 1;
    float _969 = _915 * 6.283185482025146484375;
    float _971 = cos(_969);
    if (!_951)
    {
        _643 = 1;
    }
    int _973 = _643;
    int _975 = 0;
    int _977 = _973;
    if (!_955)
    {
        int _979 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _981 = _979 + _913;
        _975 = _981;
    }
    int _983 = _975;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    if (!_963)
    {
        _977 = _967;
    }
    int _995 = _977;
    float _997 = _935 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = _927 * _961;
    int _1003 = _995 << 6;
    int _1005 = 0;
    float _1007 = as_type<float>(_995);
    float _1009 = as_type<float>(_1003);
    if (!_955)
    {
        int _1011 = _983 << 2;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1003 + 48;
    uint _1018 = uint(int(uint(_1015) >> uint(2)));
    uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
    int _1022 = int(_1018) & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    int _1026 = int(_1018) + 1;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    int _1030 = _1026 & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    float _1034 = _935 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _927 * _971;
    float _1040 = _943 * _971;
    int _1042 = _1013;
    if (!_955)
    {
        int _1044 = 12 & _1013;
        _1042 = _1044;
    }
    int _1046 = _1042;
    int _1048 = _1003 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = fma(_999, _1040, _1001);
    float _1068 = _943 * _961;
    float _1070 = fma(_999, _1001, _1040);
    float _1072 = -_957;
    float _1074 = _999 * _1072;
    float _1076 = 0.0;
    if (!_955)
    {
        float _1078 = floor(_781);
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = -_1068;
    float _1084 = fma(_999, _1038, _1082);
    float _1086 = -_1038;
    float _1088 = fma(_999, _1068, _1086);
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1092 = _927 * _1036;
    float _1094 = _971 * _1036;
    float _1096 = _943 * _1036;
    float _1098 = _961 * _1036;
    float _1100 = _509 * _1090;
    int _1102 = _1003 + 56;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
    float _1120 = _1096 * _957;
    float _1122 = _1092 * _957;
    float _1124 = fma(_1094, _1100, _1074);
    float _1126 = fma(_1066, _1100, _1120);
    float _1128 = fma(_1098, _511, _1124);
    int _1130 = _1003 + 96;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = fma(_1088, _511, _1126);
    float _1150 = fma(_1084, _1100, _1122);
    int _1152 = as_type<int>(_1124);
    if (!_955)
    {
        uint _1154 = uint(int(uint(_983) >> uint(2)));
        _1152 = int(_1154);
    }
    int _1156 = _1152;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = fma(_1070, _511, _1150);
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1164 = _1003 + 104;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1184 = 0.0;
    if (!_955)
    {
        int _1186 = _1156 << 4;
        int _1188 = _1186 + _1046;
        _1184 = as_type<float>(_1188);
    }
    float _1190 = _1184;
    float _1192 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1162);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1196 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1182);
    float _1198 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    int _1200 = _1003 + 72;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    float _1218 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1220 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1194);
    float _1222 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1224 = _705 * _1032;
    float _1226 = _453 + _1218;
    float _1228 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1230 = _451 + _1222;
    int _1232 = _1003 + 80;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1226 + _1250;
    float _1254 = fma(_451, _1024, _1224);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1230 + _1256;
    float _1260 = _1252 * _1252;
    int _1262 = _1003 + 88;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    float _1280 = fma(_1258, _1258, _1260);
    float _1282 = sqrt(_1280);
    float _1284 = _1190;
    float _1286 = _1230;
    float _1288 = _1226;
    float _1290 = _1228;
    float _1292 = _1252;
    float _1294 = _1258;
    if (!_955)
    {
        int _1296 = as_type<int>(_1190) + 400;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
        int _1302 = int(_1298) & 3;
        float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _705 * _1146;
    float _1310 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = fma(_451, _1138, _1308);
    bool _1314 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1308;
    float _1318 = _1310;
    if (!_955)
    {
        float _1320 = floor(_861);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = _573 + _1310;
    float _1326 = fma(_453, _1172, _1312);
    float _1328 = _705 * _1064;
    float _1330 = _1326 + _1180;
    float _1332 = fma(_451, _1056, _1328);
    float _1334 = fma(_453, _1110, _1254);
    float _1336 = fma(_453, _1208, _1332);
    float _1338 = 1.0 / _1330;
    float _1340 = _1334 + _1118;
    float _1342 = _1208;
    float _1344 = _1324;
    if (!_1314)
    {
        _1318 = _1324;
    }
    float _1346 = _1318;
    float _1348 = _1336 + _1216;
    bool _1350 = !_1314;
    float _1352 = _1346;
    float _1354 = _1322;
    if (!_1350)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1360 = _1282 + _1358;
        float _1362 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = rsqrt(_1280);
        float _1366 = _1360 * _1356;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = _1368 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = _1372 + (-1.0);
        float _1380 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = fma(_1376, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1384 = fma(_1324, _1372, _1380);
        float _1386 = _1364 * _1382;
        float _1388 = fma(_1258, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1390 = fma(_1252, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1286 = _1388;
        _1352 = _1384;
        _1288 = _1390;
    }
    float _1392 = _1286;
    float _1394 = _1352;
    float _1396 = _1288;
    float _1398 = _1396;
    if (_993)
    {
        _1290 = _1392;
    }
    float _1400 = _1290;
    float _1402 = _1400;
    if (_993)
    {
        _1292 = _1394;
    }
    float _1404 = _1292;
    float _1406 = _1404;
    if (_993)
    {
        _1294 = _1396;
    }
    float _1408 = _1294;
    float _1410 = _1408;
    if (!_993)
    {
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1414 = _573 + _1412;
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1418 = _451 + _1416;
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = -_573;
        float _1424 = _1422 + _1394;
        float _1426 = _1414 * _1414;
        float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1430 = _453 + _1428;
        float _1432 = -_451;
        float _1434 = _1432 + _1392;
        float _1436 = -_453;
        float _1438 = _1436 + _1396;
        float _1440 = fma(_1418, _1418, _1426);
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1444 = fma(_1430, _1430, _1440);
        float _1446 = sqrt(_1444);
        float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1450 = precise::min(_1446, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1452 = _1450 * _1442;
        float _1454 = _1448 * _1452;
        float _1456 = fma(_1424, _1454, _573);
        float _1458 = fma(_1434, _1454, _451);
        float _1460 = fma(_1438, _1454, _453);
        _1406 = _1456;
        _1402 = _1458;
        _1410 = _1460;
        _1398 = _1438;
    }
    float _1462 = _1406;
    float _1464 = _1402;
    float _1466 = _1410;
    float _1468 = _1398;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = _1340 * _1338;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    if (!_955)
    {
        float _1480 = rint(_1306);
        float _1482 = precise::max(_1480, 0.0);
        uint _1484 = uint(_1482);
        uint _1486 = clamp(_1484, 0u, 65535u);
        _1342 = as_type<float>(_1486);
    }
    float _1488 = _1342;
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1474);
    bool _1492 = _1472 >= 0.0;
    float _1494 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1478);
    float _1496 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1498 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = _1348 * _1338;
    float _1502 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    bool _1504 = _1472 <= 1.0;
    bool _1506 = _1504 && _1492;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1512 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1514 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1518 = _1500 >= 0.0;
    bool _1520 = _1518 && _1506;
    float _1522 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1512);
    float _1526 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    bool _1528 = _1500 <= 1.0;
    bool _1530 = _1528 && _1520;
    float _1532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1526);
    float _1540 = _705 * _1248;
    float _1542 = -_1534;
    float _1544 = fma(_1542, _1532, 1.0);
    float _1546 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1548 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1552 = fma(_451, _1240, _1540);
    float _1554 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1546);
    float _1556 = 1.0 / _1548;
    float _1558 = _1540;
    float _1560 = _1532;
    if (_1530)
    {
        float _1562 = float(_995);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1550);
    float _1568 = fma(_453, _1270, _1552);
    float _1570 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1554);
    if (!_955)
    {
        float _1572 = -_1322;
        float _1574 = _861 + _1572;
        _1354 = _1574;
    }
    float _1576 = _1354;
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1580 = _1568 + _1278;
    float _1582 = log2(_1544);
    float _1584 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1570);
    float _1586 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1578);
    float _1588 = _1586;
    if (!_955)
    {
        float _1590 = -_1080;
        float _1592 = _781 + _1590;
        _1560 = _1592;
    }
    float _1594 = _1560;
    float _1596 = _1580 * _1338;
    float _1598 = _1564;
    if (_1530)
    {
        float _1600 = rint(_1564);
        float _1602 = precise::max(_1600, 0.0);
        uint _1604 = uint(_1602);
        uint _1606 = clamp(_1604, 0u, 65535u);
        _1598 = as_type<float>(_1606);
    }
    float _1608 = _1598;
    float _1610 = _1584 * _1556;
    float _1612 = _1586 * _1556;
    float _1614 = fma(_1610, 0.5, 0.5);
    float _1616 = fma(_1612, -0.5, 0.5);
    float _1618 = _1582 * 0.693147182464599609375;
    float _1620 = _1488;
    if (!_955)
    {
        float3 _6187 = float3(_1594, _1576, float(as_type<int>(_1488)));
        float3 _6191 = select(_6187, float3(0.0), isnan(_6187));
        float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6191.xy, uint(rint(_6191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6191.xy, uint(rint(_6191.z)), level(0.0)).x;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1628 = _1500;
    if (_1530)
    {
        float3 _6210 = float3(_1472, _1500, float(as_type<int>(_1608)));
        float3 _6212 = select(_6210, float3(0.0), isnan(_6210));
        float _1630 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6212.xy, uint(rint(_6212.z)), _1596, level(0.0));
        _1628 = _1630;
    }
    float _1632 = _1628;
    float3 _6222 = float3(_1614, _1616, _1626);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6222, float3(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6222, float3(0.0), isnan(_6222)), level(0.0)).x;
    float3 _6231 = float3(_1614, _1616, _1626);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6231, float3(0.0), isnan(_6231)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6231, float3(0.0), isnan(_6231)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    bool _1647 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1655 = _1651 || _1653;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_955)
    {
        _1007 = 1.0;
    }
    float _1659 = _1007;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1663 = _1661 != 0;
    float _1665 = _1659;
    if (_1655)
    {
        _1657 = 1.0;
    }
    float _1667 = _1657;
    float _1669 = _1667;
    if (!_1655)
    {
        float _1671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = _1671 * 0.15915493667125701904296875;
        float _1675 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1677 = _1673 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 0.15915493667125701904296875;
        float _1683 = _1673 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = 1.0 / _1679;
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = _1681 * 6.283185482025146484375;
        float _1697 = sin(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = 1.0 / _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = 1.0 / _1705;
        float _1709 = _1697 * _1701;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1713 = fma(_939, _1709, _1711);
        float _1715 = _1713 * _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        _1669 = _1717;
    }
    float _1719 = _1669;
    if (!_955)
    {
        int _1721 = _983 << 4;
        int _1723 = _1721 + 2048;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        int _1741 = _1723 + 8;
        uint _1743 = uint(int(uint(_1741) >> uint(2)));
        uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
        int _1747 = int(_1743) & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = int(_1743) + 1;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        int _1755 = _1751 & 3;
        float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
        float _1759 = _705 * _1739;
        float _1761 = fma(_451, _1731, _1759);
        float _1763 = fma(_453, _1749, _1761);
        float _1765 = _1763 + _1757;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = -_1767;
        float _1771 = _1769 + _1624;
        float _1773 = fma(_1771, 500.0, 1.5);
        float _1775 = exp2(_1773);
        float _1777 = 0.0 + _1775;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1665 = _1779;
    }
    float _1781 = _1665;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1462 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1464 + _1787;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1793 = _1466 + _1791;
    float _1795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1797 = int(_1795);
    float _1799 = _1785 * _1785;
    float _1801 = fma(_1789, _1789, _1799);
    float _1803 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1805 = int(_1803);
    float _1807 = fma(_1793, _1793, _1801);
    float _1809 = rsqrt(_1807);
    float _1811 = float(uint(_1797));
    float _1813 = float(uint(_1805));
    float _1815 = 1.0 / _1811;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1819 = sqrt(_1807);
    float _1821 = _1789 * _1817;
    float _1823 = _1793 * _1817;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = 1.0 / _1813;
    int _1831 = as_type<int>(_1815) + (-2);
    float _1833 = _1825 + _1827;
    float _1835 = sqrt(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    bool _1839 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1835 + _1841;
    float _1845 = _1576;
    float _1847 = _1843;
    float _1849 = _1785;
    float _1851 = _1823;
    float _1853 = _1825;
    float _1855 = _1827;
    if (_1839)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1857;
    }
    float _1859 = _1845;
    if (_1839)
    {
        float _1861 = rsqrt(_1833);
        _1344 = _1861;
    }
    float _1863 = _1344;
    float _1865 = _1863;
    if (_1839)
    {
        float _1867 = _1843 * _1859;
        _1847 = _1867;
    }
    float _1869 = _1847;
    if (_1839)
    {
        float _1871 = _1869 * 0.15915493667125701904296875;
        _1009 = _1871;
    }
    float _1873 = _1009;
    float _1875 = _1468;
    if (_1839)
    {
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1885 = precise::max(0.0, _1883);
    float _1887 = _1282;
    float _1889 = _1883;
    if (_1839)
    {
        float _1891 = _1873 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1887 = _1893;
    }
    float _1895 = _1887;
    if (!_1839)
    {
        _1889 = _1821;
    }
    float _1897 = _1889;
    float _1899 = -_1817;
    float _1901 = -_1885;
    float _1903 = fma(_1785, _1899, _1901);
    float _1905 = _1897;
    if (_1839)
    {
        float _1907 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1849 = _1907;
    }
    float _1909 = _1849;
    float _1911 = trunc(_683);
    int _1913 = int(_1911);
    float _1915 = _1881;
    float _1917 = _1909;
    if (_1839)
    {
        float _1919 = fma(_1881, _1909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1839)
    {
        _1917 = _1903;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1839)
    {
        float _1929 = _1863 * _1921;
        _1865 = _1929;
    }
    float _1931 = _1865;
    if (_1839)
    {
        float _1933 = _1895 + (-1.0);
        _1923 = _1933;
    }
    float _1935 = _1923;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1821 * _1931;
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (_1839)
    {
        float _1943 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1839)
    {
        float _1947 = _1823 * _1931;
        _1851 = _1947;
    }
    float _1949 = _1851;
    float _1951 = trunc(_699);
    int _1953 = int(_1951);
    if (_1839)
    {
        float _1955 = _1941 * _1941;
        _1853 = _1955;
    }
    float _1957 = _1853;
    if (_1839)
    {
        float _1959 = fma(_1903, _1895, _1945);
        _1927 = _1959;
    }
    float _1961 = _1927;
    if (_1839)
    {
        float _1963 = _1949 * _1949;
        _1855 = _1963;
    }
    float _1965 = _1855;
    float _1967 = float(uint(_1913));
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = fma(_1961, _1961, _1957);
    int _1977 = ~_1805;
    int _1979 = _1977 + 1;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = _1975 + _1965;
    float _1987 = as_type<float>(_1831) * _1967;
    float _1989 = abs(_1983);
    float _1991 = log2(_1989);
    float _1993 = float(uint(_1953));
    float _1995 = rsqrt(_1985);
    float _1997 = as_type<float>(_1837) * _1993;
    float _1999 = trunc(_1987);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = _1995 * _1941;
    float _2007 = _1995 * _1961;
    float _2009 = trunc(_1997);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = _1995 * _1949;
    float _2017 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2019 = -_2017;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2025 = -_2015;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    int _2029 = ~_1797;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2023);
    float _2035 = fma(_2027, -0.5, 0.5);
    float _2037 = fma(_2027, 0.5, 0.5);
    int _2039 = _2031 * int(_2003);
    int _2041 = _2039 + _1913;
    int _2043 = _1979 * int(_2013);
    int _2045 = _2043 + _1953;
    float _2047 = sqrt(_2035);
    float _2049 = float(uint(_2041));
    float _2051 = fma(_2037, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = float(uint(_2045));
    float _2055 = _2007 + 1.0;
    float _2057 = as_type<float>(_1831) * _2049;
    float _2059 = fma(_2037, _2051, -0.212114393711090087890625);
    float _2061 = as_type<float>(_1837) * _2053;
    float _2063 = -_2007;
    float _2065 = fma(_2033, _2055, _2063);
    float _2067 = trunc(_2057);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    float _2073 = fma(_2037, _2059, 1.570728778839111328125);
    float _2075 = fma(_2065, 0.5, 0.5);
    float _2077 = _2047 * 0.636619746685028076171875;
    float _2079 = trunc(_2061);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = -_2073;
    float _2087 = fma(_2077, _2085, 1.0);
    float2 _6892 = float2(_2087, _2075);
    float3 _2091 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).xyz;
    float _2093 = _2091.x;
    float _2095 = _2091.y;
    float _2097 = _2091.z;
    int _2099 = ~_1797;
    int _2101 = _2099 + 1;
    out.m_82.x = _509;
    float _2103 = as_type<float>(_1979);
    float _2105 = as_type<float>(_2101);
    if (_1663)
    {
        _2103 = _163;
    }
    float _2107 = _2103;
    float _2109 = -_685;
    float _2111 = _2109 + 1.0;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2115 = _2113 != 0;
    float _2117 = -_639;
    float _2119 = _2117 + 1.0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2123 = _2121 != 0;
    float _2125 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _2107;
    if (!_1663)
    {
        _2127 = _473;
    }
    float _2129 = _2127;
    float _2131 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1663)
    {
        _645 = 1.0;
    }
    float _2133 = _645;
    float _2135 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2137 = -_471;
    float _2139 = _2137 + 1.0;
    float _2141 = _2133;
    if (!_1663)
    {
        _2141 = 5.839270114898681640625;
    }
    float _2143 = _2141;
    float _2145 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    int _2147 = int(_2003) + int(_2071);
    float _2149 = exp2(_2131);
    if (_1663)
    {
        _2105 = 1.0;
    }
    float _2151 = _2105;
    float _2153 = _2143 * _2129;
    int _2155 = int(_2013) + int(_2083);
    int _2157 = _2101 * _2147;
    int _2159 = _2157 + _1913;
    int _2161 = ~_1805;
    int _2163 = _2161 + 1;
    float _2165 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = _2151;
    float _2169 = _2165;
    if (!_1663)
    {
        _2167 = 7.345489978790283203125;
    }
    float _2171 = _2167;
    float _2173 = floor(_2153);
    float _2175 = float(_1797);
    int _2177 = _2163 * _2155;
    int _2179 = _2177 + _1953;
    bool _2181 = uint(_2159) >= uint(_1797);
    float _2183 = _2171 * _163;
    float _2185 = float(_1913);
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _1548;
    bool _2187 = uint(_2179) >= uint(_1805);
    float _2189 = floor(_2183);
    bool _2191 = _2185 >= _2175;
    bool _2193 = isnan(_2185);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_2175);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = !_2181;
    int _2205 = _2203 ? 0 : (-1);
    bool _2207 = _163 > 0.5;
    float _2209 = trunc(_2201);
    int _2211 = int(_2209);
    int _2213 = ~_2147;
    int _2215 = _2213 + _2205;
    int _2217 = _2215 + 1;
    bool _2219 = !_2115;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2229 = _2227 != 0;
    float _2231 = -_2189;
    float _2233 = _2183 + _2231;
    float _2235 = float(_1805);
    float _2237 = float(_1953);
    bool _2239 = !_2225;
    int _2241 = _2239 ? 0 : 1;
    bool _2243 = !_2187;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : 1;
    int _2251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2253 = _2251 != 0;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2257 = _2255 != 0;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2265 = _2263 != 0;
    bool _2267 = _2237 >= _2235;
    bool _2269 = isnan(_2237);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(_2235);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    int _2279 = _1797 * _2217;
    int _2281 = _2279 + _1913;
    bool _2283 = !_2123;
    int _2285 = _2283 ? 0 : 1;
    bool _2287 = _1797 == 0;
    float _2289 = -_199;
    int _2291 = _2207 ? as_type<int>(_2289) : as_type<int>(_199);
    float _2293 = trunc(_2277);
    int _2295 = int(_2293);
    bool _2297 = _493 > 0.5;
    float _2299 = _2233 * _2175;
    int _2301 = ~_2211;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    float _2307 = -_2173;
    float _2309 = _2153 + _2307;
    bool _2311 = !_2287;
    int _2313 = _2311 ? _2281 : (-1);
    float _2315 = _2175 * _491;
    int _2317 = _1797 + (-1);
    float _2319 = trunc(_2299);
    int _2321 = int(_2319);
    int _2323 = ~_2155;
    int _2325 = _2323 + _2245;
    int _2327 = _2325 + 1;
    int _2329 = _2313 * _2305;
    float _2331 = _2235 * _491;
    float _2333 = _2309 * _2235;
    int _2335 = abs(_2241);
    int _2337 = _2211 * _2317;
    int _2339 = _2337 + _2329;
    bool _2341 = !_2261;
    float _2343 = _2341 ? _199 : as_type<float>(_2291);
    int _2345 = _1805 * _2327;
    int _2347 = _2345 + _1953;
    bool _2349 = _1805 == 0;
    float _2351 = trunc(_2315);
    int _2353 = int(_2351);
    int _2355 = abs(_697);
    float _2357 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2359 = abs(_703);
    int _2361 = ~_2295;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    bool _2367 = !_2349;
    int _2369 = _2367 ? _2347 : (-1);
    float _2371 = trunc(_2333);
    int _2373 = int(_2371);
    int _2375 = _1805 + (-1);
    int _2377 = _2369 * _2365;
    int _2379 = abs(_761);
    int _2381 = _2321 * _2335;
    int _2383 = _2381 + _1913;
    int _2385 = _2339 * _2355;
    float _2387 = trunc(_2331);
    int _2389 = int(_2387);
    int _2391 = _2295 * _2375;
    int _2393 = _2391 + _2377;
    int _2395 = abs(_749);
    int _2397 = _2353 * _2359;
    int _2399 = _2397 + _2385;
    int _2401 = abs(_709);
    int _2403 = _2393 * _2395;
    int _2405 = abs(_2249);
    int _2407 = _2383 * _2401;
    int _2409 = _2407 + _2399;
    int _2411 = abs(_2221);
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2417 = abs(_755);
    int _2419 = _2373 * _2405;
    int _2421 = _2419 + _1953;
    int _2423 = abs(_2285);
    int _2425 = _2321 * _2411;
    int _2427 = _2425 + _2409;
    float _2429 = 1.0 / _2415;
    int _2431 = _2389 * _2417;
    int _2433 = _2431 + _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2437 = _415 + _2435;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2441 = float(uint(_2427));
    int _2443 = _2421 * _2379;
    int _2445 = _2443 + _2433;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2449;
    float _2453 = as_type<float>(_1831) * _2441;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2459 = _2373 * _2423;
    int _2461 = _2459 + _2445;
    float _2463 = _2451 * _2429;
    float _2465 = trunc(_2453);
    float _2467 = precise::max(_2465, 0.0);
    uint _2469 = uint(_2467);
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2473 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_2463, _2437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2479 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2481 = isnan(_415);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2487 = _2483 || _2485;
    float _2489 = float(_2487);
    bool _2491 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2493 = isnan(_415);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    out.m_84.x = _2473;
    out.m_84.y = _2475;
    out.m_84.z = _2447;
    out.m_84.w = _2471;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2507 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2509 = isnan(_415);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    int _2519 = ~_1797;
    int _2521 = _2519 + 1;
    float _2523 = float(uint(_2461));
    float _2525 = 1.0 / _2505;
    float _2527 = -_2517;
    float _2529 = _2527 + 1.0;
    float _2531 = float(uint(_2383));
    float _2533 = as_type<float>(_1837) * _2523;
    float _2535 = -_2489;
    float _2537 = _2535 + 1.0;
    float _2539 = -_2501;
    float _2541 = _2539 + 1.0;
    bool _2543 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2545 = isnan(_415);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = _2501 * _2537;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2561 = _2517 * _2541;
    int _2563 = _2521 * int(_2469);
    int _2565 = _2563 + _2427;
    float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2571 = _2553 * _2529;
    float _2573 = 1.0 / _2559;
    float _2575 = float(uint(_2565));
    float _2577 = _2477 * _2571;
    float _2579 = _2569 * _2525;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2583 = _415 + _2581;
    float _2585 = -_2553;
    float _2587 = _2585 + 1.0;
    float _2589 = as_type<float>(_1831) * _2575;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2591;
    float _2595 = trunc(_2533);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2579, _2583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2605 = _415 + _2603;
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2577);
    float _2609 = _2343 + 0.5;
    float _2611 = as_type<float>(_1831) * _2531;
    float _2613 = trunc(_2589);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = _2593 * _2573;
    int _2621 = ~_1805;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    float _2627 = float(uint(_2421));
    float _2629 = fma(_2619, _2605, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2631 = fma(_2601, _2561, _2607);
    int _2633 = ~_1797;
    int _2635 = _2633 + 1;
    int _2637 = _2623 * int(_2599);
    int _2639 = _2637 + _2461;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    float _2647 = fma(_2629, _2555, _2631);
    float _2649 = as_type<float>(_1837) * _2627;
    int _2651 = ~_1805;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    int _2657 = int(_2469) + int(_2617);
    float _2659 = trunc(_2649);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = ~_1797;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_1837) * _2655;
    float _2671 = -_203;
    int _2673 = _2297 ? as_type<int>(_2671) : as_type<int>(_203);
    int _2675 = _2667 * _2657;
    int _2677 = _2675 + _2427;
    bool _2679 = !_2265;
    float _2681 = _2679 ? _203 : as_type<float>(_2673);
    float _2683 = trunc(_2669);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2635 * int(_2645);
    int _2691 = _2689 + _2383;
    bool _2693 = uint(_2677) >= uint(_1797);
    float _2695 = _2681 + (-0.5);
    float _2697 = float(uint(_2691));
    float _2699 = -_2695;
    float _2701 = -_595;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2701);
    bool _2705 = !_2693;
    int _2707 = _2705 ? 0 : (-1);
    float _2709 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2647);
    float _2711 = abs(_939);
    float _2713 = log2(_2711);
    float _2715 = as_type<float>(_1831) * _2697;
    int _2717 = ~_2657;
    int _2719 = _2717 + _2707;
    int _2721 = _2719 + 1;
    int _2723 = _2653 * int(_2663);
    int _2725 = _2723 + _2421;
    int _2727 = int(_2599) + int(_2687);
    int _2729 = _1797 * _2721;
    int _2731 = _2729 + _2427;
    float _2733 = -_2111;
    float _2735 = fma(_2343, _2733, _2625);
    float _2737 = trunc(_2715);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = float(uint(_2725));
    float _2745 = fma(_2681, _2119, _2703);
    bool _2747 = !_2287;
    int _2749 = _2747 ? _2731 : (-1);
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2753 = as_type<float>(_1837) * _2743;
    int _2755 = _2749 & 3;
    bool _2757 = _2755 != 0;
    float _2759 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2761 = _2749 & 3;
    bool _2763 = _2761 != 0;
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2767 = _2757 ? 0 : 1;
    float _2769 = trunc(_2753);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    bool _2775 = uint(_2761) > 1u;
    float _2777 = _2709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2781 = ~_1805;
    int _2783 = _2781 + 1;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2795 = exp2(_2759);
    int _2797 = _2783 * _2727;
    int _2799 = _2797 + _2461;
    int _2801 = int(_2645) + int(_2741);
    float _2803 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _2735;
    out.m_86.y = _2745;
    int _2805 = _2791;
    if (!_2775)
    {
        int _2807 = ~_2767;
        int _2809 = _2807 + 1;
        _2805 = _2809;
    }
    int _2811 = _2805;
    int _2813 = ~_1797;
    int _2815 = _2813 + 1;
    out.m_88.x = _2779;
    out.m_88.y = _2785;
    out.m_88.z = _2803;
    out.m_88.w = _2777;
    bool _2817 = uint(_2761) >= 2u;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2823 = uint(_2799) >= uint(_1805);
    int _2825 = ~_1805;
    int _2827 = _2825 + 1;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2663) + int(_2773);
    int _2835 = _2815 * _2801;
    int _2837 = _2835 + _2383;
    float _2839 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2843 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    int _2847 = ~_2727;
    int _2849 = _2847 + _2831;
    int _2851 = _2849 + 1;
    float _2853 = -_999;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    bool _2857 = uint(_2837) >= uint(_1797);
    float _2859 = -_999;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2863 = -_999;
    float _2865 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2867 = _1805 * _2851;
    int _2869 = _2867 + _2461;
    float _2871 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2861);
    int _2873 = _2749 >> 31;
    int _2875 = _2827 * _2833;
    int _2877 = _2875 + _2421;
    float _2879 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2881 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2865);
    float _2883 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2885 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2887 = _2873 & 3;
    float _2889 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2891 = !_2857;
    int _2893 = _2891 ? 0 : (-1);
    float _2895 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2883);
    bool _2897 = !_2349;
    int _2899 = _2897 ? _2869 : (-1);
    float _2901 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2903 = uint(_2877) >= uint(_1805);
    float _2905 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2885);
    int _2907 = _2749 + _2887;
    float _2909 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = _2899 >> 31;
    float _2913 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    int _2915 = _2907 >> 2;
    float _2917 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    int _2919 = _2911 & 3;
    float _2921 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2923 = _2915 << 4;
    int _2925 = _2923 + 368;
    float _2927 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2901);
    int _2929 = _2899 + _2919;
    float _2931 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2921);
    int _2933 = ~_2801;
    int _2935 = _2933 + _2893;
    int _2937 = _2935 + 1;
    uint _2939 = uint(int(uint(_2925) >> uint(2)));
    uint _2941 = uint(int(uint(int(_2939)) >> uint(2)));
    int _2943 = int(_2939) & 3;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[int(_2941)][_2943];
    int _2947 = int(_2939) + 1;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    int _2951 = _2947 & 3;
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[int(_2949)][_2951];
    int _2955 = _2929 >> 2;
    float _2957 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    bool _2959 = !_2903;
    int _2961 = _2959 ? 0 : (-1);
    int _2963 = _1797 * _2937;
    int _2965 = _2963 + _2383;
    int _2967 = _2955 << 4;
    int _2969 = _2967 + 656;
    float _2971 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2931);
    int _2973 = ~_2833;
    int _2975 = _2973 + _2961;
    int _2977 = _2975 + 1;
    float _2979 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2917);
    uint _2981 = uint(int(uint(_2969) >> uint(2)));
    uint _2983 = uint(int(uint(int(_2981)) >> uint(2)));
    int _2985 = int(_2981) & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    int _2989 = int(_2981) + 1;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    int _2993 = _2989 & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    bool _2997 = _2761 != 3;
    float _2999 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2905);
    int _3001 = _1805 * _2977;
    int _3003 = _3001 + _2421;
    int _3005 = ~_2819;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3013 = !_2763;
    int _3015 = _3013 ? 0 : 1;
    float _3017 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2895);
    int _3019 = _2925 + 8;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = _2899 & 3;
    bool _3039 = _3037 != 0;
    float _3041 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2913);
    float _3043 = _3011 * _2881;
    int _3045 = abs(_2811);
    int _3047 = _3009;
    if (_2997)
    {
        int _3049 = ~_2819;
        int _3051 = _3049 + 1;
        _3047 = _3051;
    }
    int _3053 = _3047;
    float _3055 = _3011 * _2871;
    int _3057 = _2969 + 8;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    uint _3061 = uint(int(uint(int(_3059)) >> uint(2)));
    int _3063 = int(_3059) & 3;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[int(_3061)][_3063];
    int _3067 = int(_3059) + 1;
    uint _3069 = uint(int(uint(_3067) >> uint(2)));
    int _3071 = _3067 & 3;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[int(_3069)][_3071];
    int _3075 = _2899 & 3;
    bool _3077 = _3075 != 0;
    float _3079 = _3011 * _2879;
    int _3081 = _3039 ? 0 : 1;
    float _3083 = fma(_2357, _3017, _3055);
    bool _3085 = uint(_3075) > 1u;
    float _3087 = fma(_2357, _2999, _3079);
    bool _3089 = !_3077;
    int _3091 = _3089 ? 0 : 1;
    float _3093 = fma(_2357, _3041, _3043);
    bool _3095 = uint(_3075) >= 2u;
    out.m_90.x = _3017;
    out.m_90.y = _2999;
    out.m_90.z = _3041;
    int _3097 = ~_3081;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = _3095 ? 0 : 1;
    bool _3105 = _3075 != 3;
    int _3107 = _3101;
    if (!_3085)
    {
        int _3109 = ~_3081;
        int _3111 = _3109 + 1;
        _3107 = _3111;
    }
    int _3113 = _3107;
    bool _3115 = _2761 != 3;
    int _3117 = ~_3045;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = abs(_3015);
    int _3125 = abs(_3113);
    int _3127 = _3121 * as_type<int>(_2953);
    int _3129 = ~_3103;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = ~_3123;
    int _3137 = _3135 + 1;
    int _3139 = _3137 + 1;
    int _3141 = _3133;
    if (_3105)
    {
        int _3143 = ~_3103;
        int _3145 = _3143 + 1;
        _3141 = _3145;
    }
    int _3147 = _3141;
    int _3149 = abs(_3091);
    int _3151 = _3139 * as_type<int>(_2945);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3125;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = abs(_3053);
    int _3163 = abs(_3147);
    int _3165 = _3159 * as_type<int>(_2995);
    int _3167 = ~_3149;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    int _3173 = ~_3161;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3011, _3011, 1.0);
    int _3181 = ~_3163;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    int _3187 = _3171 * as_type<int>(_2987);
    int _3189 = _3187 + _3165;
    bool _3191 = _3075 != 3;
    int _3193 = _3177 * as_type<int>(_3027);
    int _3195 = _3193 + _3153;
    bool _3197 = !_3115;
    int _3199 = _3197 ? 0 : (-1);
    int _3201 = _3185 * as_type<int>(_3065);
    int _3203 = _3201 + _3189;
    bool _3205 = !_2253;
    int _3207 = _3205 ? 0 : 1;
    float _3209 = rsqrt(_3179);
    int _3211 = abs(_3199);
    float _3213 = _2979 + _3083;
    bool _3215 = !_3191;
    int _3217 = _3215 ? 0 : (-1);
    float _3219 = _2971 + _3093;
    bool _3221 = !_2257;
    int _3223 = _3221 ? 0 : 1;
    int _3225 = abs(_3207);
    int _3227 = abs(_3217);
    int _3229 = abs(_3223);
    float _3231 = _3011 * _3209;
    int _3233 = ~_3211;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3237 * as_type<int>(_3035);
    int _3241 = _3239 + _3195;
    int _3243 = ~_3225;
    int _3245 = _3243 + 1;
    int _3247 = _3245 + 1;
    float _3249 = _2957 + _3087;
    int _3251 = ~_3227;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    bool _3257 = !_2287;
    int _3259 = _3257 ? _2965 : (-1);
    int _3261 = _3241 * _3247;
    int _3263 = ~_3229;
    int _3265 = _3263 + 1;
    int _3267 = _3265 + 1;
    int _3269 = _3255 * as_type<int>(_3073);
    int _3271 = _3269 + _3203;
    bool _3273 = !_2349;
    int _3275 = _3273 ? _3003 : (-1);
    int _3277 = _3259 * _3225;
    int _3279 = _3277 + _3261;
    float _3281 = -_2979;
    float _3283 = _3231 * _3281;
    int _3285 = _3271 * _3267;
    float _3287 = -_2957;
    float _3289 = _3231 * _3287;
    float _3291 = _1584 + _1548;
    float _3293 = fma(_3209, _2871, _3283);
    int _3295 = _3275 * _3229;
    int _3297 = _3295 + _3285;
    float _3299 = fma(_3209, _2879, _3289);
    float _3301 = _1548 * 0.5;
    bool _3303 = _939 <= 8000.0;
    bool _3305 = isnan(_939);
    bool _3307 = _3303 || _3305;
    bool _3309 = isnan(8000.0);
    bool _3311 = _3307 || _3309;
    float _3313 = float(_3311);
    float _3315 = -_2971;
    float _3317 = _3231 * _3315;
    float _3319 = _2165 + _1548;
    float _3321 = fma(_1586, -0.5, _3301);
    float _3323 = fma(_3209, _2881, _3317);
    float _3325 = _3319 * 0.5;
    float _3327 = _3299;
    float _3329 = _3293;
    if (!_1530)
    {
        _1588 = 1.0;
    }
    float _3331 = _1588;
    float _3333 = fma(_2845, -2.0, 3.0);
    float _3335 = _2845 * _2845;
    float _3337 = _3331;
    if (_1530)
    {
        bool _3339 = _1632 >= _1596;
        bool _3341 = isnan(_1632);
        bool _3343 = _3339 || _3341;
        bool _3345 = isnan(_1596);
        bool _3347 = _3343 || _3345;
        float _3349 = float(_3347);
        _3337 = _3349;
    }
    float _3351 = _3337;
    out.m_92.x = _3293;
    out.m_92.y = _3299;
    out.m_92.z = _3323;
    float _3353 = _3291 * 0.5;
    float _3355 = _3335 * _3333;
    float _3357 = float(_3279);
    float _3359 = _3351 * _1781;
    float _3361 = float(_3297);
    float _3363 = -_3355;
    float _3365 = _3363 + 1.0;
    out.m_94.x = _3353;
    out.m_94.y = _3321;
    out.m_94.z = _3325;
    out.m_94.w = _1548;
    bool _3367 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3369 = isnan(_1819);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3375 = _3371 || _3373;
    float _3377 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3355);
    float _3379 = -_2149;
    float _3381 = _3379 + 1.0;
    out.m_96.x = _3357;
    float _3383 = _3313 * _3377;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_96.z = _3361;
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3389 = _3385 * _1634;
    float _3391 = -_3385;
    float _3393 = _3391 + 1.0;
    out.m_98.x = _3213;
    out.m_98.y = _3249;
    out.m_98.z = _3219;
    float _3395 = _2139 * _3387;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = _1645 * _3389;
    float _3401 = _2097 * _3389;
    float _3403 = _3385;
    float _3405 = _3393;
    if (!_3375)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3407 = _3327;
    float _3409 = -_3397;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3413 = fma(_2093, _3399, _1639);
    float _3415 = fma(_2095, _3399, _1641);
    float _3417 = _1645 * _3393;
    float _3419 = -_3359;
    float _3421 = fma(_3419, _3411, 1.0);
    float _3423 = precise::clamp(_3421, 0.0, 1.0);
    float _3425 = fma(_1645, _3401, _1643);
    float _3427 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3429 = _3423;
    float _3431 = _3407;
    float _3433 = _3407;
    if (!_3375)
    {
        _3329 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3329;
    float _3437 = _3423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3439 = _3435;
    float _3441 = _3435;
    if (!_3375)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3443 = _3403;
    out.m_100.x = _3413;
    out.m_100.y = _3415;
    out.m_100.z = _3425;
    out.m_100.w = _3417;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3375)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3449 = _2169;
    float _3451 = _3449;
    float _3453 = _3449;
    if (!_3375)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3455 = _3429;
    out.m_102.x = _3437;
    float _3457 = _3455;
    float _3459 = _3455;
    if (!_3375)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3461 = _3405;
    bool _3463 = !_3375;
    float _3465 = _3461;
    float _3467 = _3461;
    if (!_3463)
    {
        bool _3469 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3471 = isnan(_1819);
        bool _3473 = _3469 || _3471;
        bool _3475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3477 = _3473 || _3475;
        if (!_3477)
        {
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = _1819 + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3483;
            float _3487 = 1.0 / _3485;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3509 = _3481 * _3487;
            float _3511 = precise::clamp(_3509, 0.0, 1.0);
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = fma(_3511, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3519 = fma(_3511, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3521 = fma(_3511, _3495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3523 = fma(_3511, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3525 = fma(_3511, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3527 = fma(_3511, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3441 = _3519;
            _3459 = _3525;
            _3433 = _3517;
            _3453 = _3523;
            _3447 = _3521;
            _3467 = _3527;
            _3529 = true;
        }
        else
        {
            bool _3531 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3533 = isnan(_1819);
            bool _3535 = _3531 || _3533;
            bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3539 = _3535 || _3537;
            if (!_3539)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3541 = _3431;
            _3433 = _3541;
            if (!_3539)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3543 = _3439;
            _3441 = _3543;
            if (!_3539)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3545 = _3445;
            _3447 = _3545;
            if (!_3539)
            {
                _3451 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3547 = _3451;
            _3453 = _3547;
            if (!_3539)
            {
                _3457 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3549 = _3457;
            _3459 = _3549;
            if (!_3539)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3551 = _3465;
            bool _3553 = !_3539;
            _3467 = _3551;
            if (!_3553)
            {
                bool _3555 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3557 = isnan(_1819);
                bool _3559 = _3555 || _3557;
                bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3563 = _3559 || _3561;
                if (!_3563)
                {
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = _1819 + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3569;
                    float _3573 = 1.0 / _3571;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3595 = _3567 * _3573;
                    float _3597 = precise::clamp(_3595, 0.0, 1.0);
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = fma(_3597, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3441 = _3605;
                    _3459 = _3611;
                    _3433 = _3603;
                    _3453 = _3609;
                    _3447 = _3607;
                    _3467 = _3613;
                    _3529 = true;
                }
                else
                {
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3459 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3453 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3529 = false;
    float _3615 = _3441;
    float _3617 = _3459;
    float _3619 = _3433;
    float _3621 = _3453;
    float _3623 = _3447;
    float _3625 = _3467;
    float _3627 = fma(_3249, -0.5, 0.5);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3615;
    float _3633 = _3631 + _3617;
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    out.m_104.x = 0.0;
    float _3639 = fma(_3629, _3633, _3615);
    float _3641 = -_3623;
    float _3643 = _3641 + _3625;
    float _3645 = fma(_3629, _3637, _3619);
    float _3647 = _3639 * 0.586610972881317138671875;
    bool _3649 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3651 = fma(_3629, _3643, _3623);
    float _3653 = _3427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3655 = fma(_3645, 0.298911988735198974609375, _3647);
    bool _3657 = _1719 > 0.0;
    bool _3659 = isnan(_1719);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = fma(_3651, 0.114477999508380889892578125, _3655);
    out.m_63.x = _3653;
    float _3669 = -_3667;
    float _3671 = _3645 + _3669;
    float _3673 = -_3667;
    float _3675 = _3639 + _3673;
    float _3677 = -_3667;
    float _3679 = _3651 + _3677;
    float _3681 = fma(_3671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3683 = fma(_3675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    bool _3687 = !_3649;
    if (!_3687)
    {
        float _3689 = -_1462;
        float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3693 = -_1464;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3697 = -_1466;
        float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3701 = _3691 * _3691;
        float _3703 = fma(_3695, _3695, _3701);
        float _3705 = fma(_3699, _3699, _3703);
        float _3707 = sqrt(_3705);
        float _3709 = rsqrt(_3705);
        float _3711 = -_3707;
        float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3715 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3717 = precise::clamp(_3715, 0.0, 1.0);
        float _3719 = _3695 * _3709;
        float _3721 = _3691 * _3709;
        float _3723 = abs(_3717);
        float _3725 = log2(_3723);
        float _3727 = _3699 * _3709;
        float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3731 = _3249 * _3721;
        float _3733 = -_3721;
        float _3735 = -_3729;
        float _3737 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3735);
        float _3739 = fma(_3213, _3719, _3731);
        float _3741 = -_3727;
        float _3743 = fma(_3741, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3737);
        float _3745 = fma(_3219, _3727, _3739);
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3751 = _3743 + _3749;
        float _3753 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3755 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3757 = precise::clamp(_3755, 0.0, 1.0);
        float _3759 = exp2(_3753);
        float _3761 = _3759 * _3757;
        float _3763 = _3747 * _3761;
        float _3765 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3767 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3769 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _3765;
        out.m_104.y = _3767;
        out.m_104.z = _3769;
    }
    out.m_106.x = _3681;
    out.m_106.y = _3683;
    out.m_106.z = _3685;
    if (_3665)
    {
        return out;
    }
    out.m_63.x = 0.0;
    float _3771 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3771;
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
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3529 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _120 = in.m_56.w;
    float _122 = in.m_58.w;
    float _124 = trunc(_120);
    int _127 = int(_124);
    float _129 = -_122;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_61.y = _131;
    bool _135 = _127 >= 1;
    float _137 = 0.0;
    float _139 = _122;
    float _141 = _131;
    if (!_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _137;
    if (!_135)
    {
        out.m_63.x = 0.0;
    }
    int _145 = 0;
    if (!_135)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    int _151 = _149;
    if (!_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3839 = as_type<float>(_149);
        out.gl_Position.z = _3839;
    }
    if (!_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _153 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_122);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    float _163 = in.m_65.x;
    float _165 = float(_127);
    bool _167 = _131 >= _165;
    bool _169 = !_161;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _139;
    if (_171)
    {
        out.m_63.x = 0.0;
    }
    float _177 = _131 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _151 = as_type<int>(_181);
    }
    int _183 = _151;
    out.m_67.x = _163;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3904 = as_type<float>(_183);
        out.gl_Position.z = _3904;
    }
    out.m_61.x = _177;
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    bool _187 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _189 = as_type<int>(_185) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_185) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_187;
    float _221;
    if (!_205)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _177;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = in.m_72.x;
    float _249 = in.m_72.y;
    float _251 = 1.0 / _241;
    bool _253 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _255 = 1.0 / _237;
    bool _257 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _259 = isnan(_225);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = 1.0 / _245;
    float _271 = _229 * _255;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _275 = _225 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = _275 * _251;
    bool _283 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _285 = isnan(_225);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _295;
    float _299 = _233 * _269;
    float _301 = fma(_279, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _303 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_225);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_293;
    float _317 = _315 + 1.0;
    float _319 = fma(_297, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _321 = -_267;
    float _323 = _321 + 1.0;
    float _325 = _267 * _317;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _331 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_225);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = _313 * _323;
    float _345 = -_313;
    float _347 = _345 + 1.0;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = fma(_329, _281, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _355 = _341 * _347;
    float _357 = fma(_351, _281, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = -_341;
    float _361 = _359 + 1.0;
    float _363 = _301 * _355;
    float _365 = _319 * _355;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _299, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _299, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_357, _343, _375);
    float _385 = fma(_353, _343, _377);
    float _387 = fma(_379, _325, _383);
    float _389 = fma(_381, _325, _385);
    float _391 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _247;
    float _397 = _393 * _249;
    bool _399 = !_253;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _403 = _163 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].y, _131);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _179 = _413;
    }
    float _415 = _179;
    float _417 = in.m_56.x;
    float _419 = in.m_56.y;
    float _421 = in.m_56.z;
    float _423 = in.m_74.x;
    float _425 = in.m_74.y;
    float _427 = in.m_74.z;
    float _429 = in.m_74.w;
    float _431 = in.m_76.x;
    float _433 = in.m_76.y;
    float _435 = in.m_76.z;
    float _437 = in.m_76.w;
    float _439 = _419 * _425;
    float _441 = _419 * _433;
    float _443 = fma(_417, _423, _439);
    float _445 = fma(_417, _431, _441);
    float _447 = fma(_421, _427, _443);
    float _449 = fma(_421, _435, _445);
    float _451 = _447 + _429;
    float _453 = _449 + _437;
    float _455 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _457 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _459 = floor(_455);
    float _461 = floor(_457);
    float _463 = -_459;
    float _465 = _455 + _463;
    float _467 = -_461;
    float _469 = _457 + _467;
    float2 _4361 = float2(_465, _469);
    float _471 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4361, float2(0.0), isnan(_4361)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4361, float2(0.0), isnan(_4361)), level(0.0)).x;
    float _473 = in.m_65.z;
    float _475 = _163 * 2.0;
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    float _481 = in.m_78.x;
    float _483 = in.m_78.y;
    float _485 = in.m_78.z;
    float _487 = in.m_78.w;
    float _489 = _163 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _491 = _173 * _131;
    float _493 = in.m_65.y;
    bool _495 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _497 = isnan(0.0);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _503 = _499 || _501;
    float _505 = floor(_475);
    float _507 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _509 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _511 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _513 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _515 = int(_513);
    float _517 = _479 * _131;
    float _519 = _473 * 2.0;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _523 = int(_521);
    bool _525 = _505 >= 0.0;
    bool _527 = isnan(_505);
    bool _529 = _525 || _527;
    bool _531 = isnan(0.0);
    bool _533 = _529 || _531;
    float _535 = _419 * _483;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _541 = _505 > 0.0;
    float _543 = _493 * 2.0;
    float _545 = fma(_417, _481, _535);
    float _547 = floor(_519);
    float _549 = _163 + _493;
    float _551 = -_537;
    float _553 = fma(_489, 2.0, _551);
    float _555 = _493 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _557 = _549 + (-1.0);
    float _559 = float(_515);
    float _561 = fma(_421, _485, _545);
    float _563 = floor(_543);
    float _565 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _567 = _533 ? 0 : 1;
    float _569 = fma(_555, -2.0, _539);
    float _571 = float(_523);
    float _573 = _561 + _487;
    float _575 = -_131;
    float _577 = fma(_575, (*spvDescriptorSet0.vp_c9)._m0[76].x, _553);
    bool _579 = _547 > 0.0;
    float _581 = exp2(_517);
    bool _583 = _547 >= 0.0;
    bool _585 = isnan(_547);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _595 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[76].y, _569);
    float _597 = _573 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _599 = _563 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _603 = 1.0 + _601;
    bool _605 = _563 >= 0.0;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = 1.0 / _559;
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _619 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[10].x, _597);
    int _621 = _613 ? 0 : 1;
    float _623 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[78].w, _617);
    float _625 = -_581;
    float _627 = _625 + 1.0;
    float _629 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[10].z, _619);
    float _631 = 1.0 / _571;
    int _633 = ~_567;
    int _635 = _633 + 1;
    int _637 = _635 + 1;
    float _639 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].w, _623);
    int _641 = _637;
    int _643 = 2;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_541)
    {
        int _647 = ~_567;
        int _649 = _647 + 1;
        _641 = _649;
    }
    int _651 = _641;
    float _653 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[78].z, _593);
    bool _655 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _657 = isnan(1.0);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _663 = _659 || _661;
    float _665 = _629 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _667 = _503 ? _627 : 0.0;
    float _669 = 1.0 / _603;
    int _671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _673 = _671 != 0;
    int _675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _677 = _675 != 0;
    int _679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _681 = _679 != 0;
    float _683 = _615 * _131;
    float _685 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[77].z, _653);
    float _687 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _689 = in.m_80.x;
    float _691 = in.m_80.y;
    float _693 = in.m_80.z;
    bool _695 = !_677;
    int _697 = _695 ? 0 : 1;
    float _699 = _631 * _131;
    bool _701 = !_673;
    int _703 = _701 ? 0 : 1;
    float _705 = _573 + _687;
    bool _707 = !_681;
    int _709 = _707 ? 0 : 1;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _717 = _715 != 0;
    int _719 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _721 = _719 != 0;
    float _723 = float(_651);
    if (_663)
    {
        float _725 = _667 * _669;
        _141 = _725;
    }
    float _727 = _141;
    int _729 = ~_621;
    int _731 = _729 + 1;
    int _733 = _731 + 1;
    float _735 = _705 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    int _737 = _733;
    if (!_599)
    {
        int _739 = ~_621;
        int _741 = _739 + 1;
        _737 = _741;
    }
    int _743 = _737;
    float _745 = _573 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _747 = !_717;
    int _749 = _747 ? 0 : 1;
    float _751 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[126].x, _735);
    bool _753 = !_713;
    int _755 = _753 ? 0 : 1;
    float _757 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[11].x, _745);
    bool _759 = !_721;
    int _761 = _759 ? 0 : 1;
    float _763 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[126].z, _751);
    int _765 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _767 = _765 != 0;
    int _769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _771 = _769 != 0;
    int _773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _775 = _773 != 0;
    float _777 = fma(_453, (*spvDescriptorSet0.vp_c8)._m0[11].z, _757);
    int _779 = _591 ? 0 : 1;
    float _781 = _763 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _783 = float(_743);
    float _785 = _777 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _787 = !_771;
    int _789 = _787 ? 0 : 1;
    int _791 = ~_779;
    int _793 = _791 + 1;
    int _795 = _793 + 1;
    float _797 = 1.0 / _785;
    int _799 = abs(_789);
    float _801 = _665 + _785;
    bool _803 = !_767;
    int _805 = _803 ? 0 : 1;
    int _807 = _795;
    if (!_579)
    {
        int _809 = ~_779;
        int _811 = _809 + 1;
        _807 = _811;
    }
    int _813 = _807;
    int _815 = abs(_805);
    float _817 = float(_799);
    float _819 = float(_813);
    float _821 = _817 * _723;
    float _823 = float(_815);
    float _825 = _801 * _797;
    float _827 = _825 * 0.5;
    float _829 = _705 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _831 = _823 * _819;
    float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _835 = fma(_827, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
    float _837 = fma(_451, (*spvDescriptorSet0.vp_c15)._m0[127].x, _829);
    float _839 = _831 * (-2.0);
    bool _841 = !_775;
    int _843 = _841 ? 0 : 1;
    float _845 = trunc(_781);
    int _847 = int(_845);
    float _849 = fma(_453, (*spvDescriptorSet0.vp_c15)._m0[127].z, _837);
    float _851 = fma(_565, _839, _565);
    float _853 = fma(_839, _689, _689);
    float _855 = _493 + _473;
    float _857 = _163 + (-0.5);
    int _859 = abs(_843);
    float _861 = _849 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _863 = _855 + (-1.0);
    float _865 = fma(_857, (*spvDescriptorSet0.vp_c9)._m0[196].x, _853);
    float _867 = float(_859);
    float _869 = _821 * (-2.0);
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _873 = fma(_851, _727, _865);
    float _875 = trunc(_861);
    int _877 = int(_875);
    float _879 = _867 * _783;
    float _881 = fma(_871, _869, _871);
    float _883 = fma(_869, _691, _691);
    float _885 = _163 + _473;
    float _887 = _493 + (-0.5);
    float _889 = _873 * 0.15915493667125701904296875;
    float _891 = _885 + (-1.0);
    float _893 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[196].y, _883);
    float _895 = _879 * (-2.0);
    float _897 = 1.0 / _835;
    float _899 = fma(_891, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _901 = fma(_881, _727, _893);
    float _903 = fma(_895, _693, _693);
    float _905 = _473 + (-0.5);
    float _907 = fma(_899, _895, _899);
    int _909 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _911 = _847 + _909;
    int _913 = _911 + 1;
    float _915 = _901 * 0.15915493667125701904296875;
    float _917 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[196].z, _903);
    int _919 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _921 = _877 + _919;
    int _923 = _921 + 1;
    float _925 = _889 * 6.283185482025146484375;
    float _927 = sin(_925);
    bool _929 = _913 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _931 = fma(_907, _727, _917);
    int _933 = _913 | _923;
    float _935 = _931 * 0.15915493667125701904296875;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _939 = _897 * _937;
    float _941 = _889 * 6.283185482025146484375;
    float _943 = cos(_941);
    bool _945 = _933 < 0;
    bool _947 = _945 || _929;
    float _949 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    bool _951 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _953 = _923 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _955 = _953 || _947;
    float _957 = _507 * _949;
    float _959 = _915 * 6.283185482025146484375;
    float _961 = sin(_959);
    bool _963 = _939 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _965 = !_951;
    int _967 = _965 ? 0 : 1;
    float _969 = _915 * 6.283185482025146484375;
    float _971 = cos(_969);
    if (!_951)
    {
        _643 = 1;
    }
    int _973 = _643;
    int _975 = 0;
    int _977 = _973;
    if (!_955)
    {
        int _979 = _923 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _981 = _979 + _913;
        _975 = _981;
    }
    int _983 = _975;
    bool _985 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _987 = isnan(0.5);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _993 = _989 || _991;
    if (!_963)
    {
        _977 = _967;
    }
    int _995 = _977;
    float _997 = _935 * 6.283185482025146484375;
    float _999 = sin(_997);
    float _1001 = _927 * _961;
    int _1003 = _995 << 6;
    int _1005 = 0;
    float _1007 = as_type<float>(_995);
    float _1009 = as_type<float>(_1003);
    if (!_955)
    {
        int _1011 = _983 << 2;
        _1005 = _1011;
    }
    int _1013 = _1005;
    int _1015 = _1003 + 48;
    uint _1018 = uint(int(uint(_1015) >> uint(2)));
    uint _1020 = uint(int(uint(int(_1018)) >> uint(2)));
    int _1022 = int(_1018) & 3;
    float _1024 = (*spvDescriptorSet0.vp_c15)._m0[int(_1020)][_1022];
    int _1026 = int(_1018) + 1;
    uint _1028 = uint(int(uint(_1026) >> uint(2)));
    int _1030 = _1026 & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    float _1034 = _935 * 6.283185482025146484375;
    float _1036 = cos(_1034);
    float _1038 = _927 * _971;
    float _1040 = _943 * _971;
    int _1042 = _1013;
    if (!_955)
    {
        int _1044 = 12 & _1013;
        _1042 = _1044;
    }
    int _1046 = _1042;
    int _1048 = _1003 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = fma(_999, _1040, _1001);
    float _1068 = _943 * _961;
    float _1070 = fma(_999, _1001, _1040);
    float _1072 = -_957;
    float _1074 = _999 * _1072;
    float _1076 = 0.0;
    if (!_955)
    {
        float _1078 = floor(_781);
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = -_1068;
    float _1084 = fma(_999, _1038, _1082);
    float _1086 = -_1038;
    float _1088 = fma(_999, _1068, _1086);
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1092 = _927 * _1036;
    float _1094 = _971 * _1036;
    float _1096 = _943 * _1036;
    float _1098 = _961 * _1036;
    float _1100 = _509 * _1090;
    int _1102 = _1003 + 56;
    uint _1104 = uint(int(uint(_1102) >> uint(2)));
    uint _1106 = uint(int(uint(int(_1104)) >> uint(2)));
    int _1108 = int(_1104) & 3;
    float _1110 = (*spvDescriptorSet0.vp_c15)._m0[int(_1106)][_1108];
    int _1112 = int(_1104) + 1;
    uint _1114 = uint(int(uint(_1112) >> uint(2)));
    int _1116 = _1112 & 3;
    float _1118 = (*spvDescriptorSet0.vp_c15)._m0[int(_1114)][_1116];
    float _1120 = _1096 * _957;
    float _1122 = _1092 * _957;
    float _1124 = fma(_1094, _1100, _1074);
    float _1126 = fma(_1066, _1100, _1120);
    float _1128 = fma(_1098, _511, _1124);
    int _1130 = _1003 + 96;
    uint _1132 = uint(int(uint(_1130) >> uint(2)));
    uint _1134 = uint(int(uint(int(_1132)) >> uint(2)));
    int _1136 = int(_1132) & 3;
    float _1138 = (*spvDescriptorSet0.vp_c15)._m0[int(_1134)][_1136];
    int _1140 = int(_1132) + 1;
    uint _1142 = uint(int(uint(_1140) >> uint(2)));
    int _1144 = _1140 & 3;
    float _1146 = (*spvDescriptorSet0.vp_c15)._m0[int(_1142)][_1144];
    float _1148 = fma(_1088, _511, _1126);
    float _1150 = fma(_1084, _1100, _1122);
    int _1152 = as_type<int>(_1124);
    if (!_955)
    {
        uint _1154 = uint(int(uint(_983) >> uint(2)));
        _1152 = int(_1154);
    }
    int _1156 = _1152;
    float _1158 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1160 = fma(_1070, _511, _1150);
    float _1162 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1164 = _1003 + 104;
    uint _1166 = uint(int(uint(_1164) >> uint(2)));
    uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
    int _1170 = int(_1166) & 3;
    float _1172 = (*spvDescriptorSet0.vp_c15)._m0[int(_1168)][_1170];
    int _1174 = int(_1166) + 1;
    uint _1176 = uint(int(uint(_1174) >> uint(2)));
    int _1178 = _1174 & 3;
    float _1180 = (*spvDescriptorSet0.vp_c15)._m0[int(_1176)][_1178];
    float _1182 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1158);
    float _1184 = 0.0;
    if (!_955)
    {
        int _1186 = _1156 << 4;
        int _1188 = _1186 + _1046;
        _1184 = as_type<float>(_1188);
    }
    float _1190 = _1184;
    float _1192 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1162);
    float _1194 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1196 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1182);
    float _1198 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1192);
    int _1200 = _1003 + 72;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c15)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c15)._m0[int(_1212)][_1214];
    float _1218 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1220 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1194);
    float _1222 = _1198 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1224 = _705 * _1032;
    float _1226 = _453 + _1218;
    float _1228 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1220);
    float _1230 = _451 + _1222;
    int _1232 = _1003 + 80;
    uint _1234 = uint(int(uint(_1232) >> uint(2)));
    uint _1236 = uint(int(uint(int(_1234)) >> uint(2)));
    int _1238 = int(_1234) & 3;
    float _1240 = (*spvDescriptorSet0.vp_c15)._m0[int(_1236)][_1238];
    int _1242 = int(_1234) + 1;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    int _1246 = _1242 & 3;
    float _1248 = (*spvDescriptorSet0.vp_c15)._m0[int(_1244)][_1246];
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1252 = _1226 + _1250;
    float _1254 = fma(_451, _1024, _1224);
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1258 = _1230 + _1256;
    float _1260 = _1252 * _1252;
    int _1262 = _1003 + 88;
    uint _1264 = uint(int(uint(_1262) >> uint(2)));
    uint _1266 = uint(int(uint(int(_1264)) >> uint(2)));
    int _1268 = int(_1264) & 3;
    float _1270 = (*spvDescriptorSet0.vp_c15)._m0[int(_1266)][_1268];
    int _1272 = int(_1264) + 1;
    uint _1274 = uint(int(uint(_1272) >> uint(2)));
    int _1276 = _1272 & 3;
    float _1278 = (*spvDescriptorSet0.vp_c15)._m0[int(_1274)][_1276];
    float _1280 = fma(_1258, _1258, _1260);
    float _1282 = sqrt(_1280);
    float _1284 = _1190;
    float _1286 = _1230;
    float _1288 = _1226;
    float _1290 = _1228;
    float _1292 = _1252;
    float _1294 = _1258;
    if (!_955)
    {
        int _1296 = as_type<int>(_1190) + 400;
        uint _1298 = uint(int(uint(_1296) >> uint(2)));
        uint _1300 = uint(int(uint(int(_1298)) >> uint(2)));
        int _1302 = int(_1298) & 3;
        float _1304 = (*spvDescriptorSet0.vp_c15)._m0[int(_1300)][_1302];
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _705 * _1146;
    float _1310 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1312 = fma(_451, _1138, _1308);
    bool _1314 = _1282 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1316 = _1308;
    float _1318 = _1310;
    if (!_955)
    {
        float _1320 = floor(_861);
        _1316 = _1320;
    }
    float _1322 = _1316;
    float _1324 = _573 + _1310;
    float _1326 = fma(_453, _1172, _1312);
    float _1328 = _705 * _1064;
    float _1330 = _1326 + _1180;
    float _1332 = fma(_451, _1056, _1328);
    float _1334 = fma(_453, _1110, _1254);
    float _1336 = fma(_453, _1208, _1332);
    float _1338 = 1.0 / _1330;
    float _1340 = _1334 + _1118;
    float _1342 = _1208;
    float _1344 = _1324;
    if (!_1314)
    {
        _1318 = _1324;
    }
    float _1346 = _1318;
    float _1348 = _1336 + _1216;
    bool _1350 = !_1314;
    float _1352 = _1346;
    float _1354 = _1322;
    if (!_1350)
    {
        float _1356 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1360 = _1282 + _1358;
        float _1362 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = rsqrt(_1280);
        float _1366 = _1360 * _1356;
        float _1368 = _1366 * 0.15915493667125701904296875;
        float _1370 = _1368 * 6.283185482025146484375;
        float _1372 = cos(_1370);
        float _1374 = _1368 * 6.283185482025146484375;
        float _1376 = sin(_1374);
        float _1378 = _1372 + (-1.0);
        float _1380 = _1378 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1382 = fma(_1376, _1362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1384 = fma(_1324, _1372, _1380);
        float _1386 = _1364 * _1382;
        float _1388 = fma(_1258, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1390 = fma(_1252, _1386, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1286 = _1388;
        _1352 = _1384;
        _1288 = _1390;
    }
    float _1392 = _1286;
    float _1394 = _1352;
    float _1396 = _1288;
    float _1398 = _1396;
    if (_993)
    {
        _1290 = _1392;
    }
    float _1400 = _1290;
    float _1402 = _1400;
    if (_993)
    {
        _1292 = _1394;
    }
    float _1404 = _1292;
    float _1406 = _1404;
    if (_993)
    {
        _1294 = _1396;
    }
    float _1408 = _1294;
    float _1410 = _1408;
    if (!_993)
    {
        float _1412 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1414 = _573 + _1412;
        float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1418 = _451 + _1416;
        float _1420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1422 = -_573;
        float _1424 = _1422 + _1394;
        float _1426 = _1414 * _1414;
        float _1428 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1430 = _453 + _1428;
        float _1432 = -_451;
        float _1434 = _1432 + _1392;
        float _1436 = -_453;
        float _1438 = _1436 + _1396;
        float _1440 = fma(_1418, _1418, _1426);
        float _1442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1444 = fma(_1430, _1430, _1440);
        float _1446 = sqrt(_1444);
        float _1448 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1450 = precise::min(_1446, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1452 = _1450 * _1442;
        float _1454 = _1448 * _1452;
        float _1456 = fma(_1424, _1454, _573);
        float _1458 = fma(_1434, _1454, _451);
        float _1460 = fma(_1438, _1454, _453);
        _1406 = _1456;
        _1402 = _1458;
        _1410 = _1460;
        _1398 = _1438;
    }
    float _1462 = _1406;
    float _1464 = _1402;
    float _1466 = _1410;
    float _1468 = _1398;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = _1340 * _1338;
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1476 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    if (!_955)
    {
        float _1480 = rint(_1306);
        float _1482 = precise::max(_1480, 0.0);
        uint _1484 = uint(_1482);
        uint _1486 = clamp(_1484, 0u, 65535u);
        _1342 = as_type<float>(_1486);
    }
    float _1488 = _1342;
    float _1490 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1474);
    bool _1492 = _1472 >= 0.0;
    float _1494 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1478);
    float _1496 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1476);
    float _1498 = _1462 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1500 = _1348 * _1338;
    float _1502 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    bool _1504 = _1472 <= 1.0;
    bool _1506 = _1504 && _1492;
    float _1508 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1510 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1496);
    float _1512 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1498);
    float _1514 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1518 = _1500 >= 0.0;
    bool _1520 = _1518 && _1506;
    float _1522 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1512);
    float _1526 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1516);
    bool _1528 = _1500 <= 1.0;
    bool _1530 = _1528 && _1520;
    float _1532 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1526);
    float _1540 = _705 * _1248;
    float _1542 = -_1534;
    float _1544 = fma(_1542, _1532, 1.0);
    float _1546 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1548 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1538);
    float _1550 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1552 = fma(_451, _1240, _1540);
    float _1554 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1546);
    float _1556 = 1.0 / _1548;
    float _1558 = _1540;
    float _1560 = _1532;
    if (_1530)
    {
        float _1562 = float(_995);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1550);
    float _1568 = fma(_453, _1270, _1552);
    float _1570 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1554);
    if (!_955)
    {
        float _1572 = -_1322;
        float _1574 = _861 + _1572;
        _1354 = _1574;
    }
    float _1576 = _1354;
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1566);
    float _1580 = _1568 + _1278;
    float _1582 = log2(_1544);
    float _1584 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1570);
    float _1586 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1578);
    float _1588 = _1586;
    if (!_955)
    {
        float _1590 = -_1080;
        float _1592 = _781 + _1590;
        _1560 = _1592;
    }
    float _1594 = _1560;
    float _1596 = _1580 * _1338;
    float _1598 = _1564;
    if (_1530)
    {
        float _1600 = rint(_1564);
        float _1602 = precise::max(_1600, 0.0);
        uint _1604 = uint(_1602);
        uint _1606 = clamp(_1604, 0u, 65535u);
        _1598 = as_type<float>(_1606);
    }
    float _1608 = _1598;
    float _1610 = _1584 * _1556;
    float _1612 = _1586 * _1556;
    float _1614 = fma(_1610, 0.5, 0.5);
    float _1616 = fma(_1612, -0.5, 0.5);
    float _1618 = _1582 * 0.693147182464599609375;
    float _1620 = _1488;
    if (!_955)
    {
        float3 _6187 = float3(_1594, _1576, float(as_type<int>(_1488)));
        float3 _6191 = select(_6187, float3(0.0), isnan(_6187));
        float _1622 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6191.xy, uint(rint(_6191.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6191.xy, uint(rint(_6191.z)), level(0.0)).x;
        _1620 = _1622;
    }
    float _1624 = _1620;
    float _1626 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1628 = _1500;
    if (_1530)
    {
        float3 _6210 = float3(_1472, _1500, float(as_type<int>(_1608)));
        float3 _6212 = select(_6210, float3(0.0), isnan(_6210));
        float _1630 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6212.xy, uint(rint(_6212.z)), _1596, level(0.0));
        _1628 = _1630;
    }
    float _1632 = _1628;
    float3 _6222 = float3(_1614, _1616, _1626);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6222, float3(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6222, float3(0.0), isnan(_6222)), level(0.0)).x;
    float3 _6231 = float3(_1614, _1616, _1626);
    float4 _1637 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6231, float3(0.0), isnan(_6231)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6231, float3(0.0), isnan(_6231)), level(0.0)).xyzw;
    float _1639 = _1637.x;
    float _1641 = _1637.y;
    float _1643 = _1637.z;
    float _1645 = _1637.w;
    bool _1647 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1649 = isnan(0.5);
    bool _1651 = _1647 || _1649;
    bool _1653 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1655 = _1651 || _1653;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_955)
    {
        _1007 = 1.0;
    }
    float _1659 = _1007;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1663 = _1661 != 0;
    float _1665 = _1659;
    if (_1655)
    {
        _1657 = 1.0;
    }
    float _1667 = _1657;
    float _1669 = _1667;
    if (!_1655)
    {
        float _1671 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = _1671 * 0.15915493667125701904296875;
        float _1675 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1677 = _1673 * 6.283185482025146484375;
        float _1679 = cos(_1677);
        float _1681 = _1675 * 0.15915493667125701904296875;
        float _1683 = _1673 * 6.283185482025146484375;
        float _1685 = sin(_1683);
        float _1687 = 1.0 / _1679;
        float _1689 = _1681 * 6.283185482025146484375;
        float _1691 = cos(_1689);
        float _1693 = _1685 * _1687;
        float _1695 = _1681 * 6.283185482025146484375;
        float _1697 = sin(_1695);
        float _1699 = _1691 * _1693;
        float _1701 = 1.0 / _1699;
        float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1705 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1703;
        float _1707 = 1.0 / _1705;
        float _1709 = _1697 * _1701;
        float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1713 = fma(_939, _1709, _1711);
        float _1715 = _1713 * _1707;
        float _1717 = precise::clamp(_1715, 0.0, 1.0);
        _1669 = _1717;
    }
    float _1719 = _1669;
    if (!_955)
    {
        int _1721 = _983 << 4;
        int _1723 = _1721 + 2048;
        uint _1725 = uint(int(uint(_1723) >> uint(2)));
        uint _1727 = uint(int(uint(int(_1725)) >> uint(2)));
        int _1729 = int(_1725) & 3;
        float _1731 = (*spvDescriptorSet0.vp_c15)._m0[int(_1727)][_1729];
        int _1733 = int(_1725) + 1;
        uint _1735 = uint(int(uint(_1733) >> uint(2)));
        int _1737 = _1733 & 3;
        float _1739 = (*spvDescriptorSet0.vp_c15)._m0[int(_1735)][_1737];
        int _1741 = _1723 + 8;
        uint _1743 = uint(int(uint(_1741) >> uint(2)));
        uint _1745 = uint(int(uint(int(_1743)) >> uint(2)));
        int _1747 = int(_1743) & 3;
        float _1749 = (*spvDescriptorSet0.vp_c15)._m0[int(_1745)][_1747];
        int _1751 = int(_1743) + 1;
        uint _1753 = uint(int(uint(_1751) >> uint(2)));
        int _1755 = _1751 & 3;
        float _1757 = (*spvDescriptorSet0.vp_c15)._m0[int(_1753)][_1755];
        float _1759 = _705 * _1739;
        float _1761 = fma(_451, _1731, _1759);
        float _1763 = fma(_453, _1749, _1761);
        float _1765 = _1763 + _1757;
        float _1767 = precise::clamp(_1765, 0.0, 1.0);
        float _1769 = -_1767;
        float _1771 = _1769 + _1624;
        float _1773 = fma(_1771, 500.0, 1.5);
        float _1775 = exp2(_1773);
        float _1777 = 0.0 + _1775;
        float _1779 = precise::clamp(_1777, 0.0, 1.0);
        _1665 = _1779;
    }
    float _1781 = _1665;
    float _1783 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1785 = _1462 + _1783;
    float _1787 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1789 = _1464 + _1787;
    float _1791 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1793 = _1466 + _1791;
    float _1795 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1797 = int(_1795);
    float _1799 = _1785 * _1785;
    float _1801 = fma(_1789, _1789, _1799);
    float _1803 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1805 = int(_1803);
    float _1807 = fma(_1793, _1793, _1801);
    float _1809 = rsqrt(_1807);
    float _1811 = float(uint(_1797));
    float _1813 = float(uint(_1805));
    float _1815 = 1.0 / _1811;
    float _1817 = _1809 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1819 = sqrt(_1807);
    float _1821 = _1789 * _1817;
    float _1823 = _1793 * _1817;
    float _1825 = _1821 * _1821;
    float _1827 = _1823 * _1823;
    float _1829 = 1.0 / _1813;
    int _1831 = as_type<int>(_1815) + (-2);
    float _1833 = _1825 + _1827;
    float _1835 = sqrt(_1833);
    int _1837 = as_type<int>(_1829) + (-2);
    bool _1839 = _1835 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1841 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1843 = _1835 + _1841;
    float _1845 = _1576;
    float _1847 = _1843;
    float _1849 = _1785;
    float _1851 = _1823;
    float _1853 = _1825;
    float _1855 = _1827;
    if (_1839)
    {
        float _1857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1845 = _1857;
    }
    float _1859 = _1845;
    if (_1839)
    {
        float _1861 = rsqrt(_1833);
        _1344 = _1861;
    }
    float _1863 = _1344;
    float _1865 = _1863;
    if (_1839)
    {
        float _1867 = _1843 * _1859;
        _1847 = _1867;
    }
    float _1869 = _1847;
    if (_1839)
    {
        float _1871 = _1869 * 0.15915493667125701904296875;
        _1009 = _1871;
    }
    float _1873 = _1009;
    float _1875 = _1468;
    if (_1839)
    {
        float _1877 = _1873 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        _1875 = _1879;
    }
    float _1881 = _1875;
    float _1883 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1885 = precise::max(0.0, _1883);
    float _1887 = _1282;
    float _1889 = _1883;
    if (_1839)
    {
        float _1891 = _1873 * 6.283185482025146484375;
        float _1893 = cos(_1891);
        _1887 = _1893;
    }
    float _1895 = _1887;
    if (!_1839)
    {
        _1889 = _1821;
    }
    float _1897 = _1889;
    float _1899 = -_1817;
    float _1901 = -_1885;
    float _1903 = fma(_1785, _1899, _1901);
    float _1905 = _1897;
    if (_1839)
    {
        float _1907 = _1903 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1849 = _1907;
    }
    float _1909 = _1849;
    float _1911 = trunc(_683);
    int _1913 = int(_1911);
    float _1915 = _1881;
    float _1917 = _1909;
    if (_1839)
    {
        float _1919 = fma(_1881, _1909, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1915 = _1919;
    }
    float _1921 = _1915;
    float _1923 = _1921;
    if (!_1839)
    {
        _1917 = _1903;
    }
    float _1925 = _1917;
    float _1927 = _1925;
    if (_1839)
    {
        float _1929 = _1863 * _1921;
        _1865 = _1929;
    }
    float _1931 = _1865;
    if (_1839)
    {
        float _1933 = _1895 + (-1.0);
        _1923 = _1933;
    }
    float _1935 = _1923;
    float _1937 = _1935;
    if (_1839)
    {
        float _1939 = _1821 * _1931;
        _1905 = _1939;
    }
    float _1941 = _1905;
    if (_1839)
    {
        float _1943 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1937 = _1943;
    }
    float _1945 = _1937;
    if (_1839)
    {
        float _1947 = _1823 * _1931;
        _1851 = _1947;
    }
    float _1949 = _1851;
    float _1951 = trunc(_699);
    int _1953 = int(_1951);
    if (_1839)
    {
        float _1955 = _1941 * _1941;
        _1853 = _1955;
    }
    float _1957 = _1853;
    if (_1839)
    {
        float _1959 = fma(_1903, _1895, _1945);
        _1927 = _1959;
    }
    float _1961 = _1927;
    if (_1839)
    {
        float _1963 = _1949 * _1949;
        _1855 = _1963;
    }
    float _1965 = _1855;
    float _1967 = float(uint(_1913));
    float _1969 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1971 = fma(_1819, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1969);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = fma(_1961, _1961, _1957);
    int _1977 = ~_1805;
    int _1979 = _1977 + 1;
    float _1981 = -_1973;
    float _1983 = _1981 + 1.0;
    float _1985 = _1975 + _1965;
    float _1987 = as_type<float>(_1831) * _1967;
    float _1989 = abs(_1983);
    float _1991 = log2(_1989);
    float _1993 = float(uint(_1953));
    float _1995 = rsqrt(_1985);
    float _1997 = as_type<float>(_1837) * _1993;
    float _1999 = trunc(_1987);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = _1995 * _1941;
    float _2007 = _1995 * _1961;
    float _2009 = trunc(_1997);
    float _2011 = precise::max(_2009, 0.0);
    uint _2013 = uint(_2011);
    float _2015 = _1995 * _1949;
    float _2017 = _2005 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2019 = -_2017;
    float _2021 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2019);
    float _2023 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2025 = -_2015;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2021);
    int _2029 = ~_1797;
    int _2031 = _2029 + 1;
    float _2033 = exp2(_2023);
    float _2035 = fma(_2027, -0.5, 0.5);
    float _2037 = fma(_2027, 0.5, 0.5);
    int _2039 = _2031 * int(_2003);
    int _2041 = _2039 + _1913;
    int _2043 = _1979 * int(_2013);
    int _2045 = _2043 + _1953;
    float _2047 = sqrt(_2035);
    float _2049 = float(uint(_2041));
    float _2051 = fma(_2037, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2053 = float(uint(_2045));
    float _2055 = _2007 + 1.0;
    float _2057 = as_type<float>(_1831) * _2049;
    float _2059 = fma(_2037, _2051, -0.212114393711090087890625);
    float _2061 = as_type<float>(_1837) * _2053;
    float _2063 = -_2007;
    float _2065 = fma(_2033, _2055, _2063);
    float _2067 = trunc(_2057);
    float _2069 = precise::max(_2067, 0.0);
    uint _2071 = uint(_2069);
    float _2073 = fma(_2037, _2059, 1.570728778839111328125);
    float _2075 = fma(_2065, 0.5, 0.5);
    float _2077 = _2047 * 0.636619746685028076171875;
    float _2079 = trunc(_2061);
    float _2081 = precise::max(_2079, 0.0);
    uint _2083 = uint(_2081);
    float _2085 = -_2073;
    float _2087 = fma(_2077, _2085, 1.0);
    float2 _6892 = float2(_2087, _2075);
    float3 _2091 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6892, float2(0.0), isnan(_6892)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6892, float2(0.0), isnan(_6892)), level(0.0)).xyz;
    float _2093 = _2091.x;
    float _2095 = _2091.y;
    float _2097 = _2091.z;
    int _2099 = ~_1797;
    int _2101 = _2099 + 1;
    out.m_82.x = _509;
    float _2103 = as_type<float>(_1979);
    float _2105 = as_type<float>(_2101);
    if (_1663)
    {
        _2103 = _163;
    }
    float _2107 = _2103;
    float _2109 = -_685;
    float _2111 = _2109 + 1.0;
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2115 = _2113 != 0;
    float _2117 = -_639;
    float _2119 = _2117 + 1.0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2123 = _2121 != 0;
    float _2125 = _1508 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2127 = _2107;
    if (!_1663)
    {
        _2127 = _473;
    }
    float _2129 = _2127;
    float _2131 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (_1663)
    {
        _645 = 1.0;
    }
    float _2133 = _645;
    float _2135 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2125);
    float _2137 = -_471;
    float _2139 = _2137 + 1.0;
    float _2141 = _2133;
    if (!_1663)
    {
        _2141 = 5.839270114898681640625;
    }
    float _2143 = _2141;
    float _2145 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2135);
    int _2147 = int(_2003) + int(_2071);
    float _2149 = exp2(_2131);
    if (_1663)
    {
        _2105 = 1.0;
    }
    float _2151 = _2105;
    float _2153 = _2143 * _2129;
    int _2155 = int(_2013) + int(_2083);
    int _2157 = _2101 * _2147;
    int _2159 = _2157 + _1913;
    int _2161 = ~_1805;
    int _2163 = _2161 + 1;
    float _2165 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2145);
    float _2167 = _2151;
    float _2169 = _2165;
    if (!_1663)
    {
        _2167 = 7.345489978790283203125;
    }
    float _2171 = _2167;
    float _2173 = floor(_2153);
    float _2175 = float(_1797);
    int _2177 = _2163 * _2155;
    int _2179 = _2177 + _1953;
    bool _2181 = uint(_2159) >= uint(_1797);
    float _2183 = _2171 * _163;
    float _2185 = float(_1913);
    out.gl_Position.x = _1584;
    out.gl_Position.y = _1586;
    out.gl_Position.z = _2165;
    out.gl_Position.w = _1548;
    bool _2187 = uint(_2179) >= uint(_1805);
    float _2189 = floor(_2183);
    bool _2191 = _2185 >= _2175;
    bool _2193 = isnan(_2185);
    bool _2195 = _2191 || _2193;
    bool _2197 = isnan(_2175);
    bool _2199 = _2195 || _2197;
    float _2201 = float(_2199);
    bool _2203 = !_2181;
    int _2205 = _2203 ? 0 : (-1);
    bool _2207 = _163 > 0.5;
    float _2209 = trunc(_2201);
    int _2211 = int(_2209);
    int _2213 = ~_2147;
    int _2215 = _2213 + _2205;
    int _2217 = _2215 + 1;
    bool _2219 = !_2115;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2225 = _2223 != 0;
    int _2227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2229 = _2227 != 0;
    float _2231 = -_2189;
    float _2233 = _2183 + _2231;
    float _2235 = float(_1805);
    float _2237 = float(_1953);
    bool _2239 = !_2225;
    int _2241 = _2239 ? 0 : 1;
    bool _2243 = !_2187;
    int _2245 = _2243 ? 0 : (-1);
    bool _2247 = !_2229;
    int _2249 = _2247 ? 0 : 1;
    int _2251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2253 = _2251 != 0;
    int _2255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2257 = _2255 != 0;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2265 = _2263 != 0;
    bool _2267 = _2237 >= _2235;
    bool _2269 = isnan(_2237);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(_2235);
    bool _2275 = _2271 || _2273;
    float _2277 = float(_2275);
    int _2279 = _1797 * _2217;
    int _2281 = _2279 + _1913;
    bool _2283 = !_2123;
    int _2285 = _2283 ? 0 : 1;
    bool _2287 = _1797 == 0;
    float _2289 = -_199;
    int _2291 = _2207 ? as_type<int>(_2289) : as_type<int>(_199);
    float _2293 = trunc(_2277);
    int _2295 = int(_2293);
    bool _2297 = _493 > 0.5;
    float _2299 = _2233 * _2175;
    int _2301 = ~_2211;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    float _2307 = -_2173;
    float _2309 = _2153 + _2307;
    bool _2311 = !_2287;
    int _2313 = _2311 ? _2281 : (-1);
    float _2315 = _2175 * _491;
    int _2317 = _1797 + (-1);
    float _2319 = trunc(_2299);
    int _2321 = int(_2319);
    int _2323 = ~_2155;
    int _2325 = _2323 + _2245;
    int _2327 = _2325 + 1;
    int _2329 = _2313 * _2305;
    float _2331 = _2235 * _491;
    float _2333 = _2309 * _2235;
    int _2335 = abs(_2241);
    int _2337 = _2211 * _2317;
    int _2339 = _2337 + _2329;
    bool _2341 = !_2261;
    float _2343 = _2341 ? _199 : as_type<float>(_2291);
    int _2345 = _1805 * _2327;
    int _2347 = _2345 + _1953;
    bool _2349 = _1805 == 0;
    float _2351 = trunc(_2315);
    int _2353 = int(_2351);
    int _2355 = abs(_697);
    float _2357 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2359 = abs(_703);
    int _2361 = ~_2295;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    bool _2367 = !_2349;
    int _2369 = _2367 ? _2347 : (-1);
    float _2371 = trunc(_2333);
    int _2373 = int(_2371);
    int _2375 = _1805 + (-1);
    int _2377 = _2369 * _2365;
    int _2379 = abs(_761);
    int _2381 = _2321 * _2335;
    int _2383 = _2381 + _1913;
    int _2385 = _2339 * _2355;
    float _2387 = trunc(_2331);
    int _2389 = int(_2387);
    int _2391 = _2295 * _2375;
    int _2393 = _2391 + _2377;
    int _2395 = abs(_749);
    int _2397 = _2353 * _2359;
    int _2399 = _2397 + _2385;
    int _2401 = abs(_709);
    int _2403 = _2393 * _2395;
    int _2405 = abs(_2249);
    int _2407 = _2383 * _2401;
    int _2409 = _2407 + _2399;
    int _2411 = abs(_2221);
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2417 = abs(_755);
    int _2419 = _2373 * _2405;
    int _2421 = _2419 + _1953;
    int _2423 = abs(_2285);
    int _2425 = _2321 * _2411;
    int _2427 = _2425 + _2409;
    float _2429 = 1.0 / _2415;
    int _2431 = _2389 * _2417;
    int _2433 = _2431 + _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2437 = _415 + _2435;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2441 = float(uint(_2427));
    int _2443 = _2421 * _2379;
    int _2445 = _2443 + _2433;
    float _2447 = _2439 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2449 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2451 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2449;
    float _2453 = as_type<float>(_1831) * _2441;
    float _2455 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2459 = _2373 * _2423;
    int _2461 = _2459 + _2445;
    float _2463 = _2451 * _2429;
    float _2465 = trunc(_2453);
    float _2467 = precise::max(_2465, 0.0);
    uint _2469 = uint(_2467);
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2473 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2475 = _2457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2477 = fma(_2463, _2437, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _2479 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2481 = isnan(_415);
    bool _2483 = _2479 || _2481;
    bool _2485 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2487 = _2483 || _2485;
    float _2489 = float(_2487);
    bool _2491 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2493 = isnan(_415);
    bool _2495 = _2491 || _2493;
    bool _2497 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2499 = _2495 || _2497;
    float _2501 = float(_2499);
    out.m_84.x = _2473;
    out.m_84.y = _2475;
    out.m_84.z = _2447;
    out.m_84.w = _2471;
    float _2503 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2505 = _2503 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2507 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2509 = isnan(_415);
    bool _2511 = _2507 || _2509;
    bool _2513 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2515 = _2511 || _2513;
    float _2517 = float(_2515);
    int _2519 = ~_1797;
    int _2521 = _2519 + 1;
    float _2523 = float(uint(_2461));
    float _2525 = 1.0 / _2505;
    float _2527 = -_2517;
    float _2529 = _2527 + 1.0;
    float _2531 = float(uint(_2383));
    float _2533 = as_type<float>(_1837) * _2523;
    float _2535 = -_2489;
    float _2537 = _2535 + 1.0;
    float _2539 = -_2501;
    float _2541 = _2539 + 1.0;
    bool _2543 = _415 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2545 = isnan(_415);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = _2501 * _2537;
    float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2559 = _2557 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2561 = _2517 * _2541;
    int _2563 = _2521 * int(_2469);
    int _2565 = _2563 + _2427;
    float _2567 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2569 = _2567 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2571 = _2553 * _2529;
    float _2573 = 1.0 / _2559;
    float _2575 = float(uint(_2565));
    float _2577 = _2477 * _2571;
    float _2579 = _2569 * _2525;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2583 = _415 + _2581;
    float _2585 = -_2553;
    float _2587 = _2585 + 1.0;
    float _2589 = as_type<float>(_1831) * _2575;
    float _2591 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2593 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2591;
    float _2595 = trunc(_2533);
    float _2597 = precise::max(_2595, 0.0);
    uint _2599 = uint(_2597);
    float _2601 = fma(_2579, _2583, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2605 = _415 + _2603;
    float _2607 = fma(_2587, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2577);
    float _2609 = _2343 + 0.5;
    float _2611 = as_type<float>(_1831) * _2531;
    float _2613 = trunc(_2589);
    float _2615 = precise::max(_2613, 0.0);
    uint _2617 = uint(_2615);
    float _2619 = _2593 * _2573;
    int _2621 = ~_1805;
    int _2623 = _2621 + 1;
    float _2625 = fma(_2609, (*spvDescriptorSet0.vp_c9)._m0[80].x, _577);
    float _2627 = float(uint(_2421));
    float _2629 = fma(_2619, _2605, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2631 = fma(_2601, _2561, _2607);
    int _2633 = ~_1797;
    int _2635 = _2633 + 1;
    int _2637 = _2623 * int(_2599);
    int _2639 = _2637 + _2461;
    float _2641 = trunc(_2611);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    float _2647 = fma(_2629, _2555, _2631);
    float _2649 = as_type<float>(_1837) * _2627;
    int _2651 = ~_1805;
    int _2653 = _2651 + 1;
    float _2655 = float(uint(_2639));
    int _2657 = int(_2469) + int(_2617);
    float _2659 = trunc(_2649);
    float _2661 = precise::max(_2659, 0.0);
    uint _2663 = uint(_2661);
    int _2665 = ~_1797;
    int _2667 = _2665 + 1;
    float _2669 = as_type<float>(_1837) * _2655;
    float _2671 = -_203;
    int _2673 = _2297 ? as_type<int>(_2671) : as_type<int>(_203);
    int _2675 = _2667 * _2657;
    int _2677 = _2675 + _2427;
    bool _2679 = !_2265;
    float _2681 = _2679 ? _203 : as_type<float>(_2673);
    float _2683 = trunc(_2669);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2635 * int(_2645);
    int _2691 = _2689 + _2383;
    bool _2693 = uint(_2677) >= uint(_1797);
    float _2695 = _2681 + (-0.5);
    float _2697 = float(uint(_2691));
    float _2699 = -_2695;
    float _2701 = -_595;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2701);
    bool _2705 = !_2693;
    int _2707 = _2705 ? 0 : (-1);
    float _2709 = fma(_2489, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2647);
    float _2711 = abs(_939);
    float _2713 = log2(_2711);
    float _2715 = as_type<float>(_1831) * _2697;
    int _2717 = ~_2657;
    int _2719 = _2717 + _2707;
    int _2721 = _2719 + 1;
    int _2723 = _2653 * int(_2663);
    int _2725 = _2723 + _2421;
    int _2727 = int(_2599) + int(_2687);
    int _2729 = _1797 * _2721;
    int _2731 = _2729 + _2427;
    float _2733 = -_2111;
    float _2735 = fma(_2343, _2733, _2625);
    float _2737 = trunc(_2715);
    float _2739 = precise::max(_2737, 0.0);
    uint _2741 = uint(_2739);
    float _2743 = float(uint(_2725));
    float _2745 = fma(_2681, _2119, _2703);
    bool _2747 = !_2287;
    int _2749 = _2747 ? _2731 : (-1);
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2753 = as_type<float>(_1837) * _2743;
    int _2755 = _2749 & 3;
    bool _2757 = _2755 != 0;
    float _2759 = _2713 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2761 = _2749 & 3;
    bool _2763 = _2761 != 0;
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2767 = _2757 ? 0 : 1;
    float _2769 = trunc(_2753);
    float _2771 = precise::max(_2769, 0.0);
    uint _2773 = uint(_2771);
    bool _2775 = uint(_2761) > 1u;
    float _2777 = _2709 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2779 = _2751 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2781 = ~_1805;
    int _2783 = _2781 + 1;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2787 = ~_2767;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2795 = exp2(_2759);
    int _2797 = _2783 * _2727;
    int _2799 = _2797 + _2461;
    int _2801 = int(_2645) + int(_2741);
    float _2803 = _2793 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_86.x = _2735;
    out.m_86.y = _2745;
    int _2805 = _2791;
    if (!_2775)
    {
        int _2807 = ~_2767;
        int _2809 = _2807 + 1;
        _2805 = _2809;
    }
    int _2811 = _2805;
    int _2813 = ~_1797;
    int _2815 = _2813 + 1;
    out.m_88.x = _2779;
    out.m_88.y = _2785;
    out.m_88.z = _2803;
    out.m_88.w = _2777;
    bool _2817 = uint(_2761) >= 2u;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2823 = uint(_2799) >= uint(_1805);
    int _2825 = ~_1805;
    int _2827 = _2825 + 1;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2663) + int(_2773);
    int _2835 = _2815 * _2801;
    int _2837 = _2835 + _2383;
    float _2839 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _1096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2843 = fma(_2795, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2845 = precise::clamp(_2843, 0.0, 1.0);
    int _2847 = ~_2727;
    int _2849 = _2847 + _2831;
    int _2851 = _2849 + 1;
    float _2853 = -_999;
    float _2855 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    bool _2857 = uint(_2837) >= uint(_1797);
    float _2859 = -_999;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2863 = -_999;
    float _2865 = fma(_2863, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2841);
    int _2867 = _1805 * _2851;
    int _2869 = _2867 + _2461;
    float _2871 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2861);
    int _2873 = _2749 >> 31;
    int _2875 = _2827 * _2833;
    int _2877 = _2875 + _2421;
    float _2879 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2855);
    float _2881 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2865);
    float _2883 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2885 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2887 = _2873 & 3;
    float _2889 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2891 = !_2857;
    int _2893 = _2891 ? 0 : (-1);
    float _2895 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2883);
    bool _2897 = !_2349;
    int _2899 = _2897 ? _2869 : (-1);
    float _2901 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2903 = uint(_2877) >= uint(_1805);
    float _2905 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2885);
    int _2907 = _2749 + _2887;
    float _2909 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = _2899 >> 31;
    float _2913 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2889);
    int _2915 = _2907 >> 2;
    float _2917 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    int _2919 = _2911 & 3;
    float _2921 = _1088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2923 = _2915 << 4;
    int _2925 = _2923 + 368;
    float _2927 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2901);
    int _2929 = _2899 + _2919;
    float _2931 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2921);
    int _2933 = ~_2801;
    int _2935 = _2933 + _2893;
    int _2937 = _2935 + 1;
    uint _2939 = uint(int(uint(_2925) >> uint(2)));
    uint _2941 = uint(int(uint(int(_2939)) >> uint(2)));
    int _2943 = int(_2939) & 3;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[int(_2941)][_2943];
    int _2947 = int(_2939) + 1;
    uint _2949 = uint(int(uint(_2947) >> uint(2)));
    int _2951 = _2947 & 3;
    float _2953 = (*spvDescriptorSet0.vp_c9)._m0[int(_2949)][_2951];
    int _2955 = _2929 >> 2;
    float _2957 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    bool _2959 = !_2903;
    int _2961 = _2959 ? 0 : (-1);
    int _2963 = _1797 * _2937;
    int _2965 = _2963 + _2383;
    int _2967 = _2955 << 4;
    int _2969 = _2967 + 656;
    float _2971 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2931);
    int _2973 = ~_2833;
    int _2975 = _2973 + _2961;
    int _2977 = _2975 + 1;
    float _2979 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2917);
    uint _2981 = uint(int(uint(_2969) >> uint(2)));
    uint _2983 = uint(int(uint(int(_2981)) >> uint(2)));
    int _2985 = int(_2981) & 3;
    float _2987 = (*spvDescriptorSet0.vp_c9)._m0[int(_2983)][_2985];
    int _2989 = int(_2981) + 1;
    uint _2991 = uint(int(uint(_2989) >> uint(2)));
    int _2993 = _2989 & 3;
    float _2995 = (*spvDescriptorSet0.vp_c9)._m0[int(_2991)][_2993];
    bool _2997 = _2761 != 3;
    float _2999 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2905);
    int _3001 = _1805 * _2977;
    int _3003 = _3001 + _2421;
    int _3005 = ~_2819;
    int _3007 = _3005 + 1;
    int _3009 = _3007 + 1;
    float _3011 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _3013 = !_2763;
    int _3015 = _3013 ? 0 : 1;
    float _3017 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2895);
    int _3019 = _2925 + 8;
    uint _3021 = uint(int(uint(_3019) >> uint(2)));
    uint _3023 = uint(int(uint(int(_3021)) >> uint(2)));
    int _3025 = int(_3021) & 3;
    float _3027 = (*spvDescriptorSet0.vp_c9)._m0[int(_3023)][_3025];
    int _3029 = int(_3021) + 1;
    uint _3031 = uint(int(uint(_3029) >> uint(2)));
    int _3033 = _3029 & 3;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[int(_3031)][_3033];
    int _3037 = _2899 & 3;
    bool _3039 = _3037 != 0;
    float _3041 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2913);
    float _3043 = _3011 * _2881;
    int _3045 = abs(_2811);
    int _3047 = _3009;
    if (_2997)
    {
        int _3049 = ~_2819;
        int _3051 = _3049 + 1;
        _3047 = _3051;
    }
    int _3053 = _3047;
    float _3055 = _3011 * _2871;
    int _3057 = _2969 + 8;
    uint _3059 = uint(int(uint(_3057) >> uint(2)));
    uint _3061 = uint(int(uint(int(_3059)) >> uint(2)));
    int _3063 = int(_3059) & 3;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[int(_3061)][_3063];
    int _3067 = int(_3059) + 1;
    uint _3069 = uint(int(uint(_3067) >> uint(2)));
    int _3071 = _3067 & 3;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[int(_3069)][_3071];
    int _3075 = _2899 & 3;
    bool _3077 = _3075 != 0;
    float _3079 = _3011 * _2879;
    int _3081 = _3039 ? 0 : 1;
    float _3083 = fma(_2357, _3017, _3055);
    bool _3085 = uint(_3075) > 1u;
    float _3087 = fma(_2357, _2999, _3079);
    bool _3089 = !_3077;
    int _3091 = _3089 ? 0 : 1;
    float _3093 = fma(_2357, _3041, _3043);
    bool _3095 = uint(_3075) >= 2u;
    out.m_90.x = _3017;
    out.m_90.y = _2999;
    out.m_90.z = _3041;
    int _3097 = ~_3081;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    int _3103 = _3095 ? 0 : 1;
    bool _3105 = _3075 != 3;
    int _3107 = _3101;
    if (!_3085)
    {
        int _3109 = ~_3081;
        int _3111 = _3109 + 1;
        _3107 = _3111;
    }
    int _3113 = _3107;
    bool _3115 = _2761 != 3;
    int _3117 = ~_3045;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = abs(_3015);
    int _3125 = abs(_3113);
    int _3127 = _3121 * as_type<int>(_2953);
    int _3129 = ~_3103;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = ~_3123;
    int _3137 = _3135 + 1;
    int _3139 = _3137 + 1;
    int _3141 = _3133;
    if (_3105)
    {
        int _3143 = ~_3103;
        int _3145 = _3143 + 1;
        _3141 = _3145;
    }
    int _3147 = _3141;
    int _3149 = abs(_3091);
    int _3151 = _3139 * as_type<int>(_2945);
    int _3153 = _3151 + _3127;
    int _3155 = ~_3125;
    int _3157 = _3155 + 1;
    int _3159 = _3157 + 1;
    int _3161 = abs(_3053);
    int _3163 = abs(_3147);
    int _3165 = _3159 * as_type<int>(_2995);
    int _3167 = ~_3149;
    int _3169 = _3167 + 1;
    int _3171 = _3169 + 1;
    int _3173 = ~_3161;
    int _3175 = _3173 + 1;
    int _3177 = _3175 + 1;
    float _3179 = fma(_3011, _3011, 1.0);
    int _3181 = ~_3163;
    int _3183 = _3181 + 1;
    int _3185 = _3183 + 1;
    int _3187 = _3171 * as_type<int>(_2987);
    int _3189 = _3187 + _3165;
    bool _3191 = _3075 != 3;
    int _3193 = _3177 * as_type<int>(_3027);
    int _3195 = _3193 + _3153;
    bool _3197 = !_3115;
    int _3199 = _3197 ? 0 : (-1);
    int _3201 = _3185 * as_type<int>(_3065);
    int _3203 = _3201 + _3189;
    bool _3205 = !_2253;
    int _3207 = _3205 ? 0 : 1;
    float _3209 = rsqrt(_3179);
    int _3211 = abs(_3199);
    float _3213 = _2979 + _3083;
    bool _3215 = !_3191;
    int _3217 = _3215 ? 0 : (-1);
    float _3219 = _2971 + _3093;
    bool _3221 = !_2257;
    int _3223 = _3221 ? 0 : 1;
    int _3225 = abs(_3207);
    int _3227 = abs(_3217);
    int _3229 = abs(_3223);
    float _3231 = _3011 * _3209;
    int _3233 = ~_3211;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3237 * as_type<int>(_3035);
    int _3241 = _3239 + _3195;
    int _3243 = ~_3225;
    int _3245 = _3243 + 1;
    int _3247 = _3245 + 1;
    float _3249 = _2957 + _3087;
    int _3251 = ~_3227;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    bool _3257 = !_2287;
    int _3259 = _3257 ? _2965 : (-1);
    int _3261 = _3241 * _3247;
    int _3263 = ~_3229;
    int _3265 = _3263 + 1;
    int _3267 = _3265 + 1;
    int _3269 = _3255 * as_type<int>(_3073);
    int _3271 = _3269 + _3203;
    bool _3273 = !_2349;
    int _3275 = _3273 ? _3003 : (-1);
    int _3277 = _3259 * _3225;
    int _3279 = _3277 + _3261;
    float _3281 = -_2979;
    float _3283 = _3231 * _3281;
    int _3285 = _3271 * _3267;
    float _3287 = -_2957;
    float _3289 = _3231 * _3287;
    float _3291 = _1584 + _1548;
    float _3293 = fma(_3209, _2871, _3283);
    int _3295 = _3275 * _3229;
    int _3297 = _3295 + _3285;
    float _3299 = fma(_3209, _2879, _3289);
    float _3301 = _1548 * 0.5;
    bool _3303 = _939 <= 8000.0;
    bool _3305 = isnan(_939);
    bool _3307 = _3303 || _3305;
    bool _3309 = isnan(8000.0);
    bool _3311 = _3307 || _3309;
    float _3313 = float(_3311);
    float _3315 = -_2971;
    float _3317 = _3231 * _3315;
    float _3319 = _2165 + _1548;
    float _3321 = fma(_1586, -0.5, _3301);
    float _3323 = fma(_3209, _2881, _3317);
    float _3325 = _3319 * 0.5;
    float _3327 = _3299;
    float _3329 = _3293;
    if (!_1530)
    {
        _1588 = 1.0;
    }
    float _3331 = _1588;
    float _3333 = fma(_2845, -2.0, 3.0);
    float _3335 = _2845 * _2845;
    float _3337 = _3331;
    if (_1530)
    {
        bool _3339 = _1632 >= _1596;
        bool _3341 = isnan(_1632);
        bool _3343 = _3339 || _3341;
        bool _3345 = isnan(_1596);
        bool _3347 = _3343 || _3345;
        float _3349 = float(_3347);
        _3337 = _3349;
    }
    float _3351 = _3337;
    out.m_92.x = _3293;
    out.m_92.y = _3299;
    out.m_92.z = _3323;
    float _3353 = _3291 * 0.5;
    float _3355 = _3335 * _3333;
    float _3357 = float(_3279);
    float _3359 = _3351 * _1781;
    float _3361 = float(_3297);
    float _3363 = -_3355;
    float _3365 = _3363 + 1.0;
    out.m_94.x = _3353;
    out.m_94.y = _3321;
    out.m_94.z = _3325;
    out.m_94.w = _1548;
    bool _3367 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3369 = isnan(_1819);
    bool _3371 = _3367 || _3369;
    bool _3373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3375 = _3371 || _3373;
    float _3377 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3355);
    float _3379 = -_2149;
    float _3381 = _3379 + 1.0;
    out.m_96.x = _3357;
    float _3383 = _3313 * _3377;
    float _3385 = _3381 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_96.z = _3361;
    float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3389 = _3385 * _1634;
    float _3391 = -_3385;
    float _3393 = _3391 + 1.0;
    out.m_98.x = _3213;
    out.m_98.y = _3249;
    out.m_98.z = _3219;
    float _3395 = _2139 * _3387;
    float _3397 = precise::clamp(_3395, 0.0, 1.0);
    float _3399 = _1645 * _3389;
    float _3401 = _2097 * _3389;
    float _3403 = _3385;
    float _3405 = _3393;
    if (!_3375)
    {
        _3327 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3407 = _3327;
    float _3409 = -_3397;
    float _3411 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3413 = fma(_2093, _3399, _1639);
    float _3415 = fma(_2095, _3399, _1641);
    float _3417 = _1645 * _3393;
    float _3419 = -_3359;
    float _3421 = fma(_3419, _3411, 1.0);
    float _3423 = precise::clamp(_3421, 0.0, 1.0);
    float _3425 = fma(_1645, _3401, _1643);
    float _3427 = _1719 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3429 = _3423;
    float _3431 = _3407;
    float _3433 = _3407;
    if (!_3375)
    {
        _3329 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3435 = _3329;
    float _3437 = _3423 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3439 = _3435;
    float _3441 = _3435;
    if (!_3375)
    {
        _3403 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3443 = _3403;
    out.m_100.x = _3413;
    out.m_100.y = _3415;
    out.m_100.z = _3425;
    out.m_100.w = _3417;
    float _3445 = _3443;
    float _3447 = _3443;
    if (!_3375)
    {
        _2169 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3449 = _2169;
    float _3451 = _3449;
    float _3453 = _3449;
    if (!_3375)
    {
        _3429 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3455 = _3429;
    out.m_102.x = _3437;
    float _3457 = _3455;
    float _3459 = _3455;
    if (!_3375)
    {
        _3405 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3461 = _3405;
    bool _3463 = !_3375;
    float _3465 = _3461;
    float _3467 = _3461;
    if (!_3463)
    {
        bool _3469 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3471 = isnan(_1819);
        bool _3473 = _3469 || _3471;
        bool _3475 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3477 = _3473 || _3475;
        if (!_3477)
        {
            float _3479 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3481 = _1819 + _3479;
            float _3483 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3485 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3483;
            float _3487 = 1.0 / _3485;
            float _3489 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3491 = _3489 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3493 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3497 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3501 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3505 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3507 = _3505 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3509 = _3481 * _3487;
            float _3511 = precise::clamp(_3509, 0.0, 1.0);
            float _3513 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3515 = _3513 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3517 = fma(_3511, _3491, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3519 = fma(_3511, _3515, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3521 = fma(_3511, _3495, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3523 = fma(_3511, _3499, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3525 = fma(_3511, _3503, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3527 = fma(_3511, _3507, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3441 = _3519;
            _3459 = _3525;
            _3433 = _3517;
            _3453 = _3523;
            _3447 = _3521;
            _3467 = _3527;
            _3529 = true;
        }
        else
        {
            bool _3531 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3533 = isnan(_1819);
            bool _3535 = _3531 || _3533;
            bool _3537 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3539 = _3535 || _3537;
            if (!_3539)
            {
                _3431 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3541 = _3431;
            _3433 = _3541;
            if (!_3539)
            {
                _3439 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3543 = _3439;
            _3441 = _3543;
            if (!_3539)
            {
                _3445 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3545 = _3445;
            _3447 = _3545;
            if (!_3539)
            {
                _3451 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3547 = _3451;
            _3453 = _3547;
            if (!_3539)
            {
                _3457 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3549 = _3457;
            _3459 = _3549;
            if (!_3539)
            {
                _3465 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3551 = _3465;
            bool _3553 = !_3539;
            _3467 = _3551;
            if (!_3553)
            {
                bool _3555 = _1819 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3557 = isnan(_1819);
                bool _3559 = _3555 || _3557;
                bool _3561 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3563 = _3559 || _3561;
                if (!_3563)
                {
                    float _3565 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3567 = _1819 + _3565;
                    float _3569 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3571 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3569;
                    float _3573 = 1.0 / _3571;
                    float _3575 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3577 = _3575 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3579 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3581 = _3579 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3583 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3585 = _3583 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3587 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3589 = _3587 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3591 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3593 = _3591 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3595 = _3567 * _3573;
                    float _3597 = precise::clamp(_3595, 0.0, 1.0);
                    float _3599 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3601 = _3599 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3603 = fma(_3597, _3577, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3605 = fma(_3597, _3601, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3607 = fma(_3597, _3581, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3609 = fma(_3597, _3585, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3611 = fma(_3597, _3589, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3613 = fma(_3597, _3593, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3441 = _3605;
                    _3459 = _3611;
                    _3433 = _3603;
                    _3453 = _3609;
                    _3447 = _3607;
                    _3467 = _3613;
                    _3529 = true;
                }
                else
                {
                    _3441 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3459 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3433 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3453 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3447 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3467 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3529 = false;
    float _3615 = _3441;
    float _3617 = _3459;
    float _3619 = _3433;
    float _3621 = _3453;
    float _3623 = _3447;
    float _3625 = _3467;
    float _3627 = fma(_3249, -0.5, 0.5);
    float _3629 = precise::clamp(_3627, 0.0, 1.0);
    float _3631 = -_3615;
    float _3633 = _3631 + _3617;
    float _3635 = -_3619;
    float _3637 = _3635 + _3621;
    out.m_104.x = 0.0;
    float _3639 = fma(_3629, _3633, _3615);
    float _3641 = -_3623;
    float _3643 = _3641 + _3625;
    float _3645 = fma(_3629, _3637, _3619);
    float _3647 = _3639 * 0.586610972881317138671875;
    bool _3649 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3651 = fma(_3629, _3643, _3623);
    float _3653 = _3427 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3655 = fma(_3645, 0.298911988735198974609375, _3647);
    bool _3657 = _1719 > 0.0;
    bool _3659 = isnan(_1719);
    bool _3661 = _3657 || _3659;
    bool _3663 = isnan(0.0);
    bool _3665 = _3661 || _3663;
    float _3667 = fma(_3651, 0.114477999508380889892578125, _3655);
    out.m_63.x = _3653;
    float _3669 = -_3667;
    float _3671 = _3645 + _3669;
    float _3673 = -_3667;
    float _3675 = _3639 + _3673;
    float _3677 = -_3667;
    float _3679 = _3651 + _3677;
    float _3681 = fma(_3671, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3683 = fma(_3675, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    float _3685 = fma(_3679, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3667);
    bool _3687 = !_3649;
    if (!_3687)
    {
        float _3689 = -_1462;
        float _3691 = _3689 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3693 = -_1464;
        float _3695 = _3693 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3697 = -_1466;
        float _3699 = _3697 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3701 = _3691 * _3691;
        float _3703 = fma(_3695, _3695, _3701);
        float _3705 = fma(_3699, _3699, _3703);
        float _3707 = sqrt(_3705);
        float _3709 = rsqrt(_3705);
        float _3711 = -_3707;
        float _3713 = _3711 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3715 = _3713 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3717 = precise::clamp(_3715, 0.0, 1.0);
        float _3719 = _3695 * _3709;
        float _3721 = _3691 * _3709;
        float _3723 = abs(_3717);
        float _3725 = log2(_3723);
        float _3727 = _3699 * _3709;
        float _3729 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3731 = _3249 * _3721;
        float _3733 = -_3721;
        float _3735 = -_3729;
        float _3737 = fma(_3733, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3735);
        float _3739 = fma(_3213, _3719, _3731);
        float _3741 = -_3727;
        float _3743 = fma(_3741, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3737);
        float _3745 = fma(_3219, _3727, _3739);
        float _3747 = precise::clamp(_3745, 0.0, 1.0);
        float _3749 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3751 = _3743 + _3749;
        float _3753 = _3725 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3755 = _3751 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3757 = precise::clamp(_3755, 0.0, 1.0);
        float _3759 = exp2(_3753);
        float _3761 = _3759 * _3757;
        float _3763 = _3747 * _3761;
        float _3765 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3767 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3769 = _3763 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _3765;
        out.m_104.y = _3767;
        out.m_104.z = _3769;
    }
    out.m_106.x = _3681;
    out.m_106.y = _3683;
    out.m_106.z = _3685;
    if (_3665)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_63.x = 0.0;
    float _3771 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3771;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

