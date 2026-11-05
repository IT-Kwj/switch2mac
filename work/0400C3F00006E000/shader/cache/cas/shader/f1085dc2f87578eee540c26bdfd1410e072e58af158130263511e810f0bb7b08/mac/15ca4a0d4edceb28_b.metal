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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2390 = false;
    bool _549 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2689 = as_type<float>(_107);
        out.gl_Position.z = _2689;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_143);
        out.gl_Position.z = _2758;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = _145;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _229;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _147 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _175 = _269;
        _247 = _257;
    }
    float _271 = _175;
    float _273 = _247;
    float _275 = 0.0;
    float _277 = _273;
    if (!_159)
    {
        float _279 = _125 * _125;
        float _281 = _279 * 0.5;
        _275 = _281;
    }
    float _283 = _275;
    float _285 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _277 = _125;
    }
    float _291 = _277;
    float _293 = fma(_271, _161, _285);
    float _295 = fma(_271, _163, _287);
    float _297 = _291;
    if (!_159)
    {
        float _299 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _299;
    }
    float _301 = _249;
    bool _303 = !_159;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _125 * _309;
        float _319 = exp2(_317);
        float _321 = _315 * 0.693147182464599609375;
        float _323 = 1.0 / _321;
        float _325 = 1.0 / _313;
        float _327 = _319 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _323, _125);
        float _333 = _331 * _325;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_159;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _125 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_361, _163, _363);
    float _373 = fma(_295, _149, _169);
    float _375 = fma(_361, _161, _365);
    float _377 = fma(_271, _165, _289);
    float _379 = -_371;
    float _381 = _295 + _379;
    float _383 = fma(_361, _165, _369);
    float _385 = -_375;
    float _387 = _293 + _385;
    float _389 = fma(_293, _149, _167);
    float _391 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = -_383;
    float _399 = _377 + _397;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _407 = fma(_377, _149, _171);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    bool _415 = !_367;
    float _417 = _411;
    float _419 = _409;
    float _421 = _413;
    float _423 = _409;
    float _425 = _411;
    float _443;
    if (!_415)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    bool _455 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_453);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_453);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _453 + _487;
    float _491 = -_465;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _469;
    float _499 = _481 * _493;
    float _501 = -_481;
    float _503 = _501 + 1.0;
    float _505 = _485 * _497;
    float _507 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _507 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[115].x, _509);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[116].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _523;
    out.m_58.z = _525;
    out.m_58.w = _527;
    bool _529 = !_495;
    float _547;
    if (!_529)
    {
        float _531 = in.m_56.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_91);
        float _553 = 1.0 / _551;
        float _555 = _125 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = in.m_56.w;
    float _567 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _569 = log2(_567);
    float _571 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _573 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _577 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _579 = precise::max(_575, _577);
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _583 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _585 = _579 >= 16.0;
    float _587 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
    float _591 = _585 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _593 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _595 = _585 ? _583 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _597 = _125 * _569;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _601 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _603 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _593);
    float _605 = exp2(_597);
    float _607 = _563 * 2.0;
    float _609 = _559 * 2.0;
    float _611 = _561 * 2.0;
    float _613 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _617 = _563 + _559;
    float _619 = floor(_607);
    float _621 = -_599;
    float _623 = fma(_613, 2.0, _621);
    float _625 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _627 = _561 + _563;
    float _629 = _561 + _559;
    float _631 = _617 + (-1.0);
    float _633 = _627 + (-1.0);
    float _635 = floor(_609);
    float _637 = -_605;
    float _639 = _637 + 1.0;
    float _641 = _629 + (-1.0);
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _647 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _649 = _619 > 0.0;
    float _651 = floor(_611);
    bool _653 = _619 >= 0.0;
    bool _655 = isnan(_619);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    int _663 = _661 ? 0 : 1;
    bool _665 = _635 >= 0.0;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    int _675 = ~_663;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    bool _681 = _635 > 0.0;
    int _683 = _679;
    int _685 = as_type<int>(_639);
    if (!_649)
    {
        int _687 = ~_663;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    float _693 = abs(_591);
    bool _695 = _693 != 0.0;
    bool _697 = isnan(_693);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = _673 ? 0 : 1;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _717 = _715 != 0;
    float _719 = abs(_595);
    bool _721 = _719 == 0.0;
    bool _723 = !_703;
    bool _725 = _721 && _723;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    int _733 = _731;
    bool _735 = _681;
    if (!_681)
    {
        int _737 = ~_705;
        int _739 = _737 + 1;
        _733 = _739;
    }
    int _741 = _733;
    bool _743 = !_717;
    int _745 = _743 ? 0 : 1;
    bool _747 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _755 = _751 || _753;
    bool _757 = !_713;
    int _759 = _757 ? 0 : 1;
    bool _761 = _651 >= 0.0;
    bool _763 = isnan(_651);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    if (_725)
    {
        bool _771 = as_type<int>(_595) >= 0;
        _735 = _771;
    }
    bool _773 = _735;
    float _775 = _755 ? _639 : 0.0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    int _781 = _779 ? (-1) : 0;
    if (_725)
    {
        int _783 = _773 ? 0 : 1078530011;
        _685 = _783;
    }
    int _785 = _685;
    int _787 = _769 ? 0 : 1;
    bool _789 = !_709;
    int _791 = _789 ? 0 : 1;
    bool _793 = _565 > 0.5;
    float _795 = abs(_595);
    bool _797 = _795 == 0.0;
    int _799 = abs(_791);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _803 = 1.0 + _801;
    int _805 = _785;
    if (_725)
    {
        int _807 = int(0x80000000) & as_type<int>(_591);
        int _809 = _785 | _807;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    bool _819 = _651 > 0.0;
    float _821 = 1.0 / _803;
    float _823 = _775 * _821;
    bool _825 = !_703;
    bool _827 = _825 && _797;
    int _829 = _811;
    float _831 = as_type<float>(_811);
    if (!_827)
    {
        float _833 = abs(_591);
        bool _835 = _833 != as_type<float>(0x7f800000u /* inf */);
        bool _837 = isnan(_833);
        bool _839 = _835 || _837;
        bool _841 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _843 = _839 || _841;
        float _845 = abs(_595);
        bool _847 = _845 == as_type<float>(0x7f800000u /* inf */);
        bool _849 = !_843;
        bool _851 = _847 && _849;
        if (_851)
        {
            _829 = 1075235812;
        }
        int _853 = _829;
        int _855 = _853;
        if (_851)
        {
            bool _857 = as_type<int>(_595) >= 0;
            _781 = _857 ? (-1) : 0;
        }
        int _859 = _781;
        if (_851)
        {
            int _861 = ~_859;
            int _863 = (_861 != 0) ? _853 : 1061752795;
            _855 = _863;
        }
        int _865 = _855;
        float _867 = as_type<float>(_865);
        if (_851)
        {
            int _869 = int(0x80000000) & as_type<int>(_591);
            int _871 = _865 | _869;
            _867 = as_type<float>(_871);
        }
        float _873 = _867;
        float _875 = abs(_595);
        bool _877 = _875 == as_type<float>(0x7f800000u /* inf */);
        bool _879 = !_843;
        bool _881 = _879 && _877;
        _831 = _873;
        if (!_881)
        {
            float _883 = abs(_591);
            float _885 = abs(_595);
            float _887 = precise::max(_883, _885);
            float _889 = abs(_591);
            float _891 = abs(_595);
            float _893 = precise::min(_889, _891);
            float _895 = 1.0 / _887;
            float _897 = abs(_591);
            float _899 = abs(_595);
            bool _901 = _897 > _899;
            float _903 = _893 * _895;
            float _905 = abs(_591);
            float _907 = abs(_595);
            float _909 = _905 + _907;
            float _911 = _903 * _903;
            float _913 = _911 + 11.33538818359375;
            float _915 = fma(_911, _913, 28.84246826171875);
            float _917 = fma(_911, _915, 19.6966705322265625);
            float _919 = fma(_911, -0.82336294651031494140625, -5.674867153167724609375);
            float _921 = fma(_911, _919, -6.565555095672607421875);
            float _923 = 1.0 / _917;
            float _925 = _911 * _921;
            float _927 = _903 * _925;
            float _929 = fma(_927, _923, _903);
            float _931 = _929;
            _831 = _909;
            if (_901)
            {
                float _933 = -_929;
                float _935 = _933 + 1.57079637050628662109375;
                _931 = _935;
            }
            float _937 = _931;
            bool _939 = as_type<int>(_595) >= 0;
            int _941 = as_type<int>(_591) & int(0x80000000);
            int _943 = as_type<int>(_937);
            if (!_939)
            {
                float _945 = -_937;
                float _947 = _945 + 3.1415927410125732421875;
                _943 = as_type<int>(_947);
            }
            int _949 = _943;
            bool _951 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _953 = isnan(_909);
            bool _955 = _951 || _953;
            bool _957 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _959 = _955 || _957;
            if (!_959)
            {
                int _961 = _941 | _949;
                _831 = as_type<float>(_961);
            }
        }
    }
    float _963 = _831;
    float _965 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _647 + _967;
    float _971 = float(_799);
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _975 = float(_691);
    float _977 = _615 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _979 = abs(_759);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _965 + _981;
    float _985 = _969 * _969;
    float _987 = _971 * _975;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = fma(_983, _983, _985);
    float _995 = float(_741);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _999 = abs(_745);
    float _1001 = fma(_991, _991, _993);
    float _1003 = _987 * (-2.0);
    int _1005 = ~_787;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1013 = _557 + _1011;
    int _1015 = _1009;
    if (!_819)
    {
        int _1017 = ~_787;
        int _1019 = _1017 + 1;
        _1015 = _1019;
    }
    int _1021 = _1015;
    float _1023 = fma(_813, _1003, _813);
    float _1025 = rsqrt(_1001);
    float _1027 = _559 + (-0.5);
    float _1029 = float(_1021);
    float _1031 = -_125;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _1035 = float(_999);
    float _1037 = float(_979);
    bool _1039 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1041 = isnan(1.0);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 * _1029;
    float _1051 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1053 = _1037 * _995;
    bool _1055 = !_1047;
    float _1057 = _1055 ? _125 : _823;
    float _1059 = _1049 * (-2.0);
    float _1061 = _969 * _1025;
    float _1063 = _983 * _1025;
    float _1065 = fma(_645, _1059, _645);
    float _1067 = fma(_1057, _1023, _1051);
    float _1069 = -_1061;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1073 = _563 + (-0.5);
    float _1075 = _1053 * (-2.0);
    float _1077 = -_1063;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1081 = _1071 * _1071;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1087 = _1067 * 0.15915493667125701904296875;
    float _1089 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1091 = fma(_1079, _1079, _1081);
    float _1093 = fma(_643, _1075, _643);
    bool _1095 = _559 > 0.5;
    float _1097 = _991 * _1025;
    float _1099 = in.m_54.x;
    float _1101 = in.m_54.y;
    float _1103 = fma(_1057, _1065, _1089);
    float _1105 = -_199;
    int _1107 = _1095 ? as_type<int>(_1105) : as_type<int>(_199);
    float _1109 = -_1097;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    bool _1113 = _563 > 0.5;
    float _1115 = _561 + (-0.5);
    float _1117 = fma(_1111, _1111, _1091);
    float _1119 = _1087 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1127 = fma(_1057, _1093, _1123);
    float _1129 = _1103 * 0.15915493667125701904296875;
    float _1131 = sqrt(_1117);
    float _1133 = _1127 + _963;
    float _1135 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1145 = fma(_1135, -2.0, _1137);
    float _1147 = _1087 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1153 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1157 = _1155 != 0;
    float _1159 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1143);
    bool _1161 = _561 > 0.5;
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1165 = !_1157;
    float _1167 = _1165 ? _199 : as_type<float>(_1107);
    float _1169 = 1.0 / _1085;
    float _1171 = _1133 * 0.15915493667125701904296875;
    float _1173 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1125);
    float _1175 = _1025 * _1131;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1179;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1185 = _1175 * _1163;
    float _1187 = _1129 * 6.283185482025146484375;
    float _1189 = cos(_1187);
    float _1191 = _1175 * _1177;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _557 + _1193;
    float _1197 = _1185 * _1183;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1191 * _973;
    bool _1205 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1207 = isnan(_557);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1145);
    float _1219 = _1171 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1181 * _1169;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    bool _1233 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1235 = isnan(_557);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1223, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1247 = -_203;
    int _1249 = _1161 ? as_type<int>(_1247) : as_type<int>(_203);
    float _1251 = _1171 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1121 * _1189;
    float _1257 = _1243 * _1231;
    float _1259 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    float _1265 = _1255 * _1203;
    float _1267 = _1129 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1149 * _1221;
    bool _1273 = !_1263;
    float _1275 = _1273 ? _203 : as_type<float>(_1249);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1141;
    float _1283 = _1121 * _1253;
    float _1285 = _1121 * _1221;
    float _1287 = _1149 * _1253;
    float _1289 = _1253 * _1189;
    float _1291 = _1149 * _1189;
    float _1293 = -_1271;
    float _1295 = fma(_1269, _1283, _1293);
    float _1297 = -_1203;
    float _1299 = _1269 * _1297;
    float _1301 = fma(_1269, _1285, _1287);
    float _1303 = fma(_1269, _1287, _1285);
    float _1305 = fma(_1295, _1197, _1265);
    float _1307 = _1221 * _1189;
    float _1309 = fma(_1289, _1197, _1299);
    float _1311 = _1291 * _1203;
    float _1313 = _1227 * _1281;
    bool _1315 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1317 = isnan(_557);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1323 = _1319 || _1321;
    float _1325 = float(_1323);
    float _1327 = fma(_1301, _1201, _1305);
    float _1329 = fma(_1307, _1201, _1309);
    float _1331 = fma(_1313, _1013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1333 = _1245 * _1257;
    float _1335 = -_1325;
    float _1337 = _1335 + 1.0;
    float _1339 = _977 + _1327;
    float _1341 = -_1283;
    float _1343 = fma(_1269, _1271, _1341);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = _1215 * _1337;
    float _1349 = _965 + _1329;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1339 + _1351;
    float _1355 = fma(_1303, _1197, _1311);
    float _1357 = -_1243;
    float _1359 = _1357 + 1.0;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * _1353;
    float _1367 = -_203;
    int _1369 = _793 ? as_type<int>(_1367) : as_type<int>(_203);
    float _1371 = fma(_1343, _1201, _1355);
    float _1373 = -_199;
    int _1375 = _1113 ? as_type<int>(_1373) : as_type<int>(_199);
    float _1377 = fma(_1363, _1363, _1365);
    float _1379 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1333);
    float _1381 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1383 = !_817;
    float _1385 = _1383 ? _203 : as_type<float>(_1369);
    float _1387 = sqrt(_1377);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = _1275 + (-0.5);
    bool _1393 = !_1279;
    float _1395 = _1393 ? _199 : as_type<float>(_1375);
    float _1397 = _1167 + 0.5;
    float _1399 = fma(_1331, _1347, _1379);
    float _1401 = -_1389;
    float _1403 = -_1217;
    float _1405 = fma(_1401, _1391, _1403);
    float _1407 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = -_1381;
    float _1413 = _1269 * _1411;
    float _1415 = fma(_1259, _1397, _1033);
    float _1417 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1399);
    float _1419 = _1291 * _1381;
    float _1421 = _647 + _1371;
    float _1423 = _1255 * _1381;
    float _1425 = fma(_1289, _1407, _1413);
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1429 = !_1427;
    float _1431 = _1421;
    float _1433 = _1349;
    float _1435 = _1339;
    float _1437 = _1097;
    if (!_1429)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1443 = _1387 + _1441;
        float _1445 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1447 = rsqrt(_1377);
        float _1449 = _1443 * _1439;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1455 + (-1.0);
        float _1463 = fma(_1459, _1445, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1447 * _1463;
        float _1469 = fma(_1421, _1455, _1465);
        float _1471 = fma(_1363, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1473 = fma(_1353, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1431 = _1469;
        _1433 = _1471;
        _1435 = _1473;
    }
    float _1475 = _1431;
    float _1477 = _1433;
    float _1479 = _1435;
    float _1481 = -_647;
    float _1483 = _1481 + _1475;
    float _1485 = fma(_1295, _1407, _1423);
    float _1487 = -_965;
    float _1489 = _1487 + _1477;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1303, _1407, _1419);
    float _1497 = -_977;
    float _1499 = _1497 + _1479;
    float _1501 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    float _1503 = fma(_1489, _1489, _1493);
    float _1505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1159);
    float _1507 = _1395 + 0.5;
    float _1509 = -_1385;
    float _1511 = _1509 + 0.5;
    float _1513 = fma(_1499, _1499, _1503);
    float _1515 = -_1501;
    float _1517 = _1515 + 1.0;
    float _1519 = -_1505;
    float _1521 = _1519 + 1.0;
    float _1523 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1525 = sqrt(_1513);
    float _1527 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = -_1517;
    float _1531 = fma(_1167, _1529, _1415);
    float _1533 = fma(_1275, _1521, _1405);
    float _1535 = _1523 * _1409;
    float _1537 = _1527 * _1491;
    float _1539 = _1307 + _1425;
    float _1541 = _1343 + _1495;
    float _1543 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1545 = _1301 + _1485;
    out.m_60.x = _1531;
    out.m_60.y = _1533;
    out.m_60.z = _1535;
    out.m_60.w = _1537;
    out.m_62.w = _1543;
    bool _1547 = _1525 > 0.0;
    out.m_64.x = _1539;
    out.m_64.y = _1541;
    out.m_64.z = _1545;
    bool _1549 = !_1547;
    float _1551 = _1525;
    float _1553 = _1535;
    float _1555 = _1475;
    float _1557 = _1477;
    float _1559 = _1479;
    if (!_1549)
    {
        bool _1561 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1563 = _1531;
        if (_1561)
        {
            float _1565 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1563 = _1565;
        }
        float _1567 = _1563;
        float _1569 = _1567;
        if (_1561)
        {
            float _1571 = _409 * _1567;
            _1551 = _1571;
        }
        float _1573 = _1551;
        float _1575 = _1573;
        if (_1561)
        {
            float _1577 = _411 * _1567;
            _1553 = _1577;
        }
        float _1579 = _1553;
        float _1581 = _1579;
        if (_1561)
        {
            float _1583 = _413 * _1567;
            _1569 = _1583;
        }
        float _1585 = _1569;
        float _1587 = _1585;
        float _1589 = _1585;
        if (!_1561)
        {
            float _1591 = _125 + 1.0;
            float _1593 = _1591;
            if (!_159)
            {
                float _1595 = _1591 * _1591;
                float _1597 = _1595 * 0.5;
                _1587 = _1597;
            }
            float _1599 = _1587;
            float _1601 = _1599;
            if (!_159)
            {
                float _1603 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1601 = _1603;
            }
            float _1605 = _1601;
            bool _1607 = !_159;
            float _1609 = _1605;
            if (!_1607)
            {
                float _1611 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1613 = log2(_1611);
                float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1617 = _1615 + 1.0;
                float _1619 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1621 = _1613 * _1591;
                float _1623 = 1.0 / _1617;
                float _1625 = _1619 * 0.693147182464599609375;
                float _1627 = exp2(_1621);
                float _1629 = 1.0 / _1625;
                float _1631 = _1627 + (-1.0);
                float _1633 = -_1631;
                float _1635 = fma(_1633, _1629, _1591);
                float _1637 = _1635 * _1623;
                float _1639 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1609 = _1639;
            }
            float _1641 = _1609;
            float _1643 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1645 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1647 = !_159;
            if (!_1647)
            {
                float _1649 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1651 = log2(_1649);
                float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1655 = _1653 + 1.0;
                float _1657 = 1.0 / _1655;
                float _1659 = _1651 * _1591;
                float _1661 = exp2(_1659);
                float _1663 = -_1661;
                float _1665 = _1663 + 1.0;
                float _1667 = _1665 * _1657;
                _1593 = _1667;
            }
            float _1669 = _1593;
            float _1671 = fma(_1669, _163, _1645);
            float _1673 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1675 = fma(_1669, _161, _1643);
            float _1677 = -_371;
            float _1679 = _1677 + _1671;
            float _1681 = fma(_1669, _165, _1673);
            float _1683 = -_375;
            float _1685 = _1683 + _1675;
            float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1689 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1691 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1693 = -_383;
            float _1695 = _1693 + _1681;
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1687);
            float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1689);
            float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
            float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1697);
            float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1699);
            float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1701);
            _417 = _1705;
            _419 = _1703;
            _421 = _1707;
            _1575 = _1703;
            _1581 = _1705;
            _1589 = _1707;
        }
        float _1709 = _417;
        float _1711 = _419;
        float _1713 = _421;
        float _1715 = _1575;
        float _1717 = _1581;
        float _1719 = _1589;
        float _1721 = _1709 * _1709;
        float _1723 = rsqrt(_1513);
        float _1725 = fma(_1711, _1711, _1721);
        float _1727 = fma(_1713, _1713, _1725);
        float _1729 = sqrt(_1727);
        float _1731 = _1489 * _1723;
        float _1733 = _1483 * _1723;
        float _1735 = _1499 * _1723;
        bool _1737 = _1729 > 0.0;
        bool _1739 = !_1737;
        _423 = _1711;
        _425 = _1709;
        if (!_1739)
        {
            float _1741 = rsqrt(_1727);
            float _1743 = _1741 * _1709;
            float _1745 = _1741 * _1711;
            float _1747 = _1741 * _1713;
            float _1749 = _1733 * _1743;
            float _1751 = fma(_1731, _1745, _1749);
            float _1753 = fma(_1735, _1747, _1751);
            float _1755 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1757 = fma(_1715, _1755, _1477);
            float _1759 = fma(_1717, _1755, _1475);
            float _1761 = fma(_1719, _1755, _1479);
            _1555 = _1759;
            _1557 = _1757;
            _1559 = _1761;
        }
    }
    float _1763 = _1555;
    float _1765 = _1557;
    float _1767 = _1559;
    float _1769 = _423;
    float _1771 = _425;
    float _1773 = -_1061;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1763);
    float _1777 = -_1063;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1781 = -_1097;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1767);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1779 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * _1787;
    float _1799 = fma(_1791, _1791, _1797);
    float _1801 = fma(_1795, _1795, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1809 = _1791 * _1807;
    float _1811 = _1795 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 * _1811;
    float _1817 = _1813 + _1815;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1825 = _1819 + _1823;
    float _1827 = _1803;
    float _1829 = _1771;
    float _1831 = _1825;
    float _1833 = _1769;
    float _1835 = _1787;
    float _1837 = _1807;
    if (_1821)
    {
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1839;
    }
    float _1841 = _1827;
    if (_1821)
    {
        float _1843 = rsqrt(_1817);
        _1829 = _1843;
    }
    float _1845 = _1829;
    float _1847 = _1845;
    if (_1821)
    {
        float _1849 = _1825 * _1841;
        _1831 = _1849;
    }
    float _1851 = _1831;
    if (_1821)
    {
        float _1853 = _1851 * 0.15915493667125701904296875;
        _1833 = _1853;
    }
    float _1855 = _1833;
    float _1857 = _1841;
    float _1859 = _1855;
    if (_1821)
    {
        float _1861 = _1855 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1869 = precise::max(0.0, _1867);
    float _1871 = _1795;
    float _1873 = _1869;
    if (_1821)
    {
        float _1875 = _1855 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = -_1807;
    float _1883 = -_1869;
    float _1885 = fma(_1787, _1881, _1883);
    if (!_1821)
    {
        _1835 = _1811;
    }
    float _1887 = _1835;
    float _1889 = _1887;
    if (_1821)
    {
        float _1891 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1891;
    }
    float _1893 = _1873;
    float _1895 = _1865;
    float _1897 = _1893;
    if (_1821)
    {
        float _1899 = fma(_1865, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1895 = _1899;
    }
    float _1901 = _1895;
    float _1903 = _1901;
    float _1905 = _1879;
    if (_1821)
    {
        float _1907 = _1879 + (-1.0);
        _1897 = _1907;
    }
    float _1909 = _1897;
    float _1911 = _1909;
    if (_1821)
    {
        float _1913 = _1845 * _1901;
        _1837 = _1913;
    }
    float _1915 = _1837;
    if (!_1821)
    {
        _1847 = _1809;
    }
    float _1917 = _1847;
    float _1919 = _1917;
    if (_1821)
    {
        float _1921 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1921;
    }
    float _1923 = _1859;
    if (_1821)
    {
        float _1925 = _1809 * _1915;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (!_1821)
    {
        _1903 = _1885;
    }
    float _1929 = _1903;
    float _1931 = _1929;
    if (_1821)
    {
        float _1933 = _1811 * _1915;
        _1889 = _1933;
    }
    float _1935 = _1889;
    if (!_1821)
    {
        _1911 = _1813;
    }
    float _1937 = _1911;
    float _1939 = _1937;
    if (_1821)
    {
        float _1941 = fma(_1885, _1879, _1923);
        _1931 = _1941;
    }
    float _1943 = _1931;
    if (_1821)
    {
        float _1945 = _1927 * _1927;
        _1939 = _1945;
    }
    float _1947 = _1939;
    if (!_1821)
    {
        _1905 = _1815;
    }
    float _1949 = _1905;
    float _1951 = _1949;
    if (_1821)
    {
        float _1953 = _1935 * _1935;
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = fma(_1943, _1943, _1947);
    float _1959 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1961 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1957 + _1955;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1969 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1967);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1959);
    float _1975 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = rsqrt(_1965);
    float _1979 = -_1971;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1973);
    float _1985 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1987 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1989 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1991 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1985);
    float _1993 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1987);
    float _1995 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1961);
    float _1997 = abs(_1981);
    float _1999 = log2(_1997);
    float _2001 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1991);
    float _2003 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2005 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1995);
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = _1977 * _1927;
    float _2013 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2015 = _1977 * _1935;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = _1977 * _1943;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2013);
    float _2025 = -_2007;
    float _2027 = fma(_2025, _1963, 1.0);
    float _2029 = -_2021;
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2037 = log2(_2027);
    float _2039 = -_2015;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2045 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2047 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2049 = fma(_2041, -0.5, 0.5);
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2045);
    float _2055 = exp2(_2035);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2047);
    float _2059 = _2019 + 1.0;
    float _2061 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2053);
    float _2063 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2065 = 1.0 / _2043;
    float _2067 = fma(_2051, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2063);
    float _2071 = _2037 * 0.693147182464599609375;
    float _2073 = fma(_2051, _2067, -0.212114393711090087890625);
    float _2075 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2061);
    float _2077 = sqrt(_2049);
    float _2079 = -_2019;
    float _2081 = fma(_2055, _2059, _2079);
    float _2083 = fma(_2051, _2073, 1.570728778839111328125);
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2087 = fma(_2081, 0.5, 0.5);
    float _2089 = _2075 * _2065;
    float _2091 = _2069 * _2065;
    float _2093 = fma(_2089, 0.5, 0.5);
    float _2095 = fma(_2091, -0.5, 0.5);
    float _2097 = _2077 * 0.636619746685028076171875;
    float _2099 = -_2083;
    float _2101 = fma(_2097, _2099, 1.0);
    float3 _5778 = float3(_2093, _2095, _2085);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5778, float3(0.0), isnan(_5778)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5778, float3(0.0), isnan(_5778)), level(0.0)).x;
    float3 _5789 = float3(_2093, _2095, _2085);
    float4 _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5789, float3(0.0), isnan(_5789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5789, float3(0.0), isnan(_5789)), level(0.0)).xyzw;
    float _2108 = _2106.x;
    float _2110 = _2106.y;
    float _2112 = _2106.z;
    float _2114 = _2106.w;
    float2 _5806 = float2(_2101, _2087);
    float3 _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5806, float2(0.0), isnan(_5806)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5806, float2(0.0), isnan(_5806)), level(0.0)).xyz;
    float _2120 = _2118.x;
    float _2122 = _2118.y;
    float _2124 = _2118.z;
    float _2126 = -_1061;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _2130 = -_1063;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2134 = -_1097;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    bool _2138 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2140 = isnan(0.5);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    float _2148 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2150 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2152 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2154 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2148);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2150);
    float _2158 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2152);
    float _2160 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2154);
    float _2162 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2156);
    float _2164 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2166 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2168 = _2136;
    float _2170 = _2160;
    float _2172 = _2158;
    float _2174 = _2043;
    float _2176 = _2069;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2178 = _2168;
    float _2180 = 1.0 / _2164;
    float _2182 = _2166 + _2164;
    float _2184 = _2178;
    if (!_2146)
    {
        _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2186 = _1437;
    if (!_2146)
    {
        float _2188 = -_2186;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2170 = _2190;
    }
    float _2192 = _2170;
    float _2194 = _2192;
    if (!_2146)
    {
        float _2196 = 1.0 / _2192;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2182 * _2180;
    float _2202 = _2200 * 0.5;
    float _2204 = _2180;
    if (!_2146)
    {
        float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2208 = fma(_2202, _2178, _2206);
        _2204 = _2208;
    }
    float _2210 = _2204;
    float _2212 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2214 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2158);
    if (_2146)
    {
        _2172 = 1.0;
    }
    float _2216 = _2172;
    float _2218 = _2210;
    float _2220 = _2216;
    float _2222 = _2075;
    if (!_2146)
    {
        float _2224 = 1.0 / _2210;
        _2218 = _2224;
    }
    float _2226 = _2218;
    float _2228 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2214);
    float _2230 = _2228 + _2043;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2043;
    float _2232 = exp2(_2212);
    float _2234 = _2228;
    if (!_2146)
    {
        float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2238 = -_2186;
        float _2240 = fma(_2226, _2236, _2238);
        _2184 = _2240;
    }
    float _2242 = _2184;
    float _2244 = _2230 * 0.5;
    if (!_2146)
    {
        float _2246 = _2242 * _2198;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        _2220 = _2248;
    }
    float _2250 = _2220;
    bool _2252 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_1805);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = -_2232;
    float _2264 = _2262 + 1.0;
    float _2266 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2244;
    out.m_66.w = _2043;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    if (!_2260)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2272 = _2174;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2260)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2278 = _2234;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2260)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2284 = _2176;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2260)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2290 = _2222;
    float _2292 = _2266 * _2103;
    float _2294 = _2114 * _2292;
    float _2296 = _2124 * _2292;
    float _2298 = _2114 * _2270;
    float _2300 = fma(_2120, _2294, _2108);
    float _2302 = fma(_2122, _2294, _2110);
    float _2304 = fma(_2114, _2296, _2112);
    float _2306 = _2114;
    float _2308 = _2112;
    float _2310 = _2290;
    float _2312 = _2290;
    if (!_2260)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2314 = _2306;
    float _2316 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = _2314;
    float _2320 = _2314;
    if (!_2260)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2322 = _2308;
    out.m_68.x = _2300;
    out.m_68.y = _2302;
    out.m_68.z = _2304;
    out.m_68.w = _2298;
    bool _2324 = !_2260;
    float _2326 = _2322;
    float _2328 = _2322;
    if (!_2324)
    {
        bool _2330 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2332 = isnan(_1805);
        bool _2334 = _2330 || _2332;
        bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2338 = _2334 || _2336;
        if (!_2338)
        {
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2342 = _1805 + _2340;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2344;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = 1.0 / _2346;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2370 = _2342 * _2352;
            float _2372 = precise::clamp(_2370, 0.0, 1.0);
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2378 = fma(_2372, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2380 = fma(_2372, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2382 = fma(_2372, _2356, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2384 = fma(_2372, _2360, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2386 = fma(_2372, _2364, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2388 = fma(_2372, _2368, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2382;
            _2288 = _2386;
            _2320 = _2378;
            _2282 = _2384;
            _2276 = _2380;
            _2312 = _2388;
            _2390 = true;
        }
        else
        {
            bool _2392 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2394 = isnan(_1805);
            bool _2396 = _2392 || _2394;
            bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2400 = _2396 || _2398;
            if (!_2400)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2402 = _2318;
            _2320 = _2402;
            if (!_2400)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2404 = _2326;
            _2328 = _2404;
            if (!_2400)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2406 = _2274;
            _2276 = _2406;
            if (!_2400)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2408 = _2280;
            _2282 = _2408;
            if (!_2400)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2410 = _2286;
            _2288 = _2410;
            if (!_2400)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2412 = _2310;
            bool _2414 = !_2400;
            _2312 = _2412;
            if (!_2414)
            {
                bool _2416 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2418 = isnan(_1805);
                bool _2420 = _2416 || _2418;
                bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2424 = _2420 || _2422;
                if (!_2424)
                {
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2428 = _1805 + _2426;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2430;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = 1.0 / _2432;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2456 = _2428 * _2438;
                    float _2458 = precise::clamp(_2456, 0.0, 1.0);
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2464 = fma(_2458, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2458, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2468 = fma(_2458, _2442, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2470 = fma(_2458, _2446, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2472 = fma(_2458, _2450, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2474 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2468;
                    _2288 = _2472;
                    _2320 = _2464;
                    _2282 = _2470;
                    _2276 = _2466;
                    _2312 = _2474;
                    _2390 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2390 = false;
    float _2476 = _2328;
    float _2478 = _2288;
    float _2480 = _2320;
    float _2482 = _2282;
    float _2484 = _2276;
    float _2486 = _2312;
    float _2488 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2490 = fma(_1541, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2476;
    float _2496 = _2494 + _2478;
    float _2498 = -_2480;
    float _2500 = _2498 + _2482;
    out.m_70.x = 0.0;
    float _2502 = fma(_2492, _2496, _2476);
    float _2504 = -_2484;
    float _2506 = _2504 + _2486;
    float _2508 = fma(_2492, _2500, _2480);
    float _2510 = _2502 * 0.586610972881317138671875;
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = fma(_2492, _2506, _2484);
    out.m_47.x = _2488;
    float _2516 = fma(_2508, 0.298911988735198974609375, _2510);
    bool _2518 = _2250 > 0.0;
    bool _2520 = isnan(_2250);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2514, 0.114477999508380889892578125, _2516);
    float _2530 = -_2528;
    float _2532 = _2508 + _2530;
    float _2534 = -_2528;
    float _2536 = _2502 + _2534;
    float _2538 = -_2528;
    float _2540 = _2514 + _2538;
    float _2542 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2546 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    bool _2548 = !_2512;
    if (!_2548)
    {
        float _2550 = -_1775;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2554 = -_1779;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2558 = -_1783;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2562 = _2552 * _2552;
        float _2564 = fma(_2556, _2556, _2562);
        float _2566 = fma(_2560, _2560, _2564);
        float _2568 = sqrt(_2566);
        float _2570 = rsqrt(_2566);
        float _2572 = -_2568;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2576 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2578 = precise::clamp(_2576, 0.0, 1.0);
        float _2580 = _2556 * _2570;
        float _2582 = _2552 * _2570;
        float _2584 = abs(_2578);
        float _2586 = log2(_2584);
        float _2588 = _2560 * _2570;
        float _2590 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2592 = _1541 * _2582;
        float _2594 = -_2582;
        float _2596 = -_2590;
        float _2598 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2596);
        float _2600 = fma(_1539, _2580, _2592);
        float _2602 = -_2588;
        float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2598);
        float _2606 = fma(_1545, _2588, _2600);
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2612 = _2604 + _2610;
        float _2614 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2618 = precise::clamp(_2616, 0.0, 1.0);
        float _2620 = exp2(_2614);
        float _2622 = _2620 * _2618;
        float _2624 = _2608 * _2622;
        float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2628 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2630 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_70.x = _2626;
        out.m_70.y = _2628;
        out.m_70.z = _2630;
    }
    out.m_72.x = _2542;
    out.m_72.y = _2544;
    out.m_72.z = _2546;
    if (_2526)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2632;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2390 = false;
    bool _549 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2689 = as_type<float>(_107);
        out.gl_Position.z = _2689;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_143);
        out.gl_Position.z = _2758;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = _145;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _229;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _147 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _175 = _269;
        _247 = _257;
    }
    float _271 = _175;
    float _273 = _247;
    float _275 = 0.0;
    float _277 = _273;
    if (!_159)
    {
        float _279 = _125 * _125;
        float _281 = _279 * 0.5;
        _275 = _281;
    }
    float _283 = _275;
    float _285 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _277 = _125;
    }
    float _291 = _277;
    float _293 = fma(_271, _161, _285);
    float _295 = fma(_271, _163, _287);
    float _297 = _291;
    if (!_159)
    {
        float _299 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _299;
    }
    float _301 = _249;
    bool _303 = !_159;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _125 * _309;
        float _319 = exp2(_317);
        float _321 = _315 * 0.693147182464599609375;
        float _323 = 1.0 / _321;
        float _325 = 1.0 / _313;
        float _327 = _319 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _323, _125);
        float _333 = _331 * _325;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_159;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _125 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_361, _163, _363);
    float _373 = fma(_295, _149, _169);
    float _375 = fma(_361, _161, _365);
    float _377 = fma(_271, _165, _289);
    float _379 = -_371;
    float _381 = _295 + _379;
    float _383 = fma(_361, _165, _369);
    float _385 = -_375;
    float _387 = _293 + _385;
    float _389 = fma(_293, _149, _167);
    float _391 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = -_383;
    float _399 = _377 + _397;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _407 = fma(_377, _149, _171);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    bool _415 = !_367;
    float _417 = _411;
    float _419 = _409;
    float _421 = _413;
    float _423 = _409;
    float _425 = _411;
    float _443;
    if (!_415)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    bool _455 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_453);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_453);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _453 + _487;
    float _491 = -_465;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _469;
    float _499 = _481 * _493;
    float _501 = -_481;
    float _503 = _501 + 1.0;
    float _505 = _485 * _497;
    float _507 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _507 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[115].x, _509);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[116].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _523;
    out.m_58.z = _525;
    out.m_58.w = _527;
    bool _529 = !_495;
    float _547;
    if (!_529)
    {
        float _531 = in.m_56.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_91);
        float _553 = 1.0 / _551;
        float _555 = _125 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = in.m_56.w;
    float _567 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _569 = log2(_567);
    float _571 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _573 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _577 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _579 = precise::max(_575, _577);
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _583 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _585 = _579 >= 16.0;
    float _587 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
    float _591 = _585 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _593 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _595 = _585 ? _583 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _597 = _125 * _569;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _601 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _603 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _593);
    float _605 = exp2(_597);
    float _607 = _563 * 2.0;
    float _609 = _559 * 2.0;
    float _611 = _561 * 2.0;
    float _613 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _617 = _563 + _559;
    float _619 = floor(_607);
    float _621 = -_599;
    float _623 = fma(_613, 2.0, _621);
    float _625 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _627 = _561 + _563;
    float _629 = _561 + _559;
    float _631 = _617 + (-1.0);
    float _633 = _627 + (-1.0);
    float _635 = floor(_609);
    float _637 = -_605;
    float _639 = _637 + 1.0;
    float _641 = _629 + (-1.0);
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _647 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _649 = _619 > 0.0;
    float _651 = floor(_611);
    bool _653 = _619 >= 0.0;
    bool _655 = isnan(_619);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    int _663 = _661 ? 0 : 1;
    bool _665 = _635 >= 0.0;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    int _675 = ~_663;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    bool _681 = _635 > 0.0;
    int _683 = _679;
    int _685 = as_type<int>(_639);
    if (!_649)
    {
        int _687 = ~_663;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    float _693 = abs(_591);
    bool _695 = _693 != 0.0;
    bool _697 = isnan(_693);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = _673 ? 0 : 1;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _717 = _715 != 0;
    float _719 = abs(_595);
    bool _721 = _719 == 0.0;
    bool _723 = !_703;
    bool _725 = _721 && _723;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    int _733 = _731;
    bool _735 = _681;
    if (!_681)
    {
        int _737 = ~_705;
        int _739 = _737 + 1;
        _733 = _739;
    }
    int _741 = _733;
    bool _743 = !_717;
    int _745 = _743 ? 0 : 1;
    bool _747 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _755 = _751 || _753;
    bool _757 = !_713;
    int _759 = _757 ? 0 : 1;
    bool _761 = _651 >= 0.0;
    bool _763 = isnan(_651);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    if (_725)
    {
        bool _771 = as_type<int>(_595) >= 0;
        _735 = _771;
    }
    bool _773 = _735;
    float _775 = _755 ? _639 : 0.0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    int _781 = _779 ? (-1) : 0;
    if (_725)
    {
        int _783 = _773 ? 0 : 1078530011;
        _685 = _783;
    }
    int _785 = _685;
    int _787 = _769 ? 0 : 1;
    bool _789 = !_709;
    int _791 = _789 ? 0 : 1;
    bool _793 = _565 > 0.5;
    float _795 = abs(_595);
    bool _797 = _795 == 0.0;
    int _799 = abs(_791);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _803 = 1.0 + _801;
    int _805 = _785;
    if (_725)
    {
        int _807 = int(0x80000000) & as_type<int>(_591);
        int _809 = _785 | _807;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    bool _819 = _651 > 0.0;
    float _821 = 1.0 / _803;
    float _823 = _775 * _821;
    bool _825 = !_703;
    bool _827 = _825 && _797;
    int _829 = _811;
    float _831 = as_type<float>(_811);
    if (!_827)
    {
        float _833 = abs(_591);
        bool _835 = _833 != as_type<float>(0x7f800000u /* inf */);
        bool _837 = isnan(_833);
        bool _839 = _835 || _837;
        bool _841 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _843 = _839 || _841;
        float _845 = abs(_595);
        bool _847 = _845 == as_type<float>(0x7f800000u /* inf */);
        bool _849 = !_843;
        bool _851 = _847 && _849;
        if (_851)
        {
            _829 = 1075235812;
        }
        int _853 = _829;
        int _855 = _853;
        if (_851)
        {
            bool _857 = as_type<int>(_595) >= 0;
            _781 = _857 ? (-1) : 0;
        }
        int _859 = _781;
        if (_851)
        {
            int _861 = ~_859;
            int _863 = (_861 != 0) ? _853 : 1061752795;
            _855 = _863;
        }
        int _865 = _855;
        float _867 = as_type<float>(_865);
        if (_851)
        {
            int _869 = int(0x80000000) & as_type<int>(_591);
            int _871 = _865 | _869;
            _867 = as_type<float>(_871);
        }
        float _873 = _867;
        float _875 = abs(_595);
        bool _877 = _875 == as_type<float>(0x7f800000u /* inf */);
        bool _879 = !_843;
        bool _881 = _879 && _877;
        _831 = _873;
        if (!_881)
        {
            float _883 = abs(_591);
            float _885 = abs(_595);
            float _887 = precise::max(_883, _885);
            float _889 = abs(_591);
            float _891 = abs(_595);
            float _893 = precise::min(_889, _891);
            float _895 = 1.0 / _887;
            float _897 = abs(_591);
            float _899 = abs(_595);
            bool _901 = _897 > _899;
            float _903 = _893 * _895;
            float _905 = abs(_591);
            float _907 = abs(_595);
            float _909 = _905 + _907;
            float _911 = _903 * _903;
            float _913 = _911 + 11.33538818359375;
            float _915 = fma(_911, _913, 28.84246826171875);
            float _917 = fma(_911, _915, 19.6966705322265625);
            float _919 = fma(_911, -0.82336294651031494140625, -5.674867153167724609375);
            float _921 = fma(_911, _919, -6.565555095672607421875);
            float _923 = 1.0 / _917;
            float _925 = _911 * _921;
            float _927 = _903 * _925;
            float _929 = fma(_927, _923, _903);
            float _931 = _929;
            _831 = _909;
            if (_901)
            {
                float _933 = -_929;
                float _935 = _933 + 1.57079637050628662109375;
                _931 = _935;
            }
            float _937 = _931;
            bool _939 = as_type<int>(_595) >= 0;
            int _941 = as_type<int>(_591) & int(0x80000000);
            int _943 = as_type<int>(_937);
            if (!_939)
            {
                float _945 = -_937;
                float _947 = _945 + 3.1415927410125732421875;
                _943 = as_type<int>(_947);
            }
            int _949 = _943;
            bool _951 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _953 = isnan(_909);
            bool _955 = _951 || _953;
            bool _957 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _959 = _955 || _957;
            if (!_959)
            {
                int _961 = _941 | _949;
                _831 = as_type<float>(_961);
            }
        }
    }
    float _963 = _831;
    float _965 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _647 + _967;
    float _971 = float(_799);
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _975 = float(_691);
    float _977 = _615 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _979 = abs(_759);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _965 + _981;
    float _985 = _969 * _969;
    float _987 = _971 * _975;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = fma(_983, _983, _985);
    float _995 = float(_741);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _999 = abs(_745);
    float _1001 = fma(_991, _991, _993);
    float _1003 = _987 * (-2.0);
    int _1005 = ~_787;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1013 = _557 + _1011;
    int _1015 = _1009;
    if (!_819)
    {
        int _1017 = ~_787;
        int _1019 = _1017 + 1;
        _1015 = _1019;
    }
    int _1021 = _1015;
    float _1023 = fma(_813, _1003, _813);
    float _1025 = rsqrt(_1001);
    float _1027 = _559 + (-0.5);
    float _1029 = float(_1021);
    float _1031 = -_125;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _1035 = float(_999);
    float _1037 = float(_979);
    bool _1039 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1041 = isnan(1.0);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 * _1029;
    float _1051 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1053 = _1037 * _995;
    bool _1055 = !_1047;
    float _1057 = _1055 ? _125 : _823;
    float _1059 = _1049 * (-2.0);
    float _1061 = _969 * _1025;
    float _1063 = _983 * _1025;
    float _1065 = fma(_645, _1059, _645);
    float _1067 = fma(_1057, _1023, _1051);
    float _1069 = -_1061;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1073 = _563 + (-0.5);
    float _1075 = _1053 * (-2.0);
    float _1077 = -_1063;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1081 = _1071 * _1071;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1087 = _1067 * 0.15915493667125701904296875;
    float _1089 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1091 = fma(_1079, _1079, _1081);
    float _1093 = fma(_643, _1075, _643);
    bool _1095 = _559 > 0.5;
    float _1097 = _991 * _1025;
    float _1099 = in.m_54.x;
    float _1101 = in.m_54.y;
    float _1103 = fma(_1057, _1065, _1089);
    float _1105 = -_199;
    int _1107 = _1095 ? as_type<int>(_1105) : as_type<int>(_199);
    float _1109 = -_1097;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    bool _1113 = _563 > 0.5;
    float _1115 = _561 + (-0.5);
    float _1117 = fma(_1111, _1111, _1091);
    float _1119 = _1087 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1127 = fma(_1057, _1093, _1123);
    float _1129 = _1103 * 0.15915493667125701904296875;
    float _1131 = sqrt(_1117);
    float _1133 = _1127 + _963;
    float _1135 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1145 = fma(_1135, -2.0, _1137);
    float _1147 = _1087 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1153 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1157 = _1155 != 0;
    float _1159 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1143);
    bool _1161 = _561 > 0.5;
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1165 = !_1157;
    float _1167 = _1165 ? _199 : as_type<float>(_1107);
    float _1169 = 1.0 / _1085;
    float _1171 = _1133 * 0.15915493667125701904296875;
    float _1173 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1125);
    float _1175 = _1025 * _1131;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1179;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1185 = _1175 * _1163;
    float _1187 = _1129 * 6.283185482025146484375;
    float _1189 = cos(_1187);
    float _1191 = _1175 * _1177;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _557 + _1193;
    float _1197 = _1185 * _1183;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1191 * _973;
    bool _1205 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1207 = isnan(_557);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1145);
    float _1219 = _1171 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1181 * _1169;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    bool _1233 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1235 = isnan(_557);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1223, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1247 = -_203;
    int _1249 = _1161 ? as_type<int>(_1247) : as_type<int>(_203);
    float _1251 = _1171 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1121 * _1189;
    float _1257 = _1243 * _1231;
    float _1259 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    float _1265 = _1255 * _1203;
    float _1267 = _1129 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1149 * _1221;
    bool _1273 = !_1263;
    float _1275 = _1273 ? _203 : as_type<float>(_1249);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1141;
    float _1283 = _1121 * _1253;
    float _1285 = _1121 * _1221;
    float _1287 = _1149 * _1253;
    float _1289 = _1253 * _1189;
    float _1291 = _1149 * _1189;
    float _1293 = -_1271;
    float _1295 = fma(_1269, _1283, _1293);
    float _1297 = -_1203;
    float _1299 = _1269 * _1297;
    float _1301 = fma(_1269, _1285, _1287);
    float _1303 = fma(_1269, _1287, _1285);
    float _1305 = fma(_1295, _1197, _1265);
    float _1307 = _1221 * _1189;
    float _1309 = fma(_1289, _1197, _1299);
    float _1311 = _1291 * _1203;
    float _1313 = _1227 * _1281;
    bool _1315 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1317 = isnan(_557);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1323 = _1319 || _1321;
    float _1325 = float(_1323);
    float _1327 = fma(_1301, _1201, _1305);
    float _1329 = fma(_1307, _1201, _1309);
    float _1331 = fma(_1313, _1013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1333 = _1245 * _1257;
    float _1335 = -_1325;
    float _1337 = _1335 + 1.0;
    float _1339 = _977 + _1327;
    float _1341 = -_1283;
    float _1343 = fma(_1269, _1271, _1341);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = _1215 * _1337;
    float _1349 = _965 + _1329;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1339 + _1351;
    float _1355 = fma(_1303, _1197, _1311);
    float _1357 = -_1243;
    float _1359 = _1357 + 1.0;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * _1353;
    float _1367 = -_203;
    int _1369 = _793 ? as_type<int>(_1367) : as_type<int>(_203);
    float _1371 = fma(_1343, _1201, _1355);
    float _1373 = -_199;
    int _1375 = _1113 ? as_type<int>(_1373) : as_type<int>(_199);
    float _1377 = fma(_1363, _1363, _1365);
    float _1379 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1333);
    float _1381 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1383 = !_817;
    float _1385 = _1383 ? _203 : as_type<float>(_1369);
    float _1387 = sqrt(_1377);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = _1275 + (-0.5);
    bool _1393 = !_1279;
    float _1395 = _1393 ? _199 : as_type<float>(_1375);
    float _1397 = _1167 + 0.5;
    float _1399 = fma(_1331, _1347, _1379);
    float _1401 = -_1389;
    float _1403 = -_1217;
    float _1405 = fma(_1401, _1391, _1403);
    float _1407 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = -_1381;
    float _1413 = _1269 * _1411;
    float _1415 = fma(_1259, _1397, _1033);
    float _1417 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1399);
    float _1419 = _1291 * _1381;
    float _1421 = _647 + _1371;
    float _1423 = _1255 * _1381;
    float _1425 = fma(_1289, _1407, _1413);
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1429 = !_1427;
    float _1431 = _1421;
    float _1433 = _1349;
    float _1435 = _1339;
    float _1437 = _1097;
    if (!_1429)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1443 = _1387 + _1441;
        float _1445 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1447 = rsqrt(_1377);
        float _1449 = _1443 * _1439;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1455 + (-1.0);
        float _1463 = fma(_1459, _1445, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1447 * _1463;
        float _1469 = fma(_1421, _1455, _1465);
        float _1471 = fma(_1363, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1473 = fma(_1353, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1431 = _1469;
        _1433 = _1471;
        _1435 = _1473;
    }
    float _1475 = _1431;
    float _1477 = _1433;
    float _1479 = _1435;
    float _1481 = -_647;
    float _1483 = _1481 + _1475;
    float _1485 = fma(_1295, _1407, _1423);
    float _1487 = -_965;
    float _1489 = _1487 + _1477;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1303, _1407, _1419);
    float _1497 = -_977;
    float _1499 = _1497 + _1479;
    float _1501 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    float _1503 = fma(_1489, _1489, _1493);
    float _1505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1159);
    float _1507 = _1395 + 0.5;
    float _1509 = -_1385;
    float _1511 = _1509 + 0.5;
    float _1513 = fma(_1499, _1499, _1503);
    float _1515 = -_1501;
    float _1517 = _1515 + 1.0;
    float _1519 = -_1505;
    float _1521 = _1519 + 1.0;
    float _1523 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1525 = sqrt(_1513);
    float _1527 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = -_1517;
    float _1531 = fma(_1167, _1529, _1415);
    float _1533 = fma(_1275, _1521, _1405);
    float _1535 = _1523 * _1409;
    float _1537 = _1527 * _1491;
    float _1539 = _1307 + _1425;
    float _1541 = _1343 + _1495;
    float _1543 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1545 = _1301 + _1485;
    out.m_60.x = _1531;
    out.m_60.y = _1533;
    out.m_60.z = _1535;
    out.m_60.w = _1537;
    out.m_62.w = _1543;
    bool _1547 = _1525 > 0.0;
    out.m_64.x = _1539;
    out.m_64.y = _1541;
    out.m_64.z = _1545;
    bool _1549 = !_1547;
    float _1551 = _1525;
    float _1553 = _1535;
    float _1555 = _1475;
    float _1557 = _1477;
    float _1559 = _1479;
    if (!_1549)
    {
        bool _1561 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1563 = _1531;
        if (_1561)
        {
            float _1565 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1563 = _1565;
        }
        float _1567 = _1563;
        float _1569 = _1567;
        if (_1561)
        {
            float _1571 = _409 * _1567;
            _1551 = _1571;
        }
        float _1573 = _1551;
        float _1575 = _1573;
        if (_1561)
        {
            float _1577 = _411 * _1567;
            _1553 = _1577;
        }
        float _1579 = _1553;
        float _1581 = _1579;
        if (_1561)
        {
            float _1583 = _413 * _1567;
            _1569 = _1583;
        }
        float _1585 = _1569;
        float _1587 = _1585;
        float _1589 = _1585;
        if (!_1561)
        {
            float _1591 = _125 + 1.0;
            float _1593 = _1591;
            if (!_159)
            {
                float _1595 = _1591 * _1591;
                float _1597 = _1595 * 0.5;
                _1587 = _1597;
            }
            float _1599 = _1587;
            float _1601 = _1599;
            if (!_159)
            {
                float _1603 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1601 = _1603;
            }
            float _1605 = _1601;
            bool _1607 = !_159;
            float _1609 = _1605;
            if (!_1607)
            {
                float _1611 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1613 = log2(_1611);
                float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1617 = _1615 + 1.0;
                float _1619 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1621 = _1613 * _1591;
                float _1623 = 1.0 / _1617;
                float _1625 = _1619 * 0.693147182464599609375;
                float _1627 = exp2(_1621);
                float _1629 = 1.0 / _1625;
                float _1631 = _1627 + (-1.0);
                float _1633 = -_1631;
                float _1635 = fma(_1633, _1629, _1591);
                float _1637 = _1635 * _1623;
                float _1639 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1609 = _1639;
            }
            float _1641 = _1609;
            float _1643 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1645 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1647 = !_159;
            if (!_1647)
            {
                float _1649 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1651 = log2(_1649);
                float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1655 = _1653 + 1.0;
                float _1657 = 1.0 / _1655;
                float _1659 = _1651 * _1591;
                float _1661 = exp2(_1659);
                float _1663 = -_1661;
                float _1665 = _1663 + 1.0;
                float _1667 = _1665 * _1657;
                _1593 = _1667;
            }
            float _1669 = _1593;
            float _1671 = fma(_1669, _163, _1645);
            float _1673 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1675 = fma(_1669, _161, _1643);
            float _1677 = -_371;
            float _1679 = _1677 + _1671;
            float _1681 = fma(_1669, _165, _1673);
            float _1683 = -_375;
            float _1685 = _1683 + _1675;
            float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1689 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1691 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1693 = -_383;
            float _1695 = _1693 + _1681;
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1687);
            float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1689);
            float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
            float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1697);
            float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1699);
            float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1701);
            _417 = _1705;
            _419 = _1703;
            _421 = _1707;
            _1575 = _1703;
            _1581 = _1705;
            _1589 = _1707;
        }
        float _1709 = _417;
        float _1711 = _419;
        float _1713 = _421;
        float _1715 = _1575;
        float _1717 = _1581;
        float _1719 = _1589;
        float _1721 = _1709 * _1709;
        float _1723 = rsqrt(_1513);
        float _1725 = fma(_1711, _1711, _1721);
        float _1727 = fma(_1713, _1713, _1725);
        float _1729 = sqrt(_1727);
        float _1731 = _1489 * _1723;
        float _1733 = _1483 * _1723;
        float _1735 = _1499 * _1723;
        bool _1737 = _1729 > 0.0;
        bool _1739 = !_1737;
        _423 = _1711;
        _425 = _1709;
        if (!_1739)
        {
            float _1741 = rsqrt(_1727);
            float _1743 = _1741 * _1709;
            float _1745 = _1741 * _1711;
            float _1747 = _1741 * _1713;
            float _1749 = _1733 * _1743;
            float _1751 = fma(_1731, _1745, _1749);
            float _1753 = fma(_1735, _1747, _1751);
            float _1755 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1757 = fma(_1715, _1755, _1477);
            float _1759 = fma(_1717, _1755, _1475);
            float _1761 = fma(_1719, _1755, _1479);
            _1555 = _1759;
            _1557 = _1757;
            _1559 = _1761;
        }
    }
    float _1763 = _1555;
    float _1765 = _1557;
    float _1767 = _1559;
    float _1769 = _423;
    float _1771 = _425;
    float _1773 = -_1061;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1763);
    float _1777 = -_1063;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1781 = -_1097;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1767);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1779 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * _1787;
    float _1799 = fma(_1791, _1791, _1797);
    float _1801 = fma(_1795, _1795, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1809 = _1791 * _1807;
    float _1811 = _1795 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 * _1811;
    float _1817 = _1813 + _1815;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1825 = _1819 + _1823;
    float _1827 = _1803;
    float _1829 = _1771;
    float _1831 = _1825;
    float _1833 = _1769;
    float _1835 = _1787;
    float _1837 = _1807;
    if (_1821)
    {
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1839;
    }
    float _1841 = _1827;
    if (_1821)
    {
        float _1843 = rsqrt(_1817);
        _1829 = _1843;
    }
    float _1845 = _1829;
    float _1847 = _1845;
    if (_1821)
    {
        float _1849 = _1825 * _1841;
        _1831 = _1849;
    }
    float _1851 = _1831;
    if (_1821)
    {
        float _1853 = _1851 * 0.15915493667125701904296875;
        _1833 = _1853;
    }
    float _1855 = _1833;
    float _1857 = _1841;
    float _1859 = _1855;
    if (_1821)
    {
        float _1861 = _1855 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1869 = precise::max(0.0, _1867);
    float _1871 = _1795;
    float _1873 = _1869;
    if (_1821)
    {
        float _1875 = _1855 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = -_1807;
    float _1883 = -_1869;
    float _1885 = fma(_1787, _1881, _1883);
    if (!_1821)
    {
        _1835 = _1811;
    }
    float _1887 = _1835;
    float _1889 = _1887;
    if (_1821)
    {
        float _1891 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1891;
    }
    float _1893 = _1873;
    float _1895 = _1865;
    float _1897 = _1893;
    if (_1821)
    {
        float _1899 = fma(_1865, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1895 = _1899;
    }
    float _1901 = _1895;
    float _1903 = _1901;
    float _1905 = _1879;
    if (_1821)
    {
        float _1907 = _1879 + (-1.0);
        _1897 = _1907;
    }
    float _1909 = _1897;
    float _1911 = _1909;
    if (_1821)
    {
        float _1913 = _1845 * _1901;
        _1837 = _1913;
    }
    float _1915 = _1837;
    if (!_1821)
    {
        _1847 = _1809;
    }
    float _1917 = _1847;
    float _1919 = _1917;
    if (_1821)
    {
        float _1921 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1921;
    }
    float _1923 = _1859;
    if (_1821)
    {
        float _1925 = _1809 * _1915;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (!_1821)
    {
        _1903 = _1885;
    }
    float _1929 = _1903;
    float _1931 = _1929;
    if (_1821)
    {
        float _1933 = _1811 * _1915;
        _1889 = _1933;
    }
    float _1935 = _1889;
    if (!_1821)
    {
        _1911 = _1813;
    }
    float _1937 = _1911;
    float _1939 = _1937;
    if (_1821)
    {
        float _1941 = fma(_1885, _1879, _1923);
        _1931 = _1941;
    }
    float _1943 = _1931;
    if (_1821)
    {
        float _1945 = _1927 * _1927;
        _1939 = _1945;
    }
    float _1947 = _1939;
    if (!_1821)
    {
        _1905 = _1815;
    }
    float _1949 = _1905;
    float _1951 = _1949;
    if (_1821)
    {
        float _1953 = _1935 * _1935;
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = fma(_1943, _1943, _1947);
    float _1959 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1961 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1957 + _1955;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1969 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1967);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1959);
    float _1975 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = rsqrt(_1965);
    float _1979 = -_1971;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1973);
    float _1985 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1987 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1989 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1991 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1985);
    float _1993 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1987);
    float _1995 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1961);
    float _1997 = abs(_1981);
    float _1999 = log2(_1997);
    float _2001 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1991);
    float _2003 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2005 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1995);
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = _1977 * _1927;
    float _2013 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2015 = _1977 * _1935;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = _1977 * _1943;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2013);
    float _2025 = -_2007;
    float _2027 = fma(_2025, _1963, 1.0);
    float _2029 = -_2021;
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2037 = log2(_2027);
    float _2039 = -_2015;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2045 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2047 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2049 = fma(_2041, -0.5, 0.5);
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2045);
    float _2055 = exp2(_2035);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2047);
    float _2059 = _2019 + 1.0;
    float _2061 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2053);
    float _2063 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2065 = 1.0 / _2043;
    float _2067 = fma(_2051, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2063);
    float _2071 = _2037 * 0.693147182464599609375;
    float _2073 = fma(_2051, _2067, -0.212114393711090087890625);
    float _2075 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2061);
    float _2077 = sqrt(_2049);
    float _2079 = -_2019;
    float _2081 = fma(_2055, _2059, _2079);
    float _2083 = fma(_2051, _2073, 1.570728778839111328125);
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2087 = fma(_2081, 0.5, 0.5);
    float _2089 = _2075 * _2065;
    float _2091 = _2069 * _2065;
    float _2093 = fma(_2089, 0.5, 0.5);
    float _2095 = fma(_2091, -0.5, 0.5);
    float _2097 = _2077 * 0.636619746685028076171875;
    float _2099 = -_2083;
    float _2101 = fma(_2097, _2099, 1.0);
    float3 _5778 = float3(_2093, _2095, _2085);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5778, float3(0.0), isnan(_5778)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5778, float3(0.0), isnan(_5778)), level(0.0)).x;
    float3 _5789 = float3(_2093, _2095, _2085);
    float4 _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5789, float3(0.0), isnan(_5789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5789, float3(0.0), isnan(_5789)), level(0.0)).xyzw;
    float _2108 = _2106.x;
    float _2110 = _2106.y;
    float _2112 = _2106.z;
    float _2114 = _2106.w;
    float2 _5806 = float2(_2101, _2087);
    float3 _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5806, float2(0.0), isnan(_5806)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5806, float2(0.0), isnan(_5806)), level(0.0)).xyz;
    float _2120 = _2118.x;
    float _2122 = _2118.y;
    float _2124 = _2118.z;
    float _2126 = -_1061;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _2130 = -_1063;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2134 = -_1097;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    bool _2138 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2140 = isnan(0.5);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    float _2148 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2150 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2152 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2154 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2148);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2150);
    float _2158 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2152);
    float _2160 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2154);
    float _2162 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2156);
    float _2164 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2166 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2168 = _2136;
    float _2170 = _2160;
    float _2172 = _2158;
    float _2174 = _2043;
    float _2176 = _2069;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2178 = _2168;
    float _2180 = 1.0 / _2164;
    float _2182 = _2166 + _2164;
    float _2184 = _2178;
    if (!_2146)
    {
        _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2186 = _1437;
    if (!_2146)
    {
        float _2188 = -_2186;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2170 = _2190;
    }
    float _2192 = _2170;
    float _2194 = _2192;
    if (!_2146)
    {
        float _2196 = 1.0 / _2192;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2182 * _2180;
    float _2202 = _2200 * 0.5;
    float _2204 = _2180;
    if (!_2146)
    {
        float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2208 = fma(_2202, _2178, _2206);
        _2204 = _2208;
    }
    float _2210 = _2204;
    float _2212 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2214 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2158);
    if (_2146)
    {
        _2172 = 1.0;
    }
    float _2216 = _2172;
    float _2218 = _2210;
    float _2220 = _2216;
    float _2222 = _2075;
    if (!_2146)
    {
        float _2224 = 1.0 / _2210;
        _2218 = _2224;
    }
    float _2226 = _2218;
    float _2228 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2214);
    float _2230 = _2228 + _2043;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2043;
    float _2232 = exp2(_2212);
    float _2234 = _2228;
    if (!_2146)
    {
        float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2238 = -_2186;
        float _2240 = fma(_2226, _2236, _2238);
        _2184 = _2240;
    }
    float _2242 = _2184;
    float _2244 = _2230 * 0.5;
    if (!_2146)
    {
        float _2246 = _2242 * _2198;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        _2220 = _2248;
    }
    float _2250 = _2220;
    bool _2252 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_1805);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = -_2232;
    float _2264 = _2262 + 1.0;
    float _2266 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2244;
    out.m_66.w = _2043;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    if (!_2260)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2272 = _2174;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2260)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2278 = _2234;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2260)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2284 = _2176;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2260)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2290 = _2222;
    float _2292 = _2266 * _2103;
    float _2294 = _2114 * _2292;
    float _2296 = _2124 * _2292;
    float _2298 = _2114 * _2270;
    float _2300 = fma(_2120, _2294, _2108);
    float _2302 = fma(_2122, _2294, _2110);
    float _2304 = fma(_2114, _2296, _2112);
    float _2306 = _2114;
    float _2308 = _2112;
    float _2310 = _2290;
    float _2312 = _2290;
    if (!_2260)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2314 = _2306;
    float _2316 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = _2314;
    float _2320 = _2314;
    if (!_2260)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2322 = _2308;
    out.m_68.x = _2300;
    out.m_68.y = _2302;
    out.m_68.z = _2304;
    out.m_68.w = _2298;
    bool _2324 = !_2260;
    float _2326 = _2322;
    float _2328 = _2322;
    if (!_2324)
    {
        bool _2330 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2332 = isnan(_1805);
        bool _2334 = _2330 || _2332;
        bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2338 = _2334 || _2336;
        if (!_2338)
        {
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2342 = _1805 + _2340;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2344;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = 1.0 / _2346;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2370 = _2342 * _2352;
            float _2372 = precise::clamp(_2370, 0.0, 1.0);
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2378 = fma(_2372, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2380 = fma(_2372, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2382 = fma(_2372, _2356, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2384 = fma(_2372, _2360, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2386 = fma(_2372, _2364, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2388 = fma(_2372, _2368, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2382;
            _2288 = _2386;
            _2320 = _2378;
            _2282 = _2384;
            _2276 = _2380;
            _2312 = _2388;
            _2390 = true;
        }
        else
        {
            bool _2392 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2394 = isnan(_1805);
            bool _2396 = _2392 || _2394;
            bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2400 = _2396 || _2398;
            if (!_2400)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2402 = _2318;
            _2320 = _2402;
            if (!_2400)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2404 = _2326;
            _2328 = _2404;
            if (!_2400)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2406 = _2274;
            _2276 = _2406;
            if (!_2400)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2408 = _2280;
            _2282 = _2408;
            if (!_2400)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2410 = _2286;
            _2288 = _2410;
            if (!_2400)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2412 = _2310;
            bool _2414 = !_2400;
            _2312 = _2412;
            if (!_2414)
            {
                bool _2416 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2418 = isnan(_1805);
                bool _2420 = _2416 || _2418;
                bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2424 = _2420 || _2422;
                if (!_2424)
                {
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2428 = _1805 + _2426;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2430;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = 1.0 / _2432;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2456 = _2428 * _2438;
                    float _2458 = precise::clamp(_2456, 0.0, 1.0);
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2464 = fma(_2458, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2458, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2468 = fma(_2458, _2442, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2470 = fma(_2458, _2446, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2472 = fma(_2458, _2450, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2474 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2468;
                    _2288 = _2472;
                    _2320 = _2464;
                    _2282 = _2470;
                    _2276 = _2466;
                    _2312 = _2474;
                    _2390 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2390 = false;
    float _2476 = _2328;
    float _2478 = _2288;
    float _2480 = _2320;
    float _2482 = _2282;
    float _2484 = _2276;
    float _2486 = _2312;
    float _2488 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2490 = fma(_1541, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2476;
    float _2496 = _2494 + _2478;
    float _2498 = -_2480;
    float _2500 = _2498 + _2482;
    out.m_70.x = 0.0;
    float _2502 = fma(_2492, _2496, _2476);
    float _2504 = -_2484;
    float _2506 = _2504 + _2486;
    float _2508 = fma(_2492, _2500, _2480);
    float _2510 = _2502 * 0.586610972881317138671875;
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = fma(_2492, _2506, _2484);
    out.m_47.x = _2488;
    float _2516 = fma(_2508, 0.298911988735198974609375, _2510);
    bool _2518 = _2250 > 0.0;
    bool _2520 = isnan(_2250);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2514, 0.114477999508380889892578125, _2516);
    float _2530 = -_2528;
    float _2532 = _2508 + _2530;
    float _2534 = -_2528;
    float _2536 = _2502 + _2534;
    float _2538 = -_2528;
    float _2540 = _2514 + _2538;
    float _2542 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2546 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    bool _2548 = !_2512;
    if (!_2548)
    {
        float _2550 = -_1775;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2554 = -_1779;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2558 = -_1783;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2562 = _2552 * _2552;
        float _2564 = fma(_2556, _2556, _2562);
        float _2566 = fma(_2560, _2560, _2564);
        float _2568 = sqrt(_2566);
        float _2570 = rsqrt(_2566);
        float _2572 = -_2568;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2576 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2578 = precise::clamp(_2576, 0.0, 1.0);
        float _2580 = _2556 * _2570;
        float _2582 = _2552 * _2570;
        float _2584 = abs(_2578);
        float _2586 = log2(_2584);
        float _2588 = _2560 * _2570;
        float _2590 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2592 = _1541 * _2582;
        float _2594 = -_2582;
        float _2596 = -_2590;
        float _2598 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2596);
        float _2600 = fma(_1539, _2580, _2592);
        float _2602 = -_2588;
        float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2598);
        float _2606 = fma(_1545, _2588, _2600);
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2612 = _2604 + _2610;
        float _2614 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2618 = precise::clamp(_2616, 0.0, 1.0);
        float _2620 = exp2(_2614);
        float _2622 = _2620 * _2618;
        float _2624 = _2608 * _2622;
        float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2628 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2630 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_70.x = _2626;
        out.m_70.y = _2628;
        out.m_70.z = _2630;
    }
    out.m_72.x = _2542;
    out.m_72.y = _2544;
    out.m_72.z = _2546;
    if (_2526)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2632;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2390 = false;
    bool _549 = false;
    bool _445 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2689 = as_type<float>(_107);
        out.gl_Position.z = _2689;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2758 = as_type<float>(_143);
        out.gl_Position.z = _2758;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    float _209 = _145;
    if (!_205)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _147 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _147);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _239;
        _209 = _229;
    }
    float _241 = _207;
    float _243 = _209;
    bool _245 = !_159;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _147 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _175 = _269;
        _247 = _257;
    }
    float _271 = _175;
    float _273 = _247;
    float _275 = 0.0;
    float _277 = _273;
    if (!_159)
    {
        float _279 = _125 * _125;
        float _281 = _279 * 0.5;
        _275 = _281;
    }
    float _283 = _275;
    float _285 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _287 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        _277 = _125;
    }
    float _291 = _277;
    float _293 = fma(_271, _161, _285);
    float _295 = fma(_271, _163, _287);
    float _297 = _291;
    if (!_159)
    {
        float _299 = _283 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _299;
    }
    float _301 = _249;
    bool _303 = !_159;
    float _305 = _301;
    if (!_303)
    {
        float _307 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = log2(_307);
        float _311 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _313 = _311 + 1.0;
        float _315 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = _125 * _309;
        float _319 = exp2(_317);
        float _321 = _315 * 0.693147182464599609375;
        float _323 = 1.0 / _321;
        float _325 = 1.0 / _313;
        float _327 = _319 + (-1.0);
        float _329 = -_327;
        float _331 = fma(_329, _323, _125);
        float _333 = _331 * _325;
        float _335 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _305 = _335;
    }
    float _337 = _305;
    bool _339 = !_159;
    if (!_339)
    {
        float _341 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _343 = log2(_341);
        float _345 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _347 = _345 + 1.0;
        float _349 = 1.0 / _347;
        float _351 = _125 * _343;
        float _353 = exp2(_351);
        float _355 = -_353;
        float _357 = _355 + 1.0;
        float _359 = _357 * _349;
        _297 = _359;
    }
    float _361 = _297;
    float _363 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _367 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _369 = _337 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_361, _163, _363);
    float _373 = fma(_295, _149, _169);
    float _375 = fma(_361, _161, _365);
    float _377 = fma(_271, _165, _289);
    float _379 = -_371;
    float _381 = _295 + _379;
    float _383 = fma(_361, _165, _369);
    float _385 = -_375;
    float _387 = _293 + _385;
    float _389 = fma(_293, _149, _167);
    float _391 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _395 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _397 = -_383;
    float _399 = _377 + _397;
    float _401 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _403 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[5].x, _393);
    float _405 = fma(_387, (*spvDescriptorSet0.vp_c10)._m0[6].x, _395);
    float _407 = fma(_377, _149, _171);
    float _409 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[4].z, _401);
    float _411 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[5].z, _403);
    float _413 = fma(_399, (*spvDescriptorSet0.vp_c10)._m0[6].z, _405);
    bool _415 = !_367;
    float _417 = _411;
    float _419 = _409;
    float _421 = _413;
    float _423 = _409;
    float _425 = _411;
    float _443;
    if (!_415)
    {
        float _427 = in.m_56.x;
        float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _431 = _427 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _433 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _435 = _433 * _429;
        float _437 = floor(_435);
        float _439 = -_437;
        float _441 = _435 + _439;
        _443 = _441;
        _445 = true;
    }
    else
    {
        float _447 = float(_91);
        float _449 = 1.0 / _447;
        float _451 = _125 * _449;
        _443 = _451;
    }
    _445 = false;
    float _453 = _443;
    bool _455 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _457 = isnan(_453);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _471 = _453 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _473 = isnan(_453);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _483;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _489 = _453 + _487;
    float _491 = -_465;
    float _493 = _491 + 1.0;
    bool _495 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _497 = 1.0 / _469;
    float _499 = _481 * _493;
    float _501 = -_481;
    float _503 = _501 + 1.0;
    float _505 = _485 * _497;
    float _507 = fma(_505, _489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = _507 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[115].x, _509);
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[116].x, _511);
    float _521 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _525 = _517 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _527 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _521;
    out.m_58.y = _523;
    out.m_58.z = _525;
    out.m_58.w = _527;
    bool _529 = !_495;
    float _547;
    if (!_529)
    {
        float _531 = in.m_56.x;
        float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _535 = _531 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _537 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _539 = _537 * _533;
        float _541 = floor(_539);
        float _543 = -_541;
        float _545 = _539 + _543;
        _547 = _545;
        _549 = true;
    }
    else
    {
        float _551 = float(_91);
        float _553 = 1.0 / _551;
        float _555 = _125 * _553;
        _547 = _555;
    }
    _549 = false;
    float _557 = _547;
    float _559 = in.m_56.x;
    float _561 = in.m_56.y;
    float _563 = in.m_56.z;
    float _565 = in.m_56.w;
    float _567 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _569 = log2(_567);
    float _571 = _373 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _573 = _373 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _575 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _577 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _579 = precise::max(_575, _577);
    float _581 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _583 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    bool _585 = _579 >= 16.0;
    float _587 = _373 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _589 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _571);
    float _591 = _585 ? _581 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _593 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _573);
    float _595 = _585 ? _583 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _597 = _125 * _569;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _601 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
    float _603 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[5].z, _593);
    float _605 = exp2(_597);
    float _607 = _563 * 2.0;
    float _609 = _559 * 2.0;
    float _611 = _561 * 2.0;
    float _613 = _559 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _615 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[6].z, _601);
    float _617 = _563 + _559;
    float _619 = floor(_607);
    float _621 = -_599;
    float _623 = fma(_613, 2.0, _621);
    float _625 = fma(_407, (*spvDescriptorSet0.vp_c10)._m0[4].z, _589);
    float _627 = _561 + _563;
    float _629 = _561 + _559;
    float _631 = _617 + (-1.0);
    float _633 = _627 + (-1.0);
    float _635 = floor(_609);
    float _637 = -_605;
    float _639 = _637 + 1.0;
    float _641 = _629 + (-1.0);
    float _643 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _645 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _647 = _603 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _649 = _619 > 0.0;
    float _651 = floor(_611);
    bool _653 = _619 >= 0.0;
    bool _655 = isnan(_619);
    bool _657 = _653 || _655;
    bool _659 = isnan(0.0);
    bool _661 = _657 || _659;
    int _663 = _661 ? 0 : 1;
    bool _665 = _635 >= 0.0;
    bool _667 = isnan(_635);
    bool _669 = _665 || _667;
    bool _671 = isnan(0.0);
    bool _673 = _669 || _671;
    int _675 = ~_663;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    bool _681 = _635 > 0.0;
    int _683 = _679;
    int _685 = as_type<int>(_639);
    if (!_649)
    {
        int _687 = ~_663;
        int _689 = _687 + 1;
        _683 = _689;
    }
    int _691 = _683;
    float _693 = abs(_591);
    bool _695 = _693 != 0.0;
    bool _697 = isnan(_693);
    bool _699 = _695 || _697;
    bool _701 = isnan(0.0);
    bool _703 = _699 || _701;
    int _705 = _673 ? 0 : 1;
    int _707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _709 = _707 != 0;
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _717 = _715 != 0;
    float _719 = abs(_595);
    bool _721 = _719 == 0.0;
    bool _723 = !_703;
    bool _725 = _721 && _723;
    int _727 = ~_705;
    int _729 = _727 + 1;
    int _731 = _729 + 1;
    int _733 = _731;
    bool _735 = _681;
    if (!_681)
    {
        int _737 = ~_705;
        int _739 = _737 + 1;
        _733 = _739;
    }
    int _741 = _733;
    bool _743 = !_717;
    int _745 = _743 ? 0 : 1;
    bool _747 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _749 = isnan(0.0);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _755 = _751 || _753;
    bool _757 = !_713;
    int _759 = _757 ? 0 : 1;
    bool _761 = _651 >= 0.0;
    bool _763 = isnan(_651);
    bool _765 = _761 || _763;
    bool _767 = isnan(0.0);
    bool _769 = _765 || _767;
    if (_725)
    {
        bool _771 = as_type<int>(_595) >= 0;
        _735 = _771;
    }
    bool _773 = _735;
    float _775 = _755 ? _639 : 0.0;
    int _777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _779 = _777 != 0;
    int _781 = _779 ? (-1) : 0;
    if (_725)
    {
        int _783 = _773 ? 0 : 1078530011;
        _685 = _783;
    }
    int _785 = _685;
    int _787 = _769 ? 0 : 1;
    bool _789 = !_709;
    int _791 = _789 ? 0 : 1;
    bool _793 = _565 > 0.5;
    float _795 = abs(_595);
    bool _797 = _795 == 0.0;
    int _799 = abs(_791);
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _803 = 1.0 + _801;
    int _805 = _785;
    if (_725)
    {
        int _807 = int(0x80000000) & as_type<int>(_591);
        int _809 = _785 | _807;
        _805 = _809;
    }
    int _811 = _805;
    float _813 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _817 = _815 != 0;
    bool _819 = _651 > 0.0;
    float _821 = 1.0 / _803;
    float _823 = _775 * _821;
    bool _825 = !_703;
    bool _827 = _825 && _797;
    int _829 = _811;
    float _831 = as_type<float>(_811);
    if (!_827)
    {
        float _833 = abs(_591);
        bool _835 = _833 != as_type<float>(0x7f800000u /* inf */);
        bool _837 = isnan(_833);
        bool _839 = _835 || _837;
        bool _841 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _843 = _839 || _841;
        float _845 = abs(_595);
        bool _847 = _845 == as_type<float>(0x7f800000u /* inf */);
        bool _849 = !_843;
        bool _851 = _847 && _849;
        if (_851)
        {
            _829 = 1075235812;
        }
        int _853 = _829;
        int _855 = _853;
        if (_851)
        {
            bool _857 = as_type<int>(_595) >= 0;
            _781 = _857 ? (-1) : 0;
        }
        int _859 = _781;
        if (_851)
        {
            int _861 = ~_859;
            int _863 = (_861 != 0) ? _853 : 1061752795;
            _855 = _863;
        }
        int _865 = _855;
        float _867 = as_type<float>(_865);
        if (_851)
        {
            int _869 = int(0x80000000) & as_type<int>(_591);
            int _871 = _865 | _869;
            _867 = as_type<float>(_871);
        }
        float _873 = _867;
        float _875 = abs(_595);
        bool _877 = _875 == as_type<float>(0x7f800000u /* inf */);
        bool _879 = !_843;
        bool _881 = _879 && _877;
        _831 = _873;
        if (!_881)
        {
            float _883 = abs(_591);
            float _885 = abs(_595);
            float _887 = precise::max(_883, _885);
            float _889 = abs(_591);
            float _891 = abs(_595);
            float _893 = precise::min(_889, _891);
            float _895 = 1.0 / _887;
            float _897 = abs(_591);
            float _899 = abs(_595);
            bool _901 = _897 > _899;
            float _903 = _893 * _895;
            float _905 = abs(_591);
            float _907 = abs(_595);
            float _909 = _905 + _907;
            float _911 = _903 * _903;
            float _913 = _911 + 11.33538818359375;
            float _915 = fma(_911, _913, 28.84246826171875);
            float _917 = fma(_911, _915, 19.6966705322265625);
            float _919 = fma(_911, -0.82336294651031494140625, -5.674867153167724609375);
            float _921 = fma(_911, _919, -6.565555095672607421875);
            float _923 = 1.0 / _917;
            float _925 = _911 * _921;
            float _927 = _903 * _925;
            float _929 = fma(_927, _923, _903);
            float _931 = _929;
            _831 = _909;
            if (_901)
            {
                float _933 = -_929;
                float _935 = _933 + 1.57079637050628662109375;
                _931 = _935;
            }
            float _937 = _931;
            bool _939 = as_type<int>(_595) >= 0;
            int _941 = as_type<int>(_591) & int(0x80000000);
            int _943 = as_type<int>(_937);
            if (!_939)
            {
                float _945 = -_937;
                float _947 = _945 + 3.1415927410125732421875;
                _943 = as_type<int>(_947);
            }
            int _949 = _943;
            bool _951 = _909 > as_type<float>(0x7f800000u /* inf */);
            bool _953 = isnan(_909);
            bool _955 = _951 || _953;
            bool _957 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _959 = _955 || _957;
            if (!_959)
            {
                int _961 = _941 | _949;
                _831 = as_type<float>(_961);
            }
        }
    }
    float _963 = _831;
    float _965 = _625 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _647 + _967;
    float _971 = float(_799);
    float _973 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _975 = float(_691);
    float _977 = _615 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _979 = abs(_759);
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _965 + _981;
    float _985 = _969 * _969;
    float _987 = _971 * _975;
    float _989 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _991 = _977 + _989;
    float _993 = fma(_983, _983, _985);
    float _995 = float(_741);
    float _997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _999 = abs(_745);
    float _1001 = fma(_991, _991, _993);
    float _1003 = _987 * (-2.0);
    int _1005 = ~_787;
    int _1007 = _1005 + 1;
    int _1009 = _1007 + 1;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1013 = _557 + _1011;
    int _1015 = _1009;
    if (!_819)
    {
        int _1017 = ~_787;
        int _1019 = _1017 + 1;
        _1015 = _1019;
    }
    int _1021 = _1015;
    float _1023 = fma(_813, _1003, _813);
    float _1025 = rsqrt(_1001);
    float _1027 = _559 + (-0.5);
    float _1029 = float(_1021);
    float _1031 = -_125;
    float _1033 = fma(_1031, (*spvDescriptorSet0.vp_c9)._m0[76].x, _623);
    float _1035 = float(_999);
    float _1037 = float(_979);
    bool _1039 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1041 = isnan(1.0);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1047 = _1043 || _1045;
    float _1049 = _1035 * _1029;
    float _1051 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1053 = _1037 * _995;
    bool _1055 = !_1047;
    float _1057 = _1055 ? _125 : _823;
    float _1059 = _1049 * (-2.0);
    float _1061 = _969 * _1025;
    float _1063 = _983 * _1025;
    float _1065 = fma(_645, _1059, _645);
    float _1067 = fma(_1057, _1023, _1051);
    float _1069 = -_1061;
    float _1071 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1073 = _563 + (-0.5);
    float _1075 = _1053 * (-2.0);
    float _1077 = -_1063;
    float _1079 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1081 = _1071 * _1071;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1085 = _1083 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1087 = _1067 * 0.15915493667125701904296875;
    float _1089 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1091 = fma(_1079, _1079, _1081);
    float _1093 = fma(_643, _1075, _643);
    bool _1095 = _559 > 0.5;
    float _1097 = _991 * _1025;
    float _1099 = in.m_54.x;
    float _1101 = in.m_54.y;
    float _1103 = fma(_1057, _1065, _1089);
    float _1105 = -_199;
    int _1107 = _1095 ? as_type<int>(_1105) : as_type<int>(_199);
    float _1109 = -_1097;
    float _1111 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _991);
    bool _1113 = _563 > 0.5;
    float _1115 = _561 + (-0.5);
    float _1117 = fma(_1111, _1111, _1091);
    float _1119 = _1087 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    float _1123 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1127 = fma(_1057, _1093, _1123);
    float _1129 = _1103 * 0.15915493667125701904296875;
    float _1131 = sqrt(_1117);
    float _1133 = _1127 + _963;
    float _1135 = _561 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1145 = fma(_1135, -2.0, _1137);
    float _1147 = _1087 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1153 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1157 = _1155 != 0;
    float _1159 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1143);
    bool _1161 = _561 > 0.5;
    float _1163 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1165 = !_1157;
    float _1167 = _1165 ? _199 : as_type<float>(_1107);
    float _1169 = 1.0 / _1085;
    float _1171 = _1133 * 0.15915493667125701904296875;
    float _1173 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1125);
    float _1175 = _1025 * _1131;
    float _1177 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1179;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1185 = _1175 * _1163;
    float _1187 = _1129 * 6.283185482025146484375;
    float _1189 = cos(_1187);
    float _1191 = _1175 * _1177;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1195 = _557 + _1193;
    float _1197 = _1185 * _1183;
    float _1199 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1201 = _1199 * 0.5;
    float _1203 = _1191 * _973;
    bool _1205 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1207 = isnan(_557);
    bool _1209 = _1205 || _1207;
    bool _1211 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1213 = _1209 || _1211;
    float _1215 = float(_1213);
    float _1217 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1145);
    float _1219 = _1171 * 6.283185482025146484375;
    float _1221 = sin(_1219);
    float _1223 = _1181 * _1169;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1227 = _1225 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1229 = -_1215;
    float _1231 = _1229 + 1.0;
    bool _1233 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1235 = isnan(_557);
    bool _1237 = _1233 || _1235;
    bool _1239 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1241 = _1237 || _1239;
    float _1243 = float(_1241);
    float _1245 = fma(_1223, _1195, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1247 = -_203;
    int _1249 = _1161 ? as_type<int>(_1247) : as_type<int>(_203);
    float _1251 = _1171 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    float _1255 = _1121 * _1189;
    float _1257 = _1243 * _1231;
    float _1259 = _997 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1263 = _1261 != 0;
    float _1265 = _1255 * _1203;
    float _1267 = _1129 * 6.283185482025146484375;
    float _1269 = sin(_1267);
    float _1271 = _1149 * _1221;
    bool _1273 = !_1263;
    float _1275 = _1273 ? _203 : as_type<float>(_1249);
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1279 = _1277 != 0;
    float _1281 = 1.0 / _1141;
    float _1283 = _1121 * _1253;
    float _1285 = _1121 * _1221;
    float _1287 = _1149 * _1253;
    float _1289 = _1253 * _1189;
    float _1291 = _1149 * _1189;
    float _1293 = -_1271;
    float _1295 = fma(_1269, _1283, _1293);
    float _1297 = -_1203;
    float _1299 = _1269 * _1297;
    float _1301 = fma(_1269, _1285, _1287);
    float _1303 = fma(_1269, _1287, _1285);
    float _1305 = fma(_1295, _1197, _1265);
    float _1307 = _1221 * _1189;
    float _1309 = fma(_1289, _1197, _1299);
    float _1311 = _1291 * _1203;
    float _1313 = _1227 * _1281;
    bool _1315 = _557 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1317 = isnan(_557);
    bool _1319 = _1315 || _1317;
    bool _1321 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1323 = _1319 || _1321;
    float _1325 = float(_1323);
    float _1327 = fma(_1301, _1201, _1305);
    float _1329 = fma(_1307, _1201, _1309);
    float _1331 = fma(_1313, _1013, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1333 = _1245 * _1257;
    float _1335 = -_1325;
    float _1337 = _1335 + 1.0;
    float _1339 = _977 + _1327;
    float _1341 = -_1283;
    float _1343 = fma(_1269, _1271, _1341);
    float _1345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1347 = _1215 * _1337;
    float _1349 = _965 + _1329;
    float _1351 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1353 = _1339 + _1351;
    float _1355 = fma(_1303, _1197, _1311);
    float _1357 = -_1243;
    float _1359 = _1357 + 1.0;
    float _1361 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1363 = _1349 + _1361;
    float _1365 = _1353 * _1353;
    float _1367 = -_203;
    int _1369 = _793 ? as_type<int>(_1367) : as_type<int>(_203);
    float _1371 = fma(_1343, _1201, _1355);
    float _1373 = -_199;
    int _1375 = _1113 ? as_type<int>(_1373) : as_type<int>(_199);
    float _1377 = fma(_1363, _1363, _1365);
    float _1379 = fma(_1359, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1333);
    float _1381 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1383 = !_817;
    float _1385 = _1383 ? _203 : as_type<float>(_1369);
    float _1387 = sqrt(_1377);
    float _1389 = _1345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1391 = _1275 + (-0.5);
    bool _1393 = !_1279;
    float _1395 = _1393 ? _199 : as_type<float>(_1375);
    float _1397 = _1167 + 0.5;
    float _1399 = fma(_1331, _1347, _1379);
    float _1401 = -_1389;
    float _1403 = -_1217;
    float _1405 = fma(_1401, _1391, _1403);
    float _1407 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = -_1381;
    float _1413 = _1269 * _1411;
    float _1415 = fma(_1259, _1397, _1033);
    float _1417 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1399);
    float _1419 = _1291 * _1381;
    float _1421 = _647 + _1371;
    float _1423 = _1255 * _1381;
    float _1425 = fma(_1289, _1407, _1413);
    bool _1427 = _1387 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _1429 = !_1427;
    float _1431 = _1421;
    float _1433 = _1349;
    float _1435 = _1339;
    float _1437 = _1097;
    if (!_1429)
    {
        float _1439 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1443 = _1387 + _1441;
        float _1445 = _1421 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1447 = rsqrt(_1377);
        float _1449 = _1443 * _1439;
        float _1451 = _1449 * 0.15915493667125701904296875;
        float _1453 = _1451 * 6.283185482025146484375;
        float _1455 = cos(_1453);
        float _1457 = _1451 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1455 + (-1.0);
        float _1463 = fma(_1459, _1445, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1465 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = _1447 * _1463;
        float _1469 = fma(_1421, _1455, _1465);
        float _1471 = fma(_1363, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1473 = fma(_1353, _1467, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1431 = _1469;
        _1433 = _1471;
        _1435 = _1473;
    }
    float _1475 = _1431;
    float _1477 = _1433;
    float _1479 = _1435;
    float _1481 = -_647;
    float _1483 = _1481 + _1475;
    float _1485 = fma(_1295, _1407, _1423);
    float _1487 = -_965;
    float _1489 = _1487 + _1477;
    float _1491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1493 = _1483 * _1483;
    float _1495 = fma(_1303, _1407, _1419);
    float _1497 = -_977;
    float _1499 = _1497 + _1479;
    float _1501 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1173);
    float _1503 = fma(_1489, _1489, _1493);
    float _1505 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1159);
    float _1507 = _1395 + 0.5;
    float _1509 = -_1385;
    float _1511 = _1509 + 0.5;
    float _1513 = fma(_1499, _1499, _1503);
    float _1515 = -_1501;
    float _1517 = _1515 + 1.0;
    float _1519 = -_1505;
    float _1521 = _1519 + 1.0;
    float _1523 = _1507 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1525 = sqrt(_1513);
    float _1527 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = -_1517;
    float _1531 = fma(_1167, _1529, _1415);
    float _1533 = fma(_1275, _1521, _1405);
    float _1535 = _1523 * _1409;
    float _1537 = _1527 * _1491;
    float _1539 = _1307 + _1425;
    float _1541 = _1343 + _1495;
    float _1543 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1545 = _1301 + _1485;
    out.m_60.x = _1531;
    out.m_60.y = _1533;
    out.m_60.z = _1535;
    out.m_60.w = _1537;
    out.m_62.w = _1543;
    bool _1547 = _1525 > 0.0;
    out.m_64.x = _1539;
    out.m_64.y = _1541;
    out.m_64.z = _1545;
    bool _1549 = !_1547;
    float _1551 = _1525;
    float _1553 = _1535;
    float _1555 = _1475;
    float _1557 = _1477;
    float _1559 = _1479;
    if (!_1549)
    {
        bool _1561 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1563 = _1531;
        if (_1561)
        {
            float _1565 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1563 = _1565;
        }
        float _1567 = _1563;
        float _1569 = _1567;
        if (_1561)
        {
            float _1571 = _409 * _1567;
            _1551 = _1571;
        }
        float _1573 = _1551;
        float _1575 = _1573;
        if (_1561)
        {
            float _1577 = _411 * _1567;
            _1553 = _1577;
        }
        float _1579 = _1553;
        float _1581 = _1579;
        if (_1561)
        {
            float _1583 = _413 * _1567;
            _1569 = _1583;
        }
        float _1585 = _1569;
        float _1587 = _1585;
        float _1589 = _1585;
        if (!_1561)
        {
            float _1591 = _125 + 1.0;
            float _1593 = _1591;
            if (!_159)
            {
                float _1595 = _1591 * _1591;
                float _1597 = _1595 * 0.5;
                _1587 = _1597;
            }
            float _1599 = _1587;
            float _1601 = _1599;
            if (!_159)
            {
                float _1603 = _1599 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1601 = _1603;
            }
            float _1605 = _1601;
            bool _1607 = !_159;
            float _1609 = _1605;
            if (!_1607)
            {
                float _1611 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1613 = log2(_1611);
                float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1617 = _1615 + 1.0;
                float _1619 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1621 = _1613 * _1591;
                float _1623 = 1.0 / _1617;
                float _1625 = _1619 * 0.693147182464599609375;
                float _1627 = exp2(_1621);
                float _1629 = 1.0 / _1625;
                float _1631 = _1627 + (-1.0);
                float _1633 = -_1631;
                float _1635 = fma(_1633, _1629, _1591);
                float _1637 = _1635 * _1623;
                float _1639 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1609 = _1639;
            }
            float _1641 = _1609;
            float _1643 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1645 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1647 = !_159;
            if (!_1647)
            {
                float _1649 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1651 = log2(_1649);
                float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1655 = _1653 + 1.0;
                float _1657 = 1.0 / _1655;
                float _1659 = _1651 * _1591;
                float _1661 = exp2(_1659);
                float _1663 = -_1661;
                float _1665 = _1663 + 1.0;
                float _1667 = _1665 * _1657;
                _1593 = _1667;
            }
            float _1669 = _1593;
            float _1671 = fma(_1669, _163, _1645);
            float _1673 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1675 = fma(_1669, _161, _1643);
            float _1677 = -_371;
            float _1679 = _1677 + _1671;
            float _1681 = fma(_1669, _165, _1673);
            float _1683 = -_375;
            float _1685 = _1683 + _1675;
            float _1687 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1689 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1691 = _1679 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1693 = -_383;
            float _1695 = _1693 + _1681;
            float _1697 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1687);
            float _1699 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1689);
            float _1701 = fma(_1685, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1691);
            float _1703 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1697);
            float _1705 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1699);
            float _1707 = fma(_1695, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1701);
            _417 = _1705;
            _419 = _1703;
            _421 = _1707;
            _1575 = _1703;
            _1581 = _1705;
            _1589 = _1707;
        }
        float _1709 = _417;
        float _1711 = _419;
        float _1713 = _421;
        float _1715 = _1575;
        float _1717 = _1581;
        float _1719 = _1589;
        float _1721 = _1709 * _1709;
        float _1723 = rsqrt(_1513);
        float _1725 = fma(_1711, _1711, _1721);
        float _1727 = fma(_1713, _1713, _1725);
        float _1729 = sqrt(_1727);
        float _1731 = _1489 * _1723;
        float _1733 = _1483 * _1723;
        float _1735 = _1499 * _1723;
        bool _1737 = _1729 > 0.0;
        bool _1739 = !_1737;
        _423 = _1711;
        _425 = _1709;
        if (!_1739)
        {
            float _1741 = rsqrt(_1727);
            float _1743 = _1741 * _1709;
            float _1745 = _1741 * _1711;
            float _1747 = _1741 * _1713;
            float _1749 = _1733 * _1743;
            float _1751 = fma(_1731, _1745, _1749);
            float _1753 = fma(_1735, _1747, _1751);
            float _1755 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1757 = fma(_1715, _1755, _1477);
            float _1759 = fma(_1717, _1755, _1475);
            float _1761 = fma(_1719, _1755, _1479);
            _1555 = _1759;
            _1557 = _1757;
            _1559 = _1761;
        }
    }
    float _1763 = _1555;
    float _1765 = _1557;
    float _1767 = _1559;
    float _1769 = _423;
    float _1771 = _425;
    float _1773 = -_1061;
    float _1775 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1763);
    float _1777 = -_1063;
    float _1779 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1765);
    float _1781 = -_1097;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1767);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1775 + _1785;
    float _1789 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1791 = _1779 + _1789;
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * _1787;
    float _1799 = fma(_1791, _1791, _1797);
    float _1801 = fma(_1795, _1795, _1799);
    float _1803 = rsqrt(_1801);
    float _1805 = sqrt(_1801);
    float _1807 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1809 = _1791 * _1807;
    float _1811 = _1795 * _1807;
    float _1813 = _1809 * _1809;
    float _1815 = _1811 * _1811;
    float _1817 = _1813 + _1815;
    float _1819 = sqrt(_1817);
    bool _1821 = _1819 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1823 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1825 = _1819 + _1823;
    float _1827 = _1803;
    float _1829 = _1771;
    float _1831 = _1825;
    float _1833 = _1769;
    float _1835 = _1787;
    float _1837 = _1807;
    if (_1821)
    {
        float _1839 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1827 = _1839;
    }
    float _1841 = _1827;
    if (_1821)
    {
        float _1843 = rsqrt(_1817);
        _1829 = _1843;
    }
    float _1845 = _1829;
    float _1847 = _1845;
    if (_1821)
    {
        float _1849 = _1825 * _1841;
        _1831 = _1849;
    }
    float _1851 = _1831;
    if (_1821)
    {
        float _1853 = _1851 * 0.15915493667125701904296875;
        _1833 = _1853;
    }
    float _1855 = _1833;
    float _1857 = _1841;
    float _1859 = _1855;
    if (_1821)
    {
        float _1861 = _1855 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        _1857 = _1863;
    }
    float _1865 = _1857;
    float _1867 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1869 = precise::max(0.0, _1867);
    float _1871 = _1795;
    float _1873 = _1869;
    if (_1821)
    {
        float _1875 = _1855 * 6.283185482025146484375;
        float _1877 = cos(_1875);
        _1871 = _1877;
    }
    float _1879 = _1871;
    float _1881 = -_1807;
    float _1883 = -_1869;
    float _1885 = fma(_1787, _1881, _1883);
    if (!_1821)
    {
        _1835 = _1811;
    }
    float _1887 = _1835;
    float _1889 = _1887;
    if (_1821)
    {
        float _1891 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1873 = _1891;
    }
    float _1893 = _1873;
    float _1895 = _1865;
    float _1897 = _1893;
    if (_1821)
    {
        float _1899 = fma(_1865, _1893, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1895 = _1899;
    }
    float _1901 = _1895;
    float _1903 = _1901;
    float _1905 = _1879;
    if (_1821)
    {
        float _1907 = _1879 + (-1.0);
        _1897 = _1907;
    }
    float _1909 = _1897;
    float _1911 = _1909;
    if (_1821)
    {
        float _1913 = _1845 * _1901;
        _1837 = _1913;
    }
    float _1915 = _1837;
    if (!_1821)
    {
        _1847 = _1809;
    }
    float _1917 = _1847;
    float _1919 = _1917;
    if (_1821)
    {
        float _1921 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1859 = _1921;
    }
    float _1923 = _1859;
    if (_1821)
    {
        float _1925 = _1809 * _1915;
        _1919 = _1925;
    }
    float _1927 = _1919;
    if (!_1821)
    {
        _1903 = _1885;
    }
    float _1929 = _1903;
    float _1931 = _1929;
    if (_1821)
    {
        float _1933 = _1811 * _1915;
        _1889 = _1933;
    }
    float _1935 = _1889;
    if (!_1821)
    {
        _1911 = _1813;
    }
    float _1937 = _1911;
    float _1939 = _1937;
    if (_1821)
    {
        float _1941 = fma(_1885, _1879, _1923);
        _1931 = _1941;
    }
    float _1943 = _1931;
    if (_1821)
    {
        float _1945 = _1927 * _1927;
        _1939 = _1945;
    }
    float _1947 = _1939;
    if (!_1821)
    {
        _1905 = _1815;
    }
    float _1949 = _1905;
    float _1951 = _1949;
    if (_1821)
    {
        float _1953 = _1935 * _1935;
        _1951 = _1953;
    }
    float _1955 = _1951;
    float _1957 = fma(_1943, _1943, _1947);
    float _1959 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1961 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1963 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1965 = _1957 + _1955;
    float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1969 = fma(_1805, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1967);
    float _1971 = precise::clamp(_1969, 0.0, 1.0);
    float _1973 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1959);
    float _1975 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1977 = rsqrt(_1965);
    float _1979 = -_1971;
    float _1981 = _1979 + 1.0;
    float _1983 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1973);
    float _1985 = _1775 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1987 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1975);
    float _1989 = _1983 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1991 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1985);
    float _1993 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1987);
    float _1995 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1961);
    float _1997 = abs(_1981);
    float _1999 = log2(_1997);
    float _2001 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1991);
    float _2003 = _1993 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2005 = fma(_1783, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1995);
    float _2007 = _1989 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2011 = _1977 * _1927;
    float _2013 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2015 = _1977 * _1935;
    float _2017 = _2005 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2019 = _1977 * _1943;
    float _2021 = _2011 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2023 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2013);
    float _2025 = -_2007;
    float _2027 = fma(_2025, _1963, 1.0);
    float _2029 = -_2021;
    float _2031 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2029);
    float _2033 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2023);
    float _2035 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2037 = log2(_2027);
    float _2039 = -_2015;
    float _2041 = fma(_2039, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2031);
    float _2043 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2033);
    float _2045 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2047 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2049 = fma(_2041, -0.5, 0.5);
    float _2051 = fma(_2041, 0.5, 0.5);
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2045);
    float _2055 = exp2(_2035);
    float _2057 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2047);
    float _2059 = _2019 + 1.0;
    float _2061 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2053);
    float _2063 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2057);
    float _2065 = 1.0 / _2043;
    float _2067 = fma(_2051, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2069 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2063);
    float _2071 = _2037 * 0.693147182464599609375;
    float _2073 = fma(_2051, _2067, -0.212114393711090087890625);
    float _2075 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2061);
    float _2077 = sqrt(_2049);
    float _2079 = -_2019;
    float _2081 = fma(_2055, _2059, _2079);
    float _2083 = fma(_2051, _2073, 1.570728778839111328125);
    float _2085 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2087 = fma(_2081, 0.5, 0.5);
    float _2089 = _2075 * _2065;
    float _2091 = _2069 * _2065;
    float _2093 = fma(_2089, 0.5, 0.5);
    float _2095 = fma(_2091, -0.5, 0.5);
    float _2097 = _2077 * 0.636619746685028076171875;
    float _2099 = -_2083;
    float _2101 = fma(_2097, _2099, 1.0);
    float3 _5778 = float3(_2093, _2095, _2085);
    float _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5778, float3(0.0), isnan(_5778)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5778, float3(0.0), isnan(_5778)), level(0.0)).x;
    float3 _5789 = float3(_2093, _2095, _2085);
    float4 _2106 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5789, float3(0.0), isnan(_5789)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5789, float3(0.0), isnan(_5789)), level(0.0)).xyzw;
    float _2108 = _2106.x;
    float _2110 = _2106.y;
    float _2112 = _2106.z;
    float _2114 = _2106.w;
    float2 _5806 = float2(_2101, _2087);
    float3 _2118 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5806, float2(0.0), isnan(_5806)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5806, float2(0.0), isnan(_5806)), level(0.0)).xyz;
    float _2120 = _2118.x;
    float _2122 = _2118.y;
    float _2124 = _2118.z;
    float _2126 = -_1061;
    float _2128 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[18].w, _647);
    float _2130 = -_1063;
    float _2132 = fma(_2130, (*spvDescriptorSet0.vp_c9)._m0[18].w, _965);
    float _2134 = -_1097;
    float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[18].w, _977);
    bool _2138 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2140 = isnan(0.5);
    bool _2142 = _2138 || _2140;
    bool _2144 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2146 = _2142 || _2144;
    float _2148 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2150 = _2128 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2152 = _2003 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2154 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2148);
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2150);
    float _2158 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2152);
    float _2160 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2154);
    float _2162 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2156);
    float _2164 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2166 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2168 = _2136;
    float _2170 = _2160;
    float _2172 = _2158;
    float _2174 = _2043;
    float _2176 = _2069;
    if (!_2146)
    {
        _2168 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2178 = _2168;
    float _2180 = 1.0 / _2164;
    float _2182 = _2166 + _2164;
    float _2184 = _2178;
    if (!_2146)
    {
        _1437 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2186 = _1437;
    if (!_2146)
    {
        float _2188 = -_2186;
        float _2190 = _2188 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2170 = _2190;
    }
    float _2192 = _2170;
    float _2194 = _2192;
    if (!_2146)
    {
        float _2196 = 1.0 / _2192;
        _2194 = _2196;
    }
    float _2198 = _2194;
    float _2200 = _2182 * _2180;
    float _2202 = _2200 * 0.5;
    float _2204 = _2180;
    if (!_2146)
    {
        float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2208 = fma(_2202, _2178, _2206);
        _2204 = _2208;
    }
    float _2210 = _2204;
    float _2212 = _1999 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2214 = fma(_1989, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2158);
    if (_2146)
    {
        _2172 = 1.0;
    }
    float _2216 = _2172;
    float _2218 = _2210;
    float _2220 = _2216;
    float _2222 = _2075;
    if (!_2146)
    {
        float _2224 = 1.0 / _2210;
        _2218 = _2224;
    }
    float _2226 = _2218;
    float _2228 = fma(_2017, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2214);
    float _2230 = _2228 + _2043;
    out.gl_Position.x = _2075;
    out.gl_Position.y = _2069;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _2043;
    float _2232 = exp2(_2212);
    float _2234 = _2228;
    if (!_2146)
    {
        float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2238 = -_2186;
        float _2240 = fma(_2226, _2236, _2238);
        _2184 = _2240;
    }
    float _2242 = _2184;
    float _2244 = _2230 * 0.5;
    if (!_2146)
    {
        float _2246 = _2242 * _2198;
        float _2248 = precise::clamp(_2246, 0.0, 1.0);
        _2220 = _2248;
    }
    float _2250 = _2220;
    bool _2252 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2254 = isnan(_1805);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2260 = _2256 || _2258;
    float _2262 = -_2232;
    float _2264 = _2262 + 1.0;
    float _2266 = _2264 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_66.z = _2244;
    out.m_66.w = _2043;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    if (!_2260)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2272 = _2174;
    float _2274 = _2272;
    float _2276 = _2272;
    if (!_2260)
    {
        _2234 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2278 = _2234;
    float _2280 = _2278;
    float _2282 = _2278;
    if (!_2260)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2284 = _2176;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2260)
    {
        _2222 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2290 = _2222;
    float _2292 = _2266 * _2103;
    float _2294 = _2114 * _2292;
    float _2296 = _2124 * _2292;
    float _2298 = _2114 * _2270;
    float _2300 = fma(_2120, _2294, _2108);
    float _2302 = fma(_2122, _2294, _2110);
    float _2304 = fma(_2114, _2296, _2112);
    float _2306 = _2114;
    float _2308 = _2112;
    float _2310 = _2290;
    float _2312 = _2290;
    if (!_2260)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2314 = _2306;
    float _2316 = _2250 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2318 = _2314;
    float _2320 = _2314;
    if (!_2260)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2322 = _2308;
    out.m_68.x = _2300;
    out.m_68.y = _2302;
    out.m_68.z = _2304;
    out.m_68.w = _2298;
    bool _2324 = !_2260;
    float _2326 = _2322;
    float _2328 = _2322;
    if (!_2324)
    {
        bool _2330 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2332 = isnan(_1805);
        bool _2334 = _2330 || _2332;
        bool _2336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2338 = _2334 || _2336;
        if (!_2338)
        {
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2342 = _1805 + _2340;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2344;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2352 = 1.0 / _2346;
            float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2356 = _2354 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2360 = _2358 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2364 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2366 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2368 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2370 = _2342 * _2352;
            float _2372 = precise::clamp(_2370, 0.0, 1.0);
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2378 = fma(_2372, _2350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2380 = fma(_2372, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2382 = fma(_2372, _2356, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2384 = fma(_2372, _2360, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2386 = fma(_2372, _2364, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2388 = fma(_2372, _2368, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2328 = _2382;
            _2288 = _2386;
            _2320 = _2378;
            _2282 = _2384;
            _2276 = _2380;
            _2312 = _2388;
            _2390 = true;
        }
        else
        {
            bool _2392 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2394 = isnan(_1805);
            bool _2396 = _2392 || _2394;
            bool _2398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2400 = _2396 || _2398;
            if (!_2400)
            {
                _2318 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2402 = _2318;
            _2320 = _2402;
            if (!_2400)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2404 = _2326;
            _2328 = _2404;
            if (!_2400)
            {
                _2274 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2406 = _2274;
            _2276 = _2406;
            if (!_2400)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2408 = _2280;
            _2282 = _2408;
            if (!_2400)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2410 = _2286;
            _2288 = _2410;
            if (!_2400)
            {
                _2310 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2412 = _2310;
            bool _2414 = !_2400;
            _2312 = _2412;
            if (!_2414)
            {
                bool _2416 = _1805 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2418 = isnan(_1805);
                bool _2420 = _2416 || _2418;
                bool _2422 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2424 = _2420 || _2422;
                if (!_2424)
                {
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2428 = _1805 + _2426;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2432 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2430;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2438 = 1.0 / _2432;
                    float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2448 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2450 = _2448 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2454 = _2452 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2456 = _2428 * _2438;
                    float _2458 = precise::clamp(_2456, 0.0, 1.0);
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2464 = fma(_2458, _2436, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2466 = fma(_2458, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2468 = fma(_2458, _2442, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2470 = fma(_2458, _2446, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2472 = fma(_2458, _2450, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2474 = fma(_2458, _2454, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2328 = _2468;
                    _2288 = _2472;
                    _2320 = _2464;
                    _2282 = _2470;
                    _2276 = _2466;
                    _2312 = _2474;
                    _2390 = true;
                }
                else
                {
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2320 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2276 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2312 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2390 = false;
    float _2476 = _2328;
    float _2478 = _2288;
    float _2480 = _2320;
    float _2482 = _2282;
    float _2484 = _2276;
    float _2486 = _2312;
    float _2488 = _2316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2490 = fma(_1541, -0.5, 0.5);
    float _2492 = precise::clamp(_2490, 0.0, 1.0);
    float _2494 = -_2476;
    float _2496 = _2494 + _2478;
    float _2498 = -_2480;
    float _2500 = _2498 + _2482;
    out.m_70.x = 0.0;
    float _2502 = fma(_2492, _2496, _2476);
    float _2504 = -_2484;
    float _2506 = _2504 + _2486;
    float _2508 = fma(_2492, _2500, _2480);
    float _2510 = _2502 * 0.586610972881317138671875;
    bool _2512 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2514 = fma(_2492, _2506, _2484);
    out.m_47.x = _2488;
    float _2516 = fma(_2508, 0.298911988735198974609375, _2510);
    bool _2518 = _2250 > 0.0;
    bool _2520 = isnan(_2250);
    bool _2522 = _2518 || _2520;
    bool _2524 = isnan(0.0);
    bool _2526 = _2522 || _2524;
    float _2528 = fma(_2514, 0.114477999508380889892578125, _2516);
    float _2530 = -_2528;
    float _2532 = _2508 + _2530;
    float _2534 = -_2528;
    float _2536 = _2502 + _2534;
    float _2538 = -_2528;
    float _2540 = _2514 + _2538;
    float _2542 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2544 = fma(_2536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    float _2546 = fma(_2540, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2528);
    bool _2548 = !_2512;
    if (!_2548)
    {
        float _2550 = -_1775;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2554 = -_1779;
        float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2558 = -_1783;
        float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2562 = _2552 * _2552;
        float _2564 = fma(_2556, _2556, _2562);
        float _2566 = fma(_2560, _2560, _2564);
        float _2568 = sqrt(_2566);
        float _2570 = rsqrt(_2566);
        float _2572 = -_2568;
        float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2576 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2578 = precise::clamp(_2576, 0.0, 1.0);
        float _2580 = _2556 * _2570;
        float _2582 = _2552 * _2570;
        float _2584 = abs(_2578);
        float _2586 = log2(_2584);
        float _2588 = _2560 * _2570;
        float _2590 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2592 = _1541 * _2582;
        float _2594 = -_2582;
        float _2596 = -_2590;
        float _2598 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2596);
        float _2600 = fma(_1539, _2580, _2592);
        float _2602 = -_2588;
        float _2604 = fma(_2602, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2598);
        float _2606 = fma(_1545, _2588, _2600);
        float _2608 = precise::clamp(_2606, 0.0, 1.0);
        float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2612 = _2604 + _2610;
        float _2614 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2616 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2618 = precise::clamp(_2616, 0.0, 1.0);
        float _2620 = exp2(_2614);
        float _2622 = _2620 * _2618;
        float _2624 = _2608 * _2622;
        float _2626 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2628 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2630 = _2624 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_70.x = _2626;
        out.m_70.y = _2628;
        out.m_70.z = _2630;
    }
    out.m_72.x = _2542;
    out.m_72.y = _2544;
    out.m_72.z = _2546;
    if (_2526)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2632;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

