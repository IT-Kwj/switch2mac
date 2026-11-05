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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_72 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_108 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_100 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_86 [[user(locn15)]];
    float4 m_106 [[user(locn16)]];
    float4 m_102 [[user(locn17)]];
    float4 m_104 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_98 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5231 = false;
    bool _4314 = false;
    bool _735 = false;
    bool _561 = false;
    bool _455 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5541 = as_type<float>(_151);
        out.gl_Position.z = _5541;
    }
    if (!_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5604 = as_type<float>(_183);
        out.gl_Position.z = _5604;
    }
    if (_171)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_187, _205, _227);
    float _233 = fma(_191, _197, _225);
    float _235 = fma(_191, _203, _229);
    float _237 = fma(_191, _209, _231);
    bool _239 = !_213;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_219;
    float _265;
    if (!_247)
    {
        float _249 = in.m_68.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        _265 = _177;
    }
    _267 = false;
    float _269 = _265;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _289;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _285;
    float _313 = 1.0 / _293;
    float _315 = _281 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_305;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = _327 * _387;
    float _395 = -_327;
    float _397 = _395 + 1.0;
    float _399 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _389 * _393;
    float _403 = _391 * _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _419 = fma(_407, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_399, _383, _415);
    float _425 = fma(_409, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _177;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _433 * _527;
    float _539 = _431 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _177;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _593 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = isnan(_563);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _571;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    bool _615 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_563);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _603 * _609;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _635 = 1.0 / _587;
    float _637 = _625 * _631;
    float _639 = -_625;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _591;
    float _645 = _613 * _605;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _651 = fma(_645, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _653 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _655 = isnan(_563);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _649 * _635;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _563 + _671;
    float _675 = _651 * _637;
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _563 + _681;
    float _685 = fma(_665, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _689 = _669 * _643;
    float _691 = _583 * _679;
    float _693 = fma(_685, _627, _687);
    float _695 = fma(_689, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_695, _691, _693);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[134].x, _697);
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _713;
    bool _715 = !_633;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _177;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _741 = _737 + _739;
    bool _743 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_737);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _759 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _771;
    bool _775 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _777 = isnan(_737);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_753;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _757;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _799 = 1.0 / _795;
    float _801 = _773 * _791;
    float _803 = _769 * _789;
    float _805 = -_769;
    float _807 = _805 + 1.0;
    bool _809 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_737);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_785;
    float _823 = _821 + 1.0;
    float _825 = fma(_801, _741, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _827 = _785 * _807;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = _819 * _823;
    float _843 = -_819;
    float _845 = _843 + 1.0;
    bool _847 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _849 = isnan(_737);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _863 = _839 * _845;
    float _865 = -_839;
    float _867 = _865 + 1.0;
    bool _869 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _871 = isnan(_737);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _891 = _857 * _867;
    float _893 = _879 * _883;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _899 = -_879;
    float _901 = _899 + 1.0;
    float _903 = _825 * _893;
    float _905 = 1.0 / _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _911;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[159].x, _903);
    float _917 = _909 * _799;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = 1.0 / _897;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = _737 + _925;
    float _929 = _913 * _885;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _935 = fma(_917, _927, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _737 + _937;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _947 = fma(_929, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _949 = fma(_935, _891, _915);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _951;
    float _955 = _945 * _905;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _737 + _957;
    float _961 = fma(_947, _863, _949);
    float _963 = 1.0 / _933;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _969 = _953 * _923;
    float _971 = fma(_955, _959, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _737 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _977;
    float _981 = _967 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _985 = _737 + _983;
    bool _987 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_737);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _841, _961);
    float _1001 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1003 = fma(_969, _985, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = _737 + _1005;
    float _1009 = -_997;
    float _1011 = _1009 + 1.0;
    float _1013 = _979 * _963;
    float _1015 = fma(_1003, _827, _999);
    float _1017 = _753 * _1011;
    float _1019 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1021 = fma(_1001, _803, _1015);
    float _1023 = fma(_1019, _1017, _1021);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1023);
    out.m_76.x = _1025;
    bool _1027 = !_797;
    float _1029 = _963;
    float _1031 = _841;
    if (!_1027)
    {
        float _1033 = in.m_68.x;
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1041 = _1039 * _1035;
        float _1043 = floor(_1041);
        float _1045 = -_1043;
        float _1047 = _1041 + _1045;
        _179 = _1047;
    }
    float _1049 = _179;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1053 = int(_1051);
    float _1055 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1057 = int(_1055);
    float _1059 = float(_1053);
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1063 = int(_1061);
    float _1065 = float(_1057);
    float _1067 = 1.0 / _1059;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1071 = int(_1069);
    float _1073 = float(uint(_1063));
    float _1075 = 1.0 / _1065;
    float _1077 = _1067 * _133;
    float _1079 = 1.0 / _1073;
    float _1081 = float(uint(_1071));
    int _1083 = ~_1071;
    int _1085 = _1083 + 1;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = trunc(_1077);
    int _1093 = int(_1091);
    float _1095 = _1075 * _133;
    float _1097 = 1.0 / _1081;
    int _1099 = as_type<int>(_1079) + (-2);
    int _1101 = ~_1063;
    int _1103 = _1101 + 1;
    float _1105 = 0.0;
    if (_1089)
    {
        _1105 = 1.0;
    }
    float _1107 = _1105;
    float _1109 = trunc(_1095);
    int _1111 = int(_1109);
    float _1113 = float(uint(_1093));
    float _1115 = as_type<float>(_1099) * _1113;
    int _1117 = as_type<int>(_1097) + (-2);
    float _1119 = trunc(_1115);
    float _1121 = precise::max(_1119, 0.0);
    uint _1124 = uint(_1121);
    float _1126 = float(uint(_1111));
    float _1128 = as_type<float>(_1117) * _1126;
    float _1130 = _1126;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1134 = as_type<int>(_1128);
    float _1136 = _1107;
    if (_1089)
    {
        float _1138 = in.m_68.x;
        float _1140 = in.m_68.y;
        _1130 = _1138;
        _1132 = _1140;
    }
    float _1142 = _1130;
    float _1144 = _1132;
    float _1146 = trunc(_1128);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = _1103 * int(_1124);
    int _1154 = _1152 + _1093;
    float _1156 = float(uint(_1154));
    float _1158 = as_type<float>(_1154);
    if (_1089)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    float _1162 = _1160;
    if (_1089)
    {
        _1134 = 0;
    }
    int _1164 = _1134;
    float _1166 = as_type<float>(_1099) * _1156;
    float _1168 = trunc(_1166);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1085 * int(_1150);
    int _1176 = _1174 + _1111;
    float _1178 = float(uint(_1176));
    float _1180 = 0.0;
    int _1182 = as_type<int>(_1178);
    float _1184 = _1166;
    float _1186 = _1142;
    float _1188 = _1144;
    int _1190 = _1164;
    if (_1089)
    {
        _1180 = _1142;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1089)
    {
        _1029 = _1144;
    }
    float _1196 = _1029;
    float _1198 = as_type<float>(_1117) * _1178;
    float _1200 = _1196;
    if (_1089)
    {
        _1182 = 0;
    }
    int _1202 = _1182;
    int _1204 = _1202;
    if (_1089)
    {
        _1031 = _1192;
    }
    float _1206 = _1031;
    float _1208 = trunc(_1198);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1206;
    if (_1089)
    {
        _1184 = _1192;
    }
    float _1216 = _1184;
    float _1218 = _1216;
    if (!_1089)
    {
        float _1220 = in.m_68.x;
        float _1222 = in.m_68.y;
        float _1224 = in.m_68.z;
        float _1226 = _1220 * 3.1415927410125732421875;
        float _1228 = _1226 * 0.15915493667125701904296875;
        float _1230 = _1222 * 3.1415927410125732421875;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1228 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1136 = 7.345489978790283203125;
        _1186 = _1220;
        _1162 = 5.839270114898681640625;
        _1218 = _1224;
        _1194 = _1222;
        _1188 = _1222;
        _1200 = _1240;
        _1214 = _1236;
        _1204 = 1;
        _1190 = 2;
    }
    float _1242 = _1136;
    float _1244 = _1186;
    float _1246 = _1162;
    float _1248 = _1218;
    float _1250 = _1194;
    float _1252 = _1188;
    float _1254 = _1200;
    float _1256 = _1214;
    int _1258 = _1204;
    int _1260 = _1190;
    float _1262 = _1242 * _1244;
    int _1264 = int(_1124) + int(_1172);
    float _1266 = _1246 * _1248;
    int _1268 = ~_1063;
    int _1270 = _1268 + 1;
    float _1272 = floor(_1262);
    int _1274 = int(_1150) + int(_1212);
    float _1276 = in.m_68.z;
    float _1278 = in.m_68.w;
    float _1280 = _173 * _133;
    int _1282 = ~_1071;
    int _1284 = _1282 + 1;
    float _1286 = _1242 * _1250;
    float _1288 = float(_1063);
    float _1290 = floor(_1266);
    int _1292 = _1270 * _1264;
    int _1294 = _1292 + _1093;
    int _1296 = _1284 * _1274;
    int _1298 = _1296 + _1111;
    float _1300 = _1252 * 2.0;
    bool _1302 = uint(_1294) >= uint(_1063);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1306 = _1049 + _1304;
    float _1308 = -_1272;
    float _1310 = _1262 + _1308;
    bool _1312 = uint(_1298) >= uint(_1071);
    float _1314 = floor(_1286);
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1264;
    int _1326 = _1324 + _1318;
    int _1328 = _1326 + 1;
    float _1330 = -_1290;
    float _1332 = _1266 + _1330;
    float _1334 = _1310 * _1288;
    bool _1336 = !_1312;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1342 = log2(_1340);
    bool _1344 = !_1322;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = _1063 * _1328;
    int _1350 = _1348 + _1093;
    bool _1352 = _1276 > 0.5;
    bool _1354 = _1252 > 0.5;
    float _1356 = float(_1093);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = ~_1274;
    int _1364 = _1362 + _1338;
    int _1366 = _1364 + 1;
    float _1368 = -_1314;
    float _1370 = _1286 + _1368;
    int _1372 = abs(_1346);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1384 = _1382 != 0;
    int _1386 = _1071 * _1366;
    int _1388 = _1386 + _1111;
    float _1390 = -_245;
    int _1392 = _1352 ? as_type<int>(_1390) : as_type<int>(_245);
    float _1394 = floor(_1300);
    float _1396 = -_241;
    int _1398 = _1354 ? as_type<int>(_1396) : as_type<int>(_241);
    bool _1400 = _1356 >= _1288;
    bool _1402 = isnan(_1356);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1288);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1288 * _1280;
    bool _1414 = !_1384;
    float _1416 = _1414 ? _245 : as_type<float>(_1392);
    bool _1418 = !_1380;
    float _1420 = _1418 ? _241 : as_type<float>(_1398);
    float _1422 = trunc(_1410);
    int _1424 = int(_1422);
    float _1426 = float(_1071);
    int _1428 = _1360 * _1372;
    int _1430 = _1428 + _1093;
    float _1432 = float(_1111);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1444 = _1442 != 0;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    bool _1454 = _1432 >= _1426;
    bool _1456 = isnan(_1432);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(_1426);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = !_1440;
    int _1468 = _1466 ? 0 : 1;
    bool _1470 = !_1436;
    int _1472 = _1470 ? 0 : 1;
    bool _1474 = !_1444;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1464);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1492 = _1490 != 0;
    bool _1494 = !_1448;
    int _1496 = _1494 ? 0 : 1;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1500 = _1498 != 0;
    bool _1502 = !_1484;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _1063 == 0;
    int _1508 = ~_1424;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    bool _1514 = !_1506;
    int _1516 = _1514 ? _1350 : (-1);
    float _1518 = _1332 * _1426;
    bool _1520 = !_1488;
    int _1522 = _1520 ? 0 : 1;
    int _1524 = _1516 * _1512;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1528 = _1526 != 0;
    float _1530 = _1426 * _1280;
    int _1532 = _1063 + (-1);
    float _1534 = trunc(_1518);
    int _1536 = int(_1534);
    bool _1538 = !_1528;
    int _1540 = _1538 ? 0 : 1;
    bool _1542 = _1071 == 0;
    int _1544 = _1424 * _1532;
    int _1546 = _1544 + _1524;
    int _1548 = ~_1480;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = as_type<float>(_1424);
    float _1556 = as_type<float>(_1480);
    float _1558 = _1250;
    float _1560 = _1254;
    if (_1500)
    {
        float _1562 = in.m_68.w;
        _1554 = _1562;
    }
    float _1564 = _1554;
    bool _1566 = !_1542;
    int _1568 = _1566 ? _1388 : (-1);
    float _1570 = trunc(_1530);
    int _1572 = int(_1570);
    int _1574 = abs(_1468);
    int _1576 = _1071 + (-1);
    int _1578 = _1568 * _1552;
    int _1580 = abs(_1472);
    int _1582 = _1480 * _1576;
    int _1584 = _1582 + _1578;
    int _1586 = abs(_1522);
    int _1588 = abs(_1504);
    int _1590 = _1546 * _1574;
    int _1592 = _1584 * _1586;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    int _1598 = _1452 * _1580;
    int _1600 = _1598 + _1590;
    int _1602 = abs(_1476);
    int _1604 = _1572 * _1588;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1492;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = as_type<float>(_1590);
    float _1614 = as_type<float>(_1602);
    bool _1616 = _1596;
    if (_1500)
    {
        float _1618 = _1564 * 3.1415927410125732421875;
        _1612 = _1618;
    }
    float _1620 = _1612;
    int _1622 = abs(_1496);
    int _1624 = _1430 * _1602;
    int _1626 = _1624 + _1600;
    int _1628 = abs(_1610);
    if (_1500)
    {
        float _1630 = _1620 * 0.15915493667125701904296875;
        _1614 = _1630;
    }
    float _1632 = _1614;
    float _1634 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1636 = abs(_1540);
    bool _1638 = !_1596;
    int _1640 = _1638 ? 0 : 1;
    int _1642 = _1360 * _1622;
    int _1644 = _1642 + _1626;
    int _1646 = abs(_1640);
    int _1648 = _1536 * _1636;
    int _1650 = _1648 + _1111;
    float _1652 = as_type<float>(_1360);
    float _1654 = as_type<float>(_1636);
    if (_1500)
    {
        float _1656 = _1632 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1652 = _1658;
    }
    float _1660 = _1652;
    float _1662 = 0.0;
    if (!_1500)
    {
        _1662 = _241;
    }
    float _1664 = _1662;
    float _1666 = float(uint(_1644));
    int _1668 = _1650 * _1628;
    int _1670 = _1668 + _1606;
    bool _1672 = _1063 == 0;
    float _1674 = as_type<float>(_1099) * _1666;
    int _1676 = ~_1071;
    int _1678 = _1676 + 1;
    int _1680 = _1536 * _1646;
    int _1682 = _1680 + _1670;
    float _1684 = -_241;
    int _1686 = _1352 ? as_type<int>(_1684) : as_type<int>(_241);
    float _1688 = trunc(_1674);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    float _1698 = float(uint(_1682));
    float _1700 = _1664;
    if (_1500)
    {
        bool _1702 = _1660 > 0.5;
        _1616 = _1702;
    }
    bool _1704 = _1616;
    int _1706 = ~_1063;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1117) * _1698;
    if (_1500)
    {
        float _1712 = -_241;
        float _1714 = _1704 ? _1712 : _241;
        _1700 = _1714;
    }
    float _1716 = _1700;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1710);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    bool _1728 = !_1696;
    float _1730 = _1728 ? _241 : as_type<float>(_1686);
    int _1732 = _1708 * int(_1692);
    int _1734 = _1732 + _1644;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1738 = float(uint(_1734));
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = as_type<float>(_1622);
    float _1744 = _1738;
    if (_1720)
    {
        float _1746 = in.m_68.x;
        _1742 = _1746;
    }
    float _1748 = _1742;
    if (!_1720)
    {
        _1556 = _245;
    }
    float _1750 = _1556;
    float _1752 = as_type<float>(_1099) * _1738;
    float _1754 = -_1736;
    float _1756 = fma(_1634, 2.0, _1754);
    int _1758 = _1678 * int(_1726);
    int _1760 = _1758 + _1682;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1764 = trunc(_1752);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = float(uint(_1760));
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1774 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1762);
    float _1776 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1780 = as_type<float>(_1117) * _1770;
    int _1782 = ~_1063;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1772);
    float _1788 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1792 = trunc(_1780);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = fma(_1788, -2.0, _1740);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1802 = int(_1692) + int(_1768);
    float _1804 = _1750;
    if (_1720)
    {
        float _1806 = _1748 * 3.1415927410125732421875;
        _1744 = _1806;
    }
    float _1808 = _1744;
    int _1810 = ~_1071;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1776, -2.0, _1800);
    int _1816 = _1784 * _1802;
    int _1818 = _1816 + _1644;
    float _1820 = _1808;
    if (_1720)
    {
        float _1822 = _1808 * 0.15915493667125701904296875;
        _1820 = _1822;
    }
    float _1824 = _1820;
    int _1826 = ~_1071;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1834 = uint(_1818) >= uint(_1063);
    float _1836 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1786);
    int _1838 = int(_1726) + int(_1796);
    float _1840 = _1824;
    if (_1720)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1814);
    bool _1850 = !_1834;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1774);
    float _1856 = -_245;
    int _1858 = _1354 ? as_type<int>(_1856) : as_type<int>(_245);
    int _1860 = _1812 * _1838;
    int _1862 = _1860 + _1682;
    int _1864 = ~_1802;
    int _1866 = _1864 + _1852;
    int _1868 = _1866 + 1;
    float _1870 = -_133;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1756);
    float _1874 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1798);
    bool _1876 = uint(_1862) >= uint(_1071);
    int _1878 = _1063 * _1868;
    int _1880 = _1878 + _1644;
    bool _1882 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1884 = isnan(_1049);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    bool _1894 = !_1876;
    int _1896 = _1894 ? 0 : (-1);
    bool _1898 = _1876;
    if (_1720)
    {
        bool _1900 = _1846 > 0.5;
        _1898 = _1900;
    }
    bool _1902 = _1898;
    float _1904 = -_1892;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1672;
    int _1910 = _1908 ? _1880 : (-1);
    if (_1720)
    {
        float _1912 = -_245;
        float _1914 = _1902 ? _1912 : _245;
        _1804 = _1914;
    }
    float _1916 = _1804;
    int _1918 = ~_1838;
    int _1920 = _1918 + _1896;
    int _1922 = _1920 + 1;
    int _1924 = _1910 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = _1278 > 0.5;
    int _1930 = _1071 * _1922;
    int _1932 = _1930 + _1682;
    bool _1934 = uint(_1924) > 1u;
    float _1936 = -_245;
    int _1938 = _1928 ? as_type<int>(_1936) : as_type<int>(_245);
    int _1940 = _1910 & 3;
    bool _1942 = _1940 != 0;
    bool _1944 = !_1542;
    int _1946 = _1944 ? _1932 : (-1);
    int _1948 = _1942 ? 0 : 1;
    int _1950 = _1946 & 3;
    bool _1952 = _1950 != 0;
    int _1954 = ~_1948;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1958;
    if (!_1934)
    {
        int _1962 = ~_1948;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = uint(_1950) >= 2u;
    int _1970 = _1946 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1968 ? 0 : 1;
    bool _1976 = _1950 != 3;
    int _1978 = ~_1974;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1972 ? 0 : 1;
    bool _1986 = uint(_1950) > 1u;
    int _1988 = ~_1984;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = int(_1976);
    int _1996 = _1986 ? 2 : 0;
    int _1998 = _1994 | _1996;
    int _2000 = _1952 ? 4 : 0;
    int _2002 = _1998 | _2000;
    int _2004 = _1376 ? 8 : 0;
    int _2006 = _2002 | _2004;
    int _2008 = _1926 ? 16 : 0;
    int _2010 = _2006 | _2008;
    int _2012 = _1542 ? 32 : 0;
    int _2014 = _2010 | _2012;
    int _2016 = _1672 ? 64 : 0;
    int _2018 = _2014 | _2016;
    int _2020 = _2018 & 4;
    int _2022 = int(_1976);
    int _2024 = _1986 ? 2 : 0;
    int _2026 = _2022 | _2024;
    int _2028 = _1952 ? 4 : 0;
    int _2030 = _2026 | _2028;
    int _2032 = _1376 ? 8 : 0;
    int _2034 = _2030 | _2032;
    int _2036 = _1926 ? 16 : 0;
    int _2038 = _2034 | _2036;
    int _2040 = _1542 ? 32 : 0;
    int _2042 = _2038 | _2040;
    int _2044 = _1672 ? 64 : 0;
    int _2046 = _2042 | _2044;
    int _2048 = _2046 & 16;
    int _2050 = _1982;
    int _2052 = _1992;
    if (_1976)
    {
        int _2054 = ~_1974;
        int _2056 = _2054 + 1;
        _2050 = _2056;
    }
    int _2058 = _2050;
    int _2060 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2062 = _2060 != 0;
    float _2064 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2066 = int(_2064);
    bool _2068 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2070 = isnan(_1049);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    bool _2080 = !_2062;
    float _2082 = _2080 ? _245 : as_type<float>(_1858);
    if (!_1986)
    {
        int _2084 = ~_1984;
        int _2086 = _2084 + 1;
        _2052 = _2086;
    }
    int _2088 = _2052;
    float _2090 = _2078 * _1906;
    int _2092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2094 = _2092 != 0;
    float _2096 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2098 = int(_2096);
    bool _2100 = !_1376;
    float _2102 = _2100 ? _245 : as_type<float>(_1938);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    bool _2108 = !_2094;
    int _2110 = _2108 ? 0 : 1;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2118 = _2116 != 0;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2122 = _2120 != 0;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2126 = _2124 != 0;
    float _2128 = float(uint(_2066));
    bool _2130 = !_2114;
    int _2132 = _2130 ? 0 : 1;
    bool _2134 = _1258 != 1;
    float _2136 = 1.0 / _2128;
    float _2138 = float(_2098);
    bool _2140 = !_2118;
    int _2142 = _2140 ? 0 : 1;
    bool _2144 = _1244 > 0.5;
    bool _2146 = !_2122;
    int _2148 = _2146 ? 0 : 1;
    float _2150 = 1.0 / _2138;
    float _2152 = -_241;
    int _2154 = _2144 ? as_type<int>(_2152) : as_type<int>(_241);
    int _2156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2158 = _2156 != 0;
    float _2160 = 1.4012984643248170709237295832899e-45;
    if (!_2134)
    {
        _1654 = _1252;
    }
    float _2162 = _1654;
    float _2164 = 0.0;
    float _2166 = _2162;
    if (!_2134)
    {
        _2164 = _1252;
    }
    float _2168 = _2164;
    float _2170 = _2168;
    if (!_2134)
    {
        _2160 = _1276;
    }
    float _2172 = _2160;
    float _2174 = _2172;
    if (!_2134)
    {
        _1558 = _1276;
    }
    float _2176 = _1558;
    float _2178 = _2176;
    if (_2134)
    {
        _2166 = _1244;
    }
    float _2180 = _2166;
    if (_2134)
    {
        _2170 = _1244;
    }
    float _2182 = _2170;
    float _2184 = _2150 * _133;
    float _2186 = _1244 * 2.0;
    if (_2134)
    {
        _2174 = _1252;
    }
    float _2188 = _2174;
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2134)
    {
        _2178 = _1252;
    }
    float _2192 = _2178;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2196 = trunc(_2184);
    int _2198 = int(_2196);
    bool _2200 = _1260 != 2;
    float _2202 = -_1830;
    float _2204 = fma(_2190, 2.0, _2202);
    int _2206 = as_type<int>(_2136) + (-2);
    float _2208 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1832);
    float _2212 = _1342 * _133;
    float _2214 = float(_2066);
    float _2216 = floor(_2186);
    float _2218 = -_1790;
    float _2220 = fma(_2208, 2.0, _2218);
    int _2222 = ~_2066;
    int _2224 = _2222 + 1;
    float _2226 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2194);
    float _2228 = _1370 * _2214;
    int _2230 = ~_1063;
    int _2232 = _2230 + 1;
    float _2234 = -_133;
    float _2236 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2220);
    if (_2200)
    {
        _1560 = _1252;
    }
    float _2238 = _1560;
    float _2240 = exp2(_2212);
    float _2242 = float(uint(_2198));
    float _2244 = -_133;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2204);
    float _2248 = _2238;
    float _2250 = _2242;
    if (!_2200)
    {
        _2248 = _1244;
    }
    float _2252 = _2248;
    float _2254 = _2214 * _1280;
    bool _2256 = !_2126;
    int _2258 = _2256 ? 0 : 1;
    float _2260 = as_type<float>(_2206) * _2242;
    if (_2200)
    {
        _2250 = _1244;
    }
    float _2262 = _2250;
    float _2264 = trunc(_2228);
    int _2266 = int(_2264);
    float _2268 = _2262;
    if (!_2200)
    {
        _2268 = _1276;
    }
    float _2270 = _2268;
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2274 = _2216 > 0.0;
    bool _2276 = _2216 >= 0.0;
    bool _2278 = isnan(_2216);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2288 = float(uint(_1430));
    float _2290 = trunc(_2260);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    float _2296 = -_2240;
    float _2298 = _2296 + 1.0;
    bool _2300 = _2020 != 0;
    float _2302 = as_type<float>(_1099) * _2288;
    float _2304 = float(uint(_1650));
    float _2306 = trunc(_2254);
    int _2308 = int(_2306);
    int _2310 = abs(_2142);
    float _2312 = as_type<float>(_1117) * _2304;
    int _2314 = abs(_2132);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2318 = _2224 * int(_2294);
    int _2320 = _2318 + _2198;
    float _2322 = trunc(_2312);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2320));
    float _2330 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2332 = trunc(_2302);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = as_type<float>(_2206) * _2328;
    float _2340 = fma(_2330, -2.0, _2316);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = -_2342;
    float _2346 = fma(_2286, 2.0, _2344);
    float _2348 = trunc(_2338);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = _1828 * int(_2326);
    int _2356 = _2354 + _1650;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2360 = -_133;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2346);
    float _2364 = fma(_2272, -2.0, _2358);
    int _2366 = _2232 * int(_2336);
    int _2368 = _2366 + _1430;
    float _2370 = float(uint(_2356));
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2374 = float(uint(_2368));
    float _2376 = as_type<float>(_1117) * _2370;
    int _2378 = abs(_2110);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2382 = int(_2294) + int(_2352);
    float _2384 = as_type<float>(_1099) * _2374;
    bool _2386 = !_2158;
    float _2388 = _2386 ? _241 : as_type<float>(_2154);
    float _2390 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2372);
    bool _2392 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2400 = _2396 || _2398;
    float _2402 = trunc(_2384);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2380);
    float _2410 = _2400 ? _2298 : 0.0;
    int _2412 = _2266 * _2378;
    int _2414 = _2412 + _2198;
    int _2416 = ~_2066;
    int _2418 = _2416 + 1;
    float _2420 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    bool _2422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2424 = isnan(1.0);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2430 = _2426 || _2428;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2434 = 1.0 + _2432;
    float _2436 = float(uint(_2414));
    float _2438 = trunc(_2376);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2408);
    float _2446 = as_type<float>(_2206) * _2436;
    int _2448 = ~_2066;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2454 = int(_2336) + int(_2406);
    float _2456 = 1.0 / _2434;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2460 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2452);
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2464 = _1049 + _2462;
    float _2466 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2458);
    float _2468 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2470 = trunc(_2446);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    int _2478 = int(_2326) + int(_2442);
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2484 = 1.0 / _2482;
    int _2486 = _2418 * int(_2474);
    int _2488 = _2486 + _2414;
    float _2490 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2210);
    float _2492 = float(uint(_2488));
    float _2494 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2340);
    int _2496 = _2450 * _2382;
    int _2498 = _2496 + _2198;
    float _2500 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    if (_2430)
    {
        float _2502 = _2410 * _2456;
        _143 = _2502;
    }
    float _2504 = _143;
    float _2506 = as_type<float>(_2206) * _2492;
    int _2508 = ~_1063;
    int _2510 = _2508 + 1;
    float _2512 = -_2490;
    float _2514 = _2512 + 1.0;
    int _2516 = _2284 ? 0 : 1;
    bool _2518 = uint(_2498) >= uint(_2066);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2510 * _2454;
    int _2534 = _2532 + _1430;
    bool _2536 = !_2518;
    int _2538 = _2536 ? 0 : (-1);
    int _2540 = _2530;
    if (!_2274)
    {
        int _2542 = ~_2516;
        int _2544 = _2542 + 1;
        _2540 = _2544;
    }
    int _2546 = _2540;
    bool _2548 = _1394 > 0.0;
    bool _2550 = _1394 >= 0.0;
    bool _2552 = isnan(_1394);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan(0.0);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2198);
    int _2562 = ~_2066;
    int _2564 = _2562 + 1;
    bool _2566 = uint(_2534) >= uint(_1063);
    int _2568 = int(_2474) + int(_2524);
    bool _2570 = _2560 >= _2214;
    bool _2572 = isnan(_2560);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(_2214);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    int _2582 = ~_1071;
    int _2584 = _2582 + 1;
    float _2586 = trunc(_2580);
    int _2588 = int(_2586);
    int _2590 = _2564 * _2568;
    int _2592 = _2590 + _2414;
    int _2594 = _2558 ? 0 : 1;
    int _2596 = _2584 * _2478;
    int _2598 = _2596 + _1650;
    bool _2600 = !_2566;
    int _2602 = _2600 ? 0 : (-1);
    bool _2604 = uint(_2592) >= uint(_2066);
    bool _2606 = uint(_2598) >= uint(_1071);
    int _2608 = ~_2382;
    int _2610 = _2608 + _2538;
    int _2612 = _2610 + 1;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2616 = _2614 != 0;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2620 = _2618 != 0;
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2624 = _2622 != 0;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    int _2630 = _2066 * _2612;
    int _2632 = _2630 + _2198;
    bool _2634 = _2066 == 0;
    int _2636 = ~_2588;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    bool _2642 = !_2634;
    int _2644 = _2642 ? _2632 : (-1);
    int _2646 = _2066 + (-1);
    int _2648 = ~_2594;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    int _2654 = _2644 * _2640;
    int _2656 = _2652;
    if (!_2548)
    {
        int _2658 = ~_2594;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    bool _2664 = !_2604;
    int _2666 = _2664 ? 0 : (-1);
    int _2668 = _2588 * _2646;
    int _2670 = _2668 + _2654;
    int _2672 = abs(_2148);
    int _2674 = _2670 * _2310;
    int _2676 = abs(_2258);
    int _2678 = _2308 * _2314;
    int _2680 = _2678 + _2674;
    float _2682 = _1276 * 2.0;
    int _2684 = ~_2066;
    int _2686 = _2684 + 1;
    int _2688 = _2414 * _2672;
    int _2690 = _2688 + _2680;
    int _2692 = ~_2066;
    int _2694 = _2692 + 1;
    bool _2696 = !_2620;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = _2266 * _2676;
    int _2702 = _2700 + _2690;
    float _2704 = floor(_2682);
    bool _2706 = _2048 != 0;
    float _2708 = float(uint(_2702));
    bool _2710 = !_2616;
    int _2712 = _2710 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2718 = abs(_2698);
    float _2720 = as_type<float>(_2206) * _2708;
    bool _2722 = !_2624;
    int _2724 = _2722 ? 0 : 1;
    float _2726 = float(_2662);
    float _2728 = trunc(_2720);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    int _2734 = abs(_2724);
    bool _2736 = _2704 >= 0.0;
    bool _2738 = isnan(_2704);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    int _2746 = ~_2454;
    int _2748 = _2746 + _2602;
    int _2750 = _2748 + 1;
    int _2752 = _2744 ? 0 : 1;
    float _2754 = 1.0 / _2716;
    bool _2756 = _2704 > 0.0;
    int _2758 = _1063 * _2750;
    int _2760 = _2758 + _1430;
    int _2762 = ~_2478;
    int _2764 = _2762 + _2628;
    int _2766 = _2764 + 1;
    int _2768 = ~_2568;
    int _2770 = _2768 + _2666;
    int _2772 = _2770 + 1;
    bool _2774 = _1071 == 0;
    int _2776 = _2686 * int(_2732);
    int _2778 = _2776 + _2702;
    int _2780 = _1071 * _2766;
    int _2782 = _2780 + _1650;
    int _2784 = _1946 >> 31;
    int _2786 = _2066 * _2772;
    int _2788 = _2786 + _2414;
    float _2790 = float(uint(_2778));
    int _2792 = _2784 & 3;
    bool _2794 = !_2774;
    int _2796 = _2794 ? _2782 : (-1);
    float _2798 = as_type<float>(_2206) * _2790;
    float _2800 = trunc(_2798);
    float _2802 = precise::max(_2800, 0.0);
    uint _2804 = uint(_2802);
    int _2806 = int(_2732) + int(_2804);
    float _2808 = in.m_48.x;
    float _2810 = in.m_48.y;
    float _2812 = in.m_48.z;
    int _2814 = _2694 * _2806;
    int _2816 = _2814 + _2702;
    int _2818 = ~_2752;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    int _2824 = _2822;
    if (!_2756)
    {
        int _2826 = ~_2752;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = uint(_2816) >= uint(_2066);
    bool _2834 = _1950 != 3;
    bool _2836 = !_2832;
    int _2838 = _2836 ? 0 : (-1);
    bool _2840 = !_2300;
    int _2842 = _2840 ? 0 : 1;
    bool _2844 = !_2834;
    int _2846 = _2844 ? 0 : (-1);
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2850 = _2848 != 0;
    int _2852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2854 = _2852 != 0;
    float _2856 = _201 * _2810;
    float _2858 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _245);
    float _2862 = _195 * _2810;
    float _2864 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2868 = _2866 != 0;
    float _2870 = _2858 * _2860;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2876 = _207 * _2810;
    float _2878 = fma(_193, _2808, _2862);
    float _2880 = 1.0 / _2874;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2890 = _2888 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2892 = fma(_205, _2808, _2876);
    float _2894 = fma(_199, _2808, _2856);
    float _2896 = _2864 * _2886;
    float _2898 = 1.0 / _2884;
    float _2900 = fma(_197, _2812, _2878);
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2904 = _2902 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2906 = fma(_203, _2812, _2894);
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2912 = fma(_209, _2812, _2892);
    float _2914 = 1.0 / _2890;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2916;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2924 = in.m_62.w;
    float _2926 = _2918 * _2484;
    float _2928 = _2922 * _2880;
    float _2930 = 1.0 / _2910;
    bool _2932 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2934 = isnan(_1049);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    float _2944 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2948;
    bool _2952 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2954 = isnan(_1049);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2964;
    float _2968 = _2946 * _2898;
    float _2970 = _2950 * _2754;
    float _2972 = 1.0 / _2904;
    float _2974 = -_2942;
    float _2976 = _2974 + 1.0;
    float _2978 = _2966 * _2914;
    bool _2980 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2982 = isnan(_1049);
    bool _2984 = _2980 || _2982;
    bool _2986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2988 = _2984 || _2986;
    float _2990 = float(_2988);
    float _2992 = -_2962;
    float _2994 = _2992 + 1.0;
    float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2998 = _2996 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _3000 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3002 = isnan(_1049);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3008 = _3004 || _3006;
    float _3010 = float(_3008);
    float _3012 = _2962 * _2976;
    float _3014 = _2990 * _2994;
    float _3016 = -_2990;
    float _3018 = _3016 + 1.0;
    float _3020 = _2998 * _2930;
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3022;
    bool _3026 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3028 = isnan(_1049);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3034 = _3030 || _3032;
    float _3036 = float(_3034);
    float _3038 = -_3010;
    float _3040 = _3038 + 1.0;
    float _3042 = _3010 * _3018;
    float _3044 = _3024 * _2972;
    bool _3046 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3048 = isnan(_1049);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    float _3058 = _3036 * _3040;
    float _3060 = -_3036;
    float _3062 = _3060 + 1.0;
    float _3064 = in.m_64.w;
    float _3066 = fma(_2926, _2464, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3068 = -_3056;
    float _3070 = _3068 + 1.0;
    float _3072 = _3056 * _3062;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3076 = _1049 + _3074;
    float _3078 = in.m_66.w;
    float _3080 = _1892 * _3070;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3084 = _1049 + _3082;
    float _3086 = _3066 * _2090;
    float _3088 = fma(_2970, _3076, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3092 = _1049 + _3090;
    float _3094 = fma(_2928, _3084, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3096 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3086);
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3100 = _1049 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3104 = _1049 + _3102;
    float _3106 = fma(_2968, _3092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3108 = fma(_3094, _3080, _3096);
    float _3110 = fma(_3044, _3104, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3112 = _1244 + _1276;
    float _3114 = fma(_3088, _3072, _3108);
    float _3116 = _1244 + (-0.5);
    float _3118 = _2900 + _2924;
    float _3120 = float(_2830);
    float _3122 = _2906 + _3064;
    float _3124 = _1252 + _1244;
    float _3126 = _1252 + _1276;
    float _3128 = fma(_3106, _3058, _3114);
    int _3130 = abs(_2712);
    float _3132 = _2912 + _3078;
    float _3134 = _3124 + (-1.0);
    float _3136 = in.m_78.x;
    float _3138 = in.m_78.y;
    float _3140 = in.m_78.z;
    float _3142 = _3126 + (-1.0);
    float _3144 = fma(_2978, _3100, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3146 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3148 = _3112 + (-1.0);
    float _3150 = float(_3130);
    float _3152 = fma(_3020, _1306, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3154 = fma(_3142, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3156 = fma(_3144, _3042, _3128);
    float _3158 = _1716 + 0.5;
    float _3160 = _3150 * _3120;
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3164 = fma(_3152, _3014, _3156);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2236);
    float _3168 = _3160 * (-2.0);
    float _3170 = fma(_3110, _3012, _3164);
    float _3172 = float(_2546);
    float _3174 = fma(_3146, _3168, _3146);
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3178 = _1916 + (-0.5);
    float _3180 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3170);
    float _3182 = fma(_3168, _3136, _3136);
    float _3184 = float(_2718);
    float _3186 = _1252 + (-0.5);
    float _3188 = _1276 + (-0.5);
    float _3190 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3182);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3194 = _3184 * _3172;
    float _3196 = fma(_3174, _2504, _3190);
    float _3198 = -_3178;
    float _3200 = -_1848;
    float _3202 = fma(_3198, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3200);
    float _3204 = _3194 * (-2.0);
    float _3206 = float(_2734);
    float _3208 = -_1836;
    float _3210 = _3208 + 1.0;
    float _3212 = -_1854;
    float _3214 = _3212 + 1.0;
    float _3216 = fma(_3204, _3138, _3138);
    float _3218 = fma(_3154, _3204, _3154);
    float _3220 = _3206 * _2726;
    float _3222 = -_3210;
    float _3224 = fma(_3222, _1716, _3166);
    float _3226 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3216);
    float _3228 = fma(_3214, _1916, _3202);
    float _3230 = _3220 * (-2.0);
    float _3232 = _3196 * 0.15915493667125701904296875;
    float _3234 = fma(_3218, _2504, _3226);
    float _3236 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3238 = fma(_3162, _3230, _3162);
    float _3240 = fma(_3230, _3140, _3140);
    out.m_80.x = _3224;
    out.m_80.y = _3228;
    float _3242 = _3234 * 0.15915493667125701904296875;
    float _3244 = _1730 + 0.5;
    float _3246 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3240);
    float _3248 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3250 = _2388 + 0.5;
    float _3252 = _2082 + (-0.5);
    float _3254 = fma(_3238, _2504, _3246);
    float _3256 = _3232 * 6.283185482025146484375;
    float _3258 = sin(_3256);
    float _3260 = fma(_3236, _3244, _2246);
    float _3262 = _2102 + (-0.5);
    float _3264 = _3254 * 0.15915493667125701904296875;
    float _3266 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1872);
    float _3268 = -_3252;
    float _3270 = -_1874;
    float _3272 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3270);
    float _3274 = -_3248;
    float _3276 = -_2494;
    float _3278 = fma(_3274, _3262, _3276);
    float _3280 = -_2468;
    float _3282 = _3280 + 1.0;
    float _3284 = _3242 * 6.283185482025146484375;
    float _3286 = sin(_3284);
    float _3288 = -_2420;
    float _3290 = _3288 + 1.0;
    float _3292 = -_2226;
    float _3294 = _3292 + 1.0;
    float _3296 = -_3282;
    float _3298 = fma(_2388, _3296, _3266);
    float _3300 = fma(_2102, _2514, _3278);
    float _3302 = fma(_2082, _3290, _3272);
    float _3304 = -_3294;
    float _3306 = fma(_1730, _3304, _3260);
    float _3308 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3310 = _3242 * 6.283185482025146484375;
    float _3312 = cos(_3310);
    int _3314 = ~_2806;
    int _3316 = _3314 + _2838;
    int _3318 = _3316 + 1;
    out.m_82.x = _3180;
    out.m_84.x = _3298;
    out.m_84.y = _3302;
    out.m_84.z = _3306;
    out.m_84.w = _3300;
    float _3320 = _3264 * 6.283185482025146484375;
    float _3322 = cos(_3320);
    float _3324 = _3258 * _3286;
    float _3326 = _3232 * 6.283185482025146484375;
    float _3328 = cos(_3326);
    float _3330 = _3258 * _3312;
    int _3332 = _1946 + _2792;
    float _3334 = _3264 * 6.283185482025146484375;
    float _3336 = sin(_3334);
    int _3338 = _3332 >> 2;
    float _3340 = _3258 * _3322;
    int _3342 = _3338 << 4;
    int _3344 = _3342 + 656;
    float _3346 = _3340 * _2870;
    float _3348 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3350 = _3328 * _3312;
    float _3352 = _3328 * _3322;
    float _3354 = _3328 * _3286;
    float _3356 = _3312 * _3322;
    float _3358 = _3286 * _3322;
    float _3360 = _3352 * _2870;
    float _3362 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3364 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3366 = fma(_3336, _3350, _3324);
    float _3368 = fma(_3336, _3324, _3350);
    float _3370 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _3372 = uint(int(uint(_3344) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    float _3388 = -_2870;
    float _3390 = _3336 * _3388;
    float _3392 = -_3354;
    float _3394 = fma(_3336, _3330, _3392);
    float _3396 = -_3336;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3370);
    float _3400 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3402 = fma(_3356, _2896, _3390);
    float _3404 = -_3330;
    float _3406 = fma(_3336, _3354, _3404);
    float _3408 = -_3336;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3362);
    float _3412 = -_3336;
    float _3414 = fma(_3412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3416 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    float _3418 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3420 = _3344 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    float _3438 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3440 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3398);
    float _3442 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3444 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3410);
    float _3446 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3414);
    float _3448 = fma(_3366, _2896, _3360);
    float _3450 = fma(_3394, _2896, _3346);
    float _3452 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3418);
    float _3454 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3438);
    float _3456 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3458 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3442);
    float _3460 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3462 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3464 = fma(_3358, _3348, _3402);
    float _3466 = fma(_3406, _3348, _3448);
    float _3468 = fma(_3368, _3348, _3450);
    int _3470 = abs(_2088);
    float _3472 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3454);
    float _3474 = _3456 * _3444;
    float _3476 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3460);
    float _3478 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3462);
    float _3480 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3416);
    float _3482 = fma(_3308, _3472, _3474);
    int _3484 = ~_3470;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    float _3490 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3458);
    float _3492 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3476);
    float _3494 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3452);
    float _3496 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3478);
    float _3498 = _3456 * _3440;
    int _3500 = abs(_2842);
    out.m_86.x = _3472;
    out.m_86.y = _3480;
    out.m_86.z = _3490;
    float _3502 = _3456 * _3446;
    int _3504 = _2066 * _3318;
    int _3506 = _3504 + _2702;
    int _3508 = ~_3500;
    int _3510 = _3508 + 1;
    int _3512 = _3510 + 1;
    float _3514 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3516 = int(_3514);
    float _3518 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3520 = _3488 * as_type<int>(_3386);
    float _3522 = fma(_3308, _3480, _3498);
    int _3524 = abs(_2846);
    float _3526 = fma(_3308, _3490, _3502);
    int _3528 = _3512 * as_type<int>(_3378);
    int _3530 = _3528 + _3520;
    int _3532 = _1910 >> 31;
    float _3534 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3536 = abs(_2058);
    float _3538 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3540 = _3532 & 3;
    float _3542 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3534);
    int _3544 = ~_3536;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    float _3550 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3538);
    int _3552 = ~_3524;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3542);
    bool _3560 = !_2634;
    float _3562 = _3560 ? as_type<float>(_3506) : as_type<float>(0xffffffffu /* nan */);
    int _3564 = _3548 * as_type<int>(_3428);
    int _3566 = _3564 + _3530;
    int _3568 = _1910 + _3540;
    float _3570 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3550);
    int _3572 = abs(_3516);
    int _3574 = _3556 * as_type<int>(_3436);
    int _3576 = _3574 + _3566;
    float _3578 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3580 = !_2854;
    int _3582 = _3580 ? 0 : 1;
    float _3584 = _3570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3586 = uint(_1924) >= 2u;
    float _3588 = _3118 + _3578;
    int _3590 = as_type<int>(_3562) >> 31;
    float _3592 = _3132 + _3584;
    int _3594 = abs(_3582);
    float _3596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3598 = _3588 + _3596;
    int _3600 = _3590 & 3;
    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3604 = _3592 + _3602;
    float _3606 = float(uint(_3516));
    float _3608 = _3598 * _3598;
    int _3610 = as_type<int>(_3562) + _3600;
    float _3612 = _3604 * _3604;
    int _3614 = _3586 ? 0 : 1;
    float _3616 = 1.0 / _3606;
    int _3618 = _3610 >> 2;
    float _3620 = _3608 + _3612;
    bool _3622 = _1924 != 3;
    float _3624 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3518);
    int _3626 = _3618 << 4;
    int _3628 = _3626 + 800;
    float _3630 = float(uint(_3572));
    float _3632 = sqrt(_3620);
    uint _3634 = uint(int(uint(_3628) >> uint(2)));
    uint _3636 = uint(int(uint(int(_3634)) >> uint(2)));
    int _3638 = int(_3634) & 3;
    float _3640 = (*spvDescriptorSet0.vp_c9)._m0[int(_3636)][_3638];
    int _3642 = int(_3634) + 1;
    uint _3644 = uint(int(uint(_3642) >> uint(2)));
    int _3646 = _3642 & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = ~_3594;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    float _3656 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3624);
    int _3658 = ~_3614;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _3568 >> 2;
    int _3666 = _3576 * _3654;
    float _3668 = 1.0 / _3630;
    int _3670 = _3662;
    float _3672 = _3588;
    float _3674 = as_type<float>(_3576);
    float _3676 = _3562;
    float _3678 = _3592;
    float _3680 = _3118;
    float _3682 = _3526;
    if (_3622)
    {
        int _3684 = ~_3614;
        int _3686 = _3684 + 1;
        _3670 = _3686;
    }
    int _3688 = _3670;
    int _3690 = _2796 * _3594;
    int _3692 = _3690 + _3666;
    int _3694 = _3664 << 4;
    int _3696 = _3694 + 368;
    float _3698 = _3656 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3700 = as_type<int>(_3616) + (-2);
    int _3702 = abs(_3692);
    uint _3704 = uint(int(uint(_3696) >> uint(2)));
    uint _3706 = uint(int(uint(int(_3704)) >> uint(2)));
    int _3708 = int(_3704) & 3;
    float _3710 = (*spvDescriptorSet0.vp_c9)._m0[int(_3706)][_3708];
    int _3712 = int(_3704) + 1;
    uint _3714 = uint(int(uint(_3712) >> uint(2)));
    int _3716 = _3712 & 3;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[int(_3714)][_3716];
    float _3720 = float(uint(_3692));
    float _3722 = _3122 + _3698;
    float _3724 = float(uint(_3702));
    bool _3726 = _3632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3728 = as_type<float>(_3700) * _3720;
    int _3730 = as_type<int>(_3668) + (-2);
    int _3732 = _3696 + 8;
    uint _3734 = uint(int(uint(_3732) >> uint(2)));
    uint _3736 = uint(int(uint(int(_3734)) >> uint(2)));
    int _3738 = int(_3734) & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = int(_3734) + 1;
    uint _3744 = uint(int(uint(_3742) >> uint(2)));
    int _3746 = _3742 & 3;
    float _3748 = (*spvDescriptorSet0.vp_c9)._m0[int(_3744)][_3746];
    int _3750 = as_type<int>(_3562) & 3;
    bool _3752 = _3750 != 0;
    float _3754 = trunc(_3728);
    float _3756 = precise::max(_3754, 0.0);
    uint _3758 = uint(_3756);
    bool _3760 = !_2706;
    int _3762 = _3760 ? 0 : 1;
    int _3764 = _3752 ? 0 : 1;
    int _3766 = as_type<int>(_3562) & 3;
    bool _3768 = _3766 != 0;
    float _3770 = as_type<float>(_3730) * _3724;
    bool _3772 = _1924 != 3;
    float _3774 = _3720;
    if (!_3726)
    {
        _3774 = _3588;
    }
    float _3776 = _3774;
    float _3778 = _3776;
    if (!_3726)
    {
        _3672 = _3592;
    }
    float _3780 = _3672;
    float _3782 = trunc(_3770);
    float _3784 = precise::max(_3782, 0.0);
    uint _3786 = uint(_3784);
    int _3788 = ~_3516;
    int _3790 = _3788 + 1;
    int _3792 = ~_3572;
    int _3794 = _3792 + 1;
    float _3796 = _3780;
    if (!_3726)
    {
        _3674 = _3612;
    }
    float _3798 = _3674;
    float _3800 = _3798;
    if (!_3726)
    {
        _3676 = _3608;
    }
    float _3802 = _3676;
    float _3804 = _3802;
    if (!_3726)
    {
        _3678 = _3722;
    }
    float _3806 = _3678;
    int _3808 = ~_3764;
    int _3810 = _3808 + 1;
    int _3812 = _3810 + 1;
    bool _3814 = uint(_3766) > 1u;
    bool _3816 = !_3726;
    float _3818 = _3806;
    int _3820 = _3812;
    if (!_3816)
    {
        float _3822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3826 = _3632 + _3824;
        float _3828 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = rsqrt(_3620);
        float _3832 = _3826 * _3822;
        float _3834 = _3832 * 0.15915493667125701904296875;
        float _3836 = _3834 * 6.283185482025146484375;
        float _3838 = sin(_3836);
        float _3840 = _3834 * 6.283185482025146484375;
        float _3842 = cos(_3840);
        float _3844 = fma(_3838, _3828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3846 = _3830 * _3844;
        float _3848 = _3842 + (-1.0);
        float _3850 = fma(_3598, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3852 = fma(_3604, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3854 = _3848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3858 = _3850 + _3856;
        float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3862 = _3852 + _3860;
        float _3864 = fma(_3722, _3842, _3854);
        float _3866 = _3858 * _3858;
        float _3868 = _3862 * _3862;
        _3818 = _3864;
        _3804 = _3866;
        _3800 = _3868;
        _3778 = _3850;
        _3796 = _3852;
    }
    float _3870 = _3818;
    float _3872 = _3804;
    float _3874 = _3800;
    float _3876 = _3778;
    float _3878 = _3796;
    int _3880 = _3628 + 8;
    uint _3882 = uint(int(uint(_3880) >> uint(2)));
    uint _3884 = uint(int(uint(int(_3882)) >> uint(2)));
    int _3886 = int(_3882) & 3;
    float _3888 = (*spvDescriptorSet0.vp_c9)._m0[int(_3884)][_3886];
    int _3890 = int(_3882) + 1;
    uint _3892 = uint(int(uint(_3890) >> uint(2)));
    int _3894 = _3890 & 3;
    float _3896 = (*spvDescriptorSet0.vp_c9)._m0[int(_3892)][_3894];
    if (!_3814)
    {
        int _3898 = ~_3764;
        int _3900 = _3898 + 1;
        _3820 = _3900;
    }
    int _3902 = _3820;
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3906 = _3870 + _3904;
    float _3908 = -_2476;
    float _3910 = _3908 + 1.0;
    float _3912 = fma(_3906, _3906, _3872);
    bool _3914 = !_3768;
    int _3916 = _3914 ? 0 : 1;
    int _3918 = _3790 * int(_3758);
    int _3920 = _3918 + _3692;
    int _3922 = abs(_1966);
    int _3924 = _3794 * int(_3786);
    int _3926 = _3924 + _3702;
    int _3928 = abs(_3762);
    float _3930 = -_2444;
    float _3932 = _3930 + 1.0;
    float _3934 = float(uint(_3920));
    float _3936 = float(uint(_3926));
    bool _3938 = _3766 != 3;
    float _3940 = as_type<float>(_3700) * _3934;
    int _3942 = abs(_3916);
    float _3944 = as_type<float>(_3730) * _3936;
    int _3946 = ~_3922;
    int _3948 = _3946 + 1;
    int _3950 = _3948 + 1;
    float _3952 = trunc(_3940);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    bool _3958 = uint(_3766) >= 2u;
    int _3960 = _3950 * as_type<int>(_3718);
    int _3962 = abs(_3688);
    int _3964 = abs(_3902);
    int _3966 = ~_3928;
    int _3968 = _3966 + 1;
    int _3970 = _3968 + 1;
    float _3972 = trunc(_3944);
    float _3974 = precise::max(_3972, 0.0);
    uint _3976 = uint(_3974);
    int _3978 = _3958 ? 0 : 1;
    int _3980 = _3970 * as_type<int>(_3710);
    int _3982 = _3980 + _3960;
    int _3984 = ~_3964;
    int _3986 = _3984 + 1;
    int _3988 = _3986 + 1;
    int _3990 = ~_3978;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = _3988 * as_type<int>(_3648);
    int _3998 = ~_3962;
    int _4000 = _3998 + 1;
    int _4002 = _4000 + 1;
    float _4004 = _3912 + _3874;
    int _4006 = ~_3942;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    int _4012 = _3994;
    float _4014 = _4004;
    if (_3938)
    {
        int _4016 = ~_3978;
        int _4018 = _4016 + 1;
        _4012 = _4018;
    }
    int _4020 = _4012;
    int _4022 = _4002 * as_type<int>(_3740);
    int _4024 = _4022 + _3982;
    bool _4026 = _3766 != 3;
    int _4028 = _4010 * as_type<int>(_3640);
    int _4030 = _4028 + _3996;
    int _4032 = abs(_4020);
    bool _4034 = !_3772;
    int _4036 = _4034 ? 0 : (-1);
    int _4038 = ~_3516;
    int _4040 = _4038 + 1;
    int _4042 = int(_3758) + int(_3956);
    bool _4044 = !_4026;
    int _4046 = _4044 ? 0 : (-1);
    int _4048 = ~_4032;
    int _4050 = _4048 + 1;
    int _4052 = _4050 + 1;
    int _4054 = abs(_4036);
    int _4056 = _4040 * _4042;
    int _4058 = _4056 + _3692;
    int _4060 = abs(_4046);
    int _4062 = _4052 * as_type<int>(_3888);
    int _4064 = _4062 + _4030;
    int _4066 = int(_3786) + int(_3976);
    int _4068 = ~_3572;
    int _4070 = _4068 + 1;
    bool _4072 = uint(_4058) >= uint(_3516);
    int _4074 = _4070 * _4066;
    int _4076 = _4074 + _3702;
    int _4078 = ~_4054;
    int _4080 = _4078 + 1;
    int _4082 = _4080 + 1;
    int _4084 = ~_4060;
    int _4086 = _4084 + 1;
    int _4088 = _4086 + 1;
    bool _4090 = uint(_4076) >= uint(_3572);
    int _4092 = _4082 * as_type<int>(_3748);
    int _4094 = _4092 + _4024;
    bool _4096 = !_4072;
    int _4098 = _4096 ? 0 : (-1);
    int _4100 = _4088 * as_type<int>(_3896);
    int _4102 = _4100 + _4064;
    int _4104 = _3692 ^ _3516;
    float _4106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4108 = !_4090;
    int _4110 = _4108 ? 0 : (-1);
    uint _4112 = uint(int(uint(_4104) >> uint(31)));
    int _4114 = ~_4110;
    int _4116 = _4066 + _4114;
    int _4118 = _4116 + 1;
    bool _4120 = !_2850;
    int _4122 = _4120 ? 0 : 1;
    float _4124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4126 = ~int(_4112);
    int _4128 = _4126 + 1;
    int _4130 = ~_4042;
    int _4132 = _4130 + _4098;
    int _4134 = _4132 + 1;
    bool _4136 = !_2868;
    int _4138 = _4136 ? 0 : 1;
    int _4140 = abs(_4122);
    int _4142 = _3516 * _4134;
    int _4144 = _4142 + _3692;
    int _4146 = _4118 ^ _4128;
    int _4148 = abs(_4138);
    int _4150 = ~_4140;
    int _4152 = _4150 + 1;
    int _4154 = _4152 + 1;
    int _4156 = ~_4128;
    int _4158 = _4156 + _4146;
    int _4160 = _4158 + 1;
    float _4162 = fma(_3456, _3456, 1.0);
    bool _4164 = _3516 == 0;
    int _4166 = _4094 * _4154;
    bool _4168 = _3516 == 0;
    float _4170 = _4124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4172 = ~_4148;
    int _4174 = _4172 + 1;
    int _4176 = _4174 + 1;
    float _4178 = rsqrt(_4162);
    bool _4180 = !_4164;
    int _4182 = _4180 ? _4144 : (-1);
    float _4184 = _1420 + 0.5;
    bool _4186 = !_4168;
    int _4188 = _4186 ? _4160 : (-1);
    int _4190 = _4102 * _4176;
    float _4192 = float(_4182);
    float _4194 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4196 = float(_4188);
    bool _4198 = _1063 == 0;
    float _4200 = _1416 + (-0.5);
    float _4202 = fma(_4170, _4192, _2362);
    float _4204 = -_2500;
    float _4206 = fma(_4194, _4196, _4204);
    bool _4208 = !_4198;
    int _4210 = _4208 ? _2760 : (-1);
    bool _4212 = !_2634;
    int _4214 = _4212 ? _2788 : (-1);
    float _4216 = -_4194;
    float _4218 = fma(_4216, _4200, _4206);
    float _4220 = fma(_4170, _4184, _4202);
    int _4222 = _4210 * _4140;
    int _4224 = _4222 + _4166;
    float _4226 = _3456 * _4178;
    float _4228 = fma(_1416, _3910, _4218);
    int _4230 = _4214 * _4148;
    int _4232 = _4230 + _4190;
    float _4234 = sqrt(_4004);
    float _4236 = -_3494;
    float _4238 = _4226 * _4236;
    float _4240 = -_3496;
    float _4242 = _4226 * _4240;
    float _4244 = -_3492;
    float _4246 = _4226 * _4244;
    float _4248 = -_3932;
    float _4250 = fma(_1420, _4248, _4220);
    float _4252 = fma(_4178, _3440, _4238);
    float _4254 = fma(_4178, _3446, _4242);
    float _4256 = fma(_4178, _3444, _4246);
    float _4258 = _3492 + _3482;
    float _4260 = float(_4224);
    float _4262 = _3494 + _3522;
    float _4264 = float(_4232);
    float _4266 = _3496 + _3526;
    out.m_88.x = _4256;
    out.m_88.y = _4252;
    out.m_88.z = _4254;
    bool _4268 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4270 = isnan(_4234);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4276 = _4272 || _4274;
    out.m_90.x = _4260;
    out.m_90.w = _4264;
    out.m_92.x = _4250;
    out.m_92.y = _4228;
    out.m_94.x = _4258;
    out.m_94.y = _4262;
    out.m_94.z = _4266;
    float _4278 = _4252;
    if (!_4276)
    {
        _4014 = 1.0;
    }
    float _4280 = _4014;
    bool _4282 = !_4276;
    float _4284 = _4280;
    if (!_4282)
    {
        bool _4286 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4288 = isnan(_4234);
        bool _4290 = _4286 || _4288;
        bool _4292 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4294 = _4290 || _4292;
        if (!_4294)
        {
            float _4296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4298 = _4234 + _4296;
            float _4300 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4302 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4300;
            float _4304 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4306 = _4304 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4308 = 1.0 / _4302;
            float _4310 = _4298 * _4308;
            float _4312 = fma(_4310, _4306, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4284 = _4312;
            _4314 = true;
        }
        else
        {
            bool _4316 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4318 = isnan(_4234);
            bool _4320 = _4316 || _4318;
            bool _4322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4324 = _4320 || _4322;
            if (!_4324)
            {
                float _4326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4328 = _4234 + _4326;
                float _4330 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4332 = _4330 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4336 = _4334 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4338 = 1.0 / _4332;
                float _4340 = _4328 * _4338;
                float _4342 = fma(_4340, _4336, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4284 = _4342;
                _4314 = true;
            }
            else
            {
                _4284 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4314 = false;
    float _4344 = _4284;
    float _4346 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4348 = _3870 + _4346;
    float _4350 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4352 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4354 = _3876 + _4352;
    float _4356 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4358 = _3878 + _4356;
    float _4360 = fma(_4348, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4362 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4350);
    float _4364 = fma(_4354, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4366 = fma(_4358, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4368 = -_3122;
    float _4370 = _4368 + _4360;
    float _4372 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4362);
    float _4374 = -_3118;
    float _4376 = _4374 + _4364;
    float _4378 = -_3132;
    float _4380 = _4378 + _4366;
    float _4382 = _4370 * _4370;
    float _4384 = _4372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4386 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4388 = fma(_4376, _4376, _4382);
    float _4390 = 1.0 / _4384;
    float _4392 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4386);
    float _4394 = fma(_4380, _4380, _4388);
    float _4396 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4392);
    float _4398 = sqrt(_4394);
    float _4400 = _4396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4384;
    float _4404 = _4402 * _4390;
    float _4406 = _4404 * 0.5;
    bool _4408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4412 = _4408 || _4410;
    bool _4414 = isnan(0.5);
    bool _4416 = _4412 || _4414;
    bool _4418 = _4398 > 0.0;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4422 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4420);
    float _4424 = 1.0 / _4422;
    bool _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4428 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4430 = _4426 || _4428;
    bool _4432 = isnan(0.5);
    bool _4434 = _4430 || _4432;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4440 = _4390;
    float _4442 = _4422;
    if (!_4418)
    {
        _4436 = _4364;
    }
    float _4444 = _4436;
    float _4446 = _4444;
    if (!_4418)
    {
        _4438 = _4360;
    }
    float _4448 = _4438;
    float _4450 = _4448;
    float _4452 = _4448;
    if (!_4418)
    {
        _4440 = _4366;
    }
    float _4454 = _4440;
    bool _4456 = !_4418;
    float _4458 = _4454;
    float _4460 = _4454;
    if (!_4456)
    {
        float _4462 = _235 * _235;
        float _4464 = rsqrt(_4394);
        float _4466 = fma(_233, _233, _4462);
        float _4468 = fma(_237, _237, _4466);
        float _4470 = sqrt(_4468);
        float _4472 = _4376 * _4464;
        float _4474 = _4370 * _4464;
        float _4476 = _4380 * _4464;
        bool _4478 = _4470 > 0.0;
        float _4480 = _4470;
        _4278 = _4472;
        _4442 = _4464;
        if (!_4478)
        {
            _4480 = _4364;
        }
        float _4482 = _4480;
        _4446 = _4482;
        if (!_4478)
        {
            _4450 = _4360;
        }
        float _4484 = _4450;
        _4452 = _4484;
        if (!_4478)
        {
            _4458 = _4366;
        }
        float _4486 = _4458;
        bool _4488 = !_4478;
        _4460 = _4486;
        if (!_4488)
        {
            float _4490 = rsqrt(_4468);
            float _4492 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4494 = _235 * _4490;
            float _4496 = _233 * _4490;
            float _4498 = _237 * _4490;
            float _4500 = _4474 * _4494;
            float _4502 = fma(_4472, _4496, _4500);
            float _4504 = _4492 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4506 = fma(_4476, _4498, _4502);
            float _4508 = _4506 * _4504;
            float _4510 = fma(_233, _4508, _4364);
            float _4512 = fma(_235, _4508, _4360);
            float _4514 = fma(_237, _4508, _4366);
            _4452 = _4512;
            _4460 = _4514;
            _4446 = _4510;
            _4442 = _4506;
        }
    }
    float _4516 = _4452;
    float _4518 = _4460;
    float _4520 = _4446;
    float _4522 = _4278;
    float _4524 = _4442;
    float _4526 = _4524;
    float _4528 = _4516;
    float _4530 = _4520;
    float _4532 = _4518;
    float _4534 = _4522;
    if (_4434)
    {
        _4526 = 1.0;
    }
    float _4536 = _4526;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4424 * _4538;
    float _4542 = _4536;
    if (!_4416)
    {
        float _4544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4546 = _3122 + _4544;
        float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4550 = _3118 + _4548;
        float _4552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4554 = -_3122;
        float _4556 = _4554 + _4516;
        float _4558 = _4546 * _4546;
        float _4560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4562 = _3132 + _4560;
        float _4564 = fma(_4550, _4550, _4558);
        float _4566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4568 = fma(_4562, _4562, _4564);
        float _4570 = sqrt(_4568);
        float _4572 = _4552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4574 = precise::min(_4570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4576 = _4574 * _4566;
        float _4578 = -_3132;
        float _4580 = _4578 + _4518;
        float _4582 = _4572 * _4576;
        float _4584 = -_3118;
        float _4586 = _4584 + _4520;
        float _4588 = fma(_4556, _4582, _3122);
        float _4590 = fma(_4586, _4582, _3118);
        float _4592 = fma(_4580, _4582, _3132);
        _4528 = _4588;
        _4530 = _4590;
        _4532 = _4592;
    }
    float _4594 = _4528;
    float _4596 = _4530;
    float _4598 = _4532;
    if (!_4434)
    {
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4604 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4602;
        float _4606 = _4600 * 0.15915493667125701904296875;
        float _4608 = _4606 * 6.283185482025146484375;
        float _4610 = cos(_4608);
        float _4612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4614 = _4612 * 0.15915493667125701904296875;
        float _4616 = _4606 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = 1.0 / _4610;
        float _4622 = _4614 * 6.283185482025146484375;
        float _4624 = cos(_4622);
        float _4626 = _4618 * _4620;
        float _4628 = _4614 * 6.283185482025146484375;
        float _4630 = sin(_4628);
        float _4632 = _4624 * _4626;
        float _4634 = 1.0 / _4604;
        float _4636 = 1.0 / _4632;
        float _4638 = _4630 * _4636;
        float _4640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4642 = fma(_4540, _4638, _4640);
        float _4644 = _4642 * _4634;
        float _4646 = precise::clamp(_4644, 0.0, 1.0);
        _4542 = _4646;
    }
    float _4648 = _4542;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4652 = _4594 + _4650;
    float _4654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4656 = _4596 + _4654;
    float _4658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4660 = _4598 + _4658;
    float _4662 = _4652 * _4652;
    float _4664 = fma(_4656, _4656, _4662);
    float _4666 = fma(_4660, _4660, _4664);
    float _4668 = rsqrt(_4666);
    float _4670 = sqrt(_4666);
    float _4672 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4674 = _4656 * _4672;
    float _4676 = _4660 * _4672;
    float _4678 = _4674 * _4674;
    float _4680 = _4676 * _4676;
    float _4682 = _4678 + _4680;
    float _4684 = sqrt(_4682);
    bool _4686 = _4684 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4690 = _4684 + _4688;
    float _4692 = _4668;
    float _4694 = _4682;
    float _4696 = _4690;
    float _4698 = _4652;
    if (_4686)
    {
        float _4700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4692 = _4700;
    }
    float _4702 = _4692;
    if (_4686)
    {
        float _4704 = rsqrt(_4682);
        _4694 = _4704;
    }
    float _4706 = _4694;
    float _4708 = _4706;
    if (_4686)
    {
        float _4710 = _4690 * _4702;
        _4696 = _4710;
    }
    float _4712 = _4696;
    if (_4686)
    {
        float _4714 = _4712 * 0.15915493667125701904296875;
        _4534 = _4714;
    }
    float _4716 = _4534;
    float _4718 = _4660;
    if (_4686)
    {
        float _4720 = _4716 * 6.283185482025146484375;
        float _4722 = sin(_4720);
        _4718 = _4722;
    }
    float _4724 = _4718;
    float _4726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4728 = precise::max(0.0, _4726);
    float _4730 = _4702;
    if (_4686)
    {
        float _4732 = _4716 * 6.283185482025146484375;
        float _4734 = cos(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = -_4672;
    float _4740 = -_4728;
    float _4742 = fma(_4652, _4738, _4740);
    float _4744 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4686)
    {
        float _4746 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4698 = _4746;
    }
    float _4748 = _4698;
    float _4750 = fma(_3118, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4752 = _4748;
    if (!_4686)
    {
        _4744 = _4742;
    }
    float _4754 = _4744;
    float _4756 = _4724;
    float _4758 = _4754;
    if (_4686)
    {
        float _4760 = fma(_4724, _4748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4752 = _4760;
    }
    float _4762 = _4752;
    float _4764 = _4762;
    if (!_4686)
    {
        _4756 = _4674;
    }
    float _4766 = _4756;
    float _4768 = floor(_4750);
    float _4770 = _4766;
    float _4772 = _4736;
    if (_4686)
    {
        float _4774 = _4736 + (-1.0);
        _3680 = _4774;
    }
    float _4776 = _3680;
    float _4778 = _4776;
    if (_4686)
    {
        float _4780 = _4706 * _4762;
        _3682 = _4780;
    }
    float _4782 = _3682;
    if (!_4686)
    {
        _4764 = _4678;
    }
    float _4784 = _4764;
    float _4786 = _4784;
    if (_4686)
    {
        float _4788 = _4776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4788;
    }
    float _4790 = _4708;
    if (_4686)
    {
        float _4792 = _4674 * _4782;
        _4770 = _4792;
    }
    float _4794 = _4770;
    if (!_4686)
    {
        _4778 = _4676;
    }
    float _4796 = _4778;
    float _4798 = _4796;
    if (_4686)
    {
        float _4800 = _4676 * _4782;
        _4798 = _4800;
    }
    float _4802 = _4798;
    if (_4686)
    {
        float _4804 = fma(_4742, _4736, _4790);
        _4758 = _4804;
    }
    float _4806 = _4758;
    if (_4686)
    {
        float _4808 = _4794 * _4794;
        _4786 = _4808;
    }
    float _4810 = _4786;
    if (!_4686)
    {
        _4772 = _4680;
    }
    float _4812 = _4772;
    float _4814 = _4812;
    if (_4686)
    {
        float _4816 = _4802 * _4802;
        _4814 = _4816;
    }
    float _4818 = _4814;
    float _4820 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4822 = fma(_4806, _4806, _4810);
    float _4824 = -_4768;
    float _4826 = _4750 + _4824;
    float _4828 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4820);
    float _4830 = _4822 + _4818;
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4828);
    float _4840 = rsqrt(_4830);
    float _4842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4844 = _4838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4846 = -_4836;
    float _4848 = _4846 + 1.0;
    float _4850 = fma(_3132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4852 = _4844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4856 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = abs(_4848);
    float _4860 = log2(_4858);
    float _4862 = -_4852;
    float _4864 = fma(_4862, _4842, 1.0);
    float _4866 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4868 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4870 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4854);
    float _4872 = _4840 * _4794;
    float _4874 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4866);
    float _4876 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4868);
    float _4878 = _4840 * _4806;
    float _4880 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4882 = _4840 * _4802;
    float _4884 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4888 = -_4880;
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4888);
    float _4892 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4870);
    float _4894 = _4884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4896 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = -_4882;
    float _4900 = fma(_4898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4890);
    float _4902 = floor(_4850);
    float _4904 = _4892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4906 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = fma(_4900, -0.5, 0.5);
    float _4910 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4912 = fma(_4900, 0.5, 0.5);
    float _4914 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4916 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4918 = sqrt(_4908);
    float _4920 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4914);
    float _4922 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4924 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4916);
    float _4926 = fma(_4912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4928 = _4878 + 1.0;
    float _4930 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4922);
    float _4932 = -_4902;
    float _4934 = _4850 + _4932;
    float _4936 = exp2(_4910);
    float _4938 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4940 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4930);
    float _4942 = fma(_4912, _4926, -0.212114393711090087890625);
    float _4944 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4938);
    float _4946 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4940);
    float _4948 = fma(_4912, _4942, 1.570728778839111328125);
    float _4950 = 1.0 / _4920;
    float _4952 = _4918 * 0.636619746685028076171875;
    float _4954 = log2(_4864);
    float _4956 = -_4878;
    float _4958 = fma(_4936, _4928, _4956);
    float _4960 = fma(_4958, 0.5, 0.5);
    float _4962 = _4944 * _4950;
    float _4964 = _4946 * _4950;
    float _4966 = -_4948;
    float _4968 = fma(_4952, _4966, 1.0);
    float2 _12755 = float2(_4826, _4934);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12755, float2(0.0), isnan(_12755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12755, float2(0.0), isnan(_12755)), level(0.0)).x;
    float _4972 = fma(_4962, 0.5, 0.5);
    float _4974 = fma(_4964, -0.5, 0.5);
    float _4976 = _4954 * 0.693147182464599609375;
    float _4978 = _4976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12777 = float3(_4972, _4974, _4978);
    float _4980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12777, float3(0.0), isnan(_12777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12777, float3(0.0), isnan(_12777)), level(0.0)).x;
    float3 _12788 = float3(_4972, _4974, _4978);
    float4 _4983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12788, float3(0.0), isnan(_12788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12788, float3(0.0), isnan(_12788)), level(0.0)).xyzw;
    float _4985 = _4983.x;
    float _4987 = _4983.y;
    float _4989 = _4983.z;
    float _4991 = _4983.w;
    float2 _12804 = float2(_4968, _4960);
    float3 _4995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4997 = _4995.x;
    float _4999 = _4995.y;
    float _5001 = _4995.z;
    float _5003 = abs(_4540);
    float _5005 = log2(_5003);
    out.m_96.x = _4596;
    out.m_96.y = _4594;
    out.m_96.z = _4598;
    bool _5007 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5009 = isnan(_4670);
    bool _5011 = _5007 || _5009;
    bool _5013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5015 = _5011 || _5013;
    float _5017 = _5005 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = exp2(_5017);
    float _5021 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5023 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5021);
    float _5025 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5023);
    float _5027 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5025);
    float _5029 = in.m_98.x;
    float _5031 = fma(_5019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5033 = precise::clamp(_5031, 0.0, 1.0);
    float _5035 = _5027 + _4920;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4946;
    out.gl_Position.z = _5027;
    out.gl_Position.w = _4920;
    float _5037 = fma(_5033, -2.0, 3.0);
    float _5039 = _5033 * _5033;
    float _5041 = _5035 * 0.5;
    float _5043 = _5039 * _5037;
    float _5045 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5047 = _4540 <= 8000.0;
    bool _5049 = isnan(_4540);
    bool _5051 = _5047 || _5049;
    bool _5053 = isnan(8000.0);
    bool _5055 = _5051 || _5053;
    float _5057 = float(_5055);
    float _5059 = _4944 + _4920;
    float _5061 = -_5043;
    float _5063 = _5061 + 1.0;
    float _5065 = exp2(_5045);
    float _5067 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5043);
    float _5069 = _4920 * 0.5;
    float _5071 = _5059 * 0.5;
    float _5073 = _5057 * _5067;
    float _5075 = fma(_4946, -0.5, _5069);
    float _5077 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5079 = _4920;
    float _5081 = _5027;
    float _5083 = _4946;
    float _5085 = _4944;
    if (!_5015)
    {
        _5079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5087 = _5079;
    out.m_100.x = _5071;
    out.m_100.y = _5075;
    out.m_100.z = _5041;
    out.m_100.w = _4920;
    float _5089 = _5087;
    float _5091 = _5087;
    if (!_5015)
    {
        _5081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5081;
    float _5095 = _5093;
    float _5097 = _5093;
    if (!_5015)
    {
        _5083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5099 = _5083;
    float _5101 = -_5065;
    float _5103 = _5101 + 1.0;
    float _5105 = _5099;
    float _5107 = _5099;
    if (!_5015)
    {
        _5085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5109 = _5085;
    float _5111 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5113 = -_4970;
    float _5115 = _5113 + 1.0;
    float _5117 = _5115 * _5077;
    float _5119 = precise::clamp(_5117, 0.0, 1.0);
    float _5121 = -_5119;
    float _5123 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5125 = _5111 * _4980;
    float _5127 = _5123 * _5029;
    float _5129 = -_5111;
    float _5131 = _5129 + 1.0;
    float _5133 = _4991 * _5125;
    float _5135 = _5001 * _5125;
    float _5137 = _4991 * _5131;
    float _5139 = fma(_4997, _5133, _4985);
    float _5141 = fma(_4999, _5133, _4987);
    float _5143 = _5127 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5145 = fma(_4991, _5135, _4989);
    float _5147 = _4648 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5149 = _5127;
    float _5151 = _5133;
    float _5153 = _5109;
    float _5155 = _5109;
    if (!_5015)
    {
        _5149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5157 = _5149;
    out.m_102.x = _5143;
    float _5159 = _5157;
    float _5161 = _5157;
    if (!_5015)
    {
        _5151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5163 = _5151;
    out.m_104.x = _5139;
    out.m_104.y = _5141;
    out.m_104.z = _5145;
    out.m_104.w = _5137;
    bool _5165 = !_5015;
    float _5167 = _5163;
    float _5169 = _5163;
    if (!_5165)
    {
        bool _5171 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5173 = isnan(_4670);
        bool _5175 = _5171 || _5173;
        bool _5177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5179 = _5175 || _5177;
        if (!_5179)
        {
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5183 = _4670 + _5181;
            float _5185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5185;
            float _5189 = 1.0 / _5187;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5205 = _5203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5211 = _5183 * _5189;
            float _5213 = precise::clamp(_5211, 0.0, 1.0);
            float _5215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5217 = _5215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5219 = fma(_5213, _5193, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5221 = fma(_5213, _5217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5223 = fma(_5213, _5197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5225 = fma(_5213, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5227 = fma(_5213, _5205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5229 = fma(_5213, _5209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5221;
            _5155 = _5227;
            _5161 = _5219;
            _5107 = _5225;
            _5097 = _5223;
            _5169 = _5229;
            _5231 = true;
        }
        else
        {
            bool _5233 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5235 = isnan(_4670);
            bool _5237 = _5233 || _5235;
            bool _5239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5241 = _5237 || _5239;
            if (!_5241)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5243 = _5159;
            _5161 = _5243;
            if (!_5241)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5245 = _5089;
            _5091 = _5245;
            if (!_5241)
            {
                _5095 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5247 = _5095;
            _5097 = _5247;
            if (!_5241)
            {
                _5105 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5249 = _5105;
            _5107 = _5249;
            if (!_5241)
            {
                _5153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5251 = _5153;
            _5155 = _5251;
            if (!_5241)
            {
                _5167 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5253 = _5167;
            bool _5255 = !_5241;
            _5169 = _5253;
            if (!_5255)
            {
                bool _5257 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5259 = isnan(_4670);
                bool _5261 = _5257 || _5259;
                bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5265 = _5261 || _5263;
                if (!_5265)
                {
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5269 = _4670 + _5267;
                    float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5271;
                    float _5275 = 1.0 / _5273;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5297 = _5269 * _5275;
                    float _5299 = precise::clamp(_5297, 0.0, 1.0);
                    float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5307;
                    _5155 = _5313;
                    _5161 = _5305;
                    _5107 = _5311;
                    _5097 = _5309;
                    _5169 = _5315;
                    _5231 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5107 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5097 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5169 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5231 = false;
    float _5317 = _5091;
    float _5319 = _5155;
    float _5321 = _5161;
    float _5323 = _5107;
    float _5325 = _5097;
    float _5327 = _5169;
    float _5329 = fma(_4262, -0.5, 0.5);
    float _5331 = precise::clamp(_5329, 0.0, 1.0);
    float _5333 = -_5317;
    float _5335 = _5333 + _5319;
    float _5337 = _5147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5339 = -_5321;
    float _5341 = _5339 + _5323;
    out.m_106.x = 0.0;
    float _5343 = fma(_5331, _5335, _5317);
    float _5345 = fma(_5331, _5341, _5321);
    out.m_55.x = _5337;
    float _5347 = -_5325;
    float _5349 = _5347 + _5327;
    float _5351 = _5343 * 0.586610972881317138671875;
    bool _5353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5355 = fma(_5331, _5349, _5325);
    float _5357 = fma(_5345, 0.298911988735198974609375, _5351);
    bool _5359 = _4648 > 0.0;
    bool _5361 = isnan(_4648);
    bool _5363 = _5359 || _5361;
    bool _5365 = isnan(0.0);
    bool _5367 = _5363 || _5365;
    float _5369 = fma(_5355, 0.114477999508380889892578125, _5357);
    float _5371 = -_5369;
    float _5373 = _5345 + _5371;
    float _5375 = -_5369;
    float _5377 = _5343 + _5375;
    float _5379 = -_5369;
    float _5381 = _5355 + _5379;
    float _5383 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5385 = fma(_5377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5387 = fma(_5381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    bool _5389 = !_5353;
    if (!_5389)
    {
        float _5391 = -_4594;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5395 = -_4596;
        float _5397 = _5395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5399 = -_4598;
        float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5403 = _5393 * _5393;
        float _5405 = fma(_5397, _5397, _5403);
        float _5407 = fma(_5401, _5401, _5405);
        float _5409 = sqrt(_5407);
        float _5411 = rsqrt(_5407);
        float _5413 = -_5409;
        float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5417 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5419 = precise::clamp(_5417, 0.0, 1.0);
        float _5421 = _5397 * _5411;
        float _5423 = _5393 * _5411;
        float _5425 = abs(_5419);
        float _5427 = log2(_5425);
        float _5429 = _5401 * _5411;
        float _5431 = _5421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5433 = _4262 * _5423;
        float _5435 = -_5423;
        float _5437 = -_5431;
        float _5439 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5437);
        float _5441 = fma(_4258, _5421, _5433);
        float _5443 = -_5429;
        float _5445 = fma(_5443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5439);
        float _5447 = fma(_4266, _5429, _5441);
        float _5449 = precise::clamp(_5447, 0.0, 1.0);
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5453 = _5445 + _5451;
        float _5455 = _5427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5457 = _5453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5459 = precise::clamp(_5457, 0.0, 1.0);
        float _5461 = exp2(_5455);
        float _5463 = _5461 * _5459;
        float _5465 = _5449 * _5463;
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5469 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5471 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5467;
        out.m_106.y = _5469;
        out.m_106.z = _5471;
    }
    out.m_108.x = _5383;
    out.m_108.y = _5385;
    out.m_108.z = _5387;
    if (_5367)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5231 = false;
    bool _4314 = false;
    bool _735 = false;
    bool _561 = false;
    bool _455 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5541 = as_type<float>(_151);
        out.gl_Position.z = _5541;
    }
    if (!_137)
    {
        return out;
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5604 = as_type<float>(_183);
        out.gl_Position.z = _5604;
    }
    if (_171)
    {
        return out;
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_187, _205, _227);
    float _233 = fma(_191, _197, _225);
    float _235 = fma(_191, _203, _229);
    float _237 = fma(_191, _209, _231);
    bool _239 = !_213;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_219;
    float _265;
    if (!_247)
    {
        float _249 = in.m_68.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        _265 = _177;
    }
    _267 = false;
    float _269 = _265;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _289;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _285;
    float _313 = 1.0 / _293;
    float _315 = _281 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_305;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = _327 * _387;
    float _395 = -_327;
    float _397 = _395 + 1.0;
    float _399 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _389 * _393;
    float _403 = _391 * _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _419 = fma(_407, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_399, _383, _415);
    float _425 = fma(_409, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _177;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _433 * _527;
    float _539 = _431 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _177;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _593 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = isnan(_563);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _571;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    bool _615 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_563);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _603 * _609;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _635 = 1.0 / _587;
    float _637 = _625 * _631;
    float _639 = -_625;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _591;
    float _645 = _613 * _605;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _651 = fma(_645, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _653 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _655 = isnan(_563);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _649 * _635;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _563 + _671;
    float _675 = _651 * _637;
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _563 + _681;
    float _685 = fma(_665, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _689 = _669 * _643;
    float _691 = _583 * _679;
    float _693 = fma(_685, _627, _687);
    float _695 = fma(_689, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_695, _691, _693);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[134].x, _697);
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _713;
    bool _715 = !_633;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _177;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _741 = _737 + _739;
    bool _743 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_737);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _759 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _771;
    bool _775 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _777 = isnan(_737);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_753;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _757;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _799 = 1.0 / _795;
    float _801 = _773 * _791;
    float _803 = _769 * _789;
    float _805 = -_769;
    float _807 = _805 + 1.0;
    bool _809 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_737);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_785;
    float _823 = _821 + 1.0;
    float _825 = fma(_801, _741, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _827 = _785 * _807;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = _819 * _823;
    float _843 = -_819;
    float _845 = _843 + 1.0;
    bool _847 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _849 = isnan(_737);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _863 = _839 * _845;
    float _865 = -_839;
    float _867 = _865 + 1.0;
    bool _869 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _871 = isnan(_737);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _891 = _857 * _867;
    float _893 = _879 * _883;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _899 = -_879;
    float _901 = _899 + 1.0;
    float _903 = _825 * _893;
    float _905 = 1.0 / _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _911;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[159].x, _903);
    float _917 = _909 * _799;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = 1.0 / _897;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = _737 + _925;
    float _929 = _913 * _885;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _935 = fma(_917, _927, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _737 + _937;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _947 = fma(_929, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _949 = fma(_935, _891, _915);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _951;
    float _955 = _945 * _905;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _737 + _957;
    float _961 = fma(_947, _863, _949);
    float _963 = 1.0 / _933;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _969 = _953 * _923;
    float _971 = fma(_955, _959, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _737 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _977;
    float _981 = _967 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _985 = _737 + _983;
    bool _987 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_737);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _841, _961);
    float _1001 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1003 = fma(_969, _985, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = _737 + _1005;
    float _1009 = -_997;
    float _1011 = _1009 + 1.0;
    float _1013 = _979 * _963;
    float _1015 = fma(_1003, _827, _999);
    float _1017 = _753 * _1011;
    float _1019 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1021 = fma(_1001, _803, _1015);
    float _1023 = fma(_1019, _1017, _1021);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1023);
    out.m_76.x = _1025;
    bool _1027 = !_797;
    float _1029 = _963;
    float _1031 = _841;
    if (!_1027)
    {
        float _1033 = in.m_68.x;
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1041 = _1039 * _1035;
        float _1043 = floor(_1041);
        float _1045 = -_1043;
        float _1047 = _1041 + _1045;
        _179 = _1047;
    }
    float _1049 = _179;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1053 = int(_1051);
    float _1055 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1057 = int(_1055);
    float _1059 = float(_1053);
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1063 = int(_1061);
    float _1065 = float(_1057);
    float _1067 = 1.0 / _1059;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1071 = int(_1069);
    float _1073 = float(uint(_1063));
    float _1075 = 1.0 / _1065;
    float _1077 = _1067 * _133;
    float _1079 = 1.0 / _1073;
    float _1081 = float(uint(_1071));
    int _1083 = ~_1071;
    int _1085 = _1083 + 1;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = trunc(_1077);
    int _1093 = int(_1091);
    float _1095 = _1075 * _133;
    float _1097 = 1.0 / _1081;
    int _1099 = as_type<int>(_1079) + (-2);
    int _1101 = ~_1063;
    int _1103 = _1101 + 1;
    float _1105 = 0.0;
    if (_1089)
    {
        _1105 = 1.0;
    }
    float _1107 = _1105;
    float _1109 = trunc(_1095);
    int _1111 = int(_1109);
    float _1113 = float(uint(_1093));
    float _1115 = as_type<float>(_1099) * _1113;
    int _1117 = as_type<int>(_1097) + (-2);
    float _1119 = trunc(_1115);
    float _1121 = precise::max(_1119, 0.0);
    uint _1124 = uint(_1121);
    float _1126 = float(uint(_1111));
    float _1128 = as_type<float>(_1117) * _1126;
    float _1130 = _1126;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1134 = as_type<int>(_1128);
    float _1136 = _1107;
    if (_1089)
    {
        float _1138 = in.m_68.x;
        float _1140 = in.m_68.y;
        _1130 = _1138;
        _1132 = _1140;
    }
    float _1142 = _1130;
    float _1144 = _1132;
    float _1146 = trunc(_1128);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = _1103 * int(_1124);
    int _1154 = _1152 + _1093;
    float _1156 = float(uint(_1154));
    float _1158 = as_type<float>(_1154);
    if (_1089)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    float _1162 = _1160;
    if (_1089)
    {
        _1134 = 0;
    }
    int _1164 = _1134;
    float _1166 = as_type<float>(_1099) * _1156;
    float _1168 = trunc(_1166);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1085 * int(_1150);
    int _1176 = _1174 + _1111;
    float _1178 = float(uint(_1176));
    float _1180 = 0.0;
    int _1182 = as_type<int>(_1178);
    float _1184 = _1166;
    float _1186 = _1142;
    float _1188 = _1144;
    int _1190 = _1164;
    if (_1089)
    {
        _1180 = _1142;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1089)
    {
        _1029 = _1144;
    }
    float _1196 = _1029;
    float _1198 = as_type<float>(_1117) * _1178;
    float _1200 = _1196;
    if (_1089)
    {
        _1182 = 0;
    }
    int _1202 = _1182;
    int _1204 = _1202;
    if (_1089)
    {
        _1031 = _1192;
    }
    float _1206 = _1031;
    float _1208 = trunc(_1198);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1206;
    if (_1089)
    {
        _1184 = _1192;
    }
    float _1216 = _1184;
    float _1218 = _1216;
    if (!_1089)
    {
        float _1220 = in.m_68.x;
        float _1222 = in.m_68.y;
        float _1224 = in.m_68.z;
        float _1226 = _1220 * 3.1415927410125732421875;
        float _1228 = _1226 * 0.15915493667125701904296875;
        float _1230 = _1222 * 3.1415927410125732421875;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1228 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1136 = 7.345489978790283203125;
        _1186 = _1220;
        _1162 = 5.839270114898681640625;
        _1218 = _1224;
        _1194 = _1222;
        _1188 = _1222;
        _1200 = _1240;
        _1214 = _1236;
        _1204 = 1;
        _1190 = 2;
    }
    float _1242 = _1136;
    float _1244 = _1186;
    float _1246 = _1162;
    float _1248 = _1218;
    float _1250 = _1194;
    float _1252 = _1188;
    float _1254 = _1200;
    float _1256 = _1214;
    int _1258 = _1204;
    int _1260 = _1190;
    float _1262 = _1242 * _1244;
    int _1264 = int(_1124) + int(_1172);
    float _1266 = _1246 * _1248;
    int _1268 = ~_1063;
    int _1270 = _1268 + 1;
    float _1272 = floor(_1262);
    int _1274 = int(_1150) + int(_1212);
    float _1276 = in.m_68.z;
    float _1278 = in.m_68.w;
    float _1280 = _173 * _133;
    int _1282 = ~_1071;
    int _1284 = _1282 + 1;
    float _1286 = _1242 * _1250;
    float _1288 = float(_1063);
    float _1290 = floor(_1266);
    int _1292 = _1270 * _1264;
    int _1294 = _1292 + _1093;
    int _1296 = _1284 * _1274;
    int _1298 = _1296 + _1111;
    float _1300 = _1252 * 2.0;
    bool _1302 = uint(_1294) >= uint(_1063);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1306 = _1049 + _1304;
    float _1308 = -_1272;
    float _1310 = _1262 + _1308;
    bool _1312 = uint(_1298) >= uint(_1071);
    float _1314 = floor(_1286);
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1264;
    int _1326 = _1324 + _1318;
    int _1328 = _1326 + 1;
    float _1330 = -_1290;
    float _1332 = _1266 + _1330;
    float _1334 = _1310 * _1288;
    bool _1336 = !_1312;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1342 = log2(_1340);
    bool _1344 = !_1322;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = _1063 * _1328;
    int _1350 = _1348 + _1093;
    bool _1352 = _1276 > 0.5;
    bool _1354 = _1252 > 0.5;
    float _1356 = float(_1093);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = ~_1274;
    int _1364 = _1362 + _1338;
    int _1366 = _1364 + 1;
    float _1368 = -_1314;
    float _1370 = _1286 + _1368;
    int _1372 = abs(_1346);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1384 = _1382 != 0;
    int _1386 = _1071 * _1366;
    int _1388 = _1386 + _1111;
    float _1390 = -_245;
    int _1392 = _1352 ? as_type<int>(_1390) : as_type<int>(_245);
    float _1394 = floor(_1300);
    float _1396 = -_241;
    int _1398 = _1354 ? as_type<int>(_1396) : as_type<int>(_241);
    bool _1400 = _1356 >= _1288;
    bool _1402 = isnan(_1356);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1288);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1288 * _1280;
    bool _1414 = !_1384;
    float _1416 = _1414 ? _245 : as_type<float>(_1392);
    bool _1418 = !_1380;
    float _1420 = _1418 ? _241 : as_type<float>(_1398);
    float _1422 = trunc(_1410);
    int _1424 = int(_1422);
    float _1426 = float(_1071);
    int _1428 = _1360 * _1372;
    int _1430 = _1428 + _1093;
    float _1432 = float(_1111);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1444 = _1442 != 0;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    bool _1454 = _1432 >= _1426;
    bool _1456 = isnan(_1432);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(_1426);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = !_1440;
    int _1468 = _1466 ? 0 : 1;
    bool _1470 = !_1436;
    int _1472 = _1470 ? 0 : 1;
    bool _1474 = !_1444;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1464);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1492 = _1490 != 0;
    bool _1494 = !_1448;
    int _1496 = _1494 ? 0 : 1;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1500 = _1498 != 0;
    bool _1502 = !_1484;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _1063 == 0;
    int _1508 = ~_1424;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    bool _1514 = !_1506;
    int _1516 = _1514 ? _1350 : (-1);
    float _1518 = _1332 * _1426;
    bool _1520 = !_1488;
    int _1522 = _1520 ? 0 : 1;
    int _1524 = _1516 * _1512;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1528 = _1526 != 0;
    float _1530 = _1426 * _1280;
    int _1532 = _1063 + (-1);
    float _1534 = trunc(_1518);
    int _1536 = int(_1534);
    bool _1538 = !_1528;
    int _1540 = _1538 ? 0 : 1;
    bool _1542 = _1071 == 0;
    int _1544 = _1424 * _1532;
    int _1546 = _1544 + _1524;
    int _1548 = ~_1480;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = as_type<float>(_1424);
    float _1556 = as_type<float>(_1480);
    float _1558 = _1250;
    float _1560 = _1254;
    if (_1500)
    {
        float _1562 = in.m_68.w;
        _1554 = _1562;
    }
    float _1564 = _1554;
    bool _1566 = !_1542;
    int _1568 = _1566 ? _1388 : (-1);
    float _1570 = trunc(_1530);
    int _1572 = int(_1570);
    int _1574 = abs(_1468);
    int _1576 = _1071 + (-1);
    int _1578 = _1568 * _1552;
    int _1580 = abs(_1472);
    int _1582 = _1480 * _1576;
    int _1584 = _1582 + _1578;
    int _1586 = abs(_1522);
    int _1588 = abs(_1504);
    int _1590 = _1546 * _1574;
    int _1592 = _1584 * _1586;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    int _1598 = _1452 * _1580;
    int _1600 = _1598 + _1590;
    int _1602 = abs(_1476);
    int _1604 = _1572 * _1588;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1492;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = as_type<float>(_1590);
    float _1614 = as_type<float>(_1602);
    bool _1616 = _1596;
    if (_1500)
    {
        float _1618 = _1564 * 3.1415927410125732421875;
        _1612 = _1618;
    }
    float _1620 = _1612;
    int _1622 = abs(_1496);
    int _1624 = _1430 * _1602;
    int _1626 = _1624 + _1600;
    int _1628 = abs(_1610);
    if (_1500)
    {
        float _1630 = _1620 * 0.15915493667125701904296875;
        _1614 = _1630;
    }
    float _1632 = _1614;
    float _1634 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1636 = abs(_1540);
    bool _1638 = !_1596;
    int _1640 = _1638 ? 0 : 1;
    int _1642 = _1360 * _1622;
    int _1644 = _1642 + _1626;
    int _1646 = abs(_1640);
    int _1648 = _1536 * _1636;
    int _1650 = _1648 + _1111;
    float _1652 = as_type<float>(_1360);
    float _1654 = as_type<float>(_1636);
    if (_1500)
    {
        float _1656 = _1632 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1652 = _1658;
    }
    float _1660 = _1652;
    float _1662 = 0.0;
    if (!_1500)
    {
        _1662 = _241;
    }
    float _1664 = _1662;
    float _1666 = float(uint(_1644));
    int _1668 = _1650 * _1628;
    int _1670 = _1668 + _1606;
    bool _1672 = _1063 == 0;
    float _1674 = as_type<float>(_1099) * _1666;
    int _1676 = ~_1071;
    int _1678 = _1676 + 1;
    int _1680 = _1536 * _1646;
    int _1682 = _1680 + _1670;
    float _1684 = -_241;
    int _1686 = _1352 ? as_type<int>(_1684) : as_type<int>(_241);
    float _1688 = trunc(_1674);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    float _1698 = float(uint(_1682));
    float _1700 = _1664;
    if (_1500)
    {
        bool _1702 = _1660 > 0.5;
        _1616 = _1702;
    }
    bool _1704 = _1616;
    int _1706 = ~_1063;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1117) * _1698;
    if (_1500)
    {
        float _1712 = -_241;
        float _1714 = _1704 ? _1712 : _241;
        _1700 = _1714;
    }
    float _1716 = _1700;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1710);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    bool _1728 = !_1696;
    float _1730 = _1728 ? _241 : as_type<float>(_1686);
    int _1732 = _1708 * int(_1692);
    int _1734 = _1732 + _1644;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1738 = float(uint(_1734));
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = as_type<float>(_1622);
    float _1744 = _1738;
    if (_1720)
    {
        float _1746 = in.m_68.x;
        _1742 = _1746;
    }
    float _1748 = _1742;
    if (!_1720)
    {
        _1556 = _245;
    }
    float _1750 = _1556;
    float _1752 = as_type<float>(_1099) * _1738;
    float _1754 = -_1736;
    float _1756 = fma(_1634, 2.0, _1754);
    int _1758 = _1678 * int(_1726);
    int _1760 = _1758 + _1682;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1764 = trunc(_1752);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = float(uint(_1760));
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1774 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1762);
    float _1776 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1780 = as_type<float>(_1117) * _1770;
    int _1782 = ~_1063;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1772);
    float _1788 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1792 = trunc(_1780);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = fma(_1788, -2.0, _1740);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1802 = int(_1692) + int(_1768);
    float _1804 = _1750;
    if (_1720)
    {
        float _1806 = _1748 * 3.1415927410125732421875;
        _1744 = _1806;
    }
    float _1808 = _1744;
    int _1810 = ~_1071;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1776, -2.0, _1800);
    int _1816 = _1784 * _1802;
    int _1818 = _1816 + _1644;
    float _1820 = _1808;
    if (_1720)
    {
        float _1822 = _1808 * 0.15915493667125701904296875;
        _1820 = _1822;
    }
    float _1824 = _1820;
    int _1826 = ~_1071;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1834 = uint(_1818) >= uint(_1063);
    float _1836 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1786);
    int _1838 = int(_1726) + int(_1796);
    float _1840 = _1824;
    if (_1720)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1814);
    bool _1850 = !_1834;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1774);
    float _1856 = -_245;
    int _1858 = _1354 ? as_type<int>(_1856) : as_type<int>(_245);
    int _1860 = _1812 * _1838;
    int _1862 = _1860 + _1682;
    int _1864 = ~_1802;
    int _1866 = _1864 + _1852;
    int _1868 = _1866 + 1;
    float _1870 = -_133;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1756);
    float _1874 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1798);
    bool _1876 = uint(_1862) >= uint(_1071);
    int _1878 = _1063 * _1868;
    int _1880 = _1878 + _1644;
    bool _1882 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1884 = isnan(_1049);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    bool _1894 = !_1876;
    int _1896 = _1894 ? 0 : (-1);
    bool _1898 = _1876;
    if (_1720)
    {
        bool _1900 = _1846 > 0.5;
        _1898 = _1900;
    }
    bool _1902 = _1898;
    float _1904 = -_1892;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1672;
    int _1910 = _1908 ? _1880 : (-1);
    if (_1720)
    {
        float _1912 = -_245;
        float _1914 = _1902 ? _1912 : _245;
        _1804 = _1914;
    }
    float _1916 = _1804;
    int _1918 = ~_1838;
    int _1920 = _1918 + _1896;
    int _1922 = _1920 + 1;
    int _1924 = _1910 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = _1278 > 0.5;
    int _1930 = _1071 * _1922;
    int _1932 = _1930 + _1682;
    bool _1934 = uint(_1924) > 1u;
    float _1936 = -_245;
    int _1938 = _1928 ? as_type<int>(_1936) : as_type<int>(_245);
    int _1940 = _1910 & 3;
    bool _1942 = _1940 != 0;
    bool _1944 = !_1542;
    int _1946 = _1944 ? _1932 : (-1);
    int _1948 = _1942 ? 0 : 1;
    int _1950 = _1946 & 3;
    bool _1952 = _1950 != 0;
    int _1954 = ~_1948;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1958;
    if (!_1934)
    {
        int _1962 = ~_1948;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = uint(_1950) >= 2u;
    int _1970 = _1946 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1968 ? 0 : 1;
    bool _1976 = _1950 != 3;
    int _1978 = ~_1974;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1972 ? 0 : 1;
    bool _1986 = uint(_1950) > 1u;
    int _1988 = ~_1984;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = int(_1976);
    int _1996 = _1986 ? 2 : 0;
    int _1998 = _1994 | _1996;
    int _2000 = _1952 ? 4 : 0;
    int _2002 = _1998 | _2000;
    int _2004 = _1376 ? 8 : 0;
    int _2006 = _2002 | _2004;
    int _2008 = _1926 ? 16 : 0;
    int _2010 = _2006 | _2008;
    int _2012 = _1542 ? 32 : 0;
    int _2014 = _2010 | _2012;
    int _2016 = _1672 ? 64 : 0;
    int _2018 = _2014 | _2016;
    int _2020 = _2018 & 4;
    int _2022 = int(_1976);
    int _2024 = _1986 ? 2 : 0;
    int _2026 = _2022 | _2024;
    int _2028 = _1952 ? 4 : 0;
    int _2030 = _2026 | _2028;
    int _2032 = _1376 ? 8 : 0;
    int _2034 = _2030 | _2032;
    int _2036 = _1926 ? 16 : 0;
    int _2038 = _2034 | _2036;
    int _2040 = _1542 ? 32 : 0;
    int _2042 = _2038 | _2040;
    int _2044 = _1672 ? 64 : 0;
    int _2046 = _2042 | _2044;
    int _2048 = _2046 & 16;
    int _2050 = _1982;
    int _2052 = _1992;
    if (_1976)
    {
        int _2054 = ~_1974;
        int _2056 = _2054 + 1;
        _2050 = _2056;
    }
    int _2058 = _2050;
    int _2060 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2062 = _2060 != 0;
    float _2064 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2066 = int(_2064);
    bool _2068 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2070 = isnan(_1049);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    bool _2080 = !_2062;
    float _2082 = _2080 ? _245 : as_type<float>(_1858);
    if (!_1986)
    {
        int _2084 = ~_1984;
        int _2086 = _2084 + 1;
        _2052 = _2086;
    }
    int _2088 = _2052;
    float _2090 = _2078 * _1906;
    int _2092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2094 = _2092 != 0;
    float _2096 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2098 = int(_2096);
    bool _2100 = !_1376;
    float _2102 = _2100 ? _245 : as_type<float>(_1938);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    bool _2108 = !_2094;
    int _2110 = _2108 ? 0 : 1;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2118 = _2116 != 0;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2122 = _2120 != 0;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2126 = _2124 != 0;
    float _2128 = float(uint(_2066));
    bool _2130 = !_2114;
    int _2132 = _2130 ? 0 : 1;
    bool _2134 = _1258 != 1;
    float _2136 = 1.0 / _2128;
    float _2138 = float(_2098);
    bool _2140 = !_2118;
    int _2142 = _2140 ? 0 : 1;
    bool _2144 = _1244 > 0.5;
    bool _2146 = !_2122;
    int _2148 = _2146 ? 0 : 1;
    float _2150 = 1.0 / _2138;
    float _2152 = -_241;
    int _2154 = _2144 ? as_type<int>(_2152) : as_type<int>(_241);
    int _2156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2158 = _2156 != 0;
    float _2160 = 1.4012984643248170709237295832899e-45;
    if (!_2134)
    {
        _1654 = _1252;
    }
    float _2162 = _1654;
    float _2164 = 0.0;
    float _2166 = _2162;
    if (!_2134)
    {
        _2164 = _1252;
    }
    float _2168 = _2164;
    float _2170 = _2168;
    if (!_2134)
    {
        _2160 = _1276;
    }
    float _2172 = _2160;
    float _2174 = _2172;
    if (!_2134)
    {
        _1558 = _1276;
    }
    float _2176 = _1558;
    float _2178 = _2176;
    if (_2134)
    {
        _2166 = _1244;
    }
    float _2180 = _2166;
    if (_2134)
    {
        _2170 = _1244;
    }
    float _2182 = _2170;
    float _2184 = _2150 * _133;
    float _2186 = _1244 * 2.0;
    if (_2134)
    {
        _2174 = _1252;
    }
    float _2188 = _2174;
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2134)
    {
        _2178 = _1252;
    }
    float _2192 = _2178;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2196 = trunc(_2184);
    int _2198 = int(_2196);
    bool _2200 = _1260 != 2;
    float _2202 = -_1830;
    float _2204 = fma(_2190, 2.0, _2202);
    int _2206 = as_type<int>(_2136) + (-2);
    float _2208 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1832);
    float _2212 = _1342 * _133;
    float _2214 = float(_2066);
    float _2216 = floor(_2186);
    float _2218 = -_1790;
    float _2220 = fma(_2208, 2.0, _2218);
    int _2222 = ~_2066;
    int _2224 = _2222 + 1;
    float _2226 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2194);
    float _2228 = _1370 * _2214;
    int _2230 = ~_1063;
    int _2232 = _2230 + 1;
    float _2234 = -_133;
    float _2236 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2220);
    if (_2200)
    {
        _1560 = _1252;
    }
    float _2238 = _1560;
    float _2240 = exp2(_2212);
    float _2242 = float(uint(_2198));
    float _2244 = -_133;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2204);
    float _2248 = _2238;
    float _2250 = _2242;
    if (!_2200)
    {
        _2248 = _1244;
    }
    float _2252 = _2248;
    float _2254 = _2214 * _1280;
    bool _2256 = !_2126;
    int _2258 = _2256 ? 0 : 1;
    float _2260 = as_type<float>(_2206) * _2242;
    if (_2200)
    {
        _2250 = _1244;
    }
    float _2262 = _2250;
    float _2264 = trunc(_2228);
    int _2266 = int(_2264);
    float _2268 = _2262;
    if (!_2200)
    {
        _2268 = _1276;
    }
    float _2270 = _2268;
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2274 = _2216 > 0.0;
    bool _2276 = _2216 >= 0.0;
    bool _2278 = isnan(_2216);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2288 = float(uint(_1430));
    float _2290 = trunc(_2260);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    float _2296 = -_2240;
    float _2298 = _2296 + 1.0;
    bool _2300 = _2020 != 0;
    float _2302 = as_type<float>(_1099) * _2288;
    float _2304 = float(uint(_1650));
    float _2306 = trunc(_2254);
    int _2308 = int(_2306);
    int _2310 = abs(_2142);
    float _2312 = as_type<float>(_1117) * _2304;
    int _2314 = abs(_2132);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2318 = _2224 * int(_2294);
    int _2320 = _2318 + _2198;
    float _2322 = trunc(_2312);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2320));
    float _2330 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2332 = trunc(_2302);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = as_type<float>(_2206) * _2328;
    float _2340 = fma(_2330, -2.0, _2316);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = -_2342;
    float _2346 = fma(_2286, 2.0, _2344);
    float _2348 = trunc(_2338);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = _1828 * int(_2326);
    int _2356 = _2354 + _1650;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2360 = -_133;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2346);
    float _2364 = fma(_2272, -2.0, _2358);
    int _2366 = _2232 * int(_2336);
    int _2368 = _2366 + _1430;
    float _2370 = float(uint(_2356));
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2374 = float(uint(_2368));
    float _2376 = as_type<float>(_1117) * _2370;
    int _2378 = abs(_2110);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2382 = int(_2294) + int(_2352);
    float _2384 = as_type<float>(_1099) * _2374;
    bool _2386 = !_2158;
    float _2388 = _2386 ? _241 : as_type<float>(_2154);
    float _2390 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2372);
    bool _2392 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2400 = _2396 || _2398;
    float _2402 = trunc(_2384);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2380);
    float _2410 = _2400 ? _2298 : 0.0;
    int _2412 = _2266 * _2378;
    int _2414 = _2412 + _2198;
    int _2416 = ~_2066;
    int _2418 = _2416 + 1;
    float _2420 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    bool _2422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2424 = isnan(1.0);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2430 = _2426 || _2428;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2434 = 1.0 + _2432;
    float _2436 = float(uint(_2414));
    float _2438 = trunc(_2376);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2408);
    float _2446 = as_type<float>(_2206) * _2436;
    int _2448 = ~_2066;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2454 = int(_2336) + int(_2406);
    float _2456 = 1.0 / _2434;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2460 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2452);
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2464 = _1049 + _2462;
    float _2466 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2458);
    float _2468 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2470 = trunc(_2446);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    int _2478 = int(_2326) + int(_2442);
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2484 = 1.0 / _2482;
    int _2486 = _2418 * int(_2474);
    int _2488 = _2486 + _2414;
    float _2490 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2210);
    float _2492 = float(uint(_2488));
    float _2494 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2340);
    int _2496 = _2450 * _2382;
    int _2498 = _2496 + _2198;
    float _2500 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    if (_2430)
    {
        float _2502 = _2410 * _2456;
        _143 = _2502;
    }
    float _2504 = _143;
    float _2506 = as_type<float>(_2206) * _2492;
    int _2508 = ~_1063;
    int _2510 = _2508 + 1;
    float _2512 = -_2490;
    float _2514 = _2512 + 1.0;
    int _2516 = _2284 ? 0 : 1;
    bool _2518 = uint(_2498) >= uint(_2066);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2510 * _2454;
    int _2534 = _2532 + _1430;
    bool _2536 = !_2518;
    int _2538 = _2536 ? 0 : (-1);
    int _2540 = _2530;
    if (!_2274)
    {
        int _2542 = ~_2516;
        int _2544 = _2542 + 1;
        _2540 = _2544;
    }
    int _2546 = _2540;
    bool _2548 = _1394 > 0.0;
    bool _2550 = _1394 >= 0.0;
    bool _2552 = isnan(_1394);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan(0.0);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2198);
    int _2562 = ~_2066;
    int _2564 = _2562 + 1;
    bool _2566 = uint(_2534) >= uint(_1063);
    int _2568 = int(_2474) + int(_2524);
    bool _2570 = _2560 >= _2214;
    bool _2572 = isnan(_2560);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(_2214);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    int _2582 = ~_1071;
    int _2584 = _2582 + 1;
    float _2586 = trunc(_2580);
    int _2588 = int(_2586);
    int _2590 = _2564 * _2568;
    int _2592 = _2590 + _2414;
    int _2594 = _2558 ? 0 : 1;
    int _2596 = _2584 * _2478;
    int _2598 = _2596 + _1650;
    bool _2600 = !_2566;
    int _2602 = _2600 ? 0 : (-1);
    bool _2604 = uint(_2592) >= uint(_2066);
    bool _2606 = uint(_2598) >= uint(_1071);
    int _2608 = ~_2382;
    int _2610 = _2608 + _2538;
    int _2612 = _2610 + 1;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2616 = _2614 != 0;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2620 = _2618 != 0;
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2624 = _2622 != 0;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    int _2630 = _2066 * _2612;
    int _2632 = _2630 + _2198;
    bool _2634 = _2066 == 0;
    int _2636 = ~_2588;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    bool _2642 = !_2634;
    int _2644 = _2642 ? _2632 : (-1);
    int _2646 = _2066 + (-1);
    int _2648 = ~_2594;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    int _2654 = _2644 * _2640;
    int _2656 = _2652;
    if (!_2548)
    {
        int _2658 = ~_2594;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    bool _2664 = !_2604;
    int _2666 = _2664 ? 0 : (-1);
    int _2668 = _2588 * _2646;
    int _2670 = _2668 + _2654;
    int _2672 = abs(_2148);
    int _2674 = _2670 * _2310;
    int _2676 = abs(_2258);
    int _2678 = _2308 * _2314;
    int _2680 = _2678 + _2674;
    float _2682 = _1276 * 2.0;
    int _2684 = ~_2066;
    int _2686 = _2684 + 1;
    int _2688 = _2414 * _2672;
    int _2690 = _2688 + _2680;
    int _2692 = ~_2066;
    int _2694 = _2692 + 1;
    bool _2696 = !_2620;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = _2266 * _2676;
    int _2702 = _2700 + _2690;
    float _2704 = floor(_2682);
    bool _2706 = _2048 != 0;
    float _2708 = float(uint(_2702));
    bool _2710 = !_2616;
    int _2712 = _2710 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2718 = abs(_2698);
    float _2720 = as_type<float>(_2206) * _2708;
    bool _2722 = !_2624;
    int _2724 = _2722 ? 0 : 1;
    float _2726 = float(_2662);
    float _2728 = trunc(_2720);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    int _2734 = abs(_2724);
    bool _2736 = _2704 >= 0.0;
    bool _2738 = isnan(_2704);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    int _2746 = ~_2454;
    int _2748 = _2746 + _2602;
    int _2750 = _2748 + 1;
    int _2752 = _2744 ? 0 : 1;
    float _2754 = 1.0 / _2716;
    bool _2756 = _2704 > 0.0;
    int _2758 = _1063 * _2750;
    int _2760 = _2758 + _1430;
    int _2762 = ~_2478;
    int _2764 = _2762 + _2628;
    int _2766 = _2764 + 1;
    int _2768 = ~_2568;
    int _2770 = _2768 + _2666;
    int _2772 = _2770 + 1;
    bool _2774 = _1071 == 0;
    int _2776 = _2686 * int(_2732);
    int _2778 = _2776 + _2702;
    int _2780 = _1071 * _2766;
    int _2782 = _2780 + _1650;
    int _2784 = _1946 >> 31;
    int _2786 = _2066 * _2772;
    int _2788 = _2786 + _2414;
    float _2790 = float(uint(_2778));
    int _2792 = _2784 & 3;
    bool _2794 = !_2774;
    int _2796 = _2794 ? _2782 : (-1);
    float _2798 = as_type<float>(_2206) * _2790;
    float _2800 = trunc(_2798);
    float _2802 = precise::max(_2800, 0.0);
    uint _2804 = uint(_2802);
    int _2806 = int(_2732) + int(_2804);
    float _2808 = in.m_48.x;
    float _2810 = in.m_48.y;
    float _2812 = in.m_48.z;
    int _2814 = _2694 * _2806;
    int _2816 = _2814 + _2702;
    int _2818 = ~_2752;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    int _2824 = _2822;
    if (!_2756)
    {
        int _2826 = ~_2752;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = uint(_2816) >= uint(_2066);
    bool _2834 = _1950 != 3;
    bool _2836 = !_2832;
    int _2838 = _2836 ? 0 : (-1);
    bool _2840 = !_2300;
    int _2842 = _2840 ? 0 : 1;
    bool _2844 = !_2834;
    int _2846 = _2844 ? 0 : (-1);
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2850 = _2848 != 0;
    int _2852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2854 = _2852 != 0;
    float _2856 = _201 * _2810;
    float _2858 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _245);
    float _2862 = _195 * _2810;
    float _2864 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2868 = _2866 != 0;
    float _2870 = _2858 * _2860;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2876 = _207 * _2810;
    float _2878 = fma(_193, _2808, _2862);
    float _2880 = 1.0 / _2874;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2890 = _2888 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2892 = fma(_205, _2808, _2876);
    float _2894 = fma(_199, _2808, _2856);
    float _2896 = _2864 * _2886;
    float _2898 = 1.0 / _2884;
    float _2900 = fma(_197, _2812, _2878);
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2904 = _2902 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2906 = fma(_203, _2812, _2894);
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2912 = fma(_209, _2812, _2892);
    float _2914 = 1.0 / _2890;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2916;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2924 = in.m_62.w;
    float _2926 = _2918 * _2484;
    float _2928 = _2922 * _2880;
    float _2930 = 1.0 / _2910;
    bool _2932 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2934 = isnan(_1049);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    float _2944 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2948;
    bool _2952 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2954 = isnan(_1049);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2964;
    float _2968 = _2946 * _2898;
    float _2970 = _2950 * _2754;
    float _2972 = 1.0 / _2904;
    float _2974 = -_2942;
    float _2976 = _2974 + 1.0;
    float _2978 = _2966 * _2914;
    bool _2980 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2982 = isnan(_1049);
    bool _2984 = _2980 || _2982;
    bool _2986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2988 = _2984 || _2986;
    float _2990 = float(_2988);
    float _2992 = -_2962;
    float _2994 = _2992 + 1.0;
    float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2998 = _2996 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _3000 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3002 = isnan(_1049);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3008 = _3004 || _3006;
    float _3010 = float(_3008);
    float _3012 = _2962 * _2976;
    float _3014 = _2990 * _2994;
    float _3016 = -_2990;
    float _3018 = _3016 + 1.0;
    float _3020 = _2998 * _2930;
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3022;
    bool _3026 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3028 = isnan(_1049);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3034 = _3030 || _3032;
    float _3036 = float(_3034);
    float _3038 = -_3010;
    float _3040 = _3038 + 1.0;
    float _3042 = _3010 * _3018;
    float _3044 = _3024 * _2972;
    bool _3046 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3048 = isnan(_1049);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    float _3058 = _3036 * _3040;
    float _3060 = -_3036;
    float _3062 = _3060 + 1.0;
    float _3064 = in.m_64.w;
    float _3066 = fma(_2926, _2464, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3068 = -_3056;
    float _3070 = _3068 + 1.0;
    float _3072 = _3056 * _3062;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3076 = _1049 + _3074;
    float _3078 = in.m_66.w;
    float _3080 = _1892 * _3070;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3084 = _1049 + _3082;
    float _3086 = _3066 * _2090;
    float _3088 = fma(_2970, _3076, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3092 = _1049 + _3090;
    float _3094 = fma(_2928, _3084, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3096 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3086);
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3100 = _1049 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3104 = _1049 + _3102;
    float _3106 = fma(_2968, _3092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3108 = fma(_3094, _3080, _3096);
    float _3110 = fma(_3044, _3104, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3112 = _1244 + _1276;
    float _3114 = fma(_3088, _3072, _3108);
    float _3116 = _1244 + (-0.5);
    float _3118 = _2900 + _2924;
    float _3120 = float(_2830);
    float _3122 = _2906 + _3064;
    float _3124 = _1252 + _1244;
    float _3126 = _1252 + _1276;
    float _3128 = fma(_3106, _3058, _3114);
    int _3130 = abs(_2712);
    float _3132 = _2912 + _3078;
    float _3134 = _3124 + (-1.0);
    float _3136 = in.m_78.x;
    float _3138 = in.m_78.y;
    float _3140 = in.m_78.z;
    float _3142 = _3126 + (-1.0);
    float _3144 = fma(_2978, _3100, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3146 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3148 = _3112 + (-1.0);
    float _3150 = float(_3130);
    float _3152 = fma(_3020, _1306, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3154 = fma(_3142, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3156 = fma(_3144, _3042, _3128);
    float _3158 = _1716 + 0.5;
    float _3160 = _3150 * _3120;
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3164 = fma(_3152, _3014, _3156);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2236);
    float _3168 = _3160 * (-2.0);
    float _3170 = fma(_3110, _3012, _3164);
    float _3172 = float(_2546);
    float _3174 = fma(_3146, _3168, _3146);
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3178 = _1916 + (-0.5);
    float _3180 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3170);
    float _3182 = fma(_3168, _3136, _3136);
    float _3184 = float(_2718);
    float _3186 = _1252 + (-0.5);
    float _3188 = _1276 + (-0.5);
    float _3190 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3182);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3194 = _3184 * _3172;
    float _3196 = fma(_3174, _2504, _3190);
    float _3198 = -_3178;
    float _3200 = -_1848;
    float _3202 = fma(_3198, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3200);
    float _3204 = _3194 * (-2.0);
    float _3206 = float(_2734);
    float _3208 = -_1836;
    float _3210 = _3208 + 1.0;
    float _3212 = -_1854;
    float _3214 = _3212 + 1.0;
    float _3216 = fma(_3204, _3138, _3138);
    float _3218 = fma(_3154, _3204, _3154);
    float _3220 = _3206 * _2726;
    float _3222 = -_3210;
    float _3224 = fma(_3222, _1716, _3166);
    float _3226 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3216);
    float _3228 = fma(_3214, _1916, _3202);
    float _3230 = _3220 * (-2.0);
    float _3232 = _3196 * 0.15915493667125701904296875;
    float _3234 = fma(_3218, _2504, _3226);
    float _3236 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3238 = fma(_3162, _3230, _3162);
    float _3240 = fma(_3230, _3140, _3140);
    out.m_80.x = _3224;
    out.m_80.y = _3228;
    float _3242 = _3234 * 0.15915493667125701904296875;
    float _3244 = _1730 + 0.5;
    float _3246 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3240);
    float _3248 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3250 = _2388 + 0.5;
    float _3252 = _2082 + (-0.5);
    float _3254 = fma(_3238, _2504, _3246);
    float _3256 = _3232 * 6.283185482025146484375;
    float _3258 = sin(_3256);
    float _3260 = fma(_3236, _3244, _2246);
    float _3262 = _2102 + (-0.5);
    float _3264 = _3254 * 0.15915493667125701904296875;
    float _3266 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1872);
    float _3268 = -_3252;
    float _3270 = -_1874;
    float _3272 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3270);
    float _3274 = -_3248;
    float _3276 = -_2494;
    float _3278 = fma(_3274, _3262, _3276);
    float _3280 = -_2468;
    float _3282 = _3280 + 1.0;
    float _3284 = _3242 * 6.283185482025146484375;
    float _3286 = sin(_3284);
    float _3288 = -_2420;
    float _3290 = _3288 + 1.0;
    float _3292 = -_2226;
    float _3294 = _3292 + 1.0;
    float _3296 = -_3282;
    float _3298 = fma(_2388, _3296, _3266);
    float _3300 = fma(_2102, _2514, _3278);
    float _3302 = fma(_2082, _3290, _3272);
    float _3304 = -_3294;
    float _3306 = fma(_1730, _3304, _3260);
    float _3308 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3310 = _3242 * 6.283185482025146484375;
    float _3312 = cos(_3310);
    int _3314 = ~_2806;
    int _3316 = _3314 + _2838;
    int _3318 = _3316 + 1;
    out.m_82.x = _3180;
    out.m_84.x = _3298;
    out.m_84.y = _3302;
    out.m_84.z = _3306;
    out.m_84.w = _3300;
    float _3320 = _3264 * 6.283185482025146484375;
    float _3322 = cos(_3320);
    float _3324 = _3258 * _3286;
    float _3326 = _3232 * 6.283185482025146484375;
    float _3328 = cos(_3326);
    float _3330 = _3258 * _3312;
    int _3332 = _1946 + _2792;
    float _3334 = _3264 * 6.283185482025146484375;
    float _3336 = sin(_3334);
    int _3338 = _3332 >> 2;
    float _3340 = _3258 * _3322;
    int _3342 = _3338 << 4;
    int _3344 = _3342 + 656;
    float _3346 = _3340 * _2870;
    float _3348 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3350 = _3328 * _3312;
    float _3352 = _3328 * _3322;
    float _3354 = _3328 * _3286;
    float _3356 = _3312 * _3322;
    float _3358 = _3286 * _3322;
    float _3360 = _3352 * _2870;
    float _3362 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3364 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3366 = fma(_3336, _3350, _3324);
    float _3368 = fma(_3336, _3324, _3350);
    float _3370 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _3372 = uint(int(uint(_3344) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    float _3388 = -_2870;
    float _3390 = _3336 * _3388;
    float _3392 = -_3354;
    float _3394 = fma(_3336, _3330, _3392);
    float _3396 = -_3336;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3370);
    float _3400 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3402 = fma(_3356, _2896, _3390);
    float _3404 = -_3330;
    float _3406 = fma(_3336, _3354, _3404);
    float _3408 = -_3336;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3362);
    float _3412 = -_3336;
    float _3414 = fma(_3412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3416 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    float _3418 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3420 = _3344 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    float _3438 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3440 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3398);
    float _3442 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3444 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3410);
    float _3446 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3414);
    float _3448 = fma(_3366, _2896, _3360);
    float _3450 = fma(_3394, _2896, _3346);
    float _3452 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3418);
    float _3454 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3438);
    float _3456 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3458 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3442);
    float _3460 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3462 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3464 = fma(_3358, _3348, _3402);
    float _3466 = fma(_3406, _3348, _3448);
    float _3468 = fma(_3368, _3348, _3450);
    int _3470 = abs(_2088);
    float _3472 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3454);
    float _3474 = _3456 * _3444;
    float _3476 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3460);
    float _3478 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3462);
    float _3480 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3416);
    float _3482 = fma(_3308, _3472, _3474);
    int _3484 = ~_3470;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    float _3490 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3458);
    float _3492 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3476);
    float _3494 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3452);
    float _3496 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3478);
    float _3498 = _3456 * _3440;
    int _3500 = abs(_2842);
    out.m_86.x = _3472;
    out.m_86.y = _3480;
    out.m_86.z = _3490;
    float _3502 = _3456 * _3446;
    int _3504 = _2066 * _3318;
    int _3506 = _3504 + _2702;
    int _3508 = ~_3500;
    int _3510 = _3508 + 1;
    int _3512 = _3510 + 1;
    float _3514 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3516 = int(_3514);
    float _3518 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3520 = _3488 * as_type<int>(_3386);
    float _3522 = fma(_3308, _3480, _3498);
    int _3524 = abs(_2846);
    float _3526 = fma(_3308, _3490, _3502);
    int _3528 = _3512 * as_type<int>(_3378);
    int _3530 = _3528 + _3520;
    int _3532 = _1910 >> 31;
    float _3534 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3536 = abs(_2058);
    float _3538 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3540 = _3532 & 3;
    float _3542 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3534);
    int _3544 = ~_3536;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    float _3550 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3538);
    int _3552 = ~_3524;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3542);
    bool _3560 = !_2634;
    float _3562 = _3560 ? as_type<float>(_3506) : as_type<float>(0xffffffffu /* nan */);
    int _3564 = _3548 * as_type<int>(_3428);
    int _3566 = _3564 + _3530;
    int _3568 = _1910 + _3540;
    float _3570 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3550);
    int _3572 = abs(_3516);
    int _3574 = _3556 * as_type<int>(_3436);
    int _3576 = _3574 + _3566;
    float _3578 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3580 = !_2854;
    int _3582 = _3580 ? 0 : 1;
    float _3584 = _3570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3586 = uint(_1924) >= 2u;
    float _3588 = _3118 + _3578;
    int _3590 = as_type<int>(_3562) >> 31;
    float _3592 = _3132 + _3584;
    int _3594 = abs(_3582);
    float _3596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3598 = _3588 + _3596;
    int _3600 = _3590 & 3;
    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3604 = _3592 + _3602;
    float _3606 = float(uint(_3516));
    float _3608 = _3598 * _3598;
    int _3610 = as_type<int>(_3562) + _3600;
    float _3612 = _3604 * _3604;
    int _3614 = _3586 ? 0 : 1;
    float _3616 = 1.0 / _3606;
    int _3618 = _3610 >> 2;
    float _3620 = _3608 + _3612;
    bool _3622 = _1924 != 3;
    float _3624 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3518);
    int _3626 = _3618 << 4;
    int _3628 = _3626 + 800;
    float _3630 = float(uint(_3572));
    float _3632 = sqrt(_3620);
    uint _3634 = uint(int(uint(_3628) >> uint(2)));
    uint _3636 = uint(int(uint(int(_3634)) >> uint(2)));
    int _3638 = int(_3634) & 3;
    float _3640 = (*spvDescriptorSet0.vp_c9)._m0[int(_3636)][_3638];
    int _3642 = int(_3634) + 1;
    uint _3644 = uint(int(uint(_3642) >> uint(2)));
    int _3646 = _3642 & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = ~_3594;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    float _3656 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3624);
    int _3658 = ~_3614;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _3568 >> 2;
    int _3666 = _3576 * _3654;
    float _3668 = 1.0 / _3630;
    int _3670 = _3662;
    float _3672 = _3588;
    float _3674 = as_type<float>(_3576);
    float _3676 = _3562;
    float _3678 = _3592;
    float _3680 = _3118;
    float _3682 = _3526;
    if (_3622)
    {
        int _3684 = ~_3614;
        int _3686 = _3684 + 1;
        _3670 = _3686;
    }
    int _3688 = _3670;
    int _3690 = _2796 * _3594;
    int _3692 = _3690 + _3666;
    int _3694 = _3664 << 4;
    int _3696 = _3694 + 368;
    float _3698 = _3656 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3700 = as_type<int>(_3616) + (-2);
    int _3702 = abs(_3692);
    uint _3704 = uint(int(uint(_3696) >> uint(2)));
    uint _3706 = uint(int(uint(int(_3704)) >> uint(2)));
    int _3708 = int(_3704) & 3;
    float _3710 = (*spvDescriptorSet0.vp_c9)._m0[int(_3706)][_3708];
    int _3712 = int(_3704) + 1;
    uint _3714 = uint(int(uint(_3712) >> uint(2)));
    int _3716 = _3712 & 3;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[int(_3714)][_3716];
    float _3720 = float(uint(_3692));
    float _3722 = _3122 + _3698;
    float _3724 = float(uint(_3702));
    bool _3726 = _3632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3728 = as_type<float>(_3700) * _3720;
    int _3730 = as_type<int>(_3668) + (-2);
    int _3732 = _3696 + 8;
    uint _3734 = uint(int(uint(_3732) >> uint(2)));
    uint _3736 = uint(int(uint(int(_3734)) >> uint(2)));
    int _3738 = int(_3734) & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = int(_3734) + 1;
    uint _3744 = uint(int(uint(_3742) >> uint(2)));
    int _3746 = _3742 & 3;
    float _3748 = (*spvDescriptorSet0.vp_c9)._m0[int(_3744)][_3746];
    int _3750 = as_type<int>(_3562) & 3;
    bool _3752 = _3750 != 0;
    float _3754 = trunc(_3728);
    float _3756 = precise::max(_3754, 0.0);
    uint _3758 = uint(_3756);
    bool _3760 = !_2706;
    int _3762 = _3760 ? 0 : 1;
    int _3764 = _3752 ? 0 : 1;
    int _3766 = as_type<int>(_3562) & 3;
    bool _3768 = _3766 != 0;
    float _3770 = as_type<float>(_3730) * _3724;
    bool _3772 = _1924 != 3;
    float _3774 = _3720;
    if (!_3726)
    {
        _3774 = _3588;
    }
    float _3776 = _3774;
    float _3778 = _3776;
    if (!_3726)
    {
        _3672 = _3592;
    }
    float _3780 = _3672;
    float _3782 = trunc(_3770);
    float _3784 = precise::max(_3782, 0.0);
    uint _3786 = uint(_3784);
    int _3788 = ~_3516;
    int _3790 = _3788 + 1;
    int _3792 = ~_3572;
    int _3794 = _3792 + 1;
    float _3796 = _3780;
    if (!_3726)
    {
        _3674 = _3612;
    }
    float _3798 = _3674;
    float _3800 = _3798;
    if (!_3726)
    {
        _3676 = _3608;
    }
    float _3802 = _3676;
    float _3804 = _3802;
    if (!_3726)
    {
        _3678 = _3722;
    }
    float _3806 = _3678;
    int _3808 = ~_3764;
    int _3810 = _3808 + 1;
    int _3812 = _3810 + 1;
    bool _3814 = uint(_3766) > 1u;
    bool _3816 = !_3726;
    float _3818 = _3806;
    int _3820 = _3812;
    if (!_3816)
    {
        float _3822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3826 = _3632 + _3824;
        float _3828 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = rsqrt(_3620);
        float _3832 = _3826 * _3822;
        float _3834 = _3832 * 0.15915493667125701904296875;
        float _3836 = _3834 * 6.283185482025146484375;
        float _3838 = sin(_3836);
        float _3840 = _3834 * 6.283185482025146484375;
        float _3842 = cos(_3840);
        float _3844 = fma(_3838, _3828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3846 = _3830 * _3844;
        float _3848 = _3842 + (-1.0);
        float _3850 = fma(_3598, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3852 = fma(_3604, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3854 = _3848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3858 = _3850 + _3856;
        float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3862 = _3852 + _3860;
        float _3864 = fma(_3722, _3842, _3854);
        float _3866 = _3858 * _3858;
        float _3868 = _3862 * _3862;
        _3818 = _3864;
        _3804 = _3866;
        _3800 = _3868;
        _3778 = _3850;
        _3796 = _3852;
    }
    float _3870 = _3818;
    float _3872 = _3804;
    float _3874 = _3800;
    float _3876 = _3778;
    float _3878 = _3796;
    int _3880 = _3628 + 8;
    uint _3882 = uint(int(uint(_3880) >> uint(2)));
    uint _3884 = uint(int(uint(int(_3882)) >> uint(2)));
    int _3886 = int(_3882) & 3;
    float _3888 = (*spvDescriptorSet0.vp_c9)._m0[int(_3884)][_3886];
    int _3890 = int(_3882) + 1;
    uint _3892 = uint(int(uint(_3890) >> uint(2)));
    int _3894 = _3890 & 3;
    float _3896 = (*spvDescriptorSet0.vp_c9)._m0[int(_3892)][_3894];
    if (!_3814)
    {
        int _3898 = ~_3764;
        int _3900 = _3898 + 1;
        _3820 = _3900;
    }
    int _3902 = _3820;
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3906 = _3870 + _3904;
    float _3908 = -_2476;
    float _3910 = _3908 + 1.0;
    float _3912 = fma(_3906, _3906, _3872);
    bool _3914 = !_3768;
    int _3916 = _3914 ? 0 : 1;
    int _3918 = _3790 * int(_3758);
    int _3920 = _3918 + _3692;
    int _3922 = abs(_1966);
    int _3924 = _3794 * int(_3786);
    int _3926 = _3924 + _3702;
    int _3928 = abs(_3762);
    float _3930 = -_2444;
    float _3932 = _3930 + 1.0;
    float _3934 = float(uint(_3920));
    float _3936 = float(uint(_3926));
    bool _3938 = _3766 != 3;
    float _3940 = as_type<float>(_3700) * _3934;
    int _3942 = abs(_3916);
    float _3944 = as_type<float>(_3730) * _3936;
    int _3946 = ~_3922;
    int _3948 = _3946 + 1;
    int _3950 = _3948 + 1;
    float _3952 = trunc(_3940);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    bool _3958 = uint(_3766) >= 2u;
    int _3960 = _3950 * as_type<int>(_3718);
    int _3962 = abs(_3688);
    int _3964 = abs(_3902);
    int _3966 = ~_3928;
    int _3968 = _3966 + 1;
    int _3970 = _3968 + 1;
    float _3972 = trunc(_3944);
    float _3974 = precise::max(_3972, 0.0);
    uint _3976 = uint(_3974);
    int _3978 = _3958 ? 0 : 1;
    int _3980 = _3970 * as_type<int>(_3710);
    int _3982 = _3980 + _3960;
    int _3984 = ~_3964;
    int _3986 = _3984 + 1;
    int _3988 = _3986 + 1;
    int _3990 = ~_3978;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = _3988 * as_type<int>(_3648);
    int _3998 = ~_3962;
    int _4000 = _3998 + 1;
    int _4002 = _4000 + 1;
    float _4004 = _3912 + _3874;
    int _4006 = ~_3942;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    int _4012 = _3994;
    float _4014 = _4004;
    if (_3938)
    {
        int _4016 = ~_3978;
        int _4018 = _4016 + 1;
        _4012 = _4018;
    }
    int _4020 = _4012;
    int _4022 = _4002 * as_type<int>(_3740);
    int _4024 = _4022 + _3982;
    bool _4026 = _3766 != 3;
    int _4028 = _4010 * as_type<int>(_3640);
    int _4030 = _4028 + _3996;
    int _4032 = abs(_4020);
    bool _4034 = !_3772;
    int _4036 = _4034 ? 0 : (-1);
    int _4038 = ~_3516;
    int _4040 = _4038 + 1;
    int _4042 = int(_3758) + int(_3956);
    bool _4044 = !_4026;
    int _4046 = _4044 ? 0 : (-1);
    int _4048 = ~_4032;
    int _4050 = _4048 + 1;
    int _4052 = _4050 + 1;
    int _4054 = abs(_4036);
    int _4056 = _4040 * _4042;
    int _4058 = _4056 + _3692;
    int _4060 = abs(_4046);
    int _4062 = _4052 * as_type<int>(_3888);
    int _4064 = _4062 + _4030;
    int _4066 = int(_3786) + int(_3976);
    int _4068 = ~_3572;
    int _4070 = _4068 + 1;
    bool _4072 = uint(_4058) >= uint(_3516);
    int _4074 = _4070 * _4066;
    int _4076 = _4074 + _3702;
    int _4078 = ~_4054;
    int _4080 = _4078 + 1;
    int _4082 = _4080 + 1;
    int _4084 = ~_4060;
    int _4086 = _4084 + 1;
    int _4088 = _4086 + 1;
    bool _4090 = uint(_4076) >= uint(_3572);
    int _4092 = _4082 * as_type<int>(_3748);
    int _4094 = _4092 + _4024;
    bool _4096 = !_4072;
    int _4098 = _4096 ? 0 : (-1);
    int _4100 = _4088 * as_type<int>(_3896);
    int _4102 = _4100 + _4064;
    int _4104 = _3692 ^ _3516;
    float _4106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4108 = !_4090;
    int _4110 = _4108 ? 0 : (-1);
    uint _4112 = uint(int(uint(_4104) >> uint(31)));
    int _4114 = ~_4110;
    int _4116 = _4066 + _4114;
    int _4118 = _4116 + 1;
    bool _4120 = !_2850;
    int _4122 = _4120 ? 0 : 1;
    float _4124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4126 = ~int(_4112);
    int _4128 = _4126 + 1;
    int _4130 = ~_4042;
    int _4132 = _4130 + _4098;
    int _4134 = _4132 + 1;
    bool _4136 = !_2868;
    int _4138 = _4136 ? 0 : 1;
    int _4140 = abs(_4122);
    int _4142 = _3516 * _4134;
    int _4144 = _4142 + _3692;
    int _4146 = _4118 ^ _4128;
    int _4148 = abs(_4138);
    int _4150 = ~_4140;
    int _4152 = _4150 + 1;
    int _4154 = _4152 + 1;
    int _4156 = ~_4128;
    int _4158 = _4156 + _4146;
    int _4160 = _4158 + 1;
    float _4162 = fma(_3456, _3456, 1.0);
    bool _4164 = _3516 == 0;
    int _4166 = _4094 * _4154;
    bool _4168 = _3516 == 0;
    float _4170 = _4124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4172 = ~_4148;
    int _4174 = _4172 + 1;
    int _4176 = _4174 + 1;
    float _4178 = rsqrt(_4162);
    bool _4180 = !_4164;
    int _4182 = _4180 ? _4144 : (-1);
    float _4184 = _1420 + 0.5;
    bool _4186 = !_4168;
    int _4188 = _4186 ? _4160 : (-1);
    int _4190 = _4102 * _4176;
    float _4192 = float(_4182);
    float _4194 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4196 = float(_4188);
    bool _4198 = _1063 == 0;
    float _4200 = _1416 + (-0.5);
    float _4202 = fma(_4170, _4192, _2362);
    float _4204 = -_2500;
    float _4206 = fma(_4194, _4196, _4204);
    bool _4208 = !_4198;
    int _4210 = _4208 ? _2760 : (-1);
    bool _4212 = !_2634;
    int _4214 = _4212 ? _2788 : (-1);
    float _4216 = -_4194;
    float _4218 = fma(_4216, _4200, _4206);
    float _4220 = fma(_4170, _4184, _4202);
    int _4222 = _4210 * _4140;
    int _4224 = _4222 + _4166;
    float _4226 = _3456 * _4178;
    float _4228 = fma(_1416, _3910, _4218);
    int _4230 = _4214 * _4148;
    int _4232 = _4230 + _4190;
    float _4234 = sqrt(_4004);
    float _4236 = -_3494;
    float _4238 = _4226 * _4236;
    float _4240 = -_3496;
    float _4242 = _4226 * _4240;
    float _4244 = -_3492;
    float _4246 = _4226 * _4244;
    float _4248 = -_3932;
    float _4250 = fma(_1420, _4248, _4220);
    float _4252 = fma(_4178, _3440, _4238);
    float _4254 = fma(_4178, _3446, _4242);
    float _4256 = fma(_4178, _3444, _4246);
    float _4258 = _3492 + _3482;
    float _4260 = float(_4224);
    float _4262 = _3494 + _3522;
    float _4264 = float(_4232);
    float _4266 = _3496 + _3526;
    out.m_88.x = _4256;
    out.m_88.y = _4252;
    out.m_88.z = _4254;
    bool _4268 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4270 = isnan(_4234);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4276 = _4272 || _4274;
    out.m_90.x = _4260;
    out.m_90.w = _4264;
    out.m_92.x = _4250;
    out.m_92.y = _4228;
    out.m_94.x = _4258;
    out.m_94.y = _4262;
    out.m_94.z = _4266;
    float _4278 = _4252;
    if (!_4276)
    {
        _4014 = 1.0;
    }
    float _4280 = _4014;
    bool _4282 = !_4276;
    float _4284 = _4280;
    if (!_4282)
    {
        bool _4286 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4288 = isnan(_4234);
        bool _4290 = _4286 || _4288;
        bool _4292 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4294 = _4290 || _4292;
        if (!_4294)
        {
            float _4296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4298 = _4234 + _4296;
            float _4300 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4302 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4300;
            float _4304 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4306 = _4304 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4308 = 1.0 / _4302;
            float _4310 = _4298 * _4308;
            float _4312 = fma(_4310, _4306, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4284 = _4312;
            _4314 = true;
        }
        else
        {
            bool _4316 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4318 = isnan(_4234);
            bool _4320 = _4316 || _4318;
            bool _4322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4324 = _4320 || _4322;
            if (!_4324)
            {
                float _4326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4328 = _4234 + _4326;
                float _4330 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4332 = _4330 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4336 = _4334 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4338 = 1.0 / _4332;
                float _4340 = _4328 * _4338;
                float _4342 = fma(_4340, _4336, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4284 = _4342;
                _4314 = true;
            }
            else
            {
                _4284 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4314 = false;
    float _4344 = _4284;
    float _4346 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4348 = _3870 + _4346;
    float _4350 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4352 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4354 = _3876 + _4352;
    float _4356 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4358 = _3878 + _4356;
    float _4360 = fma(_4348, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4362 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4350);
    float _4364 = fma(_4354, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4366 = fma(_4358, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4368 = -_3122;
    float _4370 = _4368 + _4360;
    float _4372 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4362);
    float _4374 = -_3118;
    float _4376 = _4374 + _4364;
    float _4378 = -_3132;
    float _4380 = _4378 + _4366;
    float _4382 = _4370 * _4370;
    float _4384 = _4372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4386 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4388 = fma(_4376, _4376, _4382);
    float _4390 = 1.0 / _4384;
    float _4392 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4386);
    float _4394 = fma(_4380, _4380, _4388);
    float _4396 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4392);
    float _4398 = sqrt(_4394);
    float _4400 = _4396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4384;
    float _4404 = _4402 * _4390;
    float _4406 = _4404 * 0.5;
    bool _4408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4412 = _4408 || _4410;
    bool _4414 = isnan(0.5);
    bool _4416 = _4412 || _4414;
    bool _4418 = _4398 > 0.0;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4422 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4420);
    float _4424 = 1.0 / _4422;
    bool _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4428 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4430 = _4426 || _4428;
    bool _4432 = isnan(0.5);
    bool _4434 = _4430 || _4432;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4440 = _4390;
    float _4442 = _4422;
    if (!_4418)
    {
        _4436 = _4364;
    }
    float _4444 = _4436;
    float _4446 = _4444;
    if (!_4418)
    {
        _4438 = _4360;
    }
    float _4448 = _4438;
    float _4450 = _4448;
    float _4452 = _4448;
    if (!_4418)
    {
        _4440 = _4366;
    }
    float _4454 = _4440;
    bool _4456 = !_4418;
    float _4458 = _4454;
    float _4460 = _4454;
    if (!_4456)
    {
        float _4462 = _235 * _235;
        float _4464 = rsqrt(_4394);
        float _4466 = fma(_233, _233, _4462);
        float _4468 = fma(_237, _237, _4466);
        float _4470 = sqrt(_4468);
        float _4472 = _4376 * _4464;
        float _4474 = _4370 * _4464;
        float _4476 = _4380 * _4464;
        bool _4478 = _4470 > 0.0;
        float _4480 = _4470;
        _4278 = _4472;
        _4442 = _4464;
        if (!_4478)
        {
            _4480 = _4364;
        }
        float _4482 = _4480;
        _4446 = _4482;
        if (!_4478)
        {
            _4450 = _4360;
        }
        float _4484 = _4450;
        _4452 = _4484;
        if (!_4478)
        {
            _4458 = _4366;
        }
        float _4486 = _4458;
        bool _4488 = !_4478;
        _4460 = _4486;
        if (!_4488)
        {
            float _4490 = rsqrt(_4468);
            float _4492 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4494 = _235 * _4490;
            float _4496 = _233 * _4490;
            float _4498 = _237 * _4490;
            float _4500 = _4474 * _4494;
            float _4502 = fma(_4472, _4496, _4500);
            float _4504 = _4492 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4506 = fma(_4476, _4498, _4502);
            float _4508 = _4506 * _4504;
            float _4510 = fma(_233, _4508, _4364);
            float _4512 = fma(_235, _4508, _4360);
            float _4514 = fma(_237, _4508, _4366);
            _4452 = _4512;
            _4460 = _4514;
            _4446 = _4510;
            _4442 = _4506;
        }
    }
    float _4516 = _4452;
    float _4518 = _4460;
    float _4520 = _4446;
    float _4522 = _4278;
    float _4524 = _4442;
    float _4526 = _4524;
    float _4528 = _4516;
    float _4530 = _4520;
    float _4532 = _4518;
    float _4534 = _4522;
    if (_4434)
    {
        _4526 = 1.0;
    }
    float _4536 = _4526;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4424 * _4538;
    float _4542 = _4536;
    if (!_4416)
    {
        float _4544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4546 = _3122 + _4544;
        float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4550 = _3118 + _4548;
        float _4552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4554 = -_3122;
        float _4556 = _4554 + _4516;
        float _4558 = _4546 * _4546;
        float _4560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4562 = _3132 + _4560;
        float _4564 = fma(_4550, _4550, _4558);
        float _4566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4568 = fma(_4562, _4562, _4564);
        float _4570 = sqrt(_4568);
        float _4572 = _4552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4574 = precise::min(_4570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4576 = _4574 * _4566;
        float _4578 = -_3132;
        float _4580 = _4578 + _4518;
        float _4582 = _4572 * _4576;
        float _4584 = -_3118;
        float _4586 = _4584 + _4520;
        float _4588 = fma(_4556, _4582, _3122);
        float _4590 = fma(_4586, _4582, _3118);
        float _4592 = fma(_4580, _4582, _3132);
        _4528 = _4588;
        _4530 = _4590;
        _4532 = _4592;
    }
    float _4594 = _4528;
    float _4596 = _4530;
    float _4598 = _4532;
    if (!_4434)
    {
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4604 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4602;
        float _4606 = _4600 * 0.15915493667125701904296875;
        float _4608 = _4606 * 6.283185482025146484375;
        float _4610 = cos(_4608);
        float _4612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4614 = _4612 * 0.15915493667125701904296875;
        float _4616 = _4606 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = 1.0 / _4610;
        float _4622 = _4614 * 6.283185482025146484375;
        float _4624 = cos(_4622);
        float _4626 = _4618 * _4620;
        float _4628 = _4614 * 6.283185482025146484375;
        float _4630 = sin(_4628);
        float _4632 = _4624 * _4626;
        float _4634 = 1.0 / _4604;
        float _4636 = 1.0 / _4632;
        float _4638 = _4630 * _4636;
        float _4640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4642 = fma(_4540, _4638, _4640);
        float _4644 = _4642 * _4634;
        float _4646 = precise::clamp(_4644, 0.0, 1.0);
        _4542 = _4646;
    }
    float _4648 = _4542;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4652 = _4594 + _4650;
    float _4654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4656 = _4596 + _4654;
    float _4658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4660 = _4598 + _4658;
    float _4662 = _4652 * _4652;
    float _4664 = fma(_4656, _4656, _4662);
    float _4666 = fma(_4660, _4660, _4664);
    float _4668 = rsqrt(_4666);
    float _4670 = sqrt(_4666);
    float _4672 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4674 = _4656 * _4672;
    float _4676 = _4660 * _4672;
    float _4678 = _4674 * _4674;
    float _4680 = _4676 * _4676;
    float _4682 = _4678 + _4680;
    float _4684 = sqrt(_4682);
    bool _4686 = _4684 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4690 = _4684 + _4688;
    float _4692 = _4668;
    float _4694 = _4682;
    float _4696 = _4690;
    float _4698 = _4652;
    if (_4686)
    {
        float _4700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4692 = _4700;
    }
    float _4702 = _4692;
    if (_4686)
    {
        float _4704 = rsqrt(_4682);
        _4694 = _4704;
    }
    float _4706 = _4694;
    float _4708 = _4706;
    if (_4686)
    {
        float _4710 = _4690 * _4702;
        _4696 = _4710;
    }
    float _4712 = _4696;
    if (_4686)
    {
        float _4714 = _4712 * 0.15915493667125701904296875;
        _4534 = _4714;
    }
    float _4716 = _4534;
    float _4718 = _4660;
    if (_4686)
    {
        float _4720 = _4716 * 6.283185482025146484375;
        float _4722 = sin(_4720);
        _4718 = _4722;
    }
    float _4724 = _4718;
    float _4726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4728 = precise::max(0.0, _4726);
    float _4730 = _4702;
    if (_4686)
    {
        float _4732 = _4716 * 6.283185482025146484375;
        float _4734 = cos(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = -_4672;
    float _4740 = -_4728;
    float _4742 = fma(_4652, _4738, _4740);
    float _4744 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4686)
    {
        float _4746 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4698 = _4746;
    }
    float _4748 = _4698;
    float _4750 = fma(_3118, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4752 = _4748;
    if (!_4686)
    {
        _4744 = _4742;
    }
    float _4754 = _4744;
    float _4756 = _4724;
    float _4758 = _4754;
    if (_4686)
    {
        float _4760 = fma(_4724, _4748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4752 = _4760;
    }
    float _4762 = _4752;
    float _4764 = _4762;
    if (!_4686)
    {
        _4756 = _4674;
    }
    float _4766 = _4756;
    float _4768 = floor(_4750);
    float _4770 = _4766;
    float _4772 = _4736;
    if (_4686)
    {
        float _4774 = _4736 + (-1.0);
        _3680 = _4774;
    }
    float _4776 = _3680;
    float _4778 = _4776;
    if (_4686)
    {
        float _4780 = _4706 * _4762;
        _3682 = _4780;
    }
    float _4782 = _3682;
    if (!_4686)
    {
        _4764 = _4678;
    }
    float _4784 = _4764;
    float _4786 = _4784;
    if (_4686)
    {
        float _4788 = _4776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4788;
    }
    float _4790 = _4708;
    if (_4686)
    {
        float _4792 = _4674 * _4782;
        _4770 = _4792;
    }
    float _4794 = _4770;
    if (!_4686)
    {
        _4778 = _4676;
    }
    float _4796 = _4778;
    float _4798 = _4796;
    if (_4686)
    {
        float _4800 = _4676 * _4782;
        _4798 = _4800;
    }
    float _4802 = _4798;
    if (_4686)
    {
        float _4804 = fma(_4742, _4736, _4790);
        _4758 = _4804;
    }
    float _4806 = _4758;
    if (_4686)
    {
        float _4808 = _4794 * _4794;
        _4786 = _4808;
    }
    float _4810 = _4786;
    if (!_4686)
    {
        _4772 = _4680;
    }
    float _4812 = _4772;
    float _4814 = _4812;
    if (_4686)
    {
        float _4816 = _4802 * _4802;
        _4814 = _4816;
    }
    float _4818 = _4814;
    float _4820 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4822 = fma(_4806, _4806, _4810);
    float _4824 = -_4768;
    float _4826 = _4750 + _4824;
    float _4828 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4820);
    float _4830 = _4822 + _4818;
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4828);
    float _4840 = rsqrt(_4830);
    float _4842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4844 = _4838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4846 = -_4836;
    float _4848 = _4846 + 1.0;
    float _4850 = fma(_3132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4852 = _4844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4856 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = abs(_4848);
    float _4860 = log2(_4858);
    float _4862 = -_4852;
    float _4864 = fma(_4862, _4842, 1.0);
    float _4866 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4868 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4870 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4854);
    float _4872 = _4840 * _4794;
    float _4874 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4866);
    float _4876 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4868);
    float _4878 = _4840 * _4806;
    float _4880 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4882 = _4840 * _4802;
    float _4884 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4888 = -_4880;
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4888);
    float _4892 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4870);
    float _4894 = _4884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4896 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = -_4882;
    float _4900 = fma(_4898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4890);
    float _4902 = floor(_4850);
    float _4904 = _4892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4906 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = fma(_4900, -0.5, 0.5);
    float _4910 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4912 = fma(_4900, 0.5, 0.5);
    float _4914 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4916 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4918 = sqrt(_4908);
    float _4920 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4914);
    float _4922 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4924 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4916);
    float _4926 = fma(_4912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4928 = _4878 + 1.0;
    float _4930 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4922);
    float _4932 = -_4902;
    float _4934 = _4850 + _4932;
    float _4936 = exp2(_4910);
    float _4938 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4940 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4930);
    float _4942 = fma(_4912, _4926, -0.212114393711090087890625);
    float _4944 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4938);
    float _4946 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4940);
    float _4948 = fma(_4912, _4942, 1.570728778839111328125);
    float _4950 = 1.0 / _4920;
    float _4952 = _4918 * 0.636619746685028076171875;
    float _4954 = log2(_4864);
    float _4956 = -_4878;
    float _4958 = fma(_4936, _4928, _4956);
    float _4960 = fma(_4958, 0.5, 0.5);
    float _4962 = _4944 * _4950;
    float _4964 = _4946 * _4950;
    float _4966 = -_4948;
    float _4968 = fma(_4952, _4966, 1.0);
    float2 _12755 = float2(_4826, _4934);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12755, float2(0.0), isnan(_12755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12755, float2(0.0), isnan(_12755)), level(0.0)).x;
    float _4972 = fma(_4962, 0.5, 0.5);
    float _4974 = fma(_4964, -0.5, 0.5);
    float _4976 = _4954 * 0.693147182464599609375;
    float _4978 = _4976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12777 = float3(_4972, _4974, _4978);
    float _4980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12777, float3(0.0), isnan(_12777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12777, float3(0.0), isnan(_12777)), level(0.0)).x;
    float3 _12788 = float3(_4972, _4974, _4978);
    float4 _4983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12788, float3(0.0), isnan(_12788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12788, float3(0.0), isnan(_12788)), level(0.0)).xyzw;
    float _4985 = _4983.x;
    float _4987 = _4983.y;
    float _4989 = _4983.z;
    float _4991 = _4983.w;
    float2 _12804 = float2(_4968, _4960);
    float3 _4995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4997 = _4995.x;
    float _4999 = _4995.y;
    float _5001 = _4995.z;
    float _5003 = abs(_4540);
    float _5005 = log2(_5003);
    out.m_96.x = _4596;
    out.m_96.y = _4594;
    out.m_96.z = _4598;
    bool _5007 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5009 = isnan(_4670);
    bool _5011 = _5007 || _5009;
    bool _5013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5015 = _5011 || _5013;
    float _5017 = _5005 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = exp2(_5017);
    float _5021 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5023 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5021);
    float _5025 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5023);
    float _5027 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5025);
    float _5029 = in.m_98.x;
    float _5031 = fma(_5019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5033 = precise::clamp(_5031, 0.0, 1.0);
    float _5035 = _5027 + _4920;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4946;
    out.gl_Position.z = _5027;
    out.gl_Position.w = _4920;
    float _5037 = fma(_5033, -2.0, 3.0);
    float _5039 = _5033 * _5033;
    float _5041 = _5035 * 0.5;
    float _5043 = _5039 * _5037;
    float _5045 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5047 = _4540 <= 8000.0;
    bool _5049 = isnan(_4540);
    bool _5051 = _5047 || _5049;
    bool _5053 = isnan(8000.0);
    bool _5055 = _5051 || _5053;
    float _5057 = float(_5055);
    float _5059 = _4944 + _4920;
    float _5061 = -_5043;
    float _5063 = _5061 + 1.0;
    float _5065 = exp2(_5045);
    float _5067 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5043);
    float _5069 = _4920 * 0.5;
    float _5071 = _5059 * 0.5;
    float _5073 = _5057 * _5067;
    float _5075 = fma(_4946, -0.5, _5069);
    float _5077 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5079 = _4920;
    float _5081 = _5027;
    float _5083 = _4946;
    float _5085 = _4944;
    if (!_5015)
    {
        _5079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5087 = _5079;
    out.m_100.x = _5071;
    out.m_100.y = _5075;
    out.m_100.z = _5041;
    out.m_100.w = _4920;
    float _5089 = _5087;
    float _5091 = _5087;
    if (!_5015)
    {
        _5081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5081;
    float _5095 = _5093;
    float _5097 = _5093;
    if (!_5015)
    {
        _5083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5099 = _5083;
    float _5101 = -_5065;
    float _5103 = _5101 + 1.0;
    float _5105 = _5099;
    float _5107 = _5099;
    if (!_5015)
    {
        _5085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5109 = _5085;
    float _5111 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5113 = -_4970;
    float _5115 = _5113 + 1.0;
    float _5117 = _5115 * _5077;
    float _5119 = precise::clamp(_5117, 0.0, 1.0);
    float _5121 = -_5119;
    float _5123 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5125 = _5111 * _4980;
    float _5127 = _5123 * _5029;
    float _5129 = -_5111;
    float _5131 = _5129 + 1.0;
    float _5133 = _4991 * _5125;
    float _5135 = _5001 * _5125;
    float _5137 = _4991 * _5131;
    float _5139 = fma(_4997, _5133, _4985);
    float _5141 = fma(_4999, _5133, _4987);
    float _5143 = _5127 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5145 = fma(_4991, _5135, _4989);
    float _5147 = _4648 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5149 = _5127;
    float _5151 = _5133;
    float _5153 = _5109;
    float _5155 = _5109;
    if (!_5015)
    {
        _5149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5157 = _5149;
    out.m_102.x = _5143;
    float _5159 = _5157;
    float _5161 = _5157;
    if (!_5015)
    {
        _5151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5163 = _5151;
    out.m_104.x = _5139;
    out.m_104.y = _5141;
    out.m_104.z = _5145;
    out.m_104.w = _5137;
    bool _5165 = !_5015;
    float _5167 = _5163;
    float _5169 = _5163;
    if (!_5165)
    {
        bool _5171 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5173 = isnan(_4670);
        bool _5175 = _5171 || _5173;
        bool _5177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5179 = _5175 || _5177;
        if (!_5179)
        {
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5183 = _4670 + _5181;
            float _5185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5185;
            float _5189 = 1.0 / _5187;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5205 = _5203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5211 = _5183 * _5189;
            float _5213 = precise::clamp(_5211, 0.0, 1.0);
            float _5215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5217 = _5215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5219 = fma(_5213, _5193, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5221 = fma(_5213, _5217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5223 = fma(_5213, _5197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5225 = fma(_5213, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5227 = fma(_5213, _5205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5229 = fma(_5213, _5209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5221;
            _5155 = _5227;
            _5161 = _5219;
            _5107 = _5225;
            _5097 = _5223;
            _5169 = _5229;
            _5231 = true;
        }
        else
        {
            bool _5233 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5235 = isnan(_4670);
            bool _5237 = _5233 || _5235;
            bool _5239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5241 = _5237 || _5239;
            if (!_5241)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5243 = _5159;
            _5161 = _5243;
            if (!_5241)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5245 = _5089;
            _5091 = _5245;
            if (!_5241)
            {
                _5095 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5247 = _5095;
            _5097 = _5247;
            if (!_5241)
            {
                _5105 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5249 = _5105;
            _5107 = _5249;
            if (!_5241)
            {
                _5153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5251 = _5153;
            _5155 = _5251;
            if (!_5241)
            {
                _5167 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5253 = _5167;
            bool _5255 = !_5241;
            _5169 = _5253;
            if (!_5255)
            {
                bool _5257 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5259 = isnan(_4670);
                bool _5261 = _5257 || _5259;
                bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5265 = _5261 || _5263;
                if (!_5265)
                {
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5269 = _4670 + _5267;
                    float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5271;
                    float _5275 = 1.0 / _5273;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5297 = _5269 * _5275;
                    float _5299 = precise::clamp(_5297, 0.0, 1.0);
                    float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5307;
                    _5155 = _5313;
                    _5161 = _5305;
                    _5107 = _5311;
                    _5097 = _5309;
                    _5169 = _5315;
                    _5231 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5107 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5097 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5169 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5231 = false;
    float _5317 = _5091;
    float _5319 = _5155;
    float _5321 = _5161;
    float _5323 = _5107;
    float _5325 = _5097;
    float _5327 = _5169;
    float _5329 = fma(_4262, -0.5, 0.5);
    float _5331 = precise::clamp(_5329, 0.0, 1.0);
    float _5333 = -_5317;
    float _5335 = _5333 + _5319;
    float _5337 = _5147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5339 = -_5321;
    float _5341 = _5339 + _5323;
    out.m_106.x = 0.0;
    float _5343 = fma(_5331, _5335, _5317);
    float _5345 = fma(_5331, _5341, _5321);
    out.m_55.x = _5337;
    float _5347 = -_5325;
    float _5349 = _5347 + _5327;
    float _5351 = _5343 * 0.586610972881317138671875;
    bool _5353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5355 = fma(_5331, _5349, _5325);
    float _5357 = fma(_5345, 0.298911988735198974609375, _5351);
    bool _5359 = _4648 > 0.0;
    bool _5361 = isnan(_4648);
    bool _5363 = _5359 || _5361;
    bool _5365 = isnan(0.0);
    bool _5367 = _5363 || _5365;
    float _5369 = fma(_5355, 0.114477999508380889892578125, _5357);
    float _5371 = -_5369;
    float _5373 = _5345 + _5371;
    float _5375 = -_5369;
    float _5377 = _5343 + _5375;
    float _5379 = -_5369;
    float _5381 = _5355 + _5379;
    float _5383 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5385 = fma(_5377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5387 = fma(_5381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    bool _5389 = !_5353;
    if (!_5389)
    {
        float _5391 = -_4594;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5395 = -_4596;
        float _5397 = _5395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5399 = -_4598;
        float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5403 = _5393 * _5393;
        float _5405 = fma(_5397, _5397, _5403);
        float _5407 = fma(_5401, _5401, _5405);
        float _5409 = sqrt(_5407);
        float _5411 = rsqrt(_5407);
        float _5413 = -_5409;
        float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5417 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5419 = precise::clamp(_5417, 0.0, 1.0);
        float _5421 = _5397 * _5411;
        float _5423 = _5393 * _5411;
        float _5425 = abs(_5419);
        float _5427 = log2(_5425);
        float _5429 = _5401 * _5411;
        float _5431 = _5421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5433 = _4262 * _5423;
        float _5435 = -_5423;
        float _5437 = -_5431;
        float _5439 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5437);
        float _5441 = fma(_4258, _5421, _5433);
        float _5443 = -_5429;
        float _5445 = fma(_5443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5439);
        float _5447 = fma(_4266, _5429, _5441);
        float _5449 = precise::clamp(_5447, 0.0, 1.0);
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5453 = _5445 + _5451;
        float _5455 = _5427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5457 = _5453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5459 = precise::clamp(_5457, 0.0, 1.0);
        float _5461 = exp2(_5455);
        float _5463 = _5461 * _5459;
        float _5465 = _5449 * _5463;
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5469 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5471 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5467;
        out.m_106.y = _5469;
        out.m_106.z = _5471;
    }
    out.m_108.x = _5383;
    out.m_108.y = _5385;
    out.m_108.z = _5387;
    if (_5367)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5473;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5231 = false;
    bool _4314 = false;
    bool _735 = false;
    bool _561 = false;
    bool _455 = false;
    bool _267 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _122 = in.m_48.w;
    float _124 = in.m_50.w;
    float _126 = trunc(_122);
    int _129 = int(_126);
    float _131 = -_124;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _133;
    bool _137 = _129 >= 1;
    float _139 = 0.0;
    float _141 = _124;
    float _143 = _133;
    if (!_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _139;
    if (!_137)
    {
        out.m_55.x = 0.0;
    }
    int _147 = 0;
    if (!_137)
    {
        float _149 = _145 * 5.0;
        _147 = as_type<int>(_149);
    }
    int _151 = _147;
    int _153 = _151;
    if (!_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5541 = as_type<float>(_151);
        out.gl_Position.z = _5541;
    }
    if (!_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _155 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _157 = isnan(_124);
    bool _159 = _155 || _157;
    bool _161 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _163 = _159 || _161;
    float _165 = float(_129);
    bool _167 = _133 >= _165;
    bool _169 = !_163;
    bool _171 = _167 || _169;
    float _173 = 1.0 / _165;
    if (_171)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _175 = _141;
    if (_171)
    {
        out.m_55.x = 0.0;
    }
    float _177 = _133 * _173;
    float _179 = _177;
    if (_171)
    {
        float _181 = _175 * 5.0;
        _153 = as_type<int>(_181);
    }
    int _183 = _153;
    out.m_53.x = _177;
    if (_171)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5604 = as_type<float>(_183);
        out.gl_Position.z = _5604;
    }
    if (_171)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _185 = as_type<float>(int(gl_VertexIndex));
    float _187 = in.m_60.x;
    float _189 = in.m_60.y;
    float _191 = in.m_60.z;
    float _193 = in.m_62.x;
    float _195 = in.m_62.y;
    float _197 = in.m_62.z;
    float _199 = in.m_64.x;
    float _201 = in.m_64.y;
    float _203 = in.m_64.z;
    float _205 = in.m_66.x;
    float _207 = in.m_66.y;
    float _209 = in.m_66.z;
    int _211 = as_type<int>(_185) & 1;
    bool _213 = _211 != 0;
    int _215 = as_type<int>(_185) & 2;
    bool _217 = _215 != 0;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = _189 * _195;
    float _223 = _189 * _201;
    float _225 = fma(_187, _193, _221);
    float _227 = _189 * _207;
    float _229 = fma(_187, _199, _223);
    float _231 = fma(_187, _205, _227);
    float _233 = fma(_191, _197, _225);
    float _235 = fma(_191, _203, _229);
    float _237 = fma(_191, _209, _231);
    bool _239 = !_213;
    float _241 = _239 ? (-0.5) : 0.5;
    bool _243 = !_217;
    float _245 = _243 ? (-0.5) : 0.5;
    bool _247 = !_219;
    float _265;
    if (!_247)
    {
        float _249 = in.m_68.x;
        float _251 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _253 = _249 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _255 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _257 = _255 * _251;
        float _259 = floor(_257);
        float _261 = -_259;
        float _263 = _257 + _261;
        _265 = _263;
        _267 = true;
    }
    else
    {
        _265 = _177;
    }
    _267 = false;
    float _269 = _265;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = _269 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = _269 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _269 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _289 = _287 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _291;
    bool _295 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _297 = isnan(_269);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = 1.0 / _289;
    bool _309 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _311 = 1.0 / _285;
    float _313 = 1.0 / _293;
    float _315 = _281 * _307;
    bool _317 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _319 = isnan(_269);
    bool _321 = _317 || _319;
    bool _323 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _325 = _321 || _323;
    float _327 = float(_325);
    float _329 = _273 * _311;
    bool _331 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _333 = isnan(_269);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_305;
    float _345 = _343 + 1.0;
    float _347 = _341 * _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _353 = _277 * _313;
    bool _355 = _269 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _357 = isnan(_269);
    bool _359 = _355 || _357;
    bool _361 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _363 = _359 || _361;
    float _365 = float(_363);
    float _367 = -_341;
    float _369 = _367 + 1.0;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _371;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = _365 * _369;
    float _385 = -_365;
    float _387 = _385 + 1.0;
    float _389 = fma(_373, _329, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _391 = fma(_377, _329, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = _327 * _387;
    float _395 = -_327;
    float _397 = _395 + 1.0;
    float _399 = fma(_351, _315, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _401 = _389 * _393;
    float _403 = _391 * _393;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _405;
    float _409 = fma(_381, _315, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _401);
    float _417 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _403);
    float _419 = fma(_407, _353, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _353, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_399, _383, _415);
    float _425 = fma(_409, _383, _417);
    float _427 = fma(_419, _347, _423);
    float _429 = fma(_421, _347, _425);
    float _431 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    bool _435 = !_309;
    float _453;
    if (!_435)
    {
        float _437 = in.m_68.x;
        float _439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _441 = _437 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _443 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _445 = _443 * _439;
        float _447 = floor(_445);
        float _449 = -_447;
        float _451 = _445 + _449;
        _453 = _451;
        _455 = true;
    }
    else
    {
        _453 = _177;
    }
    _455 = false;
    float _457 = _453;
    bool _459 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _461 = isnan(_457);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _475 = _457 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _477 = isnan(_457);
    bool _479 = _475 || _477;
    bool _481 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _483 = _479 || _481;
    float _485 = float(_483);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _493 = _457 + _491;
    float _495 = -_469;
    float _497 = _495 + 1.0;
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _501 = 1.0 / _473;
    float _503 = _485 * _497;
    float _505 = -_485;
    float _507 = _505 + 1.0;
    float _509 = _489 * _501;
    float _511 = fma(_509, _493, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _511 * _503;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _523 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = in.m_70.x;
    float _527 = in.m_70.y;
    float _529 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[116].x, _521);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _533 = _529 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_72.x = _523;
    out.m_72.y = _519;
    out.m_72.z = _535;
    out.m_72.w = _533;
    float _537 = _433 * _527;
    float _539 = _431 * _525;
    bool _541 = !_499;
    float _559;
    if (!_541)
    {
        float _543 = in.m_68.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _177;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _593 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _595 = isnan(_563);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    float _605 = 1.0 / _571;
    float _607 = -_583;
    float _609 = _607 + 1.0;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    bool _615 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _617 = isnan(_563);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = _603 * _609;
    float _629 = -_603;
    float _631 = _629 + 1.0;
    bool _633 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _635 = 1.0 / _587;
    float _637 = _625 * _631;
    float _639 = -_625;
    float _641 = _639 + 1.0;
    float _643 = 1.0 / _591;
    float _645 = _613 * _605;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _651 = fma(_645, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _653 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _655 = isnan(_563);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _649 * _635;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _563 + _671;
    float _675 = _651 * _637;
    float _677 = -_663;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _563 + _681;
    float _685 = fma(_665, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _689 = _669 * _643;
    float _691 = _583 * _679;
    float _693 = fma(_685, _627, _687);
    float _695 = fma(_689, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = fma(_695, _691, _693);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _705 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[134].x, _697);
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_74.x = _707;
    out.m_74.y = _709;
    out.m_74.z = _711;
    out.m_74.w = _713;
    bool _715 = !_633;
    float _733;
    if (!_715)
    {
        float _717 = in.m_68.x;
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _721 = _717 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[14].x, _133);
        float _725 = _723 * _719;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = true;
    }
    else
    {
        _733 = _177;
    }
    _735 = false;
    float _737 = _733;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _741 = _737 + _739;
    bool _743 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_737);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _759 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _761 = isnan(_737);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _771;
    bool _775 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _777 = isnan(_737);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -_753;
    float _789 = _787 + 1.0;
    float _791 = 1.0 / _757;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _797 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _799 = 1.0 / _795;
    float _801 = _773 * _791;
    float _803 = _769 * _789;
    float _805 = -_769;
    float _807 = _805 + 1.0;
    bool _809 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _811 = isnan(_737);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_785;
    float _823 = _821 + 1.0;
    float _825 = fma(_801, _741, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _827 = _785 * _807;
    bool _829 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _831 = isnan(_737);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = _819 * _823;
    float _843 = -_819;
    float _845 = _843 + 1.0;
    bool _847 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _849 = isnan(_737);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _863 = _839 * _845;
    float _865 = -_839;
    float _867 = _865 + 1.0;
    bool _869 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _871 = isnan(_737);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = -_857;
    float _883 = _881 + 1.0;
    float _885 = 1.0 / _861;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _891 = _857 * _867;
    float _893 = _879 * _883;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _899 = -_879;
    float _901 = _899 + 1.0;
    float _903 = _825 * _893;
    float _905 = 1.0 / _889;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _909 = _907 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _911;
    float _915 = fma(_901, (*spvDescriptorSet0.vp_c9)._m0[159].x, _903);
    float _917 = _909 * _799;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = 1.0 / _897;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _927 = _737 + _925;
    float _929 = _913 * _885;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _933 = _931 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _935 = fma(_917, _927, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _939 = _737 + _937;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _945 = _943 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _947 = fma(_929, _939, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _949 = fma(_935, _891, _915);
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _953 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _951;
    float _955 = _945 * _905;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _959 = _737 + _957;
    float _961 = fma(_947, _863, _949);
    float _963 = 1.0 / _933;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _969 = _953 * _923;
    float _971 = fma(_955, _959, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _973 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _975 = _737 + _973;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _977;
    float _981 = _967 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _985 = _737 + _983;
    bool _987 = _737 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_737);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_971, _841, _961);
    float _1001 = fma(_981, _975, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1003 = fma(_969, _985, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1007 = _737 + _1005;
    float _1009 = -_997;
    float _1011 = _1009 + 1.0;
    float _1013 = _979 * _963;
    float _1015 = fma(_1003, _827, _999);
    float _1017 = _753 * _1011;
    float _1019 = fma(_1013, _1007, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1021 = fma(_1001, _803, _1015);
    float _1023 = fma(_1019, _1017, _1021);
    float _1025 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1023);
    out.m_76.x = _1025;
    bool _1027 = !_797;
    float _1029 = _963;
    float _1031 = _841;
    if (!_1027)
    {
        float _1033 = in.m_68.x;
        float _1035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1037 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1039 = fma(_1037, (*spvDescriptorSet0.vp_c9)._m0[14].y, _133);
        float _1041 = _1039 * _1035;
        float _1043 = floor(_1041);
        float _1045 = -_1043;
        float _1047 = _1041 + _1045;
        _179 = _1047;
    }
    float _1049 = _179;
    float _1051 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1053 = int(_1051);
    float _1055 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1057 = int(_1055);
    float _1059 = float(_1053);
    float _1061 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1063 = int(_1061);
    float _1065 = float(_1057);
    float _1067 = 1.0 / _1059;
    float _1069 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1071 = int(_1069);
    float _1073 = float(uint(_1063));
    float _1075 = 1.0 / _1065;
    float _1077 = _1067 * _133;
    float _1079 = 1.0 / _1073;
    float _1081 = float(uint(_1071));
    int _1083 = ~_1071;
    int _1085 = _1083 + 1;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1089 = _1087 != 0;
    float _1091 = trunc(_1077);
    int _1093 = int(_1091);
    float _1095 = _1075 * _133;
    float _1097 = 1.0 / _1081;
    int _1099 = as_type<int>(_1079) + (-2);
    int _1101 = ~_1063;
    int _1103 = _1101 + 1;
    float _1105 = 0.0;
    if (_1089)
    {
        _1105 = 1.0;
    }
    float _1107 = _1105;
    float _1109 = trunc(_1095);
    int _1111 = int(_1109);
    float _1113 = float(uint(_1093));
    float _1115 = as_type<float>(_1099) * _1113;
    int _1117 = as_type<int>(_1097) + (-2);
    float _1119 = trunc(_1115);
    float _1121 = precise::max(_1119, 0.0);
    uint _1124 = uint(_1121);
    float _1126 = float(uint(_1111));
    float _1128 = as_type<float>(_1117) * _1126;
    float _1130 = _1126;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1134 = as_type<int>(_1128);
    float _1136 = _1107;
    if (_1089)
    {
        float _1138 = in.m_68.x;
        float _1140 = in.m_68.y;
        _1130 = _1138;
        _1132 = _1140;
    }
    float _1142 = _1130;
    float _1144 = _1132;
    float _1146 = trunc(_1128);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = _1103 * int(_1124);
    int _1154 = _1152 + _1093;
    float _1156 = float(uint(_1154));
    float _1158 = as_type<float>(_1154);
    if (_1089)
    {
        _1158 = 1.0;
    }
    float _1160 = _1158;
    float _1162 = _1160;
    if (_1089)
    {
        _1134 = 0;
    }
    int _1164 = _1134;
    float _1166 = as_type<float>(_1099) * _1156;
    float _1168 = trunc(_1166);
    float _1170 = precise::max(_1168, 0.0);
    uint _1172 = uint(_1170);
    int _1174 = _1085 * int(_1150);
    int _1176 = _1174 + _1111;
    float _1178 = float(uint(_1176));
    float _1180 = 0.0;
    int _1182 = as_type<int>(_1178);
    float _1184 = _1166;
    float _1186 = _1142;
    float _1188 = _1144;
    int _1190 = _1164;
    if (_1089)
    {
        _1180 = _1142;
    }
    float _1192 = _1180;
    float _1194 = _1192;
    if (_1089)
    {
        _1029 = _1144;
    }
    float _1196 = _1029;
    float _1198 = as_type<float>(_1117) * _1178;
    float _1200 = _1196;
    if (_1089)
    {
        _1182 = 0;
    }
    int _1202 = _1182;
    int _1204 = _1202;
    if (_1089)
    {
        _1031 = _1192;
    }
    float _1206 = _1031;
    float _1208 = trunc(_1198);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = _1206;
    if (_1089)
    {
        _1184 = _1192;
    }
    float _1216 = _1184;
    float _1218 = _1216;
    if (!_1089)
    {
        float _1220 = in.m_68.x;
        float _1222 = in.m_68.y;
        float _1224 = in.m_68.z;
        float _1226 = _1220 * 3.1415927410125732421875;
        float _1228 = _1226 * 0.15915493667125701904296875;
        float _1230 = _1222 * 3.1415927410125732421875;
        float _1232 = _1230 * 0.15915493667125701904296875;
        float _1234 = _1228 * 6.283185482025146484375;
        float _1236 = sin(_1234);
        float _1238 = _1232 * 6.283185482025146484375;
        float _1240 = sin(_1238);
        _1136 = 7.345489978790283203125;
        _1186 = _1220;
        _1162 = 5.839270114898681640625;
        _1218 = _1224;
        _1194 = _1222;
        _1188 = _1222;
        _1200 = _1240;
        _1214 = _1236;
        _1204 = 1;
        _1190 = 2;
    }
    float _1242 = _1136;
    float _1244 = _1186;
    float _1246 = _1162;
    float _1248 = _1218;
    float _1250 = _1194;
    float _1252 = _1188;
    float _1254 = _1200;
    float _1256 = _1214;
    int _1258 = _1204;
    int _1260 = _1190;
    float _1262 = _1242 * _1244;
    int _1264 = int(_1124) + int(_1172);
    float _1266 = _1246 * _1248;
    int _1268 = ~_1063;
    int _1270 = _1268 + 1;
    float _1272 = floor(_1262);
    int _1274 = int(_1150) + int(_1212);
    float _1276 = in.m_68.z;
    float _1278 = in.m_68.w;
    float _1280 = _173 * _133;
    int _1282 = ~_1071;
    int _1284 = _1282 + 1;
    float _1286 = _1242 * _1250;
    float _1288 = float(_1063);
    float _1290 = floor(_1266);
    int _1292 = _1270 * _1264;
    int _1294 = _1292 + _1093;
    int _1296 = _1284 * _1274;
    int _1298 = _1296 + _1111;
    float _1300 = _1252 * 2.0;
    bool _1302 = uint(_1294) >= uint(_1063);
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1306 = _1049 + _1304;
    float _1308 = -_1272;
    float _1310 = _1262 + _1308;
    bool _1312 = uint(_1298) >= uint(_1071);
    float _1314 = floor(_1286);
    bool _1316 = !_1302;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1322 = _1320 != 0;
    int _1324 = ~_1264;
    int _1326 = _1324 + _1318;
    int _1328 = _1326 + 1;
    float _1330 = -_1290;
    float _1332 = _1266 + _1330;
    float _1334 = _1310 * _1288;
    bool _1336 = !_1312;
    int _1338 = _1336 ? 0 : (-1);
    float _1340 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1342 = log2(_1340);
    bool _1344 = !_1322;
    int _1346 = _1344 ? 0 : 1;
    int _1348 = _1063 * _1328;
    int _1350 = _1348 + _1093;
    bool _1352 = _1276 > 0.5;
    bool _1354 = _1252 > 0.5;
    float _1356 = float(_1093);
    float _1358 = trunc(_1334);
    int _1360 = int(_1358);
    int _1362 = ~_1274;
    int _1364 = _1362 + _1338;
    int _1366 = _1364 + 1;
    float _1368 = -_1314;
    float _1370 = _1286 + _1368;
    int _1372 = abs(_1346);
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1380 = _1378 != 0;
    int _1382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1384 = _1382 != 0;
    int _1386 = _1071 * _1366;
    int _1388 = _1386 + _1111;
    float _1390 = -_245;
    int _1392 = _1352 ? as_type<int>(_1390) : as_type<int>(_245);
    float _1394 = floor(_1300);
    float _1396 = -_241;
    int _1398 = _1354 ? as_type<int>(_1396) : as_type<int>(_241);
    bool _1400 = _1356 >= _1288;
    bool _1402 = isnan(_1356);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan(_1288);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1288 * _1280;
    bool _1414 = !_1384;
    float _1416 = _1414 ? _245 : as_type<float>(_1392);
    bool _1418 = !_1380;
    float _1420 = _1418 ? _241 : as_type<float>(_1398);
    float _1422 = trunc(_1410);
    int _1424 = int(_1422);
    float _1426 = float(_1071);
    int _1428 = _1360 * _1372;
    int _1430 = _1428 + _1093;
    float _1432 = float(_1111);
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1444 = _1442 != 0;
    int _1446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1448 = _1446 != 0;
    float _1450 = trunc(_1412);
    int _1452 = int(_1450);
    bool _1454 = _1432 >= _1426;
    bool _1456 = isnan(_1432);
    bool _1458 = _1454 || _1456;
    bool _1460 = isnan(_1426);
    bool _1462 = _1458 || _1460;
    float _1464 = float(_1462);
    bool _1466 = !_1440;
    int _1468 = _1466 ? 0 : 1;
    bool _1470 = !_1436;
    int _1472 = _1470 ? 0 : 1;
    bool _1474 = !_1444;
    int _1476 = _1474 ? 0 : 1;
    float _1478 = trunc(_1464);
    int _1480 = int(_1478);
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1484 = _1482 != 0;
    int _1486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1488 = _1486 != 0;
    int _1490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1492 = _1490 != 0;
    bool _1494 = !_1448;
    int _1496 = _1494 ? 0 : 1;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1500 = _1498 != 0;
    bool _1502 = !_1484;
    int _1504 = _1502 ? 0 : 1;
    bool _1506 = _1063 == 0;
    int _1508 = ~_1424;
    int _1510 = _1508 + 1;
    int _1512 = _1510 + 1;
    bool _1514 = !_1506;
    int _1516 = _1514 ? _1350 : (-1);
    float _1518 = _1332 * _1426;
    bool _1520 = !_1488;
    int _1522 = _1520 ? 0 : 1;
    int _1524 = _1516 * _1512;
    int _1526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1528 = _1526 != 0;
    float _1530 = _1426 * _1280;
    int _1532 = _1063 + (-1);
    float _1534 = trunc(_1518);
    int _1536 = int(_1534);
    bool _1538 = !_1528;
    int _1540 = _1538 ? 0 : 1;
    bool _1542 = _1071 == 0;
    int _1544 = _1424 * _1532;
    int _1546 = _1544 + _1524;
    int _1548 = ~_1480;
    int _1550 = _1548 + 1;
    int _1552 = _1550 + 1;
    float _1554 = as_type<float>(_1424);
    float _1556 = as_type<float>(_1480);
    float _1558 = _1250;
    float _1560 = _1254;
    if (_1500)
    {
        float _1562 = in.m_68.w;
        _1554 = _1562;
    }
    float _1564 = _1554;
    bool _1566 = !_1542;
    int _1568 = _1566 ? _1388 : (-1);
    float _1570 = trunc(_1530);
    int _1572 = int(_1570);
    int _1574 = abs(_1468);
    int _1576 = _1071 + (-1);
    int _1578 = _1568 * _1552;
    int _1580 = abs(_1472);
    int _1582 = _1480 * _1576;
    int _1584 = _1582 + _1578;
    int _1586 = abs(_1522);
    int _1588 = abs(_1504);
    int _1590 = _1546 * _1574;
    int _1592 = _1584 * _1586;
    int _1594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1596 = _1594 != 0;
    int _1598 = _1452 * _1580;
    int _1600 = _1598 + _1590;
    int _1602 = abs(_1476);
    int _1604 = _1572 * _1588;
    int _1606 = _1604 + _1592;
    bool _1608 = !_1492;
    int _1610 = _1608 ? 0 : 1;
    float _1612 = as_type<float>(_1590);
    float _1614 = as_type<float>(_1602);
    bool _1616 = _1596;
    if (_1500)
    {
        float _1618 = _1564 * 3.1415927410125732421875;
        _1612 = _1618;
    }
    float _1620 = _1612;
    int _1622 = abs(_1496);
    int _1624 = _1430 * _1602;
    int _1626 = _1624 + _1600;
    int _1628 = abs(_1610);
    if (_1500)
    {
        float _1630 = _1620 * 0.15915493667125701904296875;
        _1614 = _1630;
    }
    float _1632 = _1614;
    float _1634 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1636 = abs(_1540);
    bool _1638 = !_1596;
    int _1640 = _1638 ? 0 : 1;
    int _1642 = _1360 * _1622;
    int _1644 = _1642 + _1626;
    int _1646 = abs(_1640);
    int _1648 = _1536 * _1636;
    int _1650 = _1648 + _1111;
    float _1652 = as_type<float>(_1360);
    float _1654 = as_type<float>(_1636);
    if (_1500)
    {
        float _1656 = _1632 * 6.283185482025146484375;
        float _1658 = sin(_1656);
        _1652 = _1658;
    }
    float _1660 = _1652;
    float _1662 = 0.0;
    if (!_1500)
    {
        _1662 = _241;
    }
    float _1664 = _1662;
    float _1666 = float(uint(_1644));
    int _1668 = _1650 * _1628;
    int _1670 = _1668 + _1606;
    bool _1672 = _1063 == 0;
    float _1674 = as_type<float>(_1099) * _1666;
    int _1676 = ~_1071;
    int _1678 = _1676 + 1;
    int _1680 = _1536 * _1646;
    int _1682 = _1680 + _1670;
    float _1684 = -_241;
    int _1686 = _1352 ? as_type<int>(_1684) : as_type<int>(_241);
    float _1688 = trunc(_1674);
    float _1690 = precise::max(_1688, 0.0);
    uint _1692 = uint(_1690);
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1696 = _1694 != 0;
    float _1698 = float(uint(_1682));
    float _1700 = _1664;
    if (_1500)
    {
        bool _1702 = _1660 > 0.5;
        _1616 = _1702;
    }
    bool _1704 = _1616;
    int _1706 = ~_1063;
    int _1708 = _1706 + 1;
    float _1710 = as_type<float>(_1117) * _1698;
    if (_1500)
    {
        float _1712 = -_241;
        float _1714 = _1704 ? _1712 : _241;
        _1700 = _1714;
    }
    float _1716 = _1700;
    int _1718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1720 = _1718 != 0;
    float _1722 = trunc(_1710);
    float _1724 = precise::max(_1722, 0.0);
    uint _1726 = uint(_1724);
    bool _1728 = !_1696;
    float _1730 = _1728 ? _241 : as_type<float>(_1686);
    int _1732 = _1708 * int(_1692);
    int _1734 = _1732 + _1644;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1738 = float(uint(_1734));
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1742 = as_type<float>(_1622);
    float _1744 = _1738;
    if (_1720)
    {
        float _1746 = in.m_68.x;
        _1742 = _1746;
    }
    float _1748 = _1742;
    if (!_1720)
    {
        _1556 = _245;
    }
    float _1750 = _1556;
    float _1752 = as_type<float>(_1099) * _1738;
    float _1754 = -_1736;
    float _1756 = fma(_1634, 2.0, _1754);
    int _1758 = _1678 * int(_1726);
    int _1760 = _1758 + _1682;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _1764 = trunc(_1752);
    float _1766 = precise::max(_1764, 0.0);
    uint _1768 = uint(_1766);
    float _1770 = float(uint(_1760));
    float _1772 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1774 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1762);
    float _1776 = _1254 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1780 = as_type<float>(_1117) * _1770;
    int _1782 = ~_1063;
    int _1784 = _1782 + 1;
    float _1786 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1772);
    float _1788 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1792 = trunc(_1780);
    float _1794 = precise::max(_1792, 0.0);
    uint _1796 = uint(_1794);
    float _1798 = fma(_1788, -2.0, _1740);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    int _1802 = int(_1692) + int(_1768);
    float _1804 = _1750;
    if (_1720)
    {
        float _1806 = _1748 * 3.1415927410125732421875;
        _1744 = _1806;
    }
    float _1808 = _1744;
    int _1810 = ~_1071;
    int _1812 = _1810 + 1;
    float _1814 = fma(_1776, -2.0, _1800);
    int _1816 = _1784 * _1802;
    int _1818 = _1816 + _1644;
    float _1820 = _1808;
    if (_1720)
    {
        float _1822 = _1808 * 0.15915493667125701904296875;
        _1820 = _1822;
    }
    float _1824 = _1820;
    int _1826 = ~_1071;
    int _1828 = _1826 + 1;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1834 = uint(_1818) >= uint(_1063);
    float _1836 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1786);
    int _1838 = int(_1726) + int(_1796);
    float _1840 = _1824;
    if (_1720)
    {
        float _1842 = _1824 * 6.283185482025146484375;
        float _1844 = sin(_1842);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1814);
    bool _1850 = !_1834;
    int _1852 = _1850 ? 0 : (-1);
    float _1854 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1774);
    float _1856 = -_245;
    int _1858 = _1354 ? as_type<int>(_1856) : as_type<int>(_245);
    int _1860 = _1812 * _1838;
    int _1862 = _1860 + _1682;
    int _1864 = ~_1802;
    int _1866 = _1864 + _1852;
    int _1868 = _1866 + 1;
    float _1870 = -_133;
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1756);
    float _1874 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1798);
    bool _1876 = uint(_1862) >= uint(_1071);
    int _1878 = _1063 * _1868;
    int _1880 = _1878 + _1644;
    bool _1882 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1884 = isnan(_1049);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1890 = _1886 || _1888;
    float _1892 = float(_1890);
    bool _1894 = !_1876;
    int _1896 = _1894 ? 0 : (-1);
    bool _1898 = _1876;
    if (_1720)
    {
        bool _1900 = _1846 > 0.5;
        _1898 = _1900;
    }
    bool _1902 = _1898;
    float _1904 = -_1892;
    float _1906 = _1904 + 1.0;
    bool _1908 = !_1672;
    int _1910 = _1908 ? _1880 : (-1);
    if (_1720)
    {
        float _1912 = -_245;
        float _1914 = _1902 ? _1912 : _245;
        _1804 = _1914;
    }
    float _1916 = _1804;
    int _1918 = ~_1838;
    int _1920 = _1918 + _1896;
    int _1922 = _1920 + 1;
    int _1924 = _1910 & 3;
    bool _1926 = _1924 != 0;
    bool _1928 = _1278 > 0.5;
    int _1930 = _1071 * _1922;
    int _1932 = _1930 + _1682;
    bool _1934 = uint(_1924) > 1u;
    float _1936 = -_245;
    int _1938 = _1928 ? as_type<int>(_1936) : as_type<int>(_245);
    int _1940 = _1910 & 3;
    bool _1942 = _1940 != 0;
    bool _1944 = !_1542;
    int _1946 = _1944 ? _1932 : (-1);
    int _1948 = _1942 ? 0 : 1;
    int _1950 = _1946 & 3;
    bool _1952 = _1950 != 0;
    int _1954 = ~_1948;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    int _1960 = _1958;
    if (!_1934)
    {
        int _1962 = ~_1948;
        int _1964 = _1962 + 1;
        _1960 = _1964;
    }
    int _1966 = _1960;
    bool _1968 = uint(_1950) >= 2u;
    int _1970 = _1946 & 3;
    bool _1972 = _1970 != 0;
    int _1974 = _1968 ? 0 : 1;
    bool _1976 = _1950 != 3;
    int _1978 = ~_1974;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _1972 ? 0 : 1;
    bool _1986 = uint(_1950) > 1u;
    int _1988 = ~_1984;
    int _1990 = _1988 + 1;
    int _1992 = _1990 + 1;
    int _1994 = int(_1976);
    int _1996 = _1986 ? 2 : 0;
    int _1998 = _1994 | _1996;
    int _2000 = _1952 ? 4 : 0;
    int _2002 = _1998 | _2000;
    int _2004 = _1376 ? 8 : 0;
    int _2006 = _2002 | _2004;
    int _2008 = _1926 ? 16 : 0;
    int _2010 = _2006 | _2008;
    int _2012 = _1542 ? 32 : 0;
    int _2014 = _2010 | _2012;
    int _2016 = _1672 ? 64 : 0;
    int _2018 = _2014 | _2016;
    int _2020 = _2018 & 4;
    int _2022 = int(_1976);
    int _2024 = _1986 ? 2 : 0;
    int _2026 = _2022 | _2024;
    int _2028 = _1952 ? 4 : 0;
    int _2030 = _2026 | _2028;
    int _2032 = _1376 ? 8 : 0;
    int _2034 = _2030 | _2032;
    int _2036 = _1926 ? 16 : 0;
    int _2038 = _2034 | _2036;
    int _2040 = _1542 ? 32 : 0;
    int _2042 = _2038 | _2040;
    int _2044 = _1672 ? 64 : 0;
    int _2046 = _2042 | _2044;
    int _2048 = _2046 & 16;
    int _2050 = _1982;
    int _2052 = _1992;
    if (_1976)
    {
        int _2054 = ~_1974;
        int _2056 = _2054 + 1;
        _2050 = _2056;
    }
    int _2058 = _2050;
    int _2060 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2062 = _2060 != 0;
    float _2064 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2066 = int(_2064);
    bool _2068 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2070 = isnan(_1049);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2076 = _2072 || _2074;
    float _2078 = float(_2076);
    bool _2080 = !_2062;
    float _2082 = _2080 ? _245 : as_type<float>(_1858);
    if (!_1986)
    {
        int _2084 = ~_1984;
        int _2086 = _2084 + 1;
        _2052 = _2086;
    }
    int _2088 = _2052;
    float _2090 = _2078 * _1906;
    int _2092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2094 = _2092 != 0;
    float _2096 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _2098 = int(_2096);
    bool _2100 = !_1376;
    float _2102 = _2100 ? _245 : as_type<float>(_1938);
    float _2104 = -_2078;
    float _2106 = _2104 + 1.0;
    bool _2108 = !_2094;
    int _2110 = _2108 ? 0 : 1;
    int _2112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2114 = _2112 != 0;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2118 = _2116 != 0;
    int _2120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2122 = _2120 != 0;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2126 = _2124 != 0;
    float _2128 = float(uint(_2066));
    bool _2130 = !_2114;
    int _2132 = _2130 ? 0 : 1;
    bool _2134 = _1258 != 1;
    float _2136 = 1.0 / _2128;
    float _2138 = float(_2098);
    bool _2140 = !_2118;
    int _2142 = _2140 ? 0 : 1;
    bool _2144 = _1244 > 0.5;
    bool _2146 = !_2122;
    int _2148 = _2146 ? 0 : 1;
    float _2150 = 1.0 / _2138;
    float _2152 = -_241;
    int _2154 = _2144 ? as_type<int>(_2152) : as_type<int>(_241);
    int _2156 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2158 = _2156 != 0;
    float _2160 = 1.4012984643248170709237295832899e-45;
    if (!_2134)
    {
        _1654 = _1252;
    }
    float _2162 = _1654;
    float _2164 = 0.0;
    float _2166 = _2162;
    if (!_2134)
    {
        _2164 = _1252;
    }
    float _2168 = _2164;
    float _2170 = _2168;
    if (!_2134)
    {
        _2160 = _1276;
    }
    float _2172 = _2160;
    float _2174 = _2172;
    if (!_2134)
    {
        _1558 = _1276;
    }
    float _2176 = _1558;
    float _2178 = _2176;
    if (_2134)
    {
        _2166 = _1244;
    }
    float _2180 = _2166;
    if (_2134)
    {
        _2170 = _1244;
    }
    float _2182 = _2170;
    float _2184 = _2150 * _133;
    float _2186 = _1244 * 2.0;
    if (_2134)
    {
        _2174 = _1252;
    }
    float _2188 = _2174;
    float _2190 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_2134)
    {
        _2178 = _1252;
    }
    float _2192 = _2178;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1778);
    float _2196 = trunc(_2184);
    int _2198 = int(_2196);
    bool _2200 = _1260 != 2;
    float _2202 = -_1830;
    float _2204 = fma(_2190, 2.0, _2202);
    int _2206 = as_type<int>(_2136) + (-2);
    float _2208 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2210 = fma(_2192, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1832);
    float _2212 = _1342 * _133;
    float _2214 = float(_2066);
    float _2216 = floor(_2186);
    float _2218 = -_1790;
    float _2220 = fma(_2208, 2.0, _2218);
    int _2222 = ~_2066;
    int _2224 = _2222 + 1;
    float _2226 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2194);
    float _2228 = _1370 * _2214;
    int _2230 = ~_1063;
    int _2232 = _2230 + 1;
    float _2234 = -_133;
    float _2236 = fma(_2234, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2220);
    if (_2200)
    {
        _1560 = _1252;
    }
    float _2238 = _1560;
    float _2240 = exp2(_2212);
    float _2242 = float(uint(_2198));
    float _2244 = -_133;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2204);
    float _2248 = _2238;
    float _2250 = _2242;
    if (!_2200)
    {
        _2248 = _1244;
    }
    float _2252 = _2248;
    float _2254 = _2214 * _1280;
    bool _2256 = !_2126;
    int _2258 = _2256 ? 0 : 1;
    float _2260 = as_type<float>(_2206) * _2242;
    if (_2200)
    {
        _2250 = _1244;
    }
    float _2262 = _2250;
    float _2264 = trunc(_2228);
    int _2266 = int(_2264);
    float _2268 = _2262;
    if (!_2200)
    {
        _2268 = _1276;
    }
    float _2270 = _2268;
    float _2272 = _2252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2274 = _2216 > 0.0;
    bool _2276 = _2216 >= 0.0;
    bool _2278 = isnan(_2216);
    bool _2280 = _2276 || _2278;
    bool _2282 = isnan(0.0);
    bool _2284 = _2280 || _2282;
    float _2286 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2288 = float(uint(_1430));
    float _2290 = trunc(_2260);
    float _2292 = precise::max(_2290, 0.0);
    uint _2294 = uint(_2292);
    float _2296 = -_2240;
    float _2298 = _2296 + 1.0;
    bool _2300 = _2020 != 0;
    float _2302 = as_type<float>(_1099) * _2288;
    float _2304 = float(uint(_1650));
    float _2306 = trunc(_2254);
    int _2308 = int(_2306);
    int _2310 = abs(_2142);
    float _2312 = as_type<float>(_1117) * _2304;
    int _2314 = abs(_2132);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2318 = _2224 * int(_2294);
    int _2320 = _2318 + _2198;
    float _2322 = trunc(_2312);
    float _2324 = precise::max(_2322, 0.0);
    uint _2326 = uint(_2324);
    float _2328 = float(uint(_2320));
    float _2330 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2332 = trunc(_2302);
    float _2334 = precise::max(_2332, 0.0);
    uint _2336 = uint(_2334);
    float _2338 = as_type<float>(_2206) * _2328;
    float _2340 = fma(_2330, -2.0, _2316);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = -_2342;
    float _2346 = fma(_2286, 2.0, _2344);
    float _2348 = trunc(_2338);
    float _2350 = precise::max(_2348, 0.0);
    uint _2352 = uint(_2350);
    int _2354 = _1828 * int(_2326);
    int _2356 = _2354 + _1650;
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2360 = -_133;
    float _2362 = fma(_2360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2346);
    float _2364 = fma(_2272, -2.0, _2358);
    int _2366 = _2232 * int(_2336);
    int _2368 = _2366 + _1430;
    float _2370 = float(uint(_2356));
    float _2372 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2374 = float(uint(_2368));
    float _2376 = as_type<float>(_1117) * _2370;
    int _2378 = abs(_2110);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2382 = int(_2294) + int(_2352);
    float _2384 = as_type<float>(_1099) * _2374;
    bool _2386 = !_2158;
    float _2388 = _2386 ? _241 : as_type<float>(_2154);
    float _2390 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2372);
    bool _2392 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2400 = _2396 || _2398;
    float _2402 = trunc(_2384);
    float _2404 = precise::max(_2402, 0.0);
    uint _2406 = uint(_2404);
    float _2408 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2380);
    float _2410 = _2400 ? _2298 : 0.0;
    int _2412 = _2266 * _2378;
    int _2414 = _2412 + _2198;
    int _2416 = ~_2066;
    int _2418 = _2416 + 1;
    float _2420 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2390);
    bool _2422 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2424 = isnan(1.0);
    bool _2426 = _2422 || _2424;
    bool _2428 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2430 = _2426 || _2428;
    float _2432 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2434 = 1.0 + _2432;
    float _2436 = float(uint(_2414));
    float _2438 = trunc(_2376);
    float _2440 = precise::max(_2438, 0.0);
    uint _2442 = uint(_2440);
    float _2444 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2408);
    float _2446 = as_type<float>(_2206) * _2436;
    int _2448 = ~_2066;
    int _2450 = _2448 + 1;
    float _2452 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2454 = int(_2336) + int(_2406);
    float _2456 = 1.0 / _2434;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2460 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2452);
    float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2464 = _1049 + _2462;
    float _2466 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2458);
    float _2468 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2470 = trunc(_2446);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    int _2478 = int(_2326) + int(_2442);
    float _2480 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2482 = _2480 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2484 = 1.0 / _2482;
    int _2486 = _2418 * int(_2474);
    int _2488 = _2486 + _2414;
    float _2490 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2210);
    float _2492 = float(uint(_2488));
    float _2494 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2340);
    int _2496 = _2450 * _2382;
    int _2498 = _2496 + _2198;
    float _2500 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2364);
    if (_2430)
    {
        float _2502 = _2410 * _2456;
        _143 = _2502;
    }
    float _2504 = _143;
    float _2506 = as_type<float>(_2206) * _2492;
    int _2508 = ~_1063;
    int _2510 = _2508 + 1;
    float _2512 = -_2490;
    float _2514 = _2512 + 1.0;
    int _2516 = _2284 ? 0 : 1;
    bool _2518 = uint(_2498) >= uint(_2066);
    float _2520 = trunc(_2506);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    int _2532 = _2510 * _2454;
    int _2534 = _2532 + _1430;
    bool _2536 = !_2518;
    int _2538 = _2536 ? 0 : (-1);
    int _2540 = _2530;
    if (!_2274)
    {
        int _2542 = ~_2516;
        int _2544 = _2542 + 1;
        _2540 = _2544;
    }
    int _2546 = _2540;
    bool _2548 = _1394 > 0.0;
    bool _2550 = _1394 >= 0.0;
    bool _2552 = isnan(_1394);
    bool _2554 = _2550 || _2552;
    bool _2556 = isnan(0.0);
    bool _2558 = _2554 || _2556;
    float _2560 = float(_2198);
    int _2562 = ~_2066;
    int _2564 = _2562 + 1;
    bool _2566 = uint(_2534) >= uint(_1063);
    int _2568 = int(_2474) + int(_2524);
    bool _2570 = _2560 >= _2214;
    bool _2572 = isnan(_2560);
    bool _2574 = _2570 || _2572;
    bool _2576 = isnan(_2214);
    bool _2578 = _2574 || _2576;
    float _2580 = float(_2578);
    int _2582 = ~_1071;
    int _2584 = _2582 + 1;
    float _2586 = trunc(_2580);
    int _2588 = int(_2586);
    int _2590 = _2564 * _2568;
    int _2592 = _2590 + _2414;
    int _2594 = _2558 ? 0 : 1;
    int _2596 = _2584 * _2478;
    int _2598 = _2596 + _1650;
    bool _2600 = !_2566;
    int _2602 = _2600 ? 0 : (-1);
    bool _2604 = uint(_2592) >= uint(_2066);
    bool _2606 = uint(_2598) >= uint(_1071);
    int _2608 = ~_2382;
    int _2610 = _2608 + _2538;
    int _2612 = _2610 + 1;
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2616 = _2614 != 0;
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2620 = _2618 != 0;
    int _2622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2624 = _2622 != 0;
    bool _2626 = !_2606;
    int _2628 = _2626 ? 0 : (-1);
    int _2630 = _2066 * _2612;
    int _2632 = _2630 + _2198;
    bool _2634 = _2066 == 0;
    int _2636 = ~_2588;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    bool _2642 = !_2634;
    int _2644 = _2642 ? _2632 : (-1);
    int _2646 = _2066 + (-1);
    int _2648 = ~_2594;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    int _2654 = _2644 * _2640;
    int _2656 = _2652;
    if (!_2548)
    {
        int _2658 = ~_2594;
        int _2660 = _2658 + 1;
        _2656 = _2660;
    }
    int _2662 = _2656;
    bool _2664 = !_2604;
    int _2666 = _2664 ? 0 : (-1);
    int _2668 = _2588 * _2646;
    int _2670 = _2668 + _2654;
    int _2672 = abs(_2148);
    int _2674 = _2670 * _2310;
    int _2676 = abs(_2258);
    int _2678 = _2308 * _2314;
    int _2680 = _2678 + _2674;
    float _2682 = _1276 * 2.0;
    int _2684 = ~_2066;
    int _2686 = _2684 + 1;
    int _2688 = _2414 * _2672;
    int _2690 = _2688 + _2680;
    int _2692 = ~_2066;
    int _2694 = _2692 + 1;
    bool _2696 = !_2620;
    int _2698 = _2696 ? 0 : 1;
    int _2700 = _2266 * _2676;
    int _2702 = _2700 + _2690;
    float _2704 = floor(_2682);
    bool _2706 = _2048 != 0;
    float _2708 = float(uint(_2702));
    bool _2710 = !_2616;
    int _2712 = _2710 ? 0 : 1;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2718 = abs(_2698);
    float _2720 = as_type<float>(_2206) * _2708;
    bool _2722 = !_2624;
    int _2724 = _2722 ? 0 : 1;
    float _2726 = float(_2662);
    float _2728 = trunc(_2720);
    float _2730 = precise::max(_2728, 0.0);
    uint _2732 = uint(_2730);
    int _2734 = abs(_2724);
    bool _2736 = _2704 >= 0.0;
    bool _2738 = isnan(_2704);
    bool _2740 = _2736 || _2738;
    bool _2742 = isnan(0.0);
    bool _2744 = _2740 || _2742;
    int _2746 = ~_2454;
    int _2748 = _2746 + _2602;
    int _2750 = _2748 + 1;
    int _2752 = _2744 ? 0 : 1;
    float _2754 = 1.0 / _2716;
    bool _2756 = _2704 > 0.0;
    int _2758 = _1063 * _2750;
    int _2760 = _2758 + _1430;
    int _2762 = ~_2478;
    int _2764 = _2762 + _2628;
    int _2766 = _2764 + 1;
    int _2768 = ~_2568;
    int _2770 = _2768 + _2666;
    int _2772 = _2770 + 1;
    bool _2774 = _1071 == 0;
    int _2776 = _2686 * int(_2732);
    int _2778 = _2776 + _2702;
    int _2780 = _1071 * _2766;
    int _2782 = _2780 + _1650;
    int _2784 = _1946 >> 31;
    int _2786 = _2066 * _2772;
    int _2788 = _2786 + _2414;
    float _2790 = float(uint(_2778));
    int _2792 = _2784 & 3;
    bool _2794 = !_2774;
    int _2796 = _2794 ? _2782 : (-1);
    float _2798 = as_type<float>(_2206) * _2790;
    float _2800 = trunc(_2798);
    float _2802 = precise::max(_2800, 0.0);
    uint _2804 = uint(_2802);
    int _2806 = int(_2732) + int(_2804);
    float _2808 = in.m_48.x;
    float _2810 = in.m_48.y;
    float _2812 = in.m_48.z;
    int _2814 = _2694 * _2806;
    int _2816 = _2814 + _2702;
    int _2818 = ~_2752;
    int _2820 = _2818 + 1;
    int _2822 = _2820 + 1;
    int _2824 = _2822;
    if (!_2756)
    {
        int _2826 = ~_2752;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = uint(_2816) >= uint(_2066);
    bool _2834 = _1950 != 3;
    bool _2836 = !_2832;
    int _2838 = _2836 ? 0 : (-1);
    bool _2840 = !_2300;
    int _2842 = _2840 ? 0 : 1;
    bool _2844 = !_2834;
    int _2846 = _2844 ? 0 : (-1);
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2850 = _2848 != 0;
    int _2852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2854 = _2852 != 0;
    float _2856 = _201 * _2810;
    float _2858 = _537 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2860 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _245);
    float _2862 = _195 * _2810;
    float _2864 = _539 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2868 = _2866 != 0;
    float _2870 = _2858 * _2860;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2874 = _2872 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2876 = _207 * _2810;
    float _2878 = fma(_193, _2808, _2862);
    float _2880 = 1.0 / _2874;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2886 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _241);
    float _2888 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2890 = _2888 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2892 = fma(_205, _2808, _2876);
    float _2894 = fma(_199, _2808, _2856);
    float _2896 = _2864 * _2886;
    float _2898 = 1.0 / _2884;
    float _2900 = fma(_197, _2812, _2878);
    float _2902 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2904 = _2902 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2906 = fma(_203, _2812, _2894);
    float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2912 = fma(_209, _2812, _2892);
    float _2914 = 1.0 / _2890;
    float _2916 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2918 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2916;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2922 = _2920 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2924 = in.m_62.w;
    float _2926 = _2918 * _2484;
    float _2928 = _2922 * _2880;
    float _2930 = 1.0 / _2910;
    bool _2932 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2934 = isnan(_1049);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    float _2944 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2946 = _2944 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2948 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2950 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2948;
    bool _2952 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2954 = isnan(_1049);
    bool _2956 = _2952 || _2954;
    bool _2958 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2960 = _2956 || _2958;
    float _2962 = float(_2960);
    float _2964 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2966 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2964;
    float _2968 = _2946 * _2898;
    float _2970 = _2950 * _2754;
    float _2972 = 1.0 / _2904;
    float _2974 = -_2942;
    float _2976 = _2974 + 1.0;
    float _2978 = _2966 * _2914;
    bool _2980 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2982 = isnan(_1049);
    bool _2984 = _2980 || _2982;
    bool _2986 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2988 = _2984 || _2986;
    float _2990 = float(_2988);
    float _2992 = -_2962;
    float _2994 = _2992 + 1.0;
    float _2996 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2998 = _2996 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    bool _3000 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3002 = isnan(_1049);
    bool _3004 = _3000 || _3002;
    bool _3006 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3008 = _3004 || _3006;
    float _3010 = float(_3008);
    float _3012 = _2962 * _2976;
    float _3014 = _2990 * _2994;
    float _3016 = -_2990;
    float _3018 = _3016 + 1.0;
    float _3020 = _2998 * _2930;
    float _3022 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3024 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3022;
    bool _3026 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3028 = isnan(_1049);
    bool _3030 = _3026 || _3028;
    bool _3032 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3034 = _3030 || _3032;
    float _3036 = float(_3034);
    float _3038 = -_3010;
    float _3040 = _3038 + 1.0;
    float _3042 = _3010 * _3018;
    float _3044 = _3024 * _2972;
    bool _3046 = _1049 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3048 = isnan(_1049);
    bool _3050 = _3046 || _3048;
    bool _3052 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3054 = _3050 || _3052;
    float _3056 = float(_3054);
    float _3058 = _3036 * _3040;
    float _3060 = -_3036;
    float _3062 = _3060 + 1.0;
    float _3064 = in.m_64.w;
    float _3066 = fma(_2926, _2464, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3068 = -_3056;
    float _3070 = _3068 + 1.0;
    float _3072 = _3056 * _3062;
    float _3074 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3076 = _1049 + _3074;
    float _3078 = in.m_66.w;
    float _3080 = _1892 * _3070;
    float _3082 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3084 = _1049 + _3082;
    float _3086 = _3066 * _2090;
    float _3088 = fma(_2970, _3076, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3090 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3092 = _1049 + _3090;
    float _3094 = fma(_2928, _3084, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3096 = fma(_2106, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3086);
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3100 = _1049 + _3098;
    float _3102 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3104 = _1049 + _3102;
    float _3106 = fma(_2968, _3092, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3108 = fma(_3094, _3080, _3096);
    float _3110 = fma(_3044, _3104, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3112 = _1244 + _1276;
    float _3114 = fma(_3088, _3072, _3108);
    float _3116 = _1244 + (-0.5);
    float _3118 = _2900 + _2924;
    float _3120 = float(_2830);
    float _3122 = _2906 + _3064;
    float _3124 = _1252 + _1244;
    float _3126 = _1252 + _1276;
    float _3128 = fma(_3106, _3058, _3114);
    int _3130 = abs(_2712);
    float _3132 = _2912 + _3078;
    float _3134 = _3124 + (-1.0);
    float _3136 = in.m_78.x;
    float _3138 = in.m_78.y;
    float _3140 = in.m_78.z;
    float _3142 = _3126 + (-1.0);
    float _3144 = fma(_2978, _3100, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3146 = fma(_3134, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3148 = _3112 + (-1.0);
    float _3150 = float(_3130);
    float _3152 = fma(_3020, _1306, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3154 = fma(_3142, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3156 = fma(_3144, _3042, _3128);
    float _3158 = _1716 + 0.5;
    float _3160 = _3150 * _3120;
    float _3162 = fma(_3148, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3164 = fma(_3152, _3014, _3156);
    float _3166 = fma(_3158, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2236);
    float _3168 = _3160 * (-2.0);
    float _3170 = fma(_3110, _3012, _3164);
    float _3172 = float(_2546);
    float _3174 = fma(_3146, _3168, _3146);
    float _3176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3178 = _1916 + (-0.5);
    float _3180 = fma(_2942, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3170);
    float _3182 = fma(_3168, _3136, _3136);
    float _3184 = float(_2718);
    float _3186 = _1252 + (-0.5);
    float _3188 = _1276 + (-0.5);
    float _3190 = fma(_3116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3182);
    float _3192 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3194 = _3184 * _3172;
    float _3196 = fma(_3174, _2504, _3190);
    float _3198 = -_3178;
    float _3200 = -_1848;
    float _3202 = fma(_3198, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3200);
    float _3204 = _3194 * (-2.0);
    float _3206 = float(_2734);
    float _3208 = -_1836;
    float _3210 = _3208 + 1.0;
    float _3212 = -_1854;
    float _3214 = _3212 + 1.0;
    float _3216 = fma(_3204, _3138, _3138);
    float _3218 = fma(_3154, _3204, _3154);
    float _3220 = _3206 * _2726;
    float _3222 = -_3210;
    float _3224 = fma(_3222, _1716, _3166);
    float _3226 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3216);
    float _3228 = fma(_3214, _1916, _3202);
    float _3230 = _3220 * (-2.0);
    float _3232 = _3196 * 0.15915493667125701904296875;
    float _3234 = fma(_3218, _2504, _3226);
    float _3236 = _3176 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3238 = fma(_3162, _3230, _3162);
    float _3240 = fma(_3230, _3140, _3140);
    out.m_80.x = _3224;
    out.m_80.y = _3228;
    float _3242 = _3234 * 0.15915493667125701904296875;
    float _3244 = _1730 + 0.5;
    float _3246 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3240);
    float _3248 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3250 = _2388 + 0.5;
    float _3252 = _2082 + (-0.5);
    float _3254 = fma(_3238, _2504, _3246);
    float _3256 = _3232 * 6.283185482025146484375;
    float _3258 = sin(_3256);
    float _3260 = fma(_3236, _3244, _2246);
    float _3262 = _2102 + (-0.5);
    float _3264 = _3254 * 0.15915493667125701904296875;
    float _3266 = fma(_3250, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1872);
    float _3268 = -_3252;
    float _3270 = -_1874;
    float _3272 = fma(_3268, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3270);
    float _3274 = -_3248;
    float _3276 = -_2494;
    float _3278 = fma(_3274, _3262, _3276);
    float _3280 = -_2468;
    float _3282 = _3280 + 1.0;
    float _3284 = _3242 * 6.283185482025146484375;
    float _3286 = sin(_3284);
    float _3288 = -_2420;
    float _3290 = _3288 + 1.0;
    float _3292 = -_2226;
    float _3294 = _3292 + 1.0;
    float _3296 = -_3282;
    float _3298 = fma(_2388, _3296, _3266);
    float _3300 = fma(_2102, _2514, _3278);
    float _3302 = fma(_2082, _3290, _3272);
    float _3304 = -_3294;
    float _3306 = fma(_1730, _3304, _3260);
    float _3308 = _241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3310 = _3242 * 6.283185482025146484375;
    float _3312 = cos(_3310);
    int _3314 = ~_2806;
    int _3316 = _3314 + _2838;
    int _3318 = _3316 + 1;
    out.m_82.x = _3180;
    out.m_84.x = _3298;
    out.m_84.y = _3302;
    out.m_84.z = _3306;
    out.m_84.w = _3300;
    float _3320 = _3264 * 6.283185482025146484375;
    float _3322 = cos(_3320);
    float _3324 = _3258 * _3286;
    float _3326 = _3232 * 6.283185482025146484375;
    float _3328 = cos(_3326);
    float _3330 = _3258 * _3312;
    int _3332 = _1946 + _2792;
    float _3334 = _3264 * 6.283185482025146484375;
    float _3336 = sin(_3334);
    int _3338 = _3332 >> 2;
    float _3340 = _3258 * _3322;
    int _3342 = _3338 << 4;
    int _3344 = _3342 + 656;
    float _3346 = _3340 * _2870;
    float _3348 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3350 = _3328 * _3312;
    float _3352 = _3328 * _3322;
    float _3354 = _3328 * _3286;
    float _3356 = _3312 * _3322;
    float _3358 = _3286 * _3322;
    float _3360 = _3352 * _2870;
    float _3362 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3364 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3366 = fma(_3336, _3350, _3324);
    float _3368 = fma(_3336, _3324, _3350);
    float _3370 = _3352 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _3372 = uint(int(uint(_3344) >> uint(2)));
    uint _3374 = uint(int(uint(int(_3372)) >> uint(2)));
    int _3376 = int(_3372) & 3;
    float _3378 = (*spvDescriptorSet0.vp_c9)._m0[int(_3374)][_3376];
    int _3380 = int(_3372) + 1;
    uint _3382 = uint(int(uint(_3380) >> uint(2)));
    int _3384 = _3380 & 3;
    float _3386 = (*spvDescriptorSet0.vp_c9)._m0[int(_3382)][_3384];
    float _3388 = -_2870;
    float _3390 = _3336 * _3388;
    float _3392 = -_3354;
    float _3394 = fma(_3336, _3330, _3392);
    float _3396 = -_3336;
    float _3398 = fma(_3396, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3370);
    float _3400 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3402 = fma(_3356, _2896, _3390);
    float _3404 = -_3330;
    float _3406 = fma(_3336, _3354, _3404);
    float _3408 = -_3336;
    float _3410 = fma(_3408, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3362);
    float _3412 = -_3336;
    float _3414 = fma(_3412, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3364);
    float _3416 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3400);
    float _3418 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3420 = _3344 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    float _3438 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3440 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3398);
    float _3442 = _3366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3444 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3410);
    float _3446 = fma(_3340, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3414);
    float _3448 = fma(_3366, _2896, _3360);
    float _3450 = fma(_3394, _2896, _3346);
    float _3452 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3418);
    float _3454 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3438);
    float _3456 = _245 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3458 = fma(_3356, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3442);
    float _3460 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3462 = _3406 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3464 = fma(_3358, _3348, _3402);
    float _3466 = fma(_3406, _3348, _3448);
    float _3468 = fma(_3368, _3348, _3450);
    int _3470 = abs(_2088);
    float _3472 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3454);
    float _3474 = _3456 * _3444;
    float _3476 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3460);
    float _3478 = fma(_3358, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3462);
    float _3480 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3416);
    float _3482 = fma(_3308, _3472, _3474);
    int _3484 = ~_3470;
    int _3486 = _3484 + 1;
    int _3488 = _3486 + 1;
    float _3490 = fma(_3394, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3458);
    float _3492 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3476);
    float _3494 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3452);
    float _3496 = fma(_3368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3478);
    float _3498 = _3456 * _3440;
    int _3500 = abs(_2842);
    out.m_86.x = _3472;
    out.m_86.y = _3480;
    out.m_86.z = _3490;
    float _3502 = _3456 * _3446;
    int _3504 = _2066 * _3318;
    int _3506 = _3504 + _2702;
    int _3508 = ~_3500;
    int _3510 = _3508 + 1;
    int _3512 = _3510 + 1;
    float _3514 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3516 = int(_3514);
    float _3518 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3520 = _3488 * as_type<int>(_3386);
    float _3522 = fma(_3308, _3480, _3498);
    int _3524 = abs(_2846);
    float _3526 = fma(_3308, _3490, _3502);
    int _3528 = _3512 * as_type<int>(_3378);
    int _3530 = _3528 + _3520;
    int _3532 = _1910 >> 31;
    float _3534 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3536 = abs(_2058);
    float _3538 = _3466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3540 = _3532 & 3;
    float _3542 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3534);
    int _3544 = ~_3536;
    int _3546 = _3544 + 1;
    int _3548 = _3546 + 1;
    float _3550 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3538);
    int _3552 = ~_3524;
    int _3554 = _3552 + 1;
    int _3556 = _3554 + 1;
    float _3558 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3542);
    bool _3560 = !_2634;
    float _3562 = _3560 ? as_type<float>(_3506) : as_type<float>(0xffffffffu /* nan */);
    int _3564 = _3548 * as_type<int>(_3428);
    int _3566 = _3564 + _3530;
    int _3568 = _1910 + _3540;
    float _3570 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3550);
    int _3572 = abs(_3516);
    int _3574 = _3556 * as_type<int>(_3436);
    int _3576 = _3574 + _3566;
    float _3578 = _3558 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3580 = !_2854;
    int _3582 = _3580 ? 0 : 1;
    float _3584 = _3570 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _3586 = uint(_1924) >= 2u;
    float _3588 = _3118 + _3578;
    int _3590 = as_type<int>(_3562) >> 31;
    float _3592 = _3132 + _3584;
    int _3594 = abs(_3582);
    float _3596 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3598 = _3588 + _3596;
    int _3600 = _3590 & 3;
    float _3602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3604 = _3592 + _3602;
    float _3606 = float(uint(_3516));
    float _3608 = _3598 * _3598;
    int _3610 = as_type<int>(_3562) + _3600;
    float _3612 = _3604 * _3604;
    int _3614 = _3586 ? 0 : 1;
    float _3616 = 1.0 / _3606;
    int _3618 = _3610 >> 2;
    float _3620 = _3608 + _3612;
    bool _3622 = _1924 != 3;
    float _3624 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3518);
    int _3626 = _3618 << 4;
    int _3628 = _3626 + 800;
    float _3630 = float(uint(_3572));
    float _3632 = sqrt(_3620);
    uint _3634 = uint(int(uint(_3628) >> uint(2)));
    uint _3636 = uint(int(uint(int(_3634)) >> uint(2)));
    int _3638 = int(_3634) & 3;
    float _3640 = (*spvDescriptorSet0.vp_c9)._m0[int(_3636)][_3638];
    int _3642 = int(_3634) + 1;
    uint _3644 = uint(int(uint(_3642) >> uint(2)));
    int _3646 = _3642 & 3;
    float _3648 = (*spvDescriptorSet0.vp_c9)._m0[int(_3644)][_3646];
    int _3650 = ~_3594;
    int _3652 = _3650 + 1;
    int _3654 = _3652 + 1;
    float _3656 = fma(_3468, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3624);
    int _3658 = ~_3614;
    int _3660 = _3658 + 1;
    int _3662 = _3660 + 1;
    int _3664 = _3568 >> 2;
    int _3666 = _3576 * _3654;
    float _3668 = 1.0 / _3630;
    int _3670 = _3662;
    float _3672 = _3588;
    float _3674 = as_type<float>(_3576);
    float _3676 = _3562;
    float _3678 = _3592;
    float _3680 = _3118;
    float _3682 = _3526;
    if (_3622)
    {
        int _3684 = ~_3614;
        int _3686 = _3684 + 1;
        _3670 = _3686;
    }
    int _3688 = _3670;
    int _3690 = _2796 * _3594;
    int _3692 = _3690 + _3666;
    int _3694 = _3664 << 4;
    int _3696 = _3694 + 368;
    float _3698 = _3656 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3700 = as_type<int>(_3616) + (-2);
    int _3702 = abs(_3692);
    uint _3704 = uint(int(uint(_3696) >> uint(2)));
    uint _3706 = uint(int(uint(int(_3704)) >> uint(2)));
    int _3708 = int(_3704) & 3;
    float _3710 = (*spvDescriptorSet0.vp_c9)._m0[int(_3706)][_3708];
    int _3712 = int(_3704) + 1;
    uint _3714 = uint(int(uint(_3712) >> uint(2)));
    int _3716 = _3712 & 3;
    float _3718 = (*spvDescriptorSet0.vp_c9)._m0[int(_3714)][_3716];
    float _3720 = float(uint(_3692));
    float _3722 = _3122 + _3698;
    float _3724 = float(uint(_3702));
    bool _3726 = _3632 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3728 = as_type<float>(_3700) * _3720;
    int _3730 = as_type<int>(_3668) + (-2);
    int _3732 = _3696 + 8;
    uint _3734 = uint(int(uint(_3732) >> uint(2)));
    uint _3736 = uint(int(uint(int(_3734)) >> uint(2)));
    int _3738 = int(_3734) & 3;
    float _3740 = (*spvDescriptorSet0.vp_c9)._m0[int(_3736)][_3738];
    int _3742 = int(_3734) + 1;
    uint _3744 = uint(int(uint(_3742) >> uint(2)));
    int _3746 = _3742 & 3;
    float _3748 = (*spvDescriptorSet0.vp_c9)._m0[int(_3744)][_3746];
    int _3750 = as_type<int>(_3562) & 3;
    bool _3752 = _3750 != 0;
    float _3754 = trunc(_3728);
    float _3756 = precise::max(_3754, 0.0);
    uint _3758 = uint(_3756);
    bool _3760 = !_2706;
    int _3762 = _3760 ? 0 : 1;
    int _3764 = _3752 ? 0 : 1;
    int _3766 = as_type<int>(_3562) & 3;
    bool _3768 = _3766 != 0;
    float _3770 = as_type<float>(_3730) * _3724;
    bool _3772 = _1924 != 3;
    float _3774 = _3720;
    if (!_3726)
    {
        _3774 = _3588;
    }
    float _3776 = _3774;
    float _3778 = _3776;
    if (!_3726)
    {
        _3672 = _3592;
    }
    float _3780 = _3672;
    float _3782 = trunc(_3770);
    float _3784 = precise::max(_3782, 0.0);
    uint _3786 = uint(_3784);
    int _3788 = ~_3516;
    int _3790 = _3788 + 1;
    int _3792 = ~_3572;
    int _3794 = _3792 + 1;
    float _3796 = _3780;
    if (!_3726)
    {
        _3674 = _3612;
    }
    float _3798 = _3674;
    float _3800 = _3798;
    if (!_3726)
    {
        _3676 = _3608;
    }
    float _3802 = _3676;
    float _3804 = _3802;
    if (!_3726)
    {
        _3678 = _3722;
    }
    float _3806 = _3678;
    int _3808 = ~_3764;
    int _3810 = _3808 + 1;
    int _3812 = _3810 + 1;
    bool _3814 = uint(_3766) > 1u;
    bool _3816 = !_3726;
    float _3818 = _3806;
    int _3820 = _3812;
    if (!_3816)
    {
        float _3822 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3824 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3826 = _3632 + _3824;
        float _3828 = _3722 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3830 = rsqrt(_3620);
        float _3832 = _3826 * _3822;
        float _3834 = _3832 * 0.15915493667125701904296875;
        float _3836 = _3834 * 6.283185482025146484375;
        float _3838 = sin(_3836);
        float _3840 = _3834 * 6.283185482025146484375;
        float _3842 = cos(_3840);
        float _3844 = fma(_3838, _3828, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3846 = _3830 * _3844;
        float _3848 = _3842 + (-1.0);
        float _3850 = fma(_3598, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3852 = fma(_3604, _3846, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3854 = _3848 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3858 = _3850 + _3856;
        float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3862 = _3852 + _3860;
        float _3864 = fma(_3722, _3842, _3854);
        float _3866 = _3858 * _3858;
        float _3868 = _3862 * _3862;
        _3818 = _3864;
        _3804 = _3866;
        _3800 = _3868;
        _3778 = _3850;
        _3796 = _3852;
    }
    float _3870 = _3818;
    float _3872 = _3804;
    float _3874 = _3800;
    float _3876 = _3778;
    float _3878 = _3796;
    int _3880 = _3628 + 8;
    uint _3882 = uint(int(uint(_3880) >> uint(2)));
    uint _3884 = uint(int(uint(int(_3882)) >> uint(2)));
    int _3886 = int(_3882) & 3;
    float _3888 = (*spvDescriptorSet0.vp_c9)._m0[int(_3884)][_3886];
    int _3890 = int(_3882) + 1;
    uint _3892 = uint(int(uint(_3890) >> uint(2)));
    int _3894 = _3890 & 3;
    float _3896 = (*spvDescriptorSet0.vp_c9)._m0[int(_3892)][_3894];
    if (!_3814)
    {
        int _3898 = ~_3764;
        int _3900 = _3898 + 1;
        _3820 = _3900;
    }
    int _3902 = _3820;
    float _3904 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3906 = _3870 + _3904;
    float _3908 = -_2476;
    float _3910 = _3908 + 1.0;
    float _3912 = fma(_3906, _3906, _3872);
    bool _3914 = !_3768;
    int _3916 = _3914 ? 0 : 1;
    int _3918 = _3790 * int(_3758);
    int _3920 = _3918 + _3692;
    int _3922 = abs(_1966);
    int _3924 = _3794 * int(_3786);
    int _3926 = _3924 + _3702;
    int _3928 = abs(_3762);
    float _3930 = -_2444;
    float _3932 = _3930 + 1.0;
    float _3934 = float(uint(_3920));
    float _3936 = float(uint(_3926));
    bool _3938 = _3766 != 3;
    float _3940 = as_type<float>(_3700) * _3934;
    int _3942 = abs(_3916);
    float _3944 = as_type<float>(_3730) * _3936;
    int _3946 = ~_3922;
    int _3948 = _3946 + 1;
    int _3950 = _3948 + 1;
    float _3952 = trunc(_3940);
    float _3954 = precise::max(_3952, 0.0);
    uint _3956 = uint(_3954);
    bool _3958 = uint(_3766) >= 2u;
    int _3960 = _3950 * as_type<int>(_3718);
    int _3962 = abs(_3688);
    int _3964 = abs(_3902);
    int _3966 = ~_3928;
    int _3968 = _3966 + 1;
    int _3970 = _3968 + 1;
    float _3972 = trunc(_3944);
    float _3974 = precise::max(_3972, 0.0);
    uint _3976 = uint(_3974);
    int _3978 = _3958 ? 0 : 1;
    int _3980 = _3970 * as_type<int>(_3710);
    int _3982 = _3980 + _3960;
    int _3984 = ~_3964;
    int _3986 = _3984 + 1;
    int _3988 = _3986 + 1;
    int _3990 = ~_3978;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = _3988 * as_type<int>(_3648);
    int _3998 = ~_3962;
    int _4000 = _3998 + 1;
    int _4002 = _4000 + 1;
    float _4004 = _3912 + _3874;
    int _4006 = ~_3942;
    int _4008 = _4006 + 1;
    int _4010 = _4008 + 1;
    int _4012 = _3994;
    float _4014 = _4004;
    if (_3938)
    {
        int _4016 = ~_3978;
        int _4018 = _4016 + 1;
        _4012 = _4018;
    }
    int _4020 = _4012;
    int _4022 = _4002 * as_type<int>(_3740);
    int _4024 = _4022 + _3982;
    bool _4026 = _3766 != 3;
    int _4028 = _4010 * as_type<int>(_3640);
    int _4030 = _4028 + _3996;
    int _4032 = abs(_4020);
    bool _4034 = !_3772;
    int _4036 = _4034 ? 0 : (-1);
    int _4038 = ~_3516;
    int _4040 = _4038 + 1;
    int _4042 = int(_3758) + int(_3956);
    bool _4044 = !_4026;
    int _4046 = _4044 ? 0 : (-1);
    int _4048 = ~_4032;
    int _4050 = _4048 + 1;
    int _4052 = _4050 + 1;
    int _4054 = abs(_4036);
    int _4056 = _4040 * _4042;
    int _4058 = _4056 + _3692;
    int _4060 = abs(_4046);
    int _4062 = _4052 * as_type<int>(_3888);
    int _4064 = _4062 + _4030;
    int _4066 = int(_3786) + int(_3976);
    int _4068 = ~_3572;
    int _4070 = _4068 + 1;
    bool _4072 = uint(_4058) >= uint(_3516);
    int _4074 = _4070 * _4066;
    int _4076 = _4074 + _3702;
    int _4078 = ~_4054;
    int _4080 = _4078 + 1;
    int _4082 = _4080 + 1;
    int _4084 = ~_4060;
    int _4086 = _4084 + 1;
    int _4088 = _4086 + 1;
    bool _4090 = uint(_4076) >= uint(_3572);
    int _4092 = _4082 * as_type<int>(_3748);
    int _4094 = _4092 + _4024;
    bool _4096 = !_4072;
    int _4098 = _4096 ? 0 : (-1);
    int _4100 = _4088 * as_type<int>(_3896);
    int _4102 = _4100 + _4064;
    int _4104 = _3692 ^ _3516;
    float _4106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4108 = !_4090;
    int _4110 = _4108 ? 0 : (-1);
    uint _4112 = uint(int(uint(_4104) >> uint(31)));
    int _4114 = ~_4110;
    int _4116 = _4066 + _4114;
    int _4118 = _4116 + 1;
    bool _4120 = !_2850;
    int _4122 = _4120 ? 0 : 1;
    float _4124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4126 = ~int(_4112);
    int _4128 = _4126 + 1;
    int _4130 = ~_4042;
    int _4132 = _4130 + _4098;
    int _4134 = _4132 + 1;
    bool _4136 = !_2868;
    int _4138 = _4136 ? 0 : 1;
    int _4140 = abs(_4122);
    int _4142 = _3516 * _4134;
    int _4144 = _4142 + _3692;
    int _4146 = _4118 ^ _4128;
    int _4148 = abs(_4138);
    int _4150 = ~_4140;
    int _4152 = _4150 + 1;
    int _4154 = _4152 + 1;
    int _4156 = ~_4128;
    int _4158 = _4156 + _4146;
    int _4160 = _4158 + 1;
    float _4162 = fma(_3456, _3456, 1.0);
    bool _4164 = _3516 == 0;
    int _4166 = _4094 * _4154;
    bool _4168 = _3516 == 0;
    float _4170 = _4124 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4172 = ~_4148;
    int _4174 = _4172 + 1;
    int _4176 = _4174 + 1;
    float _4178 = rsqrt(_4162);
    bool _4180 = !_4164;
    int _4182 = _4180 ? _4144 : (-1);
    float _4184 = _1420 + 0.5;
    bool _4186 = !_4168;
    int _4188 = _4186 ? _4160 : (-1);
    int _4190 = _4102 * _4176;
    float _4192 = float(_4182);
    float _4194 = _4106 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _4196 = float(_4188);
    bool _4198 = _1063 == 0;
    float _4200 = _1416 + (-0.5);
    float _4202 = fma(_4170, _4192, _2362);
    float _4204 = -_2500;
    float _4206 = fma(_4194, _4196, _4204);
    bool _4208 = !_4198;
    int _4210 = _4208 ? _2760 : (-1);
    bool _4212 = !_2634;
    int _4214 = _4212 ? _2788 : (-1);
    float _4216 = -_4194;
    float _4218 = fma(_4216, _4200, _4206);
    float _4220 = fma(_4170, _4184, _4202);
    int _4222 = _4210 * _4140;
    int _4224 = _4222 + _4166;
    float _4226 = _3456 * _4178;
    float _4228 = fma(_1416, _3910, _4218);
    int _4230 = _4214 * _4148;
    int _4232 = _4230 + _4190;
    float _4234 = sqrt(_4004);
    float _4236 = -_3494;
    float _4238 = _4226 * _4236;
    float _4240 = -_3496;
    float _4242 = _4226 * _4240;
    float _4244 = -_3492;
    float _4246 = _4226 * _4244;
    float _4248 = -_3932;
    float _4250 = fma(_1420, _4248, _4220);
    float _4252 = fma(_4178, _3440, _4238);
    float _4254 = fma(_4178, _3446, _4242);
    float _4256 = fma(_4178, _3444, _4246);
    float _4258 = _3492 + _3482;
    float _4260 = float(_4224);
    float _4262 = _3494 + _3522;
    float _4264 = float(_4232);
    float _4266 = _3496 + _3526;
    out.m_88.x = _4256;
    out.m_88.y = _4252;
    out.m_88.z = _4254;
    bool _4268 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4270 = isnan(_4234);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4276 = _4272 || _4274;
    out.m_90.x = _4260;
    out.m_90.w = _4264;
    out.m_92.x = _4250;
    out.m_92.y = _4228;
    out.m_94.x = _4258;
    out.m_94.y = _4262;
    out.m_94.z = _4266;
    float _4278 = _4252;
    if (!_4276)
    {
        _4014 = 1.0;
    }
    float _4280 = _4014;
    bool _4282 = !_4276;
    float _4284 = _4280;
    if (!_4282)
    {
        bool _4286 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4288 = isnan(_4234);
        bool _4290 = _4286 || _4288;
        bool _4292 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4294 = _4290 || _4292;
        if (!_4294)
        {
            float _4296 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4298 = _4234 + _4296;
            float _4300 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4302 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4300;
            float _4304 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4306 = _4304 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4308 = 1.0 / _4302;
            float _4310 = _4298 * _4308;
            float _4312 = fma(_4310, _4306, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4284 = _4312;
            _4314 = true;
        }
        else
        {
            bool _4316 = _4234 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4318 = isnan(_4234);
            bool _4320 = _4316 || _4318;
            bool _4322 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4324 = _4320 || _4322;
            if (!_4324)
            {
                float _4326 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4328 = _4234 + _4326;
                float _4330 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4332 = _4330 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4336 = _4334 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4338 = 1.0 / _4332;
                float _4340 = _4328 * _4338;
                float _4342 = fma(_4340, _4336, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4284 = _4342;
                _4314 = true;
            }
            else
            {
                _4284 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4314 = false;
    float _4344 = _4284;
    float _4346 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4348 = _3870 + _4346;
    float _4350 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4352 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4354 = _3876 + _4352;
    float _4356 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4358 = _3878 + _4356;
    float _4360 = fma(_4348, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4362 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4350);
    float _4364 = fma(_4354, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4366 = fma(_4358, _4344, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4368 = -_3122;
    float _4370 = _4368 + _4360;
    float _4372 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4362);
    float _4374 = -_3118;
    float _4376 = _4374 + _4364;
    float _4378 = -_3132;
    float _4380 = _4378 + _4366;
    float _4382 = _4370 * _4370;
    float _4384 = _4372 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4386 = _3122 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4388 = fma(_4376, _4376, _4382);
    float _4390 = 1.0 / _4384;
    float _4392 = fma(_3118, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4386);
    float _4394 = fma(_4380, _4380, _4388);
    float _4396 = fma(_3132, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4392);
    float _4398 = sqrt(_4394);
    float _4400 = _4396 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4402 = _4400 + _4384;
    float _4404 = _4402 * _4390;
    float _4406 = _4404 * 0.5;
    bool _4408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4412 = _4408 || _4410;
    bool _4414 = isnan(0.5);
    bool _4416 = _4412 || _4414;
    bool _4418 = _4398 > 0.0;
    float _4420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4422 = fma(_4406, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4420);
    float _4424 = 1.0 / _4422;
    bool _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4428 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4430 = _4426 || _4428;
    bool _4432 = isnan(0.5);
    bool _4434 = _4430 || _4432;
    float _4436 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4438 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4440 = _4390;
    float _4442 = _4422;
    if (!_4418)
    {
        _4436 = _4364;
    }
    float _4444 = _4436;
    float _4446 = _4444;
    if (!_4418)
    {
        _4438 = _4360;
    }
    float _4448 = _4438;
    float _4450 = _4448;
    float _4452 = _4448;
    if (!_4418)
    {
        _4440 = _4366;
    }
    float _4454 = _4440;
    bool _4456 = !_4418;
    float _4458 = _4454;
    float _4460 = _4454;
    if (!_4456)
    {
        float _4462 = _235 * _235;
        float _4464 = rsqrt(_4394);
        float _4466 = fma(_233, _233, _4462);
        float _4468 = fma(_237, _237, _4466);
        float _4470 = sqrt(_4468);
        float _4472 = _4376 * _4464;
        float _4474 = _4370 * _4464;
        float _4476 = _4380 * _4464;
        bool _4478 = _4470 > 0.0;
        float _4480 = _4470;
        _4278 = _4472;
        _4442 = _4464;
        if (!_4478)
        {
            _4480 = _4364;
        }
        float _4482 = _4480;
        _4446 = _4482;
        if (!_4478)
        {
            _4450 = _4360;
        }
        float _4484 = _4450;
        _4452 = _4484;
        if (!_4478)
        {
            _4458 = _4366;
        }
        float _4486 = _4458;
        bool _4488 = !_4478;
        _4460 = _4486;
        if (!_4488)
        {
            float _4490 = rsqrt(_4468);
            float _4492 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4494 = _235 * _4490;
            float _4496 = _233 * _4490;
            float _4498 = _237 * _4490;
            float _4500 = _4474 * _4494;
            float _4502 = fma(_4472, _4496, _4500);
            float _4504 = _4492 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4506 = fma(_4476, _4498, _4502);
            float _4508 = _4506 * _4504;
            float _4510 = fma(_233, _4508, _4364);
            float _4512 = fma(_235, _4508, _4360);
            float _4514 = fma(_237, _4508, _4366);
            _4452 = _4512;
            _4460 = _4514;
            _4446 = _4510;
            _4442 = _4506;
        }
    }
    float _4516 = _4452;
    float _4518 = _4460;
    float _4520 = _4446;
    float _4522 = _4278;
    float _4524 = _4442;
    float _4526 = _4524;
    float _4528 = _4516;
    float _4530 = _4520;
    float _4532 = _4518;
    float _4534 = _4522;
    if (_4434)
    {
        _4526 = 1.0;
    }
    float _4536 = _4526;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4424 * _4538;
    float _4542 = _4536;
    if (!_4416)
    {
        float _4544 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4546 = _3122 + _4544;
        float _4548 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4550 = _3118 + _4548;
        float _4552 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4554 = -_3122;
        float _4556 = _4554 + _4516;
        float _4558 = _4546 * _4546;
        float _4560 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4562 = _3132 + _4560;
        float _4564 = fma(_4550, _4550, _4558);
        float _4566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4568 = fma(_4562, _4562, _4564);
        float _4570 = sqrt(_4568);
        float _4572 = _4552 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4574 = precise::min(_4570, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4576 = _4574 * _4566;
        float _4578 = -_3132;
        float _4580 = _4578 + _4518;
        float _4582 = _4572 * _4576;
        float _4584 = -_3118;
        float _4586 = _4584 + _4520;
        float _4588 = fma(_4556, _4582, _3122);
        float _4590 = fma(_4586, _4582, _3118);
        float _4592 = fma(_4580, _4582, _3132);
        _4528 = _4588;
        _4530 = _4590;
        _4532 = _4592;
    }
    float _4594 = _4528;
    float _4596 = _4530;
    float _4598 = _4532;
    if (!_4434)
    {
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4604 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4602;
        float _4606 = _4600 * 0.15915493667125701904296875;
        float _4608 = _4606 * 6.283185482025146484375;
        float _4610 = cos(_4608);
        float _4612 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4614 = _4612 * 0.15915493667125701904296875;
        float _4616 = _4606 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = 1.0 / _4610;
        float _4622 = _4614 * 6.283185482025146484375;
        float _4624 = cos(_4622);
        float _4626 = _4618 * _4620;
        float _4628 = _4614 * 6.283185482025146484375;
        float _4630 = sin(_4628);
        float _4632 = _4624 * _4626;
        float _4634 = 1.0 / _4604;
        float _4636 = 1.0 / _4632;
        float _4638 = _4630 * _4636;
        float _4640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4642 = fma(_4540, _4638, _4640);
        float _4644 = _4642 * _4634;
        float _4646 = precise::clamp(_4644, 0.0, 1.0);
        _4542 = _4646;
    }
    float _4648 = _4542;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4652 = _4594 + _4650;
    float _4654 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4656 = _4596 + _4654;
    float _4658 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4660 = _4598 + _4658;
    float _4662 = _4652 * _4652;
    float _4664 = fma(_4656, _4656, _4662);
    float _4666 = fma(_4660, _4660, _4664);
    float _4668 = rsqrt(_4666);
    float _4670 = sqrt(_4666);
    float _4672 = _4668 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4674 = _4656 * _4672;
    float _4676 = _4660 * _4672;
    float _4678 = _4674 * _4674;
    float _4680 = _4676 * _4676;
    float _4682 = _4678 + _4680;
    float _4684 = sqrt(_4682);
    bool _4686 = _4684 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4688 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4690 = _4684 + _4688;
    float _4692 = _4668;
    float _4694 = _4682;
    float _4696 = _4690;
    float _4698 = _4652;
    if (_4686)
    {
        float _4700 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4692 = _4700;
    }
    float _4702 = _4692;
    if (_4686)
    {
        float _4704 = rsqrt(_4682);
        _4694 = _4704;
    }
    float _4706 = _4694;
    float _4708 = _4706;
    if (_4686)
    {
        float _4710 = _4690 * _4702;
        _4696 = _4710;
    }
    float _4712 = _4696;
    if (_4686)
    {
        float _4714 = _4712 * 0.15915493667125701904296875;
        _4534 = _4714;
    }
    float _4716 = _4534;
    float _4718 = _4660;
    if (_4686)
    {
        float _4720 = _4716 * 6.283185482025146484375;
        float _4722 = sin(_4720);
        _4718 = _4722;
    }
    float _4724 = _4718;
    float _4726 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4728 = precise::max(0.0, _4726);
    float _4730 = _4702;
    if (_4686)
    {
        float _4732 = _4716 * 6.283185482025146484375;
        float _4734 = cos(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = -_4672;
    float _4740 = -_4728;
    float _4742 = fma(_4652, _4738, _4740);
    float _4744 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4686)
    {
        float _4746 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4698 = _4746;
    }
    float _4748 = _4698;
    float _4750 = fma(_3118, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4752 = _4748;
    if (!_4686)
    {
        _4744 = _4742;
    }
    float _4754 = _4744;
    float _4756 = _4724;
    float _4758 = _4754;
    if (_4686)
    {
        float _4760 = fma(_4724, _4748, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4752 = _4760;
    }
    float _4762 = _4752;
    float _4764 = _4762;
    if (!_4686)
    {
        _4756 = _4674;
    }
    float _4766 = _4756;
    float _4768 = floor(_4750);
    float _4770 = _4766;
    float _4772 = _4736;
    if (_4686)
    {
        float _4774 = _4736 + (-1.0);
        _3680 = _4774;
    }
    float _4776 = _3680;
    float _4778 = _4776;
    if (_4686)
    {
        float _4780 = _4706 * _4762;
        _3682 = _4780;
    }
    float _4782 = _3682;
    if (!_4686)
    {
        _4764 = _4678;
    }
    float _4784 = _4764;
    float _4786 = _4784;
    if (_4686)
    {
        float _4788 = _4776 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4788;
    }
    float _4790 = _4708;
    if (_4686)
    {
        float _4792 = _4674 * _4782;
        _4770 = _4792;
    }
    float _4794 = _4770;
    if (!_4686)
    {
        _4778 = _4676;
    }
    float _4796 = _4778;
    float _4798 = _4796;
    if (_4686)
    {
        float _4800 = _4676 * _4782;
        _4798 = _4800;
    }
    float _4802 = _4798;
    if (_4686)
    {
        float _4804 = fma(_4742, _4736, _4790);
        _4758 = _4804;
    }
    float _4806 = _4758;
    if (_4686)
    {
        float _4808 = _4794 * _4794;
        _4786 = _4808;
    }
    float _4810 = _4786;
    if (!_4686)
    {
        _4772 = _4680;
    }
    float _4812 = _4772;
    float _4814 = _4812;
    if (_4686)
    {
        float _4816 = _4802 * _4802;
        _4814 = _4816;
    }
    float _4818 = _4814;
    float _4820 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4822 = fma(_4806, _4806, _4810);
    float _4824 = -_4768;
    float _4826 = _4750 + _4824;
    float _4828 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4820);
    float _4830 = _4822 + _4818;
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4828);
    float _4840 = rsqrt(_4830);
    float _4842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4844 = _4838 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4846 = -_4836;
    float _4848 = _4846 + 1.0;
    float _4850 = fma(_3132, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4852 = _4844 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4856 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = abs(_4848);
    float _4860 = log2(_4858);
    float _4862 = -_4852;
    float _4864 = fma(_4862, _4842, 1.0);
    float _4866 = _4594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4868 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4870 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4854);
    float _4872 = _4840 * _4794;
    float _4874 = fma(_4596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4866);
    float _4876 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4868);
    float _4878 = _4840 * _4806;
    float _4880 = _4872 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4882 = _4840 * _4802;
    float _4884 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4874);
    float _4886 = _4876 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4888 = -_4880;
    float _4890 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4888);
    float _4892 = fma(_4598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4870);
    float _4894 = _4884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4896 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = -_4882;
    float _4900 = fma(_4898, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4890);
    float _4902 = floor(_4850);
    float _4904 = _4892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4906 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = fma(_4900, -0.5, 0.5);
    float _4910 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4912 = fma(_4900, 0.5, 0.5);
    float _4914 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4916 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4918 = sqrt(_4908);
    float _4920 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4914);
    float _4922 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4924 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4916);
    float _4926 = fma(_4912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4928 = _4878 + 1.0;
    float _4930 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4922);
    float _4932 = -_4902;
    float _4934 = _4850 + _4932;
    float _4936 = exp2(_4910);
    float _4938 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4940 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4930);
    float _4942 = fma(_4912, _4926, -0.212114393711090087890625);
    float _4944 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4938);
    float _4946 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4940);
    float _4948 = fma(_4912, _4942, 1.570728778839111328125);
    float _4950 = 1.0 / _4920;
    float _4952 = _4918 * 0.636619746685028076171875;
    float _4954 = log2(_4864);
    float _4956 = -_4878;
    float _4958 = fma(_4936, _4928, _4956);
    float _4960 = fma(_4958, 0.5, 0.5);
    float _4962 = _4944 * _4950;
    float _4964 = _4946 * _4950;
    float _4966 = -_4948;
    float _4968 = fma(_4952, _4966, 1.0);
    float2 _12755 = float2(_4826, _4934);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12755, float2(0.0), isnan(_12755)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12755, float2(0.0), isnan(_12755)), level(0.0)).x;
    float _4972 = fma(_4962, 0.5, 0.5);
    float _4974 = fma(_4964, -0.5, 0.5);
    float _4976 = _4954 * 0.693147182464599609375;
    float _4978 = _4976 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float3 _12777 = float3(_4972, _4974, _4978);
    float _4980 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12777, float3(0.0), isnan(_12777)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12777, float3(0.0), isnan(_12777)), level(0.0)).x;
    float3 _12788 = float3(_4972, _4974, _4978);
    float4 _4983 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12788, float3(0.0), isnan(_12788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12788, float3(0.0), isnan(_12788)), level(0.0)).xyzw;
    float _4985 = _4983.x;
    float _4987 = _4983.y;
    float _4989 = _4983.z;
    float _4991 = _4983.w;
    float2 _12804 = float2(_4968, _4960);
    float3 _4995 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4997 = _4995.x;
    float _4999 = _4995.y;
    float _5001 = _4995.z;
    float _5003 = abs(_4540);
    float _5005 = log2(_5003);
    out.m_96.x = _4596;
    out.m_96.y = _4594;
    out.m_96.z = _4598;
    bool _5007 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5009 = isnan(_4670);
    bool _5011 = _5007 || _5009;
    bool _5013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5015 = _5011 || _5013;
    float _5017 = _5005 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5019 = exp2(_5017);
    float _5021 = _4886 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5023 = fma(_4894, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5021);
    float _5025 = fma(_4844, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5023);
    float _5027 = fma(_4904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5025);
    float _5029 = in.m_98.x;
    float _5031 = fma(_5019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5033 = precise::clamp(_5031, 0.0, 1.0);
    float _5035 = _5027 + _4920;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4946;
    out.gl_Position.z = _5027;
    out.gl_Position.w = _4920;
    float _5037 = fma(_5033, -2.0, 3.0);
    float _5039 = _5033 * _5033;
    float _5041 = _5035 * 0.5;
    float _5043 = _5039 * _5037;
    float _5045 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5047 = _4540 <= 8000.0;
    bool _5049 = isnan(_4540);
    bool _5051 = _5047 || _5049;
    bool _5053 = isnan(8000.0);
    bool _5055 = _5051 || _5053;
    float _5057 = float(_5055);
    float _5059 = _4944 + _4920;
    float _5061 = -_5043;
    float _5063 = _5061 + 1.0;
    float _5065 = exp2(_5045);
    float _5067 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5043);
    float _5069 = _4920 * 0.5;
    float _5071 = _5059 * 0.5;
    float _5073 = _5057 * _5067;
    float _5075 = fma(_4946, -0.5, _5069);
    float _5077 = _5073 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5079 = _4920;
    float _5081 = _5027;
    float _5083 = _4946;
    float _5085 = _4944;
    if (!_5015)
    {
        _5079 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5087 = _5079;
    out.m_100.x = _5071;
    out.m_100.y = _5075;
    out.m_100.z = _5041;
    out.m_100.w = _4920;
    float _5089 = _5087;
    float _5091 = _5087;
    if (!_5015)
    {
        _5081 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5081;
    float _5095 = _5093;
    float _5097 = _5093;
    if (!_5015)
    {
        _5083 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5099 = _5083;
    float _5101 = -_5065;
    float _5103 = _5101 + 1.0;
    float _5105 = _5099;
    float _5107 = _5099;
    if (!_5015)
    {
        _5085 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5109 = _5085;
    float _5111 = _5103 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5113 = -_4970;
    float _5115 = _5113 + 1.0;
    float _5117 = _5115 * _5077;
    float _5119 = precise::clamp(_5117, 0.0, 1.0);
    float _5121 = -_5119;
    float _5123 = fma(_5121, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5125 = _5111 * _4980;
    float _5127 = _5123 * _5029;
    float _5129 = -_5111;
    float _5131 = _5129 + 1.0;
    float _5133 = _4991 * _5125;
    float _5135 = _5001 * _5125;
    float _5137 = _4991 * _5131;
    float _5139 = fma(_4997, _5133, _4985);
    float _5141 = fma(_4999, _5133, _4987);
    float _5143 = _5127 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5145 = fma(_4991, _5135, _4989);
    float _5147 = _4648 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5149 = _5127;
    float _5151 = _5133;
    float _5153 = _5109;
    float _5155 = _5109;
    if (!_5015)
    {
        _5149 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5157 = _5149;
    out.m_102.x = _5143;
    float _5159 = _5157;
    float _5161 = _5157;
    if (!_5015)
    {
        _5151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5163 = _5151;
    out.m_104.x = _5139;
    out.m_104.y = _5141;
    out.m_104.z = _5145;
    out.m_104.w = _5137;
    bool _5165 = !_5015;
    float _5167 = _5163;
    float _5169 = _5163;
    if (!_5165)
    {
        bool _5171 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5173 = isnan(_4670);
        bool _5175 = _5171 || _5173;
        bool _5177 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5179 = _5175 || _5177;
        if (!_5179)
        {
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5183 = _4670 + _5181;
            float _5185 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5187 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5185;
            float _5189 = 1.0 / _5187;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5203 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5205 = _5203 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5211 = _5183 * _5189;
            float _5213 = precise::clamp(_5211, 0.0, 1.0);
            float _5215 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5217 = _5215 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5219 = fma(_5213, _5193, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5221 = fma(_5213, _5217, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5223 = fma(_5213, _5197, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5225 = fma(_5213, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5227 = fma(_5213, _5205, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5229 = fma(_5213, _5209, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5221;
            _5155 = _5227;
            _5161 = _5219;
            _5107 = _5225;
            _5097 = _5223;
            _5169 = _5229;
            _5231 = true;
        }
        else
        {
            bool _5233 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5235 = isnan(_4670);
            bool _5237 = _5233 || _5235;
            bool _5239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5241 = _5237 || _5239;
            if (!_5241)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5243 = _5159;
            _5161 = _5243;
            if (!_5241)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5245 = _5089;
            _5091 = _5245;
            if (!_5241)
            {
                _5095 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5247 = _5095;
            _5097 = _5247;
            if (!_5241)
            {
                _5105 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5249 = _5105;
            _5107 = _5249;
            if (!_5241)
            {
                _5153 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5251 = _5153;
            _5155 = _5251;
            if (!_5241)
            {
                _5167 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5253 = _5167;
            bool _5255 = !_5241;
            _5169 = _5253;
            if (!_5255)
            {
                bool _5257 = _4670 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5259 = isnan(_4670);
                bool _5261 = _5257 || _5259;
                bool _5263 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5265 = _5261 || _5263;
                if (!_5265)
                {
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5269 = _4670 + _5267;
                    float _5271 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5273 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5271;
                    float _5275 = 1.0 / _5273;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5289 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5291 = _5289 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5297 = _5269 * _5275;
                    float _5299 = precise::clamp(_5297, 0.0, 1.0);
                    float _5301 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5303 = _5301 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5305 = fma(_5299, _5279, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5307 = fma(_5299, _5303, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5309 = fma(_5299, _5283, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5311 = fma(_5299, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5313 = fma(_5299, _5291, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5315 = fma(_5299, _5295, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5307;
                    _5155 = _5313;
                    _5161 = _5305;
                    _5107 = _5311;
                    _5097 = _5309;
                    _5169 = _5315;
                    _5231 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5155 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5107 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5097 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5169 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5231 = false;
    float _5317 = _5091;
    float _5319 = _5155;
    float _5321 = _5161;
    float _5323 = _5107;
    float _5325 = _5097;
    float _5327 = _5169;
    float _5329 = fma(_4262, -0.5, 0.5);
    float _5331 = precise::clamp(_5329, 0.0, 1.0);
    float _5333 = -_5317;
    float _5335 = _5333 + _5319;
    float _5337 = _5147 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5339 = -_5321;
    float _5341 = _5339 + _5323;
    out.m_106.x = 0.0;
    float _5343 = fma(_5331, _5335, _5317);
    float _5345 = fma(_5331, _5341, _5321);
    out.m_55.x = _5337;
    float _5347 = -_5325;
    float _5349 = _5347 + _5327;
    float _5351 = _5343 * 0.586610972881317138671875;
    bool _5353 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5355 = fma(_5331, _5349, _5325);
    float _5357 = fma(_5345, 0.298911988735198974609375, _5351);
    bool _5359 = _4648 > 0.0;
    bool _5361 = isnan(_4648);
    bool _5363 = _5359 || _5361;
    bool _5365 = isnan(0.0);
    bool _5367 = _5363 || _5365;
    float _5369 = fma(_5355, 0.114477999508380889892578125, _5357);
    float _5371 = -_5369;
    float _5373 = _5345 + _5371;
    float _5375 = -_5369;
    float _5377 = _5343 + _5375;
    float _5379 = -_5369;
    float _5381 = _5355 + _5379;
    float _5383 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5385 = fma(_5377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    float _5387 = fma(_5381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5369);
    bool _5389 = !_5353;
    if (!_5389)
    {
        float _5391 = -_4594;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5395 = -_4596;
        float _5397 = _5395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5399 = -_4598;
        float _5401 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5403 = _5393 * _5393;
        float _5405 = fma(_5397, _5397, _5403);
        float _5407 = fma(_5401, _5401, _5405);
        float _5409 = sqrt(_5407);
        float _5411 = rsqrt(_5407);
        float _5413 = -_5409;
        float _5415 = _5413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5417 = _5415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5419 = precise::clamp(_5417, 0.0, 1.0);
        float _5421 = _5397 * _5411;
        float _5423 = _5393 * _5411;
        float _5425 = abs(_5419);
        float _5427 = log2(_5425);
        float _5429 = _5401 * _5411;
        float _5431 = _5421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5433 = _4262 * _5423;
        float _5435 = -_5423;
        float _5437 = -_5431;
        float _5439 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5437);
        float _5441 = fma(_4258, _5421, _5433);
        float _5443 = -_5429;
        float _5445 = fma(_5443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5439);
        float _5447 = fma(_4266, _5429, _5441);
        float _5449 = precise::clamp(_5447, 0.0, 1.0);
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5453 = _5445 + _5451;
        float _5455 = _5427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5457 = _5453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5459 = precise::clamp(_5457, 0.0, 1.0);
        float _5461 = exp2(_5455);
        float _5463 = _5461 * _5459;
        float _5465 = _5449 * _5463;
        float _5467 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5469 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5471 = _5465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_106.x = _5467;
        out.m_106.y = _5469;
        out.m_106.z = _5471;
    }
    out.m_108.x = _5383;
    out.m_108.y = _5385;
    out.m_108.z = _5387;
    if (_5367)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

