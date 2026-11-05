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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3258 = false;
    bool _433 = false;
    bool _335 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3562 = as_type<float>(_123);
        out.gl_Position.z = _3562;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3634 = as_type<float>(_163);
        out.gl_Position.z = _3634;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _205;
    float _229;
    if (!_209)
    {
        float _213 = in.m_62.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        _229 = _147;
    }
    _231 = false;
    float _233 = _229;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    float _239 = in.m_64.x;
    float _241 = in.m_64.y;
    bool _243 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_233);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_253;
    float _273 = _271 + 1.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    float _279 = 1.0 / _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = _269 * _273;
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _237 * _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_277, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = fma(_293, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _299 = _295 * _283;
    float _301 = _297 * _283;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _307 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].x, _303);
    float _309 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].y, _305);
    float _311 = _307 * _239;
    float _313 = _309 * _241;
    bool _315 = !_281;
    float _333;
    if (!_315)
    {
        float _317 = in.m_62.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        _333 = _147;
    }
    _335 = false;
    float _337 = _333;
    bool _339 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_337);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_337);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _337 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _369 * _381;
    float _391 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _391 * _383;
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _393);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _395);
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_62.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        _431 = _147;
    }
    _433 = false;
    float _435 = _431;
    float _437 = in.m_62.x;
    float _439 = in.m_62.y;
    float _441 = in.m_62.z;
    float _443 = in.m_62.w;
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _449 = _435 + _447;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_68.y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _467 = _465 != 0;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _463;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _481 = _443 > 0.5;
    float _483 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _485 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = _439 + _441;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _495 = _493 != 0;
    float _497 = _439 * 2.0;
    float _499 = -_201;
    int _501 = _481 ? as_type<int>(_499) : as_type<int>(_201);
    float _503 = _487 + (-1.0);
    bool _505 = _437 > 0.5;
    float _507 = fma(_485, -2.0, _477);
    float _509 = _439 + _437;
    float _511 = -_191;
    int _513 = _505 ? as_type<int>(_511) : as_type<int>(_191);
    float _515 = floor(_497);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _441 * 2.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _525 = !_453;
    float _527 = _525 ? _191 : as_type<float>(_513);
    float _529 = _509 + (-1.0);
    bool _531 = _439 > 0.5;
    float _533 = -_523;
    float _535 = fma(_483, 2.0, _533);
    float _537 = floor(_521);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _541 = -_201;
    int _543 = _531 ? as_type<int>(_541) : as_type<int>(_201);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    bool _549 = !_467;
    float _551 = _549 ? _201 : as_type<float>(_501);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _555 = _437 * 2.0;
    float _557 = _547 * _475;
    float _559 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _561 = !_459;
    float _563 = _561 ? _201 : as_type<float>(_543);
    float _565 = _551 + (-0.5);
    bool _567 = _441 > 0.5;
    float _569 = floor(_555);
    bool _571 = _537 >= 0.0;
    bool _573 = isnan(_537);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -_191;
    int _585 = _531 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = -_201;
    int _589 = _567 ? as_type<int>(_587) : as_type<int>(_201);
    int _591 = _579 ? 0 : 1;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _595 = !_491;
    float _597 = _595 ? _191 : as_type<float>(_585);
    float _599 = -_135;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[76].x, _535);
    bool _603 = _537 > 0.0;
    float _605 = fma(_557, _449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _607 = _555;
    float _609 = _557;
    if (!_519)
    {
        _607 = _441;
    }
    float _611 = _607;
    float _613 = _597 + 0.5;
    float _615 = _611;
    if (_519)
    {
        _615 = _439;
    }
    float _617 = _615;
    bool _619 = _569 > 0.0;
    float _621 = _613 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _623 = _569 >= 0.0;
    bool _625 = isnan(_569);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _635 = !_495;
    float _637 = _635 ? _201 : as_type<float>(_589);
    float _639 = _527 + 0.5;
    float _641 = -_191;
    int _643 = _567 ? as_type<int>(_641) : as_type<int>(_191);
    float _645 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[83].w, _479);
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_633, _639, _601);
    bool _655 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _657 = isnan(_435);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_637;
    float _669 = _667 + 0.5;
    bool _671 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_435);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    int _683 = _651;
    float _685 = _617;
    if (!_519)
    {
        _609 = _439;
    }
    float _687 = _609;
    float _689 = -_665;
    float _691 = _689 + 1.0;
    bool _693 = !_473;
    float _695 = _693 ? _191 : as_type<float>(_643);
    float _697 = -_681;
    float _699 = _697 + 1.0;
    float _701 = _687;
    if (!_603)
    {
        int _703 = ~_591;
        int _705 = _703 + 1;
        _683 = _705;
    }
    int _707 = _683;
    float _709 = _681 * _691;
    if (_519)
    {
        _701 = _437;
    }
    float _711 = _701;
    float _713 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    bool _715 = _515 > 0.0;
    float _717 = _605 * _709;
    bool _719 = _515 >= 0.0;
    bool _721 = isnan(_515);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[83].z, _539);
    float _731 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_519)
    {
        _685 = _441;
    }
    float _735 = _685;
    float _737 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[131].x, _717);
    float _739 = _735;
    if (_519)
    {
        _739 = _439;
    }
    float _741 = _739;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    float _757 = _469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _759 = _563 + (-0.5);
    float _761 = -_743;
    float _763 = fma(_731, 2.0, _761);
    float _765 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _767 = _631 ? 0 : 1;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _771 = -_757;
    float _773 = -_713;
    float _775 = fma(_771, _759, _773);
    float _777 = _669 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _781 = fma(_765, -2.0, _769);
    float _783 = _621 * _553;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = _777 * _593;
    float _793 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _781);
    float _795 = _733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _797 = _695 + 0.5;
    float _799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _801 = log2(_799);
    float _803 = -_135;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _763);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    out.m_70.x = _783;
    out.m_70.y = _791;
    int _813 = _811;
    if (!_619)
    {
        int _815 = ~_767;
        int _817 = _815 + 1;
        _813 = _817;
    }
    int _819 = _813;
    float _821 = fma(_795, _797, _805);
    float _823 = _779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _827 = -_823;
    float _829 = -_793;
    float _831 = fma(_827, _565, _829);
    int _833 = _727 ? 0 : 1;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _837 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].z, _825);
    float _839 = _801 * _135;
    int _841 = ~_833;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].w, _835);
    float _849 = _787 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = exp2(_839);
    float _853 = _787 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _855 = _845;
    int _857 = _819;
    if (!_715)
    {
        int _859 = ~_833;
        int _861 = _859 + 1;
        _855 = _861;
    }
    int _863 = _855;
    float _865 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _867 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _837);
    float _869 = _787 + _455;
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _869 + _885;
    float _889 = _871 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    bool _897 = !_747;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _903 = -_851;
    float _905 = _903 + 1.0;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = _887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _921 = _889 + _919;
    float _923 = 1.0 / _893;
    float _925 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _927 = abs(_899);
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -_867;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_563, _931, _775);
    bool _943 = !_751;
    int _945 = _943 ? 0 : 1;
    float _947 = -_935;
    float _949 = fma(_527, _947, _653);
    float _951 = _915 ? _905 : 0.0;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[28].x, _917);
    float _957 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _645);
    int _959 = abs(_945);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _955);
    float _963 = float(_707);
    float _965 = -_957;
    float _967 = _965 + 1.0;
    float _969 = _887 * _887;
    float _971 = float(_927);
    float _973 = -_953;
    float _975 = _973 + 1.0;
    bool _977 = _961 >= 0.0;
    float _979 = fma(_551, _967, _831);
    float _981 = fma(_921, _921, _969);
    float _983 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[132].x, _737);
    float _985 = -_975;
    float _987 = fma(_695, _985, _821);
    float _989 = _971 * _963;
    float _991 = float(_819);
    float _993 = in.m_72.x;
    float _995 = in.m_72.y;
    float _997 = in.m_72.z;
    float _999 = float(_959);
    float _1001 = fma(_939, _939, _981);
    float _1003 = _989 * (-2.0);
    float _1005 = _969;
    if (_883)
    {
        float _1007 = _951 * _923;
        _157 = _1007;
    }
    float _1009 = _157;
    if (_977)
    {
        _1005 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1005;
    float _1013 = _999 * _991;
    out.m_74.x = _949;
    out.m_74.y = _941;
    out.m_74.z = _987;
    out.m_74.w = _979;
    float _1015 = rsqrt(_1001);
    float _1017 = fma(_581, _1003, _581);
    if (_977)
    {
        float _1019 = _1011 * 5.0;
        _857 = as_type<int>(_1019);
    }
    int _1021 = _857;
    float _1023 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = _1023;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_977)
    {
        out.m_51.x = 0.0;
    }
    if (_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5026 = as_type<float>(_1021);
        out.gl_Position.z = _5026;
    }
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1035 = fma(_1003, _993, _993);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _437 + (-0.5);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1029 * _1015;
    float _1049 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1035);
    bool _1053 = !_755;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _887 * _1047;
    float _1059 = _921 * _1047;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _1061 = -_1057;
    float _1063 = _887 + _1061;
    float _1065 = -_1059;
    float _1067 = _921 + _1065;
    float _1069 = _997;
    if (_977)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1071 = -_1057;
    float _1073 = _869 + _1071;
    float _1075 = _1063 * _1063;
    float _1077 = -_1059;
    float _1079 = _889 + _1077;
    float _1081 = _939 * _1047;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = _1073 + _1083;
    float _1087 = fma(_1067, _1067, _1075);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1091 = _1079 + _1089;
    int _1093 = abs(_1055);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1081;
    float _1099 = _939 + _1097;
    float _1101 = _439 + (-0.5);
    float _1103 = fma(_1017, _1009, _1051);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1107 = _1013 * (-2.0);
    float _1109 = float(_863);
    float _1111 = -_1081;
    float _1113 = _925 + _1111;
    float _1115 = float(_1093);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_1099, _1099, _1087);
    float _1121 = fma(_559, _1107, _559);
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = _1113 + _1123;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1109;
    float _1131 = _441 + _437;
    float _1133 = fma(_1121, _1009, _1127);
    float _1135 = _1129 * (-2.0);
    float _1137 = _1131 + (-1.0);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1105);
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = fma(_1135, _997, _997);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1147 = _441 + (-0.5);
    bool _1149 = _1139 >= 0.0;
    float _1151 = _1103 * 0.15915493667125701904296875;
    float _1153 = fma(_1145, _1135, _1145);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1143);
    float _1157 = sqrt(_1119);
    float _1159 = fma(_1153, _1009, _1155);
    float _1161 = _1159 * 0.15915493667125701904296875;
    float _1163 = _1151 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    if (_1149)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1069;
    int _1169 = as_type<int>(_1167);
    if (_1149)
    {
        out.m_51.x = 0.0;
    }
    if (_1149)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    float _1175 = _1151 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    if (_1149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_1173);
        out.gl_Position.z = _5289;
    }
    float _1179 = _1141 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1141 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1161 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    if (_1149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1191 = _1161 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1015 * _1157;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = _1165 * _1181;
    bool _1201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1207 = _1177 * _1185;
    float _1209 = _1177 * _1181;
    float _1211 = _1165 * _1185;
    float _1213 = 1.0 / _1205;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1223 = _1177 * _1193;
    float _1225 = _1185 * _1193;
    float _1227 = _1165 * _1193;
    float _1229 = _1181 * _1193;
    float _1231 = 0.0;
    if (_1197)
    {
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1231 = _1233;
    }
    float _1235 = _1231;
    float _1237 = _1023 * _1195;
    float _1239 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1197)
    {
        float _1241 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1025 = _1241;
    }
    float _1243 = _1025;
    float _1245 = fma(_1189, _1207, _1199);
    float _1247 = fma(_1189, _1199, _1207);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1253 = _1159;
    if (_1201)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1261 = 0.0;
    if (_1197)
    {
        float _1263 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1261 = _1263;
    }
    float _1265 = _1261;
    float _1267 = -_1209;
    float _1269 = fma(_1189, _1211, _1267);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1271;
    float _1275 = -_1211;
    float _1277 = fma(_1189, _1209, _1275);
    float _1279 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1285 = 1.0 / _1217;
    float _1287 = _1259 * _1237;
    float _1289 = -_869;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1201)
    {
        float _1293 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1027 = _1293;
    }
    float _1295 = _1027;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1299 = 1.0 / _1221;
    float _1301 = _1195 * _1279;
    float _1303 = _1283 * _1213;
    float _1305 = -_889;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1291 * _1291;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1319 = 1.0 / _1251;
    float _1321 = _1301;
    if (_1201)
    {
        float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1239 = _1323;
    }
    float _1325 = _1239;
    float _1327 = _1297 * _1301;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    if (_1197)
    {
        float _1333 = _1265 * _1235;
        _1321 = _1333;
    }
    float _1335 = _1321;
    float _1337 = -_925;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1341 = fma(_1307, _1307, _1309);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1343;
    float _1347 = 1.0 / _1313;
    float _1349 = _1257;
    if (_1201)
    {
        float _1351 = _1325 * _1257;
        _1349 = _1351;
    }
    float _1353 = _1349;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1359 = fma(_1339, _1339, _1341);
    float _1361 = _1273 * _1285;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1371 = 1.0 / _1317;
    float _1373 = _1357 * _1299;
    float _1375 = -_1327;
    float _1377 = _1189 * _1375;
    float _1379 = _1223 * _1327;
    float _1381 = _1227 * _1327;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1391 = 1.0 / _1331;
    float _1393 = _1365 * _1319;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1395;
    float _1399 = fma(_1225, _1287, _1377);
    float _1401 = fma(_1245, _1287, _1379);
    float _1403 = fma(_1269, _1287, _1381);
    float _1405 = 0.0;
    float _1407 = _1369;
    if (_1201)
    {
        float _1409 = floor(_1353);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1417;
    float _1421 = _1345 * _1347;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1427;
    float _1431 = _1419 * _1371;
    float _1433 = _1325;
    float _1435 = _1419;
    if (_1197)
    {
        float _1437 = floor(_1335);
        _1433 = _1437;
    }
    float _1439 = _1433;
    if (!_1201)
    {
        _1435 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1441 = _1435;
    float _1443 = _1369 * _1391;
    float _1445 = _1441;
    if (!_1197)
    {
        _1407 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1447 = _1407;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1453 = _787 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1455 = rsqrt(_1359);
    float _1457 = _1447;
    if (_1201)
    {
        float _1459 = -_1411;
        float _1461 = _1353 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    float _1469 = fma(_1229, _1467, _1399);
    bool _1471 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1473 = isnan(_1463);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = 1.0 / _1389;
    float _1485 = _1469;
    if (_1197)
    {
        float _1487 = -_1439;
        float _1489 = _1335 + _1487;
        _1457 = _1489;
    }
    float _1491 = _1457;
    bool _1493 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1495 = isnan(_1463);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1511 = _1491 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1515 = _1491 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1491 + _1517;
    float _1521 = 1.0 / _1385;
    float _1523 = _1307 * _1455;
    float _1525 = _1291 * _1455;
    float _1527 = _1339 * _1455;
    float _1529 = fma(_1277, _1467, _1401);
    float _1531 = fma(_1247, _1467, _1403);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1535 = _1491 + _1533;
    bool _1537 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1539 = isnan(_1491);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = 1.0 / _1397;
    float _1551 = _1511 * _1483;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1555 = _1491 + _1553;
    float _1557 = 1.0 / _1415;
    float _1559 = _1515 * _1521;
    float _1561 = 1.0 / _1425;
    float _1563 = _1535 * _1549;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1567 = _1463 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1571 = _1491 + _1569;
    float _1573 = fma(_1303, _1567, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1577 = _1463 + _1575;
    float _1579 = 1.0 / _1429;
    float _1581 = _1555 * _1557;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1585 = _1463 + _1583;
    float _1587 = fma(_1421, _1577, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1589 = fma(_1361, _1585, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1593 = _1463 + _1591;
    float _1595 = 1.0 / _1451;
    float _1597 = _1519 * _1561;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1601 = _1463 + _1599;
    float _1603 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1607 = _1463 + _1605;
    float _1609 = fma(_1373, _1601, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1611 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1613 = isnan(_1463);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1571 * _1579;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1627 = _1463 + _1625;
    bool _1629 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1631 = isnan(_1463);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1643 = _1491 + _1641;
    float _1645 = _1621 * _1507;
    float _1647 = fma(_1393, _1627, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1649 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1651 = isnan(_1463);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1621;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1431, _1607, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1667 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1669 = isnan(_1463);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -_1639;
    float _1681 = _1679 + 1.0;
    float _1683 = -_1659;
    float _1685 = _1683 + 1.0;
    bool _1687 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1689 = isnan(_1491);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1643 * _1595;
    float _1701 = _1503 * _1681;
    float _1703 = _1481 * _1685;
    float _1705 = -_1677;
    float _1707 = _1705 + 1.0;
    float _1709 = -_1697;
    float _1711 = _1709 + 1.0;
    float _1713 = _1639 * _1663;
    float _1715 = _1589 * _1701;
    float _1717 = _1659 * _1707;
    float _1719 = _1547 * _1711;
    float _1721 = -_1547;
    float _1723 = _1721 + 1.0;
    bool _1725 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1727 = isnan(_1463);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = -_1503;
    float _1739 = _1737 + 1.0;
    bool _1741 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1743 = isnan(_1491);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    bool _1753 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1755 = isnan(_1491);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1715);
    float _1767 = -_1735;
    float _1769 = _1767 + 1.0;
    float _1771 = _1751 * _1723;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1779 = isnan(_1491);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = _1677 * _1769;
    float _1791 = fma(_1573, _1713, _1765);
    float _1793 = -_1763;
    float _1795 = _1793 + 1.0;
    float _1797 = _1763 * _1775;
    bool _1799 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1801 = isnan(_1491);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1787 * _1795;
    bool _1813 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1815 = isnan(_1491);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1825;
    bool _1829 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1831 = isnan(_1491);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = -_1787;
    float _1847 = _1845 + 1.0;
    float _1849 = fma(_1827, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1839 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1857;
    float _1861 = _1823 * _1847;
    float _1863 = -_1823;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1839;
    float _1869 = _1867 + 1.0;
    float _1871 = _1849 * _1851;
    bool _1873 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1875 = isnan(_1463);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1859, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1887 = fma(_1647, _1645, _1791);
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1891 = _1889 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1893 = _1809 * _1865;
    float _1895 = fma(_1855, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1897 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1871);
    float _1899 = _1885 * _1851;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1901;
    float _1905 = -_1883;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1603, _1703, _1887);
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1913 = _1523 * _1911;
    float _1915 = fma(_1895, _1893, _1897);
    float _1917 = fma(_1891, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1919 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1899);
    float _1921 = fma(_1903, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1923 = _1735 * _1907;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1925;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1527 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1935 = -_1913;
    float _1937 = fma(_1527, _1933, _1935);
    float _1939 = fma(_1917, _1893, _1919);
    float _1941 = fma(_1921, _1861, _1915);
    float _1943 = fma(_1927, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1951 = -_1931;
    float _1953 = fma(_1525, _1949, _1951);
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1957 = _1525 * _1955;
    float _1959 = _1937 * _1937;
    float _1961 = fma(_1943, _1861, _1939);
    float _1963 = fma(_1947, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = fma(_1523, _1965, _1967);
    float _1971 = fma(_1953, _1953, _1959);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1977 = fma(_1963, _1811, _1941);
    float _1979 = fma(_1969, _1969, _1971);
    float _1981 = fma(_1975, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1989 = _1987 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1985, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1995 = fma(_1981, _1811, _1961);
    float _1997 = fma(_1587, _1717, _1909);
    float _1999 = fma(_1989, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2001 = fma(_1993, _1797, _1977);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2003;
    float _2007 = fma(_1609, _1789, _1997);
    float _2009 = fma(_1999, _1771, _2001);
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2015;
    float _2019 = fma(_2005, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2021 = fma(_1665, _1923, _2007);
    float _2023 = fma(_2017, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2025 = _1953 * _1991;
    float _2027 = fma(_2019, _1797, _1995);
    float _2029 = fma(_2013, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2031 = fma(_2023, _1719, _2009);
    float _2033 = _1937 * _1991;
    float _2035 = _1525 * _2025;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2037;
    float _2041 = fma(_2029, _1771, _2027);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2021);
    float _2045 = _1969 * _1991;
    float _2047 = _1527 * _2033;
    float _2049 = -_2035;
    float _2051 = fma(_1523, _2033, _2049);
    float _2053 = fma(_2039, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2055 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2031);
    float _2057 = -_2047;
    float _2059 = fma(_1525, _2045, _2057);
    float _2061 = _2051 * _1529;
    float _2063 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2065 = _925 + _2063;
    float _2067 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2069 = fma(_2053, _1719, _2041);
    float _2071 = _2059 * _1529;
    float _2073 = fma(_2045, _1469, _2061);
    float _2075 = -_2067;
    float _2077 = fma(_2055, _2065, _2075);
    float _2079 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2081 = _889 + _2079;
    float _2083 = fma(_2025, _1469, _2071);
    float _2085 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2087 = fma(_1527, _1531, _2073);
    float _2089 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2069);
    float _2091 = fma(_1523, _1531, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2055, _2081, _2093);
    float _2097 = _1523 * _2045;
    float _2099 = fma(_2087, _2089, _2077);
    float _2101 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1453);
    float _2103 = fma(_2091, _2089, _2095);
    float _2105 = -_2097;
    float _2107 = fma(_1527, _2025, _2105);
    float _2109 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2111 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2101);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2115 = _2107 * _1529;
    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2119 = _2109 + _2117;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2125 = _2113 + _2123;
    float _2127 = fma(_2033, _1469, _2115);
    float _2129 = _2119 * _2119;
    float _2131 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2133 = _2121 + _2131;
    float _2135 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2137 = fma(_1525, _1531, _2127);
    float _2139 = fma(_2125, _2125, _2129);
    float _2141 = -_2135;
    float _2143 = fma(_2055, _2133, _2141);
    float _2145 = _869 + _2137;
    float _2147 = sqrt(_2139);
    float _2149 = -_2121;
    float _2151 = _2145 + _2149;
    float _2153 = fma(_2089, _2151, _2143);
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2157 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2161 = _2147 + _2159;
    float _2163 = _2129;
    float _2165 = _2133;
    float _2167 = _2139;
    float _2169 = _2127;
    float _2171 = _2113;
    float _2173 = _2109;
    float _2175 = _1529;
    float _2177 = _2125;
    if (_2157)
    {
        float _2179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2179;
    }
    float _2181 = _2163;
    if (_2157)
    {
        float _2183 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2183;
    }
    float _2185 = _2165;
    if (_2157)
    {
        float _2187 = rsqrt(_2139);
        _2167 = _2187;
    }
    float _2189 = _2167;
    float _2191 = _2181;
    if (_2157)
    {
        float _2193 = _2161 * _2181;
        _2191 = _2193;
    }
    float _2195 = _2191;
    if (_2157)
    {
        float _2197 = _2195 * 0.15915493667125701904296875;
        _2169 = _2197;
    }
    float _2199 = _2169;
    float _2201 = _789;
    if (_2157)
    {
        float _2203 = _2199 * 6.283185482025146484375;
        float _2205 = sin(_2203);
        _2201 = _2205;
    }
    float _2207 = _2201;
    float _2209 = _2207;
    if (_2157)
    {
        float _2211 = fma(_2207, _2185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2157)
    {
        float _2217 = _2189 * _2213;
        _2215 = _2217;
    }
    float _2219 = _2215;
    if (_2157)
    {
        float _2221 = fma(_2125, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2171 = _2221;
    }
    float _2223 = _2171;
    float _2225 = _2223;
    if (_2157)
    {
        float _2227 = fma(_2119, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2173 = _2227;
    }
    float _2229 = _2173;
    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2233 = _2223 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2237 = _2229 + _2235;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6992 = float2(_2239, _2241);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6992, float2(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6992, float2(0.0), isnan(_6992)), level(0.0)).x;
    float _2245 = _2199;
    float _2247 = _2233;
    float _2249 = _2229;
    float _2251 = _2241;
    if (_2157)
    {
        float _2253 = _2199 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        _2245 = _2255;
    }
    float _2257 = _2245;
    if (!_2157)
    {
        _2247 = _2155;
    }
    float _2259 = _2247;
    float _2261 = -_889;
    float _2263 = _2261 + _2223;
    float _2265 = _2259;
    if (_2157)
    {
        float _2267 = _2257 + (-1.0);
        _2175 = _2267;
    }
    float _2269 = _2175;
    if (_2157)
    {
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _2271;
    }
    float _2273 = _1485;
    if (_2157)
    {
        float _2275 = fma(_2155, _2257, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    float _2279 = -_925;
    float _2281 = _2279 + _2229;
    float _2283 = -_869;
    float _2285 = _2283 + _2277;
    float _2287 = _2285 * _2285;
    float _2289 = fma(_2263, _2263, _2287);
    float _2291 = fma(_2281, _2281, _2289);
    float _2293 = sqrt(_2291);
    bool _2295 = _2293 > 0.0;
    float _2297 = fma(_2243, 100.0, _2277);
    bool _2299 = !_2295;
    float _2301 = _2297;
    float _2303 = _2291;
    float _2305 = _2285;
    if (!_2299)
    {
        float _2307 = _205 * _205;
        float _2309 = fma(_203, _203, _2307);
        float _2311 = fma(_207, _207, _2309);
        float _2313 = rsqrt(_2291);
        float _2315 = sqrt(_2311);
        float _2317 = _2285 * _2313;
        float _2319 = _2281 * _2313;
        bool _2321 = _2315 > 0.0;
        float _2323 = _2263 * _2313;
        bool _2325 = !_2321;
        _2177 = _2319;
        _2305 = _2317;
        _2251 = _2323;
        if (!_2325)
        {
            float _2327 = rsqrt(_2311);
            float _2329 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2331 = _205 * _2327;
            float _2333 = _203 * _2327;
            float _2335 = _2317 * _2331;
            float _2337 = _207 * _2327;
            float _2339 = fma(_2323, _2333, _2335);
            float _2341 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2343 = fma(_2319, _2337, _2339);
            float _2345 = _2343 * _2341;
            float _2347 = fma(_203, _2345, _2223);
            float _2349 = fma(_205, _2345, _2297);
            float _2351 = fma(_207, _2345, _2229);
            _2301 = _2349;
            _2225 = _2347;
            _2249 = _2351;
            _2303 = _2339;
            _2305 = _2341;
        }
    }
    float _2353 = _2301;
    float _2355 = _2225;
    float _2357 = _2249;
    float _2359 = _2303;
    float _2361 = _2177;
    float _2363 = _2305;
    float _2365 = _2251;
    float _2367 = -_1057;
    float _2369 = _2367 + _2353;
    float _2371 = -_1059;
    float _2373 = _2371 + _2355;
    float _2375 = -_1081;
    float _2377 = _2375 + _2357;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _2369 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _2373 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _2377 + _2387;
    float _2391 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2393 = _2381 * _2381;
    float _2395 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2391);
    float _2397 = fma(_2385, _2385, _2393);
    float _2399 = fma(_2389, _2389, _2397);
    float _2401 = rsqrt(_2399);
    float _2403 = sqrt(_2399);
    float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2407 = _2385 * _2405;
    float _2409 = _2389 * _2405;
    float _2411 = _2407 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 + _2413;
    float _2417 = sqrt(_2415);
    bool _2419 = _2417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = _2417 + _2421;
    float _2425 = _2359;
    float _2427 = _2415;
    float _2429 = _2423;
    float _2431 = _2361;
    float _2433 = _2365;
    float _2435 = _2355;
    float _2437 = _2407;
    float _2439 = _2409;
    float _2441 = _2411;
    float _2443 = _2413;
    if (_2419)
    {
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2425 = _2445;
    }
    float _2447 = _2425;
    if (_2419)
    {
        float _2449 = rsqrt(_2415);
        _2427 = _2449;
    }
    float _2451 = _2427;
    if (_2419)
    {
        float _2453 = _2423 * _2447;
        _2429 = _2453;
    }
    float _2455 = _2429;
    if (_2419)
    {
        float _2457 = _2455 * 0.15915493667125701904296875;
        _2431 = _2457;
    }
    float _2459 = _2431;
    float _2461 = _2447;
    if (_2419)
    {
        float _2463 = _2459 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = precise::max(0.0, _2469);
    float _2473 = _2363;
    float _2475 = _2471;
    if (_2419)
    {
        float _2477 = _2459 * 6.283185482025146484375;
        float _2479 = cos(_2477);
        _2473 = _2479;
    }
    float _2481 = _2473;
    float _2483 = -_2405;
    float _2485 = -_2471;
    float _2487 = fma(_2381, _2483, _2485);
    if (_2419)
    {
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2475 = _2489;
    }
    float _2491 = _2475;
    float _2493 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2497 = _2467;
    if (_2419)
    {
        float _2499 = fma(_2467, _2491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _211 = _2499;
    }
    float _2501 = _211;
    if (!_2419)
    {
        _2497 = _2487;
    }
    float _2503 = _2497;
    float _2505 = floor(_2495);
    float _2507 = _2503;
    if (_2419)
    {
        float _2509 = _2481 + (-1.0);
        _2433 = _2509;
    }
    float _2511 = _2433;
    float _2513 = _2511;
    if (_2419)
    {
        float _2515 = _2451 * _2501;
        _2435 = _2515;
    }
    float _2517 = _2435;
    if (_2419)
    {
        float _2519 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2519;
    }
    float _2521 = _2513;
    if (_2419)
    {
        float _2523 = _2407 * _2517;
        _2437 = _2523;
    }
    float _2525 = _2437;
    if (_2419)
    {
        float _2527 = _2409 * _2517;
        _2439 = _2527;
    }
    float _2529 = _2439;
    float _2531 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    if (_2419)
    {
        float _2533 = fma(_2487, _2481, _2521);
        _2507 = _2533;
    }
    float _2535 = _2507;
    if (_2419)
    {
        float _2537 = _2525 * _2525;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2419)
    {
        float _2541 = _2529 * _2529;
        _2443 = _2541;
    }
    float _2543 = _2443;
    float _2545 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2547 = fma(_2535, _2535, _2539);
    float _2549 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2551 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2553 = _2547 + _2543;
    float _2555 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2557 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2551);
    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2555);
    float _2563 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2557);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = rsqrt(_2553);
    float _2573 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2561);
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2577 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2579 = -_2569;
    float _2581 = _2579 + 1.0;
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2589 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2395);
    float _2591 = floor(_2549);
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2595 = -_2587;
    float _2597 = fma(_2595, _2559, 1.0);
    float _2599 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2601 = -_2505;
    float _2603 = _2495 + _2601;
    float _2605 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2607 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2609 = _2571 * _2525;
    float _2611 = abs(_2581);
    float _2613 = log2(_2611);
    float _2615 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2617 = _2571 * _2535;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2621 = _2571 * _2529;
    float _2623 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2625 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2607);
    float _2627 = -_2619;
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2627);
    float _2631 = log2(_2597);
    float _2633 = -_2591;
    float _2635 = _2549 + _2633;
    float _2637 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2623);
    float _2639 = -_2621;
    float _2641 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2629);
    float _2643 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2625);
    float _2645 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2647 = fma(_2641, -0.5, 0.5);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2651 = fma(_2641, 0.5, 0.5);
    float _2653 = 1.0 / _2615;
    float _2655 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2643);
    float _2657 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2645);
    float _2659 = fma(_2651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2661 = _2631 * 0.693147182464599609375;
    float _2663 = fma(_2651, _2659, -0.212114393711090087890625);
    float _2665 = exp2(_2649);
    float _2667 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2669 = fma(_2651, _2663, 1.570728778839111328125);
    float _2671 = sqrt(_2647);
    float _2673 = _2617 + 1.0;
    float _2675 = _2655 * _2653;
    float2 _7696 = float2(_2603, _2635);
    float _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7696, float2(0.0), isnan(_7696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7696, float2(0.0), isnan(_7696)), level(0.0)).x;
    float _2679 = fma(_2675, 0.5, 0.5);
    float _2681 = -_2617;
    float _2683 = fma(_2665, _2673, _2681);
    float _2685 = _2657 * _2653;
    float _2687 = fma(_2683, 0.5, 0.5);
    float _2689 = fma(_2685, -0.5, 0.5);
    float _2691 = _2671 * 0.636619746685028076171875;
    float _2693 = -_2669;
    float _2695 = fma(_2691, _2693, 1.0);
    float3 _7728 = float3(_2679, _2689, _2667);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7739 = float3(_2679, _2689, _2667);
    float4 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7739, float3(0.0), isnan(_7739)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7739, float3(0.0), isnan(_7739)), level(0.0)).xyzw;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2700.w;
    float2 _7755 = float2(_2695, _2687);
    float3 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7755, float2(0.0), isnan(_7755)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7755, float2(0.0), isnan(_7755)), level(0.0)).xyz;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _2720 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2722 = fma(_2243, 100.0, _869);
    float _2724 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2726;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    float _2730 = -_1057;
    float _2732 = _2730 + _2722;
    float _2734 = fma(_2728, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2740 = _2734 * _1851;
    float _2742 = fma(_2738, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2744;
    float _2748 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2740);
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2754;
    float _2758 = fma(_2746, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2760 = fma(_2742, _1893, _2748);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2762;
    float _2766 = fma(_2752, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2772 = fma(_2758, _1861, _2760);
    float _2774 = fma(_2764, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2776 = _1223 * _2059;
    float _2778 = fma(_2770, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2780 = fma(_2766, _1811, _2772);
    float _2782 = _1223 * _2107;
    float _2784 = _1245 * _2059;
    float _2786 = -_1189;
    float _2788 = fma(_2786, _2025, _2776);
    float _2790 = _1223 * _2051;
    float _2792 = -_1189;
    float _2794 = fma(_2792, _2033, _2782);
    float _2796 = _1277 * _2059;
    float _2798 = fma(_1225, _2025, _2784);
    float _2800 = fma(_1227, _1523, _2788);
    float _2802 = fma(_1227, _1525, _2794);
    float _2804 = fma(_1229, _2025, _2796);
    float _2806 = fma(_1269, _1523, _2798);
    float _2808 = _2720 * _2800;
    float _2810 = _2720 * _2802;
    float _2812 = fma(_1247, _1523, _2804);
    float _2814 = fma(_2756, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2816 = fma(_2724, _2806, _2808);
    float _2818 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2822 = _1245 * _2107;
    float _2824 = _2812 + _2816;
    float _2826 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2828 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2820);
    float _2830 = fma(_2774, _1797, _2780);
    float _2832 = -_1189;
    float _2834 = fma(_2832, _2045, _2790);
    float _2836 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2826);
    float _2838 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2828);
    float _2840 = fma(_1225, _2033, _2822);
    float _2842 = fma(_2778, _1771, _2830);
    float _2844 = _2836 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2848 = fma(_1227, _1527, _2834);
    float _2850 = fma(_1269, _1525, _2840);
    float _2852 = 1.0 / _2844;
    float _2854 = _2846 + _2844;
    float _2856 = fma(_2814, _1719, _2842);
    float _2858 = fma(_2724, _2850, _2810);
    float _2860 = _1245 * _2051;
    float _2862 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2856);
    float _2864 = in.m_68.x;
    float _2866 = _1277 * _2107;
    float _2868 = _1277 * _2051;
    out.m_78.x = _2862;
    float _2870 = fma(_1225, _2045, _2860);
    float _2872 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2874 = fma(_1229, _2033, _2866);
    float _2876 = _2854 * _2852;
    float _2878 = _2876 * 0.5;
    bool _2880 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.5);
    bool _2888 = _2884 || _2886;
    float _2890 = fma(_1229, _2045, _2868);
    float _2892 = fma(_1269, _1527, _2870);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2896 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2894);
    float _2898 = _2720 * _2848;
    float _2900 = exp2(_2872);
    float _2902 = fma(_1247, _1525, _2874);
    float _2904 = fma(_1247, _1527, _2890);
    float _2906 = fma(_2724, _2892, _2898);
    float _2908 = _2615 * 0.5;
    float _2910 = _2902 + _2858;
    float _2912 = _2904 + _2906;
    float _2914 = 1.0 / _2896;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2918 = _2914 * _2916;
    float _2920 = abs(_2918);
    float _2922 = log2(_2920);
    bool _2924 = _2918 <= 8000.0;
    bool _2926 = isnan(_2918);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan(8000.0);
    bool _2932 = _2928 || _2930;
    float _2934 = float(_2932);
    float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2938 = exp2(_2936);
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = _2938;
    float _2946 = _2908;
    float _2948 = _2615;
    float _2950 = _2657;
    float _2952 = _2655;
    if (_2888)
    {
        _2944 = 1.0;
    }
    float _2954 = _2944;
    float _2956 = fma(_2942, -2.0, 3.0);
    float _2958 = _2942 * _2942;
    float _2960 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2962 = _2958 * _2956;
    float _2964 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2960);
    float _2966 = -_2962;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2964);
    float _2972 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2962);
    float _2974 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2970);
    float _2976 = _2655 + _2615;
    float _2978 = fma(_2657, -0.5, _2908);
    float _2980 = _2954;
    float _2982 = _2978;
    if (_2888)
    {
        _2946 = 1.0;
    }
    float _2984 = _2946;
    float _2986 = _2974 + _2615;
    float _2988 = _2976 * 0.5;
    float _2990 = _2986 * 0.5;
    float _2992 = _2984;
    float _2994 = _2990;
    if (!_2888)
    {
        float _2996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2998 = _2996 * 0.15915493667125701904296875;
        float _3000 = _2998 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3006 = _3004 * 0.15915493667125701904296875;
        float _3008 = _2998 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        float _3012 = 1.0 / _3002;
        float _3014 = _3006 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        float _3018 = _3010 * _3012;
        float _3020 = _3006 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = _3016 * _3018;
        float _3026 = 1.0 / _3024;
        float _3028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3028;
        float _3032 = 1.0 / _3030;
        float _3034 = _3022 * _3026;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = fma(_2918, _3034, _3036);
        float _3040 = _3038 * _3032;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        _2992 = _3042;
    }
    float _3044 = _2992;
    if (!_2888)
    {
        float _3046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = _3048 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3056 = _3054 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3052;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2918, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2980 = _3096;
    }
    float _3098 = _2980;
    float _3100 = _2934 * _2972;
    float _3102 = -_2900;
    float _3104 = _3102 + 1.0;
    float _3106 = -_2677;
    float _3108 = _3106 + 1.0;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2988;
    out.m_80.y = _2978;
    out.m_80.z = _2990;
    out.m_80.w = _2615;
    bool _3114 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3116 = isnan(_2403);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3122 = _3118 || _3120;
    float _3124 = _3108 * _3110;
    float _3126 = precise::clamp(_3124, 0.0, 1.0);
    float _3128 = _3112 * _2697;
    out.m_82.x = _2824;
    out.m_82.y = _2910;
    out.m_82.z = _2912;
    float _3130 = -_3126;
    float _3132 = fma(_3130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3134 = _2708 * _3128;
    float _3136 = _2718 * _3128;
    out.gl_Position.x = _2655;
    out.gl_Position.y = _2657;
    out.gl_Position.z = _2974;
    out.gl_Position.w = _2615;
    float _3138 = _3132 * _2864;
    float _3140 = fma(_2714, _3134, _2702);
    float _3142 = fma(_2716, _3134, _2704);
    float _3144 = fma(_2708, _3136, _2706);
    float _3146 = -_3112;
    float _3148 = _3146 + 1.0;
    float _3150 = _3138 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    if (!_3122)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3154 = _2948;
    float _3156 = _2708 * _3148;
    float _3158 = _3154;
    float _3160 = _3154;
    if (!_3122)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3162 = _2994;
    out.m_84.x = _3150;
    float _3164 = _3162;
    float _3166 = _3162;
    if (!_3122)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3168 = _2982;
    float _3170 = _3044 * _3098;
    out.m_86.x = _3140;
    out.m_86.y = _3142;
    out.m_86.z = _3144;
    out.m_86.w = _3156;
    float _3172 = _3168;
    float _3174 = _3168;
    if (!_3122)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3176 = _2950;
    float _3178 = _3176;
    float _3180 = _3176;
    if (!_3122)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _2952;
    float _3184 = _3170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3186 = _3182;
    float _3188 = _3182;
    if (!_3122)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3190 = _3152;
    bool _3192 = !_3122;
    float _3194 = _3190;
    float _3196 = _3190;
    if (!_3192)
    {
        bool _3198 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3200 = isnan(_2403);
        bool _3202 = _3198 || _3200;
        bool _3204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3206 = _3202 || _3204;
        if (!_3206)
        {
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3210 = _2403 + _3208;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3212;
            float _3216 = 1.0 / _3214;
            float _3218 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3238 = _3210 * _3216;
            float _3240 = precise::clamp(_3238, 0.0, 1.0);
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3246 = fma(_3240, _3220, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3248 = fma(_3240, _3244, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3250 = fma(_3240, _3224, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3252 = fma(_3240, _3228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3254 = fma(_3240, _3232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3256 = fma(_3240, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3188 = _3248;
            _3174 = _3254;
            _3180 = _3246;
            _3166 = _3252;
            _3160 = _3250;
            _3196 = _3256;
            _3258 = true;
        }
        else
        {
            bool _3260 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3262 = isnan(_2403);
            bool _3264 = _3260 || _3262;
            bool _3266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3268 = _3264 || _3266;
            if (!_3268)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3270 = _3178;
            _3180 = _3270;
            if (!_3268)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3272 = _3186;
            _3188 = _3272;
            if (!_3268)
            {
                _3158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3274 = _3158;
            _3160 = _3274;
            if (!_3268)
            {
                _3164 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3276 = _3164;
            _3166 = _3276;
            if (!_3268)
            {
                _3172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3278 = _3172;
            _3174 = _3278;
            if (!_3268)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3280 = _3194;
            bool _3282 = !_3268;
            _3196 = _3280;
            if (!_3282)
            {
                bool _3284 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3286 = isnan(_2403);
                bool _3288 = _3284 || _3286;
                bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3292 = _3288 || _3290;
                if (!_3292)
                {
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3296 = _2403 + _3294;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3298;
                    float _3302 = 1.0 / _3300;
                    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3324 = _3296 * _3302;
                    float _3326 = precise::clamp(_3324, 0.0, 1.0);
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3332 = fma(_3326, _3306, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3334 = fma(_3326, _3330, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3336 = fma(_3326, _3310, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3338 = fma(_3326, _3314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3340 = fma(_3326, _3318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3342 = fma(_3326, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3188 = _3334;
                    _3174 = _3340;
                    _3180 = _3332;
                    _3166 = _3338;
                    _3160 = _3336;
                    _3196 = _3342;
                    _3258 = true;
                }
                else
                {
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3166 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3258 = false;
    float _3344 = _3188;
    float _3346 = _3174;
    float _3348 = _3180;
    float _3350 = _3166;
    float _3352 = _3160;
    float _3354 = _3196;
    float _3356 = fma(_2910, -0.5, 0.5);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = -_3344;
    float _3362 = _3360 + _3346;
    float _3364 = -_3348;
    float _3366 = _3364 + _3350;
    out.m_88.x = 0.0;
    float _3368 = fma(_3358, _3362, _3344);
    float _3370 = -_3352;
    float _3372 = _3370 + _3354;
    float _3374 = fma(_3358, _3366, _3348);
    float _3376 = _3368 * 0.586610972881317138671875;
    bool _3378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3380 = fma(_3358, _3372, _3352);
    float _3382 = _3184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3384 = fma(_3374, 0.298911988735198974609375, _3376);
    bool _3386 = _3044 > 0.0;
    bool _3388 = isnan(_3044);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.0);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3380, 0.114477999508380889892578125, _3384);
    out.m_51.x = _3382;
    bool _3398 = _3098 <= 0.0;
    bool _3400 = !_3394;
    bool _3402 = _3398 || _3400;
    float _3404 = -_3396;
    float _3406 = _3374 + _3404;
    float _3408 = -_3396;
    float _3410 = _3368 + _3408;
    float _3412 = -_3396;
    float _3414 = _3380 + _3412;
    float _3416 = fma(_3406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3418 = fma(_3410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3420 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    bool _3422 = !_3378;
    if (!_3422)
    {
        float _3424 = -_2369;
        float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3428 = -_2373;
        float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3432 = -_2377;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3436 = _3426 * _3426;
        float _3438 = fma(_3430, _3430, _3436);
        float _3440 = fma(_3434, _3434, _3438);
        float _3442 = sqrt(_3440);
        float _3444 = rsqrt(_3440);
        float _3446 = -_3442;
        float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3450 = _3448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3452 = precise::clamp(_3450, 0.0, 1.0);
        float _3454 = _3430 * _3444;
        float _3456 = _3426 * _3444;
        float _3458 = abs(_3452);
        float _3460 = log2(_3458);
        float _3462 = _3434 * _3444;
        float _3464 = _3454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3466 = _2910 * _3456;
        float _3468 = -_3456;
        float _3470 = -_3464;
        float _3472 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3470);
        float _3474 = fma(_2824, _3454, _3466);
        float _3476 = -_3462;
        float _3478 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3472);
        float _3480 = fma(_2912, _3462, _3474);
        float _3482 = precise::clamp(_3480, 0.0, 1.0);
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3486 = _3478 + _3484;
        float _3488 = _3460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3490 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3492 = precise::clamp(_3490, 0.0, 1.0);
        float _3494 = exp2(_3488);
        float _3496 = _3494 * _3492;
        float _3498 = _3482 * _3496;
        float _3500 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3502 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3504 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3500;
        out.m_88.y = _3502;
        out.m_88.z = _3504;
    }
    out.m_90.x = _3416;
    out.m_90.y = _3418;
    out.m_90.z = _3420;
    if (!_3402)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3506;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3258 = false;
    bool _433 = false;
    bool _335 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3562 = as_type<float>(_123);
        out.gl_Position.z = _3562;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3634 = as_type<float>(_163);
        out.gl_Position.z = _3634;
    }
    if (_153)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _205;
    float _229;
    if (!_209)
    {
        float _213 = in.m_62.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        _229 = _147;
    }
    _231 = false;
    float _233 = _229;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    float _239 = in.m_64.x;
    float _241 = in.m_64.y;
    bool _243 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_233);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_253;
    float _273 = _271 + 1.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    float _279 = 1.0 / _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = _269 * _273;
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _237 * _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_277, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = fma(_293, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _299 = _295 * _283;
    float _301 = _297 * _283;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _307 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].x, _303);
    float _309 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].y, _305);
    float _311 = _307 * _239;
    float _313 = _309 * _241;
    bool _315 = !_281;
    float _333;
    if (!_315)
    {
        float _317 = in.m_62.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        _333 = _147;
    }
    _335 = false;
    float _337 = _333;
    bool _339 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_337);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_337);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _337 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _369 * _381;
    float _391 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _391 * _383;
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _393);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _395);
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_62.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        _431 = _147;
    }
    _433 = false;
    float _435 = _431;
    float _437 = in.m_62.x;
    float _439 = in.m_62.y;
    float _441 = in.m_62.z;
    float _443 = in.m_62.w;
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _449 = _435 + _447;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_68.y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _467 = _465 != 0;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _463;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _481 = _443 > 0.5;
    float _483 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _485 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = _439 + _441;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _495 = _493 != 0;
    float _497 = _439 * 2.0;
    float _499 = -_201;
    int _501 = _481 ? as_type<int>(_499) : as_type<int>(_201);
    float _503 = _487 + (-1.0);
    bool _505 = _437 > 0.5;
    float _507 = fma(_485, -2.0, _477);
    float _509 = _439 + _437;
    float _511 = -_191;
    int _513 = _505 ? as_type<int>(_511) : as_type<int>(_191);
    float _515 = floor(_497);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _441 * 2.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _525 = !_453;
    float _527 = _525 ? _191 : as_type<float>(_513);
    float _529 = _509 + (-1.0);
    bool _531 = _439 > 0.5;
    float _533 = -_523;
    float _535 = fma(_483, 2.0, _533);
    float _537 = floor(_521);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _541 = -_201;
    int _543 = _531 ? as_type<int>(_541) : as_type<int>(_201);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    bool _549 = !_467;
    float _551 = _549 ? _201 : as_type<float>(_501);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _555 = _437 * 2.0;
    float _557 = _547 * _475;
    float _559 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _561 = !_459;
    float _563 = _561 ? _201 : as_type<float>(_543);
    float _565 = _551 + (-0.5);
    bool _567 = _441 > 0.5;
    float _569 = floor(_555);
    bool _571 = _537 >= 0.0;
    bool _573 = isnan(_537);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -_191;
    int _585 = _531 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = -_201;
    int _589 = _567 ? as_type<int>(_587) : as_type<int>(_201);
    int _591 = _579 ? 0 : 1;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _595 = !_491;
    float _597 = _595 ? _191 : as_type<float>(_585);
    float _599 = -_135;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[76].x, _535);
    bool _603 = _537 > 0.0;
    float _605 = fma(_557, _449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _607 = _555;
    float _609 = _557;
    if (!_519)
    {
        _607 = _441;
    }
    float _611 = _607;
    float _613 = _597 + 0.5;
    float _615 = _611;
    if (_519)
    {
        _615 = _439;
    }
    float _617 = _615;
    bool _619 = _569 > 0.0;
    float _621 = _613 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _623 = _569 >= 0.0;
    bool _625 = isnan(_569);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _635 = !_495;
    float _637 = _635 ? _201 : as_type<float>(_589);
    float _639 = _527 + 0.5;
    float _641 = -_191;
    int _643 = _567 ? as_type<int>(_641) : as_type<int>(_191);
    float _645 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[83].w, _479);
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_633, _639, _601);
    bool _655 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _657 = isnan(_435);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_637;
    float _669 = _667 + 0.5;
    bool _671 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_435);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    int _683 = _651;
    float _685 = _617;
    if (!_519)
    {
        _609 = _439;
    }
    float _687 = _609;
    float _689 = -_665;
    float _691 = _689 + 1.0;
    bool _693 = !_473;
    float _695 = _693 ? _191 : as_type<float>(_643);
    float _697 = -_681;
    float _699 = _697 + 1.0;
    float _701 = _687;
    if (!_603)
    {
        int _703 = ~_591;
        int _705 = _703 + 1;
        _683 = _705;
    }
    int _707 = _683;
    float _709 = _681 * _691;
    if (_519)
    {
        _701 = _437;
    }
    float _711 = _701;
    float _713 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    bool _715 = _515 > 0.0;
    float _717 = _605 * _709;
    bool _719 = _515 >= 0.0;
    bool _721 = isnan(_515);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[83].z, _539);
    float _731 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_519)
    {
        _685 = _441;
    }
    float _735 = _685;
    float _737 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[131].x, _717);
    float _739 = _735;
    if (_519)
    {
        _739 = _439;
    }
    float _741 = _739;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    float _757 = _469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _759 = _563 + (-0.5);
    float _761 = -_743;
    float _763 = fma(_731, 2.0, _761);
    float _765 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _767 = _631 ? 0 : 1;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _771 = -_757;
    float _773 = -_713;
    float _775 = fma(_771, _759, _773);
    float _777 = _669 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _781 = fma(_765, -2.0, _769);
    float _783 = _621 * _553;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = _777 * _593;
    float _793 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _781);
    float _795 = _733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _797 = _695 + 0.5;
    float _799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _801 = log2(_799);
    float _803 = -_135;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _763);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    out.m_70.x = _783;
    out.m_70.y = _791;
    int _813 = _811;
    if (!_619)
    {
        int _815 = ~_767;
        int _817 = _815 + 1;
        _813 = _817;
    }
    int _819 = _813;
    float _821 = fma(_795, _797, _805);
    float _823 = _779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _827 = -_823;
    float _829 = -_793;
    float _831 = fma(_827, _565, _829);
    int _833 = _727 ? 0 : 1;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _837 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].z, _825);
    float _839 = _801 * _135;
    int _841 = ~_833;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].w, _835);
    float _849 = _787 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = exp2(_839);
    float _853 = _787 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _855 = _845;
    int _857 = _819;
    if (!_715)
    {
        int _859 = ~_833;
        int _861 = _859 + 1;
        _855 = _861;
    }
    int _863 = _855;
    float _865 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _867 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _837);
    float _869 = _787 + _455;
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _869 + _885;
    float _889 = _871 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    bool _897 = !_747;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _903 = -_851;
    float _905 = _903 + 1.0;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = _887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _921 = _889 + _919;
    float _923 = 1.0 / _893;
    float _925 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _927 = abs(_899);
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -_867;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_563, _931, _775);
    bool _943 = !_751;
    int _945 = _943 ? 0 : 1;
    float _947 = -_935;
    float _949 = fma(_527, _947, _653);
    float _951 = _915 ? _905 : 0.0;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[28].x, _917);
    float _957 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _645);
    int _959 = abs(_945);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _955);
    float _963 = float(_707);
    float _965 = -_957;
    float _967 = _965 + 1.0;
    float _969 = _887 * _887;
    float _971 = float(_927);
    float _973 = -_953;
    float _975 = _973 + 1.0;
    bool _977 = _961 >= 0.0;
    float _979 = fma(_551, _967, _831);
    float _981 = fma(_921, _921, _969);
    float _983 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[132].x, _737);
    float _985 = -_975;
    float _987 = fma(_695, _985, _821);
    float _989 = _971 * _963;
    float _991 = float(_819);
    float _993 = in.m_72.x;
    float _995 = in.m_72.y;
    float _997 = in.m_72.z;
    float _999 = float(_959);
    float _1001 = fma(_939, _939, _981);
    float _1003 = _989 * (-2.0);
    float _1005 = _969;
    if (_883)
    {
        float _1007 = _951 * _923;
        _157 = _1007;
    }
    float _1009 = _157;
    if (_977)
    {
        _1005 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1005;
    float _1013 = _999 * _991;
    out.m_74.x = _949;
    out.m_74.y = _941;
    out.m_74.z = _987;
    out.m_74.w = _979;
    float _1015 = rsqrt(_1001);
    float _1017 = fma(_581, _1003, _581);
    if (_977)
    {
        float _1019 = _1011 * 5.0;
        _857 = as_type<int>(_1019);
    }
    int _1021 = _857;
    float _1023 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = _1023;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_977)
    {
        out.m_51.x = 0.0;
    }
    if (_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5026 = as_type<float>(_1021);
        out.gl_Position.z = _5026;
    }
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1035 = fma(_1003, _993, _993);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _437 + (-0.5);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1029 * _1015;
    float _1049 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1035);
    bool _1053 = !_755;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _887 * _1047;
    float _1059 = _921 * _1047;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _1061 = -_1057;
    float _1063 = _887 + _1061;
    float _1065 = -_1059;
    float _1067 = _921 + _1065;
    float _1069 = _997;
    if (_977)
    {
        return out;
    }
    float _1071 = -_1057;
    float _1073 = _869 + _1071;
    float _1075 = _1063 * _1063;
    float _1077 = -_1059;
    float _1079 = _889 + _1077;
    float _1081 = _939 * _1047;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = _1073 + _1083;
    float _1087 = fma(_1067, _1067, _1075);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1091 = _1079 + _1089;
    int _1093 = abs(_1055);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1081;
    float _1099 = _939 + _1097;
    float _1101 = _439 + (-0.5);
    float _1103 = fma(_1017, _1009, _1051);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1107 = _1013 * (-2.0);
    float _1109 = float(_863);
    float _1111 = -_1081;
    float _1113 = _925 + _1111;
    float _1115 = float(_1093);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_1099, _1099, _1087);
    float _1121 = fma(_559, _1107, _559);
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = _1113 + _1123;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1109;
    float _1131 = _441 + _437;
    float _1133 = fma(_1121, _1009, _1127);
    float _1135 = _1129 * (-2.0);
    float _1137 = _1131 + (-1.0);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1105);
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = fma(_1135, _997, _997);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1147 = _441 + (-0.5);
    bool _1149 = _1139 >= 0.0;
    float _1151 = _1103 * 0.15915493667125701904296875;
    float _1153 = fma(_1145, _1135, _1145);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1143);
    float _1157 = sqrt(_1119);
    float _1159 = fma(_1153, _1009, _1155);
    float _1161 = _1159 * 0.15915493667125701904296875;
    float _1163 = _1151 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    if (_1149)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1069;
    int _1169 = as_type<int>(_1167);
    if (_1149)
    {
        out.m_51.x = 0.0;
    }
    if (_1149)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    float _1175 = _1151 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    if (_1149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_1173);
        out.gl_Position.z = _5289;
    }
    float _1179 = _1141 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1141 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1161 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    if (_1149)
    {
        return out;
    }
    float _1191 = _1161 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1015 * _1157;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = _1165 * _1181;
    bool _1201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1207 = _1177 * _1185;
    float _1209 = _1177 * _1181;
    float _1211 = _1165 * _1185;
    float _1213 = 1.0 / _1205;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1223 = _1177 * _1193;
    float _1225 = _1185 * _1193;
    float _1227 = _1165 * _1193;
    float _1229 = _1181 * _1193;
    float _1231 = 0.0;
    if (_1197)
    {
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1231 = _1233;
    }
    float _1235 = _1231;
    float _1237 = _1023 * _1195;
    float _1239 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1197)
    {
        float _1241 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1025 = _1241;
    }
    float _1243 = _1025;
    float _1245 = fma(_1189, _1207, _1199);
    float _1247 = fma(_1189, _1199, _1207);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1253 = _1159;
    if (_1201)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1261 = 0.0;
    if (_1197)
    {
        float _1263 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1261 = _1263;
    }
    float _1265 = _1261;
    float _1267 = -_1209;
    float _1269 = fma(_1189, _1211, _1267);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1271;
    float _1275 = -_1211;
    float _1277 = fma(_1189, _1209, _1275);
    float _1279 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1285 = 1.0 / _1217;
    float _1287 = _1259 * _1237;
    float _1289 = -_869;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1201)
    {
        float _1293 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1027 = _1293;
    }
    float _1295 = _1027;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1299 = 1.0 / _1221;
    float _1301 = _1195 * _1279;
    float _1303 = _1283 * _1213;
    float _1305 = -_889;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1291 * _1291;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1319 = 1.0 / _1251;
    float _1321 = _1301;
    if (_1201)
    {
        float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1239 = _1323;
    }
    float _1325 = _1239;
    float _1327 = _1297 * _1301;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    if (_1197)
    {
        float _1333 = _1265 * _1235;
        _1321 = _1333;
    }
    float _1335 = _1321;
    float _1337 = -_925;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1341 = fma(_1307, _1307, _1309);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1343;
    float _1347 = 1.0 / _1313;
    float _1349 = _1257;
    if (_1201)
    {
        float _1351 = _1325 * _1257;
        _1349 = _1351;
    }
    float _1353 = _1349;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1359 = fma(_1339, _1339, _1341);
    float _1361 = _1273 * _1285;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1371 = 1.0 / _1317;
    float _1373 = _1357 * _1299;
    float _1375 = -_1327;
    float _1377 = _1189 * _1375;
    float _1379 = _1223 * _1327;
    float _1381 = _1227 * _1327;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1391 = 1.0 / _1331;
    float _1393 = _1365 * _1319;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1395;
    float _1399 = fma(_1225, _1287, _1377);
    float _1401 = fma(_1245, _1287, _1379);
    float _1403 = fma(_1269, _1287, _1381);
    float _1405 = 0.0;
    float _1407 = _1369;
    if (_1201)
    {
        float _1409 = floor(_1353);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1417;
    float _1421 = _1345 * _1347;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1427;
    float _1431 = _1419 * _1371;
    float _1433 = _1325;
    float _1435 = _1419;
    if (_1197)
    {
        float _1437 = floor(_1335);
        _1433 = _1437;
    }
    float _1439 = _1433;
    if (!_1201)
    {
        _1435 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1441 = _1435;
    float _1443 = _1369 * _1391;
    float _1445 = _1441;
    if (!_1197)
    {
        _1407 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1447 = _1407;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1453 = _787 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1455 = rsqrt(_1359);
    float _1457 = _1447;
    if (_1201)
    {
        float _1459 = -_1411;
        float _1461 = _1353 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    float _1469 = fma(_1229, _1467, _1399);
    bool _1471 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1473 = isnan(_1463);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = 1.0 / _1389;
    float _1485 = _1469;
    if (_1197)
    {
        float _1487 = -_1439;
        float _1489 = _1335 + _1487;
        _1457 = _1489;
    }
    float _1491 = _1457;
    bool _1493 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1495 = isnan(_1463);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1511 = _1491 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1515 = _1491 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1491 + _1517;
    float _1521 = 1.0 / _1385;
    float _1523 = _1307 * _1455;
    float _1525 = _1291 * _1455;
    float _1527 = _1339 * _1455;
    float _1529 = fma(_1277, _1467, _1401);
    float _1531 = fma(_1247, _1467, _1403);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1535 = _1491 + _1533;
    bool _1537 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1539 = isnan(_1491);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = 1.0 / _1397;
    float _1551 = _1511 * _1483;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1555 = _1491 + _1553;
    float _1557 = 1.0 / _1415;
    float _1559 = _1515 * _1521;
    float _1561 = 1.0 / _1425;
    float _1563 = _1535 * _1549;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1567 = _1463 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1571 = _1491 + _1569;
    float _1573 = fma(_1303, _1567, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1577 = _1463 + _1575;
    float _1579 = 1.0 / _1429;
    float _1581 = _1555 * _1557;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1585 = _1463 + _1583;
    float _1587 = fma(_1421, _1577, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1589 = fma(_1361, _1585, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1593 = _1463 + _1591;
    float _1595 = 1.0 / _1451;
    float _1597 = _1519 * _1561;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1601 = _1463 + _1599;
    float _1603 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1607 = _1463 + _1605;
    float _1609 = fma(_1373, _1601, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1611 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1613 = isnan(_1463);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1571 * _1579;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1627 = _1463 + _1625;
    bool _1629 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1631 = isnan(_1463);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1643 = _1491 + _1641;
    float _1645 = _1621 * _1507;
    float _1647 = fma(_1393, _1627, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1649 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1651 = isnan(_1463);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1621;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1431, _1607, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1667 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1669 = isnan(_1463);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -_1639;
    float _1681 = _1679 + 1.0;
    float _1683 = -_1659;
    float _1685 = _1683 + 1.0;
    bool _1687 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1689 = isnan(_1491);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1643 * _1595;
    float _1701 = _1503 * _1681;
    float _1703 = _1481 * _1685;
    float _1705 = -_1677;
    float _1707 = _1705 + 1.0;
    float _1709 = -_1697;
    float _1711 = _1709 + 1.0;
    float _1713 = _1639 * _1663;
    float _1715 = _1589 * _1701;
    float _1717 = _1659 * _1707;
    float _1719 = _1547 * _1711;
    float _1721 = -_1547;
    float _1723 = _1721 + 1.0;
    bool _1725 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1727 = isnan(_1463);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = -_1503;
    float _1739 = _1737 + 1.0;
    bool _1741 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1743 = isnan(_1491);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    bool _1753 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1755 = isnan(_1491);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1715);
    float _1767 = -_1735;
    float _1769 = _1767 + 1.0;
    float _1771 = _1751 * _1723;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1779 = isnan(_1491);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = _1677 * _1769;
    float _1791 = fma(_1573, _1713, _1765);
    float _1793 = -_1763;
    float _1795 = _1793 + 1.0;
    float _1797 = _1763 * _1775;
    bool _1799 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1801 = isnan(_1491);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1787 * _1795;
    bool _1813 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1815 = isnan(_1491);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1825;
    bool _1829 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1831 = isnan(_1491);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = -_1787;
    float _1847 = _1845 + 1.0;
    float _1849 = fma(_1827, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1839 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1857;
    float _1861 = _1823 * _1847;
    float _1863 = -_1823;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1839;
    float _1869 = _1867 + 1.0;
    float _1871 = _1849 * _1851;
    bool _1873 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1875 = isnan(_1463);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1859, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1887 = fma(_1647, _1645, _1791);
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1891 = _1889 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1893 = _1809 * _1865;
    float _1895 = fma(_1855, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1897 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1871);
    float _1899 = _1885 * _1851;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1901;
    float _1905 = -_1883;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1603, _1703, _1887);
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1913 = _1523 * _1911;
    float _1915 = fma(_1895, _1893, _1897);
    float _1917 = fma(_1891, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1919 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1899);
    float _1921 = fma(_1903, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1923 = _1735 * _1907;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1925;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1527 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1935 = -_1913;
    float _1937 = fma(_1527, _1933, _1935);
    float _1939 = fma(_1917, _1893, _1919);
    float _1941 = fma(_1921, _1861, _1915);
    float _1943 = fma(_1927, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1951 = -_1931;
    float _1953 = fma(_1525, _1949, _1951);
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1957 = _1525 * _1955;
    float _1959 = _1937 * _1937;
    float _1961 = fma(_1943, _1861, _1939);
    float _1963 = fma(_1947, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = fma(_1523, _1965, _1967);
    float _1971 = fma(_1953, _1953, _1959);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1977 = fma(_1963, _1811, _1941);
    float _1979 = fma(_1969, _1969, _1971);
    float _1981 = fma(_1975, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1989 = _1987 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1985, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1995 = fma(_1981, _1811, _1961);
    float _1997 = fma(_1587, _1717, _1909);
    float _1999 = fma(_1989, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2001 = fma(_1993, _1797, _1977);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2003;
    float _2007 = fma(_1609, _1789, _1997);
    float _2009 = fma(_1999, _1771, _2001);
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2015;
    float _2019 = fma(_2005, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2021 = fma(_1665, _1923, _2007);
    float _2023 = fma(_2017, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2025 = _1953 * _1991;
    float _2027 = fma(_2019, _1797, _1995);
    float _2029 = fma(_2013, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2031 = fma(_2023, _1719, _2009);
    float _2033 = _1937 * _1991;
    float _2035 = _1525 * _2025;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2037;
    float _2041 = fma(_2029, _1771, _2027);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2021);
    float _2045 = _1969 * _1991;
    float _2047 = _1527 * _2033;
    float _2049 = -_2035;
    float _2051 = fma(_1523, _2033, _2049);
    float _2053 = fma(_2039, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2055 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2031);
    float _2057 = -_2047;
    float _2059 = fma(_1525, _2045, _2057);
    float _2061 = _2051 * _1529;
    float _2063 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2065 = _925 + _2063;
    float _2067 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2069 = fma(_2053, _1719, _2041);
    float _2071 = _2059 * _1529;
    float _2073 = fma(_2045, _1469, _2061);
    float _2075 = -_2067;
    float _2077 = fma(_2055, _2065, _2075);
    float _2079 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2081 = _889 + _2079;
    float _2083 = fma(_2025, _1469, _2071);
    float _2085 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2087 = fma(_1527, _1531, _2073);
    float _2089 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2069);
    float _2091 = fma(_1523, _1531, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2055, _2081, _2093);
    float _2097 = _1523 * _2045;
    float _2099 = fma(_2087, _2089, _2077);
    float _2101 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1453);
    float _2103 = fma(_2091, _2089, _2095);
    float _2105 = -_2097;
    float _2107 = fma(_1527, _2025, _2105);
    float _2109 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2111 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2101);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2115 = _2107 * _1529;
    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2119 = _2109 + _2117;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2125 = _2113 + _2123;
    float _2127 = fma(_2033, _1469, _2115);
    float _2129 = _2119 * _2119;
    float _2131 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2133 = _2121 + _2131;
    float _2135 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2137 = fma(_1525, _1531, _2127);
    float _2139 = fma(_2125, _2125, _2129);
    float _2141 = -_2135;
    float _2143 = fma(_2055, _2133, _2141);
    float _2145 = _869 + _2137;
    float _2147 = sqrt(_2139);
    float _2149 = -_2121;
    float _2151 = _2145 + _2149;
    float _2153 = fma(_2089, _2151, _2143);
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2157 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2161 = _2147 + _2159;
    float _2163 = _2129;
    float _2165 = _2133;
    float _2167 = _2139;
    float _2169 = _2127;
    float _2171 = _2113;
    float _2173 = _2109;
    float _2175 = _1529;
    float _2177 = _2125;
    if (_2157)
    {
        float _2179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2179;
    }
    float _2181 = _2163;
    if (_2157)
    {
        float _2183 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2183;
    }
    float _2185 = _2165;
    if (_2157)
    {
        float _2187 = rsqrt(_2139);
        _2167 = _2187;
    }
    float _2189 = _2167;
    float _2191 = _2181;
    if (_2157)
    {
        float _2193 = _2161 * _2181;
        _2191 = _2193;
    }
    float _2195 = _2191;
    if (_2157)
    {
        float _2197 = _2195 * 0.15915493667125701904296875;
        _2169 = _2197;
    }
    float _2199 = _2169;
    float _2201 = _789;
    if (_2157)
    {
        float _2203 = _2199 * 6.283185482025146484375;
        float _2205 = sin(_2203);
        _2201 = _2205;
    }
    float _2207 = _2201;
    float _2209 = _2207;
    if (_2157)
    {
        float _2211 = fma(_2207, _2185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2157)
    {
        float _2217 = _2189 * _2213;
        _2215 = _2217;
    }
    float _2219 = _2215;
    if (_2157)
    {
        float _2221 = fma(_2125, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2171 = _2221;
    }
    float _2223 = _2171;
    float _2225 = _2223;
    if (_2157)
    {
        float _2227 = fma(_2119, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2173 = _2227;
    }
    float _2229 = _2173;
    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2233 = _2223 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2237 = _2229 + _2235;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6992 = float2(_2239, _2241);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6992, float2(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6992, float2(0.0), isnan(_6992)), level(0.0)).x;
    float _2245 = _2199;
    float _2247 = _2233;
    float _2249 = _2229;
    float _2251 = _2241;
    if (_2157)
    {
        float _2253 = _2199 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        _2245 = _2255;
    }
    float _2257 = _2245;
    if (!_2157)
    {
        _2247 = _2155;
    }
    float _2259 = _2247;
    float _2261 = -_889;
    float _2263 = _2261 + _2223;
    float _2265 = _2259;
    if (_2157)
    {
        float _2267 = _2257 + (-1.0);
        _2175 = _2267;
    }
    float _2269 = _2175;
    if (_2157)
    {
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _2271;
    }
    float _2273 = _1485;
    if (_2157)
    {
        float _2275 = fma(_2155, _2257, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    float _2279 = -_925;
    float _2281 = _2279 + _2229;
    float _2283 = -_869;
    float _2285 = _2283 + _2277;
    float _2287 = _2285 * _2285;
    float _2289 = fma(_2263, _2263, _2287);
    float _2291 = fma(_2281, _2281, _2289);
    float _2293 = sqrt(_2291);
    bool _2295 = _2293 > 0.0;
    float _2297 = fma(_2243, 100.0, _2277);
    bool _2299 = !_2295;
    float _2301 = _2297;
    float _2303 = _2291;
    float _2305 = _2285;
    if (!_2299)
    {
        float _2307 = _205 * _205;
        float _2309 = fma(_203, _203, _2307);
        float _2311 = fma(_207, _207, _2309);
        float _2313 = rsqrt(_2291);
        float _2315 = sqrt(_2311);
        float _2317 = _2285 * _2313;
        float _2319 = _2281 * _2313;
        bool _2321 = _2315 > 0.0;
        float _2323 = _2263 * _2313;
        bool _2325 = !_2321;
        _2177 = _2319;
        _2305 = _2317;
        _2251 = _2323;
        if (!_2325)
        {
            float _2327 = rsqrt(_2311);
            float _2329 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2331 = _205 * _2327;
            float _2333 = _203 * _2327;
            float _2335 = _2317 * _2331;
            float _2337 = _207 * _2327;
            float _2339 = fma(_2323, _2333, _2335);
            float _2341 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2343 = fma(_2319, _2337, _2339);
            float _2345 = _2343 * _2341;
            float _2347 = fma(_203, _2345, _2223);
            float _2349 = fma(_205, _2345, _2297);
            float _2351 = fma(_207, _2345, _2229);
            _2301 = _2349;
            _2225 = _2347;
            _2249 = _2351;
            _2303 = _2339;
            _2305 = _2341;
        }
    }
    float _2353 = _2301;
    float _2355 = _2225;
    float _2357 = _2249;
    float _2359 = _2303;
    float _2361 = _2177;
    float _2363 = _2305;
    float _2365 = _2251;
    float _2367 = -_1057;
    float _2369 = _2367 + _2353;
    float _2371 = -_1059;
    float _2373 = _2371 + _2355;
    float _2375 = -_1081;
    float _2377 = _2375 + _2357;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _2369 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _2373 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _2377 + _2387;
    float _2391 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2393 = _2381 * _2381;
    float _2395 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2391);
    float _2397 = fma(_2385, _2385, _2393);
    float _2399 = fma(_2389, _2389, _2397);
    float _2401 = rsqrt(_2399);
    float _2403 = sqrt(_2399);
    float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2407 = _2385 * _2405;
    float _2409 = _2389 * _2405;
    float _2411 = _2407 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 + _2413;
    float _2417 = sqrt(_2415);
    bool _2419 = _2417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = _2417 + _2421;
    float _2425 = _2359;
    float _2427 = _2415;
    float _2429 = _2423;
    float _2431 = _2361;
    float _2433 = _2365;
    float _2435 = _2355;
    float _2437 = _2407;
    float _2439 = _2409;
    float _2441 = _2411;
    float _2443 = _2413;
    if (_2419)
    {
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2425 = _2445;
    }
    float _2447 = _2425;
    if (_2419)
    {
        float _2449 = rsqrt(_2415);
        _2427 = _2449;
    }
    float _2451 = _2427;
    if (_2419)
    {
        float _2453 = _2423 * _2447;
        _2429 = _2453;
    }
    float _2455 = _2429;
    if (_2419)
    {
        float _2457 = _2455 * 0.15915493667125701904296875;
        _2431 = _2457;
    }
    float _2459 = _2431;
    float _2461 = _2447;
    if (_2419)
    {
        float _2463 = _2459 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = precise::max(0.0, _2469);
    float _2473 = _2363;
    float _2475 = _2471;
    if (_2419)
    {
        float _2477 = _2459 * 6.283185482025146484375;
        float _2479 = cos(_2477);
        _2473 = _2479;
    }
    float _2481 = _2473;
    float _2483 = -_2405;
    float _2485 = -_2471;
    float _2487 = fma(_2381, _2483, _2485);
    if (_2419)
    {
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2475 = _2489;
    }
    float _2491 = _2475;
    float _2493 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2497 = _2467;
    if (_2419)
    {
        float _2499 = fma(_2467, _2491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _211 = _2499;
    }
    float _2501 = _211;
    if (!_2419)
    {
        _2497 = _2487;
    }
    float _2503 = _2497;
    float _2505 = floor(_2495);
    float _2507 = _2503;
    if (_2419)
    {
        float _2509 = _2481 + (-1.0);
        _2433 = _2509;
    }
    float _2511 = _2433;
    float _2513 = _2511;
    if (_2419)
    {
        float _2515 = _2451 * _2501;
        _2435 = _2515;
    }
    float _2517 = _2435;
    if (_2419)
    {
        float _2519 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2519;
    }
    float _2521 = _2513;
    if (_2419)
    {
        float _2523 = _2407 * _2517;
        _2437 = _2523;
    }
    float _2525 = _2437;
    if (_2419)
    {
        float _2527 = _2409 * _2517;
        _2439 = _2527;
    }
    float _2529 = _2439;
    float _2531 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    if (_2419)
    {
        float _2533 = fma(_2487, _2481, _2521);
        _2507 = _2533;
    }
    float _2535 = _2507;
    if (_2419)
    {
        float _2537 = _2525 * _2525;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2419)
    {
        float _2541 = _2529 * _2529;
        _2443 = _2541;
    }
    float _2543 = _2443;
    float _2545 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2547 = fma(_2535, _2535, _2539);
    float _2549 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2551 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2553 = _2547 + _2543;
    float _2555 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2557 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2551);
    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2555);
    float _2563 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2557);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = rsqrt(_2553);
    float _2573 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2561);
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2577 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2579 = -_2569;
    float _2581 = _2579 + 1.0;
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2589 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2395);
    float _2591 = floor(_2549);
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2595 = -_2587;
    float _2597 = fma(_2595, _2559, 1.0);
    float _2599 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2601 = -_2505;
    float _2603 = _2495 + _2601;
    float _2605 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2607 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2609 = _2571 * _2525;
    float _2611 = abs(_2581);
    float _2613 = log2(_2611);
    float _2615 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2617 = _2571 * _2535;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2621 = _2571 * _2529;
    float _2623 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2625 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2607);
    float _2627 = -_2619;
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2627);
    float _2631 = log2(_2597);
    float _2633 = -_2591;
    float _2635 = _2549 + _2633;
    float _2637 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2623);
    float _2639 = -_2621;
    float _2641 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2629);
    float _2643 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2625);
    float _2645 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2647 = fma(_2641, -0.5, 0.5);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2651 = fma(_2641, 0.5, 0.5);
    float _2653 = 1.0 / _2615;
    float _2655 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2643);
    float _2657 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2645);
    float _2659 = fma(_2651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2661 = _2631 * 0.693147182464599609375;
    float _2663 = fma(_2651, _2659, -0.212114393711090087890625);
    float _2665 = exp2(_2649);
    float _2667 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2669 = fma(_2651, _2663, 1.570728778839111328125);
    float _2671 = sqrt(_2647);
    float _2673 = _2617 + 1.0;
    float _2675 = _2655 * _2653;
    float2 _7696 = float2(_2603, _2635);
    float _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7696, float2(0.0), isnan(_7696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7696, float2(0.0), isnan(_7696)), level(0.0)).x;
    float _2679 = fma(_2675, 0.5, 0.5);
    float _2681 = -_2617;
    float _2683 = fma(_2665, _2673, _2681);
    float _2685 = _2657 * _2653;
    float _2687 = fma(_2683, 0.5, 0.5);
    float _2689 = fma(_2685, -0.5, 0.5);
    float _2691 = _2671 * 0.636619746685028076171875;
    float _2693 = -_2669;
    float _2695 = fma(_2691, _2693, 1.0);
    float3 _7728 = float3(_2679, _2689, _2667);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7739 = float3(_2679, _2689, _2667);
    float4 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7739, float3(0.0), isnan(_7739)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7739, float3(0.0), isnan(_7739)), level(0.0)).xyzw;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2700.w;
    float2 _7755 = float2(_2695, _2687);
    float3 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7755, float2(0.0), isnan(_7755)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7755, float2(0.0), isnan(_7755)), level(0.0)).xyz;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _2720 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2722 = fma(_2243, 100.0, _869);
    float _2724 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2726;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    float _2730 = -_1057;
    float _2732 = _2730 + _2722;
    float _2734 = fma(_2728, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2740 = _2734 * _1851;
    float _2742 = fma(_2738, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2744;
    float _2748 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2740);
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2754;
    float _2758 = fma(_2746, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2760 = fma(_2742, _1893, _2748);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2762;
    float _2766 = fma(_2752, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2772 = fma(_2758, _1861, _2760);
    float _2774 = fma(_2764, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2776 = _1223 * _2059;
    float _2778 = fma(_2770, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2780 = fma(_2766, _1811, _2772);
    float _2782 = _1223 * _2107;
    float _2784 = _1245 * _2059;
    float _2786 = -_1189;
    float _2788 = fma(_2786, _2025, _2776);
    float _2790 = _1223 * _2051;
    float _2792 = -_1189;
    float _2794 = fma(_2792, _2033, _2782);
    float _2796 = _1277 * _2059;
    float _2798 = fma(_1225, _2025, _2784);
    float _2800 = fma(_1227, _1523, _2788);
    float _2802 = fma(_1227, _1525, _2794);
    float _2804 = fma(_1229, _2025, _2796);
    float _2806 = fma(_1269, _1523, _2798);
    float _2808 = _2720 * _2800;
    float _2810 = _2720 * _2802;
    float _2812 = fma(_1247, _1523, _2804);
    float _2814 = fma(_2756, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2816 = fma(_2724, _2806, _2808);
    float _2818 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2822 = _1245 * _2107;
    float _2824 = _2812 + _2816;
    float _2826 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2828 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2820);
    float _2830 = fma(_2774, _1797, _2780);
    float _2832 = -_1189;
    float _2834 = fma(_2832, _2045, _2790);
    float _2836 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2826);
    float _2838 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2828);
    float _2840 = fma(_1225, _2033, _2822);
    float _2842 = fma(_2778, _1771, _2830);
    float _2844 = _2836 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2848 = fma(_1227, _1527, _2834);
    float _2850 = fma(_1269, _1525, _2840);
    float _2852 = 1.0 / _2844;
    float _2854 = _2846 + _2844;
    float _2856 = fma(_2814, _1719, _2842);
    float _2858 = fma(_2724, _2850, _2810);
    float _2860 = _1245 * _2051;
    float _2862 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2856);
    float _2864 = in.m_68.x;
    float _2866 = _1277 * _2107;
    float _2868 = _1277 * _2051;
    out.m_78.x = _2862;
    float _2870 = fma(_1225, _2045, _2860);
    float _2872 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2874 = fma(_1229, _2033, _2866);
    float _2876 = _2854 * _2852;
    float _2878 = _2876 * 0.5;
    bool _2880 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.5);
    bool _2888 = _2884 || _2886;
    float _2890 = fma(_1229, _2045, _2868);
    float _2892 = fma(_1269, _1527, _2870);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2896 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2894);
    float _2898 = _2720 * _2848;
    float _2900 = exp2(_2872);
    float _2902 = fma(_1247, _1525, _2874);
    float _2904 = fma(_1247, _1527, _2890);
    float _2906 = fma(_2724, _2892, _2898);
    float _2908 = _2615 * 0.5;
    float _2910 = _2902 + _2858;
    float _2912 = _2904 + _2906;
    float _2914 = 1.0 / _2896;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2918 = _2914 * _2916;
    float _2920 = abs(_2918);
    float _2922 = log2(_2920);
    bool _2924 = _2918 <= 8000.0;
    bool _2926 = isnan(_2918);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan(8000.0);
    bool _2932 = _2928 || _2930;
    float _2934 = float(_2932);
    float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2938 = exp2(_2936);
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = _2938;
    float _2946 = _2908;
    float _2948 = _2615;
    float _2950 = _2657;
    float _2952 = _2655;
    if (_2888)
    {
        _2944 = 1.0;
    }
    float _2954 = _2944;
    float _2956 = fma(_2942, -2.0, 3.0);
    float _2958 = _2942 * _2942;
    float _2960 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2962 = _2958 * _2956;
    float _2964 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2960);
    float _2966 = -_2962;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2964);
    float _2972 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2962);
    float _2974 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2970);
    float _2976 = _2655 + _2615;
    float _2978 = fma(_2657, -0.5, _2908);
    float _2980 = _2954;
    float _2982 = _2978;
    if (_2888)
    {
        _2946 = 1.0;
    }
    float _2984 = _2946;
    float _2986 = _2974 + _2615;
    float _2988 = _2976 * 0.5;
    float _2990 = _2986 * 0.5;
    float _2992 = _2984;
    float _2994 = _2990;
    if (!_2888)
    {
        float _2996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2998 = _2996 * 0.15915493667125701904296875;
        float _3000 = _2998 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3006 = _3004 * 0.15915493667125701904296875;
        float _3008 = _2998 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        float _3012 = 1.0 / _3002;
        float _3014 = _3006 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        float _3018 = _3010 * _3012;
        float _3020 = _3006 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = _3016 * _3018;
        float _3026 = 1.0 / _3024;
        float _3028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3028;
        float _3032 = 1.0 / _3030;
        float _3034 = _3022 * _3026;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = fma(_2918, _3034, _3036);
        float _3040 = _3038 * _3032;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        _2992 = _3042;
    }
    float _3044 = _2992;
    if (!_2888)
    {
        float _3046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = _3048 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3056 = _3054 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3052;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2918, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2980 = _3096;
    }
    float _3098 = _2980;
    float _3100 = _2934 * _2972;
    float _3102 = -_2900;
    float _3104 = _3102 + 1.0;
    float _3106 = -_2677;
    float _3108 = _3106 + 1.0;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2988;
    out.m_80.y = _2978;
    out.m_80.z = _2990;
    out.m_80.w = _2615;
    bool _3114 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3116 = isnan(_2403);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3122 = _3118 || _3120;
    float _3124 = _3108 * _3110;
    float _3126 = precise::clamp(_3124, 0.0, 1.0);
    float _3128 = _3112 * _2697;
    out.m_82.x = _2824;
    out.m_82.y = _2910;
    out.m_82.z = _2912;
    float _3130 = -_3126;
    float _3132 = fma(_3130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3134 = _2708 * _3128;
    float _3136 = _2718 * _3128;
    out.gl_Position.x = _2655;
    out.gl_Position.y = _2657;
    out.gl_Position.z = _2974;
    out.gl_Position.w = _2615;
    float _3138 = _3132 * _2864;
    float _3140 = fma(_2714, _3134, _2702);
    float _3142 = fma(_2716, _3134, _2704);
    float _3144 = fma(_2708, _3136, _2706);
    float _3146 = -_3112;
    float _3148 = _3146 + 1.0;
    float _3150 = _3138 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    if (!_3122)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3154 = _2948;
    float _3156 = _2708 * _3148;
    float _3158 = _3154;
    float _3160 = _3154;
    if (!_3122)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3162 = _2994;
    out.m_84.x = _3150;
    float _3164 = _3162;
    float _3166 = _3162;
    if (!_3122)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3168 = _2982;
    float _3170 = _3044 * _3098;
    out.m_86.x = _3140;
    out.m_86.y = _3142;
    out.m_86.z = _3144;
    out.m_86.w = _3156;
    float _3172 = _3168;
    float _3174 = _3168;
    if (!_3122)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3176 = _2950;
    float _3178 = _3176;
    float _3180 = _3176;
    if (!_3122)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _2952;
    float _3184 = _3170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3186 = _3182;
    float _3188 = _3182;
    if (!_3122)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3190 = _3152;
    bool _3192 = !_3122;
    float _3194 = _3190;
    float _3196 = _3190;
    if (!_3192)
    {
        bool _3198 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3200 = isnan(_2403);
        bool _3202 = _3198 || _3200;
        bool _3204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3206 = _3202 || _3204;
        if (!_3206)
        {
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3210 = _2403 + _3208;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3212;
            float _3216 = 1.0 / _3214;
            float _3218 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3238 = _3210 * _3216;
            float _3240 = precise::clamp(_3238, 0.0, 1.0);
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3246 = fma(_3240, _3220, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3248 = fma(_3240, _3244, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3250 = fma(_3240, _3224, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3252 = fma(_3240, _3228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3254 = fma(_3240, _3232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3256 = fma(_3240, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3188 = _3248;
            _3174 = _3254;
            _3180 = _3246;
            _3166 = _3252;
            _3160 = _3250;
            _3196 = _3256;
            _3258 = true;
        }
        else
        {
            bool _3260 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3262 = isnan(_2403);
            bool _3264 = _3260 || _3262;
            bool _3266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3268 = _3264 || _3266;
            if (!_3268)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3270 = _3178;
            _3180 = _3270;
            if (!_3268)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3272 = _3186;
            _3188 = _3272;
            if (!_3268)
            {
                _3158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3274 = _3158;
            _3160 = _3274;
            if (!_3268)
            {
                _3164 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3276 = _3164;
            _3166 = _3276;
            if (!_3268)
            {
                _3172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3278 = _3172;
            _3174 = _3278;
            if (!_3268)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3280 = _3194;
            bool _3282 = !_3268;
            _3196 = _3280;
            if (!_3282)
            {
                bool _3284 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3286 = isnan(_2403);
                bool _3288 = _3284 || _3286;
                bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3292 = _3288 || _3290;
                if (!_3292)
                {
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3296 = _2403 + _3294;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3298;
                    float _3302 = 1.0 / _3300;
                    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3324 = _3296 * _3302;
                    float _3326 = precise::clamp(_3324, 0.0, 1.0);
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3332 = fma(_3326, _3306, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3334 = fma(_3326, _3330, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3336 = fma(_3326, _3310, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3338 = fma(_3326, _3314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3340 = fma(_3326, _3318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3342 = fma(_3326, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3188 = _3334;
                    _3174 = _3340;
                    _3180 = _3332;
                    _3166 = _3338;
                    _3160 = _3336;
                    _3196 = _3342;
                    _3258 = true;
                }
                else
                {
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3166 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3258 = false;
    float _3344 = _3188;
    float _3346 = _3174;
    float _3348 = _3180;
    float _3350 = _3166;
    float _3352 = _3160;
    float _3354 = _3196;
    float _3356 = fma(_2910, -0.5, 0.5);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = -_3344;
    float _3362 = _3360 + _3346;
    float _3364 = -_3348;
    float _3366 = _3364 + _3350;
    out.m_88.x = 0.0;
    float _3368 = fma(_3358, _3362, _3344);
    float _3370 = -_3352;
    float _3372 = _3370 + _3354;
    float _3374 = fma(_3358, _3366, _3348);
    float _3376 = _3368 * 0.586610972881317138671875;
    bool _3378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3380 = fma(_3358, _3372, _3352);
    float _3382 = _3184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3384 = fma(_3374, 0.298911988735198974609375, _3376);
    bool _3386 = _3044 > 0.0;
    bool _3388 = isnan(_3044);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.0);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3380, 0.114477999508380889892578125, _3384);
    out.m_51.x = _3382;
    bool _3398 = _3098 <= 0.0;
    bool _3400 = !_3394;
    bool _3402 = _3398 || _3400;
    float _3404 = -_3396;
    float _3406 = _3374 + _3404;
    float _3408 = -_3396;
    float _3410 = _3368 + _3408;
    float _3412 = -_3396;
    float _3414 = _3380 + _3412;
    float _3416 = fma(_3406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3418 = fma(_3410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3420 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    bool _3422 = !_3378;
    if (!_3422)
    {
        float _3424 = -_2369;
        float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3428 = -_2373;
        float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3432 = -_2377;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3436 = _3426 * _3426;
        float _3438 = fma(_3430, _3430, _3436);
        float _3440 = fma(_3434, _3434, _3438);
        float _3442 = sqrt(_3440);
        float _3444 = rsqrt(_3440);
        float _3446 = -_3442;
        float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3450 = _3448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3452 = precise::clamp(_3450, 0.0, 1.0);
        float _3454 = _3430 * _3444;
        float _3456 = _3426 * _3444;
        float _3458 = abs(_3452);
        float _3460 = log2(_3458);
        float _3462 = _3434 * _3444;
        float _3464 = _3454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3466 = _2910 * _3456;
        float _3468 = -_3456;
        float _3470 = -_3464;
        float _3472 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3470);
        float _3474 = fma(_2824, _3454, _3466);
        float _3476 = -_3462;
        float _3478 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3472);
        float _3480 = fma(_2912, _3462, _3474);
        float _3482 = precise::clamp(_3480, 0.0, 1.0);
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3486 = _3478 + _3484;
        float _3488 = _3460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3490 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3492 = precise::clamp(_3490, 0.0, 1.0);
        float _3494 = exp2(_3488);
        float _3496 = _3494 * _3492;
        float _3498 = _3482 * _3496;
        float _3500 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3502 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3504 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3500;
        out.m_88.y = _3502;
        out.m_88.z = _3504;
    }
    out.m_90.x = _3416;
    out.m_90.y = _3418;
    out.m_90.z = _3420;
    if (!_3402)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3506;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3258 = false;
    bool _433 = false;
    bool _335 = false;
    bool _231 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3562 = as_type<float>(_123);
        out.gl_Position.z = _3562;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _161 = _159 * 5.0;
        _125 = as_type<int>(_161);
    }
    int _163 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3634 = as_type<float>(_163);
        out.gl_Position.z = _3634;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _189 = !_175;
    float _191 = _189 ? (-0.5) : 0.5;
    float _193 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _195 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _197 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _193);
    float _205 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _195);
    float _207 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _197);
    bool _209 = !_181;
    float _211 = _205;
    float _229;
    if (!_209)
    {
        float _213 = in.m_62.x;
        float _215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _217 = _213 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _221 = _219 * _215;
        float _223 = floor(_221);
        float _225 = -_223;
        float _227 = _221 + _225;
        _229 = _227;
        _231 = true;
    }
    else
    {
        _229 = _147;
    }
    _231 = false;
    float _233 = _229;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = _233 + _235;
    float _239 = in.m_64.x;
    float _241 = in.m_64.y;
    bool _243 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_233);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    bool _259 = _233 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _261 = isnan(_233);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    float _271 = -_253;
    float _273 = _271 + 1.0;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    float _279 = 1.0 / _257;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = _269 * _273;
    float _285 = -_269;
    float _287 = _285 + 1.0;
    float _289 = _237 * _279;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_277, _289, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = fma(_293, _289, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _299 = _295 * _283;
    float _301 = _297 * _283;
    float _303 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _305 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _307 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].x, _303);
    float _309 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[144].y, _305);
    float _311 = _307 * _239;
    float _313 = _309 * _241;
    bool _315 = !_281;
    float _333;
    if (!_315)
    {
        float _317 = in.m_62.x;
        float _319 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _321 = _317 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _325 = _323 * _319;
        float _327 = floor(_325);
        float _329 = -_327;
        float _331 = _325 + _329;
        _333 = _331;
        _335 = true;
    }
    else
    {
        _333 = _147;
    }
    _335 = false;
    float _337 = _333;
    bool _339 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _341 = isnan(_337);
    bool _343 = _339 || _341;
    bool _345 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _347 = _343 || _345;
    float _349 = float(_347);
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _355 = _337 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _357 = isnan(_337);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _373 = _337 + _371;
    float _375 = -_349;
    float _377 = _375 + 1.0;
    bool _379 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _381 = 1.0 / _353;
    float _383 = _365 * _377;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = _369 * _381;
    float _391 = fma(_389, _373, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _393 = _391 * _383;
    float _395 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[115].x, _393);
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _403 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[116].x, _395);
    float _405 = _397 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _407 = _399 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _409 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _403 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    bool _413 = !_379;
    float _431;
    if (!_413)
    {
        float _415 = in.m_62.x;
        float _417 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _419 = _415 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _421 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _423 = _421 * _417;
        float _425 = floor(_423);
        float _427 = -_425;
        float _429 = _423 + _427;
        _431 = _429;
        _433 = true;
    }
    else
    {
        _431 = _147;
    }
    _433 = false;
    float _435 = _431;
    float _437 = in.m_62.x;
    float _439 = in.m_62.y;
    float _441 = in.m_62.z;
    float _443 = in.m_62.w;
    float _445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _449 = _435 + _447;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_68.y;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _463 = _461 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _467 = _465 != 0;
    float _469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _473 = _471 != 0;
    float _475 = 1.0 / _463;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _481 = _443 > 0.5;
    float _483 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _485 = _439 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _487 = _439 + _441;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _491 = _489 != 0;
    int _493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _495 = _493 != 0;
    float _497 = _439 * 2.0;
    float _499 = -_201;
    int _501 = _481 ? as_type<int>(_499) : as_type<int>(_201);
    float _503 = _487 + (-1.0);
    bool _505 = _437 > 0.5;
    float _507 = fma(_485, -2.0, _477);
    float _509 = _439 + _437;
    float _511 = -_191;
    int _513 = _505 ? as_type<int>(_511) : as_type<int>(_191);
    float _515 = floor(_497);
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = _441 * 2.0;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _525 = !_453;
    float _527 = _525 ? _191 : as_type<float>(_513);
    float _529 = _509 + (-1.0);
    bool _531 = _439 > 0.5;
    float _533 = -_523;
    float _535 = fma(_483, 2.0, _533);
    float _537 = floor(_521);
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _541 = -_201;
    int _543 = _531 ? as_type<int>(_541) : as_type<int>(_201);
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _545;
    bool _549 = !_467;
    float _551 = _549 ? _201 : as_type<float>(_501);
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _555 = _437 * 2.0;
    float _557 = _547 * _475;
    float _559 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _561 = !_459;
    float _563 = _561 ? _201 : as_type<float>(_543);
    float _565 = _551 + (-0.5);
    bool _567 = _441 > 0.5;
    float _569 = floor(_555);
    bool _571 = _537 >= 0.0;
    bool _573 = isnan(_537);
    bool _575 = _571 || _573;
    bool _577 = isnan(0.0);
    bool _579 = _575 || _577;
    float _581 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _583 = -_191;
    int _585 = _531 ? as_type<int>(_583) : as_type<int>(_191);
    float _587 = -_201;
    int _589 = _567 ? as_type<int>(_587) : as_type<int>(_201);
    int _591 = _579 ? 0 : 1;
    float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _595 = !_491;
    float _597 = _595 ? _191 : as_type<float>(_585);
    float _599 = -_135;
    float _601 = fma(_599, (*spvDescriptorSet0.vp_c9)._m0[76].x, _535);
    bool _603 = _537 > 0.0;
    float _605 = fma(_557, _449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _607 = _555;
    float _609 = _557;
    if (!_519)
    {
        _607 = _441;
    }
    float _611 = _607;
    float _613 = _597 + 0.5;
    float _615 = _611;
    if (_519)
    {
        _615 = _439;
    }
    float _617 = _615;
    bool _619 = _569 > 0.0;
    float _621 = _613 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _623 = _569 >= 0.0;
    bool _625 = isnan(_569);
    bool _627 = _623 || _625;
    bool _629 = isnan(0.0);
    bool _631 = _627 || _629;
    float _633 = _445 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _635 = !_495;
    float _637 = _635 ? _201 : as_type<float>(_589);
    float _639 = _527 + 0.5;
    float _641 = -_191;
    int _643 = _567 ? as_type<int>(_641) : as_type<int>(_191);
    float _645 = fma(_617, (*spvDescriptorSet0.vp_c9)._m0[83].w, _479);
    int _647 = ~_591;
    int _649 = _647 + 1;
    int _651 = _649 + 1;
    float _653 = fma(_633, _639, _601);
    bool _655 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _657 = isnan(_435);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -_637;
    float _669 = _667 + 0.5;
    bool _671 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _673 = isnan(_435);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    int _683 = _651;
    float _685 = _617;
    if (!_519)
    {
        _609 = _439;
    }
    float _687 = _609;
    float _689 = -_665;
    float _691 = _689 + 1.0;
    bool _693 = !_473;
    float _695 = _693 ? _191 : as_type<float>(_643);
    float _697 = -_681;
    float _699 = _697 + 1.0;
    float _701 = _687;
    if (!_603)
    {
        int _703 = ~_591;
        int _705 = _703 + 1;
        _683 = _705;
    }
    int _707 = _683;
    float _709 = _681 * _691;
    if (_519)
    {
        _701 = _437;
    }
    float _711 = _701;
    float _713 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _507);
    bool _715 = _515 > 0.0;
    float _717 = _605 * _709;
    bool _719 = _515 >= 0.0;
    bool _721 = isnan(_515);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[83].z, _539);
    float _731 = _711 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (!_519)
    {
        _685 = _441;
    }
    float _735 = _685;
    float _737 = fma(_699, (*spvDescriptorSet0.vp_c9)._m0[131].x, _717);
    float _739 = _735;
    if (_519)
    {
        _739 = _439;
    }
    float _741 = _739;
    float _743 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _751 = _749 != 0;
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _755 = _753 != 0;
    float _757 = _469 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _759 = _563 + (-0.5);
    float _761 = -_743;
    float _763 = fma(_731, 2.0, _761);
    float _765 = _741 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _767 = _631 ? 0 : 1;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _771 = -_757;
    float _773 = -_713;
    float _775 = fma(_771, _759, _773);
    float _777 = _669 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _781 = fma(_765, -2.0, _769);
    float _783 = _621 * _553;
    float _785 = in.m_48.x;
    float _787 = in.m_48.y;
    float _789 = in.m_48.z;
    float _791 = _777 * _593;
    float _793 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _781);
    float _795 = _733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _797 = _695 + 0.5;
    float _799 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _801 = log2(_799);
    float _803 = -_135;
    float _805 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[81].x, _763);
    int _807 = ~_767;
    int _809 = _807 + 1;
    int _811 = _809 + 1;
    out.m_70.x = _783;
    out.m_70.y = _791;
    int _813 = _811;
    if (!_619)
    {
        int _815 = ~_767;
        int _817 = _815 + 1;
        _813 = _817;
    }
    int _819 = _813;
    float _821 = fma(_795, _797, _805);
    float _823 = _779 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _827 = -_823;
    float _829 = -_793;
    float _831 = fma(_827, _565, _829);
    int _833 = _727 ? 0 : 1;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _837 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].z, _825);
    float _839 = _801 * _135;
    int _841 = ~_833;
    int _843 = _841 + 1;
    int _845 = _843 + 1;
    float _847 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[78].w, _835);
    float _849 = _787 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _851 = exp2(_839);
    float _853 = _787 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _855 = _845;
    int _857 = _819;
    if (!_715)
    {
        int _859 = ~_833;
        int _861 = _859 + 1;
        _855 = _861;
    }
    int _863 = _855;
    float _865 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[4].x, _849);
    float _867 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _837);
    float _869 = _787 + _455;
    float _871 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[4].z, _865);
    float _873 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[6].x, _853);
    bool _875 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _877 = isnan(1.0);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _883 = _879 || _881;
    float _885 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _887 = _869 + _885;
    float _889 = _871 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _893 = 1.0 + _891;
    float _895 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[6].z, _873);
    bool _897 = !_747;
    int _899 = _897 ? 0 : 1;
    float _901 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _847);
    float _903 = -_851;
    float _905 = _903 + 1.0;
    bool _907 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _909 = isnan(0.0);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _915 = _911 || _913;
    float _917 = _887 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _921 = _889 + _919;
    float _923 = 1.0 / _893;
    float _925 = _895 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _927 = abs(_899);
    float _929 = -_901;
    float _931 = _929 + 1.0;
    float _933 = -_867;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _939 = _925 + _937;
    float _941 = fma(_563, _931, _775);
    bool _943 = !_751;
    int _945 = _943 ? 0 : 1;
    float _947 = -_935;
    float _949 = fma(_527, _947, _653);
    float _951 = _915 ? _905 : 0.0;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _729);
    float _955 = fma(_921, (*spvDescriptorSet0.vp_c8)._m0[28].x, _917);
    float _957 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _645);
    int _959 = abs(_945);
    float _961 = fma(_939, (*spvDescriptorSet0.vp_c8)._m0[28].z, _955);
    float _963 = float(_707);
    float _965 = -_957;
    float _967 = _965 + 1.0;
    float _969 = _887 * _887;
    float _971 = float(_927);
    float _973 = -_953;
    float _975 = _973 + 1.0;
    bool _977 = _961 >= 0.0;
    float _979 = fma(_551, _967, _831);
    float _981 = fma(_921, _921, _969);
    float _983 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[132].x, _737);
    float _985 = -_975;
    float _987 = fma(_695, _985, _821);
    float _989 = _971 * _963;
    float _991 = float(_819);
    float _993 = in.m_72.x;
    float _995 = in.m_72.y;
    float _997 = in.m_72.z;
    float _999 = float(_959);
    float _1001 = fma(_939, _939, _981);
    float _1003 = _989 * (-2.0);
    float _1005 = _969;
    if (_883)
    {
        float _1007 = _951 * _923;
        _157 = _1007;
    }
    float _1009 = _157;
    if (_977)
    {
        _1005 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1011 = _1005;
    float _1013 = _999 * _991;
    out.m_74.x = _949;
    out.m_74.y = _941;
    out.m_74.z = _987;
    out.m_74.w = _979;
    float _1015 = rsqrt(_1001);
    float _1017 = fma(_581, _1003, _581);
    if (_977)
    {
        float _1019 = _1011 * 5.0;
        _857 = as_type<int>(_1019);
    }
    int _1021 = _857;
    float _1023 = _311 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1025 = _1023;
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    if (_977)
    {
        out.m_51.x = 0.0;
    }
    if (_977)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5026 = as_type<float>(_1021);
        out.gl_Position.z = _5026;
    }
    float _1029 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1035 = fma(_1003, _993, _993);
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _437 + (-0.5);
    float _1045 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1047 = _1029 * _1015;
    float _1049 = _983 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1051 = fma(_1043, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1035);
    bool _1053 = !_755;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = _887 * _1047;
    float _1059 = _921 * _1047;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _1061 = -_1057;
    float _1063 = _887 + _1061;
    float _1065 = -_1059;
    float _1067 = _921 + _1065;
    float _1069 = _997;
    if (_977)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1071 = -_1057;
    float _1073 = _869 + _1071;
    float _1075 = _1063 * _1063;
    float _1077 = -_1059;
    float _1079 = _889 + _1077;
    float _1081 = _939 * _1047;
    float _1083 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1085 = _1073 + _1083;
    float _1087 = fma(_1067, _1067, _1075);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1091 = _1079 + _1089;
    int _1093 = abs(_1055);
    float _1095 = _1085 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1097 = -_1081;
    float _1099 = _939 + _1097;
    float _1101 = _439 + (-0.5);
    float _1103 = fma(_1017, _1009, _1051);
    float _1105 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1095);
    float _1107 = _1013 * (-2.0);
    float _1109 = float(_863);
    float _1111 = -_1081;
    float _1113 = _925 + _1111;
    float _1115 = float(_1093);
    float _1117 = fma(_1107, _995, _995);
    float _1119 = fma(_1099, _1099, _1087);
    float _1121 = fma(_559, _1107, _559);
    float _1123 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1125 = _1113 + _1123;
    float _1127 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1117);
    float _1129 = _1115 * _1109;
    float _1131 = _441 + _437;
    float _1133 = fma(_1121, _1009, _1127);
    float _1135 = _1129 * (-2.0);
    float _1137 = _1131 + (-1.0);
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1105);
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = fma(_1135, _997, _997);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1147 = _441 + (-0.5);
    bool _1149 = _1139 >= 0.0;
    float _1151 = _1103 * 0.15915493667125701904296875;
    float _1153 = fma(_1145, _1135, _1145);
    float _1155 = fma(_1147, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1143);
    float _1157 = sqrt(_1119);
    float _1159 = fma(_1153, _1009, _1155);
    float _1161 = _1159 * 0.15915493667125701904296875;
    float _1163 = _1151 * 6.283185482025146484375;
    float _1165 = sin(_1163);
    if (_1149)
    {
        _1069 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1167 = _1069;
    int _1169 = as_type<int>(_1167);
    if (_1149)
    {
        out.m_51.x = 0.0;
    }
    if (_1149)
    {
        float _1171 = _1167 * 5.0;
        _1169 = as_type<int>(_1171);
    }
    int _1173 = _1169;
    float _1175 = _1151 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    if (_1149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5289 = as_type<float>(_1173);
        out.gl_Position.z = _5289;
    }
    float _1179 = _1141 * 6.283185482025146484375;
    float _1181 = sin(_1179);
    float _1183 = _1141 * 6.283185482025146484375;
    float _1185 = cos(_1183);
    float _1187 = _1161 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    if (_1149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1191 = _1161 * 6.283185482025146484375;
    float _1193 = cos(_1191);
    float _1195 = _1015 * _1157;
    bool _1197 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1199 = _1165 * _1181;
    bool _1201 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1203 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1205 = _1203 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1207 = _1177 * _1185;
    float _1209 = _1177 * _1181;
    float _1211 = _1165 * _1185;
    float _1213 = 1.0 / _1205;
    float _1215 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1217 = _1215 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1221 = _1219 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1223 = _1177 * _1193;
    float _1225 = _1185 * _1193;
    float _1227 = _1165 * _1193;
    float _1229 = _1181 * _1193;
    float _1231 = 0.0;
    if (_1197)
    {
        float _1233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1231 = _1233;
    }
    float _1235 = _1231;
    float _1237 = _1023 * _1195;
    float _1239 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1197)
    {
        float _1241 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1025 = _1241;
    }
    float _1243 = _1025;
    float _1245 = fma(_1189, _1207, _1199);
    float _1247 = fma(_1189, _1199, _1207);
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1251 = _1249 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1253 = _1159;
    if (_1201)
    {
        float _1255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1253 = _1255;
    }
    float _1257 = _1253;
    float _1259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _191);
    float _1261 = 0.0;
    if (_1197)
    {
        float _1263 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1261 = _1263;
    }
    float _1265 = _1261;
    float _1267 = -_1209;
    float _1269 = fma(_1189, _1211, _1267);
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1271;
    float _1275 = -_1211;
    float _1277 = fma(_1189, _1209, _1275);
    float _1279 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1285 = 1.0 / _1217;
    float _1287 = _1259 * _1237;
    float _1289 = -_869;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    if (_1201)
    {
        float _1293 = _437 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1027 = _1293;
    }
    float _1295 = _1027;
    float _1297 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _1299 = 1.0 / _1221;
    float _1301 = _1195 * _1279;
    float _1303 = _1283 * _1213;
    float _1305 = -_889;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1309 = _1291 * _1291;
    float _1311 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1313 = _1311 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1319 = 1.0 / _1251;
    float _1321 = _1301;
    if (_1201)
    {
        float _1323 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1239 = _1323;
    }
    float _1325 = _1239;
    float _1327 = _1297 * _1301;
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    if (_1197)
    {
        float _1333 = _1265 * _1235;
        _1321 = _1333;
    }
    float _1335 = _1321;
    float _1337 = -_925;
    float _1339 = _1337 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1341 = fma(_1307, _1307, _1309);
    float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1345 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1343;
    float _1347 = 1.0 / _1313;
    float _1349 = _1257;
    if (_1201)
    {
        float _1351 = _1325 * _1257;
        _1349 = _1351;
    }
    float _1353 = _1349;
    float _1355 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1357 = _1355 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1359 = fma(_1339, _1339, _1341);
    float _1361 = _1273 * _1285;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1371 = 1.0 / _1317;
    float _1373 = _1357 * _1299;
    float _1375 = -_1327;
    float _1377 = _1189 * _1375;
    float _1379 = _1223 * _1327;
    float _1381 = _1227 * _1327;
    float _1383 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1383;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1391 = 1.0 / _1331;
    float _1393 = _1365 * _1319;
    float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1397 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1395;
    float _1399 = fma(_1225, _1287, _1377);
    float _1401 = fma(_1245, _1287, _1379);
    float _1403 = fma(_1269, _1287, _1381);
    float _1405 = 0.0;
    float _1407 = _1369;
    if (_1201)
    {
        float _1409 = floor(_1353);
        _1405 = _1409;
    }
    float _1411 = _1405;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1417 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1419 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1417;
    float _1421 = _1345 * _1347;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1427;
    float _1431 = _1419 * _1371;
    float _1433 = _1325;
    float _1435 = _1419;
    if (_1197)
    {
        float _1437 = floor(_1335);
        _1433 = _1437;
    }
    float _1439 = _1433;
    if (!_1201)
    {
        _1435 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1441 = _1435;
    float _1443 = _1369 * _1391;
    float _1445 = _1441;
    if (!_1197)
    {
        _1407 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1447 = _1407;
    float _1449 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1453 = _787 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1455 = rsqrt(_1359);
    float _1457 = _1447;
    if (_1201)
    {
        float _1459 = -_1411;
        float _1461 = _1353 + _1459;
        _1445 = _1461;
    }
    float _1463 = _1445;
    float _1465 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1467 = _1465 * 0.5;
    float _1469 = fma(_1229, _1467, _1399);
    bool _1471 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1473 = isnan(_1463);
    bool _1475 = _1471 || _1473;
    bool _1477 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1479 = _1475 || _1477;
    float _1481 = float(_1479);
    float _1483 = 1.0 / _1389;
    float _1485 = _1469;
    if (_1197)
    {
        float _1487 = -_1439;
        float _1489 = _1335 + _1487;
        _1457 = _1489;
    }
    float _1491 = _1457;
    bool _1493 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1495 = isnan(_1463);
    bool _1497 = _1493 || _1495;
    bool _1499 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1501 = _1497 || _1499;
    float _1503 = float(_1501);
    float _1505 = -_1481;
    float _1507 = _1505 + 1.0;
    float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1511 = _1491 + _1509;
    float _1513 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1515 = _1491 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1519 = _1491 + _1517;
    float _1521 = 1.0 / _1385;
    float _1523 = _1307 * _1455;
    float _1525 = _1291 * _1455;
    float _1527 = _1339 * _1455;
    float _1529 = fma(_1277, _1467, _1401);
    float _1531 = fma(_1247, _1467, _1403);
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1535 = _1491 + _1533;
    bool _1537 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1539 = isnan(_1491);
    bool _1541 = _1537 || _1539;
    bool _1543 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1545 = _1541 || _1543;
    float _1547 = float(_1545);
    float _1549 = 1.0 / _1397;
    float _1551 = _1511 * _1483;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1555 = _1491 + _1553;
    float _1557 = 1.0 / _1415;
    float _1559 = _1515 * _1521;
    float _1561 = 1.0 / _1425;
    float _1563 = _1535 * _1549;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1567 = _1463 + _1565;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1571 = _1491 + _1569;
    float _1573 = fma(_1303, _1567, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1577 = _1463 + _1575;
    float _1579 = 1.0 / _1429;
    float _1581 = _1555 * _1557;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1585 = _1463 + _1583;
    float _1587 = fma(_1421, _1577, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1589 = fma(_1361, _1585, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1593 = _1463 + _1591;
    float _1595 = 1.0 / _1451;
    float _1597 = _1519 * _1561;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1601 = _1463 + _1599;
    float _1603 = fma(_1443, _1593, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1607 = _1463 + _1605;
    float _1609 = fma(_1373, _1601, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    bool _1611 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1613 = isnan(_1463);
    bool _1615 = _1611 || _1613;
    bool _1617 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1619 = _1615 || _1617;
    float _1621 = float(_1619);
    float _1623 = _1571 * _1579;
    float _1625 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1627 = _1463 + _1625;
    bool _1629 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1631 = isnan(_1463);
    bool _1633 = _1629 || _1631;
    bool _1635 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1637 = _1633 || _1635;
    float _1639 = float(_1637);
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1643 = _1491 + _1641;
    float _1645 = _1621 * _1507;
    float _1647 = fma(_1393, _1627, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    bool _1649 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1651 = isnan(_1463);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = -_1621;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1431, _1607, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1667 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1669 = isnan(_1463);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -_1639;
    float _1681 = _1679 + 1.0;
    float _1683 = -_1659;
    float _1685 = _1683 + 1.0;
    bool _1687 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1689 = isnan(_1491);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1643 * _1595;
    float _1701 = _1503 * _1681;
    float _1703 = _1481 * _1685;
    float _1705 = -_1677;
    float _1707 = _1705 + 1.0;
    float _1709 = -_1697;
    float _1711 = _1709 + 1.0;
    float _1713 = _1639 * _1663;
    float _1715 = _1589 * _1701;
    float _1717 = _1659 * _1707;
    float _1719 = _1547 * _1711;
    float _1721 = -_1547;
    float _1723 = _1721 + 1.0;
    bool _1725 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1727 = isnan(_1463);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1733 = _1729 || _1731;
    float _1735 = float(_1733);
    float _1737 = -_1503;
    float _1739 = _1737 + 1.0;
    bool _1741 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1743 = isnan(_1491);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    bool _1753 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1755 = isnan(_1491);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1715);
    float _1767 = -_1735;
    float _1769 = _1767 + 1.0;
    float _1771 = _1751 * _1723;
    float _1773 = -_1751;
    float _1775 = _1773 + 1.0;
    bool _1777 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1779 = isnan(_1491);
    bool _1781 = _1777 || _1779;
    bool _1783 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1785 = _1781 || _1783;
    float _1787 = float(_1785);
    float _1789 = _1677 * _1769;
    float _1791 = fma(_1573, _1713, _1765);
    float _1793 = -_1763;
    float _1795 = _1793 + 1.0;
    float _1797 = _1763 * _1775;
    bool _1799 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1801 = isnan(_1491);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = _1787 * _1795;
    bool _1813 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1815 = isnan(_1491);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1825;
    bool _1829 = _1491 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1831 = isnan(_1491);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = -_1809;
    float _1843 = _1841 + 1.0;
    float _1845 = -_1787;
    float _1847 = _1845 + 1.0;
    float _1849 = fma(_1827, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1839 * _1843;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1857 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1857;
    float _1861 = _1823 * _1847;
    float _1863 = -_1823;
    float _1865 = _1863 + 1.0;
    float _1867 = -_1839;
    float _1869 = _1867 + 1.0;
    float _1871 = _1849 * _1851;
    bool _1873 = _1463 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1875 = isnan(_1463);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1859, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1887 = fma(_1647, _1645, _1791);
    float _1889 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1891 = _1889 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1893 = _1809 * _1865;
    float _1895 = fma(_1855, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1897 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1871);
    float _1899 = _1885 * _1851;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1901;
    float _1905 = -_1883;
    float _1907 = _1905 + 1.0;
    float _1909 = fma(_1603, _1703, _1887);
    float _1911 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1913 = _1523 * _1911;
    float _1915 = fma(_1895, _1893, _1897);
    float _1917 = fma(_1891, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1919 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1899);
    float _1921 = fma(_1903, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1923 = _1735 * _1907;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1925;
    float _1929 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1931 = _1527 * _1929;
    float _1933 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1935 = -_1913;
    float _1937 = fma(_1527, _1933, _1935);
    float _1939 = fma(_1917, _1893, _1919);
    float _1941 = fma(_1921, _1861, _1915);
    float _1943 = fma(_1927, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1947 = _1945 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1949 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1951 = -_1931;
    float _1953 = fma(_1525, _1949, _1951);
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1957 = _1525 * _1955;
    float _1959 = _1937 * _1937;
    float _1961 = fma(_1943, _1861, _1939);
    float _1963 = fma(_1947, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1967 = -_1957;
    float _1969 = fma(_1523, _1965, _1967);
    float _1971 = fma(_1953, _1953, _1959);
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1977 = fma(_1963, _1811, _1941);
    float _1979 = fma(_1969, _1969, _1971);
    float _1981 = fma(_1975, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1985 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1983;
    float _1987 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1989 = _1987 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1991 = rsqrt(_1979);
    float _1993 = fma(_1985, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1995 = fma(_1981, _1811, _1961);
    float _1997 = fma(_1587, _1717, _1909);
    float _1999 = fma(_1989, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2001 = fma(_1993, _1797, _1977);
    float _2003 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2003;
    float _2007 = fma(_1609, _1789, _1997);
    float _2009 = fma(_1999, _1771, _2001);
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2015 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2015;
    float _2019 = fma(_2005, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2021 = fma(_1665, _1923, _2007);
    float _2023 = fma(_2017, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2025 = _1953 * _1991;
    float _2027 = fma(_2019, _1797, _1995);
    float _2029 = fma(_2013, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2031 = fma(_2023, _1719, _2009);
    float _2033 = _1937 * _1991;
    float _2035 = _1525 * _2025;
    float _2037 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2037;
    float _2041 = fma(_2029, _1771, _2027);
    float _2043 = fma(_1883, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2021);
    float _2045 = _1969 * _1991;
    float _2047 = _1527 * _2033;
    float _2049 = -_2035;
    float _2051 = fma(_1523, _2033, _2049);
    float _2053 = fma(_2039, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2055 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2031);
    float _2057 = -_2047;
    float _2059 = fma(_1525, _2045, _2057);
    float _2061 = _2051 * _1529;
    float _2063 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2065 = _925 + _2063;
    float _2067 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2069 = fma(_2053, _1719, _2041);
    float _2071 = _2059 * _1529;
    float _2073 = fma(_2045, _1469, _2061);
    float _2075 = -_2067;
    float _2077 = fma(_2055, _2065, _2075);
    float _2079 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2081 = _889 + _2079;
    float _2083 = fma(_2025, _1469, _2071);
    float _2085 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2087 = fma(_1527, _1531, _2073);
    float _2089 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2069);
    float _2091 = fma(_1523, _1531, _2083);
    float _2093 = -_2085;
    float _2095 = fma(_2055, _2081, _2093);
    float _2097 = _1523 * _2045;
    float _2099 = fma(_2087, _2089, _2077);
    float _2101 = fma(_785, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1453);
    float _2103 = fma(_2091, _2089, _2095);
    float _2105 = -_2097;
    float _2107 = fma(_1527, _2025, _2105);
    float _2109 = _2099 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2111 = fma(_789, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2101);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2115 = _2107 * _1529;
    float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2119 = _2109 + _2117;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2125 = _2113 + _2123;
    float _2127 = fma(_2033, _1469, _2115);
    float _2129 = _2119 * _2119;
    float _2131 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2133 = _2121 + _2131;
    float _2135 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2137 = fma(_1525, _1531, _2127);
    float _2139 = fma(_2125, _2125, _2129);
    float _2141 = -_2135;
    float _2143 = fma(_2055, _2133, _2141);
    float _2145 = _869 + _2137;
    float _2147 = sqrt(_2139);
    float _2149 = -_2121;
    float _2151 = _2145 + _2149;
    float _2153 = fma(_2089, _2151, _2143);
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _2157 = _2147 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2161 = _2147 + _2159;
    float _2163 = _2129;
    float _2165 = _2133;
    float _2167 = _2139;
    float _2169 = _2127;
    float _2171 = _2113;
    float _2173 = _2109;
    float _2175 = _1529;
    float _2177 = _2125;
    if (_2157)
    {
        float _2179 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2163 = _2179;
    }
    float _2181 = _2163;
    if (_2157)
    {
        float _2183 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2165 = _2183;
    }
    float _2185 = _2165;
    if (_2157)
    {
        float _2187 = rsqrt(_2139);
        _2167 = _2187;
    }
    float _2189 = _2167;
    float _2191 = _2181;
    if (_2157)
    {
        float _2193 = _2161 * _2181;
        _2191 = _2193;
    }
    float _2195 = _2191;
    if (_2157)
    {
        float _2197 = _2195 * 0.15915493667125701904296875;
        _2169 = _2197;
    }
    float _2199 = _2169;
    float _2201 = _789;
    if (_2157)
    {
        float _2203 = _2199 * 6.283185482025146484375;
        float _2205 = sin(_2203);
        _2201 = _2205;
    }
    float _2207 = _2201;
    float _2209 = _2207;
    if (_2157)
    {
        float _2211 = fma(_2207, _2185, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2209 = _2211;
    }
    float _2213 = _2209;
    float _2215 = _2213;
    if (_2157)
    {
        float _2217 = _2189 * _2213;
        _2215 = _2217;
    }
    float _2219 = _2215;
    if (_2157)
    {
        float _2221 = fma(_2125, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2171 = _2221;
    }
    float _2223 = _2171;
    float _2225 = _2223;
    if (_2157)
    {
        float _2227 = fma(_2119, _2219, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2173 = _2227;
    }
    float _2229 = _2173;
    float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2233 = _2223 + _2231;
    float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2237 = _2229 + _2235;
    float _2239 = fma(_2233, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2241 = fma(_2237, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6992 = float2(_2239, _2241);
    float _2243 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6992, float2(0.0), isnan(_6992)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6992, float2(0.0), isnan(_6992)), level(0.0)).x;
    float _2245 = _2199;
    float _2247 = _2233;
    float _2249 = _2229;
    float _2251 = _2241;
    if (_2157)
    {
        float _2253 = _2199 * 6.283185482025146484375;
        float _2255 = cos(_2253);
        _2245 = _2255;
    }
    float _2257 = _2245;
    if (!_2157)
    {
        _2247 = _2155;
    }
    float _2259 = _2247;
    float _2261 = -_889;
    float _2263 = _2261 + _2223;
    float _2265 = _2259;
    if (_2157)
    {
        float _2267 = _2257 + (-1.0);
        _2175 = _2267;
    }
    float _2269 = _2175;
    if (_2157)
    {
        float _2271 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _2271;
    }
    float _2273 = _1485;
    if (_2157)
    {
        float _2275 = fma(_2155, _2257, _2273);
        _2265 = _2275;
    }
    float _2277 = _2265;
    float _2279 = -_925;
    float _2281 = _2279 + _2229;
    float _2283 = -_869;
    float _2285 = _2283 + _2277;
    float _2287 = _2285 * _2285;
    float _2289 = fma(_2263, _2263, _2287);
    float _2291 = fma(_2281, _2281, _2289);
    float _2293 = sqrt(_2291);
    bool _2295 = _2293 > 0.0;
    float _2297 = fma(_2243, 100.0, _2277);
    bool _2299 = !_2295;
    float _2301 = _2297;
    float _2303 = _2291;
    float _2305 = _2285;
    if (!_2299)
    {
        float _2307 = _205 * _205;
        float _2309 = fma(_203, _203, _2307);
        float _2311 = fma(_207, _207, _2309);
        float _2313 = rsqrt(_2291);
        float _2315 = sqrt(_2311);
        float _2317 = _2285 * _2313;
        float _2319 = _2281 * _2313;
        bool _2321 = _2315 > 0.0;
        float _2323 = _2263 * _2313;
        bool _2325 = !_2321;
        _2177 = _2319;
        _2305 = _2317;
        _2251 = _2323;
        if (!_2325)
        {
            float _2327 = rsqrt(_2311);
            float _2329 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2331 = _205 * _2327;
            float _2333 = _203 * _2327;
            float _2335 = _2317 * _2331;
            float _2337 = _207 * _2327;
            float _2339 = fma(_2323, _2333, _2335);
            float _2341 = _2329 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2343 = fma(_2319, _2337, _2339);
            float _2345 = _2343 * _2341;
            float _2347 = fma(_203, _2345, _2223);
            float _2349 = fma(_205, _2345, _2297);
            float _2351 = fma(_207, _2345, _2229);
            _2301 = _2349;
            _2225 = _2347;
            _2249 = _2351;
            _2303 = _2339;
            _2305 = _2341;
        }
    }
    float _2353 = _2301;
    float _2355 = _2225;
    float _2357 = _2249;
    float _2359 = _2303;
    float _2361 = _2177;
    float _2363 = _2305;
    float _2365 = _2251;
    float _2367 = -_1057;
    float _2369 = _2367 + _2353;
    float _2371 = -_1059;
    float _2373 = _2371 + _2355;
    float _2375 = -_1081;
    float _2377 = _2375 + _2357;
    float _2379 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2381 = _2369 + _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2385 = _2373 + _2383;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2389 = _2377 + _2387;
    float _2391 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2393 = _2381 * _2381;
    float _2395 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2391);
    float _2397 = fma(_2385, _2385, _2393);
    float _2399 = fma(_2389, _2389, _2397);
    float _2401 = rsqrt(_2399);
    float _2403 = sqrt(_2399);
    float _2405 = _2401 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2407 = _2385 * _2405;
    float _2409 = _2389 * _2405;
    float _2411 = _2407 * _2407;
    float _2413 = _2409 * _2409;
    float _2415 = _2411 + _2413;
    float _2417 = sqrt(_2415);
    bool _2419 = _2417 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2423 = _2417 + _2421;
    float _2425 = _2359;
    float _2427 = _2415;
    float _2429 = _2423;
    float _2431 = _2361;
    float _2433 = _2365;
    float _2435 = _2355;
    float _2437 = _2407;
    float _2439 = _2409;
    float _2441 = _2411;
    float _2443 = _2413;
    if (_2419)
    {
        float _2445 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2425 = _2445;
    }
    float _2447 = _2425;
    if (_2419)
    {
        float _2449 = rsqrt(_2415);
        _2427 = _2449;
    }
    float _2451 = _2427;
    if (_2419)
    {
        float _2453 = _2423 * _2447;
        _2429 = _2453;
    }
    float _2455 = _2429;
    if (_2419)
    {
        float _2457 = _2455 * 0.15915493667125701904296875;
        _2431 = _2457;
    }
    float _2459 = _2431;
    float _2461 = _2447;
    if (_2419)
    {
        float _2463 = _2459 * 6.283185482025146484375;
        float _2465 = sin(_2463);
        _2461 = _2465;
    }
    float _2467 = _2461;
    float _2469 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2471 = precise::max(0.0, _2469);
    float _2473 = _2363;
    float _2475 = _2471;
    if (_2419)
    {
        float _2477 = _2459 * 6.283185482025146484375;
        float _2479 = cos(_2477);
        _2473 = _2479;
    }
    float _2481 = _2473;
    float _2483 = -_2405;
    float _2485 = -_2471;
    float _2487 = fma(_2381, _2483, _2485);
    if (_2419)
    {
        float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2475 = _2489;
    }
    float _2491 = _2475;
    float _2493 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2497 = _2467;
    if (_2419)
    {
        float _2499 = fma(_2467, _2491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _211 = _2499;
    }
    float _2501 = _211;
    if (!_2419)
    {
        _2497 = _2487;
    }
    float _2503 = _2497;
    float _2505 = floor(_2495);
    float _2507 = _2503;
    if (_2419)
    {
        float _2509 = _2481 + (-1.0);
        _2433 = _2509;
    }
    float _2511 = _2433;
    float _2513 = _2511;
    if (_2419)
    {
        float _2515 = _2451 * _2501;
        _2435 = _2515;
    }
    float _2517 = _2435;
    if (_2419)
    {
        float _2519 = _2511 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2513 = _2519;
    }
    float _2521 = _2513;
    if (_2419)
    {
        float _2523 = _2407 * _2517;
        _2437 = _2523;
    }
    float _2525 = _2437;
    if (_2419)
    {
        float _2527 = _2409 * _2517;
        _2439 = _2527;
    }
    float _2529 = _2439;
    float _2531 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    if (_2419)
    {
        float _2533 = fma(_2487, _2481, _2521);
        _2507 = _2533;
    }
    float _2535 = _2507;
    if (_2419)
    {
        float _2537 = _2525 * _2525;
        _2441 = _2537;
    }
    float _2539 = _2441;
    if (_2419)
    {
        float _2541 = _2529 * _2529;
        _2443 = _2541;
    }
    float _2543 = _2443;
    float _2545 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2531);
    float _2547 = fma(_2535, _2535, _2539);
    float _2549 = fma(_1113, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2551 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2553 = _2547 + _2543;
    float _2555 = _2369 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2557 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2551);
    float _2559 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2561 = fma(_2373, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2555);
    float _2563 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2557);
    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2567 = fma(_2403, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2565);
    float _2569 = precise::clamp(_2567, 0.0, 1.0);
    float _2571 = rsqrt(_2553);
    float _2573 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2561);
    float _2575 = _2563 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2577 = _2545 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2579 = -_2569;
    float _2581 = _2579 + 1.0;
    float _2583 = _2573 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2585 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2587 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2589 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2395);
    float _2591 = floor(_2549);
    float _2593 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2585);
    float _2595 = -_2587;
    float _2597 = fma(_2595, _2559, 1.0);
    float _2599 = _2589 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2601 = -_2505;
    float _2603 = _2495 + _2601;
    float _2605 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2593);
    float _2607 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2609 = _2571 * _2525;
    float _2611 = abs(_2581);
    float _2613 = log2(_2611);
    float _2615 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2617 = _2571 * _2535;
    float _2619 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2621 = _2571 * _2529;
    float _2623 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2625 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2607);
    float _2627 = -_2619;
    float _2629 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2627);
    float _2631 = log2(_2597);
    float _2633 = -_2591;
    float _2635 = _2549 + _2633;
    float _2637 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2623);
    float _2639 = -_2621;
    float _2641 = fma(_2639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2629);
    float _2643 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2625);
    float _2645 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2637);
    float _2647 = fma(_2641, -0.5, 0.5);
    float _2649 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2651 = fma(_2641, 0.5, 0.5);
    float _2653 = 1.0 / _2615;
    float _2655 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2643);
    float _2657 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2645);
    float _2659 = fma(_2651, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2661 = _2631 * 0.693147182464599609375;
    float _2663 = fma(_2651, _2659, -0.212114393711090087890625);
    float _2665 = exp2(_2649);
    float _2667 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2669 = fma(_2651, _2663, 1.570728778839111328125);
    float _2671 = sqrt(_2647);
    float _2673 = _2617 + 1.0;
    float _2675 = _2655 * _2653;
    float2 _7696 = float2(_2603, _2635);
    float _2677 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7696, float2(0.0), isnan(_7696)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7696, float2(0.0), isnan(_7696)), level(0.0)).x;
    float _2679 = fma(_2675, 0.5, 0.5);
    float _2681 = -_2617;
    float _2683 = fma(_2665, _2673, _2681);
    float _2685 = _2657 * _2653;
    float _2687 = fma(_2683, 0.5, 0.5);
    float _2689 = fma(_2685, -0.5, 0.5);
    float _2691 = _2671 * 0.636619746685028076171875;
    float _2693 = -_2669;
    float _2695 = fma(_2691, _2693, 1.0);
    float3 _7728 = float3(_2679, _2689, _2667);
    float _2697 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7728, float3(0.0), isnan(_7728)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7728, float3(0.0), isnan(_7728)), level(0.0)).x;
    float3 _7739 = float3(_2679, _2689, _2667);
    float4 _2700 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7739, float3(0.0), isnan(_7739)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7739, float3(0.0), isnan(_7739)), level(0.0)).xyzw;
    float _2702 = _2700.x;
    float _2704 = _2700.y;
    float _2706 = _2700.z;
    float _2708 = _2700.w;
    float2 _7755 = float2(_2695, _2687);
    float3 _2712 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7755, float2(0.0), isnan(_7755)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7755, float2(0.0), isnan(_7755)), level(0.0)).xyz;
    float _2714 = _2712.x;
    float _2716 = _2712.y;
    float _2718 = _2712.z;
    out.m_76.x = _1039;
    out.m_76.y = _1041;
    out.m_76.z = _1045;
    out.m_76.w = _1049;
    float _2720 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2722 = fma(_2243, 100.0, _869);
    float _2724 = _191 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _2726;
    out.m_66.x = _405;
    out.m_66.y = _407;
    out.m_66.z = _409;
    out.m_66.w = _411;
    float _2730 = -_1057;
    float _2732 = _2730 + _2722;
    float _2734 = fma(_2728, _1559, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _2736 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _2738 = _2736 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2740 = _2734 * _1851;
    float _2742 = fma(_2738, _1551, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _2744;
    float _2748 = fma(_1869, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2740);
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2754;
    float _2758 = fma(_2746, _1563, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _2760 = fma(_2742, _1893, _2748);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2762;
    float _2766 = fma(_2752, _1581, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2772 = fma(_2758, _1861, _2760);
    float _2774 = fma(_2764, _1623, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2776 = _1223 * _2059;
    float _2778 = fma(_2770, _1699, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2780 = fma(_2766, _1811, _2772);
    float _2782 = _1223 * _2107;
    float _2784 = _1245 * _2059;
    float _2786 = -_1189;
    float _2788 = fma(_2786, _2025, _2776);
    float _2790 = _1223 * _2051;
    float _2792 = -_1189;
    float _2794 = fma(_2792, _2033, _2782);
    float _2796 = _1277 * _2059;
    float _2798 = fma(_1225, _2025, _2784);
    float _2800 = fma(_1227, _1523, _2788);
    float _2802 = fma(_1227, _1525, _2794);
    float _2804 = fma(_1229, _2025, _2796);
    float _2806 = fma(_1269, _1523, _2798);
    float _2808 = _2720 * _2800;
    float _2810 = _2720 * _2802;
    float _2812 = fma(_1247, _1523, _2804);
    float _2814 = fma(_2756, _1597, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2816 = fma(_2724, _2806, _2808);
    float _2818 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2820 = _2732 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2822 = _1245 * _2107;
    float _2824 = _2812 + _2816;
    float _2826 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2818);
    float _2828 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2820);
    float _2830 = fma(_2774, _1797, _2780);
    float _2832 = -_1189;
    float _2834 = fma(_2832, _2045, _2790);
    float _2836 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2826);
    float _2838 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2828);
    float _2840 = fma(_1225, _2033, _2822);
    float _2842 = fma(_2778, _1771, _2830);
    float _2844 = _2836 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2848 = fma(_1227, _1527, _2834);
    float _2850 = fma(_1269, _1525, _2840);
    float _2852 = 1.0 / _2844;
    float _2854 = _2846 + _2844;
    float _2856 = fma(_2814, _1719, _2842);
    float _2858 = fma(_2724, _2850, _2810);
    float _2860 = _1245 * _2051;
    float _2862 = fma(_1697, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2856);
    float _2864 = in.m_68.x;
    float _2866 = _1277 * _2107;
    float _2868 = _1277 * _2051;
    out.m_78.x = _2862;
    float _2870 = fma(_1225, _2045, _2860);
    float _2872 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2874 = fma(_1229, _2033, _2866);
    float _2876 = _2854 * _2852;
    float _2878 = _2876 * 0.5;
    bool _2880 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2882 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2884 = _2880 || _2882;
    bool _2886 = isnan(0.5);
    bool _2888 = _2884 || _2886;
    float _2890 = fma(_1229, _2045, _2868);
    float _2892 = fma(_1269, _1527, _2870);
    float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2896 = fma(_2878, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2894);
    float _2898 = _2720 * _2848;
    float _2900 = exp2(_2872);
    float _2902 = fma(_1247, _1525, _2874);
    float _2904 = fma(_1247, _1527, _2890);
    float _2906 = fma(_2724, _2892, _2898);
    float _2908 = _2615 * 0.5;
    float _2910 = _2902 + _2858;
    float _2912 = _2904 + _2906;
    float _2914 = 1.0 / _2896;
    float _2916 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2918 = _2914 * _2916;
    float _2920 = abs(_2918);
    float _2922 = log2(_2920);
    bool _2924 = _2918 <= 8000.0;
    bool _2926 = isnan(_2918);
    bool _2928 = _2924 || _2926;
    bool _2930 = isnan(8000.0);
    bool _2932 = _2928 || _2930;
    float _2934 = float(_2932);
    float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2938 = exp2(_2936);
    float _2940 = fma(_2938, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2942 = precise::clamp(_2940, 0.0, 1.0);
    float _2944 = _2938;
    float _2946 = _2908;
    float _2948 = _2615;
    float _2950 = _2657;
    float _2952 = _2655;
    if (_2888)
    {
        _2944 = 1.0;
    }
    float _2954 = _2944;
    float _2956 = fma(_2942, -2.0, 3.0);
    float _2958 = _2942 * _2942;
    float _2960 = _2575 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2962 = _2958 * _2956;
    float _2964 = fma(_2583, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2960);
    float _2966 = -_2962;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2577, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2964);
    float _2972 = fma(_2968, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2962);
    float _2974 = fma(_2599, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2970);
    float _2976 = _2655 + _2615;
    float _2978 = fma(_2657, -0.5, _2908);
    float _2980 = _2954;
    float _2982 = _2978;
    if (_2888)
    {
        _2946 = 1.0;
    }
    float _2984 = _2946;
    float _2986 = _2974 + _2615;
    float _2988 = _2976 * 0.5;
    float _2990 = _2986 * 0.5;
    float _2992 = _2984;
    float _2994 = _2990;
    if (!_2888)
    {
        float _2996 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2998 = _2996 * 0.15915493667125701904296875;
        float _3000 = _2998 * 6.283185482025146484375;
        float _3002 = cos(_3000);
        float _3004 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3006 = _3004 * 0.15915493667125701904296875;
        float _3008 = _2998 * 6.283185482025146484375;
        float _3010 = sin(_3008);
        float _3012 = 1.0 / _3002;
        float _3014 = _3006 * 6.283185482025146484375;
        float _3016 = cos(_3014);
        float _3018 = _3010 * _3012;
        float _3020 = _3006 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = _3016 * _3018;
        float _3026 = 1.0 / _3024;
        float _3028 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3030 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3028;
        float _3032 = 1.0 / _3030;
        float _3034 = _3022 * _3026;
        float _3036 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3038 = fma(_2918, _3034, _3036);
        float _3040 = _3038 * _3032;
        float _3042 = precise::clamp(_3040, 0.0, 1.0);
        _2992 = _3042;
    }
    float _3044 = _2992;
    if (!_2888)
    {
        float _3046 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = _3048 * 6.283185482025146484375;
        float _3052 = cos(_3050);
        float _3054 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3056 = _3054 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3052;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2918, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2980 = _3096;
    }
    float _3098 = _2980;
    float _3100 = _2934 * _2972;
    float _3102 = -_2900;
    float _3104 = _3102 + 1.0;
    float _3106 = -_2677;
    float _3108 = _3106 + 1.0;
    float _3110 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3112 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2988;
    out.m_80.y = _2978;
    out.m_80.z = _2990;
    out.m_80.w = _2615;
    bool _3114 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3116 = isnan(_2403);
    bool _3118 = _3114 || _3116;
    bool _3120 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3122 = _3118 || _3120;
    float _3124 = _3108 * _3110;
    float _3126 = precise::clamp(_3124, 0.0, 1.0);
    float _3128 = _3112 * _2697;
    out.m_82.x = _2824;
    out.m_82.y = _2910;
    out.m_82.z = _2912;
    float _3130 = -_3126;
    float _3132 = fma(_3130, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3134 = _2708 * _3128;
    float _3136 = _2718 * _3128;
    out.gl_Position.x = _2655;
    out.gl_Position.y = _2657;
    out.gl_Position.z = _2974;
    out.gl_Position.w = _2615;
    float _3138 = _3132 * _2864;
    float _3140 = fma(_2714, _3134, _2702);
    float _3142 = fma(_2716, _3134, _2704);
    float _3144 = fma(_2708, _3136, _2706);
    float _3146 = -_3112;
    float _3148 = _3146 + 1.0;
    float _3150 = _3138 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    if (!_3122)
    {
        _2948 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3154 = _2948;
    float _3156 = _2708 * _3148;
    float _3158 = _3154;
    float _3160 = _3154;
    if (!_3122)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3162 = _2994;
    out.m_84.x = _3150;
    float _3164 = _3162;
    float _3166 = _3162;
    if (!_3122)
    {
        _2982 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3168 = _2982;
    float _3170 = _3044 * _3098;
    out.m_86.x = _3140;
    out.m_86.y = _3142;
    out.m_86.z = _3144;
    out.m_86.w = _3156;
    float _3172 = _3168;
    float _3174 = _3168;
    if (!_3122)
    {
        _2950 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3176 = _2950;
    float _3178 = _3176;
    float _3180 = _3176;
    if (!_3122)
    {
        _2952 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3182 = _2952;
    float _3184 = _3170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3186 = _3182;
    float _3188 = _3182;
    if (!_3122)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3190 = _3152;
    bool _3192 = !_3122;
    float _3194 = _3190;
    float _3196 = _3190;
    if (!_3192)
    {
        bool _3198 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3200 = isnan(_2403);
        bool _3202 = _3198 || _3200;
        bool _3204 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3206 = _3202 || _3204;
        if (!_3206)
        {
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3210 = _2403 + _3208;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3214 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3212;
            float _3216 = 1.0 / _3214;
            float _3218 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3220 = _3218 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3224 = _3222 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3228 = _3226 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3236 = _3234 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3238 = _3210 * _3216;
            float _3240 = precise::clamp(_3238, 0.0, 1.0);
            float _3242 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3244 = _3242 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3246 = fma(_3240, _3220, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3248 = fma(_3240, _3244, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3250 = fma(_3240, _3224, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3252 = fma(_3240, _3228, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3254 = fma(_3240, _3232, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3256 = fma(_3240, _3236, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3188 = _3248;
            _3174 = _3254;
            _3180 = _3246;
            _3166 = _3252;
            _3160 = _3250;
            _3196 = _3256;
            _3258 = true;
        }
        else
        {
            bool _3260 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3262 = isnan(_2403);
            bool _3264 = _3260 || _3262;
            bool _3266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3268 = _3264 || _3266;
            if (!_3268)
            {
                _3178 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3270 = _3178;
            _3180 = _3270;
            if (!_3268)
            {
                _3186 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3272 = _3186;
            _3188 = _3272;
            if (!_3268)
            {
                _3158 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3274 = _3158;
            _3160 = _3274;
            if (!_3268)
            {
                _3164 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3276 = _3164;
            _3166 = _3276;
            if (!_3268)
            {
                _3172 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3278 = _3172;
            _3174 = _3278;
            if (!_3268)
            {
                _3194 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3280 = _3194;
            bool _3282 = !_3268;
            _3196 = _3280;
            if (!_3282)
            {
                bool _3284 = _2403 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3286 = isnan(_2403);
                bool _3288 = _3284 || _3286;
                bool _3290 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3292 = _3288 || _3290;
                if (!_3292)
                {
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3296 = _2403 + _3294;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3300 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3298;
                    float _3302 = 1.0 / _3300;
                    float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3320 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3322 = _3320 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3324 = _3296 * _3302;
                    float _3326 = precise::clamp(_3324, 0.0, 1.0);
                    float _3328 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3330 = _3328 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3332 = fma(_3326, _3306, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3334 = fma(_3326, _3330, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3336 = fma(_3326, _3310, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3338 = fma(_3326, _3314, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3340 = fma(_3326, _3318, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3342 = fma(_3326, _3322, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3188 = _3334;
                    _3174 = _3340;
                    _3180 = _3332;
                    _3166 = _3338;
                    _3160 = _3336;
                    _3196 = _3342;
                    _3258 = true;
                }
                else
                {
                    _3188 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3174 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3180 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3166 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3160 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3196 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3258 = false;
    float _3344 = _3188;
    float _3346 = _3174;
    float _3348 = _3180;
    float _3350 = _3166;
    float _3352 = _3160;
    float _3354 = _3196;
    float _3356 = fma(_2910, -0.5, 0.5);
    float _3358 = precise::clamp(_3356, 0.0, 1.0);
    float _3360 = -_3344;
    float _3362 = _3360 + _3346;
    float _3364 = -_3348;
    float _3366 = _3364 + _3350;
    out.m_88.x = 0.0;
    float _3368 = fma(_3358, _3362, _3344);
    float _3370 = -_3352;
    float _3372 = _3370 + _3354;
    float _3374 = fma(_3358, _3366, _3348);
    float _3376 = _3368 * 0.586610972881317138671875;
    bool _3378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3380 = fma(_3358, _3372, _3352);
    float _3382 = _3184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3384 = fma(_3374, 0.298911988735198974609375, _3376);
    bool _3386 = _3044 > 0.0;
    bool _3388 = isnan(_3044);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.0);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3380, 0.114477999508380889892578125, _3384);
    out.m_51.x = _3382;
    bool _3398 = _3098 <= 0.0;
    bool _3400 = !_3394;
    bool _3402 = _3398 || _3400;
    float _3404 = -_3396;
    float _3406 = _3374 + _3404;
    float _3408 = -_3396;
    float _3410 = _3368 + _3408;
    float _3412 = -_3396;
    float _3414 = _3380 + _3412;
    float _3416 = fma(_3406, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3418 = fma(_3410, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    float _3420 = fma(_3414, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3396);
    bool _3422 = !_3378;
    if (!_3422)
    {
        float _3424 = -_2369;
        float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3428 = -_2373;
        float _3430 = _3428 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3432 = -_2377;
        float _3434 = _3432 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3436 = _3426 * _3426;
        float _3438 = fma(_3430, _3430, _3436);
        float _3440 = fma(_3434, _3434, _3438);
        float _3442 = sqrt(_3440);
        float _3444 = rsqrt(_3440);
        float _3446 = -_3442;
        float _3448 = _3446 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3450 = _3448 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3452 = precise::clamp(_3450, 0.0, 1.0);
        float _3454 = _3430 * _3444;
        float _3456 = _3426 * _3444;
        float _3458 = abs(_3452);
        float _3460 = log2(_3458);
        float _3462 = _3434 * _3444;
        float _3464 = _3454 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3466 = _2910 * _3456;
        float _3468 = -_3456;
        float _3470 = -_3464;
        float _3472 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3470);
        float _3474 = fma(_2824, _3454, _3466);
        float _3476 = -_3462;
        float _3478 = fma(_3476, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3472);
        float _3480 = fma(_2912, _3462, _3474);
        float _3482 = precise::clamp(_3480, 0.0, 1.0);
        float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3486 = _3478 + _3484;
        float _3488 = _3460 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3490 = _3486 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3492 = precise::clamp(_3490, 0.0, 1.0);
        float _3494 = exp2(_3488);
        float _3496 = _3494 * _3492;
        float _3498 = _3482 * _3496;
        float _3500 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3502 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3504 = _3498 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3500;
        out.m_88.y = _3502;
        out.m_88.z = _3504;
    }
    out.m_90.x = _3416;
    out.m_90.y = _3418;
    out.m_90.z = _3420;
    if (!_3402)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3506 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3506;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

