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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1415 = as_type<float>(_99);
        out.gl_Position.z = _1415;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = _117;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_137);
        out.gl_Position.z = _1485;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.z;
    float _141 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _143 = log2(_141);
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = 0.0;
    float _167 = _159;
    if (!_157)
    {
        float _169 = _159 * _159;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_157)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _139 * 2.0;
    float _183 = _145 * 2.0;
    float _185 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _187 = floor(_181);
    float _189 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _191 = -_161;
    float _193 = fma(_185, 2.0, _191);
    float _195 = fma(_189, -2.0, _163);
    float _197 = floor(_183);
    bool _199 = _187 > 0.0;
    bool _201 = _187 >= 0.0;
    bool _203 = isnan(_187);
    bool _205 = _201 || _203;
    bool _207 = isnan(0.0);
    bool _209 = _205 || _207;
    bool _211 = !_157;
    float _213 = _179;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _159 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _159);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _159 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _167 = _267;
    }
    float _269 = _167;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _281 = _279 != 0;
    float _283 = _145 + _147;
    float _285 = _147 * 2.0;
    int _287 = _209 ? 0 : 1;
    float _289 = _283 + (-1.0);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = _143 * _117;
    bool _297 = _197 > 0.0;
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _301 = _197 >= 0.0;
    bool _303 = isnan(_197);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = floor(_285);
    int _313 = abs(_293);
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _193);
    int _319 = ~_287;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    float _325 = as_type<float>(int(gl_VertexIndex));
    int _327 = _323;
    if (!_199)
    {
        int _329 = ~_287;
        int _331 = _329 + 1;
        _327 = _331;
    }
    int _333 = _327;
    float _335 = exp2(_295);
    float _337 = float(_333);
    float _339 = in.m_54.y;
    float _341 = float(_313);
    int _343 = _309 ? 0 : 1;
    float _345 = in.m_54.w;
    float _347 = _341 * _337;
    float _349 = in.m_54.x;
    int _351 = ~_343;
    int _353 = _351 + 1;
    int _355 = _353 + 1;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _359 = _355;
    if (!_297)
    {
        int _361 = ~_343;
        int _363 = _361 + 1;
        _359 = _363;
    }
    int _365 = _359;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _369 = 1.0 + _367;
    float _371 = in.m_56.x;
    float _373 = in.m_56.y;
    float _375 = in.m_56.z;
    bool _377 = _311 > 0.0;
    float _379 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _381 = 1.0 / _369;
    bool _383 = _311 >= 0.0;
    bool _385 = isnan(_311);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    float _393 = -_335;
    float _395 = _393 + 1.0;
    float _397 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _379);
    bool _399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _401 = isnan(1.0);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _407 = _403 || _405;
    bool _409 = !_277;
    int _411 = _409 ? 0 : 1;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    int _425 = abs(_411);
    float _427 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _195);
    float _429 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _413);
    float _431 = _423 ? _395 : 0.0;
    float _433 = float(_365);
    float _435 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _437 = float(_425);
    if (_407)
    {
        float _439 = _431 * _381;
        _119 = _439;
    }
    float _441 = _119;
    float _443 = _347 * (-2.0);
    bool _445 = !_281;
    int _447 = _445 ? 0 : 1;
    int _449 = _391 ? 0 : 1;
    float _451 = fma(_299, _443, _299);
    float _453 = fma(_443, _371, _371);
    float _455 = _147 + _139;
    float _457 = _437 * _433;
    int _459 = abs(_447);
    float _461 = _455 + (-1.0);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = _145 + (-0.5);
    float _471 = _457 * (-2.0);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _475 = _467;
    if (!_377)
    {
        int _477 = ~_449;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    float _485 = float(_459);
    float _487 = fma(_473, _471, _473);
    float _489 = float(_481);
    float _491 = fma(_471, _373, _373);
    float _493 = _147 + (-0.5);
    float _495 = fma(_451, _441, _483);
    float _497 = _145 + _139;
    float _499 = _485 * _489;
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[196].y, _491);
    float _503 = _495 * 0.15915493667125701904296875;
    float _505 = in.m_47.x;
    float _507 = in.m_47.y;
    float _509 = in.m_47.z;
    float _511 = _497 + (-1.0);
    float _513 = fma(_487, _441, _501);
    float _515 = _499 * (-2.0);
    float _517 = _139 + (-0.5);
    float _519 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_515, _375, _375);
    float _525 = _503 * 6.283185482025146484375;
    float _527 = sin(_525);
    float _529 = in.m_42.x;
    float _531 = in.m_42.y;
    float _533 = in.m_42.z;
    float _535 = fma(_519, _515, _519);
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _523);
    float _539 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _541 = as_type<int>(_325) & 1;
    bool _543 = _541 != 0;
    int _545 = as_type<int>(_325) & 2;
    bool _547 = _545 != 0;
    float _549 = fma(_535, _441, _537);
    float _551 = _503 * 6.283185482025146484375;
    float _553 = cos(_551);
    float _555 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _557 = fma(_269, _505, _539);
    float _559 = _549 * 0.15915493667125701904296875;
    float _561 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _563 = _521 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = _339 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = fma(_269, _507, _561);
    float _571 = fma(_269, _509, _555);
    bool _573 = !_547;
    float _575 = _573 ? (-0.5) : 0.5;
    float _577 = fma(_557, _345, _529);
    bool _579 = !_543;
    float _581 = _579 ? (-0.5) : 0.5;
    float _583 = _521 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = _349 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _591 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _593 = fma(_569, _345, _531);
    float _595 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _581);
    float _599 = _589 * _591;
    float _601 = _559 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = fma(_571, _345, _533);
    float _607 = _595 * _597;
    float _609 = _553 * _565;
    float _611 = _527 * _565;
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _559 * 6.283185482025146484375;
    float _625 = sin(_623);
    float _627 = _527 * _585;
    float _629 = _603 * _599;
    float _631 = _565 * _603;
    float _633 = _585 * _603;
    float _635 = -_599;
    float _637 = _625 * _635;
    float _639 = _553 * _585;
    float _641 = -_609;
    float _643 = fma(_625, _627, _641);
    float _645 = -_627;
    float _647 = fma(_625, _609, _645);
    float _649 = _553 * _629;
    float _651 = fma(_625, _639, _611);
    float _653 = fma(_633, _607, _637);
    float _655 = _527 * _629;
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = fma(_651, _607, _649);
    float _661 = fma(_625, _611, _639);
    float _663 = fma(_643, _607, _655);
    float _665 = _593 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_647, _657, _659);
    float _669 = fma(_631, _657, _653);
    float _671 = fma(_661, _657, _663);
    float _673 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _675 = _593 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _677 = _667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = _667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _683 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[4].x, _675);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _687 = _593 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _691 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _693 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[8].x, _679);
    float _695 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _685);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _699 = _691 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _693);
    float _703 = _689 + _695;
    float _705 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    float _707 = _667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _709 = _699 + _701;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _705 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _717 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[9].x, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _713 * _713;
    float _725 = _715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _727 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _717);
    float _729 = fma(_721, _721, _723);
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _725);
    float _733 = sqrt(_729);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _731);
    float _737 = _715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _715 + _727;
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _743 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = 1.0 / _741;
    float _747 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _749 = _689;
    float _751 = _707;
    float _753 = _709;
    float _755 = _727;
    float _757 = _713;
    if (_621)
    {
        _749 = 1.0;
    }
    float _759 = _749;
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _763 = _733 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = _761 + _741;
    float _767 = _765 * _745;
    float _769 = _767 * 0.5;
    float _771 = _765;
    float _773 = _759;
    if (!_763)
    {
        _771 = _703;
    }
    float _775 = _771;
    float _777 = _775;
    if (!_763)
    {
        _751 = _739;
    }
    float _779 = _751;
    bool _781 = !_763;
    float _783 = _779;
    if (!_781)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _789 = _733 + _787;
        float _791 = rsqrt(_729);
        float _793 = _789 * _785;
        float _795 = _739 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = _793 * 0.15915493667125701904296875;
        float _799 = _797 * 6.283185482025146484375;
        float _801 = cos(_799);
        float _803 = _797 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _801 + (-1.0);
        float _809 = fma(_805, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _811 = _807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _791 * _809;
        float _815 = fma(_739, _801, _811);
        float _817 = fma(_721, _813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _819 = fma(_713, _813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _783 = _815;
        _753 = _817;
        _777 = _819;
    }
    float _821 = _783;
    float _823 = _753;
    float _825 = _777;
    if (!_621)
    {
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
        float _837 = _829 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _831 * 0.15915493667125701904296875;
        float _843 = _829 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = 1.0 / _839;
        float _849 = _841 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _845 * _847;
        float _855 = _841 * 6.283185482025146484375;
        float _857 = sin(_855);
        float _859 = _851 * _853;
        float _861 = 1.0 / _835;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _865 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _863;
        float _867 = 1.0 / _859;
        float _869 = 1.0 / _865;
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _873 = _861 * _871;
        float _875 = _857 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_875, _873, _877);
        float _881 = _879 * _869;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _755 = _867;
        _773 = _887;
    }
    float _889 = _755;
    float _891 = _773;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _821 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _823 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _825 + _901;
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = _895 * _895;
    float _909 = fma(_899, _899, _907);
    float _911 = fma(_903, _903, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _899 * _917;
    float _921 = _903 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _903;
    float _939 = _907;
    float _941 = _935;
    float _943 = _895;
    float _945 = _919;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    if (_931)
    {
        float _951 = rsqrt(_927);
        _939 = _951;
    }
    float _953 = _939;
    float _955 = _953;
    if (_931)
    {
        float _957 = _935 * _949;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _821 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_931)
    {
        float _963 = _959 * 0.15915493667125701904296875;
        _757 = _963;
    }
    float _965 = _757;
    float _967 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    float _969 = _913;
    if (_931)
    {
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _979 = precise::max(0.0, _977);
    float _981 = _889;
    float _983 = _979;
    float _985 = _977;
    if (_931)
    {
        float _987 = _965 * 6.283185482025146484375;
        float _989 = cos(_987);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_917;
    float _995 = -_979;
    float _997 = fma(_895, _993, _995);
    if (_931)
    {
        float _999 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _999;
    }
    float _1001 = _983;
    float _1003 = _975;
    float _1005 = _1001;
    if (_931)
    {
        float _1007 = fma(_975, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1013 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1011);
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = _821 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = _1009;
    if (_931)
    {
        float _1021 = _991 + (-1.0);
        _985 = _1021;
    }
    float _1023 = _985;
    float _1025 = _1023;
    if (_931)
    {
        float _1027 = _953 * _1009;
        _1005 = _1027;
    }
    float _1029 = _1005;
    if (!_931)
    {
        _955 = _997;
    }
    float _1031 = _955;
    float _1033 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1035 = _1031;
    if (_931)
    {
        float _1037 = _1023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1037;
    }
    float _1039 = _943;
    float _1041 = _1039;
    if (_931)
    {
        float _1043 = _919 * _1029;
        _945 = _1043;
    }
    float _1045 = _945;
    if (!_931)
    {
        _1019 = _921;
    }
    float _1047 = _1019;
    float _1049 = _1047;
    if (_931)
    {
        float _1051 = _921 * _1029;
        _1049 = _1051;
    }
    float _1053 = _1049;
    if (!_931)
    {
        _1025 = _923;
    }
    float _1055 = _1025;
    float _1057 = _1055;
    if (_931)
    {
        float _1059 = fma(_997, _991, _1039);
        _1035 = _1059;
    }
    float _1061 = _1035;
    if (_931)
    {
        float _1063 = _1045 * _1045;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (!_931)
    {
        _1041 = _925;
    }
    float _1067 = _1041;
    float _1069 = _1067;
    if (_931)
    {
        float _1071 = _1053 * _1053;
        _1069 = _1071;
    }
    float _1073 = _1069;
    float _1075 = -_1015;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1061, _1061, _1065);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1085 = _1079 + _1073;
    float _1087 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1089 = _821 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = rsqrt(_1085);
    float _1095 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1087);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1099 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1101 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1103 = abs(_1077);
    float _1105 = log2(_1103);
    float _1107 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1033);
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _905, 1.0);
    float _1121 = _1093 * _1045;
    float _1123 = _1093 * _1061;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1127 = _1093 * _1053;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = log2(_1119);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1135 = -_1129;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1135);
    float _1139 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1141 = -_1127;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1137);
    float _1145 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1133);
    float _1149 = exp2(_1139);
    float _1151 = fma(_1143, -0.5, 0.5);
    float _1153 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1155 = fma(_1143, 0.5, 0.5);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1159 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1153);
    float _1161 = _1123 + 1.0;
    float _1163 = 1.0 / _1147;
    float _1165 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1169 = fma(_1155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = _1131 * 0.693147182464599609375;
    float _1173 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = fma(_1155, _1169, -0.212114393711090087890625);
    float _1179 = sqrt(_1151);
    float _1181 = -_1123;
    float _1183 = fma(_1149, _1161, _1181);
    float _1185 = fma(_1155, _1177, 1.570728778839111328125);
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = _1173 * _1163;
    float _1191 = _1175 * _1163;
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1195 = fma(_1189, 0.5, 0.5);
    float _1197 = fma(_1191, -0.5, 0.5);
    float _1199 = _1179 * 0.636619746685028076171875;
    float3 _3139 = float3(_1195, _1197, _1193);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).x;
    float3 _3150 = float3(_1195, _1197, _1193);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3150, float3(0.0), isnan(_3150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3150, float3(0.0), isnan(_3150)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float _1214 = -_1185;
    float _1216 = fma(_1199, _1214, 1.0);
    float2 _3172 = float2(_1216, _1187);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3172, float2(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3172, float2(0.0), isnan(_3172)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1230 = _145 > 0.5;
    float _1232 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = -_435;
    float _1240 = _1238 + 1.0;
    float _1242 = -_581;
    int _1244 = _1230 ? as_type<int>(_1242) : as_type<int>(_581);
    float _1246 = -_397;
    float _1248 = _1246 + 1.0;
    bool _1250 = _147 > 0.5;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1254 = !_1236;
    float _1256 = _1254 ? _581 : as_type<float>(_1244);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1260 = _1258 != 0;
    float _1262 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1264 = -_575;
    int _1266 = _1250 ? as_type<int>(_1264) : as_type<int>(_575);
    float _1268 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1232);
    float _1270 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1256 + 0.5;
    float _1274 = exp2(_1262);
    bool _1276 = !_1260;
    float _1278 = _1276 ? _575 : as_type<float>(_1266);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = fma(_1270, _1272, _317);
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1286 = _1278 + (-0.5);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1292 = -_1284;
    float _1294 = -_427;
    float _1296 = fma(_1292, _1286, _1294);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = -_1274;
    float _1306 = _1304 + 1.0;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1312 = fma(_1278, _1240, _1296);
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1316 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1318 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_58.x = _1302;
    out.m_58.y = _1308;
    out.m_58.z = _1298;
    out.m_58.w = _1300;
    bool _1320 = _891 > 0.0;
    bool _1322 = isnan(_891);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1248;
    float _1332 = fma(_1256, _1330, _1282);
    float _1334 = _1318 + _1147;
    out.m_60.x = _1332;
    out.m_60.y = _1312;
    float _1336 = _1334 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _1147;
    float _1338 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_62.z = _1336;
    out.m_62.w = _1147;
    out.m_45.x = _1338;
    float _1340 = _1314 * _1201;
    float _1342 = -_1314;
    float _1344 = _1342 + 1.0;
    float _1346 = _1212 * _1340;
    float _1348 = _1212 * _1344;
    float _1350 = _1226 * _1340;
    float _1352 = fma(_1222, _1346, _1206);
    float _1354 = fma(_1224, _1346, _1208);
    float _1356 = fma(_1212, _1350, _1210);
    out.m_64.x = _1352;
    out.m_64.y = _1354;
    out.m_64.z = _1356;
    out.m_64.w = _1348;
    if (_1328)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1358;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1415 = as_type<float>(_99);
        out.gl_Position.z = _1415;
    }
    if (!_87)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = _117;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_137);
        out.gl_Position.z = _1485;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.z;
    float _141 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _143 = log2(_141);
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = 0.0;
    float _167 = _159;
    if (!_157)
    {
        float _169 = _159 * _159;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_157)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _139 * 2.0;
    float _183 = _145 * 2.0;
    float _185 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _187 = floor(_181);
    float _189 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _191 = -_161;
    float _193 = fma(_185, 2.0, _191);
    float _195 = fma(_189, -2.0, _163);
    float _197 = floor(_183);
    bool _199 = _187 > 0.0;
    bool _201 = _187 >= 0.0;
    bool _203 = isnan(_187);
    bool _205 = _201 || _203;
    bool _207 = isnan(0.0);
    bool _209 = _205 || _207;
    bool _211 = !_157;
    float _213 = _179;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _159 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _159);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _159 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _167 = _267;
    }
    float _269 = _167;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _281 = _279 != 0;
    float _283 = _145 + _147;
    float _285 = _147 * 2.0;
    int _287 = _209 ? 0 : 1;
    float _289 = _283 + (-1.0);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = _143 * _117;
    bool _297 = _197 > 0.0;
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _301 = _197 >= 0.0;
    bool _303 = isnan(_197);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = floor(_285);
    int _313 = abs(_293);
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _193);
    int _319 = ~_287;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    float _325 = as_type<float>(int(gl_VertexIndex));
    int _327 = _323;
    if (!_199)
    {
        int _329 = ~_287;
        int _331 = _329 + 1;
        _327 = _331;
    }
    int _333 = _327;
    float _335 = exp2(_295);
    float _337 = float(_333);
    float _339 = in.m_54.y;
    float _341 = float(_313);
    int _343 = _309 ? 0 : 1;
    float _345 = in.m_54.w;
    float _347 = _341 * _337;
    float _349 = in.m_54.x;
    int _351 = ~_343;
    int _353 = _351 + 1;
    int _355 = _353 + 1;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _359 = _355;
    if (!_297)
    {
        int _361 = ~_343;
        int _363 = _361 + 1;
        _359 = _363;
    }
    int _365 = _359;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _369 = 1.0 + _367;
    float _371 = in.m_56.x;
    float _373 = in.m_56.y;
    float _375 = in.m_56.z;
    bool _377 = _311 > 0.0;
    float _379 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _381 = 1.0 / _369;
    bool _383 = _311 >= 0.0;
    bool _385 = isnan(_311);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    float _393 = -_335;
    float _395 = _393 + 1.0;
    float _397 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _379);
    bool _399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _401 = isnan(1.0);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _407 = _403 || _405;
    bool _409 = !_277;
    int _411 = _409 ? 0 : 1;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    int _425 = abs(_411);
    float _427 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _195);
    float _429 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _413);
    float _431 = _423 ? _395 : 0.0;
    float _433 = float(_365);
    float _435 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _437 = float(_425);
    if (_407)
    {
        float _439 = _431 * _381;
        _119 = _439;
    }
    float _441 = _119;
    float _443 = _347 * (-2.0);
    bool _445 = !_281;
    int _447 = _445 ? 0 : 1;
    int _449 = _391 ? 0 : 1;
    float _451 = fma(_299, _443, _299);
    float _453 = fma(_443, _371, _371);
    float _455 = _147 + _139;
    float _457 = _437 * _433;
    int _459 = abs(_447);
    float _461 = _455 + (-1.0);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = _145 + (-0.5);
    float _471 = _457 * (-2.0);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _475 = _467;
    if (!_377)
    {
        int _477 = ~_449;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    float _485 = float(_459);
    float _487 = fma(_473, _471, _473);
    float _489 = float(_481);
    float _491 = fma(_471, _373, _373);
    float _493 = _147 + (-0.5);
    float _495 = fma(_451, _441, _483);
    float _497 = _145 + _139;
    float _499 = _485 * _489;
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[196].y, _491);
    float _503 = _495 * 0.15915493667125701904296875;
    float _505 = in.m_47.x;
    float _507 = in.m_47.y;
    float _509 = in.m_47.z;
    float _511 = _497 + (-1.0);
    float _513 = fma(_487, _441, _501);
    float _515 = _499 * (-2.0);
    float _517 = _139 + (-0.5);
    float _519 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_515, _375, _375);
    float _525 = _503 * 6.283185482025146484375;
    float _527 = sin(_525);
    float _529 = in.m_42.x;
    float _531 = in.m_42.y;
    float _533 = in.m_42.z;
    float _535 = fma(_519, _515, _519);
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _523);
    float _539 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _541 = as_type<int>(_325) & 1;
    bool _543 = _541 != 0;
    int _545 = as_type<int>(_325) & 2;
    bool _547 = _545 != 0;
    float _549 = fma(_535, _441, _537);
    float _551 = _503 * 6.283185482025146484375;
    float _553 = cos(_551);
    float _555 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _557 = fma(_269, _505, _539);
    float _559 = _549 * 0.15915493667125701904296875;
    float _561 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _563 = _521 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = _339 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = fma(_269, _507, _561);
    float _571 = fma(_269, _509, _555);
    bool _573 = !_547;
    float _575 = _573 ? (-0.5) : 0.5;
    float _577 = fma(_557, _345, _529);
    bool _579 = !_543;
    float _581 = _579 ? (-0.5) : 0.5;
    float _583 = _521 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = _349 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _591 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _593 = fma(_569, _345, _531);
    float _595 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _581);
    float _599 = _589 * _591;
    float _601 = _559 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = fma(_571, _345, _533);
    float _607 = _595 * _597;
    float _609 = _553 * _565;
    float _611 = _527 * _565;
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _559 * 6.283185482025146484375;
    float _625 = sin(_623);
    float _627 = _527 * _585;
    float _629 = _603 * _599;
    float _631 = _565 * _603;
    float _633 = _585 * _603;
    float _635 = -_599;
    float _637 = _625 * _635;
    float _639 = _553 * _585;
    float _641 = -_609;
    float _643 = fma(_625, _627, _641);
    float _645 = -_627;
    float _647 = fma(_625, _609, _645);
    float _649 = _553 * _629;
    float _651 = fma(_625, _639, _611);
    float _653 = fma(_633, _607, _637);
    float _655 = _527 * _629;
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = fma(_651, _607, _649);
    float _661 = fma(_625, _611, _639);
    float _663 = fma(_643, _607, _655);
    float _665 = _593 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_647, _657, _659);
    float _669 = fma(_631, _657, _653);
    float _671 = fma(_661, _657, _663);
    float _673 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _675 = _593 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _677 = _667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = _667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _683 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[4].x, _675);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _687 = _593 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _691 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _693 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[8].x, _679);
    float _695 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _685);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _699 = _691 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _693);
    float _703 = _689 + _695;
    float _705 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    float _707 = _667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _709 = _699 + _701;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _705 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _717 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[9].x, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _713 * _713;
    float _725 = _715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _727 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _717);
    float _729 = fma(_721, _721, _723);
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _725);
    float _733 = sqrt(_729);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _731);
    float _737 = _715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _715 + _727;
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _743 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = 1.0 / _741;
    float _747 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _749 = _689;
    float _751 = _707;
    float _753 = _709;
    float _755 = _727;
    float _757 = _713;
    if (_621)
    {
        _749 = 1.0;
    }
    float _759 = _749;
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _763 = _733 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = _761 + _741;
    float _767 = _765 * _745;
    float _769 = _767 * 0.5;
    float _771 = _765;
    float _773 = _759;
    if (!_763)
    {
        _771 = _703;
    }
    float _775 = _771;
    float _777 = _775;
    if (!_763)
    {
        _751 = _739;
    }
    float _779 = _751;
    bool _781 = !_763;
    float _783 = _779;
    if (!_781)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _789 = _733 + _787;
        float _791 = rsqrt(_729);
        float _793 = _789 * _785;
        float _795 = _739 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = _793 * 0.15915493667125701904296875;
        float _799 = _797 * 6.283185482025146484375;
        float _801 = cos(_799);
        float _803 = _797 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _801 + (-1.0);
        float _809 = fma(_805, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _811 = _807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _791 * _809;
        float _815 = fma(_739, _801, _811);
        float _817 = fma(_721, _813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _819 = fma(_713, _813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _783 = _815;
        _753 = _817;
        _777 = _819;
    }
    float _821 = _783;
    float _823 = _753;
    float _825 = _777;
    if (!_621)
    {
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
        float _837 = _829 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _831 * 0.15915493667125701904296875;
        float _843 = _829 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = 1.0 / _839;
        float _849 = _841 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _845 * _847;
        float _855 = _841 * 6.283185482025146484375;
        float _857 = sin(_855);
        float _859 = _851 * _853;
        float _861 = 1.0 / _835;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _865 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _863;
        float _867 = 1.0 / _859;
        float _869 = 1.0 / _865;
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _873 = _861 * _871;
        float _875 = _857 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_875, _873, _877);
        float _881 = _879 * _869;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _755 = _867;
        _773 = _887;
    }
    float _889 = _755;
    float _891 = _773;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _821 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _823 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _825 + _901;
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = _895 * _895;
    float _909 = fma(_899, _899, _907);
    float _911 = fma(_903, _903, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _899 * _917;
    float _921 = _903 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _903;
    float _939 = _907;
    float _941 = _935;
    float _943 = _895;
    float _945 = _919;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    if (_931)
    {
        float _951 = rsqrt(_927);
        _939 = _951;
    }
    float _953 = _939;
    float _955 = _953;
    if (_931)
    {
        float _957 = _935 * _949;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _821 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_931)
    {
        float _963 = _959 * 0.15915493667125701904296875;
        _757 = _963;
    }
    float _965 = _757;
    float _967 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    float _969 = _913;
    if (_931)
    {
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _979 = precise::max(0.0, _977);
    float _981 = _889;
    float _983 = _979;
    float _985 = _977;
    if (_931)
    {
        float _987 = _965 * 6.283185482025146484375;
        float _989 = cos(_987);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_917;
    float _995 = -_979;
    float _997 = fma(_895, _993, _995);
    if (_931)
    {
        float _999 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _999;
    }
    float _1001 = _983;
    float _1003 = _975;
    float _1005 = _1001;
    if (_931)
    {
        float _1007 = fma(_975, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1013 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1011);
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = _821 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = _1009;
    if (_931)
    {
        float _1021 = _991 + (-1.0);
        _985 = _1021;
    }
    float _1023 = _985;
    float _1025 = _1023;
    if (_931)
    {
        float _1027 = _953 * _1009;
        _1005 = _1027;
    }
    float _1029 = _1005;
    if (!_931)
    {
        _955 = _997;
    }
    float _1031 = _955;
    float _1033 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1035 = _1031;
    if (_931)
    {
        float _1037 = _1023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1037;
    }
    float _1039 = _943;
    float _1041 = _1039;
    if (_931)
    {
        float _1043 = _919 * _1029;
        _945 = _1043;
    }
    float _1045 = _945;
    if (!_931)
    {
        _1019 = _921;
    }
    float _1047 = _1019;
    float _1049 = _1047;
    if (_931)
    {
        float _1051 = _921 * _1029;
        _1049 = _1051;
    }
    float _1053 = _1049;
    if (!_931)
    {
        _1025 = _923;
    }
    float _1055 = _1025;
    float _1057 = _1055;
    if (_931)
    {
        float _1059 = fma(_997, _991, _1039);
        _1035 = _1059;
    }
    float _1061 = _1035;
    if (_931)
    {
        float _1063 = _1045 * _1045;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (!_931)
    {
        _1041 = _925;
    }
    float _1067 = _1041;
    float _1069 = _1067;
    if (_931)
    {
        float _1071 = _1053 * _1053;
        _1069 = _1071;
    }
    float _1073 = _1069;
    float _1075 = -_1015;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1061, _1061, _1065);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1085 = _1079 + _1073;
    float _1087 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1089 = _821 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = rsqrt(_1085);
    float _1095 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1087);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1099 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1101 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1103 = abs(_1077);
    float _1105 = log2(_1103);
    float _1107 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1033);
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _905, 1.0);
    float _1121 = _1093 * _1045;
    float _1123 = _1093 * _1061;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1127 = _1093 * _1053;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = log2(_1119);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1135 = -_1129;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1135);
    float _1139 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1141 = -_1127;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1137);
    float _1145 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1133);
    float _1149 = exp2(_1139);
    float _1151 = fma(_1143, -0.5, 0.5);
    float _1153 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1155 = fma(_1143, 0.5, 0.5);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1159 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1153);
    float _1161 = _1123 + 1.0;
    float _1163 = 1.0 / _1147;
    float _1165 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1169 = fma(_1155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = _1131 * 0.693147182464599609375;
    float _1173 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = fma(_1155, _1169, -0.212114393711090087890625);
    float _1179 = sqrt(_1151);
    float _1181 = -_1123;
    float _1183 = fma(_1149, _1161, _1181);
    float _1185 = fma(_1155, _1177, 1.570728778839111328125);
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = _1173 * _1163;
    float _1191 = _1175 * _1163;
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1195 = fma(_1189, 0.5, 0.5);
    float _1197 = fma(_1191, -0.5, 0.5);
    float _1199 = _1179 * 0.636619746685028076171875;
    float3 _3139 = float3(_1195, _1197, _1193);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).x;
    float3 _3150 = float3(_1195, _1197, _1193);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3150, float3(0.0), isnan(_3150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3150, float3(0.0), isnan(_3150)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float _1214 = -_1185;
    float _1216 = fma(_1199, _1214, 1.0);
    float2 _3172 = float2(_1216, _1187);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3172, float2(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3172, float2(0.0), isnan(_3172)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1230 = _145 > 0.5;
    float _1232 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = -_435;
    float _1240 = _1238 + 1.0;
    float _1242 = -_581;
    int _1244 = _1230 ? as_type<int>(_1242) : as_type<int>(_581);
    float _1246 = -_397;
    float _1248 = _1246 + 1.0;
    bool _1250 = _147 > 0.5;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1254 = !_1236;
    float _1256 = _1254 ? _581 : as_type<float>(_1244);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1260 = _1258 != 0;
    float _1262 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1264 = -_575;
    int _1266 = _1250 ? as_type<int>(_1264) : as_type<int>(_575);
    float _1268 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1232);
    float _1270 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1256 + 0.5;
    float _1274 = exp2(_1262);
    bool _1276 = !_1260;
    float _1278 = _1276 ? _575 : as_type<float>(_1266);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = fma(_1270, _1272, _317);
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1286 = _1278 + (-0.5);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1292 = -_1284;
    float _1294 = -_427;
    float _1296 = fma(_1292, _1286, _1294);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = -_1274;
    float _1306 = _1304 + 1.0;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1312 = fma(_1278, _1240, _1296);
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1316 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1318 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_58.x = _1302;
    out.m_58.y = _1308;
    out.m_58.z = _1298;
    out.m_58.w = _1300;
    bool _1320 = _891 > 0.0;
    bool _1322 = isnan(_891);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1248;
    float _1332 = fma(_1256, _1330, _1282);
    float _1334 = _1318 + _1147;
    out.m_60.x = _1332;
    out.m_60.y = _1312;
    float _1336 = _1334 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _1147;
    float _1338 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_62.z = _1336;
    out.m_62.w = _1147;
    out.m_45.x = _1338;
    float _1340 = _1314 * _1201;
    float _1342 = -_1314;
    float _1344 = _1342 + 1.0;
    float _1346 = _1212 * _1340;
    float _1348 = _1212 * _1344;
    float _1350 = _1226 * _1340;
    float _1352 = fma(_1222, _1346, _1206);
    float _1354 = fma(_1224, _1346, _1208);
    float _1356 = fma(_1212, _1350, _1210);
    out.m_64.x = _1352;
    out.m_64.y = _1354;
    out.m_64.z = _1356;
    out.m_64.w = _1348;
    if (_1328)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1358;
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
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    float _91 = as_type<float>(_83);
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _89;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _93 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1415 = as_type<float>(_99);
        out.gl_Position.z = _1415;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = _117;
    if (_113)
    {
        float _121 = float(_83);
        _91 = _121;
    }
    float _123 = _91;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _101 = as_type<int>(_135);
    }
    int _137 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1485 = as_type<float>(_137);
        out.gl_Position.z = _1485;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.z;
    float _141 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _143 = log2(_141);
    float _145 = in.m_49.x;
    float _147 = in.m_49.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = 0.0;
    float _167 = _159;
    if (!_157)
    {
        float _169 = _159 * _159;
        float _171 = _169 * 0.5;
        _165 = _171;
    }
    float _173 = _165;
    float _175 = _173;
    if (!_157)
    {
        float _177 = _173 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = _139 * 2.0;
    float _183 = _145 * 2.0;
    float _185 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _187 = floor(_181);
    float _189 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _191 = -_161;
    float _193 = fma(_185, 2.0, _191);
    float _195 = fma(_189, -2.0, _163);
    float _197 = floor(_183);
    bool _199 = _187 > 0.0;
    bool _201 = _187 >= 0.0;
    bool _203 = isnan(_187);
    bool _205 = _201 || _203;
    bool _207 = isnan(0.0);
    bool _209 = _205 || _207;
    bool _211 = !_157;
    float _213 = _179;
    if (!_211)
    {
        float _215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = log2(_215);
        float _219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _221 = _219 + 1.0;
        float _223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = _159 * _217;
        float _227 = 1.0 / _221;
        float _229 = _223 * 0.693147182464599609375;
        float _231 = exp2(_225);
        float _233 = 1.0 / _229;
        float _235 = _231 + (-1.0);
        float _237 = -_235;
        float _239 = fma(_237, _233, _159);
        float _241 = _239 * _227;
        float _243 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _243;
    }
    float _245 = _213;
    bool _247 = !_157;
    if (!_247)
    {
        float _249 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = log2(_249);
        float _253 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _255 = _253 + 1.0;
        float _257 = 1.0 / _255;
        float _259 = _159 * _251;
        float _261 = exp2(_259);
        float _263 = -_261;
        float _265 = _263 + 1.0;
        float _267 = _265 * _257;
        _167 = _267;
    }
    float _269 = _167;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _277 = _275 != 0;
    int _279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _281 = _279 != 0;
    float _283 = _145 + _147;
    float _285 = _147 * 2.0;
    int _287 = _209 ? 0 : 1;
    float _289 = _283 + (-1.0);
    bool _291 = !_273;
    int _293 = _291 ? 0 : 1;
    float _295 = _143 * _117;
    bool _297 = _197 > 0.0;
    float _299 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _301 = _197 >= 0.0;
    bool _303 = isnan(_197);
    bool _305 = _301 || _303;
    bool _307 = isnan(0.0);
    bool _309 = _305 || _307;
    float _311 = floor(_285);
    int _313 = abs(_293);
    float _315 = -_117;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[76].x, _193);
    int _319 = ~_287;
    int _321 = _319 + 1;
    int _323 = _321 + 1;
    float _325 = as_type<float>(int(gl_VertexIndex));
    int _327 = _323;
    if (!_199)
    {
        int _329 = ~_287;
        int _331 = _329 + 1;
        _327 = _331;
    }
    int _333 = _327;
    float _335 = exp2(_295);
    float _337 = float(_333);
    float _339 = in.m_54.y;
    float _341 = float(_313);
    int _343 = _309 ? 0 : 1;
    float _345 = in.m_54.w;
    float _347 = _341 * _337;
    float _349 = in.m_54.x;
    int _351 = ~_343;
    int _353 = _351 + 1;
    int _355 = _353 + 1;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _359 = _355;
    if (!_297)
    {
        int _361 = ~_343;
        int _363 = _361 + 1;
        _359 = _363;
    }
    int _365 = _359;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _369 = 1.0 + _367;
    float _371 = in.m_56.x;
    float _373 = in.m_56.y;
    float _375 = in.m_56.z;
    bool _377 = _311 > 0.0;
    float _379 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _381 = 1.0 / _369;
    bool _383 = _311 >= 0.0;
    bool _385 = isnan(_311);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    float _393 = -_335;
    float _395 = _393 + 1.0;
    float _397 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _379);
    bool _399 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _401 = isnan(1.0);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _407 = _403 || _405;
    bool _409 = !_277;
    int _411 = _409 ? 0 : 1;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _415 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _417 = isnan(0.0);
    bool _419 = _415 || _417;
    bool _421 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _423 = _419 || _421;
    int _425 = abs(_411);
    float _427 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _195);
    float _429 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _413);
    float _431 = _423 ? _395 : 0.0;
    float _433 = float(_365);
    float _435 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _429);
    float _437 = float(_425);
    if (_407)
    {
        float _439 = _431 * _381;
        _119 = _439;
    }
    float _441 = _119;
    float _443 = _347 * (-2.0);
    bool _445 = !_281;
    int _447 = _445 ? 0 : 1;
    int _449 = _391 ? 0 : 1;
    float _451 = fma(_299, _443, _299);
    float _453 = fma(_443, _371, _371);
    float _455 = _147 + _139;
    float _457 = _437 * _433;
    int _459 = abs(_447);
    float _461 = _455 + (-1.0);
    int _463 = ~_449;
    int _465 = _463 + 1;
    int _467 = _465 + 1;
    float _469 = _145 + (-0.5);
    float _471 = _457 * (-2.0);
    float _473 = fma(_461, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _475 = _467;
    if (!_377)
    {
        int _477 = ~_449;
        int _479 = _477 + 1;
        _475 = _479;
    }
    int _481 = _475;
    float _483 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _453);
    float _485 = float(_459);
    float _487 = fma(_473, _471, _473);
    float _489 = float(_481);
    float _491 = fma(_471, _373, _373);
    float _493 = _147 + (-0.5);
    float _495 = fma(_451, _441, _483);
    float _497 = _145 + _139;
    float _499 = _485 * _489;
    float _501 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[196].y, _491);
    float _503 = _495 * 0.15915493667125701904296875;
    float _505 = in.m_47.x;
    float _507 = in.m_47.y;
    float _509 = in.m_47.z;
    float _511 = _497 + (-1.0);
    float _513 = fma(_487, _441, _501);
    float _515 = _499 * (-2.0);
    float _517 = _139 + (-0.5);
    float _519 = fma(_511, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_515, _375, _375);
    float _525 = _503 * 6.283185482025146484375;
    float _527 = sin(_525);
    float _529 = in.m_42.x;
    float _531 = in.m_42.y;
    float _533 = in.m_42.z;
    float _535 = fma(_519, _515, _519);
    float _537 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[196].z, _523);
    float _539 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _541 = as_type<int>(_325) & 1;
    bool _543 = _541 != 0;
    int _545 = as_type<int>(_325) & 2;
    bool _547 = _545 != 0;
    float _549 = fma(_535, _441, _537);
    float _551 = _503 * 6.283185482025146484375;
    float _553 = cos(_551);
    float _555 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _557 = fma(_269, _505, _539);
    float _559 = _549 * 0.15915493667125701904296875;
    float _561 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _563 = _521 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = _339 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = fma(_269, _507, _561);
    float _571 = fma(_269, _509, _555);
    bool _573 = !_547;
    float _575 = _573 ? (-0.5) : 0.5;
    float _577 = fma(_557, _345, _529);
    bool _579 = !_543;
    float _581 = _579 ? (-0.5) : 0.5;
    float _583 = _521 * 6.283185482025146484375;
    float _585 = cos(_583);
    float _587 = _349 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = _567 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _591 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _575);
    float _593 = fma(_569, _345, _531);
    float _595 = _587 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _597 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _581);
    float _599 = _589 * _591;
    float _601 = _559 * 6.283185482025146484375;
    float _603 = cos(_601);
    float _605 = fma(_571, _345, _533);
    float _607 = _595 * _597;
    float _609 = _553 * _565;
    float _611 = _527 * _565;
    bool _613 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _615 = isnan(0.5);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _621 = _617 || _619;
    float _623 = _559 * 6.283185482025146484375;
    float _625 = sin(_623);
    float _627 = _527 * _585;
    float _629 = _603 * _599;
    float _631 = _565 * _603;
    float _633 = _585 * _603;
    float _635 = -_599;
    float _637 = _625 * _635;
    float _639 = _553 * _585;
    float _641 = -_609;
    float _643 = fma(_625, _627, _641);
    float _645 = -_627;
    float _647 = fma(_625, _609, _645);
    float _649 = _553 * _629;
    float _651 = fma(_625, _639, _611);
    float _653 = fma(_633, _607, _637);
    float _655 = _527 * _629;
    float _657 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _659 = fma(_651, _607, _649);
    float _661 = fma(_625, _611, _639);
    float _663 = fma(_643, _607, _655);
    float _665 = _593 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _667 = fma(_647, _657, _659);
    float _669 = fma(_631, _657, _653);
    float _671 = fma(_661, _657, _663);
    float _673 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[6].x, _665);
    float _675 = _593 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _677 = _667 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _679 = _667 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _681 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[6].z, _673);
    float _683 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[4].x, _675);
    float _685 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[10].x, _677);
    float _687 = _593 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _689 = _681 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _691 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[4].z, _683);
    float _693 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[8].x, _679);
    float _695 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[10].z, _685);
    float _697 = fma(_577, (*spvDescriptorSet0.vp_c10)._m0[5].x, _687);
    float _699 = _691 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _701 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[8].z, _693);
    float _703 = _689 + _695;
    float _705 = fma(_605, (*spvDescriptorSet0.vp_c10)._m0[5].z, _697);
    float _707 = _667 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _709 = _699 + _701;
    float _711 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _713 = _703 + _711;
    float _715 = _705 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _717 = fma(_669, (*spvDescriptorSet0.vp_c10)._m0[9].x, _707);
    float _719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _721 = _709 + _719;
    float _723 = _713 * _713;
    float _725 = _715 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _727 = fma(_671, (*spvDescriptorSet0.vp_c10)._m0[9].z, _717);
    float _729 = fma(_721, _721, _723);
    float _731 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].x, _725);
    float _733 = sqrt(_729);
    float _735 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[11].z, _731);
    float _737 = _715 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _739 = _715 + _727;
    float _741 = _735 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _743 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].x, _737);
    float _745 = 1.0 / _741;
    float _747 = fma(_689, (*spvDescriptorSet0.vp_c8)._m0[10].z, _743);
    float _749 = _689;
    float _751 = _707;
    float _753 = _709;
    float _755 = _727;
    float _757 = _713;
    if (_621)
    {
        _749 = 1.0;
    }
    float _759 = _749;
    float _761 = _747 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _763 = _733 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _765 = _761 + _741;
    float _767 = _765 * _745;
    float _769 = _767 * 0.5;
    float _771 = _765;
    float _773 = _759;
    if (!_763)
    {
        _771 = _703;
    }
    float _775 = _771;
    float _777 = _775;
    if (!_763)
    {
        _751 = _739;
    }
    float _779 = _751;
    bool _781 = !_763;
    float _783 = _779;
    if (!_781)
    {
        float _785 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _787 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _789 = _733 + _787;
        float _791 = rsqrt(_729);
        float _793 = _789 * _785;
        float _795 = _739 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _797 = _793 * 0.15915493667125701904296875;
        float _799 = _797 * 6.283185482025146484375;
        float _801 = cos(_799);
        float _803 = _797 * 6.283185482025146484375;
        float _805 = sin(_803);
        float _807 = _801 + (-1.0);
        float _809 = fma(_805, _795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _811 = _807 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _813 = _791 * _809;
        float _815 = fma(_739, _801, _811);
        float _817 = fma(_721, _813, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _819 = fma(_713, _813, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _783 = _815;
        _753 = _817;
        _777 = _819;
    }
    float _821 = _783;
    float _823 = _753;
    float _825 = _777;
    if (!_621)
    {
        float _827 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _829 = _827 * 0.15915493667125701904296875;
        float _831 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _835 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[30].w, _833);
        float _837 = _829 * 6.283185482025146484375;
        float _839 = cos(_837);
        float _841 = _831 * 0.15915493667125701904296875;
        float _843 = _829 * 6.283185482025146484375;
        float _845 = sin(_843);
        float _847 = 1.0 / _839;
        float _849 = _841 * 6.283185482025146484375;
        float _851 = cos(_849);
        float _853 = _845 * _847;
        float _855 = _841 * 6.283185482025146484375;
        float _857 = sin(_855);
        float _859 = _851 * _853;
        float _861 = 1.0 / _835;
        float _863 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _865 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _863;
        float _867 = 1.0 / _859;
        float _869 = 1.0 / _865;
        float _871 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _873 = _861 * _871;
        float _875 = _857 * _867;
        float _877 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _879 = fma(_875, _873, _877);
        float _881 = _879 * _869;
        float _883 = precise::clamp(_881, 0.0, 1.0);
        float _885 = -_883;
        float _887 = _885 + 1.0;
        _755 = _867;
        _773 = _887;
    }
    float _889 = _755;
    float _891 = _773;
    float _893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _895 = _821 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _899 = _823 + _897;
    float _901 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _903 = _825 + _901;
    float _905 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _907 = _895 * _895;
    float _909 = fma(_899, _899, _907);
    float _911 = fma(_903, _903, _909);
    float _913 = rsqrt(_911);
    float _915 = sqrt(_911);
    float _917 = _913 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _919 = _899 * _917;
    float _921 = _903 * _917;
    float _923 = _919 * _919;
    float _925 = _921 * _921;
    float _927 = _923 + _925;
    float _929 = sqrt(_927);
    bool _931 = _929 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _933 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _935 = _929 + _933;
    float _937 = _903;
    float _939 = _907;
    float _941 = _935;
    float _943 = _895;
    float _945 = _919;
    if (_931)
    {
        float _947 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _937 = _947;
    }
    float _949 = _937;
    if (_931)
    {
        float _951 = rsqrt(_927);
        _939 = _951;
    }
    float _953 = _939;
    float _955 = _953;
    if (_931)
    {
        float _957 = _935 * _949;
        _941 = _957;
    }
    float _959 = _941;
    float _961 = _821 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_931)
    {
        float _963 = _959 * 0.15915493667125701904296875;
        _757 = _963;
    }
    float _965 = _757;
    float _967 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[3].x, _961);
    float _969 = _913;
    if (_931)
    {
        float _971 = _965 * 6.283185482025146484375;
        float _973 = sin(_971);
        _969 = _973;
    }
    float _975 = _969;
    float _977 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _979 = precise::max(0.0, _977);
    float _981 = _889;
    float _983 = _979;
    float _985 = _977;
    if (_931)
    {
        float _987 = _965 * 6.283185482025146484375;
        float _989 = cos(_987);
        _981 = _989;
    }
    float _991 = _981;
    float _993 = -_917;
    float _995 = -_979;
    float _997 = fma(_895, _993, _995);
    if (_931)
    {
        float _999 = _997 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _983 = _999;
    }
    float _1001 = _983;
    float _1003 = _975;
    float _1005 = _1001;
    if (_931)
    {
        float _1007 = fma(_975, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1003 = _1007;
    }
    float _1009 = _1003;
    float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1013 = fma(_915, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1011);
    float _1015 = precise::clamp(_1013, 0.0, 1.0);
    float _1017 = _821 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1019 = _1009;
    if (_931)
    {
        float _1021 = _991 + (-1.0);
        _985 = _1021;
    }
    float _1023 = _985;
    float _1025 = _1023;
    if (_931)
    {
        float _1027 = _953 * _1009;
        _1005 = _1027;
    }
    float _1029 = _1005;
    if (!_931)
    {
        _955 = _997;
    }
    float _1031 = _955;
    float _1033 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1017);
    float _1035 = _1031;
    if (_931)
    {
        float _1037 = _1023 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _943 = _1037;
    }
    float _1039 = _943;
    float _1041 = _1039;
    if (_931)
    {
        float _1043 = _919 * _1029;
        _945 = _1043;
    }
    float _1045 = _945;
    if (!_931)
    {
        _1019 = _921;
    }
    float _1047 = _1019;
    float _1049 = _1047;
    if (_931)
    {
        float _1051 = _921 * _1029;
        _1049 = _1051;
    }
    float _1053 = _1049;
    if (!_931)
    {
        _1025 = _923;
    }
    float _1055 = _1025;
    float _1057 = _1055;
    if (_931)
    {
        float _1059 = fma(_997, _991, _1039);
        _1035 = _1059;
    }
    float _1061 = _1035;
    if (_931)
    {
        float _1063 = _1045 * _1045;
        _1057 = _1063;
    }
    float _1065 = _1057;
    if (!_931)
    {
        _1041 = _925;
    }
    float _1067 = _1041;
    float _1069 = _1067;
    if (_931)
    {
        float _1071 = _1053 * _1053;
        _1069 = _1071;
    }
    float _1073 = _1069;
    float _1075 = -_1015;
    float _1077 = _1075 + 1.0;
    float _1079 = fma(_1061, _1061, _1065);
    float _1081 = _821 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1083 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[3].z, _967);
    float _1085 = _1079 + _1073;
    float _1087 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1081);
    float _1089 = _821 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1091 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1093 = rsqrt(_1085);
    float _1095 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1087);
    float _1097 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1089);
    float _1099 = _1095 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1101 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1097);
    float _1103 = abs(_1077);
    float _1105 = log2(_1103);
    float _1107 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1033);
    float _1109 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1111 = _1099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1113 = _1107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1115 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1117 = -_1111;
    float _1119 = fma(_1117, _905, 1.0);
    float _1121 = _1093 * _1045;
    float _1123 = _1093 * _1061;
    float _1125 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1115);
    float _1127 = _1093 * _1053;
    float _1129 = _1121 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1131 = log2(_1119);
    float _1133 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1125);
    float _1135 = -_1129;
    float _1137 = fma(_1123, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1135);
    float _1139 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1141 = -_1127;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1137);
    float _1145 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1147 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1133);
    float _1149 = exp2(_1139);
    float _1151 = fma(_1143, -0.5, 0.5);
    float _1153 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1155 = fma(_1143, 0.5, 0.5);
    float _1157 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1145);
    float _1159 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1153);
    float _1161 = _1123 + 1.0;
    float _1163 = 1.0 / _1147;
    float _1165 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1157);
    float _1167 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1159);
    float _1169 = fma(_1155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1171 = _1131 * 0.693147182464599609375;
    float _1173 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1165);
    float _1175 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1167);
    float _1177 = fma(_1155, _1169, -0.212114393711090087890625);
    float _1179 = sqrt(_1151);
    float _1181 = -_1123;
    float _1183 = fma(_1149, _1161, _1181);
    float _1185 = fma(_1155, _1177, 1.570728778839111328125);
    float _1187 = fma(_1183, 0.5, 0.5);
    float _1189 = _1173 * _1163;
    float _1191 = _1175 * _1163;
    float _1193 = _1171 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1195 = fma(_1189, 0.5, 0.5);
    float _1197 = fma(_1191, -0.5, 0.5);
    float _1199 = _1179 * 0.636619746685028076171875;
    float3 _3139 = float3(_1195, _1197, _1193);
    float _1201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3139, float3(0.0), isnan(_3139)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3139, float3(0.0), isnan(_3139)), level(0.0)).x;
    float3 _3150 = float3(_1195, _1197, _1193);
    float4 _1204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3150, float3(0.0), isnan(_3150)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3150, float3(0.0), isnan(_3150)), level(0.0)).xyzw;
    float _1206 = _1204.x;
    float _1208 = _1204.y;
    float _1210 = _1204.z;
    float _1212 = _1204.w;
    float _1214 = -_1185;
    float _1216 = fma(_1199, _1214, 1.0);
    float2 _3172 = float2(_1216, _1187);
    float3 _1220 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3172, float2(0.0), isnan(_3172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3172, float2(0.0), isnan(_3172)), level(0.0)).xyz;
    float _1222 = _1220.x;
    float _1224 = _1220.y;
    float _1226 = _1220.z;
    float _1228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1230 = _145 > 0.5;
    float _1232 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1236 = _1234 != 0;
    float _1238 = -_435;
    float _1240 = _1238 + 1.0;
    float _1242 = -_581;
    int _1244 = _1230 ? as_type<int>(_1242) : as_type<int>(_581);
    float _1246 = -_397;
    float _1248 = _1246 + 1.0;
    bool _1250 = _147 > 0.5;
    float _1252 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1254 = !_1236;
    float _1256 = _1254 ? _581 : as_type<float>(_1244);
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1260 = _1258 != 0;
    float _1262 = _1105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1264 = -_575;
    int _1266 = _1250 ? as_type<int>(_1264) : as_type<int>(_575);
    float _1268 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1232);
    float _1270 = _1228 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = _1256 + 0.5;
    float _1274 = exp2(_1262);
    bool _1276 = !_1260;
    float _1278 = _1276 ? _575 : as_type<float>(_1266);
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = fma(_1270, _1272, _317);
    float _1284 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1286 = _1278 + (-0.5);
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1292 = -_1284;
    float _1294 = -_427;
    float _1296 = fma(_1292, _1286, _1294);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1302 = _1288 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = -_1274;
    float _1306 = _1304 + 1.0;
    float _1308 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1310 = fma(_1099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1268);
    float _1312 = fma(_1278, _1240, _1296);
    float _1314 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1316 = _891 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1318 = fma(_1091, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1310);
    out.m_58.x = _1302;
    out.m_58.y = _1308;
    out.m_58.z = _1298;
    out.m_58.w = _1300;
    bool _1320 = _891 > 0.0;
    bool _1322 = isnan(_891);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan(0.0);
    bool _1328 = _1324 || _1326;
    float _1330 = -_1248;
    float _1332 = fma(_1256, _1330, _1282);
    float _1334 = _1318 + _1147;
    out.m_60.x = _1332;
    out.m_60.y = _1312;
    float _1336 = _1334 * 0.5;
    out.gl_Position.x = _1173;
    out.gl_Position.y = _1175;
    out.gl_Position.z = _1318;
    out.gl_Position.w = _1147;
    float _1338 = _1316 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_62.z = _1336;
    out.m_62.w = _1147;
    out.m_45.x = _1338;
    float _1340 = _1314 * _1201;
    float _1342 = -_1314;
    float _1344 = _1342 + 1.0;
    float _1346 = _1212 * _1340;
    float _1348 = _1212 * _1344;
    float _1350 = _1226 * _1340;
    float _1352 = fma(_1222, _1346, _1206);
    float _1354 = fma(_1224, _1346, _1208);
    float _1356 = fma(_1212, _1350, _1210);
    out.m_64.x = _1352;
    out.m_64.y = _1354;
    out.m_64.z = _1356;
    out.m_64.w = _1348;
    if (_1328)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1358 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1358;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

