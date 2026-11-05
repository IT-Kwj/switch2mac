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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_54 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_64 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _615 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2059 = as_type<float>(_107);
        out.gl_Position.z = _2059;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2127 = as_type<float>(_143);
        out.gl_Position.z = _2127;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = _149 * _147;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
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
    float _211 = _155 * _161;
    bool _213 = !_193;
    int _215 = _213 ? 0 : 1;
    float _217 = _197 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = _155 * _167;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = fma(_153, _159, _211);
    int _229 = abs(_215);
    float _231 = _155 * _175;
    int _233 = abs(_225);
    float _235 = fma(_153, _165, _221);
    float _237 = -_195;
    float _239 = _179 + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = fma(_153, _173, _231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_209;
    int _251 = _249 ? 0 : 1;
    float _253 = fma(_157, _163, _227);
    float _255 = float(_233);
    float _257 = fma(_219, 0.5, 0.5);
    bool _259 = _239 < 0.5;
    float _261 = float(_259);
    float _263 = fma(_157, _169, _235);
    int _265 = abs(_251);
    float _267 = abs(_247);
    float _269 = _255 * _267;
    float _271 = float(_229);
    float _273 = -_257;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = fma(_157, _177, _243);
    float _285 = fma(_271, _275, _269);
    bool _287 = !_183;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = abs(_281);
    float _293 = fma(_277, _291, _285);
    bool _295 = !_241;
    float _297 = _263;
    float _299 = _283;
    float _315;
    if (!_295)
    {
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_91);
        float _321 = 1.0 / _319;
        float _323 = _125 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _343 = 1.0 / _329;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _341;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _325 + _351;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _357;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _369 = 1.0 / _333;
    float _371 = _353 * _343;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _325 + _373;
    bool _377 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _379 = isnan(_325);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    out.m_62.x = _363;
    out.m_62.y = _365;
    out.m_62.z = _367;
    out.m_62.w = _361;
    float _389 = 1.0 / _337;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _325 + _391;
    float _395 = _375 * _349;
    bool _397 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_325);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = 1.0 / _359;
    float _411 = _393 * _369;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _325 + _413;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_387;
    float _431 = _429 + 1.0;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    bool _437 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_325);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _415 * _389;
    float _455 = -_427;
    float _457 = _455 + 1.0;
    float _459 = _407 * _431;
    float _461 = _427 * _435;
    float _463 = fma(_451, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _325 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    bool _473 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_325);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = _447 * _457;
    float _487 = -_447;
    float _489 = _487 + 1.0;
    float _491 = _467 * _409;
    float _493 = fma(_471, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _495 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _497 = isnan(_325);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = _483 * _489;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = _505 * _511;
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_515, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _463 * _525;
    float _539 = _493 * _525;
    float _541 = fma(_533, _453, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_523, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _559 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _561 = fma(_553, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_535, _507, _545);
    float _565 = fma(_555, _507, _557);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _573;
    float _577 = fma(_541, _485, _563);
    float _579 = fma(_543, _485, _565);
    float _581 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _583 = fma(_575, _491, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _585 = fma(_559, _461, _577);
    float _587 = fma(_561, _461, _579);
    float _589 = fma(_581, _459, _585);
    float _591 = fma(_583, _459, _587);
    float _593 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].x, _589);
    float _595 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].y, _591);
    bool _597 = !_567;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _601 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_91);
        float _619 = 1.0 / _617;
        float _621 = _125 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_64.x;
    float _627 = in.m_64.y;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _631 = in.m_42.x;
    float _633 = in.m_42.y;
    float _635 = in.m_42.z;
    float _637 = in.m_60.w;
    float _639 = in.m_56.w;
    float _641 = _595 * _627;
    float _643 = _593 * _625;
    float _645 = _293 * _641;
    float _647 = _293 * _643;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = _175 * _633;
    float _653 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = _161 * _633;
    float _659 = fma(_173, _631, _651);
    float _661 = _653 * _649;
    float _663 = _655 * _629;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_159, _631, _657);
    float _669 = _661 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _661 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = fma(_177, _635, _659);
    float _675 = fma(_163, _635, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _681 = _673 + _637;
    float _683 = _675 + _639;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = _167 * _633;
    float _691 = _661 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = fma(_165, _631, _689);
    float _699 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
    float _701 = _681 + _693;
    float _703 = _683 + _695;
    float _705 = in.m_58.w;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _699);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _701 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _703 + _713;
    float _717 = _707 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _719 = _711 * _711;
    float _721 = fma(_715, _715, _719);
    float _723 = fma(_169, _635, _697);
    float _725 = sqrt(_721);
    float _727 = _723 + _705;
    float _729 = _727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = _727 + _717;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _739 = _729;
    float _741 = _717;
    float _743 = _735;
    if (!_733)
    {
        _739 = _703;
    }
    float _745 = _739;
    float _747 = _745;
    if (!_733)
    {
        _741 = _701;
    }
    float _749 = _741;
    float _751 = _749;
    if (!_733)
    {
        _743 = _731;
    }
    float _753 = _743;
    bool _755 = !_733;
    float _757 = _753;
    if (!_755)
    {
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _761 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _763 = _725 + _761;
        float _765 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = _763 * _759;
        float _769 = rsqrt(_721);
        float _771 = _767 * 0.15915493667125701904296875;
        float _773 = _771 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = fma(_775, _765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = _769 * _781;
        float _785 = _779 + (-1.0);
        float _787 = fma(_715, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_711, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _791 = _785 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = fma(_731, _779, _791);
        _757 = _793;
        _747 = _787;
        _751 = _789;
    }
    float _795 = _757;
    float _797 = _747;
    float _799 = _751;
    float _801 = -_727;
    float _803 = _801 + _795;
    float _805 = -_683;
    float _807 = _805 + _797;
    float _809 = _737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _811 = _727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _813 = _803 * _803;
    float _815 = -_681;
    float _817 = _815 + _799;
    float _819 = 1.0 / _809;
    float _821 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _811);
    float _823 = fma(_807, _807, _813);
    float _825 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].z, _821);
    float _827 = fma(_817, _817, _823);
    bool _829 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _831 = isnan(0.5);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    float _839 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _841 = sqrt(_827);
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = _839 + _809;
    float _855 = _853 * _819;
    float _857 = _855 * 0.5;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    float _863 = 1.0 / _861;
    bool _865 = _841 > 0.0;
    bool _867 = !_865;
    float _869 = _797;
    float _871 = _795;
    float _873 = _799;
    float _875 = _861;
    float _877 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _879 = _809;
    if (!_867)
    {
        float _881 = _263 * _263;
        float _883 = fma(_253, _253, _881);
        float _885 = rsqrt(_827);
        float _887 = fma(_283, _283, _883);
        float _889 = sqrt(_887);
        float _891 = _807 * _885;
        float _893 = _803 * _885;
        float _895 = _817 * _885;
        bool _897 = _889 > 0.0;
        bool _899 = !_897;
        _875 = _887;
        _877 = _889;
        if (!_899)
        {
            float _901 = rsqrt(_887);
            float _903 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _905 = _263 * _901;
            float _907 = _253 * _901;
            float _909 = _283 * _901;
            float _911 = _893 * _905;
            float _913 = fma(_891, _907, _911);
            float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _917 = fma(_895, _909, _913);
            float _919 = _917 * _915;
            float _921 = fma(_253, _919, _797);
            float _923 = fma(_263, _919, _795);
            float _925 = fma(_283, _919, _799);
            _869 = _921;
            _871 = _923;
            _873 = _925;
            _877 = _907;
            _879 = _905;
        }
    }
    float _927 = _869;
    float _929 = _871;
    float _931 = _873;
    float _933 = _875;
    float _935 = _877;
    float _937 = _879;
    float _939 = _933;
    float _941 = _929;
    float _943 = _927;
    float _945 = _931;
    float _947 = _935;
    float _949 = _937;
    if (_851)
    {
        _297 = 1.0;
    }
    float _951 = _297;
    float _953 = _951;
    if (!_837)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _727 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _683 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _965 = -_683;
        float _967 = _965 + _927;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _681 + _971;
        float _975 = -_727;
        float _977 = _975 + _929;
        float _979 = -_681;
        float _981 = _979 + _931;
        float _983 = fma(_961, _961, _969);
        float _985 = fma(_973, _973, _983);
        float _987 = sqrt(_985);
        float _989 = precise::min(_987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _963;
        float _993 = fma(_967, _991, _683);
        float _995 = fma(_977, _991, _727);
        float _997 = fma(_981, _991, _681);
        _939 = _969;
        _941 = _995;
        _943 = _993;
        _945 = _997;
        _947 = _963;
    }
    float _999 = _939;
    float _1001 = _941;
    float _1003 = _943;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _999;
    float _1011 = _1007;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1013 = _949;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _863 * _1015;
    float _1019 = _1013;
    if (!_851)
    {
        float _1021 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1023 = _1021 * 0.15915493667125701904296875;
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1027 = _1023 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = _1025 * 0.15915493667125701904296875;
        float _1033 = _1023 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = 1.0 / _1029;
        float _1039 = _1031 * 6.283185482025146484375;
        float _1041 = cos(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = _1031 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1051 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1049;
        float _1053 = _1041 * _1043;
        float _1055 = 1.0 / _1051;
        float _1057 = 1.0 / _1053;
        float _1059 = _1047 * _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1063 = fma(_1017, _1059, _1061);
        float _1065 = _1063 * _1055;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1009 = _1043;
        _1011 = _1031;
        _953 = _1067;
    }
    float _1069 = _1009;
    float _1071 = _1011;
    float _1073 = _953;
    float _1075 = _1069;
    float _1077 = _1071;
    if (!_851)
    {
        float _1079 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = _1079 * 0.15915493667125701904296875;
        float _1083 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1085 = _1081 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 0.15915493667125701904296875;
        float _1091 = _1081 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = 1.0 / _1087;
        float _1097 = _1089 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        float _1101 = _1093 * _1095;
        float _1103 = _1089 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        float _1107 = _1099 * _1101;
        float _1109 = 1.0 / _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1111;
        float _1115 = 1.0 / _1113;
        float _1117 = _1105 * _1109;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1121 = fma(_1017, _1117, _1119);
        float _1123 = _1121 * _1115;
        float _1125 = precise::clamp(_1123, 0.0, 1.0);
        float _1127 = -_1125;
        float _1129 = _1127 + 1.0;
        _1075 = _1095;
        _1077 = _1107;
        _1019 = _1129;
    }
    float _1131 = _1075;
    float _1133 = _1077;
    float _1135 = _1019;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1001 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1003 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1147 = _1005 + _1145;
    float _1149 = _1139 * _1139;
    float _1151 = fma(_1143, _1143, _1149);
    float _1153 = fma(_1147, _1147, _1151);
    float _1155 = rsqrt(_1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1143 * _1157;
    float _1161 = _1147 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1151;
    float _1179 = _1133;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1139;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_1171)
    {
        float _1199 = _1175 * _1191;
        _1181 = _1199;
    }
    float _1201 = _1181;
    if (_1171)
    {
        float _1203 = _1201 * 0.15915493667125701904296875;
        _1183 = _1203;
    }
    float _1205 = _1183;
    float _1207 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1209 = _1147;
    if (_1171)
    {
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        _1209 = _1213;
    }
    float _1215 = _1209;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1219 = precise::max(0.0, _1217);
    float _1221 = _1191;
    float _1223 = _1219;
    if (_1171)
    {
        float _1225 = _1205 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = -_1157;
    float _1233 = -_1219;
    float _1235 = fma(_1139, _1231, _1233);
    if (_1171)
    {
        float _1237 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1185 = _1237;
    }
    float _1239 = _1185;
    float _1241 = sqrt(_1153);
    float _1243 = _1239;
    float _1245 = _1215;
    if (_1171)
    {
        float _1247 = fma(_1215, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = _1249;
    if (!_1171)
    {
        _1245 = _1163;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    float _1257 = _1229;
    if (_1171)
    {
        float _1259 = _1229 + (-1.0);
        _1223 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1261;
    if (_1171)
    {
        float _1265 = _1195 * _1249;
        _299 = _1265;
    }
    float _1267 = _299;
    if (!_1171)
    {
        _1251 = _1235;
    }
    float _1269 = _1251;
    float _1271 = _1269;
    if (_1171)
    {
        float _1273 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1197 = _1273;
    }
    float _1275 = _1197;
    if (_1171)
    {
        float _1277 = _1159 * _1267;
        _1187 = _1277;
    }
    float _1279 = _1187;
    if (!_1171)
    {
        _1263 = _1161;
    }
    float _1281 = _1263;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = _1161 * _1267;
        _1283 = _1285;
    }
    float _1287 = _1283;
    if (_1171)
    {
        float _1289 = fma(_1235, _1229, _1275);
        _1271 = _1289;
    }
    float _1291 = _1271;
    if (_1171)
    {
        float _1293 = _1279 * _1279;
        _1255 = _1293;
    }
    float _1295 = _1255;
    if (!_1171)
    {
        _1257 = _1165;
    }
    float _1297 = _1257;
    float _1299 = _1297;
    if (_1171)
    {
        float _1301 = _1287 * _1287;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = fma(_1291, _1291, _1295);
    float _1307 = _1305 + _1303;
    float _1309 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1325 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1327 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1329 = -_1315;
    float _1331 = _1329 + 1.0;
    float _1333 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1323);
    float _1335 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1325);
    float _1337 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1349 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1339);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1357 = _1321 * _1279;
    float _1359 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = _1321 * _1287;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    float _1365 = _1321 * _1291;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = -_1351;
    float _1371 = fma(_1369, _1207, 1.0);
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = -_1367;
    float _1381 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1379);
    float _1383 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1387 = log2(_1371);
    float _1389 = -_1361;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1381);
    float _1393 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1399 = fma(_1391, 0.5, 0.5);
    float _1401 = exp2(_1377);
    float _1403 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1405 = _1365 + 1.0;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1397);
    float _1409 = fma(_1399, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1403);
    float _1413 = 1.0 / _1385;
    float _1415 = fma(_1399, _1409, -0.212114393711090087890625);
    float _1417 = _1387 * 0.693147182464599609375;
    float _1419 = fma(_1399, _1415, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1395);
    float _1425 = -_1365;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1433 = fma(_1427, 0.5, 0.5);
    float _1435 = _1429 * _1413;
    float _1437 = _1431 * _1413;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1423 * 0.636619746685028076171875;
    float _1445 = -_1419;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _4150 = float3(_1439, _1441, _1421);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float3 _4161 = float3(_1439, _1441, _1421);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _4178 = float2(_1447, _1433);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4178, float2(0.0), isnan(_4178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4178, float2(0.0), isnan(_4178)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = in.m_49.y;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1476 = _623 + _1474;
    bool _1478 = _145 > 0.5;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1496 = 1.0 / _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1500 = _623 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1504 = _623 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1514 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = 1.0 / _1490;
    float _1518 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    bool _1520 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1522 = isnan(_623);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1532;
    bool _1536 = _1472 > 0.5;
    float _1538 = 1.0 / _1512;
    float _1540 = -_289;
    int _1542 = _1478 ? as_type<int>(_1540) : as_type<int>(_289);
    float _1544 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1546 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1548 = isnan(_623);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    bool _1558 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1560 = isnan(_623);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    bool _1570 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1572 = isnan(_623);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = 1.0 / _1482;
    float _1584 = _1476 * _1516;
    float _1586 = -_1580;
    float _1588 = _1586 + 1.0;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1590;
    float _1594 = 1.0 / _1508;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1073 > 0.0;
    bool _1606 = isnan(_1073);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1624 = _623 + _1622;
    float _1626 = 1.0 / _1494;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1630 = _623 + _1628;
    bool _1632 = !_1616;
    float _1634 = _1632 ? _289 : as_type<float>(_1542);
    float _1636 = _1624 * _1496;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1640 = _623 + _1638;
    float _1642 = _1630 * _1594;
    float _1644 = -_201;
    int _1646 = _1536 ? as_type<int>(_1644) : as_type<int>(_201);
    float _1648 = 1.0 / _1534;
    float _1650 = _1640 * _1538;
    float _1652 = _1500 * _1582;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1660 = _623 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1666;
    float _1670 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1672 = fma(_1592, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1674 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1676 = isnan(_623);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1668, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1688 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1690 = isnan(_623);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1704 = !_1620;
    float _1706 = _1704 ? _201 : as_type<float>(_1646);
    float _1708 = _1504 * _1626;
    float _1710 = _1660 * _1648;
    float _1712 = -_1684;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1702, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1718 = fma(_1664, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1720 = fma(_1598, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1722 = -_1698;
    float _1724 = _1722 + 1.0;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1734;
    float _1738 = _1698 * _1714;
    float _1740 = _1556 * _1724;
    float _1742 = fma(_1728, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1744 = fma(_1732, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1746 = -_1556;
    float _1748 = _1746 + 1.0;
    float _1750 = fma(_1736, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1760 = -_1530;
    float _1762 = _1760 + 1.0;
    float _1764 = _1568 * _1748;
    float _1766 = -_1568;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1774 = fma(_1754, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1776 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1778 = isnan(_623);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1530 * _1768;
    bool _1790 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1792 = isnan(_623);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = _1580 * _1762;
    float _1804 = fma(_1772, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1806 = fma(_1758, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = _1800 * _1588;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1818;
    float _1822 = _1786 * _1810;
    float _1824 = fma(_1602, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1826 = fma(_1816, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1828 = fma(_1820, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1830 = _1686 * _1822;
    float _1832 = -_1786;
    float _1834 = _1832 + 1.0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1840 = _1670 * _1822;
    float _1842 = _1672 * _1822;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1830);
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1842);
    float _1854 = fma(_1716, _1812, _1844);
    float _1856 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1840);
    float _1858 = _1634 + 0.5;
    float _1860 = fma(_1720, _1812, _1852);
    float _1862 = -_1706;
    float _1864 = _1862 + 0.5;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1868 = fma(_1718, _1812, _1856);
    float _1870 = fma(_1742, _1802, _1854);
    float _1872 = fma(_1750, _1802, _1860);
    float _1874 = fma(_1744, _1802, _1868);
    float _1876 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1880 = fma(_1774, _1788, _1870);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1882;
    float _1886 = _1876 * _1846;
    float _1888 = fma(_1838, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1890 = fma(_1826, _1764, _1880);
    float _1892 = fma(_1884, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1898 = _1878 * _1866;
    float _1900 = fma(_1888, _1740, _1890);
    float _1902 = fma(_1806, _1788, _1872);
    float _1904 = fma(_1804, _1788, _1874);
    out.m_66.x = _1886;
    out.m_66.y = _1898;
    float _1906 = fma(_1892, _1738, _1900);
    float _1908 = fma(_1850, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1910;
    float _1914 = fma(_1896, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1916;
    float _1920 = fma(_1828, _1764, _1902);
    float _1922 = fma(_1824, _1764, _1904);
    float _1924 = fma(_1912, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1926 = fma(_1918, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1928 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = fma(_1914, _1740, _1920);
    float _1932 = fma(_1908, _1740, _1922);
    float _1934 = exp2(_1928);
    float _1936 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1938 = fma(_1926, _1738, _1930);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1942 = _1073 * _1135;
    float _1944 = fma(_1924, _1738, _1932);
    float _1946 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1938);
    float _1948 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1906);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1952 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1944);
    bool _1954 = _1135 <= 0.0;
    bool _1956 = !_1612;
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1962 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1936 + _1385;
    float _1970 = -_1934;
    float _1972 = _1970 + 1.0;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1982 = _1968 * 0.5;
    out.m_45.x = _1962;
    out.m_68.x = _1974;
    out.m_68.y = _1976;
    out.m_68.z = _1978;
    out.m_68.w = _1940;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1936;
    out.gl_Position.w = _1385;
    out.m_70.z = _1982;
    out.m_70.w = _1385;
    float _1984 = _1980 * _1449;
    float _1986 = -_1980;
    float _1988 = _1986 + 1.0;
    float _1990 = _1460 * _1984;
    float _1992 = _1470 * _1984;
    float _1994 = fma(_1466, _1990, _1454);
    float _1996 = fma(_1468, _1990, _1456);
    float _1998 = _1460 * _1988;
    float _2000 = fma(_1460, _1992, _1458);
    out.m_72.x = _1994;
    out.m_72.y = _1996;
    out.m_72.z = _2000;
    out.m_72.w = _1998;
    if (!_1958)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2002;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _615 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2059 = as_type<float>(_107);
        out.gl_Position.z = _2059;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2127 = as_type<float>(_143);
        out.gl_Position.z = _2127;
    }
    if (_137)
    {
        return out;
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = _149 * _147;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
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
    float _211 = _155 * _161;
    bool _213 = !_193;
    int _215 = _213 ? 0 : 1;
    float _217 = _197 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = _155 * _167;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = fma(_153, _159, _211);
    int _229 = abs(_215);
    float _231 = _155 * _175;
    int _233 = abs(_225);
    float _235 = fma(_153, _165, _221);
    float _237 = -_195;
    float _239 = _179 + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = fma(_153, _173, _231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_209;
    int _251 = _249 ? 0 : 1;
    float _253 = fma(_157, _163, _227);
    float _255 = float(_233);
    float _257 = fma(_219, 0.5, 0.5);
    bool _259 = _239 < 0.5;
    float _261 = float(_259);
    float _263 = fma(_157, _169, _235);
    int _265 = abs(_251);
    float _267 = abs(_247);
    float _269 = _255 * _267;
    float _271 = float(_229);
    float _273 = -_257;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = fma(_157, _177, _243);
    float _285 = fma(_271, _275, _269);
    bool _287 = !_183;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = abs(_281);
    float _293 = fma(_277, _291, _285);
    bool _295 = !_241;
    float _297 = _263;
    float _299 = _283;
    float _315;
    if (!_295)
    {
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_91);
        float _321 = 1.0 / _319;
        float _323 = _125 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _343 = 1.0 / _329;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _341;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _325 + _351;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _357;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _369 = 1.0 / _333;
    float _371 = _353 * _343;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _325 + _373;
    bool _377 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _379 = isnan(_325);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    out.m_62.x = _363;
    out.m_62.y = _365;
    out.m_62.z = _367;
    out.m_62.w = _361;
    float _389 = 1.0 / _337;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _325 + _391;
    float _395 = _375 * _349;
    bool _397 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_325);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = 1.0 / _359;
    float _411 = _393 * _369;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _325 + _413;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_387;
    float _431 = _429 + 1.0;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    bool _437 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_325);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _415 * _389;
    float _455 = -_427;
    float _457 = _455 + 1.0;
    float _459 = _407 * _431;
    float _461 = _427 * _435;
    float _463 = fma(_451, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _325 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    bool _473 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_325);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = _447 * _457;
    float _487 = -_447;
    float _489 = _487 + 1.0;
    float _491 = _467 * _409;
    float _493 = fma(_471, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _495 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _497 = isnan(_325);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = _483 * _489;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = _505 * _511;
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_515, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _463 * _525;
    float _539 = _493 * _525;
    float _541 = fma(_533, _453, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_523, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _559 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _561 = fma(_553, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_535, _507, _545);
    float _565 = fma(_555, _507, _557);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _573;
    float _577 = fma(_541, _485, _563);
    float _579 = fma(_543, _485, _565);
    float _581 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _583 = fma(_575, _491, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _585 = fma(_559, _461, _577);
    float _587 = fma(_561, _461, _579);
    float _589 = fma(_581, _459, _585);
    float _591 = fma(_583, _459, _587);
    float _593 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].x, _589);
    float _595 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].y, _591);
    bool _597 = !_567;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _601 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_91);
        float _619 = 1.0 / _617;
        float _621 = _125 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_64.x;
    float _627 = in.m_64.y;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _631 = in.m_42.x;
    float _633 = in.m_42.y;
    float _635 = in.m_42.z;
    float _637 = in.m_60.w;
    float _639 = in.m_56.w;
    float _641 = _595 * _627;
    float _643 = _593 * _625;
    float _645 = _293 * _641;
    float _647 = _293 * _643;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = _175 * _633;
    float _653 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = _161 * _633;
    float _659 = fma(_173, _631, _651);
    float _661 = _653 * _649;
    float _663 = _655 * _629;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_159, _631, _657);
    float _669 = _661 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _661 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = fma(_177, _635, _659);
    float _675 = fma(_163, _635, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _681 = _673 + _637;
    float _683 = _675 + _639;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = _167 * _633;
    float _691 = _661 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = fma(_165, _631, _689);
    float _699 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
    float _701 = _681 + _693;
    float _703 = _683 + _695;
    float _705 = in.m_58.w;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _699);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _701 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _703 + _713;
    float _717 = _707 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _719 = _711 * _711;
    float _721 = fma(_715, _715, _719);
    float _723 = fma(_169, _635, _697);
    float _725 = sqrt(_721);
    float _727 = _723 + _705;
    float _729 = _727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = _727 + _717;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _739 = _729;
    float _741 = _717;
    float _743 = _735;
    if (!_733)
    {
        _739 = _703;
    }
    float _745 = _739;
    float _747 = _745;
    if (!_733)
    {
        _741 = _701;
    }
    float _749 = _741;
    float _751 = _749;
    if (!_733)
    {
        _743 = _731;
    }
    float _753 = _743;
    bool _755 = !_733;
    float _757 = _753;
    if (!_755)
    {
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _761 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _763 = _725 + _761;
        float _765 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = _763 * _759;
        float _769 = rsqrt(_721);
        float _771 = _767 * 0.15915493667125701904296875;
        float _773 = _771 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = fma(_775, _765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = _769 * _781;
        float _785 = _779 + (-1.0);
        float _787 = fma(_715, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_711, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _791 = _785 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = fma(_731, _779, _791);
        _757 = _793;
        _747 = _787;
        _751 = _789;
    }
    float _795 = _757;
    float _797 = _747;
    float _799 = _751;
    float _801 = -_727;
    float _803 = _801 + _795;
    float _805 = -_683;
    float _807 = _805 + _797;
    float _809 = _737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _811 = _727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _813 = _803 * _803;
    float _815 = -_681;
    float _817 = _815 + _799;
    float _819 = 1.0 / _809;
    float _821 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _811);
    float _823 = fma(_807, _807, _813);
    float _825 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].z, _821);
    float _827 = fma(_817, _817, _823);
    bool _829 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _831 = isnan(0.5);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    float _839 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _841 = sqrt(_827);
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = _839 + _809;
    float _855 = _853 * _819;
    float _857 = _855 * 0.5;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    float _863 = 1.0 / _861;
    bool _865 = _841 > 0.0;
    bool _867 = !_865;
    float _869 = _797;
    float _871 = _795;
    float _873 = _799;
    float _875 = _861;
    float _877 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _879 = _809;
    if (!_867)
    {
        float _881 = _263 * _263;
        float _883 = fma(_253, _253, _881);
        float _885 = rsqrt(_827);
        float _887 = fma(_283, _283, _883);
        float _889 = sqrt(_887);
        float _891 = _807 * _885;
        float _893 = _803 * _885;
        float _895 = _817 * _885;
        bool _897 = _889 > 0.0;
        bool _899 = !_897;
        _875 = _887;
        _877 = _889;
        if (!_899)
        {
            float _901 = rsqrt(_887);
            float _903 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _905 = _263 * _901;
            float _907 = _253 * _901;
            float _909 = _283 * _901;
            float _911 = _893 * _905;
            float _913 = fma(_891, _907, _911);
            float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _917 = fma(_895, _909, _913);
            float _919 = _917 * _915;
            float _921 = fma(_253, _919, _797);
            float _923 = fma(_263, _919, _795);
            float _925 = fma(_283, _919, _799);
            _869 = _921;
            _871 = _923;
            _873 = _925;
            _877 = _907;
            _879 = _905;
        }
    }
    float _927 = _869;
    float _929 = _871;
    float _931 = _873;
    float _933 = _875;
    float _935 = _877;
    float _937 = _879;
    float _939 = _933;
    float _941 = _929;
    float _943 = _927;
    float _945 = _931;
    float _947 = _935;
    float _949 = _937;
    if (_851)
    {
        _297 = 1.0;
    }
    float _951 = _297;
    float _953 = _951;
    if (!_837)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _727 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _683 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _965 = -_683;
        float _967 = _965 + _927;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _681 + _971;
        float _975 = -_727;
        float _977 = _975 + _929;
        float _979 = -_681;
        float _981 = _979 + _931;
        float _983 = fma(_961, _961, _969);
        float _985 = fma(_973, _973, _983);
        float _987 = sqrt(_985);
        float _989 = precise::min(_987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _963;
        float _993 = fma(_967, _991, _683);
        float _995 = fma(_977, _991, _727);
        float _997 = fma(_981, _991, _681);
        _939 = _969;
        _941 = _995;
        _943 = _993;
        _945 = _997;
        _947 = _963;
    }
    float _999 = _939;
    float _1001 = _941;
    float _1003 = _943;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _999;
    float _1011 = _1007;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1013 = _949;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _863 * _1015;
    float _1019 = _1013;
    if (!_851)
    {
        float _1021 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1023 = _1021 * 0.15915493667125701904296875;
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1027 = _1023 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = _1025 * 0.15915493667125701904296875;
        float _1033 = _1023 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = 1.0 / _1029;
        float _1039 = _1031 * 6.283185482025146484375;
        float _1041 = cos(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = _1031 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1051 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1049;
        float _1053 = _1041 * _1043;
        float _1055 = 1.0 / _1051;
        float _1057 = 1.0 / _1053;
        float _1059 = _1047 * _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1063 = fma(_1017, _1059, _1061);
        float _1065 = _1063 * _1055;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1009 = _1043;
        _1011 = _1031;
        _953 = _1067;
    }
    float _1069 = _1009;
    float _1071 = _1011;
    float _1073 = _953;
    float _1075 = _1069;
    float _1077 = _1071;
    if (!_851)
    {
        float _1079 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = _1079 * 0.15915493667125701904296875;
        float _1083 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1085 = _1081 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 0.15915493667125701904296875;
        float _1091 = _1081 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = 1.0 / _1087;
        float _1097 = _1089 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        float _1101 = _1093 * _1095;
        float _1103 = _1089 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        float _1107 = _1099 * _1101;
        float _1109 = 1.0 / _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1111;
        float _1115 = 1.0 / _1113;
        float _1117 = _1105 * _1109;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1121 = fma(_1017, _1117, _1119);
        float _1123 = _1121 * _1115;
        float _1125 = precise::clamp(_1123, 0.0, 1.0);
        float _1127 = -_1125;
        float _1129 = _1127 + 1.0;
        _1075 = _1095;
        _1077 = _1107;
        _1019 = _1129;
    }
    float _1131 = _1075;
    float _1133 = _1077;
    float _1135 = _1019;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1001 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1003 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1147 = _1005 + _1145;
    float _1149 = _1139 * _1139;
    float _1151 = fma(_1143, _1143, _1149);
    float _1153 = fma(_1147, _1147, _1151);
    float _1155 = rsqrt(_1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1143 * _1157;
    float _1161 = _1147 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1151;
    float _1179 = _1133;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1139;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_1171)
    {
        float _1199 = _1175 * _1191;
        _1181 = _1199;
    }
    float _1201 = _1181;
    if (_1171)
    {
        float _1203 = _1201 * 0.15915493667125701904296875;
        _1183 = _1203;
    }
    float _1205 = _1183;
    float _1207 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1209 = _1147;
    if (_1171)
    {
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        _1209 = _1213;
    }
    float _1215 = _1209;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1219 = precise::max(0.0, _1217);
    float _1221 = _1191;
    float _1223 = _1219;
    if (_1171)
    {
        float _1225 = _1205 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = -_1157;
    float _1233 = -_1219;
    float _1235 = fma(_1139, _1231, _1233);
    if (_1171)
    {
        float _1237 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1185 = _1237;
    }
    float _1239 = _1185;
    float _1241 = sqrt(_1153);
    float _1243 = _1239;
    float _1245 = _1215;
    if (_1171)
    {
        float _1247 = fma(_1215, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = _1249;
    if (!_1171)
    {
        _1245 = _1163;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    float _1257 = _1229;
    if (_1171)
    {
        float _1259 = _1229 + (-1.0);
        _1223 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1261;
    if (_1171)
    {
        float _1265 = _1195 * _1249;
        _299 = _1265;
    }
    float _1267 = _299;
    if (!_1171)
    {
        _1251 = _1235;
    }
    float _1269 = _1251;
    float _1271 = _1269;
    if (_1171)
    {
        float _1273 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1197 = _1273;
    }
    float _1275 = _1197;
    if (_1171)
    {
        float _1277 = _1159 * _1267;
        _1187 = _1277;
    }
    float _1279 = _1187;
    if (!_1171)
    {
        _1263 = _1161;
    }
    float _1281 = _1263;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = _1161 * _1267;
        _1283 = _1285;
    }
    float _1287 = _1283;
    if (_1171)
    {
        float _1289 = fma(_1235, _1229, _1275);
        _1271 = _1289;
    }
    float _1291 = _1271;
    if (_1171)
    {
        float _1293 = _1279 * _1279;
        _1255 = _1293;
    }
    float _1295 = _1255;
    if (!_1171)
    {
        _1257 = _1165;
    }
    float _1297 = _1257;
    float _1299 = _1297;
    if (_1171)
    {
        float _1301 = _1287 * _1287;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = fma(_1291, _1291, _1295);
    float _1307 = _1305 + _1303;
    float _1309 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1325 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1327 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1329 = -_1315;
    float _1331 = _1329 + 1.0;
    float _1333 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1323);
    float _1335 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1325);
    float _1337 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1349 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1339);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1357 = _1321 * _1279;
    float _1359 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = _1321 * _1287;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    float _1365 = _1321 * _1291;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = -_1351;
    float _1371 = fma(_1369, _1207, 1.0);
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = -_1367;
    float _1381 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1379);
    float _1383 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1387 = log2(_1371);
    float _1389 = -_1361;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1381);
    float _1393 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1399 = fma(_1391, 0.5, 0.5);
    float _1401 = exp2(_1377);
    float _1403 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1405 = _1365 + 1.0;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1397);
    float _1409 = fma(_1399, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1403);
    float _1413 = 1.0 / _1385;
    float _1415 = fma(_1399, _1409, -0.212114393711090087890625);
    float _1417 = _1387 * 0.693147182464599609375;
    float _1419 = fma(_1399, _1415, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1395);
    float _1425 = -_1365;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1433 = fma(_1427, 0.5, 0.5);
    float _1435 = _1429 * _1413;
    float _1437 = _1431 * _1413;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1423 * 0.636619746685028076171875;
    float _1445 = -_1419;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _4150 = float3(_1439, _1441, _1421);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float3 _4161 = float3(_1439, _1441, _1421);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _4178 = float2(_1447, _1433);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4178, float2(0.0), isnan(_4178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4178, float2(0.0), isnan(_4178)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = in.m_49.y;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1476 = _623 + _1474;
    bool _1478 = _145 > 0.5;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1496 = 1.0 / _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1500 = _623 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1504 = _623 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1514 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = 1.0 / _1490;
    float _1518 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    bool _1520 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1522 = isnan(_623);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1532;
    bool _1536 = _1472 > 0.5;
    float _1538 = 1.0 / _1512;
    float _1540 = -_289;
    int _1542 = _1478 ? as_type<int>(_1540) : as_type<int>(_289);
    float _1544 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1546 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1548 = isnan(_623);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    bool _1558 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1560 = isnan(_623);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    bool _1570 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1572 = isnan(_623);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = 1.0 / _1482;
    float _1584 = _1476 * _1516;
    float _1586 = -_1580;
    float _1588 = _1586 + 1.0;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1590;
    float _1594 = 1.0 / _1508;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1073 > 0.0;
    bool _1606 = isnan(_1073);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1624 = _623 + _1622;
    float _1626 = 1.0 / _1494;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1630 = _623 + _1628;
    bool _1632 = !_1616;
    float _1634 = _1632 ? _289 : as_type<float>(_1542);
    float _1636 = _1624 * _1496;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1640 = _623 + _1638;
    float _1642 = _1630 * _1594;
    float _1644 = -_201;
    int _1646 = _1536 ? as_type<int>(_1644) : as_type<int>(_201);
    float _1648 = 1.0 / _1534;
    float _1650 = _1640 * _1538;
    float _1652 = _1500 * _1582;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1660 = _623 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1666;
    float _1670 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1672 = fma(_1592, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1674 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1676 = isnan(_623);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1668, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1688 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1690 = isnan(_623);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1704 = !_1620;
    float _1706 = _1704 ? _201 : as_type<float>(_1646);
    float _1708 = _1504 * _1626;
    float _1710 = _1660 * _1648;
    float _1712 = -_1684;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1702, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1718 = fma(_1664, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1720 = fma(_1598, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1722 = -_1698;
    float _1724 = _1722 + 1.0;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1734;
    float _1738 = _1698 * _1714;
    float _1740 = _1556 * _1724;
    float _1742 = fma(_1728, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1744 = fma(_1732, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1746 = -_1556;
    float _1748 = _1746 + 1.0;
    float _1750 = fma(_1736, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1760 = -_1530;
    float _1762 = _1760 + 1.0;
    float _1764 = _1568 * _1748;
    float _1766 = -_1568;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1774 = fma(_1754, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1776 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1778 = isnan(_623);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1530 * _1768;
    bool _1790 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1792 = isnan(_623);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = _1580 * _1762;
    float _1804 = fma(_1772, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1806 = fma(_1758, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = _1800 * _1588;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1818;
    float _1822 = _1786 * _1810;
    float _1824 = fma(_1602, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1826 = fma(_1816, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1828 = fma(_1820, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1830 = _1686 * _1822;
    float _1832 = -_1786;
    float _1834 = _1832 + 1.0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1840 = _1670 * _1822;
    float _1842 = _1672 * _1822;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1830);
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1842);
    float _1854 = fma(_1716, _1812, _1844);
    float _1856 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1840);
    float _1858 = _1634 + 0.5;
    float _1860 = fma(_1720, _1812, _1852);
    float _1862 = -_1706;
    float _1864 = _1862 + 0.5;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1868 = fma(_1718, _1812, _1856);
    float _1870 = fma(_1742, _1802, _1854);
    float _1872 = fma(_1750, _1802, _1860);
    float _1874 = fma(_1744, _1802, _1868);
    float _1876 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1880 = fma(_1774, _1788, _1870);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1882;
    float _1886 = _1876 * _1846;
    float _1888 = fma(_1838, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1890 = fma(_1826, _1764, _1880);
    float _1892 = fma(_1884, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1898 = _1878 * _1866;
    float _1900 = fma(_1888, _1740, _1890);
    float _1902 = fma(_1806, _1788, _1872);
    float _1904 = fma(_1804, _1788, _1874);
    out.m_66.x = _1886;
    out.m_66.y = _1898;
    float _1906 = fma(_1892, _1738, _1900);
    float _1908 = fma(_1850, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1910;
    float _1914 = fma(_1896, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1916;
    float _1920 = fma(_1828, _1764, _1902);
    float _1922 = fma(_1824, _1764, _1904);
    float _1924 = fma(_1912, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1926 = fma(_1918, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1928 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = fma(_1914, _1740, _1920);
    float _1932 = fma(_1908, _1740, _1922);
    float _1934 = exp2(_1928);
    float _1936 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1938 = fma(_1926, _1738, _1930);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1942 = _1073 * _1135;
    float _1944 = fma(_1924, _1738, _1932);
    float _1946 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1938);
    float _1948 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1906);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1952 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1944);
    bool _1954 = _1135 <= 0.0;
    bool _1956 = !_1612;
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1962 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1936 + _1385;
    float _1970 = -_1934;
    float _1972 = _1970 + 1.0;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1982 = _1968 * 0.5;
    out.m_45.x = _1962;
    out.m_68.x = _1974;
    out.m_68.y = _1976;
    out.m_68.z = _1978;
    out.m_68.w = _1940;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1936;
    out.gl_Position.w = _1385;
    out.m_70.z = _1982;
    out.m_70.w = _1385;
    float _1984 = _1980 * _1449;
    float _1986 = -_1980;
    float _1988 = _1986 + 1.0;
    float _1990 = _1460 * _1984;
    float _1992 = _1470 * _1984;
    float _1994 = fma(_1466, _1990, _1454);
    float _1996 = fma(_1468, _1990, _1456);
    float _1998 = _1460 * _1988;
    float _2000 = fma(_1460, _1992, _1458);
    out.m_72.x = _1994;
    out.m_72.y = _1996;
    out.m_72.z = _2000;
    out.m_72.w = _1998;
    if (!_1958)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2002;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _615 = false;
    bool _317 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2059 = as_type<float>(_107);
        out.gl_Position.z = _2059;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2127 = as_type<float>(_143);
        out.gl_Position.z = _2127;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_49.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = in.m_54.x;
    float _155 = in.m_54.y;
    float _157 = in.m_54.z;
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = _149 * _147;
    float _173 = in.m_60.x;
    float _175 = in.m_60.y;
    float _177 = in.m_60.z;
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
    float _211 = _155 * _161;
    bool _213 = !_193;
    int _215 = _213 ? 0 : 1;
    float _217 = _197 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = _155 * _167;
    bool _223 = !_205;
    int _225 = _223 ? 0 : 1;
    float _227 = fma(_153, _159, _211);
    int _229 = abs(_215);
    float _231 = _155 * _175;
    int _233 = abs(_225);
    float _235 = fma(_153, _165, _221);
    float _237 = -_195;
    float _239 = _179 + _237;
    bool _241 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _243 = fma(_153, _173, _231);
    float _245 = -_239;
    float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _249 = !_209;
    int _251 = _249 ? 0 : 1;
    float _253 = fma(_157, _163, _227);
    float _255 = float(_233);
    float _257 = fma(_219, 0.5, 0.5);
    bool _259 = _239 < 0.5;
    float _261 = float(_259);
    float _263 = fma(_157, _169, _235);
    int _265 = abs(_251);
    float _267 = abs(_247);
    float _269 = _255 * _267;
    float _271 = float(_229);
    float _273 = -_257;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_265);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _283 = fma(_157, _177, _243);
    float _285 = fma(_271, _275, _269);
    bool _287 = !_183;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = abs(_281);
    float _293 = fma(_277, _291, _285);
    bool _295 = !_241;
    float _297 = _263;
    float _299 = _283;
    float _315;
    if (!_295)
    {
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _303 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_91);
        float _321 = 1.0 / _319;
        float _323 = _125 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _327;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _343 = 1.0 / _329;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _349 = 1.0 / _341;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _353 = _325 + _351;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _357;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _363 = _345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _365 = _347 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _367 = _355 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _369 = 1.0 / _333;
    float _371 = _353 * _343;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _375 = _325 + _373;
    bool _377 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _379 = isnan(_325);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    out.m_62.x = _363;
    out.m_62.y = _365;
    out.m_62.z = _367;
    out.m_62.w = _361;
    float _389 = 1.0 / _337;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _393 = _325 + _391;
    float _395 = _375 * _349;
    bool _397 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _399 = isnan(_325);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = 1.0 / _359;
    float _411 = _393 * _369;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _415 = _325 + _413;
    bool _417 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _419 = isnan(_325);
    bool _421 = _417 || _419;
    bool _423 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _425 = _421 || _423;
    float _427 = float(_425);
    float _429 = -_387;
    float _431 = _429 + 1.0;
    float _433 = -_407;
    float _435 = _433 + 1.0;
    bool _437 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _439 = isnan(_325);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _449;
    float _453 = _415 * _389;
    float _455 = -_427;
    float _457 = _455 + 1.0;
    float _459 = _407 * _431;
    float _461 = _427 * _435;
    float _463 = fma(_451, _371, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _467 = _325 + _465;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _469;
    bool _473 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _475 = isnan(_325);
    bool _477 = _473 || _475;
    bool _479 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _481 = _477 || _479;
    float _483 = float(_481);
    float _485 = _447 * _457;
    float _487 = -_447;
    float _489 = _487 + 1.0;
    float _491 = _467 * _409;
    float _493 = fma(_471, _371, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _495 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _497 = isnan(_325);
    bool _499 = _495 || _497;
    bool _501 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _503 = _499 || _501;
    float _505 = float(_503);
    float _507 = _483 * _489;
    float _509 = -_483;
    float _511 = _509 + 1.0;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _515 = _513 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _525 = _505 * _511;
    float _527 = -_505;
    float _529 = _527 + 1.0;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _531;
    float _535 = fma(_515, _411, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = _463 * _525;
    float _539 = _493 * _525;
    float _541 = fma(_533, _453, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _543 = fma(_519, _453, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _545 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].x, _537);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _555 = fma(_523, _411, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _557 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[143].y, _539);
    float _559 = fma(_549, _395, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _561 = fma(_553, _395, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _563 = fma(_535, _507, _545);
    float _565 = fma(_555, _507, _557);
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _573;
    float _577 = fma(_541, _485, _563);
    float _579 = fma(_543, _485, _565);
    float _581 = fma(_571, _491, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _583 = fma(_575, _491, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _585 = fma(_559, _461, _577);
    float _587 = fma(_561, _461, _579);
    float _589 = fma(_581, _459, _585);
    float _591 = fma(_583, _459, _587);
    float _593 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].x, _589);
    float _595 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[148].y, _591);
    bool _597 = !_567;
    float _613;
    if (!_597)
    {
        float _599 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _601 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _603 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _605 = _603 * _599;
        float _607 = floor(_605);
        float _609 = -_607;
        float _611 = _605 + _609;
        _613 = _611;
        _615 = true;
    }
    else
    {
        float _617 = float(_91);
        float _619 = 1.0 / _617;
        float _621 = _125 * _619;
        _613 = _621;
    }
    _615 = false;
    float _623 = _613;
    float _625 = in.m_64.x;
    float _627 = in.m_64.y;
    float _629 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _631 = in.m_42.x;
    float _633 = in.m_42.y;
    float _635 = in.m_42.z;
    float _637 = in.m_60.w;
    float _639 = in.m_56.w;
    float _641 = _595 * _627;
    float _643 = _593 * _625;
    float _645 = _293 * _641;
    float _647 = _293 * _643;
    float _649 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _651 = _175 * _633;
    float _653 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _655 = _647 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _657 = _161 * _633;
    float _659 = fma(_173, _631, _651);
    float _661 = _653 * _649;
    float _663 = _655 * _629;
    float _665 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _667 = fma(_159, _631, _657);
    float _669 = _661 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _671 = _661 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _673 = fma(_177, _635, _659);
    float _675 = fma(_163, _635, _667);
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[26].x, _669);
    float _679 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[24].x, _671);
    float _681 = _673 + _637;
    float _683 = _675 + _639;
    float _685 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[26].z, _677);
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = _167 * _633;
    float _691 = _661 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _693 = _685 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _695 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _697 = fma(_165, _631, _689);
    float _699 = fma(_663, (*spvDescriptorSet0.vp_c8)._m0[25].x, _691);
    float _701 = _681 + _693;
    float _703 = _683 + _695;
    float _705 = in.m_58.w;
    float _707 = fma(_665, (*spvDescriptorSet0.vp_c8)._m0[25].z, _699);
    float _709 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _711 = _701 + _709;
    float _713 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _715 = _703 + _713;
    float _717 = _707 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _719 = _711 * _711;
    float _721 = fma(_715, _715, _719);
    float _723 = fma(_169, _635, _697);
    float _725 = sqrt(_721);
    float _727 = _723 + _705;
    float _729 = _727 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _731 = _727 + _717;
    bool _733 = _725 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _735 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[11].x, _729);
    float _737 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[11].z, _735);
    float _739 = _729;
    float _741 = _717;
    float _743 = _735;
    if (!_733)
    {
        _739 = _703;
    }
    float _745 = _739;
    float _747 = _745;
    if (!_733)
    {
        _741 = _701;
    }
    float _749 = _741;
    float _751 = _749;
    if (!_733)
    {
        _743 = _731;
    }
    float _753 = _743;
    bool _755 = !_733;
    float _757 = _753;
    if (!_755)
    {
        float _759 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _761 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _763 = _725 + _761;
        float _765 = _731 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _767 = _763 * _759;
        float _769 = rsqrt(_721);
        float _771 = _767 * 0.15915493667125701904296875;
        float _773 = _771 * 6.283185482025146484375;
        float _775 = sin(_773);
        float _777 = _771 * 6.283185482025146484375;
        float _779 = cos(_777);
        float _781 = fma(_775, _765, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _783 = _769 * _781;
        float _785 = _779 + (-1.0);
        float _787 = fma(_715, _783, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _789 = fma(_711, _783, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _791 = _785 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _793 = fma(_731, _779, _791);
        _757 = _793;
        _747 = _787;
        _751 = _789;
    }
    float _795 = _757;
    float _797 = _747;
    float _799 = _751;
    float _801 = -_727;
    float _803 = _801 + _795;
    float _805 = -_683;
    float _807 = _805 + _797;
    float _809 = _737 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _811 = _727 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _813 = _803 * _803;
    float _815 = -_681;
    float _817 = _815 + _799;
    float _819 = 1.0 / _809;
    float _821 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[10].x, _811);
    float _823 = fma(_807, _807, _813);
    float _825 = fma(_681, (*spvDescriptorSet0.vp_c8)._m0[10].z, _821);
    float _827 = fma(_817, _817, _823);
    bool _829 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _831 = isnan(0.5);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _837 = _833 || _835;
    float _839 = _825 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _841 = sqrt(_827);
    bool _843 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _845 = isnan(0.5);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _851 = _847 || _849;
    float _853 = _839 + _809;
    float _855 = _853 * _819;
    float _857 = _855 * 0.5;
    float _859 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _861 = fma(_857, (*spvDescriptorSet0.vp_c8)._m0[30].w, _859);
    float _863 = 1.0 / _861;
    bool _865 = _841 > 0.0;
    bool _867 = !_865;
    float _869 = _797;
    float _871 = _795;
    float _873 = _799;
    float _875 = _861;
    float _877 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _879 = _809;
    if (!_867)
    {
        float _881 = _263 * _263;
        float _883 = fma(_253, _253, _881);
        float _885 = rsqrt(_827);
        float _887 = fma(_283, _283, _883);
        float _889 = sqrt(_887);
        float _891 = _807 * _885;
        float _893 = _803 * _885;
        float _895 = _817 * _885;
        bool _897 = _889 > 0.0;
        bool _899 = !_897;
        _875 = _887;
        _877 = _889;
        if (!_899)
        {
            float _901 = rsqrt(_887);
            float _903 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _905 = _263 * _901;
            float _907 = _253 * _901;
            float _909 = _283 * _901;
            float _911 = _893 * _905;
            float _913 = fma(_891, _907, _911);
            float _915 = _903 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _917 = fma(_895, _909, _913);
            float _919 = _917 * _915;
            float _921 = fma(_253, _919, _797);
            float _923 = fma(_263, _919, _795);
            float _925 = fma(_283, _919, _799);
            _869 = _921;
            _871 = _923;
            _873 = _925;
            _877 = _907;
            _879 = _905;
        }
    }
    float _927 = _869;
    float _929 = _871;
    float _931 = _873;
    float _933 = _875;
    float _935 = _877;
    float _937 = _879;
    float _939 = _933;
    float _941 = _929;
    float _943 = _927;
    float _945 = _931;
    float _947 = _935;
    float _949 = _937;
    if (_851)
    {
        _297 = 1.0;
    }
    float _951 = _297;
    float _953 = _951;
    if (!_837)
    {
        float _955 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _957 = _727 + _955;
        float _959 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _961 = _683 + _959;
        float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _965 = -_683;
        float _967 = _965 + _927;
        float _969 = _957 * _957;
        float _971 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _973 = _681 + _971;
        float _975 = -_727;
        float _977 = _975 + _929;
        float _979 = -_681;
        float _981 = _979 + _931;
        float _983 = fma(_961, _961, _969);
        float _985 = fma(_973, _973, _983);
        float _987 = sqrt(_985);
        float _989 = precise::min(_987, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _991 = _989 * _963;
        float _993 = fma(_967, _991, _683);
        float _995 = fma(_977, _991, _727);
        float _997 = fma(_981, _991, _681);
        _939 = _969;
        _941 = _995;
        _943 = _993;
        _945 = _997;
        _947 = _963;
    }
    float _999 = _939;
    float _1001 = _941;
    float _1003 = _943;
    float _1005 = _945;
    float _1007 = _947;
    float _1009 = _999;
    float _1011 = _1007;
    if (_851)
    {
        _949 = 1.0;
    }
    float _1013 = _949;
    float _1015 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1017 = _863 * _1015;
    float _1019 = _1013;
    if (!_851)
    {
        float _1021 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1023 = _1021 * 0.15915493667125701904296875;
        float _1025 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1027 = _1023 * 6.283185482025146484375;
        float _1029 = cos(_1027);
        float _1031 = _1025 * 0.15915493667125701904296875;
        float _1033 = _1023 * 6.283185482025146484375;
        float _1035 = sin(_1033);
        float _1037 = 1.0 / _1029;
        float _1039 = _1031 * 6.283185482025146484375;
        float _1041 = cos(_1039);
        float _1043 = _1035 * _1037;
        float _1045 = _1031 * 6.283185482025146484375;
        float _1047 = sin(_1045);
        float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1051 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1049;
        float _1053 = _1041 * _1043;
        float _1055 = 1.0 / _1051;
        float _1057 = 1.0 / _1053;
        float _1059 = _1047 * _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1063 = fma(_1017, _1059, _1061);
        float _1065 = _1063 * _1055;
        float _1067 = precise::clamp(_1065, 0.0, 1.0);
        _1009 = _1043;
        _1011 = _1031;
        _953 = _1067;
    }
    float _1069 = _1009;
    float _1071 = _1011;
    float _1073 = _953;
    float _1075 = _1069;
    float _1077 = _1071;
    if (!_851)
    {
        float _1079 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1081 = _1079 * 0.15915493667125701904296875;
        float _1083 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1085 = _1081 * 6.283185482025146484375;
        float _1087 = cos(_1085);
        float _1089 = _1083 * 0.15915493667125701904296875;
        float _1091 = _1081 * 6.283185482025146484375;
        float _1093 = sin(_1091);
        float _1095 = 1.0 / _1087;
        float _1097 = _1089 * 6.283185482025146484375;
        float _1099 = cos(_1097);
        float _1101 = _1093 * _1095;
        float _1103 = _1089 * 6.283185482025146484375;
        float _1105 = sin(_1103);
        float _1107 = _1099 * _1101;
        float _1109 = 1.0 / _1107;
        float _1111 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1113 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1111;
        float _1115 = 1.0 / _1113;
        float _1117 = _1105 * _1109;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1121 = fma(_1017, _1117, _1119);
        float _1123 = _1121 * _1115;
        float _1125 = precise::clamp(_1123, 0.0, 1.0);
        float _1127 = -_1125;
        float _1129 = _1127 + 1.0;
        _1075 = _1095;
        _1077 = _1107;
        _1019 = _1129;
    }
    float _1131 = _1075;
    float _1133 = _1077;
    float _1135 = _1019;
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1001 + _1137;
    float _1141 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1143 = _1003 + _1141;
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1147 = _1005 + _1145;
    float _1149 = _1139 * _1139;
    float _1151 = fma(_1143, _1143, _1149);
    float _1153 = fma(_1147, _1147, _1151);
    float _1155 = rsqrt(_1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1159 = _1143 * _1157;
    float _1161 = _1147 * _1157;
    float _1163 = _1159 * _1159;
    float _1165 = _1161 * _1161;
    float _1167 = _1163 + _1165;
    float _1169 = sqrt(_1167);
    bool _1171 = _1169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1173 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1175 = _1169 + _1173;
    float _1177 = _1151;
    float _1179 = _1133;
    float _1181 = _1175;
    float _1183 = _1131;
    float _1185 = _1139;
    float _1187 = _1159;
    if (_1171)
    {
        float _1189 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1177 = _1189;
    }
    float _1191 = _1177;
    if (_1171)
    {
        float _1193 = rsqrt(_1167);
        _1179 = _1193;
    }
    float _1195 = _1179;
    float _1197 = _1195;
    if (_1171)
    {
        float _1199 = _1175 * _1191;
        _1181 = _1199;
    }
    float _1201 = _1181;
    if (_1171)
    {
        float _1203 = _1201 * 0.15915493667125701904296875;
        _1183 = _1203;
    }
    float _1205 = _1183;
    float _1207 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1209 = _1147;
    if (_1171)
    {
        float _1211 = _1205 * 6.283185482025146484375;
        float _1213 = sin(_1211);
        _1209 = _1213;
    }
    float _1215 = _1209;
    float _1217 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1219 = precise::max(0.0, _1217);
    float _1221 = _1191;
    float _1223 = _1219;
    if (_1171)
    {
        float _1225 = _1205 * 6.283185482025146484375;
        float _1227 = cos(_1225);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = -_1157;
    float _1233 = -_1219;
    float _1235 = fma(_1139, _1231, _1233);
    if (_1171)
    {
        float _1237 = _1235 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1185 = _1237;
    }
    float _1239 = _1185;
    float _1241 = sqrt(_1153);
    float _1243 = _1239;
    float _1245 = _1215;
    if (_1171)
    {
        float _1247 = fma(_1215, _1239, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = _1249;
    if (!_1171)
    {
        _1245 = _1163;
    }
    float _1253 = _1245;
    float _1255 = _1253;
    float _1257 = _1229;
    if (_1171)
    {
        float _1259 = _1229 + (-1.0);
        _1223 = _1259;
    }
    float _1261 = _1223;
    float _1263 = _1261;
    if (_1171)
    {
        float _1265 = _1195 * _1249;
        _299 = _1265;
    }
    float _1267 = _299;
    if (!_1171)
    {
        _1251 = _1235;
    }
    float _1269 = _1251;
    float _1271 = _1269;
    if (_1171)
    {
        float _1273 = _1261 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1197 = _1273;
    }
    float _1275 = _1197;
    if (_1171)
    {
        float _1277 = _1159 * _1267;
        _1187 = _1277;
    }
    float _1279 = _1187;
    if (!_1171)
    {
        _1263 = _1161;
    }
    float _1281 = _1263;
    float _1283 = _1281;
    if (_1171)
    {
        float _1285 = _1161 * _1267;
        _1283 = _1285;
    }
    float _1287 = _1283;
    if (_1171)
    {
        float _1289 = fma(_1235, _1229, _1275);
        _1271 = _1289;
    }
    float _1291 = _1271;
    if (_1171)
    {
        float _1293 = _1279 * _1279;
        _1255 = _1293;
    }
    float _1295 = _1255;
    if (!_1171)
    {
        _1257 = _1165;
    }
    float _1297 = _1257;
    float _1299 = _1297;
    if (_1171)
    {
        float _1301 = _1287 * _1287;
        _1299 = _1301;
    }
    float _1303 = _1299;
    float _1305 = fma(_1291, _1291, _1295);
    float _1307 = _1305 + _1303;
    float _1309 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1311 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1313 = fma(_1241, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1311);
    float _1315 = precise::clamp(_1313, 0.0, 1.0);
    float _1317 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1319 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1309);
    float _1321 = rsqrt(_1307);
    float _1323 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1325 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1317);
    float _1327 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1319);
    float _1329 = -_1315;
    float _1331 = _1329 + 1.0;
    float _1333 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1323);
    float _1335 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1325);
    float _1337 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1339 = _1001 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1341 = abs(_1331);
    float _1343 = log2(_1341);
    float _1345 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1333);
    float _1347 = _1335 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1349 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1339);
    float _1351 = _1337 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1353 = _1345 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1357 = _1321 * _1279;
    float _1359 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1349);
    float _1361 = _1321 * _1287;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1355);
    float _1365 = _1321 * _1291;
    float _1367 = _1357 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1369 = -_1351;
    float _1371 = fma(_1369, _1207, 1.0);
    float _1373 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1375 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1363);
    float _1377 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1379 = -_1367;
    float _1381 = fma(_1365, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1379);
    float _1383 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1385 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1375);
    float _1387 = log2(_1371);
    float _1389 = -_1361;
    float _1391 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1381);
    float _1393 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1395 = fma(_1391, -0.5, 0.5);
    float _1397 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1393);
    float _1399 = fma(_1391, 0.5, 0.5);
    float _1401 = exp2(_1377);
    float _1403 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1383);
    float _1405 = _1365 + 1.0;
    float _1407 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1397);
    float _1409 = fma(_1399, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1411 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1403);
    float _1413 = 1.0 / _1385;
    float _1415 = fma(_1399, _1409, -0.212114393711090087890625);
    float _1417 = _1387 * 0.693147182464599609375;
    float _1419 = fma(_1399, _1415, 1.570728778839111328125);
    float _1421 = _1417 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1423 = sqrt(_1395);
    float _1425 = -_1365;
    float _1427 = fma(_1401, _1405, _1425);
    float _1429 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1407);
    float _1431 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1411);
    float _1433 = fma(_1427, 0.5, 0.5);
    float _1435 = _1429 * _1413;
    float _1437 = _1431 * _1413;
    float _1439 = fma(_1435, 0.5, 0.5);
    float _1441 = fma(_1437, -0.5, 0.5);
    float _1443 = _1423 * 0.636619746685028076171875;
    float _1445 = -_1419;
    float _1447 = fma(_1443, _1445, 1.0);
    float3 _4150 = float3(_1439, _1441, _1421);
    float _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4150, float3(0.0), isnan(_4150)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4150, float3(0.0), isnan(_4150)), level(0.0)).x;
    float3 _4161 = float3(_1439, _1441, _1421);
    float4 _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4161, float3(0.0), isnan(_4161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4161, float3(0.0), isnan(_4161)), level(0.0)).xyzw;
    float _1454 = _1452.x;
    float _1456 = _1452.y;
    float _1458 = _1452.z;
    float _1460 = _1452.w;
    float2 _4178 = float2(_1447, _1433);
    float3 _1464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4178, float2(0.0), isnan(_4178)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4178, float2(0.0), isnan(_4178)), level(0.0)).xyz;
    float _1466 = _1464.x;
    float _1468 = _1464.y;
    float _1470 = _1464.z;
    float _1472 = in.m_49.y;
    float _1474 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1476 = _623 + _1474;
    bool _1478 = _145 > 0.5;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1486 = _1484 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1490 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1488;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1494 = _1492 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1496 = 1.0 / _1486;
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1500 = _623 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1504 = _623 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1512 = _1510 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1514 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1516 = 1.0 / _1490;
    float _1518 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1514);
    bool _1520 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1522 = isnan(_623);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1528 = _1524 || _1526;
    float _1530 = float(_1528);
    float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1534 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _1532;
    bool _1536 = _1472 > 0.5;
    float _1538 = 1.0 / _1512;
    float _1540 = -_289;
    int _1542 = _1478 ? as_type<int>(_1540) : as_type<int>(_289);
    float _1544 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1518);
    bool _1546 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1548 = isnan(_623);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1554 = _1550 || _1552;
    float _1556 = float(_1554);
    bool _1558 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1560 = isnan(_623);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    bool _1570 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1572 = isnan(_623);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = 1.0 / _1482;
    float _1584 = _1476 * _1516;
    float _1586 = -_1580;
    float _1588 = _1586 + 1.0;
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1592 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1590;
    float _1594 = 1.0 / _1508;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1598 = _1596 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1602 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1600;
    bool _1604 = _1073 > 0.0;
    bool _1606 = isnan(_1073);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan(0.0);
    bool _1612 = _1608 || _1610;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1620 = _1618 != 0;
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1624 = _623 + _1622;
    float _1626 = 1.0 / _1494;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1630 = _623 + _1628;
    bool _1632 = !_1616;
    float _1634 = _1632 ? _289 : as_type<float>(_1542);
    float _1636 = _1624 * _1496;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1640 = _623 + _1638;
    float _1642 = _1630 * _1594;
    float _1644 = -_201;
    int _1646 = _1536 ? as_type<int>(_1644) : as_type<int>(_201);
    float _1648 = 1.0 / _1534;
    float _1650 = _1640 * _1538;
    float _1652 = _1500 * _1582;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _1660 = _623 + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1666 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1668 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1666;
    float _1670 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1672 = fma(_1592, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1674 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _1676 = isnan(_623);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _1682 = _1678 || _1680;
    float _1684 = float(_1682);
    float _1686 = fma(_1668, _1652, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1688 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1690 = isnan(_623);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _1696 = _1692 || _1694;
    float _1698 = float(_1696);
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _1704 = !_1620;
    float _1706 = _1704 ? _201 : as_type<float>(_1646);
    float _1708 = _1504 * _1626;
    float _1710 = _1660 * _1648;
    float _1712 = -_1684;
    float _1714 = _1712 + 1.0;
    float _1716 = fma(_1702, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1718 = fma(_1664, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1720 = fma(_1598, _1636, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1722 = -_1698;
    float _1724 = _1722 + 1.0;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1728 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1726;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1730;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1734;
    float _1738 = _1698 * _1714;
    float _1740 = _1556 * _1724;
    float _1742 = fma(_1728, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1744 = fma(_1732, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1746 = -_1556;
    float _1748 = _1746 + 1.0;
    float _1750 = fma(_1736, _1584, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1754 = _1752 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1760 = -_1530;
    float _1762 = _1760 + 1.0;
    float _1764 = _1568 * _1748;
    float _1766 = -_1568;
    float _1768 = _1766 + 1.0;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1774 = fma(_1754, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    bool _1776 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1778 = isnan(_623);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1530 * _1768;
    bool _1790 = _623 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1792 = isnan(_623);
    bool _1794 = _1790 || _1792;
    bool _1796 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1798 = _1794 || _1796;
    float _1800 = float(_1798);
    float _1802 = _1580 * _1762;
    float _1804 = fma(_1772, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1806 = fma(_1758, _1708, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1808 = -_1800;
    float _1810 = _1808 + 1.0;
    float _1812 = _1800 * _1588;
    float _1814 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1818;
    float _1822 = _1786 * _1810;
    float _1824 = fma(_1602, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1826 = fma(_1816, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1828 = fma(_1820, _1642, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1830 = _1686 * _1822;
    float _1832 = -_1786;
    float _1834 = _1832 + 1.0;
    float _1836 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1838 = _1836 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1840 = _1670 * _1822;
    float _1842 = _1672 * _1822;
    float _1844 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1830);
    float _1846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1850 = _1848 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1852 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1842);
    float _1854 = fma(_1716, _1812, _1844);
    float _1856 = fma(_1834, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1840);
    float _1858 = _1634 + 0.5;
    float _1860 = fma(_1720, _1812, _1852);
    float _1862 = -_1706;
    float _1864 = _1862 + 0.5;
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1868 = fma(_1718, _1812, _1856);
    float _1870 = fma(_1742, _1802, _1854);
    float _1872 = fma(_1750, _1802, _1860);
    float _1874 = fma(_1744, _1802, _1868);
    float _1876 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1878 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1880 = fma(_1774, _1788, _1870);
    float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1882;
    float _1886 = _1876 * _1846;
    float _1888 = fma(_1838, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1890 = fma(_1826, _1764, _1880);
    float _1892 = fma(_1884, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1898 = _1878 * _1866;
    float _1900 = fma(_1888, _1740, _1890);
    float _1902 = fma(_1806, _1788, _1872);
    float _1904 = fma(_1804, _1788, _1874);
    out.m_66.x = _1886;
    out.m_66.y = _1898;
    float _1906 = fma(_1892, _1738, _1900);
    float _1908 = fma(_1850, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1910 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1912 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1910;
    float _1914 = fma(_1896, _1650, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1916 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1918 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1916;
    float _1920 = fma(_1828, _1764, _1902);
    float _1922 = fma(_1824, _1764, _1904);
    float _1924 = fma(_1912, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1926 = fma(_1918, _1710, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1928 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1930 = fma(_1914, _1740, _1920);
    float _1932 = fma(_1908, _1740, _1922);
    float _1934 = exp2(_1928);
    float _1936 = fma(_1373, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1544);
    float _1938 = fma(_1926, _1738, _1930);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1942 = _1073 * _1135;
    float _1944 = fma(_1924, _1738, _1932);
    float _1946 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1938);
    float _1948 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1906);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1952 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1944);
    bool _1954 = _1135 <= 0.0;
    bool _1956 = !_1612;
    bool _1958 = _1954 || _1956;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1962 = _1950 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1964 = _1948 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1966 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1968 = _1936 + _1385;
    float _1970 = -_1934;
    float _1972 = _1970 + 1.0;
    float _1974 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1976 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1982 = _1968 * 0.5;
    out.m_45.x = _1962;
    out.m_68.x = _1974;
    out.m_68.y = _1976;
    out.m_68.z = _1978;
    out.m_68.w = _1940;
    out.gl_Position.x = _1429;
    out.gl_Position.y = _1431;
    out.gl_Position.z = _1936;
    out.gl_Position.w = _1385;
    out.m_70.z = _1982;
    out.m_70.w = _1385;
    float _1984 = _1980 * _1449;
    float _1986 = -_1980;
    float _1988 = _1986 + 1.0;
    float _1990 = _1460 * _1984;
    float _1992 = _1470 * _1984;
    float _1994 = fma(_1466, _1990, _1454);
    float _1996 = fma(_1468, _1990, _1456);
    float _1998 = _1460 * _1988;
    float _2000 = fma(_1460, _1992, _1458);
    out.m_72.x = _1994;
    out.m_72.y = _1996;
    out.m_72.z = _2000;
    out.m_72.w = _1998;
    if (!_1958)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2002;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

