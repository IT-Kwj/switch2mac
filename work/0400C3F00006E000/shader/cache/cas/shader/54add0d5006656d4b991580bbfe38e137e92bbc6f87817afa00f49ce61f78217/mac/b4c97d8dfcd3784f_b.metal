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
    float4 m_60 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_56 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
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
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_99);
        out.gl_Position.z = _2077;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2145 = as_type<float>(_135);
        out.gl_Position.z = _2145;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    if (!_155)
    {
        float _191 = _145 * _145;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_155)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_175;
    float _205 = _165 + _203;
    bool _207 = !_155;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _145 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _145);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
    }
    float _243 = _209;
    bool _245 = !_155;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _189 = _265;
    }
    float _267 = _189;
    float _269 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_267, _167, _269);
    bool _277 = _205 < 0.5;
    float _279 = float(_277);
    float _281 = fma(_267, _169, _271);
    float _283 = fma(_267, _171, _273);
    float _285 = fma(_185, 0.5, 0.5);
    float _287 = _273;
    if (!_155)
    {
        float _289 = _117 * _117;
        float _291 = _289 * 0.5;
        _287 = _291;
    }
    float _293 = _287;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_279;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_285;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_275, _143, _157);
    float _309 = fma(_281, _143, _159);
    float _311 = fma(_283, _143, _161);
    float _313 = _293;
    if (!_155)
    {
        float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (!_155)
    {
        _211 = _117;
    }
    float _321 = _211;
    bool _323 = !_181;
    int _325 = _323 ? 0 : 1;
    bool _327 = !_155;
    float _329 = _321;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _117 * _333;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = 1.0 / _341;
        float _345 = _335 * 0.693147182464599609375;
        float _347 = exp2(_337);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _117);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _319 = _359;
    }
    float _361 = _319;
    bool _363 = !_155;
    if (!_363)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _117 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _329 = _383;
    }
    float _385 = _329;
    float _387 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _395 = _393 != 0;
    float _397 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_385, _167, _387);
    int _403 = abs(_325);
    float _405 = fma(_385, _169, _397);
    bool _407 = !_391;
    int _409 = _407 ? 0 : 1;
    float _411 = fma(_385, _171, _399);
    bool _413 = !_395;
    int _415 = _413 ? 0 : 1;
    float _417 = -_401;
    float _419 = _275 + _417;
    int _421 = abs(_409);
    float _423 = -_405;
    float _425 = _281 + _423;
    int _427 = abs(_415);
    float _429 = -_411;
    float _431 = _283 + _429;
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = float(_421);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _447 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = float(_403);
    float _451 = abs(_297);
    float _453 = _441 * _451;
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, _305, _453);
    float _461 = float(_427);
    float _463 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _465 = abs(_301);
    float _467 = fma(_461, _465, _459);
    bool _469 = !_433;
    float _471 = _463;
    float _473 = _455;
    float _475 = _457;
    float _477 = _457;
    float _493;
    if (!_469)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _309 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _747 = _137 > 0.5;
    float _749 = in.m_51.x;
    float _751 = in.m_51.y;
    float _753 = _309 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _759;
    float _763 = in.m_49.y;
    float _765 = _309 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _767 = 1.0 / _757;
    float _769 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].x, _745);
    float _771 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _773 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].x, _765);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _777 = _741 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _741 + _779;
    float _783 = 1.0 / _761;
    bool _785 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _787 = isnan(_741);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_743) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>(_743) & 2;
    bool _803 = _801 != 0;
    float _805 = _777 * _767;
    float _807 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    float _809 = _711 * _749;
    float _811 = _713 * _751;
    bool _813 = !_803;
    float _815 = _813 ? (-0.5) : 0.5;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _467 * _809;
    float _821 = _467 * _811;
    bool _823 = _763 > 0.5;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _815);
    bool _827 = !_799;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _835 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _829);
    float _839 = _831 * _825;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _843 = _841 != 0;
    float _845 = _781 * _783;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _849 = _847 != 0;
    float _851 = _833 * _837;
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _873 = fma(_859, _845, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _875 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _877 = fma(_867, _845, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _869);
    float _881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _883 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _807 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _879);
    float _889 = _881 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _895 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _897 = isnan(_741);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _887 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _909 = _883 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _915 = fma(_893, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _917 = _885 + _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _921 = _909 + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    float _927 = fma(_913, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _917 + _929;
    float _933 = _921 * _921;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _939 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _941 = isnan(_741);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _795 * _925;
    float _953 = fma(_931, _931, _933);
    float _955 = -_795;
    float _957 = _955 + 1.0;
    float _959 = -_829;
    int _961 = _747 ? as_type<int>(_959) : as_type<int>(_829);
    float _963 = fma(_937, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _965 = sqrt(_953);
    float _967 = -_815;
    int _969 = _823 ? as_type<int>(_967) : as_type<int>(_815);
    float _971 = _949 * _957;
    bool _973 = !_843;
    float _975 = _973 ? _829 : as_type<float>(_961);
    float _977 = -_949;
    float _979 = _977 + 1.0;
    bool _981 = !_849;
    float _983 = _981 ? _815 : as_type<float>(_969);
    float _985 = _873 * _971;
    float _987 = _875 * _971;
    float _989 = _877 * _971;
    float _991 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].x, _985);
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].z, _989);
    float _999 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1003 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1005 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = fma(_963, _951, _997);
    float _1009 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1011 = fma(_915, _951, _993);
    float _1013 = fma(_927, _951, _995);
    float _1015 = _975 + 0.5;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1021 = -_983;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1011);
    float _1027 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1013);
    float _1029 = _1003 + _1019;
    float _1031 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1007);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1037 = _839;
    float _1039 = _1013;
    float _1041 = _993;
    if (!_1005)
    {
        _1037 = _917;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (!_1005)
    {
        _1039 = _909;
    }
    float _1047 = _1039;
    float _1049 = _1047;
    if (!_1005)
    {
        _1041 = _1029;
    }
    float _1051 = _1041;
    bool _1053 = !_1005;
    float _1055 = _1051;
    if (!_1053)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1061 = _965 + _1059;
        float _1063 = rsqrt(_953);
        float _1065 = _1061 * _1057;
        float _1067 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = _1065 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = _1069 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 + (-1.0);
        float _1081 = fma(_1077, _1067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = _1063 * _1081;
        float _1087 = fma(_1029, _1073, _1083);
        float _1089 = fma(_931, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_921, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1087;
        _1045 = _1089;
        _1049 = _1091;
    }
    float _1093 = _1055;
    float _1095 = _1045;
    float _1097 = _1049;
    float _1099 = -_1003;
    float _1101 = _1099 + _1093;
    float _1103 = _1033 * _1001;
    float _1105 = -_885;
    float _1107 = _1105 + _1095;
    float _1109 = _1035 * _1017;
    float _1111 = _1101 * _1101;
    float _1113 = -_883;
    float _1115 = _1113 + _1097;
    float _1117 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1119 = fma(_1107, _1107, _1111);
    float _1121 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1123 = fma(_1115, _1115, _1119);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1129 = sqrt(_1123);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1103;
    out.m_56.y = _1109;
    out.m_58.x = _1135;
    out.m_58.y = _1139;
    out.m_58.z = _1141;
    bool _1149 = _1129 > 0.0;
    out.m_60.x = _1143;
    out.m_60.y = _1145;
    out.m_60.z = _1147;
    out.m_60.w = _1137;
    bool _1151 = !_1149;
    float _1153 = _1145;
    float _1155 = _1139;
    float _1157 = _1135;
    float _1159 = _1093;
    float _1161 = _1097;
    float _1163 = _1095;
    float _1165 = _1139;
    if (!_1151)
    {
        bool _1167 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1169 = _1137;
        if (_1167)
        {
            float _1171 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1169 = _1171;
        }
        float _1173 = _1169;
        if (_1167)
        {
            float _1175 = _455 * _1173;
            _1153 = _1175;
        }
        float _1177 = _1153;
        float _1179 = _1177;
        if (_1167)
        {
            float _1181 = _463 * _1173;
            _1155 = _1181;
        }
        float _1183 = _1155;
        float _1185 = _1183;
        if (_1167)
        {
            float _1187 = _457 * _1173;
            _1157 = _1187;
        }
        float _1189 = _1157;
        float _1191 = _1189;
        float _1193 = _1189;
        if (!_1167)
        {
            float _1195 = _117 + 1.0;
            float _1197 = _1195;
            if (!_155)
            {
                float _1199 = _1195 * _1195;
                float _1201 = _1199 * 0.5;
                _1191 = _1201;
            }
            float _1203 = _1191;
            float _1205 = _1203;
            if (!_155)
            {
                float _1207 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1205 = _1207;
            }
            float _1209 = _1205;
            bool _1211 = !_155;
            float _1213 = _1209;
            if (!_1211)
            {
                float _1215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1217 = log2(_1215);
                float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1221 = _1219 + 1.0;
                float _1223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1225 = _1217 * _1195;
                float _1227 = 1.0 / _1221;
                float _1229 = _1223 * 0.693147182464599609375;
                float _1231 = exp2(_1225);
                float _1233 = 1.0 / _1229;
                float _1235 = _1231 + (-1.0);
                float _1237 = -_1235;
                float _1239 = fma(_1237, _1233, _1195);
                float _1241 = _1239 * _1227;
                float _1243 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1213 = _1243;
            }
            float _1245 = _1213;
            float _1247 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1251 = !_155;
            if (!_1251)
            {
                float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1255 = log2(_1253);
                float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1259 = _1257 + 1.0;
                float _1261 = 1.0 / _1259;
                float _1263 = _1255 * _1195;
                float _1265 = exp2(_1263);
                float _1267 = -_1265;
                float _1269 = _1267 + 1.0;
                float _1271 = _1269 * _1261;
                _1197 = _1271;
            }
            float _1273 = _1197;
            float _1275 = fma(_1273, _169, _1249);
            float _1277 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1279 = fma(_1273, _167, _1247);
            float _1281 = -_405;
            float _1283 = _1281 + _1275;
            float _1285 = fma(_1273, _171, _1277);
            float _1287 = -_401;
            float _1289 = _1287 + _1279;
            float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1293 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1295 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1297 = -_411;
            float _1299 = _1297 + _1285;
            float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1291);
            float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1293);
            float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1295);
            float _1307 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1301);
            float _1309 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1303);
            float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1305);
            _471 = _1309;
            _473 = _1307;
            _475 = _1311;
            _1179 = _1307;
            _1185 = _1309;
            _1193 = _1311;
        }
        float _1313 = _471;
        float _1315 = _473;
        float _1317 = _475;
        float _1319 = _1179;
        float _1321 = _1185;
        float _1323 = _1193;
        float _1325 = _1313 * _1313;
        float _1327 = rsqrt(_1123);
        float _1329 = fma(_1315, _1315, _1325);
        float _1331 = fma(_1317, _1317, _1329);
        float _1333 = sqrt(_1331);
        float _1335 = _1107 * _1327;
        float _1337 = _1101 * _1327;
        float _1339 = _1115 * _1327;
        bool _1341 = _1333 > 0.0;
        bool _1343 = !_1341;
        _1165 = _1321;
        _477 = _1317;
        if (!_1343)
        {
            float _1345 = rsqrt(_1331);
            float _1347 = _1345 * _1313;
            float _1349 = _1345 * _1315;
            float _1351 = _1345 * _1317;
            float _1353 = _1337 * _1347;
            float _1355 = fma(_1335, _1349, _1353);
            float _1357 = fma(_1339, _1351, _1355);
            float _1359 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1361 = fma(_1319, _1359, _1095);
            float _1363 = fma(_1321, _1359, _1093);
            float _1365 = fma(_1323, _1359, _1097);
            _1159 = _1363;
            _1161 = _1365;
            _1163 = _1361;
        }
    }
    float _1367 = _1159;
    float _1369 = _1161;
    float _1371 = _1163;
    float _1373 = _1165;
    float _1375 = _477;
    float _1377 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1379 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1381 = isnan(0.5);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    float _1391 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1393 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1395 = isnan(0.5);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    float _1403 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1409 = 1.0 / _1405;
    float _1411 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1407);
    float _1413 = _1373;
    float _1415 = _1405;
    float _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1419 = _1375;
    if (_1387)
    {
        _1413 = _1367;
    }
    float _1421 = _1413;
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1405;
    float _1427 = _1421;
    if (_1387)
    {
        _1415 = _1369;
    }
    float _1429 = _1415;
    float _1431 = _1425 * _1409;
    float _1433 = _1431 * 0.5;
    float _1435 = _1409;
    float _1437 = _1429;
    if (_1401)
    {
        _1435 = 1.0;
    }
    float _1439 = _1435;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
    float _1445 = _1443;
    float _1447 = _1439;
    if (_1387)
    {
        _1417 = _1371;
    }
    float _1449 = _1417;
    float _1451 = 1.0 / _1443;
    float _1453 = _1449;
    if (!_1387)
    {
        float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1457 = _1003 + _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1461 = _885 + _1459;
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = -_1003;
        float _1467 = _1465 + _1367;
        float _1469 = _1457 * _1457;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _883 + _1471;
        float _1475 = -_883;
        float _1477 = _1475 + _1369;
        float _1479 = fma(_1461, _1461, _1469);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1473, _1473, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_885;
        float _1495 = _1493 + _1371;
        float _1497 = _1487 * _1491;
        float _1499 = fma(_1495, _1497, _885);
        float _1501 = fma(_1467, _1497, _1003);
        float _1503 = fma(_1477, _1497, _883);
        _1427 = _1501;
        _1453 = _1499;
        _1437 = _1503;
        _1445 = _1485;
    }
    float _1505 = _1427;
    float _1507 = _1453;
    float _1509 = _1437;
    float _1511 = _1445;
    float _1513 = _1511;
    if (_1401)
    {
        _1513 = 1.0;
    }
    float _1515 = _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1519 = _1451 * _1517;
    float _1521 = _1515;
    float _1523 = _1519;
    if (!_1401)
    {
        float _1525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1531 = _1527 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1527 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = 1.0 / _1533;
        float _1543 = _1535 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1539 * _1541;
        float _1549 = _1535 * 6.283185482025146484375;
        float _1551 = sin(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = 1.0 / _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1557;
        float _1561 = 1.0 / _1559;
        float _1563 = _1551 * _1555;
        float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1567 = fma(_1519, _1563, _1565);
        float _1569 = _1567 * _1561;
        float _1571 = precise::clamp(_1569, 0.0, 1.0);
        _1447 = _1571;
    }
    float _1573 = _1447;
    if (!_1401)
    {
        float _1575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = _1577 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1579 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1583;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1617 = fma(_1519, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        float _1623 = -_1621;
        float _1625 = _1623 + 1.0;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1631 = _1505 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1635 = _1507 + _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1639 = _1509 + _1637;
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1635, _1635, _1641);
    float _1645 = fma(_1639, _1639, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1635 * _1649;
    float _1653 = _1639 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1647;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1631;
    float _1677 = _1651;
    if (_1663)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1679;
    }
    float _1681 = _1669;
    if (_1663)
    {
        float _1683 = rsqrt(_1659);
        _1671 = _1683;
    }
    float _1685 = _1671;
    if (_1663)
    {
        float _1687 = _1667 * _1681;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1663)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1523 = _1691;
    }
    float _1693 = _1523;
    float _1695 = _1681;
    if (_1663)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1639;
    float _1709 = _1705;
    if (_1663)
    {
        float _1711 = _1693 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1649;
    float _1719 = -_1705;
    float _1721 = fma(_1631, _1717, _1719);
    float _1723 = _1721;
    if (!_1663)
    {
        _1675 = _1653;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1663)
    {
        float _1729 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1645);
    float _1735 = _1701;
    float _1737 = _1731;
    if (_1663)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    float _1745 = _1715;
    if (_1663)
    {
        float _1747 = _1715 + (-1.0);
        _1737 = _1747;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (_1663)
    {
        float _1753 = _1685 * _1741;
        _1419 = _1753;
    }
    float _1755 = _1419;
    if (_1663)
    {
        float _1757 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1743 = _1757;
    }
    float _1759 = _1743;
    if (_1663)
    {
        float _1761 = _1651 * _1755;
        _1677 = _1761;
    }
    float _1763 = _1677;
    if (!_1663)
    {
        _1751 = _1655;
    }
    float _1765 = _1751;
    float _1767 = _1765;
    if (_1663)
    {
        float _1769 = _1653 * _1755;
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (_1663)
    {
        float _1773 = fma(_1721, _1715, _1759);
        _1723 = _1773;
    }
    float _1775 = _1723;
    if (_1663)
    {
        float _1777 = _1763 * _1763;
        _1767 = _1777;
    }
    float _1779 = _1767;
    if (!_1663)
    {
        _1745 = _1657;
    }
    float _1781 = _1745;
    float _1783 = _1781;
    if (_1663)
    {
        float _1785 = _1771 * _1771;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1775, _1775, _1779);
    float _1791 = _1789 + _1787;
    float _1793 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1803 = rsqrt(_1791);
    float _1805 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1793);
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1801);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1815 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1817 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1825 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1835 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1827);
    float _1837 = abs(_1809);
    float _1839 = log2(_1837);
    float _1841 = _1803 * _1763;
    float _1843 = -_1831;
    float _1845 = fma(_1843, _1813, 1.0);
    float _1847 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1849 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1851 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1853 = _1803 * _1775;
    float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1849);
    float _1859 = _1803 * _1771;
    float _1861 = log2(_1845);
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1857);
    float _1869 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1871 = _1853 + 1.0;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1877 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1867);
    float _1879 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1883 = fma(_1875, -0.5, 0.5);
    float _1885 = 1.0 / _1877;
    float _1887 = fma(_1875, 0.5, 0.5);
    float _1889 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1881);
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1869);
    float _1893 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1895 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = exp2(_1879);
    float _1899 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1895, -0.212114393711090087890625);
    float _1905 = _1861 * 0.693147182464599609375;
    float _1907 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1909 = fma(_1887, _1903, 1.570728778839111328125);
    float _1911 = sqrt(_1883);
    float _1913 = _1901 * _1885;
    float _1915 = _1907 * _1885;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = fma(_1913, 0.5, 0.5);
    float _1921 = fma(_1915, -0.5, 0.5);
    float _1923 = -_1853;
    float _1925 = fma(_1897, _1871, _1923);
    float3 _4976 = float3(_1919, _1921, _1917);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4976, float3(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4976, float3(0.0), isnan(_4976)), level(0.0)).x;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = _1911 * 0.636619746685028076171875;
    float _1933 = -_1909;
    float _1935 = fma(_1931, _1933, 1.0);
    float3 _4997 = float3(_1919, _1921, _1917);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float2 _5014 = float2(_1935, _1929);
    float3 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _1573 > 0.0;
    bool _1964 = isnan(_1573);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1573 * _1627;
    float _1974 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1976 = exp2(_1958);
    bool _1978 = _1627 <= 0.0;
    bool _1980 = !_1970;
    bool _1982 = _1978 || _1980;
    float _1984 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1974);
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1988 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1984);
    float _1990 = _1986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1992 = _1988 + _1877;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1877;
    float _1994 = _1992 * 0.5;
    float _1996 = -_1976;
    float _1998 = _1996 + 1.0;
    out.m_45.x = _1990;
    float _2000 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1994;
    out.m_62.w = _1877;
    float _2002 = _2000 * _1927;
    float _2004 = -_2000;
    float _2006 = _2004 + 1.0;
    float _2008 = _1946 * _2002;
    float _2010 = _1956 * _2002;
    float _2012 = fma(_1952, _2008, _1940);
    float _2014 = fma(_1954, _2008, _1942);
    float _2016 = _1946 * _2006;
    float _2018 = fma(_1946, _2010, _1944);
    out.m_64.x = _2012;
    out.m_64.y = _2014;
    out.m_64.z = _2018;
    out.m_64.w = _2016;
    if (!_1982)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2020;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
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
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_99);
        out.gl_Position.z = _2077;
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
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2145 = as_type<float>(_135);
        out.gl_Position.z = _2145;
    }
    if (_129)
    {
        return out;
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    if (!_155)
    {
        float _191 = _145 * _145;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_155)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_175;
    float _205 = _165 + _203;
    bool _207 = !_155;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _145 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _145);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
    }
    float _243 = _209;
    bool _245 = !_155;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _189 = _265;
    }
    float _267 = _189;
    float _269 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_267, _167, _269);
    bool _277 = _205 < 0.5;
    float _279 = float(_277);
    float _281 = fma(_267, _169, _271);
    float _283 = fma(_267, _171, _273);
    float _285 = fma(_185, 0.5, 0.5);
    float _287 = _273;
    if (!_155)
    {
        float _289 = _117 * _117;
        float _291 = _289 * 0.5;
        _287 = _291;
    }
    float _293 = _287;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_279;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_285;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_275, _143, _157);
    float _309 = fma(_281, _143, _159);
    float _311 = fma(_283, _143, _161);
    float _313 = _293;
    if (!_155)
    {
        float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (!_155)
    {
        _211 = _117;
    }
    float _321 = _211;
    bool _323 = !_181;
    int _325 = _323 ? 0 : 1;
    bool _327 = !_155;
    float _329 = _321;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _117 * _333;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = 1.0 / _341;
        float _345 = _335 * 0.693147182464599609375;
        float _347 = exp2(_337);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _117);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _319 = _359;
    }
    float _361 = _319;
    bool _363 = !_155;
    if (!_363)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _117 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _329 = _383;
    }
    float _385 = _329;
    float _387 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _395 = _393 != 0;
    float _397 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_385, _167, _387);
    int _403 = abs(_325);
    float _405 = fma(_385, _169, _397);
    bool _407 = !_391;
    int _409 = _407 ? 0 : 1;
    float _411 = fma(_385, _171, _399);
    bool _413 = !_395;
    int _415 = _413 ? 0 : 1;
    float _417 = -_401;
    float _419 = _275 + _417;
    int _421 = abs(_409);
    float _423 = -_405;
    float _425 = _281 + _423;
    int _427 = abs(_415);
    float _429 = -_411;
    float _431 = _283 + _429;
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = float(_421);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _447 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = float(_403);
    float _451 = abs(_297);
    float _453 = _441 * _451;
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, _305, _453);
    float _461 = float(_427);
    float _463 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _465 = abs(_301);
    float _467 = fma(_461, _465, _459);
    bool _469 = !_433;
    float _471 = _463;
    float _473 = _455;
    float _475 = _457;
    float _477 = _457;
    float _493;
    if (!_469)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _309 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _747 = _137 > 0.5;
    float _749 = in.m_51.x;
    float _751 = in.m_51.y;
    float _753 = _309 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _759;
    float _763 = in.m_49.y;
    float _765 = _309 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _767 = 1.0 / _757;
    float _769 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].x, _745);
    float _771 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _773 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].x, _765);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _777 = _741 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _741 + _779;
    float _783 = 1.0 / _761;
    bool _785 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _787 = isnan(_741);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_743) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>(_743) & 2;
    bool _803 = _801 != 0;
    float _805 = _777 * _767;
    float _807 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    float _809 = _711 * _749;
    float _811 = _713 * _751;
    bool _813 = !_803;
    float _815 = _813 ? (-0.5) : 0.5;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _467 * _809;
    float _821 = _467 * _811;
    bool _823 = _763 > 0.5;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _815);
    bool _827 = !_799;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _835 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _829);
    float _839 = _831 * _825;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _843 = _841 != 0;
    float _845 = _781 * _783;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _849 = _847 != 0;
    float _851 = _833 * _837;
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _873 = fma(_859, _845, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _875 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _877 = fma(_867, _845, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _869);
    float _881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _883 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _807 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _879);
    float _889 = _881 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _895 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _897 = isnan(_741);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _887 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _909 = _883 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _915 = fma(_893, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _917 = _885 + _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _921 = _909 + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    float _927 = fma(_913, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _917 + _929;
    float _933 = _921 * _921;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _939 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _941 = isnan(_741);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _795 * _925;
    float _953 = fma(_931, _931, _933);
    float _955 = -_795;
    float _957 = _955 + 1.0;
    float _959 = -_829;
    int _961 = _747 ? as_type<int>(_959) : as_type<int>(_829);
    float _963 = fma(_937, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _965 = sqrt(_953);
    float _967 = -_815;
    int _969 = _823 ? as_type<int>(_967) : as_type<int>(_815);
    float _971 = _949 * _957;
    bool _973 = !_843;
    float _975 = _973 ? _829 : as_type<float>(_961);
    float _977 = -_949;
    float _979 = _977 + 1.0;
    bool _981 = !_849;
    float _983 = _981 ? _815 : as_type<float>(_969);
    float _985 = _873 * _971;
    float _987 = _875 * _971;
    float _989 = _877 * _971;
    float _991 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].x, _985);
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].z, _989);
    float _999 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1003 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1005 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = fma(_963, _951, _997);
    float _1009 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1011 = fma(_915, _951, _993);
    float _1013 = fma(_927, _951, _995);
    float _1015 = _975 + 0.5;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1021 = -_983;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1011);
    float _1027 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1013);
    float _1029 = _1003 + _1019;
    float _1031 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1007);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1037 = _839;
    float _1039 = _1013;
    float _1041 = _993;
    if (!_1005)
    {
        _1037 = _917;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (!_1005)
    {
        _1039 = _909;
    }
    float _1047 = _1039;
    float _1049 = _1047;
    if (!_1005)
    {
        _1041 = _1029;
    }
    float _1051 = _1041;
    bool _1053 = !_1005;
    float _1055 = _1051;
    if (!_1053)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1061 = _965 + _1059;
        float _1063 = rsqrt(_953);
        float _1065 = _1061 * _1057;
        float _1067 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = _1065 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = _1069 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 + (-1.0);
        float _1081 = fma(_1077, _1067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = _1063 * _1081;
        float _1087 = fma(_1029, _1073, _1083);
        float _1089 = fma(_931, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_921, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1087;
        _1045 = _1089;
        _1049 = _1091;
    }
    float _1093 = _1055;
    float _1095 = _1045;
    float _1097 = _1049;
    float _1099 = -_1003;
    float _1101 = _1099 + _1093;
    float _1103 = _1033 * _1001;
    float _1105 = -_885;
    float _1107 = _1105 + _1095;
    float _1109 = _1035 * _1017;
    float _1111 = _1101 * _1101;
    float _1113 = -_883;
    float _1115 = _1113 + _1097;
    float _1117 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1119 = fma(_1107, _1107, _1111);
    float _1121 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1123 = fma(_1115, _1115, _1119);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1129 = sqrt(_1123);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1103;
    out.m_56.y = _1109;
    out.m_58.x = _1135;
    out.m_58.y = _1139;
    out.m_58.z = _1141;
    bool _1149 = _1129 > 0.0;
    out.m_60.x = _1143;
    out.m_60.y = _1145;
    out.m_60.z = _1147;
    out.m_60.w = _1137;
    bool _1151 = !_1149;
    float _1153 = _1145;
    float _1155 = _1139;
    float _1157 = _1135;
    float _1159 = _1093;
    float _1161 = _1097;
    float _1163 = _1095;
    float _1165 = _1139;
    if (!_1151)
    {
        bool _1167 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1169 = _1137;
        if (_1167)
        {
            float _1171 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1169 = _1171;
        }
        float _1173 = _1169;
        if (_1167)
        {
            float _1175 = _455 * _1173;
            _1153 = _1175;
        }
        float _1177 = _1153;
        float _1179 = _1177;
        if (_1167)
        {
            float _1181 = _463 * _1173;
            _1155 = _1181;
        }
        float _1183 = _1155;
        float _1185 = _1183;
        if (_1167)
        {
            float _1187 = _457 * _1173;
            _1157 = _1187;
        }
        float _1189 = _1157;
        float _1191 = _1189;
        float _1193 = _1189;
        if (!_1167)
        {
            float _1195 = _117 + 1.0;
            float _1197 = _1195;
            if (!_155)
            {
                float _1199 = _1195 * _1195;
                float _1201 = _1199 * 0.5;
                _1191 = _1201;
            }
            float _1203 = _1191;
            float _1205 = _1203;
            if (!_155)
            {
                float _1207 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1205 = _1207;
            }
            float _1209 = _1205;
            bool _1211 = !_155;
            float _1213 = _1209;
            if (!_1211)
            {
                float _1215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1217 = log2(_1215);
                float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1221 = _1219 + 1.0;
                float _1223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1225 = _1217 * _1195;
                float _1227 = 1.0 / _1221;
                float _1229 = _1223 * 0.693147182464599609375;
                float _1231 = exp2(_1225);
                float _1233 = 1.0 / _1229;
                float _1235 = _1231 + (-1.0);
                float _1237 = -_1235;
                float _1239 = fma(_1237, _1233, _1195);
                float _1241 = _1239 * _1227;
                float _1243 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1213 = _1243;
            }
            float _1245 = _1213;
            float _1247 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1251 = !_155;
            if (!_1251)
            {
                float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1255 = log2(_1253);
                float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1259 = _1257 + 1.0;
                float _1261 = 1.0 / _1259;
                float _1263 = _1255 * _1195;
                float _1265 = exp2(_1263);
                float _1267 = -_1265;
                float _1269 = _1267 + 1.0;
                float _1271 = _1269 * _1261;
                _1197 = _1271;
            }
            float _1273 = _1197;
            float _1275 = fma(_1273, _169, _1249);
            float _1277 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1279 = fma(_1273, _167, _1247);
            float _1281 = -_405;
            float _1283 = _1281 + _1275;
            float _1285 = fma(_1273, _171, _1277);
            float _1287 = -_401;
            float _1289 = _1287 + _1279;
            float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1293 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1295 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1297 = -_411;
            float _1299 = _1297 + _1285;
            float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1291);
            float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1293);
            float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1295);
            float _1307 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1301);
            float _1309 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1303);
            float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1305);
            _471 = _1309;
            _473 = _1307;
            _475 = _1311;
            _1179 = _1307;
            _1185 = _1309;
            _1193 = _1311;
        }
        float _1313 = _471;
        float _1315 = _473;
        float _1317 = _475;
        float _1319 = _1179;
        float _1321 = _1185;
        float _1323 = _1193;
        float _1325 = _1313 * _1313;
        float _1327 = rsqrt(_1123);
        float _1329 = fma(_1315, _1315, _1325);
        float _1331 = fma(_1317, _1317, _1329);
        float _1333 = sqrt(_1331);
        float _1335 = _1107 * _1327;
        float _1337 = _1101 * _1327;
        float _1339 = _1115 * _1327;
        bool _1341 = _1333 > 0.0;
        bool _1343 = !_1341;
        _1165 = _1321;
        _477 = _1317;
        if (!_1343)
        {
            float _1345 = rsqrt(_1331);
            float _1347 = _1345 * _1313;
            float _1349 = _1345 * _1315;
            float _1351 = _1345 * _1317;
            float _1353 = _1337 * _1347;
            float _1355 = fma(_1335, _1349, _1353);
            float _1357 = fma(_1339, _1351, _1355);
            float _1359 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1361 = fma(_1319, _1359, _1095);
            float _1363 = fma(_1321, _1359, _1093);
            float _1365 = fma(_1323, _1359, _1097);
            _1159 = _1363;
            _1161 = _1365;
            _1163 = _1361;
        }
    }
    float _1367 = _1159;
    float _1369 = _1161;
    float _1371 = _1163;
    float _1373 = _1165;
    float _1375 = _477;
    float _1377 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1379 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1381 = isnan(0.5);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    float _1391 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1393 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1395 = isnan(0.5);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    float _1403 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1409 = 1.0 / _1405;
    float _1411 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1407);
    float _1413 = _1373;
    float _1415 = _1405;
    float _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1419 = _1375;
    if (_1387)
    {
        _1413 = _1367;
    }
    float _1421 = _1413;
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1405;
    float _1427 = _1421;
    if (_1387)
    {
        _1415 = _1369;
    }
    float _1429 = _1415;
    float _1431 = _1425 * _1409;
    float _1433 = _1431 * 0.5;
    float _1435 = _1409;
    float _1437 = _1429;
    if (_1401)
    {
        _1435 = 1.0;
    }
    float _1439 = _1435;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
    float _1445 = _1443;
    float _1447 = _1439;
    if (_1387)
    {
        _1417 = _1371;
    }
    float _1449 = _1417;
    float _1451 = 1.0 / _1443;
    float _1453 = _1449;
    if (!_1387)
    {
        float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1457 = _1003 + _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1461 = _885 + _1459;
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = -_1003;
        float _1467 = _1465 + _1367;
        float _1469 = _1457 * _1457;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _883 + _1471;
        float _1475 = -_883;
        float _1477 = _1475 + _1369;
        float _1479 = fma(_1461, _1461, _1469);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1473, _1473, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_885;
        float _1495 = _1493 + _1371;
        float _1497 = _1487 * _1491;
        float _1499 = fma(_1495, _1497, _885);
        float _1501 = fma(_1467, _1497, _1003);
        float _1503 = fma(_1477, _1497, _883);
        _1427 = _1501;
        _1453 = _1499;
        _1437 = _1503;
        _1445 = _1485;
    }
    float _1505 = _1427;
    float _1507 = _1453;
    float _1509 = _1437;
    float _1511 = _1445;
    float _1513 = _1511;
    if (_1401)
    {
        _1513 = 1.0;
    }
    float _1515 = _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1519 = _1451 * _1517;
    float _1521 = _1515;
    float _1523 = _1519;
    if (!_1401)
    {
        float _1525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1531 = _1527 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1527 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = 1.0 / _1533;
        float _1543 = _1535 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1539 * _1541;
        float _1549 = _1535 * 6.283185482025146484375;
        float _1551 = sin(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = 1.0 / _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1557;
        float _1561 = 1.0 / _1559;
        float _1563 = _1551 * _1555;
        float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1567 = fma(_1519, _1563, _1565);
        float _1569 = _1567 * _1561;
        float _1571 = precise::clamp(_1569, 0.0, 1.0);
        _1447 = _1571;
    }
    float _1573 = _1447;
    if (!_1401)
    {
        float _1575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = _1577 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1579 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1583;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1617 = fma(_1519, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        float _1623 = -_1621;
        float _1625 = _1623 + 1.0;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1631 = _1505 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1635 = _1507 + _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1639 = _1509 + _1637;
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1635, _1635, _1641);
    float _1645 = fma(_1639, _1639, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1635 * _1649;
    float _1653 = _1639 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1647;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1631;
    float _1677 = _1651;
    if (_1663)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1679;
    }
    float _1681 = _1669;
    if (_1663)
    {
        float _1683 = rsqrt(_1659);
        _1671 = _1683;
    }
    float _1685 = _1671;
    if (_1663)
    {
        float _1687 = _1667 * _1681;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1663)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1523 = _1691;
    }
    float _1693 = _1523;
    float _1695 = _1681;
    if (_1663)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1639;
    float _1709 = _1705;
    if (_1663)
    {
        float _1711 = _1693 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1649;
    float _1719 = -_1705;
    float _1721 = fma(_1631, _1717, _1719);
    float _1723 = _1721;
    if (!_1663)
    {
        _1675 = _1653;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1663)
    {
        float _1729 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1645);
    float _1735 = _1701;
    float _1737 = _1731;
    if (_1663)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    float _1745 = _1715;
    if (_1663)
    {
        float _1747 = _1715 + (-1.0);
        _1737 = _1747;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (_1663)
    {
        float _1753 = _1685 * _1741;
        _1419 = _1753;
    }
    float _1755 = _1419;
    if (_1663)
    {
        float _1757 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1743 = _1757;
    }
    float _1759 = _1743;
    if (_1663)
    {
        float _1761 = _1651 * _1755;
        _1677 = _1761;
    }
    float _1763 = _1677;
    if (!_1663)
    {
        _1751 = _1655;
    }
    float _1765 = _1751;
    float _1767 = _1765;
    if (_1663)
    {
        float _1769 = _1653 * _1755;
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (_1663)
    {
        float _1773 = fma(_1721, _1715, _1759);
        _1723 = _1773;
    }
    float _1775 = _1723;
    if (_1663)
    {
        float _1777 = _1763 * _1763;
        _1767 = _1777;
    }
    float _1779 = _1767;
    if (!_1663)
    {
        _1745 = _1657;
    }
    float _1781 = _1745;
    float _1783 = _1781;
    if (_1663)
    {
        float _1785 = _1771 * _1771;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1775, _1775, _1779);
    float _1791 = _1789 + _1787;
    float _1793 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1803 = rsqrt(_1791);
    float _1805 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1793);
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1801);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1815 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1817 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1825 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1835 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1827);
    float _1837 = abs(_1809);
    float _1839 = log2(_1837);
    float _1841 = _1803 * _1763;
    float _1843 = -_1831;
    float _1845 = fma(_1843, _1813, 1.0);
    float _1847 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1849 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1851 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1853 = _1803 * _1775;
    float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1849);
    float _1859 = _1803 * _1771;
    float _1861 = log2(_1845);
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1857);
    float _1869 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1871 = _1853 + 1.0;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1877 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1867);
    float _1879 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1883 = fma(_1875, -0.5, 0.5);
    float _1885 = 1.0 / _1877;
    float _1887 = fma(_1875, 0.5, 0.5);
    float _1889 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1881);
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1869);
    float _1893 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1895 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = exp2(_1879);
    float _1899 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1895, -0.212114393711090087890625);
    float _1905 = _1861 * 0.693147182464599609375;
    float _1907 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1909 = fma(_1887, _1903, 1.570728778839111328125);
    float _1911 = sqrt(_1883);
    float _1913 = _1901 * _1885;
    float _1915 = _1907 * _1885;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = fma(_1913, 0.5, 0.5);
    float _1921 = fma(_1915, -0.5, 0.5);
    float _1923 = -_1853;
    float _1925 = fma(_1897, _1871, _1923);
    float3 _4976 = float3(_1919, _1921, _1917);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4976, float3(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4976, float3(0.0), isnan(_4976)), level(0.0)).x;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = _1911 * 0.636619746685028076171875;
    float _1933 = -_1909;
    float _1935 = fma(_1931, _1933, 1.0);
    float3 _4997 = float3(_1919, _1921, _1917);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float2 _5014 = float2(_1935, _1929);
    float3 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _1573 > 0.0;
    bool _1964 = isnan(_1573);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1573 * _1627;
    float _1974 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1976 = exp2(_1958);
    bool _1978 = _1627 <= 0.0;
    bool _1980 = !_1970;
    bool _1982 = _1978 || _1980;
    float _1984 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1974);
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1988 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1984);
    float _1990 = _1986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1992 = _1988 + _1877;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1877;
    float _1994 = _1992 * 0.5;
    float _1996 = -_1976;
    float _1998 = _1996 + 1.0;
    out.m_45.x = _1990;
    float _2000 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1994;
    out.m_62.w = _1877;
    float _2002 = _2000 * _1927;
    float _2004 = -_2000;
    float _2006 = _2004 + 1.0;
    float _2008 = _1946 * _2002;
    float _2010 = _1956 * _2002;
    float _2012 = fma(_1952, _2008, _1940);
    float _2014 = fma(_1954, _2008, _1942);
    float _2016 = _1946 * _2006;
    float _2018 = fma(_1946, _2010, _1944);
    out.m_64.x = _2012;
    out.m_64.y = _2014;
    out.m_64.z = _2018;
    out.m_64.w = _2016;
    if (!_1982)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2020;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _733 = false;
    bool _495 = false;
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
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    int _101 = _99;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_99);
        out.gl_Position.z = _2077;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_83);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _93;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _133 = _131 * 5.0;
        _101 = as_type<int>(_133);
    }
    int _135 = _101;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2145 = as_type<float>(_135);
        out.gl_Position.z = _2145;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_49.x;
    float _139 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _141 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _143 = in.m_51.w;
    float _145 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    float _157 = in.m_42.x;
    float _159 = in.m_42.y;
    float _161 = in.m_42.z;
    float _163 = _141 * _139;
    float _165 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_47.x;
    float _169 = in.m_47.y;
    float _171 = in.m_47.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    float _177 = _173 * 0.15915493667125701904296875;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _177 * 6.283185482025146484375;
    float _185 = cos(_183);
    float _187 = 1.4012984643248170709237295832899e-45;
    float _189 = _145;
    if (!_155)
    {
        float _191 = _145 * _145;
        float _193 = _191 * 0.5;
        _187 = _193;
    }
    float _195 = _187;
    float _197 = _195;
    if (!_155)
    {
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    float _203 = -_175;
    float _205 = _165 + _203;
    bool _207 = !_155;
    float _209 = _201;
    float _211 = _205;
    if (!_207)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _145 * _215;
        float _225 = 1.0 / _219;
        float _227 = _221 * 0.693147182464599609375;
        float _229 = exp2(_223);
        float _231 = 1.0 / _227;
        float _233 = _229 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _231, _145);
        float _239 = _237 * _225;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _241;
    }
    float _243 = _209;
    bool _245 = !_155;
    if (!_245)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _145 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _189 = _265;
    }
    float _267 = _189;
    float _269 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_267, _167, _269);
    bool _277 = _205 < 0.5;
    float _279 = float(_277);
    float _281 = fma(_267, _169, _271);
    float _283 = fma(_267, _171, _273);
    float _285 = fma(_185, 0.5, 0.5);
    float _287 = _273;
    if (!_155)
    {
        float _289 = _117 * _117;
        float _291 = _289 * 0.5;
        _287 = _291;
    }
    float _293 = _287;
    float _295 = -_205;
    float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _299 = -_279;
    float _301 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _303 = -_285;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _307 = fma(_275, _143, _157);
    float _309 = fma(_281, _143, _159);
    float _311 = fma(_283, _143, _161);
    float _313 = _293;
    if (!_155)
    {
        float _315 = _293 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _313 = _315;
    }
    float _317 = _313;
    float _319 = _317;
    if (!_155)
    {
        _211 = _117;
    }
    float _321 = _211;
    bool _323 = !_181;
    int _325 = _323 ? 0 : 1;
    bool _327 = !_155;
    float _329 = _321;
    if (!_327)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _337 = _117 * _333;
        float _339 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _341 = _339 + 1.0;
        float _343 = 1.0 / _341;
        float _345 = _335 * 0.693147182464599609375;
        float _347 = exp2(_337);
        float _349 = 1.0 / _345;
        float _351 = _347 + (-1.0);
        float _353 = -_351;
        float _355 = fma(_353, _349, _117);
        float _357 = _355 * _343;
        float _359 = _357 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _319 = _359;
    }
    float _361 = _319;
    bool _363 = !_155;
    if (!_363)
    {
        float _365 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _367 = log2(_365);
        float _369 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _371 = _369 + 1.0;
        float _373 = 1.0 / _371;
        float _375 = _117 * _367;
        float _377 = exp2(_375);
        float _379 = -_377;
        float _381 = _379 + 1.0;
        float _383 = _381 * _373;
        _329 = _383;
    }
    float _385 = _329;
    float _387 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _395 = _393 != 0;
    float _397 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _399 = _361 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _401 = fma(_385, _167, _387);
    int _403 = abs(_325);
    float _405 = fma(_385, _169, _397);
    bool _407 = !_391;
    int _409 = _407 ? 0 : 1;
    float _411 = fma(_385, _171, _399);
    bool _413 = !_395;
    int _415 = _413 ? 0 : 1;
    float _417 = -_401;
    float _419 = _275 + _417;
    int _421 = abs(_409);
    float _423 = -_405;
    float _425 = _281 + _423;
    int _427 = abs(_415);
    float _429 = -_411;
    float _431 = _283 + _429;
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = _425 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _437 = _425 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _439 = _425 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _441 = float(_421);
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _435);
    float _445 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _437);
    float _447 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _439);
    float _449 = float(_403);
    float _451 = abs(_297);
    float _453 = _441 * _451;
    float _455 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[4].z, _443);
    float _457 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _459 = fma(_449, _305, _453);
    float _461 = float(_427);
    float _463 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[5].z, _445);
    float _465 = abs(_301);
    float _467 = fma(_461, _465, _459);
    bool _469 = !_433;
    float _471 = _463;
    float _473 = _455;
    float _475 = _457;
    float _477 = _457;
    float _493;
    if (!_469)
    {
        float _479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _481 = _137 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _483 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _485 = _483 * _479;
        float _487 = floor(_485);
        float _489 = -_487;
        float _491 = _485 + _489;
        _493 = _491;
        _495 = true;
    }
    else
    {
        float _497 = float(_83);
        float _499 = 1.0 / _497;
        float _501 = _117 * _499;
        _493 = _501;
    }
    _495 = false;
    float _503 = _493;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _507 = _503 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _511 = _503 + _509;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _515 = _503 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _519 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _517;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _531 = _529 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _533 = 1.0 / _523;
    bool _535 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _537 = 1.0 / _519;
    bool _539 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _541 = isnan(_503);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = 1.0 / _527;
    float _553 = 1.0 / _531;
    float _555 = _507 * _537;
    bool _557 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _559 = isnan(_503);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    bool _569 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _571 = isnan(_503);
    bool _573 = _569 || _571;
    bool _575 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _577 = _573 || _575;
    float _579 = float(_577);
    bool _581 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _583 = isnan(_503);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _511 * _551;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _597 = _503 + _595;
    float _599 = -_567;
    float _601 = _599 + 1.0;
    float _603 = _597 * _533;
    float _605 = -_579;
    float _607 = _605 + 1.0;
    float _609 = _591 * _601;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _515 * _553;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _617;
    float _621 = _567 * _607;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _627 = _503 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_503);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _549 * _613;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _643 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _641;
    float _645 = -_549;
    float _647 = _645 + 1.0;
    float _649 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _651 = _649 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _653 = fma(_619, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _655 = fma(_643, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _657 = _637 * _647;
    float _659 = -_637;
    float _661 = _659 + 1.0;
    float _663 = fma(_651, _615, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _665 = fma(_625, _615, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _667 = _655 * _657;
    float _669 = _653 * _657;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _675;
    float _679 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].x, _667);
    float _681 = fma(_661, (*spvDescriptorSet0.vp_c9)._m0[143].y, _669);
    float _683 = fma(_673, _555, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _685 = fma(_677, _555, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _695 = fma(_663, _639, _679);
    float _697 = fma(_665, _639, _681);
    float _699 = fma(_689, _603, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _701 = fma(_693, _603, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _703 = fma(_683, _609, _695);
    float _705 = fma(_685, _609, _697);
    float _707 = fma(_699, _621, _703);
    float _709 = fma(_701, _621, _705);
    float _711 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].x, _707);
    float _713 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[147].y, _709);
    bool _715 = !_535;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _719 = _137 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_83);
        float _737 = 1.0 / _735;
        float _739 = _117 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = as_type<float>(int(gl_VertexIndex));
    float _745 = _309 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _747 = _137 > 0.5;
    float _749 = in.m_51.x;
    float _751 = in.m_51.y;
    float _753 = _309 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _757 = _755 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _761 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _759;
    float _763 = in.m_49.y;
    float _765 = _309 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _767 = 1.0 / _757;
    float _769 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[4].x, _745);
    float _771 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[5].x, _753);
    float _773 = fma(_307, (*spvDescriptorSet0.vp_c10)._m0[6].x, _765);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _777 = _741 + _775;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _781 = _741 + _779;
    float _783 = 1.0 / _761;
    bool _785 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _787 = isnan(_741);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    int _797 = as_type<int>(_743) & 1;
    bool _799 = _797 != 0;
    int _801 = as_type<int>(_743) & 2;
    bool _803 = _801 != 0;
    float _805 = _777 * _767;
    float _807 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[4].z, _769);
    float _809 = _711 * _749;
    float _811 = _713 * _751;
    bool _813 = !_803;
    float _815 = _813 ? (-0.5) : 0.5;
    float _817 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _819 = _467 * _809;
    float _821 = _467 * _811;
    bool _823 = _763 > 0.5;
    float _825 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _815);
    bool _827 = !_799;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _833 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _835 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[5].z, _771);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _829);
    float _839 = _831 * _825;
    int _841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _843 = _841 != 0;
    float _845 = _781 * _783;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _849 = _847 != 0;
    float _851 = _833 * _837;
    float _853 = _839 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _855 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[6].z, _773);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _867 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _865;
    float _869 = _839 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _871 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[26].x, _853);
    float _873 = fma(_859, _845, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _875 = fma(_863, _845, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _877 = fma(_867, _845, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[24].x, _869);
    float _881 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].z, _871);
    float _883 = _855 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _885 = _807 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _887 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].z, _879);
    float _889 = _881 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _895 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _897 = isnan(_741);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _887 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _909 = _883 + _889;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _915 = fma(_893, _805, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _917 = _885 + _907;
    float _919 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _921 = _909 + _919;
    float _923 = -_905;
    float _925 = _923 + 1.0;
    float _927 = fma(_913, _805, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _917 + _929;
    float _933 = _921 * _921;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    bool _939 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _941 = isnan(_741);
    bool _943 = _939 || _941;
    bool _945 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _947 = _943 || _945;
    float _949 = float(_947);
    float _951 = _795 * _925;
    float _953 = fma(_931, _931, _933);
    float _955 = -_795;
    float _957 = _955 + 1.0;
    float _959 = -_829;
    int _961 = _747 ? as_type<int>(_959) : as_type<int>(_829);
    float _963 = fma(_937, _805, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _965 = sqrt(_953);
    float _967 = -_815;
    int _969 = _823 ? as_type<int>(_967) : as_type<int>(_815);
    float _971 = _949 * _957;
    bool _973 = !_843;
    float _975 = _973 ? _829 : as_type<float>(_961);
    float _977 = -_949;
    float _979 = _977 + 1.0;
    bool _981 = !_849;
    float _983 = _981 ? _815 : as_type<float>(_969);
    float _985 = _873 * _971;
    float _987 = _875 * _971;
    float _989 = _877 * _971;
    float _991 = _839 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _993 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].x, _985);
    float _995 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].y, _987);
    float _997 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[107].z, _989);
    float _999 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[25].x, _991);
    float _1001 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1003 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1005 = _965 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1007 = fma(_963, _951, _997);
    float _1009 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].z, _999);
    float _1011 = fma(_915, _951, _993);
    float _1013 = fma(_927, _951, _995);
    float _1015 = _975 + 0.5;
    float _1017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1019 = _1009 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1021 = -_983;
    float _1023 = _1021 + 0.5;
    float _1025 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1011);
    float _1027 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1013);
    float _1029 = _1003 + _1019;
    float _1031 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1007);
    float _1033 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1035 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1037 = _839;
    float _1039 = _1013;
    float _1041 = _993;
    if (!_1005)
    {
        _1037 = _917;
    }
    float _1043 = _1037;
    float _1045 = _1043;
    if (!_1005)
    {
        _1039 = _909;
    }
    float _1047 = _1039;
    float _1049 = _1047;
    if (!_1005)
    {
        _1041 = _1029;
    }
    float _1051 = _1041;
    bool _1053 = !_1005;
    float _1055 = _1051;
    if (!_1053)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1059 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1061 = _965 + _1059;
        float _1063 = rsqrt(_953);
        float _1065 = _1061 * _1057;
        float _1067 = _1029 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1069 = _1065 * 0.15915493667125701904296875;
        float _1071 = _1069 * 6.283185482025146484375;
        float _1073 = cos(_1071);
        float _1075 = _1069 * 6.283185482025146484375;
        float _1077 = sin(_1075);
        float _1079 = _1073 + (-1.0);
        float _1081 = fma(_1077, _1067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1083 = _1079 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1085 = _1063 * _1081;
        float _1087 = fma(_1029, _1073, _1083);
        float _1089 = fma(_931, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1091 = fma(_921, _1085, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1055 = _1087;
        _1045 = _1089;
        _1049 = _1091;
    }
    float _1093 = _1055;
    float _1095 = _1045;
    float _1097 = _1049;
    float _1099 = -_1003;
    float _1101 = _1099 + _1093;
    float _1103 = _1033 * _1001;
    float _1105 = -_885;
    float _1107 = _1105 + _1095;
    float _1109 = _1035 * _1017;
    float _1111 = _1101 * _1101;
    float _1113 = -_883;
    float _1115 = _1113 + _1097;
    float _1117 = _1027 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1119 = fma(_1107, _1107, _1111);
    float _1121 = _1031 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1123 = fma(_1115, _1115, _1119);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1129 = sqrt(_1123);
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1133 = _1025 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1139 = _1127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _1103;
    out.m_56.y = _1109;
    out.m_58.x = _1135;
    out.m_58.y = _1139;
    out.m_58.z = _1141;
    bool _1149 = _1129 > 0.0;
    out.m_60.x = _1143;
    out.m_60.y = _1145;
    out.m_60.z = _1147;
    out.m_60.w = _1137;
    bool _1151 = !_1149;
    float _1153 = _1145;
    float _1155 = _1139;
    float _1157 = _1135;
    float _1159 = _1093;
    float _1161 = _1097;
    float _1163 = _1095;
    float _1165 = _1139;
    if (!_1151)
    {
        bool _1167 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1169 = _1137;
        if (_1167)
        {
            float _1171 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1169 = _1171;
        }
        float _1173 = _1169;
        if (_1167)
        {
            float _1175 = _455 * _1173;
            _1153 = _1175;
        }
        float _1177 = _1153;
        float _1179 = _1177;
        if (_1167)
        {
            float _1181 = _463 * _1173;
            _1155 = _1181;
        }
        float _1183 = _1155;
        float _1185 = _1183;
        if (_1167)
        {
            float _1187 = _457 * _1173;
            _1157 = _1187;
        }
        float _1189 = _1157;
        float _1191 = _1189;
        float _1193 = _1189;
        if (!_1167)
        {
            float _1195 = _117 + 1.0;
            float _1197 = _1195;
            if (!_155)
            {
                float _1199 = _1195 * _1195;
                float _1201 = _1199 * 0.5;
                _1191 = _1201;
            }
            float _1203 = _1191;
            float _1205 = _1203;
            if (!_155)
            {
                float _1207 = _1203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1205 = _1207;
            }
            float _1209 = _1205;
            bool _1211 = !_155;
            float _1213 = _1209;
            if (!_1211)
            {
                float _1215 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1217 = log2(_1215);
                float _1219 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1221 = _1219 + 1.0;
                float _1223 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1225 = _1217 * _1195;
                float _1227 = 1.0 / _1221;
                float _1229 = _1223 * 0.693147182464599609375;
                float _1231 = exp2(_1225);
                float _1233 = 1.0 / _1229;
                float _1235 = _1231 + (-1.0);
                float _1237 = -_1235;
                float _1239 = fma(_1237, _1233, _1195);
                float _1241 = _1239 * _1227;
                float _1243 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1213 = _1243;
            }
            float _1245 = _1213;
            float _1247 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1249 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1251 = !_155;
            if (!_1251)
            {
                float _1253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1255 = log2(_1253);
                float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1259 = _1257 + 1.0;
                float _1261 = 1.0 / _1259;
                float _1263 = _1255 * _1195;
                float _1265 = exp2(_1263);
                float _1267 = -_1265;
                float _1269 = _1267 + 1.0;
                float _1271 = _1269 * _1261;
                _1197 = _1271;
            }
            float _1273 = _1197;
            float _1275 = fma(_1273, _169, _1249);
            float _1277 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1279 = fma(_1273, _167, _1247);
            float _1281 = -_405;
            float _1283 = _1281 + _1275;
            float _1285 = fma(_1273, _171, _1277);
            float _1287 = -_401;
            float _1289 = _1287 + _1279;
            float _1291 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1293 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1295 = _1283 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1297 = -_411;
            float _1299 = _1297 + _1285;
            float _1301 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1291);
            float _1303 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1293);
            float _1305 = fma(_1289, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1295);
            float _1307 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1301);
            float _1309 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1303);
            float _1311 = fma(_1299, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1305);
            _471 = _1309;
            _473 = _1307;
            _475 = _1311;
            _1179 = _1307;
            _1185 = _1309;
            _1193 = _1311;
        }
        float _1313 = _471;
        float _1315 = _473;
        float _1317 = _475;
        float _1319 = _1179;
        float _1321 = _1185;
        float _1323 = _1193;
        float _1325 = _1313 * _1313;
        float _1327 = rsqrt(_1123);
        float _1329 = fma(_1315, _1315, _1325);
        float _1331 = fma(_1317, _1317, _1329);
        float _1333 = sqrt(_1331);
        float _1335 = _1107 * _1327;
        float _1337 = _1101 * _1327;
        float _1339 = _1115 * _1327;
        bool _1341 = _1333 > 0.0;
        bool _1343 = !_1341;
        _1165 = _1321;
        _477 = _1317;
        if (!_1343)
        {
            float _1345 = rsqrt(_1331);
            float _1347 = _1345 * _1313;
            float _1349 = _1345 * _1315;
            float _1351 = _1345 * _1317;
            float _1353 = _1337 * _1347;
            float _1355 = fma(_1335, _1349, _1353);
            float _1357 = fma(_1339, _1351, _1355);
            float _1359 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1361 = fma(_1319, _1359, _1095);
            float _1363 = fma(_1321, _1359, _1093);
            float _1365 = fma(_1323, _1359, _1097);
            _1159 = _1363;
            _1161 = _1365;
            _1163 = _1361;
        }
    }
    float _1367 = _1159;
    float _1369 = _1161;
    float _1371 = _1163;
    float _1373 = _1165;
    float _1375 = _477;
    float _1377 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1379 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1381 = isnan(0.5);
    bool _1383 = _1379 || _1381;
    bool _1385 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1387 = _1383 || _1385;
    float _1389 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1377);
    float _1391 = _1003 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1393 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1395 = isnan(0.5);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1401 = _1397 || _1399;
    float _1403 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1389);
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1407 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1391);
    float _1409 = 1.0 / _1405;
    float _1411 = fma(_883, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1407);
    float _1413 = _1373;
    float _1415 = _1405;
    float _1417 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1419 = _1375;
    if (_1387)
    {
        _1413 = _1367;
    }
    float _1421 = _1413;
    float _1423 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1405;
    float _1427 = _1421;
    if (_1387)
    {
        _1415 = _1369;
    }
    float _1429 = _1415;
    float _1431 = _1425 * _1409;
    float _1433 = _1431 * 0.5;
    float _1435 = _1409;
    float _1437 = _1429;
    if (_1401)
    {
        _1435 = 1.0;
    }
    float _1439 = _1435;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1443 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1441);
    float _1445 = _1443;
    float _1447 = _1439;
    if (_1387)
    {
        _1417 = _1371;
    }
    float _1449 = _1417;
    float _1451 = 1.0 / _1443;
    float _1453 = _1449;
    if (!_1387)
    {
        float _1455 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1457 = _1003 + _1455;
        float _1459 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1461 = _885 + _1459;
        float _1463 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = -_1003;
        float _1467 = _1465 + _1367;
        float _1469 = _1457 * _1457;
        float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1473 = _883 + _1471;
        float _1475 = -_883;
        float _1477 = _1475 + _1369;
        float _1479 = fma(_1461, _1461, _1469);
        float _1481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1483 = fma(_1473, _1473, _1479);
        float _1485 = sqrt(_1483);
        float _1487 = _1463 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1489 = precise::min(_1485, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1491 = _1489 * _1481;
        float _1493 = -_885;
        float _1495 = _1493 + _1371;
        float _1497 = _1487 * _1491;
        float _1499 = fma(_1495, _1497, _885);
        float _1501 = fma(_1467, _1497, _1003);
        float _1503 = fma(_1477, _1497, _883);
        _1427 = _1501;
        _1453 = _1499;
        _1437 = _1503;
        _1445 = _1485;
    }
    float _1505 = _1427;
    float _1507 = _1453;
    float _1509 = _1437;
    float _1511 = _1445;
    float _1513 = _1511;
    if (_1401)
    {
        _1513 = 1.0;
    }
    float _1515 = _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1519 = _1451 * _1517;
    float _1521 = _1515;
    float _1523 = _1519;
    if (!_1401)
    {
        float _1525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1531 = _1527 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        float _1535 = _1529 * 0.15915493667125701904296875;
        float _1537 = _1527 * 6.283185482025146484375;
        float _1539 = sin(_1537);
        float _1541 = 1.0 / _1533;
        float _1543 = _1535 * 6.283185482025146484375;
        float _1545 = cos(_1543);
        float _1547 = _1539 * _1541;
        float _1549 = _1535 * 6.283185482025146484375;
        float _1551 = sin(_1549);
        float _1553 = _1545 * _1547;
        float _1555 = 1.0 / _1553;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1557;
        float _1561 = 1.0 / _1559;
        float _1563 = _1551 * _1555;
        float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1567 = fma(_1519, _1563, _1565);
        float _1569 = _1567 * _1561;
        float _1571 = precise::clamp(_1569, 0.0, 1.0);
        _1447 = _1571;
    }
    float _1573 = _1447;
    if (!_1401)
    {
        float _1575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1577 = _1575 * 0.15915493667125701904296875;
        float _1579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = _1577 * 6.283185482025146484375;
        float _1583 = cos(_1581);
        float _1585 = _1579 * 0.15915493667125701904296875;
        float _1587 = _1577 * 6.283185482025146484375;
        float _1589 = sin(_1587);
        float _1591 = 1.0 / _1583;
        float _1593 = _1585 * 6.283185482025146484375;
        float _1595 = cos(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = _1585 * 6.283185482025146484375;
        float _1601 = sin(_1599);
        float _1603 = _1595 * _1597;
        float _1605 = 1.0 / _1603;
        float _1607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1607;
        float _1611 = 1.0 / _1609;
        float _1613 = _1601 * _1605;
        float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1617 = fma(_1519, _1613, _1615);
        float _1619 = _1617 * _1611;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        float _1623 = -_1621;
        float _1625 = _1623 + 1.0;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1631 = _1505 + _1629;
    float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1635 = _1507 + _1633;
    float _1637 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1639 = _1509 + _1637;
    float _1641 = _1631 * _1631;
    float _1643 = fma(_1635, _1635, _1641);
    float _1645 = fma(_1639, _1639, _1643);
    float _1647 = rsqrt(_1645);
    float _1649 = _1647 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1651 = _1635 * _1649;
    float _1653 = _1639 * _1649;
    float _1655 = _1651 * _1651;
    float _1657 = _1653 * _1653;
    float _1659 = _1655 + _1657;
    float _1661 = sqrt(_1659);
    bool _1663 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1667 = _1661 + _1665;
    float _1669 = _1647;
    float _1671 = _1659;
    float _1673 = _1667;
    float _1675 = _1631;
    float _1677 = _1651;
    if (_1663)
    {
        float _1679 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1669 = _1679;
    }
    float _1681 = _1669;
    if (_1663)
    {
        float _1683 = rsqrt(_1659);
        _1671 = _1683;
    }
    float _1685 = _1671;
    if (_1663)
    {
        float _1687 = _1667 * _1681;
        _1673 = _1687;
    }
    float _1689 = _1673;
    if (_1663)
    {
        float _1691 = _1689 * 0.15915493667125701904296875;
        _1523 = _1691;
    }
    float _1693 = _1523;
    float _1695 = _1681;
    if (_1663)
    {
        float _1697 = _1693 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        _1695 = _1699;
    }
    float _1701 = _1695;
    float _1703 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1705 = precise::max(0.0, _1703);
    float _1707 = _1639;
    float _1709 = _1705;
    if (_1663)
    {
        float _1711 = _1693 * 6.283185482025146484375;
        float _1713 = cos(_1711);
        _1707 = _1713;
    }
    float _1715 = _1707;
    float _1717 = -_1649;
    float _1719 = -_1705;
    float _1721 = fma(_1631, _1717, _1719);
    float _1723 = _1721;
    if (!_1663)
    {
        _1675 = _1653;
    }
    float _1725 = _1675;
    float _1727 = _1725;
    if (_1663)
    {
        float _1729 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1709 = _1729;
    }
    float _1731 = _1709;
    float _1733 = sqrt(_1645);
    float _1735 = _1701;
    float _1737 = _1731;
    if (_1663)
    {
        float _1739 = fma(_1701, _1731, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1739;
    }
    float _1741 = _1735;
    float _1743 = _1741;
    float _1745 = _1715;
    if (_1663)
    {
        float _1747 = _1715 + (-1.0);
        _1737 = _1747;
    }
    float _1749 = _1737;
    float _1751 = _1749;
    if (_1663)
    {
        float _1753 = _1685 * _1741;
        _1419 = _1753;
    }
    float _1755 = _1419;
    if (_1663)
    {
        float _1757 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1743 = _1757;
    }
    float _1759 = _1743;
    if (_1663)
    {
        float _1761 = _1651 * _1755;
        _1677 = _1761;
    }
    float _1763 = _1677;
    if (!_1663)
    {
        _1751 = _1655;
    }
    float _1765 = _1751;
    float _1767 = _1765;
    if (_1663)
    {
        float _1769 = _1653 * _1755;
        _1727 = _1769;
    }
    float _1771 = _1727;
    if (_1663)
    {
        float _1773 = fma(_1721, _1715, _1759);
        _1723 = _1773;
    }
    float _1775 = _1723;
    if (_1663)
    {
        float _1777 = _1763 * _1763;
        _1767 = _1777;
    }
    float _1779 = _1767;
    if (!_1663)
    {
        _1745 = _1657;
    }
    float _1781 = _1745;
    float _1783 = _1781;
    if (_1663)
    {
        float _1785 = _1771 * _1771;
        _1783 = _1785;
    }
    float _1787 = _1783;
    float _1789 = fma(_1775, _1775, _1779);
    float _1791 = _1789 + _1787;
    float _1793 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1797 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1795);
    float _1799 = precise::clamp(_1797, 0.0, 1.0);
    float _1801 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1803 = rsqrt(_1791);
    float _1805 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1793);
    float _1807 = -_1799;
    float _1809 = _1807 + 1.0;
    float _1811 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1801);
    float _1813 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1815 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1805);
    float _1817 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1819 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1821 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1811);
    float _1823 = _1815 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1825 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1817);
    float _1827 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1819);
    float _1829 = _1821 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1831 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1833 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1825);
    float _1835 = fma(_1509, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1827);
    float _1837 = abs(_1809);
    float _1839 = log2(_1837);
    float _1841 = _1803 * _1763;
    float _1843 = -_1831;
    float _1845 = fma(_1843, _1813, 1.0);
    float _1847 = _1833 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1849 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1851 = _1835 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1853 = _1803 * _1775;
    float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1857 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1849);
    float _1859 = _1803 * _1771;
    float _1861 = log2(_1845);
    float _1863 = -_1855;
    float _1865 = fma(_1853, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1863);
    float _1867 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1857);
    float _1869 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1871 = _1853 + 1.0;
    float _1873 = -_1859;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1865);
    float _1877 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1867);
    float _1879 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1881 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1883 = fma(_1875, -0.5, 0.5);
    float _1885 = 1.0 / _1877;
    float _1887 = fma(_1875, 0.5, 0.5);
    float _1889 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1881);
    float _1891 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1869);
    float _1893 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1889);
    float _1895 = fma(_1887, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = exp2(_1879);
    float _1899 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1891);
    float _1901 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1893);
    float _1903 = fma(_1887, _1895, -0.212114393711090087890625);
    float _1905 = _1861 * 0.693147182464599609375;
    float _1907 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1899);
    float _1909 = fma(_1887, _1903, 1.570728778839111328125);
    float _1911 = sqrt(_1883);
    float _1913 = _1901 * _1885;
    float _1915 = _1907 * _1885;
    float _1917 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1919 = fma(_1913, 0.5, 0.5);
    float _1921 = fma(_1915, -0.5, 0.5);
    float _1923 = -_1853;
    float _1925 = fma(_1897, _1871, _1923);
    float3 _4976 = float3(_1919, _1921, _1917);
    float _1927 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4976, float3(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4976, float3(0.0), isnan(_4976)), level(0.0)).x;
    float _1929 = fma(_1925, 0.5, 0.5);
    float _1931 = _1911 * 0.636619746685028076171875;
    float _1933 = -_1909;
    float _1935 = fma(_1931, _1933, 1.0);
    float3 _4997 = float3(_1919, _1921, _1917);
    float4 _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4997, float3(0.0), isnan(_4997)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4997, float3(0.0), isnan(_4997)), level(0.0)).xyzw;
    float _1940 = _1938.x;
    float _1942 = _1938.y;
    float _1944 = _1938.z;
    float _1946 = _1938.w;
    float2 _5014 = float2(_1935, _1929);
    float3 _1950 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5014, float2(0.0), isnan(_5014)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5014, float2(0.0), isnan(_5014)), level(0.0)).xyz;
    float _1952 = _1950.x;
    float _1954 = _1950.y;
    float _1956 = _1950.z;
    float _1958 = _1839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1960 = _1829 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1962 = _1573 > 0.0;
    bool _1964 = isnan(_1573);
    bool _1966 = _1962 || _1964;
    bool _1968 = isnan(0.0);
    bool _1970 = _1966 || _1968;
    float _1972 = _1573 * _1627;
    float _1974 = fma(_1847, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1960);
    float _1976 = exp2(_1958);
    bool _1978 = _1627 <= 0.0;
    bool _1980 = !_1970;
    bool _1982 = _1978 || _1980;
    float _1984 = fma(_1823, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1974);
    float _1986 = _1972 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1988 = fma(_1851, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1984);
    float _1990 = _1986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1992 = _1988 + _1877;
    out.gl_Position.x = _1901;
    out.gl_Position.y = _1907;
    out.gl_Position.z = _1988;
    out.gl_Position.w = _1877;
    float _1994 = _1992 * 0.5;
    float _1996 = -_1976;
    float _1998 = _1996 + 1.0;
    out.m_45.x = _1990;
    float _2000 = _1998 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _1994;
    out.m_62.w = _1877;
    float _2002 = _2000 * _1927;
    float _2004 = -_2000;
    float _2006 = _2004 + 1.0;
    float _2008 = _1946 * _2002;
    float _2010 = _1956 * _2002;
    float _2012 = fma(_1952, _2008, _1940);
    float _2014 = fma(_1954, _2008, _1942);
    float _2016 = _1946 * _2006;
    float _2018 = fma(_1946, _2010, _1944);
    out.m_64.x = _2012;
    out.m_64.y = _2014;
    out.m_64.z = _2018;
    out.m_64.w = _2016;
    if (!_1982)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2020;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

