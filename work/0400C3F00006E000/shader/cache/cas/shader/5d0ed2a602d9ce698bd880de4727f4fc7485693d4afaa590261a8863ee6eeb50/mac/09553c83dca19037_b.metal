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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_98 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_88 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_100 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_86 [[user(locn15)]];
    float4 m_104 [[user(locn16)]];
    float4 m_102 [[user(locn17)]];
    float4 m_80 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_74 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4773 = false;
    bool _3936 = false;
    bool _561 = false;
    bool _463 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_46.w;
    float _120 = in.m_48.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = as_type<float>(_125);
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_53.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5084 = as_type<float>(_147);
        out.gl_Position.z = _5084;
    }
    if (!_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_51.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_179);
        out.gl_Position.z = _5147;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    float _201 = in.m_64.x;
    float _203 = in.m_64.y;
    float _205 = in.m_64.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_66.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_68.x;
    float _289 = in.m_68.y;
    float _291 = 1.0 / _281;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 1.0 / _277;
    bool _297 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_265);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _285;
    float _311 = _269 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = _315 * _291;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = _273 * _309;
    float _341 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _343 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_265);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_307;
    float _363 = _361 + 1.0;
    float _365 = _307 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_265);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _353 * _363;
    float _385 = -_353;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = fma(_369, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = _381 * _387;
    float _397 = -_381;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _341 * _395;
    float _405 = _359 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_401, _383, _415);
    float _425 = fma(_393, _383, _417);
    float _427 = fma(_419, _365, _423);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_293;
    float _441 = _287;
    float _443 = _321;
    float _461;
    if (!_439)
    {
        float _445 = in.m_66.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _173;
    }
    _463 = false;
    float _465 = _461;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _481;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _507;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _531;
    out.m_70.y = _533;
    out.m_70.z = _537;
    out.m_70.w = _539;
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_66.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = 1.0 / _587;
    float _627 = _603 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    float _637 = fma(_627, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _639 = _599 * _621;
    float _641 = -_599;
    float _643 = _641 + 1.0;
    float _645 = _583 * _635;
    float _647 = _631 * _625;
    float _649 = _637 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _653 = _563 + _651;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[131].x, _649);
    float _657 = fma(_647, _653, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _645, _655);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _665;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_72.w = _675;
    bool _677 = !_623;
    float _679 = _671;
    if (!_677)
    {
        float _681 = in.m_66.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _701 = int(_699);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = float(_701);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _711 = int(_709);
    float _713 = float(uint(_705));
    float _715 = 1.0 / _707;
    int _717 = ~_705;
    int _719 = _717 + 1;
    int _721 = ~_705;
    int _723 = _721 + 1;
    float _725 = 1.0 / _713;
    float _727 = float(uint(_711));
    float _729 = _715 * _129;
    float _731 = 1.0 / _727;
    int _733 = as_type<int>(_725) + (-2);
    float _735 = trunc(_729);
    int _737 = int(_735);
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _741 = int(_739);
    float _743 = float(uint(_737));
    float _745 = as_type<float>(_733) * _743;
    float _747 = float(_741);
    float _749 = trunc(_745);
    float _751 = precise::max(_749, 0.0);
    uint _754 = uint(_751);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = 1.0 / _747;
    float _762 = _707;
    float _764 = as_type<float>(_741);
    float _766 = _747;
    if (_758)
    {
        float _768 = in.m_66.x;
        float _770 = in.m_66.y;
        _762 = _768;
        _764 = _770;
    }
    float _772 = _762;
    float _774 = _764;
    float _776 = 0.0;
    if (_758)
    {
        _776 = 1.0;
    }
    float _778 = _776;
    int _780 = _719 * int(_754);
    int _782 = _780 + _737;
    float _784 = _778;
    if (_758)
    {
        _679 = 1.0;
    }
    float _786 = _679;
    int _788 = 0;
    float _790 = _786;
    if (_758)
    {
        _788 = 0;
    }
    int _792 = _788;
    float _794 = _760 * _129;
    float _796 = float(uint(_782));
    float _798 = as_type<float>(_733) * _796;
    float _800 = trunc(_794);
    int _802 = int(_800);
    float _804 = 0.0;
    float _806 = _772;
    float _808 = _774;
    int _810 = _792;
    if (_758)
    {
        _804 = _772;
    }
    float _812 = _804;
    float _814 = trunc(_798);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = _812;
    if (_758)
    {
        _441 = _774;
    }
    float _822 = _441;
    float _824 = _822;
    if (_758)
    {
        _443 = _812;
    }
    float _826 = _443;
    float _828 = _826;
    if (_758)
    {
        _766 = _812;
    }
    float _830 = _766;
    float _832 = _830;
    if (!_758)
    {
        float _834 = in.m_66.x;
        float _836 = in.m_66.y;
        float _838 = in.m_66.z;
        float _840 = _834 * 3.1415927410125732421875;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = _836 * 3.1415927410125732421875;
        float _846 = _844 * 0.15915493667125701904296875;
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        _784 = 7.345489978790283203125;
        _806 = _834;
        _790 = 5.839270114898681640625;
        _832 = _838;
        _820 = _836;
        _808 = _836;
        _824 = _854;
        _828 = _850;
        _810 = 2;
    }
    float _856 = _784;
    float _858 = _806;
    float _860 = _790;
    float _862 = _832;
    float _864 = _820;
    float _866 = _808;
    float _868 = _824;
    float _870 = _828;
    int _872 = _810;
    float _874 = in.m_66.z;
    int _876 = int(_754) + int(_818);
    float _878 = _856 * _858;
    float _880 = _860 * _862;
    int _882 = as_type<int>(_731) + (-2);
    float _884 = floor(_878);
    float _886 = float(uint(_802));
    int _888 = _723 * _876;
    int _890 = _888 + _737;
    float _892 = float(_737);
    float _894 = _856 * _864;
    float _896 = as_type<float>(_882) * _886;
    bool _898 = uint(_890) >= uint(_705);
    float _900 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _902 = log2(_900);
    float _904 = float(_705);
    float _906 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _908 = !_898;
    int _910 = _908 ? 0 : (-1);
    float _912 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _914 = _892 >= _904;
    bool _916 = isnan(_892);
    bool _918 = _914 || _916;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    bool _926 = _705 == 0;
    float _928 = trunc(_896);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    int _934 = ~_711;
    int _936 = _934 + 1;
    float _938 = -_884;
    float _940 = _878 + _938;
    bool _942 = _874 > 0.5;
    int _944 = ~_876;
    int _946 = _944 + _910;
    int _948 = _946 + 1;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _956 = _954 != 0;
    float _958 = trunc(_924);
    int _960 = int(_958);
    bool _962 = _866 > 0.5;
    float _964 = _940 * _904;
    float _966 = -_223;
    int _968 = _942 ? as_type<int>(_966) : as_type<int>(_223);
    float _970 = _169 * _129;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _974 = _972 != 0;
    int _976 = _936 * int(_932);
    int _978 = _976 + _802;
    float _980 = -_219;
    int _982 = _962 ? as_type<int>(_980) : as_type<int>(_219);
    float _984 = trunc(_964);
    int _986 = int(_984);
    float _988 = _904 * _970;
    float _990 = float(uint(_978));
    bool _992 = !_956;
    float _994 = _992 ? _223 : as_type<float>(_968);
    int _996 = _705 * _948;
    int _998 = _996 + _737;
    bool _1000 = !_952;
    float _1002 = _1000 ? _219 : as_type<float>(_982);
    float _1004 = as_type<float>(_882) * _990;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1016 = _1014 != 0;
    float _1018 = trunc(_988);
    int _1020 = int(_1018);
    bool _1022 = !_974;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = ~_960;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    bool _1036 = !_926;
    int _1038 = _1036 ? _998 : (-1);
    float _1040 = trunc(_1004);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = abs(_1024);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    int _1052 = _1038 * _1030;
    int _1054 = _705 + (-1);
    bool _1056 = !_1050;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1034);
    int _1062 = _960 * _1054;
    int _1064 = _1062 + _1052;
    float _1066 = floor(_880);
    float _1068 = float(_711);
    int _1070 = _1064 * _1060;
    float _1072 = float(_802);
    int _1074 = _986 * _1046;
    int _1076 = _1074 + _737;
    bool _1078 = !_1008;
    int _1080 = _1078 ? 0 : 1;
    int _1082 = int(_932) + int(_1044);
    int _1084 = abs(_1080);
    bool _1086 = !_1016;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = ~_711;
    int _1092 = _1090 + 1;
    int _1094 = _1020 * _1084;
    int _1096 = _1094 + _1070;
    int _1098 = abs(_1088);
    float _1100 = -_1066;
    float _1102 = _880 + _1100;
    int _1104 = abs(_1058);
    int _1106 = _1092 * _1082;
    int _1108 = _1106 + _802;
    float _1110 = _1102 * _1068;
    bool _1112 = _1072 >= _1068;
    bool _1114 = isnan(_1072);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1068);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = _1068 * _970;
    int _1126 = _1076 * _1098;
    int _1128 = _1126 + _1096;
    bool _1130 = uint(_1108) >= uint(_711);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _711 == 0;
    int _1138 = _986 * _1104;
    int _1140 = _1138 + _1128;
    bool _1142 = !_1130;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = ~_1082;
    int _1152 = _1150 + _1144;
    int _1154 = _1152 + 1;
    float _1156 = trunc(_1122);
    int _1158 = int(_1156);
    bool _1160 = !_1148;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = float(uint(_1140));
    int _1166 = abs(_1162);
    int _1168 = _711 * _1154;
    int _1170 = _1168 + _802;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_733) * _1164;
    float _1186 = trunc(_1124);
    int _1188 = int(_1186);
    bool _1190 = !_1136;
    int _1192 = _1190 ? _1170 : (-1);
    int _1194 = ~_705;
    int _1196 = _1194 + 1;
    int _1198 = _1134 * _1166;
    int _1200 = _1198 + _802;
    int _1202 = _711 + (-1);
    int _1204 = ~_1158;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = trunc(_1184);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1192 * _1208;
    bool _1226 = !_1178;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1174;
    int _1232 = _1230 ? 0 : 1;
    int _1234 = _1158 * _1202;
    int _1236 = _1234 + _1224;
    int _1238 = abs(_1228);
    int _1240 = abs(_1232);
    float _1242 = in.m_66.w;
    int _1244 = _1196 * int(_1214);
    int _1246 = _1244 + _1140;
    bool _1248 = !_1182;
    int _1250 = _1248 ? 0 : 1;
    bool _1252 = _705 == 0;
    int _1254 = _1236 * _1238;
    int _1256 = abs(_1250);
    float _1258 = float(uint(_1246));
    int _1260 = _1188 * _1240;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1218;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = as_type<float>(_733) * _1258;
    int _1270 = abs(_1266);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1200 * _1256;
    int _1278 = _1276 + _1262;
    float _1280 = trunc(_1268);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = 0.0;
    if (!_1222)
    {
        _1286 = _219;
    }
    float _1288 = _1286;
    int _1290 = _1134 * _1270;
    int _1292 = _1290 + _1278;
    int _1294 = ~_705;
    int _1296 = _1294 + 1;
    float _1298 = -_223;
    int _1300 = _962 ? as_type<int>(_1298) : as_type<int>(_223);
    float _1302 = float(uint(_1292));
    float _1304 = 0.0;
    float _1306 = _1302;
    float _1308 = _1288;
    if (!_1274)
    {
        _1304 = _223;
    }
    float _1310 = _1304;
    float _1312 = as_type<float>(_882) * _1302;
    float _1314 = _1310;
    if (_1222)
    {
        float _1316 = _1242 * 3.1415927410125732421875;
        _1306 = _1316;
    }
    float _1318 = _1306;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = trunc(_1312);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = int(_1214) + int(_1284);
    float _1330 = _1318;
    if (_1222)
    {
        float _1332 = _1318 * 0.15915493667125701904296875;
        _1330 = _1332;
    }
    float _1334 = _1330;
    int _1336 = ~_711;
    int _1338 = _1336 + 1;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1342 = _1296 * _1328;
    int _1344 = _1342 + _1140;
    float _1346 = _1334;
    if (_1222)
    {
        float _1348 = _1334 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        _1346 = _1350;
    }
    float _1352 = _1346;
    float _1354 = float(uint(_1200));
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1358 = uint(_1344) >= uint(_705);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1362 = as_type<float>(_882) * _1354;
    bool _1364 = !_1358;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1338 * int(_1326);
    int _1370 = _1368 + _1292;
    bool _1372 = _1242 > 0.5;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1376 = ~_1328;
    int _1378 = _1376 + _1366;
    int _1380 = _1378 + 1;
    float _1382 = float(uint(_1370));
    float _1384 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1374);
    float _1386 = -_223;
    int _1388 = _1372 ? as_type<int>(_1386) : as_type<int>(_223);
    int _1390 = _705 * _1380;
    int _1392 = _1390 + _1140;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_882) * _1382;
    int _1400 = ~_711;
    int _1402 = _1400 + 1;
    float _1404 = _868 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1406 = !_1396;
    float _1408 = _1406 ? _223 : as_type<float>(_1388);
    float _1410 = trunc(_1398);
    float _1412 = precise::max(_1410, 0.0);
    uint _1414 = uint(_1412);
    bool _1416 = _1396;
    if (_1222)
    {
        bool _1418 = _1352 > 0.5;
        _1416 = _1418;
    }
    bool _1420 = _1416;
    float _1422 = as_type<float>(_1388);
    if (_1274)
    {
        float _1424 = in.m_66.x;
        _1422 = _1424;
    }
    float _1426 = _1422;
    bool _1428 = !_1252;
    int _1430 = _1428 ? _1392 : (-1);
    float _1432 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1384);
    if (_1222)
    {
        float _1434 = -_219;
        float _1436 = _1420 ? _1434 : _219;
        _1308 = _1436;
    }
    float _1438 = _1308;
    float _1440 = -_1408;
    float _1442 = _1440 + 0.5;
    int _1444 = _1430 & 3;
    bool _1446 = _1444 != 0;
    float _1448 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1450 = int(_1448);
    int _1452 = _1430 & 3;
    bool _1454 = _1452 != 0;
    float _1456 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _1446 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1460 = uint(_1452) > 1u;
    bool _1462 = _711 == 0;
    int _1464 = int(_1326) + int(_1414);
    int _1466 = ~as_type<int>(_1458);
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = int(_962);
    int _1474 = _1274 ? 2 : 0;
    int _1476 = _1472 | _1474;
    int _1478 = _1460 ? 4 : 0;
    int _1480 = _1476 | _1478;
    int _1482 = _1454 ? 8 : 0;
    int _1484 = _1480 | _1482;
    int _1486 = _1174 ? 16 : 0;
    int _1488 = _1484 | _1486;
    int _1490 = _1462 ? 32 : 0;
    int _1492 = _1488 | _1490;
    int _1494 = _1182 ? 64 : 0;
    int _1496 = _1492 | _1494;
    int _1498 = _1496 & 8;
    int _1500 = _1402 * _1464;
    int _1502 = _1500 + _1292;
    float _1504 = float(uint(_1450));
    int _1506 = _1470;
    float _1508 = _1458;
    if (!_1460)
    {
        int _1510 = ~as_type<int>(_1458);
        int _1512 = _1510 + 1;
        _1506 = _1512;
    }
    int _1514 = _1506;
    if (_1274)
    {
        float _1516 = _1426 * 3.1415927410125732421875;
        _1508 = _1516;
    }
    float _1518 = _1508;
    bool _1520 = uint(_1452) >= 2u;
    int _1522 = ~_1450;
    int _1524 = _1522 + 1;
    float _1526 = _1518;
    if (_1274)
    {
        float _1528 = _1518 * 0.15915493667125701904296875;
        _1526 = _1528;
    }
    float _1530 = _1526;
    int _1532 = _1520 ? 0 : 1;
    bool _1534 = uint(_1502) >= uint(_711);
    int _1536 = ~_1532;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = _1530;
    int _1544 = _1540;
    if (_1274)
    {
        float _1546 = _1530 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    bool _1552 = !_1534;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = _1452 != 3;
    int _1558 = ~_1464;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    float _1564 = float(_1450);
    int _1566 = _711 * _1562;
    int _1568 = _1566 + _1292;
    float _1570 = _1564 * _970;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1574 = !_1462;
    int _1576 = _1574 ? _1568 : (-1);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1582 = int(_1580);
    bool _1584 = _1556;
    if (_1556)
    {
        int _1586 = ~_1532;
        int _1588 = _1586 + 1;
        _1544 = _1588;
    }
    int _1590 = _1544;
    if (_1274)
    {
        bool _1592 = _1550 > 0.5;
        _1584 = _1592;
    }
    bool _1594 = _1584;
    float _1596 = fma(_1404, -2.0, _1578);
    if (_1274)
    {
        float _1598 = -_223;
        float _1600 = _1594 ? _1598 : _223;
        _1314 = _1600;
    }
    float _1602 = _1314;
    float _1604 = 1.0 / _1504;
    int _1606 = _1576 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1612 = _1576 & 3;
    bool _1614 = _1612 != 0;
    float _1616 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1596);
    int _1618 = _1608 ? 0 : 1;
    float _1620 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1610);
    bool _1622 = uint(_1612) > 1u;
    float _1624 = trunc(_1570);
    int _1626 = int(_1624);
    float _1628 = float(_1582);
    float _1630 = _866 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1632 = ~_1618;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = int(_962);
    int _1640 = _1622 ? 2 : 0;
    int _1642 = _1638 | _1640;
    int _1644 = _1614 ? 4 : 0;
    int _1646 = _1642 | _1644;
    int _1648 = _1454 ? 8 : 0;
    int _1650 = _1646 | _1648;
    int _1652 = _1174 ? 16 : 0;
    int _1654 = _1650 | _1652;
    int _1656 = _1462 ? 32 : 0;
    int _1658 = _1654 | _1656;
    int _1660 = _1182 ? 64 : 0;
    int _1662 = _1658 | _1660;
    int _1664 = _1662 & 4;
    float _1666 = fma(_1630, -2.0, _1320);
    float _1668 = 1.0 / _1628;
    int _1670 = as_type<int>(_1604) + (-2);
    float _1672 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1666);
    int _1674 = ~_705;
    int _1676 = _1674 + 1;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1680 = _1636;
    if (!_1622)
    {
        int _1682 = ~_1618;
        int _1684 = _1682 + 1;
        _1680 = _1684;
    }
    int _1686 = _1680;
    bool _1688 = uint(_1612) >= 2u;
    float _1690 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1678);
    float _1692 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1694 = _870 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1696 = _1688 ? 0 : 1;
    float _1698 = _858 * 2.0;
    bool _1700 = _1612 != 3;
    float _1702 = -_1340;
    float _1704 = fma(_1692, 2.0, _1702);
    int _1706 = ~_1696;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    float _1712 = _1668 * _129;
    float _1714 = _902 * _129;
    float _1716 = -_1356;
    float _1718 = fma(_1694, 2.0, _1716);
    float _1720 = floor(_1698);
    float _1722 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1690);
    float _1724 = -_129;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1704);
    float _1728 = -_129;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1718);
    int _1732 = ~_1450;
    int _1734 = _1732 + 1;
    int _1736 = _1710;
    float _1738 = _1698;
    if (_1700)
    {
        int _1740 = ~_1696;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = trunc(_1712);
    int _1748 = int(_1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1752 = _1750 != 0;
    bool _1754 = !_1752;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1760 = _1758 != 0;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1772 = _1770 != 0;
    float _1774 = exp2(_1714);
    bool _1776 = _874 > 0.5;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1782 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1784 = isnan(_697);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    bool _1794 = !_1760;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / _1780;
    float _1804 = float(uint(_1748));
    bool _1806 = !_1800;
    float _1808 = _1806 ? _223 : as_type<float>(_1300);
    bool _1810 = _872 != 2;
    float _1812 = as_type<float>(_1670) * _1804;
    bool _1814 = !_1764;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = floor(_894);
    bool _1820 = _858 > 0.5;
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    bool _1826 = !_1768;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1772;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1664 != 0;
    if (_1810)
    {
        _1738 = _866;
    }
    float _1846 = _1738;
    float _1848 = _1846;
    if (!_1810)
    {
        _1848 = _858;
    }
    float _1850 = _1848;
    int _1852 = abs(_1816);
    float _1854 = -_1818;
    float _1856 = _894 + _1854;
    float _1858 = float(uint(_1076));
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1862 = -_219;
    int _1864 = _1820 ? as_type<int>(_1862) : as_type<int>(_219);
    float _1866 = _1856 * _1564;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = fma(_1860, -2.0, _1572);
    int _1874 = ~_705;
    int _1876 = _1874 + 1;
    int _1878 = _1524 * int(_1842);
    int _1880 = _1878 + _1748;
    float _1882 = trunc(_1866);
    int _1884 = int(_1882);
    int _1886 = ~_711;
    int _1888 = _1886 + 1;
    int _1890 = abs(_1828);
    float _1892 = float(uint(_1880));
    float _1894 = _866 * 2.0;
    float _1896 = as_type<float>(_1670) * _1892;
    float _1898 = as_type<float>(_733) * _1858;
    float _1900 = _1858;
    if (_1810)
    {
        _1900 = _858;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (!_1810)
    {
        _1904 = _874;
    }
    float _1906 = _1904;
    float _1908 = trunc(_1896);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    bool _1914 = _1720 > 0.0;
    int _1916 = abs(_1836);
    bool _1918 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1920 = isnan(_697);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    int _1930 = abs(_1686);
    float _1932 = trunc(_1898);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    bool _1938 = !_1870;
    float _1940 = _1938 ? _219 : as_type<float>(_1864);
    float _1942 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1944 = _1720 >= 0.0;
    bool _1946 = isnan(_1720);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    int _1954 = abs(_1744);
    float _1956 = -_1360;
    float _1958 = fma(_1942, 2.0, _1956);
    float _1960 = -_219;
    int _1962 = _1776 ? as_type<int>(_1960) : as_type<int>(_219);
    float _1964 = trunc(_1362);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = int(_1842) + int(_1912);
    bool _1972 = !_1832;
    float _1974 = _1972 ? _219 : as_type<float>(_1962);
    int _1976 = abs(_1756);
    bool _1978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1980 = isnan(0.0);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1986 = _1982 || _1984;
    int _1988 = _1876 * int(_1936);
    int _1990 = _1988 + _1076;
    int _1992 = ~_1450;
    int _1994 = _1992 + 1;
    int _1996 = _1884 * _1976;
    int _1998 = _1996 + _1748;
    float _2000 = floor(_1894);
    int _2002 = abs(_1514);
    float _2004 = float(uint(_1990));
    int _2006 = _1888 * int(_1968);
    int _2008 = _2006 + _1200;
    float _2010 = _1986 ? _1824 : 0.0;
    float _2012 = as_type<float>(_733) * _2004;
    float _2014 = float(uint(_1998));
    bool _2016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2018 = isnan(1.0);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2024 = _2020 || _2022;
    float _2026 = as_type<float>(_1670) * _2014;
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2030 = 1.0 + _2028;
    float _2032 = float(uint(_2008));
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2036 = trunc(_2012);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = as_type<float>(_882) * _2032;
    float _2044 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2034);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2048 = ~_1450;
    int _2050 = _2048 + 1;
    float _2052 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2044);
    float _2054 = trunc(_2026);
    float _2056 = precise::max(_2054, 0.0);
    uint _2058 = uint(_2056);
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2062 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2046);
    float _2064 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1620);
    float _2066 = -_2052;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2060);
    float _2072 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2062);
    float _2074 = 1.0 / _2030;
    float _2076 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2070);
    int _2078 = _1994 * int(_2058);
    int _2080 = _2078 + _1998;
    float _2082 = trunc(_2042);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2050 * _1970;
    int _2090 = _2088 + _1748;
    float _2092 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1872);
    float _2094 = float(uint(_2080));
    float _2096 = -_129;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1958);
    float _2100 = as_type<float>(_2002);
    if (_2024)
    {
        float _2102 = _2010 * _2074;
        _139 = _2102;
    }
    float _2104 = _139;
    bool _2106 = uint(_2090) >= uint(_1450);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2112 = as_type<float>(_1670) * _2094;
    int _2114 = _1952 ? 0 : 1;
    float _2116 = in.m_62.w;
    bool _2118 = !_2106;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = trunc(_2112);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    bool _2128 = _2000 > 0.0;
    float _2130 = -_1928;
    float _2132 = _2130 + 1.0;
    bool _2134 = _2000 >= 0.0;
    bool _2136 = isnan(_2000);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(0.0);
    bool _2142 = _2138 || _2140;
    int _2144 = int(_1936) + int(_2040);
    int _2146 = ~_2114;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _2150;
    if (!_1914)
    {
        int _2154 = ~_2114;
        int _2156 = _2154 + 1;
        _2152 = _2156;
    }
    int _2158 = _2152;
    int _2160 = int(_1968) + int(_2086);
    int _2162 = _1676 * _2144;
    int _2164 = _2162 + _1076;
    float _2166 = float(_1748);
    int _2168 = ~_711;
    int _2170 = _2168 + 1;
    bool _2172 = _2166 >= _1564;
    bool _2174 = isnan(_2166);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1564);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = int(_2058) + int(_2126);
    int _2186 = _2170 * _2160;
    int _2188 = _2186 + _1200;
    bool _2190 = uint(_2164) >= uint(_705);
    float _2192 = trunc(_2182);
    int _2194 = int(_2192);
    int _2196 = _1734 * _2184;
    int _2198 = _2196 + _1998;
    int _2200 = _2142 ? 0 : 1;
    bool _2202 = !_2190;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = ~_1970;
    int _2208 = _2206 + _2120;
    int _2210 = _2208 + 1;
    bool _2212 = uint(_2188) >= uint(_711);
    bool _2214 = uint(_2198) >= uint(_1450);
    int _2216 = _1450 * _2210;
    int _2218 = _2216 + _1748;
    bool _2220 = !_2212;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2226 = _2224 != 0;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2230 = _2228 != 0;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2234 = _2232 != 0;
    bool _2236 = _1450 == 0;
    int _2238 = ~_2194;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    bool _2244 = !_2236;
    int _2246 = _2244 ? _2218 : (-1);
    int _2248 = _1450 + (-1);
    int _2250 = ~_2200;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2246 * _2242;
    int _2258 = abs(_1796);
    int _2260 = _2194 * _2248;
    int _2262 = _2260 + _2256;
    int _2264 = ~_1450;
    int _2266 = _2264 + 1;
    int _2268 = _2262 * _1852;
    int _2270 = _2254;
    if (!_2128)
    {
        int _2272 = ~_2200;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _1626 * _2258;
    int _2280 = _2278 + _2268;
    int _2282 = ~_1450;
    int _2284 = _2282 + 1;
    int _2286 = _1998 * _1890;
    int _2288 = _2286 + _2280;
    bool _2290 = !_2214;
    int _2292 = _2290 ? 0 : (-1);
    bool _2294 = !_2230;
    int _2296 = _2294 ? 0 : 1;
    int _2298 = _1884 * _1916;
    int _2300 = _2298 + _2288;
    float _2302 = float(uint(_2300));
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2308 = _1498 != 0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2314 = as_type<float>(_1670) * _2302;
    float _2316 = _874 * 2.0;
    float _2318 = 1.0 / _2306;
    bool _2320 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2322 = isnan(_697);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    bool _2332 = !_2226;
    int _2334 = _2332 ? 0 : 1;
    bool _2336 = !_2234;
    int _2338 = _2336 ? 0 : 1;
    float _2340 = float(_2158);
    float _2342 = trunc(_2314);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    int _2348 = abs(_2338);
    int _2350 = ~_2144;
    int _2352 = _2350 + _2204;
    int _2354 = _2352 + 1;
    int _2356 = ~_2184;
    int _2358 = _2356 + _2292;
    int _2360 = _2358 + 1;
    bool _2362 = _711 == 0;
    float _2364 = floor(_2316);
    int _2366 = _705 * _2354;
    int _2368 = _2366 + _1076;
    int _2370 = _1450 * _2360;
    int _2372 = _2370 + _1998;
    int _2374 = _2266 * int(_2346);
    int _2376 = _2374 + _2300;
    float _2378 = float(uint(_2376));
    bool _2380 = _2364 >= 0.0;
    bool _2382 = isnan(_2364);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan(0.0);
    bool _2388 = _2384 || _2386;
    float _2390 = as_type<float>(_1670) * _2378;
    int _2392 = _2388 ? 0 : 1;
    float _2394 = trunc(_2390);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    bool _2400 = _2364 > 0.0;
    int _2402 = ~_2392;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = _2406;
    if (!_2400)
    {
        int _2410 = ~_2392;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    int _2416 = int(_2346) + int(_2398);
    float _2418 = in.m_46.x;
    float _2420 = in.m_46.y;
    float _2422 = in.m_46.z;
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2426 = _2424 != 0;
    int _2428 = _2284 * _2416;
    int _2430 = _2428 + _2300;
    bool _2432 = uint(_2430) >= uint(_1450);
    bool _2434 = !_1844;
    int _2436 = _2434 ? 0 : 1;
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _1612 != 3;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2446 = _2444 != 0;
    float _2448 = 1.0 / _2312;
    bool _2450 = !_2442;
    int _2452 = _2450 ? 0 : (-1);
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2456 = _2454 != 0;
    int _2458 = ~_2416;
    int _2460 = _2458 + _2440;
    int _2462 = _2460 + 1;
    float _2464 = _191 * _2420;
    float _2466 = _203 * _2420;
    float _2468 = 1.0 / _2110;
    float _2470 = _197 * _2420;
    float _2472 = fma(_189, _2418, _2464);
    float _2474 = fma(_201, _2418, _2466);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2480 = fma(_195, _2418, _2470);
    float _2482 = fma(_193, _2422, _2472);
    float _2484 = fma(_205, _2422, _2474);
    float _2486 = fma(_199, _2422, _2480);
    float _2488 = 1.0 / _2478;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2506 = 1.0 / _2492;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2510 = _2508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _2496 * _1802;
    float _2514 = _2504 * _2468;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2520;
    bool _2524 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2526 = isnan(_697);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = 1.0 / _2510;
    float _2538 = _2518 * _2448;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    float _2544 = _2500 * _2318;
    float _2546 = in.m_60.w;
    bool _2548 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_697);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2522 * _2488;
    bool _2562 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2564 = isnan(_697);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2570 = _2566 || _2568;
    float _2572 = float(_2570);
    float _2574 = _2542 * _2506;
    float _2576 = -_2534;
    float _2578 = _2576 + 1.0;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2584 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2586 = isnan(_697);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = in.m_64.w;
    float _2598 = _2558 * _2578;
    float _2600 = -_2558;
    float _2602 = _2600 + 1.0;
    float _2604 = -_2572;
    float _2606 = _2604 + 1.0;
    float _2608 = -_2594;
    float _2610 = _2608 + 1.0;
    float _2612 = _2582 * _2536;
    float _2614 = _2572 * _2602;
    float _2616 = _2594 * _2606;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2620 = _697 + _2618;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2624 = _697 + _2622;
    float _2626 = _1792 * _2610;
    float _2628 = -_1792;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2512, _2620, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2634 = fma(_2544, _2624, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2636 = -_2330;
    float _2638 = _2636 + 1.0;
    float _2640 = _2330 * _2630;
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = _2486 + _2116;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2658 = _697 + _2656;
    float _2660 = _2482 + _2546;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2664 = _697 + _2662;
    float _2666 = _2652 * _2132;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2670 = _2654 + _2668;
    float _2672 = fma(_2538, _2658, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2632 * _2666;
    float _2680 = _2484 + _2596;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2660 + _2682;
    float _2686 = _2670 * _2670;
    float _2688 = _1928 * _2638;
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2678);
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2694 = _2680 + _2692;
    float _2696 = fma(_2684, _2684, _2686);
    float _2698 = fma(_2514, _2664, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2702 = _697 + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2706 = _697 + _2704;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _697 + _2708;
    float _2712 = fma(_2634, _2688, _2690);
    float _2714 = fma(_2694, _2694, _2696);
    float _2716 = fma(_2574, _2702, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2718 = fma(_2612, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2720 = fma(_2672, _2640, _2712);
    float _2722 = _866 + _858;
    float _2724 = sqrt(_2714);
    float _2726 = fma(_2560, _2706, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2728 = _2722 + (-1.0);
    float _2730 = _858 + _874;
    float _2732 = _858 + (-0.5);
    float _2734 = _866 + _874;
    float _2736 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2738 = _866 + (-0.5);
    float _2740 = rsqrt(_2714);
    float _2742 = fma(_2698, _2626, _2720);
    float _2744 = _906 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2746 = _2734 + (-1.0);
    float _2748 = _2730 + (-1.0);
    float _2750 = _2724 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2754 = _1438 + 0.5;
    float _2756 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2758 = _1602 + (-0.5);
    float _2760 = precise::min(_2744, _2750);
    float _2762 = fma(_2726, _2616, _2742);
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1730);
    float _2766 = _1940 + 0.5;
    float _2768 = -_2758;
    float _2770 = -_1616;
    float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2770);
    float _2774 = _2740 * _2760;
    float _2776 = fma(_2718, _2614, _2762);
    int _2778 = abs(_2334);
    float _2780 = in.m_74.x;
    float _2782 = in.m_74.y;
    float _2784 = in.m_74.z;
    float _2786 = _2670 * _2774;
    float _2788 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _2790 = float(_2414);
    float _2792 = _1808 + (-0.5);
    float _2794 = -_2786;
    float _2796 = _2670 + _2794;
    float _2798 = _2684 * _2774;
    float _2800 = _2694 * _2774;
    float _2802 = -_2792;
    float _2804 = -_1672;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2804);
    float _2808 = _2796 * _2796;
    float _2810 = float(_2778);
    float _2812 = -_2798;
    float _2814 = _2684 + _2812;
    int _2816 = abs(_2296);
    float _2818 = fma(_2716, _2598, _2776);
    float _2820 = -_1722;
    float _2822 = _2820 + 1.0;
    float _2824 = _2810 * _2790;
    float _2826 = fma(_2814, _2814, _2808);
    float _2828 = float(_2276);
    float _2830 = -_2800;
    float _2832 = _2694 + _2830;
    float _2834 = _2824 * (-2.0);
    float _2836 = float(_2816);
    float _2838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2840 = float(_2348);
    float _2842 = fma(_2832, _2832, _2826);
    float _2844 = fma(_2834, _2780, _2780);
    float _2846 = _2836 * _2340;
    float _2848 = _874 + (-0.5);
    float _2850 = _2840 * _2828;
    float _2852 = -_1432;
    float _2854 = _2852 + 1.0;
    float _2856 = _2846 * (-2.0);
    float _2858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2860 = _2850 * (-2.0);
    float _2862 = fma(_2736, _2834, _2736);
    float _2864 = fma(_2856, _2782, _2782);
    float _2866 = _1974 + 0.5;
    float _2868 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2844);
    float _2870 = fma(_2752, _2856, _2752);
    float _2872 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2864);
    float _2874 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2876 = fma(_2860, _2784, _2784);
    float _2878 = fma(_2756, _2860, _2756);
    float _2880 = fma(_2854, _1602, _2772);
    float _2882 = _2874 * _2838;
    float _2884 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2876);
    float _2886 = -_2072;
    float _2888 = _2886 + 1.0;
    float _2890 = sqrt(_2842);
    float _2892 = fma(_2862, _2104, _2868);
    float _2894 = fma(_2870, _2104, _2872);
    float _2896 = _1456 * _2858;
    float _2898 = fma(_2878, _2104, _2884);
    float _2900 = -_2888;
    float _2902 = fma(_1940, _2900, _2788);
    float _2904 = -_2822;
    float _2906 = fma(_2904, _1438, _2764);
    float _2908 = fma(_1808, _2068, _2806);
    float _2910 = _2892 * 0.15915493667125701904296875;
    float _2912 = _2894 * 0.15915493667125701904296875;
    float _2914 = _2898 * 0.15915493667125701904296875;
    out.m_76.x = _2906;
    out.m_76.y = _2880;
    float _2916 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2818);
    float _2918 = _2910 * 6.283185482025146484375;
    float _2920 = sin(_2918);
    float _2922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    out.m_78.x = _2902;
    out.m_78.y = _2908;
    out.m_78.z = _2882;
    out.m_78.w = _2896;
    float _2924 = _2740 * _2890;
    float _2926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _2928 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2930 = _1450 * _2462;
    int _2932 = _2930 + _2300;
    float _2934 = _912 * _2924;
    float _2936 = _2910 * 6.283185482025146484375;
    float _2938 = cos(_2936);
    float _2940 = _906 * _2924;
    out.m_80.w = _2760;
    float _2942 = _2934 * _2922;
    float _2944 = _2940 * _2926;
    out.m_82.x = _2916;
    float _2946 = _2912 * 6.283185482025146484375;
    float _2948 = cos(_2946);
    int _2950 = _1576 >> 31;
    out.m_84.x = _2940;
    int _2952 = ~_2160;
    int _2954 = _2952 + _2222;
    int _2956 = _2954 + 1;
    int _2958 = _2950 & 3;
    float _2960 = _2914 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    int _2964 = _1576 + _2958;
    int _2966 = _711 * _2956;
    int _2968 = _2966 + _1200;
    int _2970 = _2964 >> 2;
    float _2972 = _2912 * 6.283185482025146484375;
    float _2974 = sin(_2972);
    float _2976 = _2920 * _2948;
    float _2978 = _2938 * _2948;
    float _2980 = _2914 * 6.283185482025146484375;
    float _2982 = sin(_2980);
    float _2984 = _2948 * _2962;
    float _2986 = _2938 * _2962;
    float _2988 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2990 = _2938 * _2974;
    int _2992 = _2970 << 4;
    int _2994 = _2992 + 656;
    float _2996 = _2920 * _2974;
    float _2998 = _2974 * _2962;
    float _3000 = _2986 * _2942;
    uint _3002 = uint(int(uint(_2994) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _2920 * _2962;
    float _3020 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3022 = fma(_2982, _2978, _2996);
    float _3024 = fma(_2982, _2996, _2978);
    float _3026 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3028 = -_2990;
    float _3030 = fma(_2982, _2976, _3028);
    float _3032 = fma(_3022, _2944, _3000);
    float _3034 = -_2976;
    float _3036 = fma(_2982, _2990, _3034);
    int _3038 = _2994 + 8;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    uint _3042 = uint(int(uint(int(_3040)) >> uint(2)));
    int _3044 = int(_3040) & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    int _3048 = int(_3040) + 1;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    int _3052 = _3048 & 3;
    float _3054 = (*spvDescriptorSet0.vp_c9)._m0[int(_3050)][_3052];
    float _3056 = -_2942;
    float _3058 = _2982 * _3056;
    float _3060 = _3018 * _2942;
    float _3062 = -_2982;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3026);
    float _3066 = -_2982;
    float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2988);
    float _3070 = -_2982;
    float _3072 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    float _3074 = fma(_2984, _2944, _3058);
    float _3076 = fma(_3030, _2944, _3060);
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3080 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3064);
    float _3082 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3068);
    float _3084 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3072);
    float _3086 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3088 = _3086 * 0.5;
    float _3090 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3092 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3094 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3096 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3098 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3078);
    float _3100 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3102 = fma(_2998, _3088, _3074);
    float _3104 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3090);
    float _3106 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3092);
    float _3108 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3094);
    float _3110 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3096);
    float _3112 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3100);
    float _3114 = fma(_3036, _3088, _3032);
    float _3116 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3118 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3098);
    int _3120 = abs(_2436);
    float _3122 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3110);
    float _3124 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3112);
    float _3126 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3128 = ~_1930;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3024, _3088, _3076);
    float _3136 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3104);
    float _3138 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3106);
    float _3140 = _2928 * _3080;
    int _3142 = ~_3120;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3132 * as_type<int>(_3016);
    float _3150 = _2928 * _3082;
    int _3152 = abs(_2452);
    float _3154 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3156 = _3146 * as_type<int>(_3008);
    int _3158 = _3156 + _3148;
    float _3160 = fma(_3126, _3118, _3140);
    out.m_86.x = _3118;
    out.m_86.y = _3122;
    out.m_86.z = _3124;
    float _3162 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3126, _3122, _3150);
    float _3166 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3168 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3170 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3172 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3174 = int(_3172);
    float _3176 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3178 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3168);
    float _3180 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3170);
    float _3182 = _2928 * _3084;
    int _3184 = _1430 >> 31;
    float _3186 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_1954;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = fma(_3126, _3124, _3182);
    int _3196 = _3184 & 3;
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    int _3206 = _3192 * as_type<int>(_3046);
    int _3208 = _3206 + _3158;
    int _3210 = _1430 + _3196;
    float _3212 = _2680 + _3198;
    bool _3214 = !_2362;
    int _3216 = _3214 ? _2968 : (-1);
    int _3218 = _3204 * as_type<int>(_3054);
    int _3220 = _3218 + _3208;
    bool _3222 = !_2446;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3228 = !_2236;
    int _3230 = _3228 ? _2932 : (-1);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3234 = _3212 + _3232;
    int _3236 = abs(_3224);
    float _3238 = _2660 + _3226;
    int _3240 = _3230 >> 31;
    float _3242 = _3234 * _3234;
    int _3244 = abs(_3174);
    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3248 = _3238 + _3246;
    int _3250 = _3240 & 3;
    float _3252 = float(uint(_3244));
    float _3254 = fma(_3248, _3248, _3242);
    int _3256 = _3230 + _3250;
    int _3258 = ~_3236;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    float _3264 = sqrt(_3254);
    int _3266 = _3256 >> 2;
    float _3268 = float(uint(_3174));
    int _3270 = _3220 * _3262;
    int _3272 = _3266 << 4;
    int _3274 = _3272 + 800;
    int _3276 = _3230 & 3;
    bool _3278 = _3276 != 0;
    float _3280 = 1.0 / _3268;
    uint _3282 = uint(int(uint(_3274) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    bool _3298 = !_2308;
    int _3300 = _3298 ? 0 : 1;
    int _3302 = _3216 * _3236;
    int _3304 = _3302 + _3270;
    bool _3306 = uint(_3276) > 1u;
    int _3308 = _3230 & 3;
    bool _3310 = _3308 != 0;
    float _3312 = 1.0 / _3252;
    int _3314 = ~_3174;
    int _3316 = _3314 + 1;
    int _3318 = _3310 ? 0 : 1;
    bool _3320 = _1452 != 3;
    int _3322 = abs(_3304);
    float _3324 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3326 = ~_3318;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3330;
    float _3334 = _3182;
    float _3336 = _3212;
    float _3338 = _2800;
    float _3340 = _3194;
    if (!_3306)
    {
        int _3342 = ~_3318;
        int _3344 = _3342 + 1;
        _3332 = _3344;
    }
    int _3346 = _3332;
    int _3348 = as_type<int>(_3280) + (-2);
    float _3350 = float(uint(_3304));
    int _3352 = as_type<int>(_3312) + (-2);
    float _3354 = _2654 + _3324;
    float _3356 = float(uint(_3322));
    float _3358 = as_type<float>(_3348) * _3350;
    bool _3360 = _3264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3362 = _3210 >> 2;
    float _3364 = as_type<float>(_3352) * _3356;
    float _3366 = trunc(_3358);
    float _3368 = precise::max(_3366, 0.0);
    uint _3370 = uint(_3368);
    bool _3372 = !_3278;
    int _3374 = _3372 ? 0 : 1;
    int _3376 = _3362 << 4;
    int _3378 = _3376 + 368;
    bool _3380 = uint(_3276) >= 2u;
    float _3382 = trunc(_3364);
    float _3384 = precise::max(_3382, 0.0);
    uint _3386 = uint(_3384);
    uint _3388 = uint(int(uint(_3378) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = ~_3244;
    int _3406 = _3404 + 1;
    if (!_3360)
    {
        _3334 = _3238;
    }
    float _3408 = _3334;
    float _3410 = _3408;
    if (!_3360)
    {
        _2100 = _3354;
    }
    float _3412 = _2100;
    int _3414 = ~_2002;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = _3378 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    bool _3438 = _3276 != 3;
    int _3440 = _3380 ? 0 : 1;
    bool _3442 = _3276 != 3;
    bool _3444 = !_3360;
    float _3446 = _3412;
    if (!_3444)
    {
        float _3448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3452 = _3264 + _3450;
        float _3454 = rsqrt(_3254);
        float _3456 = _3452 * _3448;
        float _3458 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3460 = _3456 * 0.15915493667125701904296875;
        float _3462 = _3460 * 6.283185482025146484375;
        float _3464 = cos(_3462);
        float _3466 = _3460 * 6.283185482025146484375;
        float _3468 = sin(_3466);
        float _3470 = _3464 + (-1.0);
        float _3472 = fma(_3468, _3458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3476 = _3454 * _3472;
        float _3478 = fma(_3354, _3464, _3474);
        float _3480 = fma(_3248, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3482 = fma(_3234, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3446 = _3478;
        _3410 = _3480;
        _3336 = _3482;
    }
    float _3484 = _3446;
    float _3486 = _3410;
    float _3488 = _3336;
    int _3490 = abs(_3346);
    int _3492 = _3418 * as_type<int>(_3402);
    int _3494 = _3274 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = _3316 * int(_3370);
    int _3514 = _3512 + _3304;
    float _3516 = -_2786;
    float _3518 = _3516 + _3484;
    float _3520 = -_2798;
    float _3522 = _3520 + _3486;
    int _3524 = abs(_3300);
    int _3526 = _3406 * int(_3386);
    int _3528 = _3526 + _3322;
    float _3530 = float(uint(_3514));
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3534 = _3518 + _3532;
    int _3536 = ~_3490;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    float _3542 = -_2076;
    float _3544 = _3542 + 1.0;
    float _3546 = float(uint(_3528));
    float _3548 = as_type<float>(_3348) * _3530;
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3552 = _3522 + _3550;
    float _3554 = _3534 * _3534;
    int _3556 = _3540 * as_type<int>(_3296);
    float _3558 = as_type<float>(_3352) * _3546;
    int _3560 = abs(_3374);
    float _3562 = fma(_3552, _3552, _3554);
    float _3564 = trunc(_3548);
    float _3566 = precise::max(_3564, 0.0);
    uint _3568 = uint(_3566);
    float _3570 = -_2064;
    float _3572 = _3570 + 1.0;
    int _3574 = abs(_1590);
    float _3576 = -_2800;
    float _3578 = _3576 + _3488;
    int _3580 = ~_3524;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    int _3586 = ~_3440;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = trunc(_3558);
    float _3594 = precise::max(_3592, 0.0);
    uint _3596 = uint(_3594);
    int _3598 = _3584 * as_type<int>(_3394);
    int _3600 = _3598 + _3492;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3610 = _3578 + _3608;
    int _3612 = _3590;
    if (_3442)
    {
        int _3614 = ~_3440;
        int _3616 = _3614 + 1;
        _3612 = _3616;
    }
    int _3618 = _3612;
    int _3620 = ~_3560;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3606 * as_type<int>(_3428);
    int _3628 = _3626 + _3600;
    int _3630 = abs(_3618);
    bool _3632 = !_3438;
    int _3634 = _3632 ? 0 : (-1);
    int _3636 = _3624 * as_type<int>(_3288);
    int _3638 = _3636 + _3556;
    bool _3640 = !_3320;
    int _3642 = _3640 ? 0 : (-1);
    float _3644 = fma(_3610, _3610, _3562);
    int _3646 = ~_3174;
    int _3648 = _3646 + 1;
    int _3650 = int(_3370) + int(_3568);
    int _3652 = ~_3630;
    int _3654 = _3652 + 1;
    int _3656 = _3654 + 1;
    float _3658 = sqrt(_3644);
    int _3660 = abs(_3634);
    int _3662 = int(_3386) + int(_3596);
    int _3664 = _3656 * as_type<int>(_3502);
    int _3666 = _3664 + _3638;
    int _3668 = ~_3244;
    int _3670 = _3668 + 1;
    int _3672 = abs(_3642);
    int _3674 = _3648 * _3650;
    int _3676 = _3674 + _3304;
    int _3678 = _3670 * _3662;
    int _3680 = _3678 + _3322;
    float _3682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3684 = uint(_3676) >= uint(_3174);
    int _3686 = ~_3660;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = ~_3672;
    int _3694 = _3692 + 1;
    int _3696 = _3694 + 1;
    bool _3698 = uint(_3680) >= uint(_3244);
    int _3700 = _3690 * as_type<int>(_3510);
    int _3702 = _3700 + _3666;
    int _3704 = _3304 ^ _3174;
    int _3706 = _3696 * as_type<int>(_3436);
    int _3708 = _3706 + _3628;
    bool _3710 = !_3698;
    int _3712 = _3710 ? 0 : (-1);
    float _3714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3716 = uint(int(uint(_3704) >> uint(31)));
    bool _3718 = !_3684;
    int _3720 = _3718 ? 0 : (-1);
    int _3722 = ~_3712;
    int _3724 = _3662 + _3722;
    int _3726 = _3724 + 1;
    bool _3728 = !_2426;
    int _3730 = _3728 ? 0 : 1;
    int _3732 = ~int(_3716);
    int _3734 = _3732 + 1;
    int _3736 = ~_3650;
    int _3738 = _3736 + _3720;
    int _3740 = _3738 + 1;
    bool _3742 = !_2456;
    int _3744 = _3742 ? 0 : 1;
    int _3746 = abs(_3730);
    int _3748 = _3174 * _3740;
    int _3750 = _3748 + _3304;
    int _3752 = _3726 ^ _3734;
    float _3754 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = abs(_3744);
    bool _3758 = _3174 == 0;
    bool _3760 = _3174 == 0;
    float _3762 = fma(_2928, _2928, 1.0);
    int _3764 = ~_3746;
    int _3766 = _3764 + 1;
    int _3768 = _3766 + 1;
    int _3770 = ~_3734;
    int _3772 = _3770 + _3752;
    int _3774 = _3772 + 1;
    float _3776 = rsqrt(_3762);
    bool _3778 = _705 == 0;
    int _3780 = _3708 * _3768;
    bool _3782 = !_3760;
    int _3784 = _3782 ? _3774 : (-1);
    float _3786 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3788 = !_3758;
    int _3790 = _3788 ? _3750 : (-1);
    float _3792 = float(_3784);
    int _3794 = ~_3756;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    float _3800 = float(_3790);
    float _3802 = -_2092;
    float _3804 = fma(_3786, _3792, _3802);
    float _3806 = _994 + (-0.5);
    bool _3808 = !_3778;
    int _3810 = _3808 ? _2368 : (-1);
    int _3812 = _3702 * _3798;
    bool _3814 = !_2236;
    int _3816 = _3814 ? _2372 : (-1);
    float _3818 = -_3786;
    float _3820 = fma(_3818, _3806, _3804);
    float _3822 = fma(_3754, _3800, _2098);
    float _3824 = _1002 + 0.5;
    float _3826 = _2928 * _3776;
    int _3828 = _3810 * _3746;
    int _3830 = _3828 + _3780;
    float _3832 = fma(_994, _3544, _3820);
    int _3834 = _3816 * _3756;
    int _3836 = _3834 + _3812;
    float _3838 = fma(_3754, _3824, _3822);
    float _3840 = -_3136;
    float _3842 = _3826 * _3840;
    float _3844 = -_3138;
    float _3846 = _3826 * _3844;
    float _3848 = -_3116;
    float _3850 = _3826 * _3848;
    float _3852 = _3136 + _3160;
    float _3854 = float(_3830);
    float _3856 = -_3572;
    float _3858 = fma(_1002, _3856, _3838);
    float _3860 = fma(_3776, _3080, _3842);
    float _3862 = fma(_3776, _3082, _3846);
    float _3864 = fma(_3776, _3084, _3850);
    float _3866 = float(_3836);
    float _3868 = _3138 + _3164;
    float _3870 = _3116 + _3194;
    out.m_88.x = _3854;
    bool _3872 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3874 = isnan(_3658);
    bool _3876 = _3872 || _3874;
    bool _3878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3880 = _3876 || _3878;
    float _3882 = -_2786;
    float _3884 = _2654 + _3882;
    float _3886 = -_2798;
    float _3888 = _2660 + _3886;
    out.m_90.x = _3860;
    out.m_90.y = _3862;
    out.m_90.z = _3864;
    float _3890 = -_2800;
    float _3892 = _2680 + _3890;
    out.m_88.w = _3866;
    out.m_92.x = _3858;
    out.m_92.y = _3832;
    float _3894 = as_type<float>(_3836);
    float _3896 = _3892;
    float _3898 = _3884;
    float _3900 = _3888;
    if (!_3880)
    {
        _3894 = 1.0;
    }
    float _3902 = _3894;
    out.m_94.x = _3852;
    out.m_94.y = _3868;
    out.m_94.z = _3870;
    bool _3904 = !_3880;
    float _3906 = _3902;
    if (!_3904)
    {
        bool _3908 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3910 = isnan(_3658);
        bool _3912 = _3908 || _3910;
        bool _3914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3916 = _3912 || _3914;
        if (!_3916)
        {
            float _3918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3920 = _3658 + _3918;
            float _3922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3922;
            float _3926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3930 = 1.0 / _3924;
            float _3932 = _3920 * _3930;
            float _3934 = fma(_3932, _3928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3906 = _3934;
            _3936 = true;
        }
        else
        {
            bool _3938 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3940 = isnan(_3658);
            bool _3942 = _3938 || _3940;
            bool _3944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3946 = _3942 || _3944;
            if (!_3946)
            {
                float _3948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3950 = _3658 + _3948;
                float _3952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3954 = _3952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3958 = _3956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3960 = 1.0 / _3954;
                float _3962 = _3950 * _3960;
                float _3964 = fma(_3962, _3958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3906 = _3964;
                _3936 = true;
            }
            else
            {
                _3906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3936 = false;
    float _3966 = _3906;
    float _3968 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3970 = _3518 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3974 = _3522 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3978 = _3578 + _3976;
    float _3980 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3982 = fma(_3970, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3984 = fma(_3974, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3986 = fma(_3978, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3988 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3980);
    float _3990 = -_3884;
    float _3992 = _3990 + _3982;
    float _3994 = -_3888;
    float _3996 = _3994 + _3984;
    float _3998 = -_3892;
    float _4000 = _3998 + _3986;
    float _4002 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3988);
    float _4004 = _3992 * _3992;
    float _4006 = _4002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4008 = fma(_3996, _3996, _4004);
    float _4010 = 1.0 / _4006;
    float _4012 = fma(_4000, _4000, _4008);
    float _4014 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4020 = _4016 || _4018;
    bool _4022 = isnan(0.5);
    bool _4024 = _4020 || _4022;
    float _4026 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4014);
    float _4028 = sqrt(_4012);
    float _4030 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4026);
    float _4032 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4034 = _4032 + _4006;
    float _4036 = _4034 * _4010;
    float _4038 = _4036 * 0.5;
    bool _4040 = _4028 > 0.0;
    bool _4042 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan(0.5);
    bool _4050 = _4046 || _4048;
    float _4052 = _4010;
    float _4054 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4056 = _4006;
    float _4058 = _4034;
    if (!_4040)
    {
        _4052 = _3984;
    }
    float _4060 = _4052;
    float _4062 = _4060;
    if (!_4040)
    {
        _4054 = _3982;
    }
    float _4064 = _4054;
    float _4066 = _4064;
    float _4068 = _4064;
    if (!_4040)
    {
        _4056 = _3986;
    }
    float _4070 = _4056;
    bool _4072 = !_4040;
    float _4074 = _4070;
    float _4076 = _4070;
    if (!_4072)
    {
        float _4078 = _239 * _239;
        float _4080 = rsqrt(_4012);
        float _4082 = fma(_235, _235, _4078);
        float _4084 = fma(_241, _241, _4082);
        float _4086 = sqrt(_4084);
        float _4088 = _3996 * _4080;
        float _4090 = _3992 * _4080;
        float _4092 = _4000 * _4080;
        bool _4094 = _4086 > 0.0;
        float _4096 = _4086;
        _3338 = _4088;
        _4058 = _4080;
        if (!_4094)
        {
            _4096 = _3984;
        }
        float _4098 = _4096;
        _4062 = _4098;
        if (!_4094)
        {
            _4066 = _3982;
        }
        float _4100 = _4066;
        _4068 = _4100;
        if (!_4094)
        {
            _4074 = _3986;
        }
        float _4102 = _4074;
        bool _4104 = !_4094;
        _4076 = _4102;
        if (!_4104)
        {
            float _4106 = rsqrt(_4084);
            float _4108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4110 = _239 * _4106;
            float _4112 = _235 * _4106;
            float _4114 = _4090 * _4110;
            float _4116 = _241 * _4106;
            float _4118 = fma(_4088, _4112, _4114);
            float _4120 = _4108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4122 = fma(_4092, _4116, _4118);
            float _4124 = _4122 * _4120;
            float _4126 = fma(_235, _4124, _3984);
            float _4128 = fma(_239, _4124, _3982);
            float _4130 = fma(_241, _4124, _3986);
            _4062 = _4126;
            _4068 = _4128;
            _4076 = _4130;
            _4058 = _4122;
        }
    }
    float _4132 = _4062;
    float _4134 = _4068;
    float _4136 = _4076;
    float _4138 = _3338;
    float _4140 = _4058;
    float _4142 = _4140;
    float _4144 = _4134;
    float _4146 = _4132;
    float _4148 = _4136;
    float _4150 = _4138;
    if (_4050)
    {
        _4142 = 1.0;
    }
    float _4152 = _4142;
    float _4154 = _4152;
    if (!_4024)
    {
        float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4158 = _3884 + _4156;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4162 = _3888 + _4160;
        float _4164 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4166 = _4158 * _4158;
        float _4168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4170 = _3892 + _4168;
        float _4172 = fma(_4162, _4162, _4166);
        float _4174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4176 = fma(_4170, _4170, _4172);
        float _4178 = sqrt(_4176);
        float _4180 = _4164 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4182 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4184 = _4182 * _4174;
        float _4186 = -_3888;
        float _4188 = _4186 + _4132;
        float _4190 = _4180 * _4184;
        float _4192 = -_3884;
        float _4194 = _4192 + _4134;
        float _4196 = -_3892;
        float _4198 = _4196 + _4136;
        float _4200 = fma(_4188, _4190, _3888);
        float _4202 = fma(_4194, _4190, _3884);
        float _4204 = fma(_4198, _4190, _3892);
        _4144 = _4202;
        _4146 = _4200;
        _4148 = _4204;
    }
    float _4206 = _4144;
    float _4208 = _4146;
    float _4210 = _4148;
    if (!_4050)
    {
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4216 = fma(_4038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4214);
        float _4218 = _4212 * 0.15915493667125701904296875;
        float _4220 = _4218 * 6.283185482025146484375;
        float _4222 = cos(_4220);
        float _4224 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4226 = _4224 * 0.15915493667125701904296875;
        float _4228 = _4218 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = 1.0 / _4222;
        float _4234 = _4226 * 6.283185482025146484375;
        float _4236 = cos(_4234);
        float _4238 = _4230 * _4232;
        float _4240 = 1.0 / _4216;
        float _4242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4242;
        float _4246 = _4236 * _4238;
        float _4248 = _4226 * 6.283185482025146484375;
        float _4250 = sin(_4248);
        float _4252 = 1.0 / _4246;
        float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4256 = _4240 * _4254;
        float _4258 = 1.0 / _4244;
        float _4260 = _4250 * _4252;
        float _4262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4264 = fma(_4260, _4256, _4262);
        float _4266 = _4264 * _4258;
        float _4268 = precise::clamp(_4266, 0.0, 1.0);
        _4154 = _4268;
    }
    float _4270 = _4154;
    float _4272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4274 = _4206 + _4272;
    float _4276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4278 = _4208 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4282 = _4210 + _4280;
    float _4284 = _4274 * _4274;
    float _4286 = fma(_4278, _4278, _4284);
    float _4288 = fma(_4282, _4282, _4286);
    float _4290 = rsqrt(_4288);
    float _4292 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4294 = _4278 * _4292;
    float _4296 = _4282 * _4292;
    float _4298 = _4294 * _4294;
    float _4300 = _4296 * _4296;
    float _4302 = _4298 + _4300;
    float _4304 = sqrt(_4302);
    bool _4306 = _4304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4310 = _4304 + _4308;
    float _4312 = _4282;
    float _4314 = _4302;
    float _4316 = _4310;
    float _4318 = _4274;
    if (_4306)
    {
        float _4320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4312 = _4320;
    }
    float _4322 = _4312;
    if (_4306)
    {
        float _4324 = rsqrt(_4302);
        _4314 = _4324;
    }
    float _4326 = _4314;
    float _4328 = _4326;
    if (_4306)
    {
        float _4330 = _4310 * _4322;
        _4316 = _4330;
    }
    float _4332 = _4316;
    if (_4306)
    {
        float _4334 = _4332 * 0.15915493667125701904296875;
        _4150 = _4334;
    }
    float _4336 = _4150;
    float _4338 = _4290;
    float _4340 = _4336;
    if (_4306)
    {
        float _4342 = _4336 * 6.283185482025146484375;
        float _4344 = sin(_4342);
        _4338 = _4344;
    }
    float _4346 = _4338;
    float _4348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4350 = precise::max(0.0, _4348);
    float _4352 = _4284;
    float _4354 = _4350;
    float _4356 = _4348;
    if (_4306)
    {
        float _4358 = _4336 * 6.283185482025146484375;
        float _4360 = cos(_4358);
        _4352 = _4360;
    }
    float _4362 = _4352;
    float _4364 = -_4292;
    float _4366 = -_4350;
    float _4368 = fma(_4274, _4364, _4366);
    if (!_4306)
    {
        _4318 = _4296;
    }
    float _4370 = _4318;
    float _4372 = _4370;
    if (_4306)
    {
        float _4374 = _4368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4354 = _4374;
    }
    float _4376 = _4354;
    float _4378 = _4376;
    float _4380 = _4346;
    if (_4306)
    {
        float _4382 = fma(_4346, _4376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4378 = _4382;
    }
    float _4384 = _4378;
    float _4386 = _4384;
    if (!_4306)
    {
        _4380 = _4294;
    }
    float _4388 = _4380;
    float _4390 = _4388;
    float _4392 = _4362;
    if (_4306)
    {
        float _4394 = _4362 + (-1.0);
        _4356 = _4394;
    }
    float _4396 = _4356;
    if (_4306)
    {
        float _4398 = _4326 * _4384;
        _3340 = _4398;
    }
    float _4400 = _3340;
    if (!_4306)
    {
        _4386 = _4368;
    }
    float _4402 = _4386;
    float _4404 = _4402;
    if (_4306)
    {
        float _4406 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4406;
    }
    float _4408 = _4340;
    if (_4306)
    {
        float _4410 = _4294 * _4400;
        _4390 = _4410;
    }
    float _4412 = _4390;
    if (!_4306)
    {
        _4328 = _4298;
    }
    float _4414 = _4328;
    float _4416 = _4414;
    if (_4306)
    {
        float _4418 = _4296 * _4400;
        _4372 = _4418;
    }
    float _4420 = _4372;
    if (_4306)
    {
        float _4422 = fma(_4368, _4362, _4408);
        _4404 = _4422;
    }
    float _4424 = _4404;
    if (_4306)
    {
        float _4426 = _4412 * _4412;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (!_4306)
    {
        _4392 = _4300;
    }
    float _4430 = _4392;
    float _4432 = _4430;
    if (_4306)
    {
        float _4434 = _4420 * _4420;
        _4432 = _4434;
    }
    float _4436 = _4432;
    float _4438 = sqrt(_4288);
    float _4440 = fma(_4424, _4424, _4428);
    float _4442 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4444 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4446 = _4440 + _4436;
    float _4448 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4442);
    float _4450 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4452 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4444);
    float _4454 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4448);
    float _4456 = rsqrt(_4446);
    float _4458 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4460 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4450);
    float _4462 = _4454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4464 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4468 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4466);
    float _4470 = precise::clamp(_4468, 0.0, 1.0);
    float _4472 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4458);
    float _4474 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4460);
    float _4476 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4478 = -_4470;
    float _4480 = _4478 + 1.0;
    float _4482 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4472);
    float _4484 = _4474 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4486 = -_4476;
    float _4488 = fma(_4486, _4464, 1.0);
    float _4490 = abs(_4480);
    float _4492 = log2(_4490);
    float _4494 = _4482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4496 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4498 = _4456 * _4412;
    float _4500 = _4456 * _4424;
    float _4502 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4452);
    float _4504 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4496);
    float _4506 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4508 = _4456 * _4420;
    float _4510 = _4502 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4512 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4504);
    float _4514 = -_4506;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4514);
    float _4518 = log2(_4488);
    float _4520 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4522 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4512);
    float _4524 = -_4508;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4516);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4530 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4532 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4520);
    float _4534 = fma(_4526, -0.5, 0.5);
    float _4536 = 1.0 / _4522;
    float _4538 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4530);
    float _4540 = fma(_4526, 0.5, 0.5);
    float _4542 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4544 = _4500 + 1.0;
    float _4546 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4538);
    float _4548 = fma(_4540, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4550 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4542);
    float _4552 = exp2(_4528);
    float _4554 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4546);
    float _4556 = fma(_4540, _4548, -0.212114393711090087890625);
    float _4558 = _4518 * 0.693147182464599609375;
    float _4560 = fma(_4540, _4556, 1.570728778839111328125);
    float _4562 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4564 = sqrt(_4534);
    float _4566 = _4554 * _4536;
    float _4568 = _4550 * _4536;
    float _4570 = fma(_4566, 0.5, 0.5);
    float _4572 = fma(_4568, -0.5, 0.5);
    float _4574 = -_4500;
    float _4576 = fma(_4552, _4544, _4574);
    float3 _11660 = float3(_4570, _4572, _4562);
    float _4578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11660, float3(0.0), isnan(_11660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11660, float3(0.0), isnan(_11660)), level(0.0)).x;
    float3 _11671 = float3(_4570, _4572, _4562);
    float4 _4581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11671, float3(0.0), isnan(_11671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11671, float3(0.0), isnan(_11671)), level(0.0)).xyzw;
    float _4583 = _4581.x;
    float _4585 = _4581.y;
    float _4587 = _4581.z;
    float _4589 = _4581.w;
    float _4591 = fma(_4576, 0.5, 0.5);
    float _4593 = _4564 * 0.636619746685028076171875;
    float _4595 = -_4560;
    float _4597 = fma(_4593, _4595, 1.0);
    float2 _11698 = float2(_4597, _4591);
    float3 _4601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11698, float2(0.0), isnan(_11698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11698, float2(0.0), isnan(_11698)), level(0.0)).xyz;
    float _4603 = _4601.x;
    float _4605 = _4601.y;
    float _4607 = _4601.z;
    float _4609 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4611 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4613 = _4522 * 0.5;
    float _4615 = _4554 + _4522;
    out.m_96.x = _4208;
    out.m_96.y = _4206;
    out.m_96.z = _4210;
    float _4617 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4611);
    float _4619 = exp2(_4609);
    bool _4621 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4623 = isnan(_4438);
    bool _4625 = _4621 || _4623;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4629 = _4625 || _4627;
    float _4631 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4617);
    float _4633 = fma(_4550, -0.5, _4613);
    out.m_98.x = _3888;
    out.m_98.y = _3884;
    out.m_98.z = _3892;
    float _4635 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4631);
    float _4637 = _4635 + _4522;
    float _4639 = _4615 * 0.5;
    out.gl_Position.x = _4554;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4635;
    out.gl_Position.w = _4522;
    float _4641 = _4615;
    float _4643 = _4550;
    float _4645 = _4554;
    if (!_4629)
    {
        _4641 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4647 = _4641;
    float _4649 = _4637 * 0.5;
    float _4651 = -_4619;
    float _4653 = _4651 + 1.0;
    float _4655 = _4647;
    float _4657 = _4647;
    if (!_4629)
    {
        _3896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4659 = _3896;
    float _4661 = _4659;
    float _4663 = _4659;
    if (!_4629)
    {
        _3898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4665 = _3898;
    float _4667 = _4653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_100.x = _4639;
    out.m_100.y = _4633;
    out.m_100.z = _4649;
    out.m_100.w = _4522;
    float _4669 = _4665;
    float _4671 = _4665;
    if (!_4629)
    {
        _3900 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4673 = _3900;
    float _4675 = -_4667;
    float _4677 = _4675 + 1.0;
    float _4679 = _4270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4681 = _4673;
    float _4683 = _4673;
    if (!_4629)
    {
        _4643 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4685 = _4643;
    float _4687 = _4685;
    float _4689 = _4685;
    if (!_4629)
    {
        _4645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4691 = _4645;
    float _4693 = _4667 * _4578;
    float _4695 = _4589 * _4677;
    float _4697 = _4589 * _4693;
    float _4699 = _4607 * _4693;
    float _4701 = fma(_4603, _4697, _4583);
    float _4703 = fma(_4605, _4697, _4585);
    float _4705 = fma(_4589, _4699, _4587);
    out.m_102.x = _4701;
    out.m_102.y = _4703;
    out.m_102.z = _4705;
    out.m_102.w = _4695;
    bool _4707 = !_4629;
    float _4709 = _4691;
    float _4711 = _4691;
    if (!_4707)
    {
        bool _4713 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4715 = isnan(_4438);
        bool _4717 = _4713 || _4715;
        bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4721 = _4717 || _4719;
        if (!_4721)
        {
            float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4725 = _4438 + _4723;
            float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4729 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4727;
            float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4735 = 1.0 / _4729;
            float _4737 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4739 = _4737 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4753 = _4725 * _4735;
            float _4755 = precise::clamp(_4753, 0.0, 1.0);
            float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4761 = fma(_4755, _4733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4763 = fma(_4755, _4759, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4765 = fma(_4755, _4739, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4767 = fma(_4755, _4743, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4769 = fma(_4755, _4747, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4771 = fma(_4755, _4751, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4711 = _4765;
            _4671 = _4769;
            _4689 = _4761;
            _4663 = _4767;
            _4657 = _4763;
            _4683 = _4771;
            _4773 = true;
        }
        else
        {
            bool _4775 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4777 = isnan(_4438);
            bool _4779 = _4775 || _4777;
            bool _4781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4783 = _4779 || _4781;
            if (!_4783)
            {
                _4687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4785 = _4687;
            _4689 = _4785;
            if (!_4783)
            {
                _4709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4787 = _4709;
            _4711 = _4787;
            if (!_4783)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4789 = _4655;
            _4657 = _4789;
            if (!_4783)
            {
                _4661 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4791 = _4661;
            _4663 = _4791;
            if (!_4783)
            {
                _4669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4793 = _4669;
            _4671 = _4793;
            if (!_4783)
            {
                _4681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4795 = _4681;
            bool _4797 = !_4783;
            _4683 = _4795;
            if (!_4797)
            {
                bool _4799 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4801 = isnan(_4438);
                bool _4803 = _4799 || _4801;
                bool _4805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4807 = _4803 || _4805;
                if (!_4807)
                {
                    float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4811 = _4438 + _4809;
                    float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4815 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4813;
                    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4821 = 1.0 / _4815;
                    float _4823 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4825 = _4823 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4829 = _4827 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4833 = _4831 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4839 = _4811 * _4821;
                    float _4841 = precise::clamp(_4839, 0.0, 1.0);
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4847 = fma(_4841, _4819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4849 = fma(_4841, _4845, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4851 = fma(_4841, _4825, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4853 = fma(_4841, _4829, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4855 = fma(_4841, _4833, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4857 = fma(_4841, _4837, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4711 = _4851;
                    _4671 = _4855;
                    _4689 = _4847;
                    _4663 = _4853;
                    _4657 = _4849;
                    _4683 = _4857;
                    _4773 = true;
                }
                else
                {
                    _4711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4663 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4773 = false;
    float _4859 = _4711;
    float _4861 = _4671;
    float _4863 = _4689;
    float _4865 = _4663;
    float _4867 = _4657;
    float _4869 = _4683;
    float _4871 = _4679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4873 = fma(_3868, -0.5, 0.5);
    float _4875 = precise::clamp(_4873, 0.0, 1.0);
    float _4877 = -_4859;
    float _4879 = _4877 + _4861;
    float _4881 = -_4863;
    float _4883 = _4881 + _4865;
    out.m_104.x = 0.0;
    float _4885 = fma(_4875, _4879, _4859);
    float _4887 = -_4867;
    float _4889 = _4887 + _4869;
    float _4891 = fma(_4875, _4883, _4863);
    float _4893 = _4885 * 0.586610972881317138671875;
    bool _4895 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4897 = fma(_4875, _4889, _4867);
    out.m_53.x = _4871;
    float _4899 = fma(_4891, 0.298911988735198974609375, _4893);
    bool _4901 = _4270 > 0.0;
    bool _4903 = isnan(_4270);
    bool _4905 = _4901 || _4903;
    bool _4907 = isnan(0.0);
    bool _4909 = _4905 || _4907;
    float _4911 = fma(_4897, 0.114477999508380889892578125, _4899);
    float _4913 = -_4911;
    float _4915 = _4891 + _4913;
    float _4917 = -_4911;
    float _4919 = _4885 + _4917;
    float _4921 = -_4911;
    float _4923 = _4897 + _4921;
    float _4925 = fma(_4915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4927 = fma(_4919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4929 = fma(_4923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    bool _4931 = !_4895;
    if (!_4931)
    {
        float _4933 = -_4206;
        float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4937 = -_4208;
        float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4941 = -_4210;
        float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4945 = _4935 * _4935;
        float _4947 = fma(_4939, _4939, _4945);
        float _4949 = fma(_4943, _4943, _4947);
        float _4951 = sqrt(_4949);
        float _4953 = rsqrt(_4949);
        float _4955 = -_4951;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4959 = _4957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4961 = precise::clamp(_4959, 0.0, 1.0);
        float _4963 = _4939 * _4953;
        float _4965 = _4935 * _4953;
        float _4967 = abs(_4961);
        float _4969 = log2(_4967);
        float _4971 = _4943 * _4953;
        float _4973 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4975 = _3868 * _4965;
        float _4977 = -_4965;
        float _4979 = -_4973;
        float _4981 = fma(_4977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4979);
        float _4983 = fma(_3852, _4963, _4975);
        float _4985 = -_4971;
        float _4987 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4981);
        float _4989 = fma(_3870, _4971, _4983);
        float _4991 = precise::clamp(_4989, 0.0, 1.0);
        float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4995 = _4987 + _4993;
        float _4997 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4999 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5001 = precise::clamp(_4999, 0.0, 1.0);
        float _5003 = exp2(_4997);
        float _5005 = _5003 * _5001;
        float _5007 = _4991 * _5005;
        float _5009 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5011 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5013 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5009;
        out.m_104.y = _5011;
        out.m_104.z = _5013;
    }
    out.m_80.x = _4925;
    out.m_80.y = _4927;
    out.m_80.z = _4929;
    if (_4909)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _5015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5015;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4773 = false;
    bool _3936 = false;
    bool _561 = false;
    bool _463 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_46.w;
    float _120 = in.m_48.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = as_type<float>(_125);
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_53.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5084 = as_type<float>(_147);
        out.gl_Position.z = _5084;
    }
    if (!_133)
    {
        return out;
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_51.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_179);
        out.gl_Position.z = _5147;
    }
    if (_167)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    float _201 = in.m_64.x;
    float _203 = in.m_64.y;
    float _205 = in.m_64.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_66.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_68.x;
    float _289 = in.m_68.y;
    float _291 = 1.0 / _281;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 1.0 / _277;
    bool _297 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_265);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _285;
    float _311 = _269 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = _315 * _291;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = _273 * _309;
    float _341 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _343 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_265);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_307;
    float _363 = _361 + 1.0;
    float _365 = _307 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_265);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _353 * _363;
    float _385 = -_353;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = fma(_369, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = _381 * _387;
    float _397 = -_381;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _341 * _395;
    float _405 = _359 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_401, _383, _415);
    float _425 = fma(_393, _383, _417);
    float _427 = fma(_419, _365, _423);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_293;
    float _441 = _287;
    float _443 = _321;
    float _461;
    if (!_439)
    {
        float _445 = in.m_66.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _173;
    }
    _463 = false;
    float _465 = _461;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _481;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _507;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _531;
    out.m_70.y = _533;
    out.m_70.z = _537;
    out.m_70.w = _539;
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_66.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = 1.0 / _587;
    float _627 = _603 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    float _637 = fma(_627, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _639 = _599 * _621;
    float _641 = -_599;
    float _643 = _641 + 1.0;
    float _645 = _583 * _635;
    float _647 = _631 * _625;
    float _649 = _637 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _653 = _563 + _651;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[131].x, _649);
    float _657 = fma(_647, _653, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _645, _655);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _665;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_72.w = _675;
    bool _677 = !_623;
    float _679 = _671;
    if (!_677)
    {
        float _681 = in.m_66.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _701 = int(_699);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = float(_701);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _711 = int(_709);
    float _713 = float(uint(_705));
    float _715 = 1.0 / _707;
    int _717 = ~_705;
    int _719 = _717 + 1;
    int _721 = ~_705;
    int _723 = _721 + 1;
    float _725 = 1.0 / _713;
    float _727 = float(uint(_711));
    float _729 = _715 * _129;
    float _731 = 1.0 / _727;
    int _733 = as_type<int>(_725) + (-2);
    float _735 = trunc(_729);
    int _737 = int(_735);
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _741 = int(_739);
    float _743 = float(uint(_737));
    float _745 = as_type<float>(_733) * _743;
    float _747 = float(_741);
    float _749 = trunc(_745);
    float _751 = precise::max(_749, 0.0);
    uint _754 = uint(_751);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = 1.0 / _747;
    float _762 = _707;
    float _764 = as_type<float>(_741);
    float _766 = _747;
    if (_758)
    {
        float _768 = in.m_66.x;
        float _770 = in.m_66.y;
        _762 = _768;
        _764 = _770;
    }
    float _772 = _762;
    float _774 = _764;
    float _776 = 0.0;
    if (_758)
    {
        _776 = 1.0;
    }
    float _778 = _776;
    int _780 = _719 * int(_754);
    int _782 = _780 + _737;
    float _784 = _778;
    if (_758)
    {
        _679 = 1.0;
    }
    float _786 = _679;
    int _788 = 0;
    float _790 = _786;
    if (_758)
    {
        _788 = 0;
    }
    int _792 = _788;
    float _794 = _760 * _129;
    float _796 = float(uint(_782));
    float _798 = as_type<float>(_733) * _796;
    float _800 = trunc(_794);
    int _802 = int(_800);
    float _804 = 0.0;
    float _806 = _772;
    float _808 = _774;
    int _810 = _792;
    if (_758)
    {
        _804 = _772;
    }
    float _812 = _804;
    float _814 = trunc(_798);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = _812;
    if (_758)
    {
        _441 = _774;
    }
    float _822 = _441;
    float _824 = _822;
    if (_758)
    {
        _443 = _812;
    }
    float _826 = _443;
    float _828 = _826;
    if (_758)
    {
        _766 = _812;
    }
    float _830 = _766;
    float _832 = _830;
    if (!_758)
    {
        float _834 = in.m_66.x;
        float _836 = in.m_66.y;
        float _838 = in.m_66.z;
        float _840 = _834 * 3.1415927410125732421875;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = _836 * 3.1415927410125732421875;
        float _846 = _844 * 0.15915493667125701904296875;
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        _784 = 7.345489978790283203125;
        _806 = _834;
        _790 = 5.839270114898681640625;
        _832 = _838;
        _820 = _836;
        _808 = _836;
        _824 = _854;
        _828 = _850;
        _810 = 2;
    }
    float _856 = _784;
    float _858 = _806;
    float _860 = _790;
    float _862 = _832;
    float _864 = _820;
    float _866 = _808;
    float _868 = _824;
    float _870 = _828;
    int _872 = _810;
    float _874 = in.m_66.z;
    int _876 = int(_754) + int(_818);
    float _878 = _856 * _858;
    float _880 = _860 * _862;
    int _882 = as_type<int>(_731) + (-2);
    float _884 = floor(_878);
    float _886 = float(uint(_802));
    int _888 = _723 * _876;
    int _890 = _888 + _737;
    float _892 = float(_737);
    float _894 = _856 * _864;
    float _896 = as_type<float>(_882) * _886;
    bool _898 = uint(_890) >= uint(_705);
    float _900 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _902 = log2(_900);
    float _904 = float(_705);
    float _906 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _908 = !_898;
    int _910 = _908 ? 0 : (-1);
    float _912 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _914 = _892 >= _904;
    bool _916 = isnan(_892);
    bool _918 = _914 || _916;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    bool _926 = _705 == 0;
    float _928 = trunc(_896);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    int _934 = ~_711;
    int _936 = _934 + 1;
    float _938 = -_884;
    float _940 = _878 + _938;
    bool _942 = _874 > 0.5;
    int _944 = ~_876;
    int _946 = _944 + _910;
    int _948 = _946 + 1;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _956 = _954 != 0;
    float _958 = trunc(_924);
    int _960 = int(_958);
    bool _962 = _866 > 0.5;
    float _964 = _940 * _904;
    float _966 = -_223;
    int _968 = _942 ? as_type<int>(_966) : as_type<int>(_223);
    float _970 = _169 * _129;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _974 = _972 != 0;
    int _976 = _936 * int(_932);
    int _978 = _976 + _802;
    float _980 = -_219;
    int _982 = _962 ? as_type<int>(_980) : as_type<int>(_219);
    float _984 = trunc(_964);
    int _986 = int(_984);
    float _988 = _904 * _970;
    float _990 = float(uint(_978));
    bool _992 = !_956;
    float _994 = _992 ? _223 : as_type<float>(_968);
    int _996 = _705 * _948;
    int _998 = _996 + _737;
    bool _1000 = !_952;
    float _1002 = _1000 ? _219 : as_type<float>(_982);
    float _1004 = as_type<float>(_882) * _990;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1016 = _1014 != 0;
    float _1018 = trunc(_988);
    int _1020 = int(_1018);
    bool _1022 = !_974;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = ~_960;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    bool _1036 = !_926;
    int _1038 = _1036 ? _998 : (-1);
    float _1040 = trunc(_1004);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = abs(_1024);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    int _1052 = _1038 * _1030;
    int _1054 = _705 + (-1);
    bool _1056 = !_1050;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1034);
    int _1062 = _960 * _1054;
    int _1064 = _1062 + _1052;
    float _1066 = floor(_880);
    float _1068 = float(_711);
    int _1070 = _1064 * _1060;
    float _1072 = float(_802);
    int _1074 = _986 * _1046;
    int _1076 = _1074 + _737;
    bool _1078 = !_1008;
    int _1080 = _1078 ? 0 : 1;
    int _1082 = int(_932) + int(_1044);
    int _1084 = abs(_1080);
    bool _1086 = !_1016;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = ~_711;
    int _1092 = _1090 + 1;
    int _1094 = _1020 * _1084;
    int _1096 = _1094 + _1070;
    int _1098 = abs(_1088);
    float _1100 = -_1066;
    float _1102 = _880 + _1100;
    int _1104 = abs(_1058);
    int _1106 = _1092 * _1082;
    int _1108 = _1106 + _802;
    float _1110 = _1102 * _1068;
    bool _1112 = _1072 >= _1068;
    bool _1114 = isnan(_1072);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1068);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = _1068 * _970;
    int _1126 = _1076 * _1098;
    int _1128 = _1126 + _1096;
    bool _1130 = uint(_1108) >= uint(_711);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _711 == 0;
    int _1138 = _986 * _1104;
    int _1140 = _1138 + _1128;
    bool _1142 = !_1130;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = ~_1082;
    int _1152 = _1150 + _1144;
    int _1154 = _1152 + 1;
    float _1156 = trunc(_1122);
    int _1158 = int(_1156);
    bool _1160 = !_1148;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = float(uint(_1140));
    int _1166 = abs(_1162);
    int _1168 = _711 * _1154;
    int _1170 = _1168 + _802;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_733) * _1164;
    float _1186 = trunc(_1124);
    int _1188 = int(_1186);
    bool _1190 = !_1136;
    int _1192 = _1190 ? _1170 : (-1);
    int _1194 = ~_705;
    int _1196 = _1194 + 1;
    int _1198 = _1134 * _1166;
    int _1200 = _1198 + _802;
    int _1202 = _711 + (-1);
    int _1204 = ~_1158;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = trunc(_1184);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1192 * _1208;
    bool _1226 = !_1178;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1174;
    int _1232 = _1230 ? 0 : 1;
    int _1234 = _1158 * _1202;
    int _1236 = _1234 + _1224;
    int _1238 = abs(_1228);
    int _1240 = abs(_1232);
    float _1242 = in.m_66.w;
    int _1244 = _1196 * int(_1214);
    int _1246 = _1244 + _1140;
    bool _1248 = !_1182;
    int _1250 = _1248 ? 0 : 1;
    bool _1252 = _705 == 0;
    int _1254 = _1236 * _1238;
    int _1256 = abs(_1250);
    float _1258 = float(uint(_1246));
    int _1260 = _1188 * _1240;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1218;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = as_type<float>(_733) * _1258;
    int _1270 = abs(_1266);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1200 * _1256;
    int _1278 = _1276 + _1262;
    float _1280 = trunc(_1268);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = 0.0;
    if (!_1222)
    {
        _1286 = _219;
    }
    float _1288 = _1286;
    int _1290 = _1134 * _1270;
    int _1292 = _1290 + _1278;
    int _1294 = ~_705;
    int _1296 = _1294 + 1;
    float _1298 = -_223;
    int _1300 = _962 ? as_type<int>(_1298) : as_type<int>(_223);
    float _1302 = float(uint(_1292));
    float _1304 = 0.0;
    float _1306 = _1302;
    float _1308 = _1288;
    if (!_1274)
    {
        _1304 = _223;
    }
    float _1310 = _1304;
    float _1312 = as_type<float>(_882) * _1302;
    float _1314 = _1310;
    if (_1222)
    {
        float _1316 = _1242 * 3.1415927410125732421875;
        _1306 = _1316;
    }
    float _1318 = _1306;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = trunc(_1312);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = int(_1214) + int(_1284);
    float _1330 = _1318;
    if (_1222)
    {
        float _1332 = _1318 * 0.15915493667125701904296875;
        _1330 = _1332;
    }
    float _1334 = _1330;
    int _1336 = ~_711;
    int _1338 = _1336 + 1;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1342 = _1296 * _1328;
    int _1344 = _1342 + _1140;
    float _1346 = _1334;
    if (_1222)
    {
        float _1348 = _1334 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        _1346 = _1350;
    }
    float _1352 = _1346;
    float _1354 = float(uint(_1200));
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1358 = uint(_1344) >= uint(_705);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1362 = as_type<float>(_882) * _1354;
    bool _1364 = !_1358;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1338 * int(_1326);
    int _1370 = _1368 + _1292;
    bool _1372 = _1242 > 0.5;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1376 = ~_1328;
    int _1378 = _1376 + _1366;
    int _1380 = _1378 + 1;
    float _1382 = float(uint(_1370));
    float _1384 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1374);
    float _1386 = -_223;
    int _1388 = _1372 ? as_type<int>(_1386) : as_type<int>(_223);
    int _1390 = _705 * _1380;
    int _1392 = _1390 + _1140;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_882) * _1382;
    int _1400 = ~_711;
    int _1402 = _1400 + 1;
    float _1404 = _868 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1406 = !_1396;
    float _1408 = _1406 ? _223 : as_type<float>(_1388);
    float _1410 = trunc(_1398);
    float _1412 = precise::max(_1410, 0.0);
    uint _1414 = uint(_1412);
    bool _1416 = _1396;
    if (_1222)
    {
        bool _1418 = _1352 > 0.5;
        _1416 = _1418;
    }
    bool _1420 = _1416;
    float _1422 = as_type<float>(_1388);
    if (_1274)
    {
        float _1424 = in.m_66.x;
        _1422 = _1424;
    }
    float _1426 = _1422;
    bool _1428 = !_1252;
    int _1430 = _1428 ? _1392 : (-1);
    float _1432 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1384);
    if (_1222)
    {
        float _1434 = -_219;
        float _1436 = _1420 ? _1434 : _219;
        _1308 = _1436;
    }
    float _1438 = _1308;
    float _1440 = -_1408;
    float _1442 = _1440 + 0.5;
    int _1444 = _1430 & 3;
    bool _1446 = _1444 != 0;
    float _1448 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1450 = int(_1448);
    int _1452 = _1430 & 3;
    bool _1454 = _1452 != 0;
    float _1456 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _1446 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1460 = uint(_1452) > 1u;
    bool _1462 = _711 == 0;
    int _1464 = int(_1326) + int(_1414);
    int _1466 = ~as_type<int>(_1458);
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = int(_962);
    int _1474 = _1274 ? 2 : 0;
    int _1476 = _1472 | _1474;
    int _1478 = _1460 ? 4 : 0;
    int _1480 = _1476 | _1478;
    int _1482 = _1454 ? 8 : 0;
    int _1484 = _1480 | _1482;
    int _1486 = _1174 ? 16 : 0;
    int _1488 = _1484 | _1486;
    int _1490 = _1462 ? 32 : 0;
    int _1492 = _1488 | _1490;
    int _1494 = _1182 ? 64 : 0;
    int _1496 = _1492 | _1494;
    int _1498 = _1496 & 8;
    int _1500 = _1402 * _1464;
    int _1502 = _1500 + _1292;
    float _1504 = float(uint(_1450));
    int _1506 = _1470;
    float _1508 = _1458;
    if (!_1460)
    {
        int _1510 = ~as_type<int>(_1458);
        int _1512 = _1510 + 1;
        _1506 = _1512;
    }
    int _1514 = _1506;
    if (_1274)
    {
        float _1516 = _1426 * 3.1415927410125732421875;
        _1508 = _1516;
    }
    float _1518 = _1508;
    bool _1520 = uint(_1452) >= 2u;
    int _1522 = ~_1450;
    int _1524 = _1522 + 1;
    float _1526 = _1518;
    if (_1274)
    {
        float _1528 = _1518 * 0.15915493667125701904296875;
        _1526 = _1528;
    }
    float _1530 = _1526;
    int _1532 = _1520 ? 0 : 1;
    bool _1534 = uint(_1502) >= uint(_711);
    int _1536 = ~_1532;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = _1530;
    int _1544 = _1540;
    if (_1274)
    {
        float _1546 = _1530 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    bool _1552 = !_1534;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = _1452 != 3;
    int _1558 = ~_1464;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    float _1564 = float(_1450);
    int _1566 = _711 * _1562;
    int _1568 = _1566 + _1292;
    float _1570 = _1564 * _970;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1574 = !_1462;
    int _1576 = _1574 ? _1568 : (-1);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1582 = int(_1580);
    bool _1584 = _1556;
    if (_1556)
    {
        int _1586 = ~_1532;
        int _1588 = _1586 + 1;
        _1544 = _1588;
    }
    int _1590 = _1544;
    if (_1274)
    {
        bool _1592 = _1550 > 0.5;
        _1584 = _1592;
    }
    bool _1594 = _1584;
    float _1596 = fma(_1404, -2.0, _1578);
    if (_1274)
    {
        float _1598 = -_223;
        float _1600 = _1594 ? _1598 : _223;
        _1314 = _1600;
    }
    float _1602 = _1314;
    float _1604 = 1.0 / _1504;
    int _1606 = _1576 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1612 = _1576 & 3;
    bool _1614 = _1612 != 0;
    float _1616 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1596);
    int _1618 = _1608 ? 0 : 1;
    float _1620 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1610);
    bool _1622 = uint(_1612) > 1u;
    float _1624 = trunc(_1570);
    int _1626 = int(_1624);
    float _1628 = float(_1582);
    float _1630 = _866 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1632 = ~_1618;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = int(_962);
    int _1640 = _1622 ? 2 : 0;
    int _1642 = _1638 | _1640;
    int _1644 = _1614 ? 4 : 0;
    int _1646 = _1642 | _1644;
    int _1648 = _1454 ? 8 : 0;
    int _1650 = _1646 | _1648;
    int _1652 = _1174 ? 16 : 0;
    int _1654 = _1650 | _1652;
    int _1656 = _1462 ? 32 : 0;
    int _1658 = _1654 | _1656;
    int _1660 = _1182 ? 64 : 0;
    int _1662 = _1658 | _1660;
    int _1664 = _1662 & 4;
    float _1666 = fma(_1630, -2.0, _1320);
    float _1668 = 1.0 / _1628;
    int _1670 = as_type<int>(_1604) + (-2);
    float _1672 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1666);
    int _1674 = ~_705;
    int _1676 = _1674 + 1;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1680 = _1636;
    if (!_1622)
    {
        int _1682 = ~_1618;
        int _1684 = _1682 + 1;
        _1680 = _1684;
    }
    int _1686 = _1680;
    bool _1688 = uint(_1612) >= 2u;
    float _1690 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1678);
    float _1692 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1694 = _870 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1696 = _1688 ? 0 : 1;
    float _1698 = _858 * 2.0;
    bool _1700 = _1612 != 3;
    float _1702 = -_1340;
    float _1704 = fma(_1692, 2.0, _1702);
    int _1706 = ~_1696;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    float _1712 = _1668 * _129;
    float _1714 = _902 * _129;
    float _1716 = -_1356;
    float _1718 = fma(_1694, 2.0, _1716);
    float _1720 = floor(_1698);
    float _1722 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1690);
    float _1724 = -_129;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1704);
    float _1728 = -_129;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1718);
    int _1732 = ~_1450;
    int _1734 = _1732 + 1;
    int _1736 = _1710;
    float _1738 = _1698;
    if (_1700)
    {
        int _1740 = ~_1696;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = trunc(_1712);
    int _1748 = int(_1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1752 = _1750 != 0;
    bool _1754 = !_1752;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1760 = _1758 != 0;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1772 = _1770 != 0;
    float _1774 = exp2(_1714);
    bool _1776 = _874 > 0.5;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1782 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1784 = isnan(_697);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    bool _1794 = !_1760;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / _1780;
    float _1804 = float(uint(_1748));
    bool _1806 = !_1800;
    float _1808 = _1806 ? _223 : as_type<float>(_1300);
    bool _1810 = _872 != 2;
    float _1812 = as_type<float>(_1670) * _1804;
    bool _1814 = !_1764;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = floor(_894);
    bool _1820 = _858 > 0.5;
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    bool _1826 = !_1768;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1772;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1664 != 0;
    if (_1810)
    {
        _1738 = _866;
    }
    float _1846 = _1738;
    float _1848 = _1846;
    if (!_1810)
    {
        _1848 = _858;
    }
    float _1850 = _1848;
    int _1852 = abs(_1816);
    float _1854 = -_1818;
    float _1856 = _894 + _1854;
    float _1858 = float(uint(_1076));
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1862 = -_219;
    int _1864 = _1820 ? as_type<int>(_1862) : as_type<int>(_219);
    float _1866 = _1856 * _1564;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = fma(_1860, -2.0, _1572);
    int _1874 = ~_705;
    int _1876 = _1874 + 1;
    int _1878 = _1524 * int(_1842);
    int _1880 = _1878 + _1748;
    float _1882 = trunc(_1866);
    int _1884 = int(_1882);
    int _1886 = ~_711;
    int _1888 = _1886 + 1;
    int _1890 = abs(_1828);
    float _1892 = float(uint(_1880));
    float _1894 = _866 * 2.0;
    float _1896 = as_type<float>(_1670) * _1892;
    float _1898 = as_type<float>(_733) * _1858;
    float _1900 = _1858;
    if (_1810)
    {
        _1900 = _858;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (!_1810)
    {
        _1904 = _874;
    }
    float _1906 = _1904;
    float _1908 = trunc(_1896);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    bool _1914 = _1720 > 0.0;
    int _1916 = abs(_1836);
    bool _1918 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1920 = isnan(_697);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    int _1930 = abs(_1686);
    float _1932 = trunc(_1898);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    bool _1938 = !_1870;
    float _1940 = _1938 ? _219 : as_type<float>(_1864);
    float _1942 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1944 = _1720 >= 0.0;
    bool _1946 = isnan(_1720);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    int _1954 = abs(_1744);
    float _1956 = -_1360;
    float _1958 = fma(_1942, 2.0, _1956);
    float _1960 = -_219;
    int _1962 = _1776 ? as_type<int>(_1960) : as_type<int>(_219);
    float _1964 = trunc(_1362);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = int(_1842) + int(_1912);
    bool _1972 = !_1832;
    float _1974 = _1972 ? _219 : as_type<float>(_1962);
    int _1976 = abs(_1756);
    bool _1978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1980 = isnan(0.0);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1986 = _1982 || _1984;
    int _1988 = _1876 * int(_1936);
    int _1990 = _1988 + _1076;
    int _1992 = ~_1450;
    int _1994 = _1992 + 1;
    int _1996 = _1884 * _1976;
    int _1998 = _1996 + _1748;
    float _2000 = floor(_1894);
    int _2002 = abs(_1514);
    float _2004 = float(uint(_1990));
    int _2006 = _1888 * int(_1968);
    int _2008 = _2006 + _1200;
    float _2010 = _1986 ? _1824 : 0.0;
    float _2012 = as_type<float>(_733) * _2004;
    float _2014 = float(uint(_1998));
    bool _2016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2018 = isnan(1.0);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2024 = _2020 || _2022;
    float _2026 = as_type<float>(_1670) * _2014;
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2030 = 1.0 + _2028;
    float _2032 = float(uint(_2008));
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2036 = trunc(_2012);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = as_type<float>(_882) * _2032;
    float _2044 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2034);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2048 = ~_1450;
    int _2050 = _2048 + 1;
    float _2052 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2044);
    float _2054 = trunc(_2026);
    float _2056 = precise::max(_2054, 0.0);
    uint _2058 = uint(_2056);
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2062 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2046);
    float _2064 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1620);
    float _2066 = -_2052;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2060);
    float _2072 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2062);
    float _2074 = 1.0 / _2030;
    float _2076 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2070);
    int _2078 = _1994 * int(_2058);
    int _2080 = _2078 + _1998;
    float _2082 = trunc(_2042);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2050 * _1970;
    int _2090 = _2088 + _1748;
    float _2092 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1872);
    float _2094 = float(uint(_2080));
    float _2096 = -_129;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1958);
    float _2100 = as_type<float>(_2002);
    if (_2024)
    {
        float _2102 = _2010 * _2074;
        _139 = _2102;
    }
    float _2104 = _139;
    bool _2106 = uint(_2090) >= uint(_1450);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2112 = as_type<float>(_1670) * _2094;
    int _2114 = _1952 ? 0 : 1;
    float _2116 = in.m_62.w;
    bool _2118 = !_2106;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = trunc(_2112);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    bool _2128 = _2000 > 0.0;
    float _2130 = -_1928;
    float _2132 = _2130 + 1.0;
    bool _2134 = _2000 >= 0.0;
    bool _2136 = isnan(_2000);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(0.0);
    bool _2142 = _2138 || _2140;
    int _2144 = int(_1936) + int(_2040);
    int _2146 = ~_2114;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _2150;
    if (!_1914)
    {
        int _2154 = ~_2114;
        int _2156 = _2154 + 1;
        _2152 = _2156;
    }
    int _2158 = _2152;
    int _2160 = int(_1968) + int(_2086);
    int _2162 = _1676 * _2144;
    int _2164 = _2162 + _1076;
    float _2166 = float(_1748);
    int _2168 = ~_711;
    int _2170 = _2168 + 1;
    bool _2172 = _2166 >= _1564;
    bool _2174 = isnan(_2166);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1564);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = int(_2058) + int(_2126);
    int _2186 = _2170 * _2160;
    int _2188 = _2186 + _1200;
    bool _2190 = uint(_2164) >= uint(_705);
    float _2192 = trunc(_2182);
    int _2194 = int(_2192);
    int _2196 = _1734 * _2184;
    int _2198 = _2196 + _1998;
    int _2200 = _2142 ? 0 : 1;
    bool _2202 = !_2190;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = ~_1970;
    int _2208 = _2206 + _2120;
    int _2210 = _2208 + 1;
    bool _2212 = uint(_2188) >= uint(_711);
    bool _2214 = uint(_2198) >= uint(_1450);
    int _2216 = _1450 * _2210;
    int _2218 = _2216 + _1748;
    bool _2220 = !_2212;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2226 = _2224 != 0;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2230 = _2228 != 0;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2234 = _2232 != 0;
    bool _2236 = _1450 == 0;
    int _2238 = ~_2194;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    bool _2244 = !_2236;
    int _2246 = _2244 ? _2218 : (-1);
    int _2248 = _1450 + (-1);
    int _2250 = ~_2200;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2246 * _2242;
    int _2258 = abs(_1796);
    int _2260 = _2194 * _2248;
    int _2262 = _2260 + _2256;
    int _2264 = ~_1450;
    int _2266 = _2264 + 1;
    int _2268 = _2262 * _1852;
    int _2270 = _2254;
    if (!_2128)
    {
        int _2272 = ~_2200;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _1626 * _2258;
    int _2280 = _2278 + _2268;
    int _2282 = ~_1450;
    int _2284 = _2282 + 1;
    int _2286 = _1998 * _1890;
    int _2288 = _2286 + _2280;
    bool _2290 = !_2214;
    int _2292 = _2290 ? 0 : (-1);
    bool _2294 = !_2230;
    int _2296 = _2294 ? 0 : 1;
    int _2298 = _1884 * _1916;
    int _2300 = _2298 + _2288;
    float _2302 = float(uint(_2300));
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2308 = _1498 != 0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2314 = as_type<float>(_1670) * _2302;
    float _2316 = _874 * 2.0;
    float _2318 = 1.0 / _2306;
    bool _2320 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2322 = isnan(_697);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    bool _2332 = !_2226;
    int _2334 = _2332 ? 0 : 1;
    bool _2336 = !_2234;
    int _2338 = _2336 ? 0 : 1;
    float _2340 = float(_2158);
    float _2342 = trunc(_2314);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    int _2348 = abs(_2338);
    int _2350 = ~_2144;
    int _2352 = _2350 + _2204;
    int _2354 = _2352 + 1;
    int _2356 = ~_2184;
    int _2358 = _2356 + _2292;
    int _2360 = _2358 + 1;
    bool _2362 = _711 == 0;
    float _2364 = floor(_2316);
    int _2366 = _705 * _2354;
    int _2368 = _2366 + _1076;
    int _2370 = _1450 * _2360;
    int _2372 = _2370 + _1998;
    int _2374 = _2266 * int(_2346);
    int _2376 = _2374 + _2300;
    float _2378 = float(uint(_2376));
    bool _2380 = _2364 >= 0.0;
    bool _2382 = isnan(_2364);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan(0.0);
    bool _2388 = _2384 || _2386;
    float _2390 = as_type<float>(_1670) * _2378;
    int _2392 = _2388 ? 0 : 1;
    float _2394 = trunc(_2390);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    bool _2400 = _2364 > 0.0;
    int _2402 = ~_2392;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = _2406;
    if (!_2400)
    {
        int _2410 = ~_2392;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    int _2416 = int(_2346) + int(_2398);
    float _2418 = in.m_46.x;
    float _2420 = in.m_46.y;
    float _2422 = in.m_46.z;
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2426 = _2424 != 0;
    int _2428 = _2284 * _2416;
    int _2430 = _2428 + _2300;
    bool _2432 = uint(_2430) >= uint(_1450);
    bool _2434 = !_1844;
    int _2436 = _2434 ? 0 : 1;
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _1612 != 3;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2446 = _2444 != 0;
    float _2448 = 1.0 / _2312;
    bool _2450 = !_2442;
    int _2452 = _2450 ? 0 : (-1);
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2456 = _2454 != 0;
    int _2458 = ~_2416;
    int _2460 = _2458 + _2440;
    int _2462 = _2460 + 1;
    float _2464 = _191 * _2420;
    float _2466 = _203 * _2420;
    float _2468 = 1.0 / _2110;
    float _2470 = _197 * _2420;
    float _2472 = fma(_189, _2418, _2464);
    float _2474 = fma(_201, _2418, _2466);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2480 = fma(_195, _2418, _2470);
    float _2482 = fma(_193, _2422, _2472);
    float _2484 = fma(_205, _2422, _2474);
    float _2486 = fma(_199, _2422, _2480);
    float _2488 = 1.0 / _2478;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2506 = 1.0 / _2492;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2510 = _2508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _2496 * _1802;
    float _2514 = _2504 * _2468;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2520;
    bool _2524 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2526 = isnan(_697);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = 1.0 / _2510;
    float _2538 = _2518 * _2448;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    float _2544 = _2500 * _2318;
    float _2546 = in.m_60.w;
    bool _2548 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_697);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2522 * _2488;
    bool _2562 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2564 = isnan(_697);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2570 = _2566 || _2568;
    float _2572 = float(_2570);
    float _2574 = _2542 * _2506;
    float _2576 = -_2534;
    float _2578 = _2576 + 1.0;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2584 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2586 = isnan(_697);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = in.m_64.w;
    float _2598 = _2558 * _2578;
    float _2600 = -_2558;
    float _2602 = _2600 + 1.0;
    float _2604 = -_2572;
    float _2606 = _2604 + 1.0;
    float _2608 = -_2594;
    float _2610 = _2608 + 1.0;
    float _2612 = _2582 * _2536;
    float _2614 = _2572 * _2602;
    float _2616 = _2594 * _2606;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2620 = _697 + _2618;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2624 = _697 + _2622;
    float _2626 = _1792 * _2610;
    float _2628 = -_1792;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2512, _2620, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2634 = fma(_2544, _2624, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2636 = -_2330;
    float _2638 = _2636 + 1.0;
    float _2640 = _2330 * _2630;
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = _2486 + _2116;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2658 = _697 + _2656;
    float _2660 = _2482 + _2546;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2664 = _697 + _2662;
    float _2666 = _2652 * _2132;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2670 = _2654 + _2668;
    float _2672 = fma(_2538, _2658, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2632 * _2666;
    float _2680 = _2484 + _2596;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2660 + _2682;
    float _2686 = _2670 * _2670;
    float _2688 = _1928 * _2638;
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2678);
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2694 = _2680 + _2692;
    float _2696 = fma(_2684, _2684, _2686);
    float _2698 = fma(_2514, _2664, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2702 = _697 + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2706 = _697 + _2704;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _697 + _2708;
    float _2712 = fma(_2634, _2688, _2690);
    float _2714 = fma(_2694, _2694, _2696);
    float _2716 = fma(_2574, _2702, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2718 = fma(_2612, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2720 = fma(_2672, _2640, _2712);
    float _2722 = _866 + _858;
    float _2724 = sqrt(_2714);
    float _2726 = fma(_2560, _2706, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2728 = _2722 + (-1.0);
    float _2730 = _858 + _874;
    float _2732 = _858 + (-0.5);
    float _2734 = _866 + _874;
    float _2736 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2738 = _866 + (-0.5);
    float _2740 = rsqrt(_2714);
    float _2742 = fma(_2698, _2626, _2720);
    float _2744 = _906 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2746 = _2734 + (-1.0);
    float _2748 = _2730 + (-1.0);
    float _2750 = _2724 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2754 = _1438 + 0.5;
    float _2756 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2758 = _1602 + (-0.5);
    float _2760 = precise::min(_2744, _2750);
    float _2762 = fma(_2726, _2616, _2742);
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1730);
    float _2766 = _1940 + 0.5;
    float _2768 = -_2758;
    float _2770 = -_1616;
    float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2770);
    float _2774 = _2740 * _2760;
    float _2776 = fma(_2718, _2614, _2762);
    int _2778 = abs(_2334);
    float _2780 = in.m_74.x;
    float _2782 = in.m_74.y;
    float _2784 = in.m_74.z;
    float _2786 = _2670 * _2774;
    float _2788 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _2790 = float(_2414);
    float _2792 = _1808 + (-0.5);
    float _2794 = -_2786;
    float _2796 = _2670 + _2794;
    float _2798 = _2684 * _2774;
    float _2800 = _2694 * _2774;
    float _2802 = -_2792;
    float _2804 = -_1672;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2804);
    float _2808 = _2796 * _2796;
    float _2810 = float(_2778);
    float _2812 = -_2798;
    float _2814 = _2684 + _2812;
    int _2816 = abs(_2296);
    float _2818 = fma(_2716, _2598, _2776);
    float _2820 = -_1722;
    float _2822 = _2820 + 1.0;
    float _2824 = _2810 * _2790;
    float _2826 = fma(_2814, _2814, _2808);
    float _2828 = float(_2276);
    float _2830 = -_2800;
    float _2832 = _2694 + _2830;
    float _2834 = _2824 * (-2.0);
    float _2836 = float(_2816);
    float _2838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2840 = float(_2348);
    float _2842 = fma(_2832, _2832, _2826);
    float _2844 = fma(_2834, _2780, _2780);
    float _2846 = _2836 * _2340;
    float _2848 = _874 + (-0.5);
    float _2850 = _2840 * _2828;
    float _2852 = -_1432;
    float _2854 = _2852 + 1.0;
    float _2856 = _2846 * (-2.0);
    float _2858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2860 = _2850 * (-2.0);
    float _2862 = fma(_2736, _2834, _2736);
    float _2864 = fma(_2856, _2782, _2782);
    float _2866 = _1974 + 0.5;
    float _2868 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2844);
    float _2870 = fma(_2752, _2856, _2752);
    float _2872 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2864);
    float _2874 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2876 = fma(_2860, _2784, _2784);
    float _2878 = fma(_2756, _2860, _2756);
    float _2880 = fma(_2854, _1602, _2772);
    float _2882 = _2874 * _2838;
    float _2884 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2876);
    float _2886 = -_2072;
    float _2888 = _2886 + 1.0;
    float _2890 = sqrt(_2842);
    float _2892 = fma(_2862, _2104, _2868);
    float _2894 = fma(_2870, _2104, _2872);
    float _2896 = _1456 * _2858;
    float _2898 = fma(_2878, _2104, _2884);
    float _2900 = -_2888;
    float _2902 = fma(_1940, _2900, _2788);
    float _2904 = -_2822;
    float _2906 = fma(_2904, _1438, _2764);
    float _2908 = fma(_1808, _2068, _2806);
    float _2910 = _2892 * 0.15915493667125701904296875;
    float _2912 = _2894 * 0.15915493667125701904296875;
    float _2914 = _2898 * 0.15915493667125701904296875;
    out.m_76.x = _2906;
    out.m_76.y = _2880;
    float _2916 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2818);
    float _2918 = _2910 * 6.283185482025146484375;
    float _2920 = sin(_2918);
    float _2922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    out.m_78.x = _2902;
    out.m_78.y = _2908;
    out.m_78.z = _2882;
    out.m_78.w = _2896;
    float _2924 = _2740 * _2890;
    float _2926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _2928 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2930 = _1450 * _2462;
    int _2932 = _2930 + _2300;
    float _2934 = _912 * _2924;
    float _2936 = _2910 * 6.283185482025146484375;
    float _2938 = cos(_2936);
    float _2940 = _906 * _2924;
    out.m_80.w = _2760;
    float _2942 = _2934 * _2922;
    float _2944 = _2940 * _2926;
    out.m_82.x = _2916;
    float _2946 = _2912 * 6.283185482025146484375;
    float _2948 = cos(_2946);
    int _2950 = _1576 >> 31;
    out.m_84.x = _2940;
    int _2952 = ~_2160;
    int _2954 = _2952 + _2222;
    int _2956 = _2954 + 1;
    int _2958 = _2950 & 3;
    float _2960 = _2914 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    int _2964 = _1576 + _2958;
    int _2966 = _711 * _2956;
    int _2968 = _2966 + _1200;
    int _2970 = _2964 >> 2;
    float _2972 = _2912 * 6.283185482025146484375;
    float _2974 = sin(_2972);
    float _2976 = _2920 * _2948;
    float _2978 = _2938 * _2948;
    float _2980 = _2914 * 6.283185482025146484375;
    float _2982 = sin(_2980);
    float _2984 = _2948 * _2962;
    float _2986 = _2938 * _2962;
    float _2988 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2990 = _2938 * _2974;
    int _2992 = _2970 << 4;
    int _2994 = _2992 + 656;
    float _2996 = _2920 * _2974;
    float _2998 = _2974 * _2962;
    float _3000 = _2986 * _2942;
    uint _3002 = uint(int(uint(_2994) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _2920 * _2962;
    float _3020 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3022 = fma(_2982, _2978, _2996);
    float _3024 = fma(_2982, _2996, _2978);
    float _3026 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3028 = -_2990;
    float _3030 = fma(_2982, _2976, _3028);
    float _3032 = fma(_3022, _2944, _3000);
    float _3034 = -_2976;
    float _3036 = fma(_2982, _2990, _3034);
    int _3038 = _2994 + 8;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    uint _3042 = uint(int(uint(int(_3040)) >> uint(2)));
    int _3044 = int(_3040) & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    int _3048 = int(_3040) + 1;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    int _3052 = _3048 & 3;
    float _3054 = (*spvDescriptorSet0.vp_c9)._m0[int(_3050)][_3052];
    float _3056 = -_2942;
    float _3058 = _2982 * _3056;
    float _3060 = _3018 * _2942;
    float _3062 = -_2982;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3026);
    float _3066 = -_2982;
    float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2988);
    float _3070 = -_2982;
    float _3072 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    float _3074 = fma(_2984, _2944, _3058);
    float _3076 = fma(_3030, _2944, _3060);
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3080 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3064);
    float _3082 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3068);
    float _3084 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3072);
    float _3086 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3088 = _3086 * 0.5;
    float _3090 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3092 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3094 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3096 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3098 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3078);
    float _3100 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3102 = fma(_2998, _3088, _3074);
    float _3104 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3090);
    float _3106 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3092);
    float _3108 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3094);
    float _3110 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3096);
    float _3112 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3100);
    float _3114 = fma(_3036, _3088, _3032);
    float _3116 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3118 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3098);
    int _3120 = abs(_2436);
    float _3122 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3110);
    float _3124 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3112);
    float _3126 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3128 = ~_1930;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3024, _3088, _3076);
    float _3136 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3104);
    float _3138 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3106);
    float _3140 = _2928 * _3080;
    int _3142 = ~_3120;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3132 * as_type<int>(_3016);
    float _3150 = _2928 * _3082;
    int _3152 = abs(_2452);
    float _3154 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3156 = _3146 * as_type<int>(_3008);
    int _3158 = _3156 + _3148;
    float _3160 = fma(_3126, _3118, _3140);
    out.m_86.x = _3118;
    out.m_86.y = _3122;
    out.m_86.z = _3124;
    float _3162 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3126, _3122, _3150);
    float _3166 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3168 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3170 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3172 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3174 = int(_3172);
    float _3176 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3178 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3168);
    float _3180 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3170);
    float _3182 = _2928 * _3084;
    int _3184 = _1430 >> 31;
    float _3186 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_1954;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = fma(_3126, _3124, _3182);
    int _3196 = _3184 & 3;
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    int _3206 = _3192 * as_type<int>(_3046);
    int _3208 = _3206 + _3158;
    int _3210 = _1430 + _3196;
    float _3212 = _2680 + _3198;
    bool _3214 = !_2362;
    int _3216 = _3214 ? _2968 : (-1);
    int _3218 = _3204 * as_type<int>(_3054);
    int _3220 = _3218 + _3208;
    bool _3222 = !_2446;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3228 = !_2236;
    int _3230 = _3228 ? _2932 : (-1);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3234 = _3212 + _3232;
    int _3236 = abs(_3224);
    float _3238 = _2660 + _3226;
    int _3240 = _3230 >> 31;
    float _3242 = _3234 * _3234;
    int _3244 = abs(_3174);
    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3248 = _3238 + _3246;
    int _3250 = _3240 & 3;
    float _3252 = float(uint(_3244));
    float _3254 = fma(_3248, _3248, _3242);
    int _3256 = _3230 + _3250;
    int _3258 = ~_3236;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    float _3264 = sqrt(_3254);
    int _3266 = _3256 >> 2;
    float _3268 = float(uint(_3174));
    int _3270 = _3220 * _3262;
    int _3272 = _3266 << 4;
    int _3274 = _3272 + 800;
    int _3276 = _3230 & 3;
    bool _3278 = _3276 != 0;
    float _3280 = 1.0 / _3268;
    uint _3282 = uint(int(uint(_3274) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    bool _3298 = !_2308;
    int _3300 = _3298 ? 0 : 1;
    int _3302 = _3216 * _3236;
    int _3304 = _3302 + _3270;
    bool _3306 = uint(_3276) > 1u;
    int _3308 = _3230 & 3;
    bool _3310 = _3308 != 0;
    float _3312 = 1.0 / _3252;
    int _3314 = ~_3174;
    int _3316 = _3314 + 1;
    int _3318 = _3310 ? 0 : 1;
    bool _3320 = _1452 != 3;
    int _3322 = abs(_3304);
    float _3324 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3326 = ~_3318;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3330;
    float _3334 = _3182;
    float _3336 = _3212;
    float _3338 = _2800;
    float _3340 = _3194;
    if (!_3306)
    {
        int _3342 = ~_3318;
        int _3344 = _3342 + 1;
        _3332 = _3344;
    }
    int _3346 = _3332;
    int _3348 = as_type<int>(_3280) + (-2);
    float _3350 = float(uint(_3304));
    int _3352 = as_type<int>(_3312) + (-2);
    float _3354 = _2654 + _3324;
    float _3356 = float(uint(_3322));
    float _3358 = as_type<float>(_3348) * _3350;
    bool _3360 = _3264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3362 = _3210 >> 2;
    float _3364 = as_type<float>(_3352) * _3356;
    float _3366 = trunc(_3358);
    float _3368 = precise::max(_3366, 0.0);
    uint _3370 = uint(_3368);
    bool _3372 = !_3278;
    int _3374 = _3372 ? 0 : 1;
    int _3376 = _3362 << 4;
    int _3378 = _3376 + 368;
    bool _3380 = uint(_3276) >= 2u;
    float _3382 = trunc(_3364);
    float _3384 = precise::max(_3382, 0.0);
    uint _3386 = uint(_3384);
    uint _3388 = uint(int(uint(_3378) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = ~_3244;
    int _3406 = _3404 + 1;
    if (!_3360)
    {
        _3334 = _3238;
    }
    float _3408 = _3334;
    float _3410 = _3408;
    if (!_3360)
    {
        _2100 = _3354;
    }
    float _3412 = _2100;
    int _3414 = ~_2002;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = _3378 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    bool _3438 = _3276 != 3;
    int _3440 = _3380 ? 0 : 1;
    bool _3442 = _3276 != 3;
    bool _3444 = !_3360;
    float _3446 = _3412;
    if (!_3444)
    {
        float _3448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3452 = _3264 + _3450;
        float _3454 = rsqrt(_3254);
        float _3456 = _3452 * _3448;
        float _3458 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3460 = _3456 * 0.15915493667125701904296875;
        float _3462 = _3460 * 6.283185482025146484375;
        float _3464 = cos(_3462);
        float _3466 = _3460 * 6.283185482025146484375;
        float _3468 = sin(_3466);
        float _3470 = _3464 + (-1.0);
        float _3472 = fma(_3468, _3458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3476 = _3454 * _3472;
        float _3478 = fma(_3354, _3464, _3474);
        float _3480 = fma(_3248, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3482 = fma(_3234, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3446 = _3478;
        _3410 = _3480;
        _3336 = _3482;
    }
    float _3484 = _3446;
    float _3486 = _3410;
    float _3488 = _3336;
    int _3490 = abs(_3346);
    int _3492 = _3418 * as_type<int>(_3402);
    int _3494 = _3274 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = _3316 * int(_3370);
    int _3514 = _3512 + _3304;
    float _3516 = -_2786;
    float _3518 = _3516 + _3484;
    float _3520 = -_2798;
    float _3522 = _3520 + _3486;
    int _3524 = abs(_3300);
    int _3526 = _3406 * int(_3386);
    int _3528 = _3526 + _3322;
    float _3530 = float(uint(_3514));
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3534 = _3518 + _3532;
    int _3536 = ~_3490;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    float _3542 = -_2076;
    float _3544 = _3542 + 1.0;
    float _3546 = float(uint(_3528));
    float _3548 = as_type<float>(_3348) * _3530;
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3552 = _3522 + _3550;
    float _3554 = _3534 * _3534;
    int _3556 = _3540 * as_type<int>(_3296);
    float _3558 = as_type<float>(_3352) * _3546;
    int _3560 = abs(_3374);
    float _3562 = fma(_3552, _3552, _3554);
    float _3564 = trunc(_3548);
    float _3566 = precise::max(_3564, 0.0);
    uint _3568 = uint(_3566);
    float _3570 = -_2064;
    float _3572 = _3570 + 1.0;
    int _3574 = abs(_1590);
    float _3576 = -_2800;
    float _3578 = _3576 + _3488;
    int _3580 = ~_3524;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    int _3586 = ~_3440;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = trunc(_3558);
    float _3594 = precise::max(_3592, 0.0);
    uint _3596 = uint(_3594);
    int _3598 = _3584 * as_type<int>(_3394);
    int _3600 = _3598 + _3492;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3610 = _3578 + _3608;
    int _3612 = _3590;
    if (_3442)
    {
        int _3614 = ~_3440;
        int _3616 = _3614 + 1;
        _3612 = _3616;
    }
    int _3618 = _3612;
    int _3620 = ~_3560;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3606 * as_type<int>(_3428);
    int _3628 = _3626 + _3600;
    int _3630 = abs(_3618);
    bool _3632 = !_3438;
    int _3634 = _3632 ? 0 : (-1);
    int _3636 = _3624 * as_type<int>(_3288);
    int _3638 = _3636 + _3556;
    bool _3640 = !_3320;
    int _3642 = _3640 ? 0 : (-1);
    float _3644 = fma(_3610, _3610, _3562);
    int _3646 = ~_3174;
    int _3648 = _3646 + 1;
    int _3650 = int(_3370) + int(_3568);
    int _3652 = ~_3630;
    int _3654 = _3652 + 1;
    int _3656 = _3654 + 1;
    float _3658 = sqrt(_3644);
    int _3660 = abs(_3634);
    int _3662 = int(_3386) + int(_3596);
    int _3664 = _3656 * as_type<int>(_3502);
    int _3666 = _3664 + _3638;
    int _3668 = ~_3244;
    int _3670 = _3668 + 1;
    int _3672 = abs(_3642);
    int _3674 = _3648 * _3650;
    int _3676 = _3674 + _3304;
    int _3678 = _3670 * _3662;
    int _3680 = _3678 + _3322;
    float _3682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3684 = uint(_3676) >= uint(_3174);
    int _3686 = ~_3660;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = ~_3672;
    int _3694 = _3692 + 1;
    int _3696 = _3694 + 1;
    bool _3698 = uint(_3680) >= uint(_3244);
    int _3700 = _3690 * as_type<int>(_3510);
    int _3702 = _3700 + _3666;
    int _3704 = _3304 ^ _3174;
    int _3706 = _3696 * as_type<int>(_3436);
    int _3708 = _3706 + _3628;
    bool _3710 = !_3698;
    int _3712 = _3710 ? 0 : (-1);
    float _3714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3716 = uint(int(uint(_3704) >> uint(31)));
    bool _3718 = !_3684;
    int _3720 = _3718 ? 0 : (-1);
    int _3722 = ~_3712;
    int _3724 = _3662 + _3722;
    int _3726 = _3724 + 1;
    bool _3728 = !_2426;
    int _3730 = _3728 ? 0 : 1;
    int _3732 = ~int(_3716);
    int _3734 = _3732 + 1;
    int _3736 = ~_3650;
    int _3738 = _3736 + _3720;
    int _3740 = _3738 + 1;
    bool _3742 = !_2456;
    int _3744 = _3742 ? 0 : 1;
    int _3746 = abs(_3730);
    int _3748 = _3174 * _3740;
    int _3750 = _3748 + _3304;
    int _3752 = _3726 ^ _3734;
    float _3754 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = abs(_3744);
    bool _3758 = _3174 == 0;
    bool _3760 = _3174 == 0;
    float _3762 = fma(_2928, _2928, 1.0);
    int _3764 = ~_3746;
    int _3766 = _3764 + 1;
    int _3768 = _3766 + 1;
    int _3770 = ~_3734;
    int _3772 = _3770 + _3752;
    int _3774 = _3772 + 1;
    float _3776 = rsqrt(_3762);
    bool _3778 = _705 == 0;
    int _3780 = _3708 * _3768;
    bool _3782 = !_3760;
    int _3784 = _3782 ? _3774 : (-1);
    float _3786 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3788 = !_3758;
    int _3790 = _3788 ? _3750 : (-1);
    float _3792 = float(_3784);
    int _3794 = ~_3756;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    float _3800 = float(_3790);
    float _3802 = -_2092;
    float _3804 = fma(_3786, _3792, _3802);
    float _3806 = _994 + (-0.5);
    bool _3808 = !_3778;
    int _3810 = _3808 ? _2368 : (-1);
    int _3812 = _3702 * _3798;
    bool _3814 = !_2236;
    int _3816 = _3814 ? _2372 : (-1);
    float _3818 = -_3786;
    float _3820 = fma(_3818, _3806, _3804);
    float _3822 = fma(_3754, _3800, _2098);
    float _3824 = _1002 + 0.5;
    float _3826 = _2928 * _3776;
    int _3828 = _3810 * _3746;
    int _3830 = _3828 + _3780;
    float _3832 = fma(_994, _3544, _3820);
    int _3834 = _3816 * _3756;
    int _3836 = _3834 + _3812;
    float _3838 = fma(_3754, _3824, _3822);
    float _3840 = -_3136;
    float _3842 = _3826 * _3840;
    float _3844 = -_3138;
    float _3846 = _3826 * _3844;
    float _3848 = -_3116;
    float _3850 = _3826 * _3848;
    float _3852 = _3136 + _3160;
    float _3854 = float(_3830);
    float _3856 = -_3572;
    float _3858 = fma(_1002, _3856, _3838);
    float _3860 = fma(_3776, _3080, _3842);
    float _3862 = fma(_3776, _3082, _3846);
    float _3864 = fma(_3776, _3084, _3850);
    float _3866 = float(_3836);
    float _3868 = _3138 + _3164;
    float _3870 = _3116 + _3194;
    out.m_88.x = _3854;
    bool _3872 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3874 = isnan(_3658);
    bool _3876 = _3872 || _3874;
    bool _3878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3880 = _3876 || _3878;
    float _3882 = -_2786;
    float _3884 = _2654 + _3882;
    float _3886 = -_2798;
    float _3888 = _2660 + _3886;
    out.m_90.x = _3860;
    out.m_90.y = _3862;
    out.m_90.z = _3864;
    float _3890 = -_2800;
    float _3892 = _2680 + _3890;
    out.m_88.w = _3866;
    out.m_92.x = _3858;
    out.m_92.y = _3832;
    float _3894 = as_type<float>(_3836);
    float _3896 = _3892;
    float _3898 = _3884;
    float _3900 = _3888;
    if (!_3880)
    {
        _3894 = 1.0;
    }
    float _3902 = _3894;
    out.m_94.x = _3852;
    out.m_94.y = _3868;
    out.m_94.z = _3870;
    bool _3904 = !_3880;
    float _3906 = _3902;
    if (!_3904)
    {
        bool _3908 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3910 = isnan(_3658);
        bool _3912 = _3908 || _3910;
        bool _3914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3916 = _3912 || _3914;
        if (!_3916)
        {
            float _3918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3920 = _3658 + _3918;
            float _3922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3922;
            float _3926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3930 = 1.0 / _3924;
            float _3932 = _3920 * _3930;
            float _3934 = fma(_3932, _3928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3906 = _3934;
            _3936 = true;
        }
        else
        {
            bool _3938 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3940 = isnan(_3658);
            bool _3942 = _3938 || _3940;
            bool _3944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3946 = _3942 || _3944;
            if (!_3946)
            {
                float _3948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3950 = _3658 + _3948;
                float _3952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3954 = _3952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3958 = _3956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3960 = 1.0 / _3954;
                float _3962 = _3950 * _3960;
                float _3964 = fma(_3962, _3958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3906 = _3964;
                _3936 = true;
            }
            else
            {
                _3906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3936 = false;
    float _3966 = _3906;
    float _3968 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3970 = _3518 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3974 = _3522 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3978 = _3578 + _3976;
    float _3980 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3982 = fma(_3970, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3984 = fma(_3974, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3986 = fma(_3978, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3988 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3980);
    float _3990 = -_3884;
    float _3992 = _3990 + _3982;
    float _3994 = -_3888;
    float _3996 = _3994 + _3984;
    float _3998 = -_3892;
    float _4000 = _3998 + _3986;
    float _4002 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3988);
    float _4004 = _3992 * _3992;
    float _4006 = _4002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4008 = fma(_3996, _3996, _4004);
    float _4010 = 1.0 / _4006;
    float _4012 = fma(_4000, _4000, _4008);
    float _4014 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4020 = _4016 || _4018;
    bool _4022 = isnan(0.5);
    bool _4024 = _4020 || _4022;
    float _4026 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4014);
    float _4028 = sqrt(_4012);
    float _4030 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4026);
    float _4032 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4034 = _4032 + _4006;
    float _4036 = _4034 * _4010;
    float _4038 = _4036 * 0.5;
    bool _4040 = _4028 > 0.0;
    bool _4042 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan(0.5);
    bool _4050 = _4046 || _4048;
    float _4052 = _4010;
    float _4054 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4056 = _4006;
    float _4058 = _4034;
    if (!_4040)
    {
        _4052 = _3984;
    }
    float _4060 = _4052;
    float _4062 = _4060;
    if (!_4040)
    {
        _4054 = _3982;
    }
    float _4064 = _4054;
    float _4066 = _4064;
    float _4068 = _4064;
    if (!_4040)
    {
        _4056 = _3986;
    }
    float _4070 = _4056;
    bool _4072 = !_4040;
    float _4074 = _4070;
    float _4076 = _4070;
    if (!_4072)
    {
        float _4078 = _239 * _239;
        float _4080 = rsqrt(_4012);
        float _4082 = fma(_235, _235, _4078);
        float _4084 = fma(_241, _241, _4082);
        float _4086 = sqrt(_4084);
        float _4088 = _3996 * _4080;
        float _4090 = _3992 * _4080;
        float _4092 = _4000 * _4080;
        bool _4094 = _4086 > 0.0;
        float _4096 = _4086;
        _3338 = _4088;
        _4058 = _4080;
        if (!_4094)
        {
            _4096 = _3984;
        }
        float _4098 = _4096;
        _4062 = _4098;
        if (!_4094)
        {
            _4066 = _3982;
        }
        float _4100 = _4066;
        _4068 = _4100;
        if (!_4094)
        {
            _4074 = _3986;
        }
        float _4102 = _4074;
        bool _4104 = !_4094;
        _4076 = _4102;
        if (!_4104)
        {
            float _4106 = rsqrt(_4084);
            float _4108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4110 = _239 * _4106;
            float _4112 = _235 * _4106;
            float _4114 = _4090 * _4110;
            float _4116 = _241 * _4106;
            float _4118 = fma(_4088, _4112, _4114);
            float _4120 = _4108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4122 = fma(_4092, _4116, _4118);
            float _4124 = _4122 * _4120;
            float _4126 = fma(_235, _4124, _3984);
            float _4128 = fma(_239, _4124, _3982);
            float _4130 = fma(_241, _4124, _3986);
            _4062 = _4126;
            _4068 = _4128;
            _4076 = _4130;
            _4058 = _4122;
        }
    }
    float _4132 = _4062;
    float _4134 = _4068;
    float _4136 = _4076;
    float _4138 = _3338;
    float _4140 = _4058;
    float _4142 = _4140;
    float _4144 = _4134;
    float _4146 = _4132;
    float _4148 = _4136;
    float _4150 = _4138;
    if (_4050)
    {
        _4142 = 1.0;
    }
    float _4152 = _4142;
    float _4154 = _4152;
    if (!_4024)
    {
        float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4158 = _3884 + _4156;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4162 = _3888 + _4160;
        float _4164 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4166 = _4158 * _4158;
        float _4168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4170 = _3892 + _4168;
        float _4172 = fma(_4162, _4162, _4166);
        float _4174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4176 = fma(_4170, _4170, _4172);
        float _4178 = sqrt(_4176);
        float _4180 = _4164 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4182 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4184 = _4182 * _4174;
        float _4186 = -_3888;
        float _4188 = _4186 + _4132;
        float _4190 = _4180 * _4184;
        float _4192 = -_3884;
        float _4194 = _4192 + _4134;
        float _4196 = -_3892;
        float _4198 = _4196 + _4136;
        float _4200 = fma(_4188, _4190, _3888);
        float _4202 = fma(_4194, _4190, _3884);
        float _4204 = fma(_4198, _4190, _3892);
        _4144 = _4202;
        _4146 = _4200;
        _4148 = _4204;
    }
    float _4206 = _4144;
    float _4208 = _4146;
    float _4210 = _4148;
    if (!_4050)
    {
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4216 = fma(_4038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4214);
        float _4218 = _4212 * 0.15915493667125701904296875;
        float _4220 = _4218 * 6.283185482025146484375;
        float _4222 = cos(_4220);
        float _4224 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4226 = _4224 * 0.15915493667125701904296875;
        float _4228 = _4218 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = 1.0 / _4222;
        float _4234 = _4226 * 6.283185482025146484375;
        float _4236 = cos(_4234);
        float _4238 = _4230 * _4232;
        float _4240 = 1.0 / _4216;
        float _4242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4242;
        float _4246 = _4236 * _4238;
        float _4248 = _4226 * 6.283185482025146484375;
        float _4250 = sin(_4248);
        float _4252 = 1.0 / _4246;
        float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4256 = _4240 * _4254;
        float _4258 = 1.0 / _4244;
        float _4260 = _4250 * _4252;
        float _4262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4264 = fma(_4260, _4256, _4262);
        float _4266 = _4264 * _4258;
        float _4268 = precise::clamp(_4266, 0.0, 1.0);
        _4154 = _4268;
    }
    float _4270 = _4154;
    float _4272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4274 = _4206 + _4272;
    float _4276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4278 = _4208 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4282 = _4210 + _4280;
    float _4284 = _4274 * _4274;
    float _4286 = fma(_4278, _4278, _4284);
    float _4288 = fma(_4282, _4282, _4286);
    float _4290 = rsqrt(_4288);
    float _4292 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4294 = _4278 * _4292;
    float _4296 = _4282 * _4292;
    float _4298 = _4294 * _4294;
    float _4300 = _4296 * _4296;
    float _4302 = _4298 + _4300;
    float _4304 = sqrt(_4302);
    bool _4306 = _4304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4310 = _4304 + _4308;
    float _4312 = _4282;
    float _4314 = _4302;
    float _4316 = _4310;
    float _4318 = _4274;
    if (_4306)
    {
        float _4320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4312 = _4320;
    }
    float _4322 = _4312;
    if (_4306)
    {
        float _4324 = rsqrt(_4302);
        _4314 = _4324;
    }
    float _4326 = _4314;
    float _4328 = _4326;
    if (_4306)
    {
        float _4330 = _4310 * _4322;
        _4316 = _4330;
    }
    float _4332 = _4316;
    if (_4306)
    {
        float _4334 = _4332 * 0.15915493667125701904296875;
        _4150 = _4334;
    }
    float _4336 = _4150;
    float _4338 = _4290;
    float _4340 = _4336;
    if (_4306)
    {
        float _4342 = _4336 * 6.283185482025146484375;
        float _4344 = sin(_4342);
        _4338 = _4344;
    }
    float _4346 = _4338;
    float _4348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4350 = precise::max(0.0, _4348);
    float _4352 = _4284;
    float _4354 = _4350;
    float _4356 = _4348;
    if (_4306)
    {
        float _4358 = _4336 * 6.283185482025146484375;
        float _4360 = cos(_4358);
        _4352 = _4360;
    }
    float _4362 = _4352;
    float _4364 = -_4292;
    float _4366 = -_4350;
    float _4368 = fma(_4274, _4364, _4366);
    if (!_4306)
    {
        _4318 = _4296;
    }
    float _4370 = _4318;
    float _4372 = _4370;
    if (_4306)
    {
        float _4374 = _4368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4354 = _4374;
    }
    float _4376 = _4354;
    float _4378 = _4376;
    float _4380 = _4346;
    if (_4306)
    {
        float _4382 = fma(_4346, _4376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4378 = _4382;
    }
    float _4384 = _4378;
    float _4386 = _4384;
    if (!_4306)
    {
        _4380 = _4294;
    }
    float _4388 = _4380;
    float _4390 = _4388;
    float _4392 = _4362;
    if (_4306)
    {
        float _4394 = _4362 + (-1.0);
        _4356 = _4394;
    }
    float _4396 = _4356;
    if (_4306)
    {
        float _4398 = _4326 * _4384;
        _3340 = _4398;
    }
    float _4400 = _3340;
    if (!_4306)
    {
        _4386 = _4368;
    }
    float _4402 = _4386;
    float _4404 = _4402;
    if (_4306)
    {
        float _4406 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4406;
    }
    float _4408 = _4340;
    if (_4306)
    {
        float _4410 = _4294 * _4400;
        _4390 = _4410;
    }
    float _4412 = _4390;
    if (!_4306)
    {
        _4328 = _4298;
    }
    float _4414 = _4328;
    float _4416 = _4414;
    if (_4306)
    {
        float _4418 = _4296 * _4400;
        _4372 = _4418;
    }
    float _4420 = _4372;
    if (_4306)
    {
        float _4422 = fma(_4368, _4362, _4408);
        _4404 = _4422;
    }
    float _4424 = _4404;
    if (_4306)
    {
        float _4426 = _4412 * _4412;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (!_4306)
    {
        _4392 = _4300;
    }
    float _4430 = _4392;
    float _4432 = _4430;
    if (_4306)
    {
        float _4434 = _4420 * _4420;
        _4432 = _4434;
    }
    float _4436 = _4432;
    float _4438 = sqrt(_4288);
    float _4440 = fma(_4424, _4424, _4428);
    float _4442 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4444 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4446 = _4440 + _4436;
    float _4448 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4442);
    float _4450 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4452 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4444);
    float _4454 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4448);
    float _4456 = rsqrt(_4446);
    float _4458 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4460 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4450);
    float _4462 = _4454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4464 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4468 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4466);
    float _4470 = precise::clamp(_4468, 0.0, 1.0);
    float _4472 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4458);
    float _4474 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4460);
    float _4476 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4478 = -_4470;
    float _4480 = _4478 + 1.0;
    float _4482 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4472);
    float _4484 = _4474 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4486 = -_4476;
    float _4488 = fma(_4486, _4464, 1.0);
    float _4490 = abs(_4480);
    float _4492 = log2(_4490);
    float _4494 = _4482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4496 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4498 = _4456 * _4412;
    float _4500 = _4456 * _4424;
    float _4502 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4452);
    float _4504 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4496);
    float _4506 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4508 = _4456 * _4420;
    float _4510 = _4502 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4512 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4504);
    float _4514 = -_4506;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4514);
    float _4518 = log2(_4488);
    float _4520 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4522 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4512);
    float _4524 = -_4508;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4516);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4530 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4532 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4520);
    float _4534 = fma(_4526, -0.5, 0.5);
    float _4536 = 1.0 / _4522;
    float _4538 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4530);
    float _4540 = fma(_4526, 0.5, 0.5);
    float _4542 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4544 = _4500 + 1.0;
    float _4546 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4538);
    float _4548 = fma(_4540, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4550 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4542);
    float _4552 = exp2(_4528);
    float _4554 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4546);
    float _4556 = fma(_4540, _4548, -0.212114393711090087890625);
    float _4558 = _4518 * 0.693147182464599609375;
    float _4560 = fma(_4540, _4556, 1.570728778839111328125);
    float _4562 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4564 = sqrt(_4534);
    float _4566 = _4554 * _4536;
    float _4568 = _4550 * _4536;
    float _4570 = fma(_4566, 0.5, 0.5);
    float _4572 = fma(_4568, -0.5, 0.5);
    float _4574 = -_4500;
    float _4576 = fma(_4552, _4544, _4574);
    float3 _11660 = float3(_4570, _4572, _4562);
    float _4578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11660, float3(0.0), isnan(_11660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11660, float3(0.0), isnan(_11660)), level(0.0)).x;
    float3 _11671 = float3(_4570, _4572, _4562);
    float4 _4581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11671, float3(0.0), isnan(_11671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11671, float3(0.0), isnan(_11671)), level(0.0)).xyzw;
    float _4583 = _4581.x;
    float _4585 = _4581.y;
    float _4587 = _4581.z;
    float _4589 = _4581.w;
    float _4591 = fma(_4576, 0.5, 0.5);
    float _4593 = _4564 * 0.636619746685028076171875;
    float _4595 = -_4560;
    float _4597 = fma(_4593, _4595, 1.0);
    float2 _11698 = float2(_4597, _4591);
    float3 _4601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11698, float2(0.0), isnan(_11698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11698, float2(0.0), isnan(_11698)), level(0.0)).xyz;
    float _4603 = _4601.x;
    float _4605 = _4601.y;
    float _4607 = _4601.z;
    float _4609 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4611 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4613 = _4522 * 0.5;
    float _4615 = _4554 + _4522;
    out.m_96.x = _4208;
    out.m_96.y = _4206;
    out.m_96.z = _4210;
    float _4617 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4611);
    float _4619 = exp2(_4609);
    bool _4621 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4623 = isnan(_4438);
    bool _4625 = _4621 || _4623;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4629 = _4625 || _4627;
    float _4631 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4617);
    float _4633 = fma(_4550, -0.5, _4613);
    out.m_98.x = _3888;
    out.m_98.y = _3884;
    out.m_98.z = _3892;
    float _4635 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4631);
    float _4637 = _4635 + _4522;
    float _4639 = _4615 * 0.5;
    out.gl_Position.x = _4554;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4635;
    out.gl_Position.w = _4522;
    float _4641 = _4615;
    float _4643 = _4550;
    float _4645 = _4554;
    if (!_4629)
    {
        _4641 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4647 = _4641;
    float _4649 = _4637 * 0.5;
    float _4651 = -_4619;
    float _4653 = _4651 + 1.0;
    float _4655 = _4647;
    float _4657 = _4647;
    if (!_4629)
    {
        _3896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4659 = _3896;
    float _4661 = _4659;
    float _4663 = _4659;
    if (!_4629)
    {
        _3898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4665 = _3898;
    float _4667 = _4653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_100.x = _4639;
    out.m_100.y = _4633;
    out.m_100.z = _4649;
    out.m_100.w = _4522;
    float _4669 = _4665;
    float _4671 = _4665;
    if (!_4629)
    {
        _3900 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4673 = _3900;
    float _4675 = -_4667;
    float _4677 = _4675 + 1.0;
    float _4679 = _4270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4681 = _4673;
    float _4683 = _4673;
    if (!_4629)
    {
        _4643 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4685 = _4643;
    float _4687 = _4685;
    float _4689 = _4685;
    if (!_4629)
    {
        _4645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4691 = _4645;
    float _4693 = _4667 * _4578;
    float _4695 = _4589 * _4677;
    float _4697 = _4589 * _4693;
    float _4699 = _4607 * _4693;
    float _4701 = fma(_4603, _4697, _4583);
    float _4703 = fma(_4605, _4697, _4585);
    float _4705 = fma(_4589, _4699, _4587);
    out.m_102.x = _4701;
    out.m_102.y = _4703;
    out.m_102.z = _4705;
    out.m_102.w = _4695;
    bool _4707 = !_4629;
    float _4709 = _4691;
    float _4711 = _4691;
    if (!_4707)
    {
        bool _4713 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4715 = isnan(_4438);
        bool _4717 = _4713 || _4715;
        bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4721 = _4717 || _4719;
        if (!_4721)
        {
            float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4725 = _4438 + _4723;
            float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4729 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4727;
            float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4735 = 1.0 / _4729;
            float _4737 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4739 = _4737 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4753 = _4725 * _4735;
            float _4755 = precise::clamp(_4753, 0.0, 1.0);
            float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4761 = fma(_4755, _4733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4763 = fma(_4755, _4759, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4765 = fma(_4755, _4739, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4767 = fma(_4755, _4743, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4769 = fma(_4755, _4747, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4771 = fma(_4755, _4751, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4711 = _4765;
            _4671 = _4769;
            _4689 = _4761;
            _4663 = _4767;
            _4657 = _4763;
            _4683 = _4771;
            _4773 = true;
        }
        else
        {
            bool _4775 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4777 = isnan(_4438);
            bool _4779 = _4775 || _4777;
            bool _4781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4783 = _4779 || _4781;
            if (!_4783)
            {
                _4687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4785 = _4687;
            _4689 = _4785;
            if (!_4783)
            {
                _4709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4787 = _4709;
            _4711 = _4787;
            if (!_4783)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4789 = _4655;
            _4657 = _4789;
            if (!_4783)
            {
                _4661 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4791 = _4661;
            _4663 = _4791;
            if (!_4783)
            {
                _4669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4793 = _4669;
            _4671 = _4793;
            if (!_4783)
            {
                _4681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4795 = _4681;
            bool _4797 = !_4783;
            _4683 = _4795;
            if (!_4797)
            {
                bool _4799 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4801 = isnan(_4438);
                bool _4803 = _4799 || _4801;
                bool _4805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4807 = _4803 || _4805;
                if (!_4807)
                {
                    float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4811 = _4438 + _4809;
                    float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4815 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4813;
                    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4821 = 1.0 / _4815;
                    float _4823 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4825 = _4823 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4829 = _4827 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4833 = _4831 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4839 = _4811 * _4821;
                    float _4841 = precise::clamp(_4839, 0.0, 1.0);
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4847 = fma(_4841, _4819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4849 = fma(_4841, _4845, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4851 = fma(_4841, _4825, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4853 = fma(_4841, _4829, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4855 = fma(_4841, _4833, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4857 = fma(_4841, _4837, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4711 = _4851;
                    _4671 = _4855;
                    _4689 = _4847;
                    _4663 = _4853;
                    _4657 = _4849;
                    _4683 = _4857;
                    _4773 = true;
                }
                else
                {
                    _4711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4663 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4773 = false;
    float _4859 = _4711;
    float _4861 = _4671;
    float _4863 = _4689;
    float _4865 = _4663;
    float _4867 = _4657;
    float _4869 = _4683;
    float _4871 = _4679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4873 = fma(_3868, -0.5, 0.5);
    float _4875 = precise::clamp(_4873, 0.0, 1.0);
    float _4877 = -_4859;
    float _4879 = _4877 + _4861;
    float _4881 = -_4863;
    float _4883 = _4881 + _4865;
    out.m_104.x = 0.0;
    float _4885 = fma(_4875, _4879, _4859);
    float _4887 = -_4867;
    float _4889 = _4887 + _4869;
    float _4891 = fma(_4875, _4883, _4863);
    float _4893 = _4885 * 0.586610972881317138671875;
    bool _4895 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4897 = fma(_4875, _4889, _4867);
    out.m_53.x = _4871;
    float _4899 = fma(_4891, 0.298911988735198974609375, _4893);
    bool _4901 = _4270 > 0.0;
    bool _4903 = isnan(_4270);
    bool _4905 = _4901 || _4903;
    bool _4907 = isnan(0.0);
    bool _4909 = _4905 || _4907;
    float _4911 = fma(_4897, 0.114477999508380889892578125, _4899);
    float _4913 = -_4911;
    float _4915 = _4891 + _4913;
    float _4917 = -_4911;
    float _4919 = _4885 + _4917;
    float _4921 = -_4911;
    float _4923 = _4897 + _4921;
    float _4925 = fma(_4915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4927 = fma(_4919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4929 = fma(_4923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    bool _4931 = !_4895;
    if (!_4931)
    {
        float _4933 = -_4206;
        float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4937 = -_4208;
        float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4941 = -_4210;
        float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4945 = _4935 * _4935;
        float _4947 = fma(_4939, _4939, _4945);
        float _4949 = fma(_4943, _4943, _4947);
        float _4951 = sqrt(_4949);
        float _4953 = rsqrt(_4949);
        float _4955 = -_4951;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4959 = _4957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4961 = precise::clamp(_4959, 0.0, 1.0);
        float _4963 = _4939 * _4953;
        float _4965 = _4935 * _4953;
        float _4967 = abs(_4961);
        float _4969 = log2(_4967);
        float _4971 = _4943 * _4953;
        float _4973 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4975 = _3868 * _4965;
        float _4977 = -_4965;
        float _4979 = -_4973;
        float _4981 = fma(_4977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4979);
        float _4983 = fma(_3852, _4963, _4975);
        float _4985 = -_4971;
        float _4987 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4981);
        float _4989 = fma(_3870, _4971, _4983);
        float _4991 = precise::clamp(_4989, 0.0, 1.0);
        float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4995 = _4987 + _4993;
        float _4997 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4999 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5001 = precise::clamp(_4999, 0.0, 1.0);
        float _5003 = exp2(_4997);
        float _5005 = _5003 * _5001;
        float _5007 = _4991 * _5005;
        float _5009 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5011 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5013 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5009;
        out.m_104.y = _5011;
        out.m_104.z = _5013;
    }
    out.m_80.x = _4925;
    out.m_80.y = _4927;
    out.m_80.z = _4929;
    if (_4909)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _5015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5015;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4773 = false;
    bool _3936 = false;
    bool _561 = false;
    bool _463 = false;
    bool _263 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_46.w;
    float _120 = in.m_48.w;
    float _122 = trunc(_118);
    int _125 = int(_122);
    float _127 = -_120;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _129;
    bool _133 = _125 >= 1;
    float _135 = 0.0;
    float _137 = as_type<float>(_125);
    float _139 = _129;
    if (!_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _135;
    if (!_133)
    {
        out.m_53.x = 0.0;
    }
    int _143 = 0;
    if (!_133)
    {
        float _145 = _141 * 5.0;
        _143 = as_type<int>(_145);
    }
    int _147 = _143;
    int _149 = _147;
    if (!_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5084 = as_type<float>(_147);
        out.gl_Position.z = _5084;
    }
    if (!_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _151 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = isnan(_120);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _159 = _155 || _157;
    float _161 = float(_125);
    bool _163 = _129 >= _161;
    bool _165 = !_159;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _137;
    if (_167)
    {
        out.m_53.x = 0.0;
    }
    float _173 = _129 * _169;
    float _175 = _173;
    if (_167)
    {
        float _177 = _171 * 5.0;
        _149 = as_type<int>(_177);
    }
    int _179 = _149;
    out.m_51.x = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_179);
        out.gl_Position.z = _5147;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    float _183 = in.m_58.x;
    float _185 = in.m_58.y;
    float _187 = in.m_58.z;
    float _189 = in.m_60.x;
    float _191 = in.m_60.y;
    float _193 = in.m_60.z;
    float _195 = in.m_62.x;
    float _197 = in.m_62.y;
    float _199 = in.m_62.z;
    float _201 = in.m_64.x;
    float _203 = in.m_64.y;
    float _205 = in.m_64.z;
    int _207 = as_type<int>(_181) & 1;
    bool _209 = _207 != 0;
    int _211 = as_type<int>(_181) & 2;
    bool _213 = _211 != 0;
    bool _215 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _217 = !_209;
    float _219 = _217 ? (-0.5) : 0.5;
    bool _221 = !_213;
    float _223 = _221 ? (-0.5) : 0.5;
    float _225 = _185 * _191;
    float _227 = _185 * _197;
    float _229 = fma(_183, _189, _225);
    float _231 = _185 * _203;
    float _233 = fma(_183, _195, _227);
    float _235 = fma(_187, _193, _229);
    float _237 = fma(_183, _201, _231);
    float _239 = fma(_187, _199, _233);
    float _241 = fma(_187, _205, _237);
    bool _243 = !_215;
    float _261;
    if (!_243)
    {
        float _245 = in.m_66.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        _261 = _173;
    }
    _263 = false;
    float _265 = _261;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = _265 + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _281 = _279 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _283;
    float _287 = in.m_68.x;
    float _289 = in.m_68.y;
    float _291 = 1.0 / _281;
    bool _293 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _295 = 1.0 / _277;
    bool _297 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _299 = isnan(_265);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    float _309 = 1.0 / _285;
    float _311 = _269 * _295;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _265 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _317;
    float _321 = _315 * _291;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = _273 * _309;
    float _341 = fma(_319, _311, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _343 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _345 = isnan(_265);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _361 = -_307;
    float _363 = _361 + 1.0;
    float _365 = _307 * _357;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _369 = _367 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _371 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _373 = isnan(_265);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = _353 * _363;
    float _385 = -_353;
    float _387 = _385 + 1.0;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _391 = _389 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = fma(_369, _321, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _395 = _381 * _387;
    float _397 = -_381;
    float _399 = _397 + 1.0;
    float _401 = fma(_391, _321, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _403 = _341 * _395;
    float _405 = _359 * _395;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _411;
    float _415 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].x, _403);
    float _417 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[143].y, _405);
    float _419 = fma(_409, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _421 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _423 = fma(_401, _383, _415);
    float _425 = fma(_393, _383, _417);
    float _427 = fma(_419, _365, _423);
    float _429 = fma(_421, _365, _425);
    float _431 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].x, _427);
    float _433 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[146].y, _429);
    float _435 = _431 * _287;
    float _437 = _433 * _289;
    bool _439 = !_293;
    float _441 = _287;
    float _443 = _321;
    float _461;
    if (!_439)
    {
        float _445 = in.m_66.x;
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _449 = _445 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        _461 = _173;
    }
    _463 = false;
    float _465 = _461;
    bool _467 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_465);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _465 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_465);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _465 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    float _507 = 1.0 / _481;
    bool _509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _497 * _507;
    float _519 = fma(_517, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _521 = _519 * _511;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _521);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _531 = _523 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _533 = _525 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_70.x = _531;
    out.m_70.y = _533;
    out.m_70.z = _537;
    out.m_70.w = _539;
    bool _541 = !_509;
    float _559;
    if (!_541)
    {
        float _543 = in.m_66.x;
        float _545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _547 = _543 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _549 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _551 = _549 * _545;
        float _553 = floor(_551);
        float _555 = -_553;
        float _557 = _551 + _555;
        _559 = _557;
        _561 = true;
    }
    else
    {
        _559 = _173;
    }
    _561 = false;
    float _563 = _559;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _567 = _563 + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _573 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _575 = isnan(_563);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _589 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _591 = isnan(_563);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _601;
    bool _605 = _563 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _607 = isnan(_563);
    bool _609 = _605 || _607;
    bool _611 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _613 = _609 || _611;
    float _615 = float(_613);
    float _617 = 1.0 / _571;
    float _619 = -_583;
    float _621 = _619 + 1.0;
    bool _623 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _625 = 1.0 / _587;
    float _627 = _603 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _633 = -_615;
    float _635 = _633 + 1.0;
    float _637 = fma(_627, _567, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _639 = _599 * _621;
    float _641 = -_599;
    float _643 = _641 + 1.0;
    float _645 = _583 * _635;
    float _647 = _631 * _625;
    float _649 = _637 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _653 = _563 + _651;
    float _655 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[131].x, _649);
    float _657 = fma(_647, _653, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _661 = fma(_657, _645, _655);
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _665 = _659 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _669 = fma(_615, (*spvDescriptorSet0.vp_c9)._m0[133].x, _661);
    float _671 = _663 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _673 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _675 = _669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_72.x = _665;
    out.m_72.y = _671;
    out.m_72.z = _673;
    out.m_72.w = _675;
    bool _677 = !_623;
    float _679 = _671;
    if (!_677)
    {
        float _681 = in.m_66.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[14].x, _129);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _175 = _695;
    }
    float _697 = _175;
    float _699 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _701 = int(_699);
    float _703 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _705 = int(_703);
    float _707 = float(_701);
    float _709 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _711 = int(_709);
    float _713 = float(uint(_705));
    float _715 = 1.0 / _707;
    int _717 = ~_705;
    int _719 = _717 + 1;
    int _721 = ~_705;
    int _723 = _721 + 1;
    float _725 = 1.0 / _713;
    float _727 = float(uint(_711));
    float _729 = _715 * _129;
    float _731 = 1.0 / _727;
    int _733 = as_type<int>(_725) + (-2);
    float _735 = trunc(_729);
    int _737 = int(_735);
    float _739 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _741 = int(_739);
    float _743 = float(uint(_737));
    float _745 = as_type<float>(_733) * _743;
    float _747 = float(_741);
    float _749 = trunc(_745);
    float _751 = precise::max(_749, 0.0);
    uint _754 = uint(_751);
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = 1.0 / _747;
    float _762 = _707;
    float _764 = as_type<float>(_741);
    float _766 = _747;
    if (_758)
    {
        float _768 = in.m_66.x;
        float _770 = in.m_66.y;
        _762 = _768;
        _764 = _770;
    }
    float _772 = _762;
    float _774 = _764;
    float _776 = 0.0;
    if (_758)
    {
        _776 = 1.0;
    }
    float _778 = _776;
    int _780 = _719 * int(_754);
    int _782 = _780 + _737;
    float _784 = _778;
    if (_758)
    {
        _679 = 1.0;
    }
    float _786 = _679;
    int _788 = 0;
    float _790 = _786;
    if (_758)
    {
        _788 = 0;
    }
    int _792 = _788;
    float _794 = _760 * _129;
    float _796 = float(uint(_782));
    float _798 = as_type<float>(_733) * _796;
    float _800 = trunc(_794);
    int _802 = int(_800);
    float _804 = 0.0;
    float _806 = _772;
    float _808 = _774;
    int _810 = _792;
    if (_758)
    {
        _804 = _772;
    }
    float _812 = _804;
    float _814 = trunc(_798);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    float _820 = _812;
    if (_758)
    {
        _441 = _774;
    }
    float _822 = _441;
    float _824 = _822;
    if (_758)
    {
        _443 = _812;
    }
    float _826 = _443;
    float _828 = _826;
    if (_758)
    {
        _766 = _812;
    }
    float _830 = _766;
    float _832 = _830;
    if (!_758)
    {
        float _834 = in.m_66.x;
        float _836 = in.m_66.y;
        float _838 = in.m_66.z;
        float _840 = _834 * 3.1415927410125732421875;
        float _842 = _840 * 0.15915493667125701904296875;
        float _844 = _836 * 3.1415927410125732421875;
        float _846 = _844 * 0.15915493667125701904296875;
        float _848 = _842 * 6.283185482025146484375;
        float _850 = sin(_848);
        float _852 = _846 * 6.283185482025146484375;
        float _854 = sin(_852);
        _784 = 7.345489978790283203125;
        _806 = _834;
        _790 = 5.839270114898681640625;
        _832 = _838;
        _820 = _836;
        _808 = _836;
        _824 = _854;
        _828 = _850;
        _810 = 2;
    }
    float _856 = _784;
    float _858 = _806;
    float _860 = _790;
    float _862 = _832;
    float _864 = _820;
    float _866 = _808;
    float _868 = _824;
    float _870 = _828;
    int _872 = _810;
    float _874 = in.m_66.z;
    int _876 = int(_754) + int(_818);
    float _878 = _856 * _858;
    float _880 = _860 * _862;
    int _882 = as_type<int>(_731) + (-2);
    float _884 = floor(_878);
    float _886 = float(uint(_802));
    int _888 = _723 * _876;
    int _890 = _888 + _737;
    float _892 = float(_737);
    float _894 = _856 * _864;
    float _896 = as_type<float>(_882) * _886;
    bool _898 = uint(_890) >= uint(_705);
    float _900 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _902 = log2(_900);
    float _904 = float(_705);
    float _906 = _435 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _908 = !_898;
    int _910 = _908 ? 0 : (-1);
    float _912 = _437 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _914 = _892 >= _904;
    bool _916 = isnan(_892);
    bool _918 = _914 || _916;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    bool _926 = _705 == 0;
    float _928 = trunc(_896);
    float _930 = precise::max(_928, 0.0);
    uint _932 = uint(_930);
    int _934 = ~_711;
    int _936 = _934 + 1;
    float _938 = -_884;
    float _940 = _878 + _938;
    bool _942 = _874 > 0.5;
    int _944 = ~_876;
    int _946 = _944 + _910;
    int _948 = _946 + 1;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _956 = _954 != 0;
    float _958 = trunc(_924);
    int _960 = int(_958);
    bool _962 = _866 > 0.5;
    float _964 = _940 * _904;
    float _966 = -_223;
    int _968 = _942 ? as_type<int>(_966) : as_type<int>(_223);
    float _970 = _169 * _129;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _974 = _972 != 0;
    int _976 = _936 * int(_932);
    int _978 = _976 + _802;
    float _980 = -_219;
    int _982 = _962 ? as_type<int>(_980) : as_type<int>(_219);
    float _984 = trunc(_964);
    int _986 = int(_984);
    float _988 = _904 * _970;
    float _990 = float(uint(_978));
    bool _992 = !_956;
    float _994 = _992 ? _223 : as_type<float>(_968);
    int _996 = _705 * _948;
    int _998 = _996 + _737;
    bool _1000 = !_952;
    float _1002 = _1000 ? _219 : as_type<float>(_982);
    float _1004 = as_type<float>(_882) * _990;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1016 = _1014 != 0;
    float _1018 = trunc(_988);
    int _1020 = int(_1018);
    bool _1022 = !_974;
    int _1024 = _1022 ? 0 : 1;
    int _1026 = ~_960;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    bool _1036 = !_926;
    int _1038 = _1036 ? _998 : (-1);
    float _1040 = trunc(_1004);
    float _1042 = precise::max(_1040, 0.0);
    uint _1044 = uint(_1042);
    int _1046 = abs(_1024);
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1050 = _1048 != 0;
    int _1052 = _1038 * _1030;
    int _1054 = _705 + (-1);
    bool _1056 = !_1050;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1034);
    int _1062 = _960 * _1054;
    int _1064 = _1062 + _1052;
    float _1066 = floor(_880);
    float _1068 = float(_711);
    int _1070 = _1064 * _1060;
    float _1072 = float(_802);
    int _1074 = _986 * _1046;
    int _1076 = _1074 + _737;
    bool _1078 = !_1008;
    int _1080 = _1078 ? 0 : 1;
    int _1082 = int(_932) + int(_1044);
    int _1084 = abs(_1080);
    bool _1086 = !_1016;
    int _1088 = _1086 ? 0 : 1;
    int _1090 = ~_711;
    int _1092 = _1090 + 1;
    int _1094 = _1020 * _1084;
    int _1096 = _1094 + _1070;
    int _1098 = abs(_1088);
    float _1100 = -_1066;
    float _1102 = _880 + _1100;
    int _1104 = abs(_1058);
    int _1106 = _1092 * _1082;
    int _1108 = _1106 + _802;
    float _1110 = _1102 * _1068;
    bool _1112 = _1072 >= _1068;
    bool _1114 = isnan(_1072);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_1068);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = _1068 * _970;
    int _1126 = _1076 * _1098;
    int _1128 = _1126 + _1096;
    bool _1130 = uint(_1108) >= uint(_711);
    float _1132 = trunc(_1110);
    int _1134 = int(_1132);
    bool _1136 = _711 == 0;
    int _1138 = _986 * _1104;
    int _1140 = _1138 + _1128;
    bool _1142 = !_1130;
    int _1144 = _1142 ? 0 : (-1);
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1148 = _1146 != 0;
    int _1150 = ~_1082;
    int _1152 = _1150 + _1144;
    int _1154 = _1152 + 1;
    float _1156 = trunc(_1122);
    int _1158 = int(_1156);
    bool _1160 = !_1148;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = float(uint(_1140));
    int _1166 = abs(_1162);
    int _1168 = _711 * _1154;
    int _1170 = _1168 + _802;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1174 = _1172 != 0;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1178 = _1176 != 0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1182 = _1180 != 0;
    float _1184 = as_type<float>(_733) * _1164;
    float _1186 = trunc(_1124);
    int _1188 = int(_1186);
    bool _1190 = !_1136;
    int _1192 = _1190 ? _1170 : (-1);
    int _1194 = ~_705;
    int _1196 = _1194 + 1;
    int _1198 = _1134 * _1166;
    int _1200 = _1198 + _802;
    int _1202 = _711 + (-1);
    int _1204 = ~_1158;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = trunc(_1184);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1222 = _1220 != 0;
    int _1224 = _1192 * _1208;
    bool _1226 = !_1178;
    int _1228 = _1226 ? 0 : 1;
    bool _1230 = !_1174;
    int _1232 = _1230 ? 0 : 1;
    int _1234 = _1158 * _1202;
    int _1236 = _1234 + _1224;
    int _1238 = abs(_1228);
    int _1240 = abs(_1232);
    float _1242 = in.m_66.w;
    int _1244 = _1196 * int(_1214);
    int _1246 = _1244 + _1140;
    bool _1248 = !_1182;
    int _1250 = _1248 ? 0 : 1;
    bool _1252 = _705 == 0;
    int _1254 = _1236 * _1238;
    int _1256 = abs(_1250);
    float _1258 = float(uint(_1246));
    int _1260 = _1188 * _1240;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1218;
    int _1266 = _1264 ? 0 : 1;
    float _1268 = as_type<float>(_733) * _1258;
    int _1270 = abs(_1266);
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1274 = _1272 != 0;
    int _1276 = _1200 * _1256;
    int _1278 = _1276 + _1262;
    float _1280 = trunc(_1268);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = 0.0;
    if (!_1222)
    {
        _1286 = _219;
    }
    float _1288 = _1286;
    int _1290 = _1134 * _1270;
    int _1292 = _1290 + _1278;
    int _1294 = ~_705;
    int _1296 = _1294 + 1;
    float _1298 = -_223;
    int _1300 = _962 ? as_type<int>(_1298) : as_type<int>(_223);
    float _1302 = float(uint(_1292));
    float _1304 = 0.0;
    float _1306 = _1302;
    float _1308 = _1288;
    if (!_1274)
    {
        _1304 = _223;
    }
    float _1310 = _1304;
    float _1312 = as_type<float>(_882) * _1302;
    float _1314 = _1310;
    if (_1222)
    {
        float _1316 = _1242 * 3.1415927410125732421875;
        _1306 = _1316;
    }
    float _1318 = _1306;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1322 = trunc(_1312);
    float _1324 = precise::max(_1322, 0.0);
    uint _1326 = uint(_1324);
    int _1328 = int(_1214) + int(_1284);
    float _1330 = _1318;
    if (_1222)
    {
        float _1332 = _1318 * 0.15915493667125701904296875;
        _1330 = _1332;
    }
    float _1334 = _1330;
    int _1336 = ~_711;
    int _1338 = _1336 + 1;
    float _1340 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1342 = _1296 * _1328;
    int _1344 = _1342 + _1140;
    float _1346 = _1334;
    if (_1222)
    {
        float _1348 = _1334 * 6.283185482025146484375;
        float _1350 = sin(_1348);
        _1346 = _1350;
    }
    float _1352 = _1346;
    float _1354 = float(uint(_1200));
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    bool _1358 = uint(_1344) >= uint(_705);
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1362 = as_type<float>(_882) * _1354;
    bool _1364 = !_1358;
    int _1366 = _1364 ? 0 : (-1);
    int _1368 = _1338 * int(_1326);
    int _1370 = _1368 + _1292;
    bool _1372 = _1242 > 0.5;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _1376 = ~_1328;
    int _1378 = _1376 + _1366;
    int _1380 = _1378 + 1;
    float _1382 = float(uint(_1370));
    float _1384 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1374);
    float _1386 = -_223;
    int _1388 = _1372 ? as_type<int>(_1386) : as_type<int>(_223);
    int _1390 = _705 * _1380;
    int _1392 = _1390 + _1140;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1396 = _1394 != 0;
    float _1398 = as_type<float>(_882) * _1382;
    int _1400 = ~_711;
    int _1402 = _1400 + 1;
    float _1404 = _868 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1406 = !_1396;
    float _1408 = _1406 ? _223 : as_type<float>(_1388);
    float _1410 = trunc(_1398);
    float _1412 = precise::max(_1410, 0.0);
    uint _1414 = uint(_1412);
    bool _1416 = _1396;
    if (_1222)
    {
        bool _1418 = _1352 > 0.5;
        _1416 = _1418;
    }
    bool _1420 = _1416;
    float _1422 = as_type<float>(_1388);
    if (_1274)
    {
        float _1424 = in.m_66.x;
        _1422 = _1424;
    }
    float _1426 = _1422;
    bool _1428 = !_1252;
    int _1430 = _1428 ? _1392 : (-1);
    float _1432 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1384);
    if (_1222)
    {
        float _1434 = -_219;
        float _1436 = _1420 ? _1434 : _219;
        _1308 = _1436;
    }
    float _1438 = _1308;
    float _1440 = -_1408;
    float _1442 = _1440 + 0.5;
    int _1444 = _1430 & 3;
    bool _1446 = _1444 != 0;
    float _1448 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1450 = int(_1448);
    int _1452 = _1430 & 3;
    bool _1454 = _1452 != 0;
    float _1456 = _1442 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1458 = _1446 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1460 = uint(_1452) > 1u;
    bool _1462 = _711 == 0;
    int _1464 = int(_1326) + int(_1414);
    int _1466 = ~as_type<int>(_1458);
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    int _1472 = int(_962);
    int _1474 = _1274 ? 2 : 0;
    int _1476 = _1472 | _1474;
    int _1478 = _1460 ? 4 : 0;
    int _1480 = _1476 | _1478;
    int _1482 = _1454 ? 8 : 0;
    int _1484 = _1480 | _1482;
    int _1486 = _1174 ? 16 : 0;
    int _1488 = _1484 | _1486;
    int _1490 = _1462 ? 32 : 0;
    int _1492 = _1488 | _1490;
    int _1494 = _1182 ? 64 : 0;
    int _1496 = _1492 | _1494;
    int _1498 = _1496 & 8;
    int _1500 = _1402 * _1464;
    int _1502 = _1500 + _1292;
    float _1504 = float(uint(_1450));
    int _1506 = _1470;
    float _1508 = _1458;
    if (!_1460)
    {
        int _1510 = ~as_type<int>(_1458);
        int _1512 = _1510 + 1;
        _1506 = _1512;
    }
    int _1514 = _1506;
    if (_1274)
    {
        float _1516 = _1426 * 3.1415927410125732421875;
        _1508 = _1516;
    }
    float _1518 = _1508;
    bool _1520 = uint(_1452) >= 2u;
    int _1522 = ~_1450;
    int _1524 = _1522 + 1;
    float _1526 = _1518;
    if (_1274)
    {
        float _1528 = _1518 * 0.15915493667125701904296875;
        _1526 = _1528;
    }
    float _1530 = _1526;
    int _1532 = _1520 ? 0 : 1;
    bool _1534 = uint(_1502) >= uint(_711);
    int _1536 = ~_1532;
    int _1538 = _1536 + 1;
    int _1540 = _1538 + 1;
    float _1542 = _1530;
    int _1544 = _1540;
    if (_1274)
    {
        float _1546 = _1530 * 6.283185482025146484375;
        float _1548 = sin(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    bool _1552 = !_1534;
    int _1554 = _1552 ? 0 : (-1);
    bool _1556 = _1452 != 3;
    int _1558 = ~_1464;
    int _1560 = _1558 + _1554;
    int _1562 = _1560 + 1;
    float _1564 = float(_1450);
    int _1566 = _711 * _1562;
    int _1568 = _1566 + _1292;
    float _1570 = _1564 * _970;
    float _1572 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1574 = !_1462;
    int _1576 = _1574 ? _1568 : (-1);
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1580 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1582 = int(_1580);
    bool _1584 = _1556;
    if (_1556)
    {
        int _1586 = ~_1532;
        int _1588 = _1586 + 1;
        _1544 = _1588;
    }
    int _1590 = _1544;
    if (_1274)
    {
        bool _1592 = _1550 > 0.5;
        _1584 = _1592;
    }
    bool _1594 = _1584;
    float _1596 = fma(_1404, -2.0, _1578);
    if (_1274)
    {
        float _1598 = -_223;
        float _1600 = _1594 ? _1598 : _223;
        _1314 = _1600;
    }
    float _1602 = _1314;
    float _1604 = 1.0 / _1504;
    int _1606 = _1576 & 3;
    bool _1608 = _1606 != 0;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1612 = _1576 & 3;
    bool _1614 = _1612 != 0;
    float _1616 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1596);
    int _1618 = _1608 ? 0 : 1;
    float _1620 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1610);
    bool _1622 = uint(_1612) > 1u;
    float _1624 = trunc(_1570);
    int _1626 = int(_1624);
    float _1628 = float(_1582);
    float _1630 = _866 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1632 = ~_1618;
    int _1634 = _1632 + 1;
    int _1636 = _1634 + 1;
    int _1638 = int(_962);
    int _1640 = _1622 ? 2 : 0;
    int _1642 = _1638 | _1640;
    int _1644 = _1614 ? 4 : 0;
    int _1646 = _1642 | _1644;
    int _1648 = _1454 ? 8 : 0;
    int _1650 = _1646 | _1648;
    int _1652 = _1174 ? 16 : 0;
    int _1654 = _1650 | _1652;
    int _1656 = _1462 ? 32 : 0;
    int _1658 = _1654 | _1656;
    int _1660 = _1182 ? 64 : 0;
    int _1662 = _1658 | _1660;
    int _1664 = _1662 & 4;
    float _1666 = fma(_1630, -2.0, _1320);
    float _1668 = 1.0 / _1628;
    int _1670 = as_type<int>(_1604) + (-2);
    float _1672 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1666);
    int _1674 = ~_705;
    int _1676 = _1674 + 1;
    float _1678 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1680 = _1636;
    if (!_1622)
    {
        int _1682 = ~_1618;
        int _1684 = _1682 + 1;
        _1680 = _1684;
    }
    int _1686 = _1680;
    bool _1688 = uint(_1612) >= 2u;
    float _1690 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1678);
    float _1692 = _858 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1694 = _870 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    int _1696 = _1688 ? 0 : 1;
    float _1698 = _858 * 2.0;
    bool _1700 = _1612 != 3;
    float _1702 = -_1340;
    float _1704 = fma(_1692, 2.0, _1702);
    int _1706 = ~_1696;
    int _1708 = _1706 + 1;
    int _1710 = _1708 + 1;
    float _1712 = _1668 * _129;
    float _1714 = _902 * _129;
    float _1716 = -_1356;
    float _1718 = fma(_1694, 2.0, _1716);
    float _1720 = floor(_1698);
    float _1722 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1690);
    float _1724 = -_129;
    float _1726 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1704);
    float _1728 = -_129;
    float _1730 = fma(_1728, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1718);
    int _1732 = ~_1450;
    int _1734 = _1732 + 1;
    int _1736 = _1710;
    float _1738 = _1698;
    if (_1700)
    {
        int _1740 = ~_1696;
        int _1742 = _1740 + 1;
        _1736 = _1742;
    }
    int _1744 = _1736;
    float _1746 = trunc(_1712);
    int _1748 = int(_1746);
    int _1750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1752 = _1750 != 0;
    bool _1754 = !_1752;
    int _1756 = _1754 ? 0 : 1;
    int _1758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1760 = _1758 != 0;
    int _1762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1764 = _1762 != 0;
    int _1766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1768 = _1766 != 0;
    int _1770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1772 = _1770 != 0;
    float _1774 = exp2(_1714);
    bool _1776 = _874 > 0.5;
    float _1778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1780 = _1778 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1782 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1784 = isnan(_697);
    bool _1786 = _1782 || _1784;
    bool _1788 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1790 = _1786 || _1788;
    float _1792 = float(_1790);
    bool _1794 = !_1760;
    int _1796 = _1794 ? 0 : 1;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1800 = _1798 != 0;
    float _1802 = 1.0 / _1780;
    float _1804 = float(uint(_1748));
    bool _1806 = !_1800;
    float _1808 = _1806 ? _223 : as_type<float>(_1300);
    bool _1810 = _872 != 2;
    float _1812 = as_type<float>(_1670) * _1804;
    bool _1814 = !_1764;
    int _1816 = _1814 ? 0 : 1;
    float _1818 = floor(_894);
    bool _1820 = _858 > 0.5;
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    bool _1826 = !_1768;
    int _1828 = _1826 ? 0 : 1;
    int _1830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1832 = _1830 != 0;
    bool _1834 = !_1772;
    int _1836 = _1834 ? 0 : 1;
    float _1838 = trunc(_1812);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1664 != 0;
    if (_1810)
    {
        _1738 = _866;
    }
    float _1846 = _1738;
    float _1848 = _1846;
    if (!_1810)
    {
        _1848 = _858;
    }
    float _1850 = _1848;
    int _1852 = abs(_1816);
    float _1854 = -_1818;
    float _1856 = _894 + _1854;
    float _1858 = float(uint(_1076));
    float _1860 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1862 = -_219;
    int _1864 = _1820 ? as_type<int>(_1862) : as_type<int>(_219);
    float _1866 = _1856 * _1564;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1870 = _1868 != 0;
    float _1872 = fma(_1860, -2.0, _1572);
    int _1874 = ~_705;
    int _1876 = _1874 + 1;
    int _1878 = _1524 * int(_1842);
    int _1880 = _1878 + _1748;
    float _1882 = trunc(_1866);
    int _1884 = int(_1882);
    int _1886 = ~_711;
    int _1888 = _1886 + 1;
    int _1890 = abs(_1828);
    float _1892 = float(uint(_1880));
    float _1894 = _866 * 2.0;
    float _1896 = as_type<float>(_1670) * _1892;
    float _1898 = as_type<float>(_733) * _1858;
    float _1900 = _1858;
    if (_1810)
    {
        _1900 = _858;
    }
    float _1902 = _1900;
    float _1904 = _1902;
    if (!_1810)
    {
        _1904 = _874;
    }
    float _1906 = _1904;
    float _1908 = trunc(_1896);
    float _1910 = precise::max(_1908, 0.0);
    uint _1912 = uint(_1910);
    bool _1914 = _1720 > 0.0;
    int _1916 = abs(_1836);
    bool _1918 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1920 = isnan(_697);
    bool _1922 = _1918 || _1920;
    bool _1924 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1926 = _1922 || _1924;
    float _1928 = float(_1926);
    int _1930 = abs(_1686);
    float _1932 = trunc(_1898);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    bool _1938 = !_1870;
    float _1940 = _1938 ? _219 : as_type<float>(_1864);
    float _1942 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1944 = _1720 >= 0.0;
    bool _1946 = isnan(_1720);
    bool _1948 = _1944 || _1946;
    bool _1950 = isnan(0.0);
    bool _1952 = _1948 || _1950;
    int _1954 = abs(_1744);
    float _1956 = -_1360;
    float _1958 = fma(_1942, 2.0, _1956);
    float _1960 = -_219;
    int _1962 = _1776 ? as_type<int>(_1960) : as_type<int>(_219);
    float _1964 = trunc(_1362);
    float _1966 = precise::max(_1964, 0.0);
    uint _1968 = uint(_1966);
    int _1970 = int(_1842) + int(_1912);
    bool _1972 = !_1832;
    float _1974 = _1972 ? _219 : as_type<float>(_1962);
    int _1976 = abs(_1756);
    bool _1978 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1980 = isnan(0.0);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1986 = _1982 || _1984;
    int _1988 = _1876 * int(_1936);
    int _1990 = _1988 + _1076;
    int _1992 = ~_1450;
    int _1994 = _1992 + 1;
    int _1996 = _1884 * _1976;
    int _1998 = _1996 + _1748;
    float _2000 = floor(_1894);
    int _2002 = abs(_1514);
    float _2004 = float(uint(_1990));
    int _2006 = _1888 * int(_1968);
    int _2008 = _2006 + _1200;
    float _2010 = _1986 ? _1824 : 0.0;
    float _2012 = as_type<float>(_733) * _2004;
    float _2014 = float(uint(_1998));
    bool _2016 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2018 = isnan(1.0);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2024 = _2020 || _2022;
    float _2026 = as_type<float>(_1670) * _2014;
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2030 = 1.0 + _2028;
    float _2032 = float(uint(_2008));
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2036 = trunc(_2012);
    float _2038 = precise::max(_2036, 0.0);
    uint _2040 = uint(_2038);
    float _2042 = as_type<float>(_882) * _2032;
    float _2044 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2034);
    float _2046 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2048 = ~_1450;
    int _2050 = _2048 + 1;
    float _2052 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2044);
    float _2054 = trunc(_2026);
    float _2056 = precise::max(_2054, 0.0);
    uint _2058 = uint(_2056);
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2062 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2046);
    float _2064 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1620);
    float _2066 = -_2052;
    float _2068 = _2066 + 1.0;
    float _2070 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2060);
    float _2072 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2062);
    float _2074 = 1.0 / _2030;
    float _2076 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2070);
    int _2078 = _1994 * int(_2058);
    int _2080 = _2078 + _1998;
    float _2082 = trunc(_2042);
    float _2084 = precise::max(_2082, 0.0);
    uint _2086 = uint(_2084);
    int _2088 = _2050 * _1970;
    int _2090 = _2088 + _1748;
    float _2092 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1872);
    float _2094 = float(uint(_2080));
    float _2096 = -_129;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1958);
    float _2100 = as_type<float>(_2002);
    if (_2024)
    {
        float _2102 = _2010 * _2074;
        _139 = _2102;
    }
    float _2104 = _139;
    bool _2106 = uint(_2090) >= uint(_1450);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2110 = _2108 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2112 = as_type<float>(_1670) * _2094;
    int _2114 = _1952 ? 0 : 1;
    float _2116 = in.m_62.w;
    bool _2118 = !_2106;
    int _2120 = _2118 ? 0 : (-1);
    float _2122 = trunc(_2112);
    float _2124 = precise::max(_2122, 0.0);
    uint _2126 = uint(_2124);
    bool _2128 = _2000 > 0.0;
    float _2130 = -_1928;
    float _2132 = _2130 + 1.0;
    bool _2134 = _2000 >= 0.0;
    bool _2136 = isnan(_2000);
    bool _2138 = _2134 || _2136;
    bool _2140 = isnan(0.0);
    bool _2142 = _2138 || _2140;
    int _2144 = int(_1936) + int(_2040);
    int _2146 = ~_2114;
    int _2148 = _2146 + 1;
    int _2150 = _2148 + 1;
    int _2152 = _2150;
    if (!_1914)
    {
        int _2154 = ~_2114;
        int _2156 = _2154 + 1;
        _2152 = _2156;
    }
    int _2158 = _2152;
    int _2160 = int(_1968) + int(_2086);
    int _2162 = _1676 * _2144;
    int _2164 = _2162 + _1076;
    float _2166 = float(_1748);
    int _2168 = ~_711;
    int _2170 = _2168 + 1;
    bool _2172 = _2166 >= _1564;
    bool _2174 = isnan(_2166);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan(_1564);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = int(_2058) + int(_2126);
    int _2186 = _2170 * _2160;
    int _2188 = _2186 + _1200;
    bool _2190 = uint(_2164) >= uint(_705);
    float _2192 = trunc(_2182);
    int _2194 = int(_2192);
    int _2196 = _1734 * _2184;
    int _2198 = _2196 + _1998;
    int _2200 = _2142 ? 0 : 1;
    bool _2202 = !_2190;
    int _2204 = _2202 ? 0 : (-1);
    int _2206 = ~_1970;
    int _2208 = _2206 + _2120;
    int _2210 = _2208 + 1;
    bool _2212 = uint(_2188) >= uint(_711);
    bool _2214 = uint(_2198) >= uint(_1450);
    int _2216 = _1450 * _2210;
    int _2218 = _2216 + _1748;
    bool _2220 = !_2212;
    int _2222 = _2220 ? 0 : (-1);
    int _2224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2226 = _2224 != 0;
    int _2228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2230 = _2228 != 0;
    int _2232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2234 = _2232 != 0;
    bool _2236 = _1450 == 0;
    int _2238 = ~_2194;
    int _2240 = _2238 + 1;
    int _2242 = _2240 + 1;
    bool _2244 = !_2236;
    int _2246 = _2244 ? _2218 : (-1);
    int _2248 = _1450 + (-1);
    int _2250 = ~_2200;
    int _2252 = _2250 + 1;
    int _2254 = _2252 + 1;
    int _2256 = _2246 * _2242;
    int _2258 = abs(_1796);
    int _2260 = _2194 * _2248;
    int _2262 = _2260 + _2256;
    int _2264 = ~_1450;
    int _2266 = _2264 + 1;
    int _2268 = _2262 * _1852;
    int _2270 = _2254;
    if (!_2128)
    {
        int _2272 = ~_2200;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _1626 * _2258;
    int _2280 = _2278 + _2268;
    int _2282 = ~_1450;
    int _2284 = _2282 + 1;
    int _2286 = _1998 * _1890;
    int _2288 = _2286 + _2280;
    bool _2290 = !_2214;
    int _2292 = _2290 ? 0 : (-1);
    bool _2294 = !_2230;
    int _2296 = _2294 ? 0 : 1;
    int _2298 = _1884 * _1916;
    int _2300 = _2298 + _2288;
    float _2302 = float(uint(_2300));
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2306 = _2304 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2308 = _1498 != 0;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2314 = as_type<float>(_1670) * _2302;
    float _2316 = _874 * 2.0;
    float _2318 = 1.0 / _2306;
    bool _2320 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2322 = isnan(_697);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    bool _2332 = !_2226;
    int _2334 = _2332 ? 0 : 1;
    bool _2336 = !_2234;
    int _2338 = _2336 ? 0 : 1;
    float _2340 = float(_2158);
    float _2342 = trunc(_2314);
    float _2344 = precise::max(_2342, 0.0);
    uint _2346 = uint(_2344);
    int _2348 = abs(_2338);
    int _2350 = ~_2144;
    int _2352 = _2350 + _2204;
    int _2354 = _2352 + 1;
    int _2356 = ~_2184;
    int _2358 = _2356 + _2292;
    int _2360 = _2358 + 1;
    bool _2362 = _711 == 0;
    float _2364 = floor(_2316);
    int _2366 = _705 * _2354;
    int _2368 = _2366 + _1076;
    int _2370 = _1450 * _2360;
    int _2372 = _2370 + _1998;
    int _2374 = _2266 * int(_2346);
    int _2376 = _2374 + _2300;
    float _2378 = float(uint(_2376));
    bool _2380 = _2364 >= 0.0;
    bool _2382 = isnan(_2364);
    bool _2384 = _2380 || _2382;
    bool _2386 = isnan(0.0);
    bool _2388 = _2384 || _2386;
    float _2390 = as_type<float>(_1670) * _2378;
    int _2392 = _2388 ? 0 : 1;
    float _2394 = trunc(_2390);
    float _2396 = precise::max(_2394, 0.0);
    uint _2398 = uint(_2396);
    bool _2400 = _2364 > 0.0;
    int _2402 = ~_2392;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    int _2408 = _2406;
    if (!_2400)
    {
        int _2410 = ~_2392;
        int _2412 = _2410 + 1;
        _2408 = _2412;
    }
    int _2414 = _2408;
    int _2416 = int(_2346) + int(_2398);
    float _2418 = in.m_46.x;
    float _2420 = in.m_46.y;
    float _2422 = in.m_46.z;
    int _2424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2426 = _2424 != 0;
    int _2428 = _2284 * _2416;
    int _2430 = _2428 + _2300;
    bool _2432 = uint(_2430) >= uint(_1450);
    bool _2434 = !_1844;
    int _2436 = _2434 ? 0 : 1;
    bool _2438 = !_2432;
    int _2440 = _2438 ? 0 : (-1);
    bool _2442 = _1612 != 3;
    int _2444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2446 = _2444 != 0;
    float _2448 = 1.0 / _2312;
    bool _2450 = !_2442;
    int _2452 = _2450 ? 0 : (-1);
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2456 = _2454 != 0;
    int _2458 = ~_2416;
    int _2460 = _2458 + _2440;
    int _2462 = _2460 + 1;
    float _2464 = _191 * _2420;
    float _2466 = _203 * _2420;
    float _2468 = 1.0 / _2110;
    float _2470 = _197 * _2420;
    float _2472 = fma(_189, _2418, _2464);
    float _2474 = fma(_201, _2418, _2466);
    float _2476 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2478 = _2476 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2480 = fma(_195, _2418, _2470);
    float _2482 = fma(_193, _2422, _2472);
    float _2484 = fma(_205, _2422, _2474);
    float _2486 = fma(_199, _2422, _2480);
    float _2488 = 1.0 / _2478;
    float _2490 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2492 = _2490 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2496 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2502 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2506 = 1.0 / _2492;
    float _2508 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2510 = _2508 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2512 = _2496 * _1802;
    float _2514 = _2504 * _2468;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2518 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2516;
    float _2520 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2522 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2520;
    bool _2524 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2526 = isnan(_697);
    bool _2528 = _2524 || _2526;
    bool _2530 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2532 = _2528 || _2530;
    float _2534 = float(_2532);
    float _2536 = 1.0 / _2510;
    float _2538 = _2518 * _2448;
    float _2540 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2542 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2540;
    float _2544 = _2500 * _2318;
    float _2546 = in.m_60.w;
    bool _2548 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2550 = isnan(_697);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2556 = _2552 || _2554;
    float _2558 = float(_2556);
    float _2560 = _2522 * _2488;
    bool _2562 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2564 = isnan(_697);
    bool _2566 = _2562 || _2564;
    bool _2568 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2570 = _2566 || _2568;
    float _2572 = float(_2570);
    float _2574 = _2542 * _2506;
    float _2576 = -_2534;
    float _2578 = _2576 + 1.0;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2582 = _2580 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2584 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2586 = isnan(_697);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = in.m_64.w;
    float _2598 = _2558 * _2578;
    float _2600 = -_2558;
    float _2602 = _2600 + 1.0;
    float _2604 = -_2572;
    float _2606 = _2604 + 1.0;
    float _2608 = -_2594;
    float _2610 = _2608 + 1.0;
    float _2612 = _2582 * _2536;
    float _2614 = _2572 * _2602;
    float _2616 = _2594 * _2606;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2620 = _697 + _2618;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2624 = _697 + _2622;
    float _2626 = _1792 * _2610;
    float _2628 = -_1792;
    float _2630 = _2628 + 1.0;
    float _2632 = fma(_2512, _2620, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2634 = fma(_2544, _2624, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2636 = -_2330;
    float _2638 = _2636 + 1.0;
    float _2640 = _2330 * _2630;
    bool _2642 = _697 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2644 = isnan(_697);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = _2486 + _2116;
    float _2656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2658 = _697 + _2656;
    float _2660 = _2482 + _2546;
    float _2662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2664 = _697 + _2662;
    float _2666 = _2652 * _2132;
    float _2668 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2670 = _2654 + _2668;
    float _2672 = fma(_2538, _2658, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2674 = -_2652;
    float _2676 = _2674 + 1.0;
    float _2678 = _2632 * _2666;
    float _2680 = _2484 + _2596;
    float _2682 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2684 = _2660 + _2682;
    float _2686 = _2670 * _2670;
    float _2688 = _1928 * _2638;
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2678);
    float _2692 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2694 = _2680 + _2692;
    float _2696 = fma(_2684, _2684, _2686);
    float _2698 = fma(_2514, _2664, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2700 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2702 = _697 + _2700;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2706 = _697 + _2704;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2710 = _697 + _2708;
    float _2712 = fma(_2634, _2688, _2690);
    float _2714 = fma(_2694, _2694, _2696);
    float _2716 = fma(_2574, _2702, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2718 = fma(_2612, _2710, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2720 = fma(_2672, _2640, _2712);
    float _2722 = _866 + _858;
    float _2724 = sqrt(_2714);
    float _2726 = fma(_2560, _2706, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2728 = _2722 + (-1.0);
    float _2730 = _858 + _874;
    float _2732 = _858 + (-0.5);
    float _2734 = _866 + _874;
    float _2736 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2738 = _866 + (-0.5);
    float _2740 = rsqrt(_2714);
    float _2742 = fma(_2698, _2626, _2720);
    float _2744 = _906 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2746 = _2734 + (-1.0);
    float _2748 = _2730 + (-1.0);
    float _2750 = _2724 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2752 = fma(_2746, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2754 = _1438 + 0.5;
    float _2756 = fma(_2748, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2758 = _1602 + (-0.5);
    float _2760 = precise::min(_2744, _2750);
    float _2762 = fma(_2726, _2616, _2742);
    float _2764 = fma(_2754, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1730);
    float _2766 = _1940 + 0.5;
    float _2768 = -_2758;
    float _2770 = -_1616;
    float _2772 = fma(_2768, (*spvDescriptorSet0.vp_c9)._m0[95].y, _2770);
    float _2774 = _2740 * _2760;
    float _2776 = fma(_2718, _2614, _2762);
    int _2778 = abs(_2334);
    float _2780 = in.m_74.x;
    float _2782 = in.m_74.y;
    float _2784 = in.m_74.z;
    float _2786 = _2670 * _2774;
    float _2788 = fma(_2766, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1726);
    float _2790 = float(_2414);
    float _2792 = _1808 + (-0.5);
    float _2794 = -_2786;
    float _2796 = _2670 + _2794;
    float _2798 = _2684 * _2774;
    float _2800 = _2694 * _2774;
    float _2802 = -_2792;
    float _2804 = -_1672;
    float _2806 = fma(_2802, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2804);
    float _2808 = _2796 * _2796;
    float _2810 = float(_2778);
    float _2812 = -_2798;
    float _2814 = _2684 + _2812;
    int _2816 = abs(_2296);
    float _2818 = fma(_2716, _2598, _2776);
    float _2820 = -_1722;
    float _2822 = _2820 + 1.0;
    float _2824 = _2810 * _2790;
    float _2826 = fma(_2814, _2814, _2808);
    float _2828 = float(_2276);
    float _2830 = -_2800;
    float _2832 = _2694 + _2830;
    float _2834 = _2824 * (-2.0);
    float _2836 = float(_2816);
    float _2838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2840 = float(_2348);
    float _2842 = fma(_2832, _2832, _2826);
    float _2844 = fma(_2834, _2780, _2780);
    float _2846 = _2836 * _2340;
    float _2848 = _874 + (-0.5);
    float _2850 = _2840 * _2828;
    float _2852 = -_1432;
    float _2854 = _2852 + 1.0;
    float _2856 = _2846 * (-2.0);
    float _2858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2860 = _2850 * (-2.0);
    float _2862 = fma(_2736, _2834, _2736);
    float _2864 = fma(_2856, _2782, _2782);
    float _2866 = _1974 + 0.5;
    float _2868 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2844);
    float _2870 = fma(_2752, _2856, _2752);
    float _2872 = fma(_2738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2864);
    float _2874 = _2866 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2876 = fma(_2860, _2784, _2784);
    float _2878 = fma(_2756, _2860, _2756);
    float _2880 = fma(_2854, _1602, _2772);
    float _2882 = _2874 * _2838;
    float _2884 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2876);
    float _2886 = -_2072;
    float _2888 = _2886 + 1.0;
    float _2890 = sqrt(_2842);
    float _2892 = fma(_2862, _2104, _2868);
    float _2894 = fma(_2870, _2104, _2872);
    float _2896 = _1456 * _2858;
    float _2898 = fma(_2878, _2104, _2884);
    float _2900 = -_2888;
    float _2902 = fma(_1940, _2900, _2788);
    float _2904 = -_2822;
    float _2906 = fma(_2904, _1438, _2764);
    float _2908 = fma(_1808, _2068, _2806);
    float _2910 = _2892 * 0.15915493667125701904296875;
    float _2912 = _2894 * 0.15915493667125701904296875;
    float _2914 = _2898 * 0.15915493667125701904296875;
    out.m_76.x = _2906;
    out.m_76.y = _2880;
    float _2916 = fma(_2534, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2818);
    float _2918 = _2910 * 6.283185482025146484375;
    float _2920 = sin(_2918);
    float _2922 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    out.m_78.x = _2902;
    out.m_78.y = _2908;
    out.m_78.z = _2882;
    out.m_78.w = _2896;
    float _2924 = _2740 * _2890;
    float _2926 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _219);
    float _2928 = _223 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2930 = _1450 * _2462;
    int _2932 = _2930 + _2300;
    float _2934 = _912 * _2924;
    float _2936 = _2910 * 6.283185482025146484375;
    float _2938 = cos(_2936);
    float _2940 = _906 * _2924;
    out.m_80.w = _2760;
    float _2942 = _2934 * _2922;
    float _2944 = _2940 * _2926;
    out.m_82.x = _2916;
    float _2946 = _2912 * 6.283185482025146484375;
    float _2948 = cos(_2946);
    int _2950 = _1576 >> 31;
    out.m_84.x = _2940;
    int _2952 = ~_2160;
    int _2954 = _2952 + _2222;
    int _2956 = _2954 + 1;
    int _2958 = _2950 & 3;
    float _2960 = _2914 * 6.283185482025146484375;
    float _2962 = cos(_2960);
    int _2964 = _1576 + _2958;
    int _2966 = _711 * _2956;
    int _2968 = _2966 + _1200;
    int _2970 = _2964 >> 2;
    float _2972 = _2912 * 6.283185482025146484375;
    float _2974 = sin(_2972);
    float _2976 = _2920 * _2948;
    float _2978 = _2938 * _2948;
    float _2980 = _2914 * 6.283185482025146484375;
    float _2982 = sin(_2980);
    float _2984 = _2948 * _2962;
    float _2986 = _2938 * _2962;
    float _2988 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2990 = _2938 * _2974;
    int _2992 = _2970 << 4;
    int _2994 = _2992 + 656;
    float _2996 = _2920 * _2974;
    float _2998 = _2974 * _2962;
    float _3000 = _2986 * _2942;
    uint _3002 = uint(int(uint(_2994) >> uint(2)));
    uint _3004 = uint(int(uint(int(_3002)) >> uint(2)));
    int _3006 = int(_3002) & 3;
    float _3008 = (*spvDescriptorSet0.vp_c9)._m0[int(_3004)][_3006];
    int _3010 = int(_3002) + 1;
    uint _3012 = uint(int(uint(_3010) >> uint(2)));
    int _3014 = _3010 & 3;
    float _3016 = (*spvDescriptorSet0.vp_c9)._m0[int(_3012)][_3014];
    float _3018 = _2920 * _2962;
    float _3020 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3022 = fma(_2982, _2978, _2996);
    float _3024 = fma(_2982, _2996, _2978);
    float _3026 = _2986 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3028 = -_2990;
    float _3030 = fma(_2982, _2976, _3028);
    float _3032 = fma(_3022, _2944, _3000);
    float _3034 = -_2976;
    float _3036 = fma(_2982, _2990, _3034);
    int _3038 = _2994 + 8;
    uint _3040 = uint(int(uint(_3038) >> uint(2)));
    uint _3042 = uint(int(uint(int(_3040)) >> uint(2)));
    int _3044 = int(_3040) & 3;
    float _3046 = (*spvDescriptorSet0.vp_c9)._m0[int(_3042)][_3044];
    int _3048 = int(_3040) + 1;
    uint _3050 = uint(int(uint(_3048) >> uint(2)));
    int _3052 = _3048 & 3;
    float _3054 = (*spvDescriptorSet0.vp_c9)._m0[int(_3050)][_3052];
    float _3056 = -_2942;
    float _3058 = _2982 * _3056;
    float _3060 = _3018 * _2942;
    float _3062 = -_2982;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3026);
    float _3066 = -_2982;
    float _3068 = fma(_3066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2988);
    float _3070 = -_2982;
    float _3072 = fma(_3070, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3020);
    float _3074 = fma(_2984, _2944, _3058);
    float _3076 = fma(_3030, _2944, _3060);
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3080 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3064);
    float _3082 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3068);
    float _3084 = fma(_3018, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3072);
    float _3086 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3088 = _3086 * 0.5;
    float _3090 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3092 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3094 = _3036 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3096 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3098 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3078);
    float _3100 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3102 = fma(_2998, _3088, _3074);
    float _3104 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3090);
    float _3106 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3092);
    float _3108 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3094);
    float _3110 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3096);
    float _3112 = fma(_2984, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3100);
    float _3114 = fma(_3036, _3088, _3032);
    float _3116 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3108);
    float _3118 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3098);
    int _3120 = abs(_2436);
    float _3122 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3110);
    float _3124 = fma(_3030, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3112);
    float _3126 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3128 = ~_1930;
    int _3130 = _3128 + 1;
    int _3132 = _3130 + 1;
    float _3134 = fma(_3024, _3088, _3076);
    float _3136 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3104);
    float _3138 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3106);
    float _3140 = _2928 * _3080;
    int _3142 = ~_3120;
    int _3144 = _3142 + 1;
    int _3146 = _3144 + 1;
    int _3148 = _3132 * as_type<int>(_3016);
    float _3150 = _2928 * _3082;
    int _3152 = abs(_2452);
    float _3154 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _3156 = _3146 * as_type<int>(_3008);
    int _3158 = _3156 + _3148;
    float _3160 = fma(_3126, _3118, _3140);
    out.m_86.x = _3118;
    out.m_86.y = _3122;
    out.m_86.z = _3124;
    float _3162 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3164 = fma(_3126, _3122, _3150);
    float _3166 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3154);
    float _3168 = _3114 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3170 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3162);
    float _3172 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3174 = int(_3172);
    float _3176 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3178 = fma(_3102, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3168);
    float _3180 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3170);
    float _3182 = _2928 * _3084;
    int _3184 = _1430 >> 31;
    float _3186 = fma(_3134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3178);
    int _3188 = ~_1954;
    int _3190 = _3188 + 1;
    int _3192 = _3190 + 1;
    float _3194 = fma(_3126, _3124, _3182);
    int _3196 = _3184 & 3;
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3200 = ~_3152;
    int _3202 = _3200 + 1;
    int _3204 = _3202 + 1;
    int _3206 = _3192 * as_type<int>(_3046);
    int _3208 = _3206 + _3158;
    int _3210 = _1430 + _3196;
    float _3212 = _2680 + _3198;
    bool _3214 = !_2362;
    int _3216 = _3214 ? _2968 : (-1);
    int _3218 = _3204 * as_type<int>(_3054);
    int _3220 = _3218 + _3208;
    bool _3222 = !_2446;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _3228 = !_2236;
    int _3230 = _3228 ? _2932 : (-1);
    float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3234 = _3212 + _3232;
    int _3236 = abs(_3224);
    float _3238 = _2660 + _3226;
    int _3240 = _3230 >> 31;
    float _3242 = _3234 * _3234;
    int _3244 = abs(_3174);
    float _3246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3248 = _3238 + _3246;
    int _3250 = _3240 & 3;
    float _3252 = float(uint(_3244));
    float _3254 = fma(_3248, _3248, _3242);
    int _3256 = _3230 + _3250;
    int _3258 = ~_3236;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    float _3264 = sqrt(_3254);
    int _3266 = _3256 >> 2;
    float _3268 = float(uint(_3174));
    int _3270 = _3220 * _3262;
    int _3272 = _3266 << 4;
    int _3274 = _3272 + 800;
    int _3276 = _3230 & 3;
    bool _3278 = _3276 != 0;
    float _3280 = 1.0 / _3268;
    uint _3282 = uint(int(uint(_3274) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    bool _3298 = !_2308;
    int _3300 = _3298 ? 0 : 1;
    int _3302 = _3216 * _3236;
    int _3304 = _3302 + _3270;
    bool _3306 = uint(_3276) > 1u;
    int _3308 = _3230 & 3;
    bool _3310 = _3308 != 0;
    float _3312 = 1.0 / _3252;
    int _3314 = ~_3174;
    int _3316 = _3314 + 1;
    int _3318 = _3310 ? 0 : 1;
    bool _3320 = _1452 != 3;
    int _3322 = abs(_3304);
    float _3324 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3326 = ~_3318;
    int _3328 = _3326 + 1;
    int _3330 = _3328 + 1;
    int _3332 = _3330;
    float _3334 = _3182;
    float _3336 = _3212;
    float _3338 = _2800;
    float _3340 = _3194;
    if (!_3306)
    {
        int _3342 = ~_3318;
        int _3344 = _3342 + 1;
        _3332 = _3344;
    }
    int _3346 = _3332;
    int _3348 = as_type<int>(_3280) + (-2);
    float _3350 = float(uint(_3304));
    int _3352 = as_type<int>(_3312) + (-2);
    float _3354 = _2654 + _3324;
    float _3356 = float(uint(_3322));
    float _3358 = as_type<float>(_3348) * _3350;
    bool _3360 = _3264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _3362 = _3210 >> 2;
    float _3364 = as_type<float>(_3352) * _3356;
    float _3366 = trunc(_3358);
    float _3368 = precise::max(_3366, 0.0);
    uint _3370 = uint(_3368);
    bool _3372 = !_3278;
    int _3374 = _3372 ? 0 : 1;
    int _3376 = _3362 << 4;
    int _3378 = _3376 + 368;
    bool _3380 = uint(_3276) >= 2u;
    float _3382 = trunc(_3364);
    float _3384 = precise::max(_3382, 0.0);
    uint _3386 = uint(_3384);
    uint _3388 = uint(int(uint(_3378) >> uint(2)));
    uint _3390 = uint(int(uint(int(_3388)) >> uint(2)));
    int _3392 = int(_3388) & 3;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[int(_3390)][_3392];
    int _3396 = int(_3388) + 1;
    uint _3398 = uint(int(uint(_3396) >> uint(2)));
    int _3400 = _3396 & 3;
    float _3402 = (*spvDescriptorSet0.vp_c9)._m0[int(_3398)][_3400];
    int _3404 = ~_3244;
    int _3406 = _3404 + 1;
    if (!_3360)
    {
        _3334 = _3238;
    }
    float _3408 = _3334;
    float _3410 = _3408;
    if (!_3360)
    {
        _2100 = _3354;
    }
    float _3412 = _2100;
    int _3414 = ~_2002;
    int _3416 = _3414 + 1;
    int _3418 = _3416 + 1;
    int _3420 = _3378 + 8;
    uint _3422 = uint(int(uint(_3420) >> uint(2)));
    uint _3424 = uint(int(uint(int(_3422)) >> uint(2)));
    int _3426 = int(_3422) & 3;
    float _3428 = (*spvDescriptorSet0.vp_c9)._m0[int(_3424)][_3426];
    int _3430 = int(_3422) + 1;
    uint _3432 = uint(int(uint(_3430) >> uint(2)));
    int _3434 = _3430 & 3;
    float _3436 = (*spvDescriptorSet0.vp_c9)._m0[int(_3432)][_3434];
    bool _3438 = _3276 != 3;
    int _3440 = _3380 ? 0 : 1;
    bool _3442 = _3276 != 3;
    bool _3444 = !_3360;
    float _3446 = _3412;
    if (!_3444)
    {
        float _3448 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3452 = _3264 + _3450;
        float _3454 = rsqrt(_3254);
        float _3456 = _3452 * _3448;
        float _3458 = _3354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3460 = _3456 * 0.15915493667125701904296875;
        float _3462 = _3460 * 6.283185482025146484375;
        float _3464 = cos(_3462);
        float _3466 = _3460 * 6.283185482025146484375;
        float _3468 = sin(_3466);
        float _3470 = _3464 + (-1.0);
        float _3472 = fma(_3468, _3458, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3476 = _3454 * _3472;
        float _3478 = fma(_3354, _3464, _3474);
        float _3480 = fma(_3248, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3482 = fma(_3234, _3476, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3446 = _3478;
        _3410 = _3480;
        _3336 = _3482;
    }
    float _3484 = _3446;
    float _3486 = _3410;
    float _3488 = _3336;
    int _3490 = abs(_3346);
    int _3492 = _3418 * as_type<int>(_3402);
    int _3494 = _3274 + 8;
    uint _3496 = uint(int(uint(_3494) >> uint(2)));
    uint _3498 = uint(int(uint(int(_3496)) >> uint(2)));
    int _3500 = int(_3496) & 3;
    float _3502 = (*spvDescriptorSet0.vp_c9)._m0[int(_3498)][_3500];
    int _3504 = int(_3496) + 1;
    uint _3506 = uint(int(uint(_3504) >> uint(2)));
    int _3508 = _3504 & 3;
    float _3510 = (*spvDescriptorSet0.vp_c9)._m0[int(_3506)][_3508];
    int _3512 = _3316 * int(_3370);
    int _3514 = _3512 + _3304;
    float _3516 = -_2786;
    float _3518 = _3516 + _3484;
    float _3520 = -_2798;
    float _3522 = _3520 + _3486;
    int _3524 = abs(_3300);
    int _3526 = _3406 * int(_3386);
    int _3528 = _3526 + _3322;
    float _3530 = float(uint(_3514));
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3534 = _3518 + _3532;
    int _3536 = ~_3490;
    int _3538 = _3536 + 1;
    int _3540 = _3538 + 1;
    float _3542 = -_2076;
    float _3544 = _3542 + 1.0;
    float _3546 = float(uint(_3528));
    float _3548 = as_type<float>(_3348) * _3530;
    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3552 = _3522 + _3550;
    float _3554 = _3534 * _3534;
    int _3556 = _3540 * as_type<int>(_3296);
    float _3558 = as_type<float>(_3352) * _3546;
    int _3560 = abs(_3374);
    float _3562 = fma(_3552, _3552, _3554);
    float _3564 = trunc(_3548);
    float _3566 = precise::max(_3564, 0.0);
    uint _3568 = uint(_3566);
    float _3570 = -_2064;
    float _3572 = _3570 + 1.0;
    int _3574 = abs(_1590);
    float _3576 = -_2800;
    float _3578 = _3576 + _3488;
    int _3580 = ~_3524;
    int _3582 = _3580 + 1;
    int _3584 = _3582 + 1;
    int _3586 = ~_3440;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    float _3592 = trunc(_3558);
    float _3594 = precise::max(_3592, 0.0);
    uint _3596 = uint(_3594);
    int _3598 = _3584 * as_type<int>(_3394);
    int _3600 = _3598 + _3492;
    int _3602 = ~_3574;
    int _3604 = _3602 + 1;
    int _3606 = _3604 + 1;
    float _3608 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3610 = _3578 + _3608;
    int _3612 = _3590;
    if (_3442)
    {
        int _3614 = ~_3440;
        int _3616 = _3614 + 1;
        _3612 = _3616;
    }
    int _3618 = _3612;
    int _3620 = ~_3560;
    int _3622 = _3620 + 1;
    int _3624 = _3622 + 1;
    int _3626 = _3606 * as_type<int>(_3428);
    int _3628 = _3626 + _3600;
    int _3630 = abs(_3618);
    bool _3632 = !_3438;
    int _3634 = _3632 ? 0 : (-1);
    int _3636 = _3624 * as_type<int>(_3288);
    int _3638 = _3636 + _3556;
    bool _3640 = !_3320;
    int _3642 = _3640 ? 0 : (-1);
    float _3644 = fma(_3610, _3610, _3562);
    int _3646 = ~_3174;
    int _3648 = _3646 + 1;
    int _3650 = int(_3370) + int(_3568);
    int _3652 = ~_3630;
    int _3654 = _3652 + 1;
    int _3656 = _3654 + 1;
    float _3658 = sqrt(_3644);
    int _3660 = abs(_3634);
    int _3662 = int(_3386) + int(_3596);
    int _3664 = _3656 * as_type<int>(_3502);
    int _3666 = _3664 + _3638;
    int _3668 = ~_3244;
    int _3670 = _3668 + 1;
    int _3672 = abs(_3642);
    int _3674 = _3648 * _3650;
    int _3676 = _3674 + _3304;
    int _3678 = _3670 * _3662;
    int _3680 = _3678 + _3322;
    float _3682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3684 = uint(_3676) >= uint(_3174);
    int _3686 = ~_3660;
    int _3688 = _3686 + 1;
    int _3690 = _3688 + 1;
    int _3692 = ~_3672;
    int _3694 = _3692 + 1;
    int _3696 = _3694 + 1;
    bool _3698 = uint(_3680) >= uint(_3244);
    int _3700 = _3690 * as_type<int>(_3510);
    int _3702 = _3700 + _3666;
    int _3704 = _3304 ^ _3174;
    int _3706 = _3696 * as_type<int>(_3436);
    int _3708 = _3706 + _3628;
    bool _3710 = !_3698;
    int _3712 = _3710 ? 0 : (-1);
    float _3714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _3716 = uint(int(uint(_3704) >> uint(31)));
    bool _3718 = !_3684;
    int _3720 = _3718 ? 0 : (-1);
    int _3722 = ~_3712;
    int _3724 = _3662 + _3722;
    int _3726 = _3724 + 1;
    bool _3728 = !_2426;
    int _3730 = _3728 ? 0 : 1;
    int _3732 = ~int(_3716);
    int _3734 = _3732 + 1;
    int _3736 = ~_3650;
    int _3738 = _3736 + _3720;
    int _3740 = _3738 + 1;
    bool _3742 = !_2456;
    int _3744 = _3742 ? 0 : 1;
    int _3746 = abs(_3730);
    int _3748 = _3174 * _3740;
    int _3750 = _3748 + _3304;
    int _3752 = _3726 ^ _3734;
    float _3754 = _3714 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3756 = abs(_3744);
    bool _3758 = _3174 == 0;
    bool _3760 = _3174 == 0;
    float _3762 = fma(_2928, _2928, 1.0);
    int _3764 = ~_3746;
    int _3766 = _3764 + 1;
    int _3768 = _3766 + 1;
    int _3770 = ~_3734;
    int _3772 = _3770 + _3752;
    int _3774 = _3772 + 1;
    float _3776 = rsqrt(_3762);
    bool _3778 = _705 == 0;
    int _3780 = _3708 * _3768;
    bool _3782 = !_3760;
    int _3784 = _3782 ? _3774 : (-1);
    float _3786 = _3682 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3788 = !_3758;
    int _3790 = _3788 ? _3750 : (-1);
    float _3792 = float(_3784);
    int _3794 = ~_3756;
    int _3796 = _3794 + 1;
    int _3798 = _3796 + 1;
    float _3800 = float(_3790);
    float _3802 = -_2092;
    float _3804 = fma(_3786, _3792, _3802);
    float _3806 = _994 + (-0.5);
    bool _3808 = !_3778;
    int _3810 = _3808 ? _2368 : (-1);
    int _3812 = _3702 * _3798;
    bool _3814 = !_2236;
    int _3816 = _3814 ? _2372 : (-1);
    float _3818 = -_3786;
    float _3820 = fma(_3818, _3806, _3804);
    float _3822 = fma(_3754, _3800, _2098);
    float _3824 = _1002 + 0.5;
    float _3826 = _2928 * _3776;
    int _3828 = _3810 * _3746;
    int _3830 = _3828 + _3780;
    float _3832 = fma(_994, _3544, _3820);
    int _3834 = _3816 * _3756;
    int _3836 = _3834 + _3812;
    float _3838 = fma(_3754, _3824, _3822);
    float _3840 = -_3136;
    float _3842 = _3826 * _3840;
    float _3844 = -_3138;
    float _3846 = _3826 * _3844;
    float _3848 = -_3116;
    float _3850 = _3826 * _3848;
    float _3852 = _3136 + _3160;
    float _3854 = float(_3830);
    float _3856 = -_3572;
    float _3858 = fma(_1002, _3856, _3838);
    float _3860 = fma(_3776, _3080, _3842);
    float _3862 = fma(_3776, _3082, _3846);
    float _3864 = fma(_3776, _3084, _3850);
    float _3866 = float(_3836);
    float _3868 = _3138 + _3164;
    float _3870 = _3116 + _3194;
    out.m_88.x = _3854;
    bool _3872 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3874 = isnan(_3658);
    bool _3876 = _3872 || _3874;
    bool _3878 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3880 = _3876 || _3878;
    float _3882 = -_2786;
    float _3884 = _2654 + _3882;
    float _3886 = -_2798;
    float _3888 = _2660 + _3886;
    out.m_90.x = _3860;
    out.m_90.y = _3862;
    out.m_90.z = _3864;
    float _3890 = -_2800;
    float _3892 = _2680 + _3890;
    out.m_88.w = _3866;
    out.m_92.x = _3858;
    out.m_92.y = _3832;
    float _3894 = as_type<float>(_3836);
    float _3896 = _3892;
    float _3898 = _3884;
    float _3900 = _3888;
    if (!_3880)
    {
        _3894 = 1.0;
    }
    float _3902 = _3894;
    out.m_94.x = _3852;
    out.m_94.y = _3868;
    out.m_94.z = _3870;
    bool _3904 = !_3880;
    float _3906 = _3902;
    if (!_3904)
    {
        bool _3908 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3910 = isnan(_3658);
        bool _3912 = _3908 || _3910;
        bool _3914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3916 = _3912 || _3914;
        if (!_3916)
        {
            float _3918 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3920 = _3658 + _3918;
            float _3922 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3924 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3922;
            float _3926 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3928 = _3926 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3930 = 1.0 / _3924;
            float _3932 = _3920 * _3930;
            float _3934 = fma(_3932, _3928, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3906 = _3934;
            _3936 = true;
        }
        else
        {
            bool _3938 = _3658 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3940 = isnan(_3658);
            bool _3942 = _3938 || _3940;
            bool _3944 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3946 = _3942 || _3944;
            if (!_3946)
            {
                float _3948 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3950 = _3658 + _3948;
                float _3952 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3954 = _3952 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3956 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3958 = _3956 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3960 = 1.0 / _3954;
                float _3962 = _3950 * _3960;
                float _3964 = fma(_3962, _3958, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3906 = _3964;
                _3936 = true;
            }
            else
            {
                _3906 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3936 = false;
    float _3966 = _3906;
    float _3968 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3970 = _3518 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3974 = _3522 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3978 = _3578 + _3976;
    float _3980 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3982 = fma(_3970, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3984 = fma(_3974, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3986 = fma(_3978, _3966, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3988 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3980);
    float _3990 = -_3884;
    float _3992 = _3990 + _3982;
    float _3994 = -_3888;
    float _3996 = _3994 + _3984;
    float _3998 = -_3892;
    float _4000 = _3998 + _3986;
    float _4002 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3988);
    float _4004 = _3992 * _3992;
    float _4006 = _4002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4008 = fma(_3996, _3996, _4004);
    float _4010 = 1.0 / _4006;
    float _4012 = fma(_4000, _4000, _4008);
    float _4014 = _3884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4016 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4018 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4020 = _4016 || _4018;
    bool _4022 = isnan(0.5);
    bool _4024 = _4020 || _4022;
    float _4026 = fma(_3888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4014);
    float _4028 = sqrt(_4012);
    float _4030 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4026);
    float _4032 = _4030 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4034 = _4032 + _4006;
    float _4036 = _4034 * _4010;
    float _4038 = _4036 * 0.5;
    bool _4040 = _4028 > 0.0;
    bool _4042 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4044 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4046 = _4042 || _4044;
    bool _4048 = isnan(0.5);
    bool _4050 = _4046 || _4048;
    float _4052 = _4010;
    float _4054 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4056 = _4006;
    float _4058 = _4034;
    if (!_4040)
    {
        _4052 = _3984;
    }
    float _4060 = _4052;
    float _4062 = _4060;
    if (!_4040)
    {
        _4054 = _3982;
    }
    float _4064 = _4054;
    float _4066 = _4064;
    float _4068 = _4064;
    if (!_4040)
    {
        _4056 = _3986;
    }
    float _4070 = _4056;
    bool _4072 = !_4040;
    float _4074 = _4070;
    float _4076 = _4070;
    if (!_4072)
    {
        float _4078 = _239 * _239;
        float _4080 = rsqrt(_4012);
        float _4082 = fma(_235, _235, _4078);
        float _4084 = fma(_241, _241, _4082);
        float _4086 = sqrt(_4084);
        float _4088 = _3996 * _4080;
        float _4090 = _3992 * _4080;
        float _4092 = _4000 * _4080;
        bool _4094 = _4086 > 0.0;
        float _4096 = _4086;
        _3338 = _4088;
        _4058 = _4080;
        if (!_4094)
        {
            _4096 = _3984;
        }
        float _4098 = _4096;
        _4062 = _4098;
        if (!_4094)
        {
            _4066 = _3982;
        }
        float _4100 = _4066;
        _4068 = _4100;
        if (!_4094)
        {
            _4074 = _3986;
        }
        float _4102 = _4074;
        bool _4104 = !_4094;
        _4076 = _4102;
        if (!_4104)
        {
            float _4106 = rsqrt(_4084);
            float _4108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4110 = _239 * _4106;
            float _4112 = _235 * _4106;
            float _4114 = _4090 * _4110;
            float _4116 = _241 * _4106;
            float _4118 = fma(_4088, _4112, _4114);
            float _4120 = _4108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4122 = fma(_4092, _4116, _4118);
            float _4124 = _4122 * _4120;
            float _4126 = fma(_235, _4124, _3984);
            float _4128 = fma(_239, _4124, _3982);
            float _4130 = fma(_241, _4124, _3986);
            _4062 = _4126;
            _4068 = _4128;
            _4076 = _4130;
            _4058 = _4122;
        }
    }
    float _4132 = _4062;
    float _4134 = _4068;
    float _4136 = _4076;
    float _4138 = _3338;
    float _4140 = _4058;
    float _4142 = _4140;
    float _4144 = _4134;
    float _4146 = _4132;
    float _4148 = _4136;
    float _4150 = _4138;
    if (_4050)
    {
        _4142 = 1.0;
    }
    float _4152 = _4142;
    float _4154 = _4152;
    if (!_4024)
    {
        float _4156 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4158 = _3884 + _4156;
        float _4160 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4162 = _3888 + _4160;
        float _4164 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4166 = _4158 * _4158;
        float _4168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4170 = _3892 + _4168;
        float _4172 = fma(_4162, _4162, _4166);
        float _4174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4176 = fma(_4170, _4170, _4172);
        float _4178 = sqrt(_4176);
        float _4180 = _4164 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4182 = precise::min(_4178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4184 = _4182 * _4174;
        float _4186 = -_3888;
        float _4188 = _4186 + _4132;
        float _4190 = _4180 * _4184;
        float _4192 = -_3884;
        float _4194 = _4192 + _4134;
        float _4196 = -_3892;
        float _4198 = _4196 + _4136;
        float _4200 = fma(_4188, _4190, _3888);
        float _4202 = fma(_4194, _4190, _3884);
        float _4204 = fma(_4198, _4190, _3892);
        _4144 = _4202;
        _4146 = _4200;
        _4148 = _4204;
    }
    float _4206 = _4144;
    float _4208 = _4146;
    float _4210 = _4148;
    if (!_4050)
    {
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4214 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4216 = fma(_4038, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4214);
        float _4218 = _4212 * 0.15915493667125701904296875;
        float _4220 = _4218 * 6.283185482025146484375;
        float _4222 = cos(_4220);
        float _4224 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4226 = _4224 * 0.15915493667125701904296875;
        float _4228 = _4218 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = 1.0 / _4222;
        float _4234 = _4226 * 6.283185482025146484375;
        float _4236 = cos(_4234);
        float _4238 = _4230 * _4232;
        float _4240 = 1.0 / _4216;
        float _4242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4242;
        float _4246 = _4236 * _4238;
        float _4248 = _4226 * 6.283185482025146484375;
        float _4250 = sin(_4248);
        float _4252 = 1.0 / _4246;
        float _4254 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4256 = _4240 * _4254;
        float _4258 = 1.0 / _4244;
        float _4260 = _4250 * _4252;
        float _4262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4264 = fma(_4260, _4256, _4262);
        float _4266 = _4264 * _4258;
        float _4268 = precise::clamp(_4266, 0.0, 1.0);
        _4154 = _4268;
    }
    float _4270 = _4154;
    float _4272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4274 = _4206 + _4272;
    float _4276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4278 = _4208 + _4276;
    float _4280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4282 = _4210 + _4280;
    float _4284 = _4274 * _4274;
    float _4286 = fma(_4278, _4278, _4284);
    float _4288 = fma(_4282, _4282, _4286);
    float _4290 = rsqrt(_4288);
    float _4292 = _4290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4294 = _4278 * _4292;
    float _4296 = _4282 * _4292;
    float _4298 = _4294 * _4294;
    float _4300 = _4296 * _4296;
    float _4302 = _4298 + _4300;
    float _4304 = sqrt(_4302);
    bool _4306 = _4304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4310 = _4304 + _4308;
    float _4312 = _4282;
    float _4314 = _4302;
    float _4316 = _4310;
    float _4318 = _4274;
    if (_4306)
    {
        float _4320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4312 = _4320;
    }
    float _4322 = _4312;
    if (_4306)
    {
        float _4324 = rsqrt(_4302);
        _4314 = _4324;
    }
    float _4326 = _4314;
    float _4328 = _4326;
    if (_4306)
    {
        float _4330 = _4310 * _4322;
        _4316 = _4330;
    }
    float _4332 = _4316;
    if (_4306)
    {
        float _4334 = _4332 * 0.15915493667125701904296875;
        _4150 = _4334;
    }
    float _4336 = _4150;
    float _4338 = _4290;
    float _4340 = _4336;
    if (_4306)
    {
        float _4342 = _4336 * 6.283185482025146484375;
        float _4344 = sin(_4342);
        _4338 = _4344;
    }
    float _4346 = _4338;
    float _4348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4350 = precise::max(0.0, _4348);
    float _4352 = _4284;
    float _4354 = _4350;
    float _4356 = _4348;
    if (_4306)
    {
        float _4358 = _4336 * 6.283185482025146484375;
        float _4360 = cos(_4358);
        _4352 = _4360;
    }
    float _4362 = _4352;
    float _4364 = -_4292;
    float _4366 = -_4350;
    float _4368 = fma(_4274, _4364, _4366);
    if (!_4306)
    {
        _4318 = _4296;
    }
    float _4370 = _4318;
    float _4372 = _4370;
    if (_4306)
    {
        float _4374 = _4368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4354 = _4374;
    }
    float _4376 = _4354;
    float _4378 = _4376;
    float _4380 = _4346;
    if (_4306)
    {
        float _4382 = fma(_4346, _4376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4378 = _4382;
    }
    float _4384 = _4378;
    float _4386 = _4384;
    if (!_4306)
    {
        _4380 = _4294;
    }
    float _4388 = _4380;
    float _4390 = _4388;
    float _4392 = _4362;
    if (_4306)
    {
        float _4394 = _4362 + (-1.0);
        _4356 = _4394;
    }
    float _4396 = _4356;
    if (_4306)
    {
        float _4398 = _4326 * _4384;
        _3340 = _4398;
    }
    float _4400 = _3340;
    if (!_4306)
    {
        _4386 = _4368;
    }
    float _4402 = _4386;
    float _4404 = _4402;
    if (_4306)
    {
        float _4406 = _4396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4406;
    }
    float _4408 = _4340;
    if (_4306)
    {
        float _4410 = _4294 * _4400;
        _4390 = _4410;
    }
    float _4412 = _4390;
    if (!_4306)
    {
        _4328 = _4298;
    }
    float _4414 = _4328;
    float _4416 = _4414;
    if (_4306)
    {
        float _4418 = _4296 * _4400;
        _4372 = _4418;
    }
    float _4420 = _4372;
    if (_4306)
    {
        float _4422 = fma(_4368, _4362, _4408);
        _4404 = _4422;
    }
    float _4424 = _4404;
    if (_4306)
    {
        float _4426 = _4412 * _4412;
        _4416 = _4426;
    }
    float _4428 = _4416;
    if (!_4306)
    {
        _4392 = _4300;
    }
    float _4430 = _4392;
    float _4432 = _4430;
    if (_4306)
    {
        float _4434 = _4420 * _4420;
        _4432 = _4434;
    }
    float _4436 = _4432;
    float _4438 = sqrt(_4288);
    float _4440 = fma(_4424, _4424, _4428);
    float _4442 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4444 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4446 = _4440 + _4436;
    float _4448 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4442);
    float _4450 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4452 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4444);
    float _4454 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4448);
    float _4456 = rsqrt(_4446);
    float _4458 = _4206 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4460 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4450);
    float _4462 = _4454 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4464 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4466 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4468 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4466);
    float _4470 = precise::clamp(_4468, 0.0, 1.0);
    float _4472 = fma(_4208, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4458);
    float _4474 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4460);
    float _4476 = _4462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4478 = -_4470;
    float _4480 = _4478 + 1.0;
    float _4482 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4472);
    float _4484 = _4474 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4486 = -_4476;
    float _4488 = fma(_4486, _4464, 1.0);
    float _4490 = abs(_4480);
    float _4492 = log2(_4490);
    float _4494 = _4482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4496 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4498 = _4456 * _4412;
    float _4500 = _4456 * _4424;
    float _4502 = fma(_4210, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4452);
    float _4504 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4496);
    float _4506 = _4498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4508 = _4456 * _4420;
    float _4510 = _4502 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4512 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4504);
    float _4514 = -_4506;
    float _4516 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4514);
    float _4518 = log2(_4488);
    float _4520 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4522 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4512);
    float _4524 = -_4508;
    float _4526 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4516);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4530 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4532 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4520);
    float _4534 = fma(_4526, -0.5, 0.5);
    float _4536 = 1.0 / _4522;
    float _4538 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4530);
    float _4540 = fma(_4526, 0.5, 0.5);
    float _4542 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4532);
    float _4544 = _4500 + 1.0;
    float _4546 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4538);
    float _4548 = fma(_4540, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4550 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4542);
    float _4552 = exp2(_4528);
    float _4554 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4546);
    float _4556 = fma(_4540, _4548, -0.212114393711090087890625);
    float _4558 = _4518 * 0.693147182464599609375;
    float _4560 = fma(_4540, _4556, 1.570728778839111328125);
    float _4562 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4564 = sqrt(_4534);
    float _4566 = _4554 * _4536;
    float _4568 = _4550 * _4536;
    float _4570 = fma(_4566, 0.5, 0.5);
    float _4572 = fma(_4568, -0.5, 0.5);
    float _4574 = -_4500;
    float _4576 = fma(_4552, _4544, _4574);
    float3 _11660 = float3(_4570, _4572, _4562);
    float _4578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11660, float3(0.0), isnan(_11660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11660, float3(0.0), isnan(_11660)), level(0.0)).x;
    float3 _11671 = float3(_4570, _4572, _4562);
    float4 _4581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11671, float3(0.0), isnan(_11671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11671, float3(0.0), isnan(_11671)), level(0.0)).xyzw;
    float _4583 = _4581.x;
    float _4585 = _4581.y;
    float _4587 = _4581.z;
    float _4589 = _4581.w;
    float _4591 = fma(_4576, 0.5, 0.5);
    float _4593 = _4564 * 0.636619746685028076171875;
    float _4595 = -_4560;
    float _4597 = fma(_4593, _4595, 1.0);
    float2 _11698 = float2(_4597, _4591);
    float3 _4601 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11698, float2(0.0), isnan(_11698)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11698, float2(0.0), isnan(_11698)), level(0.0)).xyz;
    float _4603 = _4601.x;
    float _4605 = _4601.y;
    float _4607 = _4601.z;
    float _4609 = _4492 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4611 = _4484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4613 = _4522 * 0.5;
    float _4615 = _4554 + _4522;
    out.m_96.x = _4208;
    out.m_96.y = _4206;
    out.m_96.z = _4210;
    float _4617 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4611);
    float _4619 = exp2(_4609);
    bool _4621 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4623 = isnan(_4438);
    bool _4625 = _4621 || _4623;
    bool _4627 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4629 = _4625 || _4627;
    float _4631 = fma(_4462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4617);
    float _4633 = fma(_4550, -0.5, _4613);
    out.m_98.x = _3888;
    out.m_98.y = _3884;
    out.m_98.z = _3892;
    float _4635 = fma(_4510, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4631);
    float _4637 = _4635 + _4522;
    float _4639 = _4615 * 0.5;
    out.gl_Position.x = _4554;
    out.gl_Position.y = _4550;
    out.gl_Position.z = _4635;
    out.gl_Position.w = _4522;
    float _4641 = _4615;
    float _4643 = _4550;
    float _4645 = _4554;
    if (!_4629)
    {
        _4641 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4647 = _4641;
    float _4649 = _4637 * 0.5;
    float _4651 = -_4619;
    float _4653 = _4651 + 1.0;
    float _4655 = _4647;
    float _4657 = _4647;
    if (!_4629)
    {
        _3896 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4659 = _3896;
    float _4661 = _4659;
    float _4663 = _4659;
    if (!_4629)
    {
        _3898 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4665 = _3898;
    float _4667 = _4653 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_100.x = _4639;
    out.m_100.y = _4633;
    out.m_100.z = _4649;
    out.m_100.w = _4522;
    float _4669 = _4665;
    float _4671 = _4665;
    if (!_4629)
    {
        _3900 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4673 = _3900;
    float _4675 = -_4667;
    float _4677 = _4675 + 1.0;
    float _4679 = _4270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4681 = _4673;
    float _4683 = _4673;
    if (!_4629)
    {
        _4643 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4685 = _4643;
    float _4687 = _4685;
    float _4689 = _4685;
    if (!_4629)
    {
        _4645 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4691 = _4645;
    float _4693 = _4667 * _4578;
    float _4695 = _4589 * _4677;
    float _4697 = _4589 * _4693;
    float _4699 = _4607 * _4693;
    float _4701 = fma(_4603, _4697, _4583);
    float _4703 = fma(_4605, _4697, _4585);
    float _4705 = fma(_4589, _4699, _4587);
    out.m_102.x = _4701;
    out.m_102.y = _4703;
    out.m_102.z = _4705;
    out.m_102.w = _4695;
    bool _4707 = !_4629;
    float _4709 = _4691;
    float _4711 = _4691;
    if (!_4707)
    {
        bool _4713 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4715 = isnan(_4438);
        bool _4717 = _4713 || _4715;
        bool _4719 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4721 = _4717 || _4719;
        if (!_4721)
        {
            float _4723 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4725 = _4438 + _4723;
            float _4727 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4729 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4727;
            float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4733 = _4731 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4735 = 1.0 / _4729;
            float _4737 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4739 = _4737 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4741 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4743 = _4741 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4745 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4747 = _4745 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4749 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4751 = _4749 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4753 = _4725 * _4735;
            float _4755 = precise::clamp(_4753, 0.0, 1.0);
            float _4757 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4759 = _4757 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4761 = fma(_4755, _4733, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4763 = fma(_4755, _4759, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4765 = fma(_4755, _4739, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4767 = fma(_4755, _4743, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4769 = fma(_4755, _4747, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4771 = fma(_4755, _4751, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4711 = _4765;
            _4671 = _4769;
            _4689 = _4761;
            _4663 = _4767;
            _4657 = _4763;
            _4683 = _4771;
            _4773 = true;
        }
        else
        {
            bool _4775 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4777 = isnan(_4438);
            bool _4779 = _4775 || _4777;
            bool _4781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4783 = _4779 || _4781;
            if (!_4783)
            {
                _4687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4785 = _4687;
            _4689 = _4785;
            if (!_4783)
            {
                _4709 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4787 = _4709;
            _4711 = _4787;
            if (!_4783)
            {
                _4655 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4789 = _4655;
            _4657 = _4789;
            if (!_4783)
            {
                _4661 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4791 = _4661;
            _4663 = _4791;
            if (!_4783)
            {
                _4669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4793 = _4669;
            _4671 = _4793;
            if (!_4783)
            {
                _4681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4795 = _4681;
            bool _4797 = !_4783;
            _4683 = _4795;
            if (!_4797)
            {
                bool _4799 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4801 = isnan(_4438);
                bool _4803 = _4799 || _4801;
                bool _4805 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4807 = _4803 || _4805;
                if (!_4807)
                {
                    float _4809 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4811 = _4438 + _4809;
                    float _4813 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4815 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4813;
                    float _4817 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4819 = _4817 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4821 = 1.0 / _4815;
                    float _4823 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4825 = _4823 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4827 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4829 = _4827 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4831 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4833 = _4831 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4835 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4837 = _4835 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4839 = _4811 * _4821;
                    float _4841 = precise::clamp(_4839, 0.0, 1.0);
                    float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4847 = fma(_4841, _4819, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4849 = fma(_4841, _4845, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4851 = fma(_4841, _4825, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4853 = fma(_4841, _4829, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4855 = fma(_4841, _4833, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4857 = fma(_4841, _4837, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4711 = _4851;
                    _4671 = _4855;
                    _4689 = _4847;
                    _4663 = _4853;
                    _4657 = _4849;
                    _4683 = _4857;
                    _4773 = true;
                }
                else
                {
                    _4711 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4663 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4657 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4773 = false;
    float _4859 = _4711;
    float _4861 = _4671;
    float _4863 = _4689;
    float _4865 = _4663;
    float _4867 = _4657;
    float _4869 = _4683;
    float _4871 = _4679 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4873 = fma(_3868, -0.5, 0.5);
    float _4875 = precise::clamp(_4873, 0.0, 1.0);
    float _4877 = -_4859;
    float _4879 = _4877 + _4861;
    float _4881 = -_4863;
    float _4883 = _4881 + _4865;
    out.m_104.x = 0.0;
    float _4885 = fma(_4875, _4879, _4859);
    float _4887 = -_4867;
    float _4889 = _4887 + _4869;
    float _4891 = fma(_4875, _4883, _4863);
    float _4893 = _4885 * 0.586610972881317138671875;
    bool _4895 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4897 = fma(_4875, _4889, _4867);
    out.m_53.x = _4871;
    float _4899 = fma(_4891, 0.298911988735198974609375, _4893);
    bool _4901 = _4270 > 0.0;
    bool _4903 = isnan(_4270);
    bool _4905 = _4901 || _4903;
    bool _4907 = isnan(0.0);
    bool _4909 = _4905 || _4907;
    float _4911 = fma(_4897, 0.114477999508380889892578125, _4899);
    float _4913 = -_4911;
    float _4915 = _4891 + _4913;
    float _4917 = -_4911;
    float _4919 = _4885 + _4917;
    float _4921 = -_4911;
    float _4923 = _4897 + _4921;
    float _4925 = fma(_4915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4927 = fma(_4919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    float _4929 = fma(_4923, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4911);
    bool _4931 = !_4895;
    if (!_4931)
    {
        float _4933 = -_4206;
        float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4937 = -_4208;
        float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4941 = -_4210;
        float _4943 = _4941 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4945 = _4935 * _4935;
        float _4947 = fma(_4939, _4939, _4945);
        float _4949 = fma(_4943, _4943, _4947);
        float _4951 = sqrt(_4949);
        float _4953 = rsqrt(_4949);
        float _4955 = -_4951;
        float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4959 = _4957 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4961 = precise::clamp(_4959, 0.0, 1.0);
        float _4963 = _4939 * _4953;
        float _4965 = _4935 * _4953;
        float _4967 = abs(_4961);
        float _4969 = log2(_4967);
        float _4971 = _4943 * _4953;
        float _4973 = _4963 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4975 = _3868 * _4965;
        float _4977 = -_4965;
        float _4979 = -_4973;
        float _4981 = fma(_4977, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4979);
        float _4983 = fma(_3852, _4963, _4975);
        float _4985 = -_4971;
        float _4987 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4981);
        float _4989 = fma(_3870, _4971, _4983);
        float _4991 = precise::clamp(_4989, 0.0, 1.0);
        float _4993 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4995 = _4987 + _4993;
        float _4997 = _4969 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4999 = _4995 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5001 = precise::clamp(_4999, 0.0, 1.0);
        float _5003 = exp2(_4997);
        float _5005 = _5003 * _5001;
        float _5007 = _4991 * _5005;
        float _5009 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5011 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5013 = _5007 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_104.x = _5009;
        out.m_104.y = _5011;
        out.m_104.z = _5013;
    }
    out.m_80.x = _4925;
    out.m_80.y = _4927;
    out.m_80.z = _4929;
    if (_4909)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _5015 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5015;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

