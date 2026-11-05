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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
    float4 m_68 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _931 = false;
    bool _413 = false;
    bool _313 = false;
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
        float _1721 = as_type<float>(_107);
        out.gl_Position.z = _1721;
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
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_143);
        out.gl_Position.z = _1789;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = _149 * _147;
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    int _181 = as_type<int>(_151) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_151) & 2;
    bool _187 = _185 != 0;
    float _189 = _179 * 6.283185482025146484375;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = floor(_179);
    float _197 = _189 * 0.15915493667125701904296875;
    bool _199 = !_187;
    float _201 = _199 ? (-0.5) : 0.5;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _205 = _203 != 0;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _209 = _207 != 0;
    float _211 = _197 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _155 * _161;
    float _217 = _155 * _167;
    bool _219 = !_193;
    int _221 = _219 ? 0 : 1;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = _155 * _175;
    float _229 = fma(_153, _159, _215);
    float _231 = fma(_153, _165, _217);
    int _233 = abs(_225);
    float _235 = fma(_153, _173, _227);
    int _237 = abs(_221);
    float _239 = -_195;
    float _241 = _179 + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_241;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_233);
    float _251 = fma(_213, 0.5, 0.5);
    bool _253 = !_209;
    int _255 = _253 ? 0 : 1;
    bool _257 = _241 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_247);
    float _263 = _249 * _261;
    int _265 = abs(_255);
    float _267 = -_251;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_237);
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = fma(_271, _269, _263);
    float _281 = fma(_157, _163, _229);
    float _283 = fma(_157, _169, _231);
    float _285 = fma(_157, _177, _235);
    float _287 = abs(_275);
    float _289 = fma(_277, _287, _279);
    bool _291 = !_183;
    float _293 = _291 ? (-0.5) : 0.5;
    bool _295 = !_243;
    float _311;
    if (!_295)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_91);
        float _317 = 1.0 / _315;
        float _319 = _125 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_91);
        float _417 = 1.0 / _415;
        float _419 = _125 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _431 = _145 > 0.5;
    float _433 = in.m_51.y;
    bool _435 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_421);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _447;
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = 1.0 / _449;
    float _463 = _161 * _425;
    float _465 = _175 * _425;
    float _467 = _167 * _425;
    float _469 = fma(_159, _423, _463);
    float _471 = fma(_173, _423, _465);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = _421 + _473;
    float _477 = fma(_165, _423, _467);
    float _479 = fma(_163, _427, _469);
    float _481 = fma(_177, _427, _471);
    bool _483 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_421);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _475 * _461;
    float _497 = fma(_169, _427, _477);
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    float _507 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = _445 * _501;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = fma(_505, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = _507 + _527;
    bool _531 = _433 > 0.5;
    float _533 = _519 * _513;
    float _535 = -_293;
    int _537 = _431 ? as_type<int>(_535) : as_type<int>(_293);
    float _539 = _521 * _513;
    float _541 = _525 * _513;
    float _543 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _523 + _545;
    float _549 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = -_201;
    int _553 = _531 ? as_type<int>(_551) : as_type<int>(_201);
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _557 = _543 + _555;
    bool _559 = !_455;
    float _561 = _559 ? _293 : as_type<float>(_537);
    float _563 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    float _565 = -_445;
    float _567 = _565 + 1.0;
    bool _569 = !_459;
    float _571 = _569 ? _201 : as_type<float>(_553);
    float _573 = _561 + 0.5;
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[28].z, _563);
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _541);
    float _583 = -_571;
    float _585 = _583 + 0.5;
    float _587 = _529 * _529;
    bool _589 = _575 >= 0.0;
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].y, _579);
    float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = fma(_547, _547, _587);
    float _597 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].x, _577);
    float _599 = _573 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _593 * _429;
    float _603 = fma(_557, _557, _595);
    float _605 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    float _607 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = _599 * _451;
    float _611 = rsqrt(_603);
    float _613 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _615 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _433;
    int _619 = as_type<int>(_615);
    float _621 = _543;
    float _623 = _523;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _617;
    float _627 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_589)
    {
        float _635 = _625 * 5.0;
        _619 = as_type<int>(_635);
    }
    int _637 = _619;
    out.m_64.x = _609;
    out.m_64.y = _601;
    out.m_66.x = _627;
    out.m_66.y = _629;
    out.m_66.z = _631;
    out.m_66.w = _633;
    float _639 = _529 * _611;
    float _641 = _547 * _611;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_637);
        out.gl_Position.z = _2586;
    }
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    if (_589)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _643 = -_639;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _647 = _557 * _611;
    float _649 = -_641;
    float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _645 + _657;
    float _661 = -_647;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = in.m_68.x;
    float _671 = in.m_68.y;
    float _673 = _659 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _663 + _675;
    float _679 = -_641;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _683 = _655 * _655;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _673);
    float _687 = -_647;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _691 = fma(_681, _681, _683);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[28].z, _685);
    float _695 = fma(_689, _689, _691);
    bool _697 = _693 >= 0.0;
    float _699 = sqrt(_695);
    float _701 = _391 * _669;
    float _703 = _393 * _671;
    float _705 = _683;
    if (_697)
    {
        _705 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _705;
    int _709 = as_type<int>(_707);
    if (_697)
    {
        out.m_47.x = 0.0;
    }
    float _711 = _289 * _701;
    float _713 = _289 * _703;
    if (_697)
    {
        float _715 = _707 * 5.0;
        _709 = as_type<int>(_715);
    }
    int _717 = _709;
    float _719 = _611 * _699;
    if (_697)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_717);
        out.gl_Position.z = _2734;
    }
    if (_697)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _723 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _729 = _719 * _721;
    float _731 = _719 * _723;
    float _733 = _719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _725 * _729;
    float _739 = _727 * _731;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _745 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _749 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].x, _743);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].x, _745);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _747);
    float _755 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _759 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _765 = _523 + _759;
    float _767 = _543 + _761;
    float _769 = _507 + _763;
    float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _773 = _765 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = _773 * _773;
    float _781 = _777 * _777;
    float _783 = _779 + _781;
    float _785 = sqrt(_783);
    bool _787 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _789 = _745;
    float _791 = _763;
    float _793 = _765;
    float _795 = _735;
    float _797 = _781;
    if (!_787)
    {
        _789 = _765;
    }
    float _799 = _789;
    float _801 = _799;
    if (!_787)
    {
        _791 = _779;
    }
    float _803 = _791;
    float _805 = _803;
    if (!_787)
    {
        _793 = _767;
    }
    float _807 = _793;
    float _809 = _807;
    if (!_787)
    {
        _795 = _769;
    }
    float _811 = _795;
    bool _813 = !_787;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _785 + _819;
        float _823 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = rsqrt(_783);
        float _827 = _821 * _817;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = sin(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _841 = _825 * _839;
        float _843 = _837 + (-1.0);
        float _845 = fma(_773, _841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _847 = fma(_777, _841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _849 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _853 = _845 + _851;
        float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _857 = _847 + _855;
        float _859 = fma(_769, _837, _849);
        float _861 = _853 * _853;
        float _863 = _857 * _857;
        _815 = _859;
        _805 = _861;
        _797 = _863;
        _801 = _845;
        _809 = _847;
    }
    float _865 = _815;
    float _867 = _805;
    float _869 = _797;
    float _871 = _801;
    float _873 = _809;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _877 = _865 + _875;
    float _879 = fma(_877, _877, _867);
    float _881 = _879 + _869;
    float _883 = sqrt(_881);
    bool _885 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    float _895 = _879;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _897 = _895;
    bool _899 = !_893;
    float _901 = _897;
    if (!_899)
    {
        bool _903 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _905 = isnan(_883);
        bool _907 = _903 || _905;
        bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _911 = _907 || _909;
        if (!_911)
        {
            float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _915 = _883 + _913;
            float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _919 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _917;
            float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _925 = 1.0 / _919;
            float _927 = _915 * _925;
            float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _901 = _929;
            _931 = true;
        }
        else
        {
            bool _933 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _935 = isnan(_883);
            bool _937 = _933 || _935;
            bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _941 = _937 || _939;
            if (!_941)
            {
                float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _945 = _883 + _943;
                float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _955 = 1.0 / _949;
                float _957 = _945 * _955;
                float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _901 = _959;
                _931 = true;
            }
            else
            {
                _901 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _931 = false;
    float _961 = _901;
    float _963 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _965 = _865 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _871 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _973 = _873 + _971;
    float _975 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _977 = fma(_969, _961, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _979 = fma(_973, _961, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _981 = -_507;
    float _983 = _981 + _975;
    float _985 = -_523;
    float _987 = _985 + _977;
    float _989 = -_543;
    float _991 = _989 + _979;
    float _993 = _983 * _983;
    bool _995 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_987, _987, _993);
    float _1017 = fma(_991, _991, _1015);
    float _1019 = _645 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = sqrt(_1017);
    float _1023 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1025 = _645 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1027 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1029 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1025);
    float _1031 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1029);
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1035 = _1021 > 0.0;
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = 1.0 / _1037;
    float _1041 = _1033 + _1037;
    float _1043 = _1027;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1049 = _975;
    if (!_1035)
    {
        _1043 = _977;
    }
    float _1051 = _1043;
    float _1053 = _1051;
    float _1055 = _1051;
    if (!_1035)
    {
        _1045 = _975;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    float _1061 = _1057;
    if (!_1035)
    {
        _1047 = _979;
    }
    float _1063 = _1047;
    bool _1065 = !_1035;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = _283 * _283;
        float _1071 = fma(_281, _281, _1069);
        float _1073 = rsqrt(_1017);
        float _1075 = fma(_285, _285, _1071);
        float _1077 = sqrt(_1075);
        float _1079 = _987 * _1073;
        float _1081 = _983 * _1073;
        float _1083 = _991 * _1073;
        bool _1085 = _1077 > 0.0;
        float _1087 = _1077;
        if (!_1085)
        {
            _1053 = _977;
        }
        float _1089 = _1053;
        _1055 = _1089;
        if (!_1085)
        {
            _1059 = _975;
        }
        float _1091 = _1059;
        _1061 = _1091;
        if (!_1085)
        {
            _1087 = _979;
        }
        float _1093 = _1087;
        bool _1095 = !_1085;
        _1067 = _1093;
        if (!_1095)
        {
            float _1097 = rsqrt(_1075);
            float _1099 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1101 = _283 * _1097;
            float _1103 = _281 * _1097;
            float _1105 = _1081 * _1101;
            float _1107 = _285 * _1097;
            float _1109 = fma(_1079, _1103, _1105);
            float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1113 = fma(_1083, _1107, _1109);
            float _1115 = _1113 * _1111;
            float _1117 = fma(_281, _1115, _977);
            float _1119 = fma(_283, _1115, _975);
            float _1121 = fma(_285, _1115, _979);
            _1055 = _1117;
            _1061 = _1119;
            _1067 = _1121;
        }
    }
    float _1123 = _1055;
    float _1125 = _1061;
    float _1127 = _1067;
    float _1129 = -_641;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1133 = -_639;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1137 = -_647;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1141 = _1041 * _1039;
    float _1143 = _1141 * 0.5;
    float _1145 = _1135;
    float _1147 = _1131;
    float _1149 = _1139;
    if (_1013)
    {
        _1049 = 1.0;
    }
    float _1151 = _1049;
    float _1153 = _1151;
    if (!_1003)
    {
        float _1155 = _659 * _659;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1159 = -_543;
        float _1161 = _1159 + _1127;
        float _1163 = -_523;
        float _1165 = _1163 + _1123;
        float _1167 = fma(_667, _667, _1155);
        float _1169 = -_507;
        float _1171 = _1169 + _1125;
        float _1173 = fma(_677, _677, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = sqrt(_1173);
        float _1179 = 1.0 / _719;
        float _1181 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1183 = _1181 * _1157;
        float _1185 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1187 = _1183 * _1179;
        float _1189 = _1185 * _1187;
        float _1191 = _1161 * _1187;
        float _1193 = fma(_1165, _1189, _651);
        float _1195 = fma(_1171, _1189, _645);
        float _1197 = fma(_1185, _1191, _663);
        _1145 = _1195;
        _1147 = _1193;
        _1149 = _1197;
        _621 = _1191;
        _623 = _1165;
    }
    float _1199 = _1145;
    float _1201 = _1147;
    float _1203 = _1149;
    float _1205 = _621;
    float _1207 = _623;
    float _1209 = _1207;
    float _1211 = _1205;
    if (!_1013)
    {
        float _1213 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1217 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = _1219 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1223;
        float _1235 = _1227 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = _1231 * _1233;
        float _1241 = 1.0 / _1217;
        float _1243 = _1237 * _1239;
        float _1245 = _1227 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1249;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1255 = _1241 * _1253;
        float _1257 = 1.0 / _1243;
        float _1259 = 1.0 / _1251;
        float _1261 = _1247 * _1257;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = fma(_1261, _1255, _1263);
        float _1267 = _1265 * _1259;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        _1209 = _1259;
        _1153 = _1269;
    }
    float _1271 = _1209;
    float _1273 = _1153;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1199 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1201 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1203 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1281 * _1295;
    float _1299 = _1285 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1293;
    float _1317 = _1313;
    float _1319 = _1277;
    float _1321 = _1295;
    float _1323 = _1297;
    if (_1309)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = _1327;
    if (_1309)
    {
        float _1331 = _1313 * _1327;
        _1317 = _1331;
    }
    float _1333 = _1317;
    if (_1309)
    {
        float _1335 = rsqrt(_1305);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1309)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1211 = _1341;
    }
    float _1343 = _1211;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1309)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1271;
    float _1361 = _1355;
    if (_1309)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1295;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1309)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1375;
    }
    float _1377 = _1319;
    float _1379 = sqrt(_1291);
    float _1381 = _1353;
    float _1383 = _1377;
    if (_1309)
    {
        float _1385 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1337 * _1387;
        _1321 = _1391;
    }
    float _1393 = _1321;
    if (!_1309)
    {
        _1339 = _1373;
    }
    float _1395 = _1339;
    float _1397 = _1395;
    if (_1309)
    {
        float _1399 = _1367 + (-1.0);
        _1361 = _1399;
    }
    float _1401 = _1361;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1297 * _1393;
        _1323 = _1405;
    }
    float _1407 = _1323;
    if (!_1309)
    {
        _1389 = _1299;
    }
    float _1409 = _1389;
    float _1411 = _1409;
    if (_1309)
    {
        float _1413 = _1299 * _1393;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1309)
    {
        float _1417 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1417;
    }
    float _1419 = _1383;
    float _1421 = _1419;
    if (!_1309)
    {
        _1403 = _1301;
    }
    float _1423 = _1403;
    float _1425 = _1423;
    if (_1309)
    {
        float _1427 = _1407 * _1407;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1309)
    {
        float _1431 = fma(_1373, _1367, _1419);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1309)
    {
        _1421 = _1303;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1309)
    {
        float _1439 = _1415 * _1415;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = fma(_1433, _1433, _1429);
    float _1445 = _1443 + _1441;
    float _1447 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1457 = rsqrt(_1445);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1461 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1459);
    float _1471 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1455);
    float _1475 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1463);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = abs(_1467);
    float _1483 = log2(_1481);
    float _1485 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1493 = _1457 * _1407;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = _1457 * _1433;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1507 = _1457 * _1415;
    float _1509 = -_1491;
    float _1511 = fma(_1509, _1357, 1.0);
    float _1513 = -_1503;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1519 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1521 = log2(_1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1517);
    float _1529 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1531 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1533 = fma(_1525, -0.5, 0.5);
    float _1535 = fma(_1525, 0.5, 0.5);
    float _1537 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1529);
    float _1539 = exp2(_1519);
    float _1541 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1531);
    float _1543 = _1501 + 1.0;
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1535, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1541);
    float _1551 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1553 = 1.0 / _1527;
    float _1555 = fma(_1535, _1547, -0.212114393711090087890625);
    float _1557 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1549);
    float _1559 = _1521 * 0.693147182464599609375;
    float _1561 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1533);
    float _1565 = -_1501;
    float _1567 = fma(_1539, _1543, _1565);
    float _1569 = fma(_1535, _1555, 1.570728778839111328125);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1551 * _1553;
    float _1575 = _1557 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = -_1569;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _4133 = float3(_1577, _1579, _1561);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4133, float3(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4133, float3(0.0), isnan(_4133)), level(0.0)).x;
    float3 _4144 = float3(_1577, _1579, _1561);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4144, float3(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4144, float3(0.0), isnan(_4144)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4161 = float2(_1585, _1571);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4161, float2(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4161, float2(0.0), isnan(_4161)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1612 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1614 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1616 = _1273 > 0.0;
    bool _1618 = isnan(_1273);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1612);
    float _1628 = exp2(_1610);
    float _1630 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1632 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1630);
    float _1634 = _1632 + _1527;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1527;
    float _1636 = _1634 * 0.5;
    float _1638 = -_1628;
    float _1640 = _1638 + 1.0;
    float _1642 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1636;
    out.m_70.w = _1527;
    float _1646 = -_1644;
    float _1648 = _1646 + 1.0;
    out.m_47.x = _1642;
    float _1650 = _1644 * _1587;
    float _1652 = _1598 * _1650;
    float _1654 = _1608 * _1650;
    float _1656 = _1598 * _1648;
    float _1658 = fma(_1604, _1652, _1592);
    float _1660 = fma(_1606, _1652, _1594);
    float _1662 = fma(_1598, _1654, _1596);
    out.m_72.x = _1658;
    out.m_72.y = _1660;
    out.m_72.z = _1662;
    out.m_72.w = _1656;
    if (_1624)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _931 = false;
    bool _413 = false;
    bool _313 = false;
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
        float _1721 = as_type<float>(_107);
        out.gl_Position.z = _1721;
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
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_143);
        out.gl_Position.z = _1789;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = _149 * _147;
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    int _181 = as_type<int>(_151) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_151) & 2;
    bool _187 = _185 != 0;
    float _189 = _179 * 6.283185482025146484375;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = floor(_179);
    float _197 = _189 * 0.15915493667125701904296875;
    bool _199 = !_187;
    float _201 = _199 ? (-0.5) : 0.5;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _205 = _203 != 0;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _209 = _207 != 0;
    float _211 = _197 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _155 * _161;
    float _217 = _155 * _167;
    bool _219 = !_193;
    int _221 = _219 ? 0 : 1;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = _155 * _175;
    float _229 = fma(_153, _159, _215);
    float _231 = fma(_153, _165, _217);
    int _233 = abs(_225);
    float _235 = fma(_153, _173, _227);
    int _237 = abs(_221);
    float _239 = -_195;
    float _241 = _179 + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_241;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_233);
    float _251 = fma(_213, 0.5, 0.5);
    bool _253 = !_209;
    int _255 = _253 ? 0 : 1;
    bool _257 = _241 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_247);
    float _263 = _249 * _261;
    int _265 = abs(_255);
    float _267 = -_251;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_237);
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = fma(_271, _269, _263);
    float _281 = fma(_157, _163, _229);
    float _283 = fma(_157, _169, _231);
    float _285 = fma(_157, _177, _235);
    float _287 = abs(_275);
    float _289 = fma(_277, _287, _279);
    bool _291 = !_183;
    float _293 = _291 ? (-0.5) : 0.5;
    bool _295 = !_243;
    float _311;
    if (!_295)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_91);
        float _317 = 1.0 / _315;
        float _319 = _125 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_91);
        float _417 = 1.0 / _415;
        float _419 = _125 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _431 = _145 > 0.5;
    float _433 = in.m_51.y;
    bool _435 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_421);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _447;
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = 1.0 / _449;
    float _463 = _161 * _425;
    float _465 = _175 * _425;
    float _467 = _167 * _425;
    float _469 = fma(_159, _423, _463);
    float _471 = fma(_173, _423, _465);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = _421 + _473;
    float _477 = fma(_165, _423, _467);
    float _479 = fma(_163, _427, _469);
    float _481 = fma(_177, _427, _471);
    bool _483 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_421);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _475 * _461;
    float _497 = fma(_169, _427, _477);
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    float _507 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = _445 * _501;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = fma(_505, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = _507 + _527;
    bool _531 = _433 > 0.5;
    float _533 = _519 * _513;
    float _535 = -_293;
    int _537 = _431 ? as_type<int>(_535) : as_type<int>(_293);
    float _539 = _521 * _513;
    float _541 = _525 * _513;
    float _543 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _523 + _545;
    float _549 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = -_201;
    int _553 = _531 ? as_type<int>(_551) : as_type<int>(_201);
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _557 = _543 + _555;
    bool _559 = !_455;
    float _561 = _559 ? _293 : as_type<float>(_537);
    float _563 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    float _565 = -_445;
    float _567 = _565 + 1.0;
    bool _569 = !_459;
    float _571 = _569 ? _201 : as_type<float>(_553);
    float _573 = _561 + 0.5;
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[28].z, _563);
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _541);
    float _583 = -_571;
    float _585 = _583 + 0.5;
    float _587 = _529 * _529;
    bool _589 = _575 >= 0.0;
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].y, _579);
    float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = fma(_547, _547, _587);
    float _597 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].x, _577);
    float _599 = _573 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _593 * _429;
    float _603 = fma(_557, _557, _595);
    float _605 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    float _607 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = _599 * _451;
    float _611 = rsqrt(_603);
    float _613 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _615 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _433;
    int _619 = as_type<int>(_615);
    float _621 = _543;
    float _623 = _523;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _617;
    float _627 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_589)
    {
        float _635 = _625 * 5.0;
        _619 = as_type<int>(_635);
    }
    int _637 = _619;
    out.m_64.x = _609;
    out.m_64.y = _601;
    out.m_66.x = _627;
    out.m_66.y = _629;
    out.m_66.z = _631;
    out.m_66.w = _633;
    float _639 = _529 * _611;
    float _641 = _547 * _611;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_637);
        out.gl_Position.z = _2586;
    }
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    if (_589)
    {
        return out;
    }
    float _643 = -_639;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _647 = _557 * _611;
    float _649 = -_641;
    float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _645 + _657;
    float _661 = -_647;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = in.m_68.x;
    float _671 = in.m_68.y;
    float _673 = _659 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _663 + _675;
    float _679 = -_641;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _683 = _655 * _655;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _673);
    float _687 = -_647;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _691 = fma(_681, _681, _683);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[28].z, _685);
    float _695 = fma(_689, _689, _691);
    bool _697 = _693 >= 0.0;
    float _699 = sqrt(_695);
    float _701 = _391 * _669;
    float _703 = _393 * _671;
    float _705 = _683;
    if (_697)
    {
        _705 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _705;
    int _709 = as_type<int>(_707);
    if (_697)
    {
        out.m_47.x = 0.0;
    }
    float _711 = _289 * _701;
    float _713 = _289 * _703;
    if (_697)
    {
        float _715 = _707 * 5.0;
        _709 = as_type<int>(_715);
    }
    int _717 = _709;
    float _719 = _611 * _699;
    if (_697)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_717);
        out.gl_Position.z = _2734;
    }
    if (_697)
    {
        return out;
    }
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _723 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _729 = _719 * _721;
    float _731 = _719 * _723;
    float _733 = _719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _725 * _729;
    float _739 = _727 * _731;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _745 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _749 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].x, _743);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].x, _745);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _747);
    float _755 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _759 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _765 = _523 + _759;
    float _767 = _543 + _761;
    float _769 = _507 + _763;
    float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _773 = _765 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = _773 * _773;
    float _781 = _777 * _777;
    float _783 = _779 + _781;
    float _785 = sqrt(_783);
    bool _787 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _789 = _745;
    float _791 = _763;
    float _793 = _765;
    float _795 = _735;
    float _797 = _781;
    if (!_787)
    {
        _789 = _765;
    }
    float _799 = _789;
    float _801 = _799;
    if (!_787)
    {
        _791 = _779;
    }
    float _803 = _791;
    float _805 = _803;
    if (!_787)
    {
        _793 = _767;
    }
    float _807 = _793;
    float _809 = _807;
    if (!_787)
    {
        _795 = _769;
    }
    float _811 = _795;
    bool _813 = !_787;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _785 + _819;
        float _823 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = rsqrt(_783);
        float _827 = _821 * _817;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = sin(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _841 = _825 * _839;
        float _843 = _837 + (-1.0);
        float _845 = fma(_773, _841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _847 = fma(_777, _841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _849 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _853 = _845 + _851;
        float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _857 = _847 + _855;
        float _859 = fma(_769, _837, _849);
        float _861 = _853 * _853;
        float _863 = _857 * _857;
        _815 = _859;
        _805 = _861;
        _797 = _863;
        _801 = _845;
        _809 = _847;
    }
    float _865 = _815;
    float _867 = _805;
    float _869 = _797;
    float _871 = _801;
    float _873 = _809;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _877 = _865 + _875;
    float _879 = fma(_877, _877, _867);
    float _881 = _879 + _869;
    float _883 = sqrt(_881);
    bool _885 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    float _895 = _879;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _897 = _895;
    bool _899 = !_893;
    float _901 = _897;
    if (!_899)
    {
        bool _903 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _905 = isnan(_883);
        bool _907 = _903 || _905;
        bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _911 = _907 || _909;
        if (!_911)
        {
            float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _915 = _883 + _913;
            float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _919 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _917;
            float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _925 = 1.0 / _919;
            float _927 = _915 * _925;
            float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _901 = _929;
            _931 = true;
        }
        else
        {
            bool _933 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _935 = isnan(_883);
            bool _937 = _933 || _935;
            bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _941 = _937 || _939;
            if (!_941)
            {
                float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _945 = _883 + _943;
                float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _955 = 1.0 / _949;
                float _957 = _945 * _955;
                float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _901 = _959;
                _931 = true;
            }
            else
            {
                _901 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _931 = false;
    float _961 = _901;
    float _963 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _965 = _865 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _871 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _973 = _873 + _971;
    float _975 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _977 = fma(_969, _961, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _979 = fma(_973, _961, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _981 = -_507;
    float _983 = _981 + _975;
    float _985 = -_523;
    float _987 = _985 + _977;
    float _989 = -_543;
    float _991 = _989 + _979;
    float _993 = _983 * _983;
    bool _995 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_987, _987, _993);
    float _1017 = fma(_991, _991, _1015);
    float _1019 = _645 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = sqrt(_1017);
    float _1023 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1025 = _645 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1027 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1029 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1025);
    float _1031 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1029);
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1035 = _1021 > 0.0;
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = 1.0 / _1037;
    float _1041 = _1033 + _1037;
    float _1043 = _1027;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1049 = _975;
    if (!_1035)
    {
        _1043 = _977;
    }
    float _1051 = _1043;
    float _1053 = _1051;
    float _1055 = _1051;
    if (!_1035)
    {
        _1045 = _975;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    float _1061 = _1057;
    if (!_1035)
    {
        _1047 = _979;
    }
    float _1063 = _1047;
    bool _1065 = !_1035;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = _283 * _283;
        float _1071 = fma(_281, _281, _1069);
        float _1073 = rsqrt(_1017);
        float _1075 = fma(_285, _285, _1071);
        float _1077 = sqrt(_1075);
        float _1079 = _987 * _1073;
        float _1081 = _983 * _1073;
        float _1083 = _991 * _1073;
        bool _1085 = _1077 > 0.0;
        float _1087 = _1077;
        if (!_1085)
        {
            _1053 = _977;
        }
        float _1089 = _1053;
        _1055 = _1089;
        if (!_1085)
        {
            _1059 = _975;
        }
        float _1091 = _1059;
        _1061 = _1091;
        if (!_1085)
        {
            _1087 = _979;
        }
        float _1093 = _1087;
        bool _1095 = !_1085;
        _1067 = _1093;
        if (!_1095)
        {
            float _1097 = rsqrt(_1075);
            float _1099 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1101 = _283 * _1097;
            float _1103 = _281 * _1097;
            float _1105 = _1081 * _1101;
            float _1107 = _285 * _1097;
            float _1109 = fma(_1079, _1103, _1105);
            float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1113 = fma(_1083, _1107, _1109);
            float _1115 = _1113 * _1111;
            float _1117 = fma(_281, _1115, _977);
            float _1119 = fma(_283, _1115, _975);
            float _1121 = fma(_285, _1115, _979);
            _1055 = _1117;
            _1061 = _1119;
            _1067 = _1121;
        }
    }
    float _1123 = _1055;
    float _1125 = _1061;
    float _1127 = _1067;
    float _1129 = -_641;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1133 = -_639;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1137 = -_647;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1141 = _1041 * _1039;
    float _1143 = _1141 * 0.5;
    float _1145 = _1135;
    float _1147 = _1131;
    float _1149 = _1139;
    if (_1013)
    {
        _1049 = 1.0;
    }
    float _1151 = _1049;
    float _1153 = _1151;
    if (!_1003)
    {
        float _1155 = _659 * _659;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1159 = -_543;
        float _1161 = _1159 + _1127;
        float _1163 = -_523;
        float _1165 = _1163 + _1123;
        float _1167 = fma(_667, _667, _1155);
        float _1169 = -_507;
        float _1171 = _1169 + _1125;
        float _1173 = fma(_677, _677, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = sqrt(_1173);
        float _1179 = 1.0 / _719;
        float _1181 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1183 = _1181 * _1157;
        float _1185 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1187 = _1183 * _1179;
        float _1189 = _1185 * _1187;
        float _1191 = _1161 * _1187;
        float _1193 = fma(_1165, _1189, _651);
        float _1195 = fma(_1171, _1189, _645);
        float _1197 = fma(_1185, _1191, _663);
        _1145 = _1195;
        _1147 = _1193;
        _1149 = _1197;
        _621 = _1191;
        _623 = _1165;
    }
    float _1199 = _1145;
    float _1201 = _1147;
    float _1203 = _1149;
    float _1205 = _621;
    float _1207 = _623;
    float _1209 = _1207;
    float _1211 = _1205;
    if (!_1013)
    {
        float _1213 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1217 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = _1219 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1223;
        float _1235 = _1227 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = _1231 * _1233;
        float _1241 = 1.0 / _1217;
        float _1243 = _1237 * _1239;
        float _1245 = _1227 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1249;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1255 = _1241 * _1253;
        float _1257 = 1.0 / _1243;
        float _1259 = 1.0 / _1251;
        float _1261 = _1247 * _1257;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = fma(_1261, _1255, _1263);
        float _1267 = _1265 * _1259;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        _1209 = _1259;
        _1153 = _1269;
    }
    float _1271 = _1209;
    float _1273 = _1153;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1199 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1201 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1203 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1281 * _1295;
    float _1299 = _1285 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1293;
    float _1317 = _1313;
    float _1319 = _1277;
    float _1321 = _1295;
    float _1323 = _1297;
    if (_1309)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = _1327;
    if (_1309)
    {
        float _1331 = _1313 * _1327;
        _1317 = _1331;
    }
    float _1333 = _1317;
    if (_1309)
    {
        float _1335 = rsqrt(_1305);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1309)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1211 = _1341;
    }
    float _1343 = _1211;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1309)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1271;
    float _1361 = _1355;
    if (_1309)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1295;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1309)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1375;
    }
    float _1377 = _1319;
    float _1379 = sqrt(_1291);
    float _1381 = _1353;
    float _1383 = _1377;
    if (_1309)
    {
        float _1385 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1337 * _1387;
        _1321 = _1391;
    }
    float _1393 = _1321;
    if (!_1309)
    {
        _1339 = _1373;
    }
    float _1395 = _1339;
    float _1397 = _1395;
    if (_1309)
    {
        float _1399 = _1367 + (-1.0);
        _1361 = _1399;
    }
    float _1401 = _1361;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1297 * _1393;
        _1323 = _1405;
    }
    float _1407 = _1323;
    if (!_1309)
    {
        _1389 = _1299;
    }
    float _1409 = _1389;
    float _1411 = _1409;
    if (_1309)
    {
        float _1413 = _1299 * _1393;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1309)
    {
        float _1417 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1417;
    }
    float _1419 = _1383;
    float _1421 = _1419;
    if (!_1309)
    {
        _1403 = _1301;
    }
    float _1423 = _1403;
    float _1425 = _1423;
    if (_1309)
    {
        float _1427 = _1407 * _1407;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1309)
    {
        float _1431 = fma(_1373, _1367, _1419);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1309)
    {
        _1421 = _1303;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1309)
    {
        float _1439 = _1415 * _1415;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = fma(_1433, _1433, _1429);
    float _1445 = _1443 + _1441;
    float _1447 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1457 = rsqrt(_1445);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1461 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1459);
    float _1471 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1455);
    float _1475 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1463);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = abs(_1467);
    float _1483 = log2(_1481);
    float _1485 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1493 = _1457 * _1407;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = _1457 * _1433;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1507 = _1457 * _1415;
    float _1509 = -_1491;
    float _1511 = fma(_1509, _1357, 1.0);
    float _1513 = -_1503;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1519 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1521 = log2(_1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1517);
    float _1529 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1531 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1533 = fma(_1525, -0.5, 0.5);
    float _1535 = fma(_1525, 0.5, 0.5);
    float _1537 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1529);
    float _1539 = exp2(_1519);
    float _1541 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1531);
    float _1543 = _1501 + 1.0;
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1535, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1541);
    float _1551 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1553 = 1.0 / _1527;
    float _1555 = fma(_1535, _1547, -0.212114393711090087890625);
    float _1557 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1549);
    float _1559 = _1521 * 0.693147182464599609375;
    float _1561 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1533);
    float _1565 = -_1501;
    float _1567 = fma(_1539, _1543, _1565);
    float _1569 = fma(_1535, _1555, 1.570728778839111328125);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1551 * _1553;
    float _1575 = _1557 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = -_1569;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _4133 = float3(_1577, _1579, _1561);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4133, float3(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4133, float3(0.0), isnan(_4133)), level(0.0)).x;
    float3 _4144 = float3(_1577, _1579, _1561);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4144, float3(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4144, float3(0.0), isnan(_4144)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4161 = float2(_1585, _1571);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4161, float2(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4161, float2(0.0), isnan(_4161)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1612 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1614 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1616 = _1273 > 0.0;
    bool _1618 = isnan(_1273);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1612);
    float _1628 = exp2(_1610);
    float _1630 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1632 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1630);
    float _1634 = _1632 + _1527;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1527;
    float _1636 = _1634 * 0.5;
    float _1638 = -_1628;
    float _1640 = _1638 + 1.0;
    float _1642 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1636;
    out.m_70.w = _1527;
    float _1646 = -_1644;
    float _1648 = _1646 + 1.0;
    out.m_47.x = _1642;
    float _1650 = _1644 * _1587;
    float _1652 = _1598 * _1650;
    float _1654 = _1608 * _1650;
    float _1656 = _1598 * _1648;
    float _1658 = fma(_1604, _1652, _1592);
    float _1660 = fma(_1606, _1652, _1594);
    float _1662 = fma(_1598, _1654, _1596);
    out.m_72.x = _1658;
    out.m_72.y = _1660;
    out.m_72.z = _1662;
    out.m_72.w = _1656;
    if (_1624)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _931 = false;
    bool _413 = false;
    bool _313 = false;
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
        float _1721 = as_type<float>(_107);
        out.gl_Position.z = _1721;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    if (_121)
    {
        float _129 = float(_91);
        _127 = _129;
    }
    float _131 = _127;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    if (_137)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _101;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1789 = as_type<float>(_143);
        out.gl_Position.z = _1789;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_56.x;
    float _155 = in.m_56.y;
    float _157 = in.m_56.z;
    float _159 = in.m_58.x;
    float _161 = in.m_58.y;
    float _163 = in.m_58.z;
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    float _171 = _149 * _147;
    float _173 = in.m_62.x;
    float _175 = in.m_62.y;
    float _177 = in.m_62.z;
    float _179 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    int _181 = as_type<int>(_151) & 1;
    bool _183 = _181 != 0;
    int _185 = as_type<int>(_151) & 2;
    bool _187 = _185 != 0;
    float _189 = _179 * 6.283185482025146484375;
    int _191 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _193 = _191 != 0;
    float _195 = floor(_179);
    float _197 = _189 * 0.15915493667125701904296875;
    bool _199 = !_187;
    float _201 = _199 ? (-0.5) : 0.5;
    int _203 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _205 = _203 != 0;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _209 = _207 != 0;
    float _211 = _197 * 6.283185482025146484375;
    float _213 = cos(_211);
    float _215 = _155 * _161;
    float _217 = _155 * _167;
    bool _219 = !_193;
    int _221 = _219 ? 0 : 1;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = _155 * _175;
    float _229 = fma(_153, _159, _215);
    float _231 = fma(_153, _165, _217);
    int _233 = abs(_225);
    float _235 = fma(_153, _173, _227);
    int _237 = abs(_221);
    float _239 = -_195;
    float _241 = _179 + _239;
    bool _243 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _245 = -_241;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _249 = float(_233);
    float _251 = fma(_213, 0.5, 0.5);
    bool _253 = !_209;
    int _255 = _253 ? 0 : 1;
    bool _257 = _241 < 0.5;
    float _259 = float(_257);
    float _261 = abs(_247);
    float _263 = _249 * _261;
    int _265 = abs(_255);
    float _267 = -_251;
    float _269 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _271 = float(_237);
    float _273 = -_259;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = fma(_271, _269, _263);
    float _281 = fma(_157, _163, _229);
    float _283 = fma(_157, _169, _231);
    float _285 = fma(_157, _177, _235);
    float _287 = abs(_275);
    float _289 = fma(_277, _287, _279);
    bool _291 = !_183;
    float _293 = _291 ? (-0.5) : 0.5;
    bool _295 = !_243;
    float _311;
    if (!_295)
    {
        float _297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _299 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _303 = _301 * _297;
        float _305 = floor(_303);
        float _307 = -_305;
        float _309 = _303 + _307;
        _311 = _309;
        _313 = true;
    }
    else
    {
        float _315 = float(_91);
        float _317 = 1.0 / _315;
        float _319 = _125 * _317;
        _311 = _319;
    }
    _313 = false;
    float _321 = _311;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _325 = _321 + _323;
    bool _327 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_321);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _339;
    float _343 = -_337;
    float _345 = _343 + 1.0;
    bool _347 = _321 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _349 = isnan(_321);
    bool _351 = _347 || _349;
    bool _353 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _355 = _351 || _353;
    float _357 = float(_355);
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _365 = 1.0 / _341;
    float _367 = _357 * _345;
    float _369 = -_357;
    float _371 = _369 + 1.0;
    float _373 = _325 * _365;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _375;
    float _379 = fma(_361, _373, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _381 = fma(_377, _373, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _383 = _379 * _367;
    float _385 = _381 * _367;
    float _387 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].x, _383);
    float _389 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[143].y, _385);
    float _391 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].x, _387);
    float _393 = fma(_337, (*spvDescriptorSet0.vp_c9)._m0[144].y, _389);
    bool _395 = !_363;
    float _411;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _399 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _411 = _409;
        _413 = true;
    }
    else
    {
        float _415 = float(_91);
        float _417 = 1.0 / _415;
        float _419 = _125 * _417;
        _411 = _419;
    }
    _413 = false;
    float _421 = _411;
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _431 = _145 > 0.5;
    float _433 = in.m_51.y;
    bool _435 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _437 = isnan(_421);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _447;
    float _451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _455 = _453 != 0;
    int _457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _459 = _457 != 0;
    float _461 = 1.0 / _449;
    float _463 = _161 * _425;
    float _465 = _175 * _425;
    float _467 = _167 * _425;
    float _469 = fma(_159, _423, _463);
    float _471 = fma(_173, _423, _465);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _475 = _421 + _473;
    float _477 = fma(_165, _423, _467);
    float _479 = fma(_163, _427, _469);
    float _481 = fma(_177, _427, _471);
    bool _483 = _421 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _485 = isnan(_421);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = _475 * _461;
    float _497 = fma(_169, _427, _477);
    float _499 = -_493;
    float _501 = _499 + 1.0;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    float _507 = _497 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _509;
    float _513 = _445 * _501;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _515;
    float _519 = fma(_505, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _521 = fma(_511, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _523 = _479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _525 = fma(_517, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _529 = _507 + _527;
    bool _531 = _433 > 0.5;
    float _533 = _519 * _513;
    float _535 = -_293;
    int _537 = _431 ? as_type<int>(_535) : as_type<int>(_293);
    float _539 = _521 * _513;
    float _541 = _525 * _513;
    float _543 = _481 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _545 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _547 = _523 + _545;
    float _549 = _529 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _551 = -_201;
    int _553 = _531 ? as_type<int>(_551) : as_type<int>(_201);
    float _555 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _557 = _543 + _555;
    bool _559 = !_455;
    float _561 = _559 ? _293 : as_type<float>(_537);
    float _563 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[28].x, _549);
    float _565 = -_445;
    float _567 = _565 + 1.0;
    bool _569 = !_459;
    float _571 = _569 ? _201 : as_type<float>(_553);
    float _573 = _561 + 0.5;
    float _575 = fma(_557, (*spvDescriptorSet0.vp_c8)._m0[28].z, _563);
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _539);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _533);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _541);
    float _583 = -_571;
    float _585 = _583 + 0.5;
    float _587 = _529 * _529;
    bool _589 = _575 >= 0.0;
    float _591 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].y, _579);
    float _593 = _585 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _595 = fma(_547, _547, _587);
    float _597 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].x, _577);
    float _599 = _573 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _601 = _593 * _429;
    float _603 = fma(_557, _557, _595);
    float _605 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    float _607 = _597 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _609 = _599 * _451;
    float _611 = rsqrt(_603);
    float _613 = _591 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _615 = _605 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _617 = _433;
    int _619 = as_type<int>(_615);
    float _621 = _543;
    float _623 = _523;
    if (_589)
    {
        _617 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _625 = _617;
    float _627 = _607 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = _615 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    if (_589)
    {
        float _635 = _625 * 5.0;
        _619 = as_type<int>(_635);
    }
    int _637 = _619;
    out.m_64.x = _609;
    out.m_64.y = _601;
    out.m_66.x = _627;
    out.m_66.y = _629;
    out.m_66.z = _631;
    out.m_66.w = _633;
    float _639 = _529 * _611;
    float _641 = _547 * _611;
    if (_589)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2586 = as_type<float>(_637);
        out.gl_Position.z = _2586;
    }
    if (_589)
    {
        out.m_47.x = 0.0;
    }
    if (_589)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _643 = -_639;
    float _645 = fma(_643, (*spvDescriptorSet0.vp_c9)._m0[18].w, _507);
    float _647 = _557 * _611;
    float _649 = -_641;
    float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _523);
    float _653 = -_639;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[18].w, _529);
    float _657 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _659 = _645 + _657;
    float _661 = -_647;
    float _663 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[18].w, _543);
    float _665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _667 = _651 + _665;
    float _669 = in.m_68.x;
    float _671 = in.m_68.y;
    float _673 = _659 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _675 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _677 = _663 + _675;
    float _679 = -_641;
    float _681 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[18].w, _547);
    float _683 = _655 * _655;
    float _685 = fma(_667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _673);
    float _687 = -_647;
    float _689 = fma(_687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _557);
    float _691 = fma(_681, _681, _683);
    float _693 = fma(_677, (*spvDescriptorSet0.vp_c8)._m0[28].z, _685);
    float _695 = fma(_689, _689, _691);
    bool _697 = _693 >= 0.0;
    float _699 = sqrt(_695);
    float _701 = _391 * _669;
    float _703 = _393 * _671;
    float _705 = _683;
    if (_697)
    {
        _705 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _707 = _705;
    int _709 = as_type<int>(_707);
    if (_697)
    {
        out.m_47.x = 0.0;
    }
    float _711 = _289 * _701;
    float _713 = _289 * _703;
    if (_697)
    {
        float _715 = _707 * 5.0;
        _709 = as_type<int>(_715);
    }
    int _717 = _709;
    float _719 = _611 * _699;
    if (_697)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2734 = as_type<float>(_717);
        out.gl_Position.z = _2734;
    }
    if (_697)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _723 = _711 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _727 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _293);
    float _729 = _719 * _721;
    float _731 = _719 * _723;
    float _733 = _719 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _735 = _733 * 0.5;
    float _737 = _725 * _729;
    float _739 = _727 * _731;
    float _741 = _737 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _743 = _737 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _745 = _737 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _747 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[24].x, _741);
    float _749 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[26].x, _743);
    float _751 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[25].x, _745);
    float _753 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[24].z, _747);
    float _755 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[26].z, _749);
    float _757 = fma(_735, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _759 = _753 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _761 = _755 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _763 = _757 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _765 = _523 + _759;
    float _767 = _543 + _761;
    float _769 = _507 + _763;
    float _771 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _773 = _765 + _771;
    float _775 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _777 = _767 + _775;
    float _779 = _773 * _773;
    float _781 = _777 * _777;
    float _783 = _779 + _781;
    float _785 = sqrt(_783);
    bool _787 = _785 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _789 = _745;
    float _791 = _763;
    float _793 = _765;
    float _795 = _735;
    float _797 = _781;
    if (!_787)
    {
        _789 = _765;
    }
    float _799 = _789;
    float _801 = _799;
    if (!_787)
    {
        _791 = _779;
    }
    float _803 = _791;
    float _805 = _803;
    if (!_787)
    {
        _793 = _767;
    }
    float _807 = _793;
    float _809 = _807;
    if (!_787)
    {
        _795 = _769;
    }
    float _811 = _795;
    bool _813 = !_787;
    float _815 = _811;
    if (!_813)
    {
        float _817 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _819 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _821 = _785 + _819;
        float _823 = _769 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _825 = rsqrt(_783);
        float _827 = _821 * _817;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = _829 * 6.283185482025146484375;
        float _833 = sin(_831);
        float _835 = _829 * 6.283185482025146484375;
        float _837 = cos(_835);
        float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _841 = _825 * _839;
        float _843 = _837 + (-1.0);
        float _845 = fma(_773, _841, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _847 = fma(_777, _841, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _849 = _843 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _851 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _853 = _845 + _851;
        float _855 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _857 = _847 + _855;
        float _859 = fma(_769, _837, _849);
        float _861 = _853 * _853;
        float _863 = _857 * _857;
        _815 = _859;
        _805 = _861;
        _797 = _863;
        _801 = _845;
        _809 = _847;
    }
    float _865 = _815;
    float _867 = _805;
    float _869 = _797;
    float _871 = _801;
    float _873 = _809;
    float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _877 = _865 + _875;
    float _879 = fma(_877, _877, _867);
    float _881 = _879 + _869;
    float _883 = sqrt(_881);
    bool _885 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _893 = _889 || _891;
    float _895 = _879;
    if (!_893)
    {
        _895 = 1.0;
    }
    float _897 = _895;
    bool _899 = !_893;
    float _901 = _897;
    if (!_899)
    {
        bool _903 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _905 = isnan(_883);
        bool _907 = _903 || _905;
        bool _909 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _911 = _907 || _909;
        if (!_911)
        {
            float _913 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _915 = _883 + _913;
            float _917 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _919 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _917;
            float _921 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _923 = _921 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _925 = 1.0 / _919;
            float _927 = _915 * _925;
            float _929 = fma(_927, _923, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _901 = _929;
            _931 = true;
        }
        else
        {
            bool _933 = _883 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _935 = isnan(_883);
            bool _937 = _933 || _935;
            bool _939 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _941 = _937 || _939;
            if (!_941)
            {
                float _943 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _945 = _883 + _943;
                float _947 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _949 = _947 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _951 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _953 = _951 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _955 = 1.0 / _949;
                float _957 = _945 * _955;
                float _959 = fma(_957, _953, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _901 = _959;
                _931 = true;
            }
            else
            {
                _901 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _931 = false;
    float _961 = _901;
    float _963 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _965 = _865 + _963;
    float _967 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _969 = _871 + _967;
    float _971 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _973 = _873 + _971;
    float _975 = fma(_965, _961, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _977 = fma(_969, _961, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _979 = fma(_973, _961, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _981 = -_507;
    float _983 = _981 + _975;
    float _985 = -_523;
    float _987 = _985 + _977;
    float _989 = -_543;
    float _991 = _989 + _979;
    float _993 = _983 * _983;
    bool _995 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _997 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _999 = _995 || _997;
    bool _1001 = isnan(0.5);
    bool _1003 = _999 || _1001;
    bool _1005 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.5);
    bool _1013 = _1009 || _1011;
    float _1015 = fma(_987, _987, _993);
    float _1017 = fma(_991, _991, _1015);
    float _1019 = _645 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1021 = sqrt(_1017);
    float _1023 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1019);
    float _1025 = _645 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1027 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1023);
    float _1029 = fma(_651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1025);
    float _1031 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1029);
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1035 = _1021 > 0.0;
    float _1037 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1039 = 1.0 / _1037;
    float _1041 = _1033 + _1037;
    float _1043 = _1027;
    float _1045 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1047 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1049 = _975;
    if (!_1035)
    {
        _1043 = _977;
    }
    float _1051 = _1043;
    float _1053 = _1051;
    float _1055 = _1051;
    if (!_1035)
    {
        _1045 = _975;
    }
    float _1057 = _1045;
    float _1059 = _1057;
    float _1061 = _1057;
    if (!_1035)
    {
        _1047 = _979;
    }
    float _1063 = _1047;
    bool _1065 = !_1035;
    float _1067 = _1063;
    if (!_1065)
    {
        float _1069 = _283 * _283;
        float _1071 = fma(_281, _281, _1069);
        float _1073 = rsqrt(_1017);
        float _1075 = fma(_285, _285, _1071);
        float _1077 = sqrt(_1075);
        float _1079 = _987 * _1073;
        float _1081 = _983 * _1073;
        float _1083 = _991 * _1073;
        bool _1085 = _1077 > 0.0;
        float _1087 = _1077;
        if (!_1085)
        {
            _1053 = _977;
        }
        float _1089 = _1053;
        _1055 = _1089;
        if (!_1085)
        {
            _1059 = _975;
        }
        float _1091 = _1059;
        _1061 = _1091;
        if (!_1085)
        {
            _1087 = _979;
        }
        float _1093 = _1087;
        bool _1095 = !_1085;
        _1067 = _1093;
        if (!_1095)
        {
            float _1097 = rsqrt(_1075);
            float _1099 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1101 = _283 * _1097;
            float _1103 = _281 * _1097;
            float _1105 = _1081 * _1101;
            float _1107 = _285 * _1097;
            float _1109 = fma(_1079, _1103, _1105);
            float _1111 = _1099 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1113 = fma(_1083, _1107, _1109);
            float _1115 = _1113 * _1111;
            float _1117 = fma(_281, _1115, _977);
            float _1119 = fma(_283, _1115, _975);
            float _1121 = fma(_285, _1115, _979);
            _1055 = _1117;
            _1061 = _1119;
            _1067 = _1121;
        }
    }
    float _1123 = _1055;
    float _1125 = _1061;
    float _1127 = _1067;
    float _1129 = -_641;
    float _1131 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1133 = -_639;
    float _1135 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1125);
    float _1137 = -_647;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1127);
    float _1141 = _1041 * _1039;
    float _1143 = _1141 * 0.5;
    float _1145 = _1135;
    float _1147 = _1131;
    float _1149 = _1139;
    if (_1013)
    {
        _1049 = 1.0;
    }
    float _1151 = _1049;
    float _1153 = _1151;
    if (!_1003)
    {
        float _1155 = _659 * _659;
        float _1157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1159 = -_543;
        float _1161 = _1159 + _1127;
        float _1163 = -_523;
        float _1165 = _1163 + _1123;
        float _1167 = fma(_667, _667, _1155);
        float _1169 = -_507;
        float _1171 = _1169 + _1125;
        float _1173 = fma(_677, _677, _1167);
        float _1175 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1177 = sqrt(_1173);
        float _1179 = 1.0 / _719;
        float _1181 = precise::min(_1177, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1183 = _1181 * _1157;
        float _1185 = _1175 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1187 = _1183 * _1179;
        float _1189 = _1185 * _1187;
        float _1191 = _1161 * _1187;
        float _1193 = fma(_1165, _1189, _651);
        float _1195 = fma(_1171, _1189, _645);
        float _1197 = fma(_1185, _1191, _663);
        _1145 = _1195;
        _1147 = _1193;
        _1149 = _1197;
        _621 = _1191;
        _623 = _1165;
    }
    float _1199 = _1145;
    float _1201 = _1147;
    float _1203 = _1149;
    float _1205 = _621;
    float _1207 = _623;
    float _1209 = _1207;
    float _1211 = _1205;
    if (!_1013)
    {
        float _1213 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1215 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1217 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1215);
        float _1219 = _1213 * 0.15915493667125701904296875;
        float _1221 = _1219 * 6.283185482025146484375;
        float _1223 = cos(_1221);
        float _1225 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1227 = _1225 * 0.15915493667125701904296875;
        float _1229 = _1219 * 6.283185482025146484375;
        float _1231 = sin(_1229);
        float _1233 = 1.0 / _1223;
        float _1235 = _1227 * 6.283185482025146484375;
        float _1237 = cos(_1235);
        float _1239 = _1231 * _1233;
        float _1241 = 1.0 / _1217;
        float _1243 = _1237 * _1239;
        float _1245 = _1227 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1251 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1249;
        float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1255 = _1241 * _1253;
        float _1257 = 1.0 / _1243;
        float _1259 = 1.0 / _1251;
        float _1261 = _1247 * _1257;
        float _1263 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1265 = fma(_1261, _1255, _1263);
        float _1267 = _1265 * _1259;
        float _1269 = precise::clamp(_1267, 0.0, 1.0);
        _1209 = _1259;
        _1153 = _1269;
    }
    float _1271 = _1209;
    float _1273 = _1153;
    float _1275 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1277 = _1199 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1281 = _1201 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1285 = _1203 + _1283;
    float _1287 = _1277 * _1277;
    float _1289 = fma(_1281, _1281, _1287);
    float _1291 = fma(_1285, _1285, _1289);
    float _1293 = rsqrt(_1291);
    float _1295 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1297 = _1281 * _1295;
    float _1299 = _1285 * _1295;
    float _1301 = _1297 * _1297;
    float _1303 = _1299 * _1299;
    float _1305 = _1301 + _1303;
    float _1307 = sqrt(_1305);
    bool _1309 = _1307 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1313 = _1307 + _1311;
    float _1315 = _1293;
    float _1317 = _1313;
    float _1319 = _1277;
    float _1321 = _1295;
    float _1323 = _1297;
    if (_1309)
    {
        float _1325 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1315 = _1325;
    }
    float _1327 = _1315;
    float _1329 = _1327;
    if (_1309)
    {
        float _1331 = _1313 * _1327;
        _1317 = _1331;
    }
    float _1333 = _1317;
    if (_1309)
    {
        float _1335 = rsqrt(_1305);
        _1329 = _1335;
    }
    float _1337 = _1329;
    float _1339 = _1337;
    if (_1309)
    {
        float _1341 = _1333 * 0.15915493667125701904296875;
        _1211 = _1341;
    }
    float _1343 = _1211;
    float _1345 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1347 = _1285;
    if (_1309)
    {
        float _1349 = _1343 * 6.283185482025146484375;
        float _1351 = sin(_1349);
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = precise::max(0.0, _1345);
    float _1357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1359 = _1271;
    float _1361 = _1355;
    if (_1309)
    {
        float _1363 = _1343 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        _1359 = _1365;
    }
    float _1367 = _1359;
    float _1369 = -_1295;
    float _1371 = -_1355;
    float _1373 = fma(_1277, _1369, _1371);
    if (_1309)
    {
        float _1375 = _1373 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1319 = _1375;
    }
    float _1377 = _1319;
    float _1379 = sqrt(_1291);
    float _1381 = _1353;
    float _1383 = _1377;
    if (_1309)
    {
        float _1385 = fma(_1353, _1377, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1381 = _1385;
    }
    float _1387 = _1381;
    float _1389 = _1387;
    if (_1309)
    {
        float _1391 = _1337 * _1387;
        _1321 = _1391;
    }
    float _1393 = _1321;
    if (!_1309)
    {
        _1339 = _1373;
    }
    float _1395 = _1339;
    float _1397 = _1395;
    if (_1309)
    {
        float _1399 = _1367 + (-1.0);
        _1361 = _1399;
    }
    float _1401 = _1361;
    float _1403 = _1401;
    if (_1309)
    {
        float _1405 = _1297 * _1393;
        _1323 = _1405;
    }
    float _1407 = _1323;
    if (!_1309)
    {
        _1389 = _1299;
    }
    float _1409 = _1389;
    float _1411 = _1409;
    if (_1309)
    {
        float _1413 = _1299 * _1393;
        _1411 = _1413;
    }
    float _1415 = _1411;
    if (_1309)
    {
        float _1417 = _1401 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1383 = _1417;
    }
    float _1419 = _1383;
    float _1421 = _1419;
    if (!_1309)
    {
        _1403 = _1301;
    }
    float _1423 = _1403;
    float _1425 = _1423;
    if (_1309)
    {
        float _1427 = _1407 * _1407;
        _1425 = _1427;
    }
    float _1429 = _1425;
    if (_1309)
    {
        float _1431 = fma(_1373, _1367, _1419);
        _1397 = _1431;
    }
    float _1433 = _1397;
    if (!_1309)
    {
        _1421 = _1303;
    }
    float _1435 = _1421;
    float _1437 = _1435;
    if (_1309)
    {
        float _1439 = _1415 * _1415;
        _1437 = _1439;
    }
    float _1441 = _1437;
    float _1443 = fma(_1433, _1433, _1429);
    float _1445 = _1443 + _1441;
    float _1447 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1451 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1449);
    float _1453 = precise::clamp(_1451, 0.0, 1.0);
    float _1455 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1457 = rsqrt(_1445);
    float _1459 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1447);
    float _1461 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1463 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1465 = -_1453;
    float _1467 = _1465 + 1.0;
    float _1469 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1459);
    float _1471 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1461);
    float _1473 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1455);
    float _1475 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1463);
    float _1477 = _1469 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1479 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1471);
    float _1481 = abs(_1467);
    float _1483 = log2(_1481);
    float _1485 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1473);
    float _1487 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1475);
    float _1489 = _1479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1493 = _1457 * _1407;
    float _1495 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1497 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1499 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1501 = _1457 * _1433;
    float _1503 = _1493 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1505 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1497);
    float _1507 = _1457 * _1415;
    float _1509 = -_1491;
    float _1511 = fma(_1509, _1357, 1.0);
    float _1513 = -_1503;
    float _1515 = fma(_1501, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1513);
    float _1517 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1505);
    float _1519 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1521 = log2(_1511);
    float _1523 = -_1507;
    float _1525 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1515);
    float _1527 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1517);
    float _1529 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1531 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1533 = fma(_1525, -0.5, 0.5);
    float _1535 = fma(_1525, 0.5, 0.5);
    float _1537 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1529);
    float _1539 = exp2(_1519);
    float _1541 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1531);
    float _1543 = _1501 + 1.0;
    float _1545 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1537);
    float _1547 = fma(_1535, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1549 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1541);
    float _1551 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1545);
    float _1553 = 1.0 / _1527;
    float _1555 = fma(_1535, _1547, -0.212114393711090087890625);
    float _1557 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1549);
    float _1559 = _1521 * 0.693147182464599609375;
    float _1561 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1563 = sqrt(_1533);
    float _1565 = -_1501;
    float _1567 = fma(_1539, _1543, _1565);
    float _1569 = fma(_1535, _1555, 1.570728778839111328125);
    float _1571 = fma(_1567, 0.5, 0.5);
    float _1573 = _1551 * _1553;
    float _1575 = _1557 * _1553;
    float _1577 = fma(_1573, 0.5, 0.5);
    float _1579 = fma(_1575, -0.5, 0.5);
    float _1581 = _1563 * 0.636619746685028076171875;
    float _1583 = -_1569;
    float _1585 = fma(_1581, _1583, 1.0);
    float3 _4133 = float3(_1577, _1579, _1561);
    float _1587 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4133, float3(0.0), isnan(_4133)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4133, float3(0.0), isnan(_4133)), level(0.0)).x;
    float3 _4144 = float3(_1577, _1579, _1561);
    float4 _1590 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4144, float3(0.0), isnan(_4144)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4144, float3(0.0), isnan(_4144)), level(0.0)).xyzw;
    float _1592 = _1590.x;
    float _1594 = _1590.y;
    float _1596 = _1590.z;
    float _1598 = _1590.w;
    float2 _4161 = float2(_1585, _1571);
    float3 _1602 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4161, float2(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4161, float2(0.0), isnan(_4161)), level(0.0)).xyz;
    float _1604 = _1602.x;
    float _1606 = _1602.y;
    float _1608 = _1602.z;
    float _1610 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1612 = _1489 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1614 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1616 = _1273 > 0.0;
    bool _1618 = isnan(_1273);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan(0.0);
    bool _1624 = _1620 || _1622;
    float _1626 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1612);
    float _1628 = exp2(_1610);
    float _1630 = fma(_1477, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1626);
    float _1632 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1630);
    float _1634 = _1632 + _1527;
    out.gl_Position.x = _1551;
    out.gl_Position.y = _1557;
    out.gl_Position.z = _1632;
    out.gl_Position.w = _1527;
    float _1636 = _1634 * 0.5;
    float _1638 = -_1628;
    float _1640 = _1638 + 1.0;
    float _1642 = _1614 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1644 = _1640 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1636;
    out.m_70.w = _1527;
    float _1646 = -_1644;
    float _1648 = _1646 + 1.0;
    out.m_47.x = _1642;
    float _1650 = _1644 * _1587;
    float _1652 = _1598 * _1650;
    float _1654 = _1608 * _1650;
    float _1656 = _1598 * _1648;
    float _1658 = fma(_1604, _1652, _1592);
    float _1660 = fma(_1606, _1652, _1594);
    float _1662 = fma(_1598, _1654, _1596);
    out.m_72.x = _1658;
    out.m_72.y = _1660;
    out.m_72.z = _1662;
    out.m_72.w = _1656;
    if (_1624)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1664 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1664;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

