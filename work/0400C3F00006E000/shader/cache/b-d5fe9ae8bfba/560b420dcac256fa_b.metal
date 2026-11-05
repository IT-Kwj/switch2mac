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
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_105);
        out.gl_Position.z = _2009;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_141);
        out.gl_Position.z = _2078;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _147 * _145;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    int _177 = as_type<int>(_149) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_149) & 2;
    bool _183 = _181 != 0;
    float _185 = _149;
    float _187 = _151;
    if (!_161)
    {
        float _189 = _151 * _151;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _173 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    bool _201 = !_179;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _193;
    if (!_161)
    {
        float _207 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_183;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = -_175;
    float _221 = _165 + _219;
    bool _223 = !_161;
    float _225 = _209;
    float _227 = _217;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _151 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _151);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_161;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _151 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _187 = _281;
    }
    float _283 = _187;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_213, 0.5, 0.5);
    bool _297 = _221 < 0.5;
    float _299 = float(_297);
    float _301 = -_221;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _167, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_283, _169, _335);
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _347 = fma(_283, _171, _341);
    int _349 = abs(_339);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_331, _285, _305);
    float _361 = fma(_347, _285, _309);
    float _363 = float(_349);
    float _365 = fma(_353, _327, _357);
    float _367 = fma(_343, _285, _307);
    float _369 = abs(_323);
    float _371 = fma(_363, _369, _365);
    bool _373 = !_345;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _123 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _587 = isnan(_553);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _569;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = _553 + _599;
    bool _603 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _605 = isnan(_553);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_553);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _565;
    float _629 = _601 * _575;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _633 = _553 + _631;
    bool _635 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_553);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _647;
    float _651 = 1.0 / _583;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _655 = _553 + _653;
    float _657 = _633 * _597;
    bool _659 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _661 = isnan(_553);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = fma(_649, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _573;
    float _677 = _655 * _627;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _681 = _553 + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _687;
    float _691 = _595 * _685;
    float _693 = 1.0 / _579;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _695;
    float _699 = _681 * _651;
    float _701 = -_595;
    float _703 = _701 + 1.0;
    float _705 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _707 = _613 * _703;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _715 = _553 + _713;
    float _717 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _719 = _715 * _675;
    bool _721 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _723 = isnan(_553);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _557 * _693;
    float _735 = fma(_697, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -_613;
    float _739 = _737 + 1.0;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _731 * _739;
    bool _755 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _757 = isnan(_553);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _625 * _743;
    float _769 = -_625;
    float _771 = _769 + 1.0;
    float _773 = fma(_747, _677, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_751, _677, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = _765 * _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _791;
    float _795 = _645 * _779;
    float _797 = fma(_785, _733, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _799 = fma(_789, _733, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _801 = fma(_793, _733, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _803 = _671 * _795;
    float _805 = -_645;
    float _807 = _805 + 1.0;
    float _809 = _705 * _795;
    float _811 = _735 * _795;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _803);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _809);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _827 = fma(_775, _781, _817);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _833 = fma(_773, _781, _819);
    float _835 = fma(_717, _781, _821);
    float _837 = fma(_815, _699, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_825, _699, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_831, _699, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_797, _767, _833);
    float _845 = fma(_799, _767, _835);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_801, _767, _827);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _657, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _657, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _657, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_865, _707, _861);
    float _887 = fma(_873, _719, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _889 = fma(_877, _719, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _891 = fma(_883, _719, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _707, _863);
    float _895 = fma(_879, _707, _869);
    float _897 = fma(_887, _691, _885);
    float _899 = fma(_889, _691, _893);
    float _901 = fma(_891, _691, _895);
    float _903 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_673;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_89);
        float _931 = 1.0 / _929;
        float _933 = _123 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = in.m_58.x;
    float _939 = in.m_58.y;
    float _941 = in.m_58.z;
    float _943 = in.m_58.w;
    float _945 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _947 = _143 > 0.5;
    float _949 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = in.m_60.x;
    float _953 = in.m_60.y;
    float _955 = in.m_60.z;
    float _957 = in.m_60.w;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _961 = _949 * _959;
    float _963 = in.m_51.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = 1.0 / _967;
    float _979 = _367 * _939;
    float _981 = -_203;
    int _983 = _947 ? as_type<int>(_981) : as_type<int>(_203);
    float _985 = _367 * _953;
    float _987 = fma(_359, _937, _979);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    bool _991 = !_971;
    float _993 = _991 ? _203 : as_type<float>(_983);
    float _995 = fma(_359, _951, _985);
    float _997 = fma(_361, _941, _987);
    float _999 = _945 * _989;
    float _1001 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1003 = fma(_361, _955, _995);
    float _1005 = _997 + _943;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = in.m_62.x;
    float _1011 = in.m_62.y;
    float _1013 = in.m_62.z;
    float _1015 = in.m_62.w;
    float _1017 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = _1003 + _957;
    float _1021 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    bool _1023 = _963 > 0.5;
    float _1025 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1021);
    bool _1029 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1031 = isnan(_935);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    bool _1043 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1045 = isnan(_935);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1063 = _1005 + _1055;
    float _1065 = 1.0 / _1059;
    float _1067 = _1019 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1075 = _1067 + _1073;
    float _1077 = _367 * _1011;
    float _1079 = _1071 * _1071;
    float _1081 = _1075 * _1075;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1085 = _935 + _1083;
    float _1087 = fma(_359, _1009, _1077);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1089;
    float _1093 = _1079 + _1081;
    bool _1095 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_935);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = fma(_361, _1013, _1087);
    float _1109 = _1091 * _977;
    float _1111 = sqrt(_1093);
    float _1113 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1115 = -_1039;
    float _1117 = _1115 + 1.0;
    float _1119 = fma(_1109, _1085, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1107 + _1015;
    float _1123 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = _1053 * _1117;
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _935 + _1137;
    float _1141 = -_217;
    float _1143 = _1023 ? _1141 : _217;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = _1127 * _1065;
    float _1151 = _1119 * _1129;
    bool _1153 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1121 + _1147;
    float _1157 = -_1053;
    float _1159 = _1157 + 1.0;
    bool _1161 = !_975;
    float _1163 = _1161 ? _217 : _1143;
    float _1165 = _1039 * _1133;
    float _1167 = fma(_1149, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = _1143;
    float _1173 = _1079;
    float _1175 = _1063;
    float _1177 = _1067;
    if (!_1153)
    {
        _1171 = _1081;
    }
    float _1179 = _1171;
    float _1181 = _1179;
    if (!_1153)
    {
        _227 = _1155;
    }
    float _1183 = _227;
    bool _1185 = !_1153;
    float _1187 = _1183;
    float _1189 = _1145;
    if (!_1185)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1111 + _1193;
        float _1197 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = rsqrt(_1093);
        float _1201 = _1195 * _1191;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        float _1213 = fma(_1207, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1199 * _1213;
        float _1217 = _1211 + (-1.0);
        float _1219 = fma(_1071, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = fma(_1075, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1223 = _1217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1231 = _1221 + _1229;
        float _1233 = fma(_1155, _1211, _1223);
        float _1235 = _1227 * _1227;
        float _1237 = _1231 * _1231;
        _1187 = _1233;
        _1173 = _1235;
        _1181 = _1237;
        _1175 = _1219;
        _1177 = _1221;
    }
    float _1239 = _1187;
    float _1241 = _1173;
    float _1243 = _1181;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1251 = _1239 + _1249;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1255 = _993 + 0.5;
    float _1257 = fma(_1167, _1165, _1169);
    float _1259 = fma(_1251, _1251, _1241);
    float _1261 = -_1163;
    float _1263 = _1261 + 0.5;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1267 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1257);
    float _1269 = _1259 + _1243;
    float _1271 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1275 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = _1265 * _1145;
    float _1281 = sqrt(_1269);
    float _1283 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1273 * _1253;
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1279;
    out.m_64.y = _1287;
    out.m_66.x = _1283;
    out.m_66.y = _1285;
    out.m_66.z = _1289;
    out.m_66.w = _1291;
    bool _1293 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1281);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1251;
    float _1305 = _1289;
    float _1307 = _1285;
    float _1309 = _1291;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1311 = _1303;
    bool _1313 = !_1301;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1281);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1281 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1281);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1281 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1239 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1245 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1247 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1401 = _1391 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = rsqrt(_1411);
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1417 = _1401 * _1415;
    float _1419 = _1405 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 * _1419;
    float _1425 = _1421 + _1423;
    float _1427 = sqrt(_1425);
    bool _1429 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1433 = _1427 + _1431;
    float _1435 = _1405;
    float _1437 = _1425;
    float _1439 = _1433;
    float _1441 = _1397;
    if (_1429)
    {
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (_1429)
    {
        float _1447 = rsqrt(_1425);
        _1437 = _1447;
    }
    float _1449 = _1437;
    if (_1429)
    {
        float _1451 = _1433 * _1445;
        _1439 = _1451;
    }
    float _1453 = _1439;
    if (_1429)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1305 = _1455;
    }
    float _1457 = _1305;
    float _1459 = _1413;
    if (_1429)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1445;
    float _1473 = _1469;
    if (_1429)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1415;
    float _1483 = -_1469;
    float _1485 = fma(_1397, _1481, _1483);
    if (_1429)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1487;
    }
    float _1489 = _1441;
    float _1491 = _1465;
    float _1493 = _1489;
    if (_1429)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1495;
    }
    float _1497 = _1307;
    float _1499 = _1497;
    if (!_1429)
    {
        _1491 = _1417;
    }
    float _1501 = _1491;
    float _1503 = _1501;
    if (!_1429)
    {
        _1493 = _1485;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    float _1509 = _1479;
    if (_1429)
    {
        float _1511 = _1479 + (-1.0);
        _1473 = _1511;
    }
    float _1513 = _1473;
    float _1515 = _1513;
    if (_1429)
    {
        float _1517 = _1449 * _1497;
        _1189 = _1517;
    }
    float _1519 = _1189;
    if (!_1429)
    {
        _1499 = _1421;
    }
    float _1521 = _1499;
    float _1523 = sqrt(_1411);
    float _1525 = _1521;
    if (_1429)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1527;
    }
    float _1529 = _1309;
    if (_1429)
    {
        float _1531 = _1417 * _1519;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (!_1429)
    {
        _1515 = _1419;
    }
    float _1535 = _1515;
    float _1537 = _1535;
    if (_1429)
    {
        float _1539 = _1419 * _1519;
        _1537 = _1539;
    }
    float _1541 = _1537;
    if (_1429)
    {
        float _1543 = fma(_1485, _1479, _1529);
        _1507 = _1543;
    }
    float _1545 = _1507;
    if (_1429)
    {
        float _1547 = _1533 * _1533;
        _1525 = _1547;
    }
    float _1549 = _1525;
    if (!_1429)
    {
        _1509 = _1423;
    }
    float _1551 = _1509;
    float _1553 = _1551;
    if (_1429)
    {
        float _1555 = _1541 * _1541;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1573 = rsqrt(_1561);
    float _1575 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1563);
    float _1577 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1575);
    float _1585 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1577);
    float _1589 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = abs(_1581);
    float _1593 = log2(_1591);
    float _1595 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1599 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1587);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1573 * _1533;
    float _1609 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1611 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1573 * _1545;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = -_1603;
    float _1619 = fma(_1617, _1571, 1.0);
    float _1621 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = _1573 * _1541;
    float _1629 = -_1615;
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1623);
    float _1635 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = log2(_1619);
    float _1639 = -_1627;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1641, -0.5, 0.5);
    float _1649 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1653 = exp2(_1635);
    float _1655 = fma(_1641, 0.5, 0.5);
    float _1657 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1659 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1651);
    float _1661 = _1613 + 1.0;
    float _1663 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1657);
    float _1667 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1669 = 1.0 / _1649;
    float _1671 = fma(_1655, _1663, -0.212114393711090087890625);
    float _1673 = _1637 * 0.693147182464599609375;
    float _1675 = fma(_1655, _1671, 1.570728778839111328125);
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = sqrt(_1647);
    float _1681 = -_1613;
    float _1683 = fma(_1653, _1661, _1681);
    float _1685 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1687 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1665);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = _1685 * _1669;
    float _1693 = _1687 * _1669;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1679 * 0.636619746685028076171875;
    float _1701 = -_1675;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4587 = float3(_1695, _1697, _1677);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4587, float3(0.0), isnan(_4587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4587, float3(0.0), isnan(_4587)), level(0.0)).x;
    float3 _4598 = float3(_1695, _1697, _1677);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4615 = float2(_1703, _1689);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4615, float2(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4615, float2(0.0), isnan(_4615)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1734 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1736 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1732);
    float _1738 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1744 = 1.0 / _1740;
    float _1746 = _1742 + _1740;
    float _1748 = _1746 * _1744;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1758 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1760 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.5);
    bool _1768 = _1764 || _1766;
    float _1770 = 1.0 / _1754;
    float _1772 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1758);
    float _1774 = exp2(_1756);
    float _1776 = _1609;
    float _1778 = _1758;
    if (_1768)
    {
        _1776 = 1.0;
    }
    float _1780 = _1776;
    float _1782 = _1780;
    if (_1768)
    {
        _1778 = 1.0;
    }
    float _1784 = _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1788 = _1770 * _1786;
    float _1790 = _1784;
    if (!_1768)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1796 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1794;
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = 1.0 / _1796;
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1798 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1802 * 0.15915493667125701904296875;
        float _1810 = _1798 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1806;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = 1.0 / _1826;
        float _1830 = _1824 * _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1834 = fma(_1788, _1830, _1832);
        float _1836 = _1834 * _1800;
        float _1838 = precise::clamp(_1836, 0.0, 1.0);
        _1782 = _1838;
    }
    float _1840 = _1782;
    if (!_1768)
    {
        float _1842 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1852 = _1850 * 0.15915493667125701904296875;
        float _1854 = _1844 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        float _1858 = 1.0 / _1848;
        float _1860 = _1852 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1856 * _1858;
        float _1866 = _1852 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = 1.0 / _1870;
        float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1874;
        float _1878 = 1.0 / _1876;
        float _1880 = _1868 * _1872;
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = fma(_1788, _1880, _1882);
        float _1886 = _1884 * _1878;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        float _1890 = -_1888;
        float _1892 = _1890 + 1.0;
        _1790 = _1892;
    }
    float _1894 = _1790;
    float _1896 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1898 = -_1774;
    float _1900 = _1898 + 1.0;
    float _1902 = _1840 * _1894;
    bool _1904 = _1840 > 0.0;
    bool _1906 = isnan(_1840);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1916 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1918 = _1894 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    float _1924 = _1914 + _1649;
    float _1926 = _371 * _1916;
    float _1928 = _1924 * 0.5;
    float _1930 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1685;
    out.gl_Position.y = _1687;
    out.gl_Position.z = _1914;
    out.gl_Position.w = _1649;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * _1705;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    out.m_68.z = _1928;
    out.m_68.w = _1649;
    float _1940 = _1716 * _1934;
    float _1942 = _1726 * _1934;
    out.m_47.x = _1932;
    float _1944 = fma(_1722, _1940, _1710);
    float _1946 = fma(_1724, _1940, _1712);
    float _1948 = _1716 * _1938;
    float _1950 = fma(_1716, _1942, _1714);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1950;
    out.m_70.w = _1948;
    if (!_1922)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1952;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_105);
        out.gl_Position.z = _2009;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_141);
        out.gl_Position.z = _2078;
    }
    if (_133)
    {
        return out;
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _147 * _145;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    int _177 = as_type<int>(_149) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_149) & 2;
    bool _183 = _181 != 0;
    float _185 = _149;
    float _187 = _151;
    if (!_161)
    {
        float _189 = _151 * _151;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _173 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    bool _201 = !_179;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _193;
    if (!_161)
    {
        float _207 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_183;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = -_175;
    float _221 = _165 + _219;
    bool _223 = !_161;
    float _225 = _209;
    float _227 = _217;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _151 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _151);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_161;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _151 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _187 = _281;
    }
    float _283 = _187;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_213, 0.5, 0.5);
    bool _297 = _221 < 0.5;
    float _299 = float(_297);
    float _301 = -_221;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _167, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_283, _169, _335);
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _347 = fma(_283, _171, _341);
    int _349 = abs(_339);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_331, _285, _305);
    float _361 = fma(_347, _285, _309);
    float _363 = float(_349);
    float _365 = fma(_353, _327, _357);
    float _367 = fma(_343, _285, _307);
    float _369 = abs(_323);
    float _371 = fma(_363, _369, _365);
    bool _373 = !_345;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _123 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _587 = isnan(_553);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _569;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = _553 + _599;
    bool _603 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _605 = isnan(_553);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_553);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _565;
    float _629 = _601 * _575;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _633 = _553 + _631;
    bool _635 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_553);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _647;
    float _651 = 1.0 / _583;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _655 = _553 + _653;
    float _657 = _633 * _597;
    bool _659 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _661 = isnan(_553);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = fma(_649, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _573;
    float _677 = _655 * _627;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _681 = _553 + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _687;
    float _691 = _595 * _685;
    float _693 = 1.0 / _579;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _695;
    float _699 = _681 * _651;
    float _701 = -_595;
    float _703 = _701 + 1.0;
    float _705 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _707 = _613 * _703;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _715 = _553 + _713;
    float _717 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _719 = _715 * _675;
    bool _721 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _723 = isnan(_553);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _557 * _693;
    float _735 = fma(_697, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -_613;
    float _739 = _737 + 1.0;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _731 * _739;
    bool _755 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _757 = isnan(_553);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _625 * _743;
    float _769 = -_625;
    float _771 = _769 + 1.0;
    float _773 = fma(_747, _677, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_751, _677, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = _765 * _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _791;
    float _795 = _645 * _779;
    float _797 = fma(_785, _733, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _799 = fma(_789, _733, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _801 = fma(_793, _733, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _803 = _671 * _795;
    float _805 = -_645;
    float _807 = _805 + 1.0;
    float _809 = _705 * _795;
    float _811 = _735 * _795;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _803);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _809);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _827 = fma(_775, _781, _817);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _833 = fma(_773, _781, _819);
    float _835 = fma(_717, _781, _821);
    float _837 = fma(_815, _699, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_825, _699, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_831, _699, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_797, _767, _833);
    float _845 = fma(_799, _767, _835);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_801, _767, _827);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _657, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _657, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _657, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_865, _707, _861);
    float _887 = fma(_873, _719, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _889 = fma(_877, _719, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _891 = fma(_883, _719, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _707, _863);
    float _895 = fma(_879, _707, _869);
    float _897 = fma(_887, _691, _885);
    float _899 = fma(_889, _691, _893);
    float _901 = fma(_891, _691, _895);
    float _903 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_673;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_89);
        float _931 = 1.0 / _929;
        float _933 = _123 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = in.m_58.x;
    float _939 = in.m_58.y;
    float _941 = in.m_58.z;
    float _943 = in.m_58.w;
    float _945 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _947 = _143 > 0.5;
    float _949 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = in.m_60.x;
    float _953 = in.m_60.y;
    float _955 = in.m_60.z;
    float _957 = in.m_60.w;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _961 = _949 * _959;
    float _963 = in.m_51.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = 1.0 / _967;
    float _979 = _367 * _939;
    float _981 = -_203;
    int _983 = _947 ? as_type<int>(_981) : as_type<int>(_203);
    float _985 = _367 * _953;
    float _987 = fma(_359, _937, _979);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    bool _991 = !_971;
    float _993 = _991 ? _203 : as_type<float>(_983);
    float _995 = fma(_359, _951, _985);
    float _997 = fma(_361, _941, _987);
    float _999 = _945 * _989;
    float _1001 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1003 = fma(_361, _955, _995);
    float _1005 = _997 + _943;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = in.m_62.x;
    float _1011 = in.m_62.y;
    float _1013 = in.m_62.z;
    float _1015 = in.m_62.w;
    float _1017 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = _1003 + _957;
    float _1021 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    bool _1023 = _963 > 0.5;
    float _1025 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1021);
    bool _1029 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1031 = isnan(_935);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    bool _1043 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1045 = isnan(_935);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1063 = _1005 + _1055;
    float _1065 = 1.0 / _1059;
    float _1067 = _1019 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1075 = _1067 + _1073;
    float _1077 = _367 * _1011;
    float _1079 = _1071 * _1071;
    float _1081 = _1075 * _1075;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1085 = _935 + _1083;
    float _1087 = fma(_359, _1009, _1077);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1089;
    float _1093 = _1079 + _1081;
    bool _1095 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_935);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = fma(_361, _1013, _1087);
    float _1109 = _1091 * _977;
    float _1111 = sqrt(_1093);
    float _1113 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1115 = -_1039;
    float _1117 = _1115 + 1.0;
    float _1119 = fma(_1109, _1085, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1107 + _1015;
    float _1123 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = _1053 * _1117;
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _935 + _1137;
    float _1141 = -_217;
    float _1143 = _1023 ? _1141 : _217;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = _1127 * _1065;
    float _1151 = _1119 * _1129;
    bool _1153 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1121 + _1147;
    float _1157 = -_1053;
    float _1159 = _1157 + 1.0;
    bool _1161 = !_975;
    float _1163 = _1161 ? _217 : _1143;
    float _1165 = _1039 * _1133;
    float _1167 = fma(_1149, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = _1143;
    float _1173 = _1079;
    float _1175 = _1063;
    float _1177 = _1067;
    if (!_1153)
    {
        _1171 = _1081;
    }
    float _1179 = _1171;
    float _1181 = _1179;
    if (!_1153)
    {
        _227 = _1155;
    }
    float _1183 = _227;
    bool _1185 = !_1153;
    float _1187 = _1183;
    float _1189 = _1145;
    if (!_1185)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1111 + _1193;
        float _1197 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = rsqrt(_1093);
        float _1201 = _1195 * _1191;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        float _1213 = fma(_1207, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1199 * _1213;
        float _1217 = _1211 + (-1.0);
        float _1219 = fma(_1071, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = fma(_1075, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1223 = _1217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1231 = _1221 + _1229;
        float _1233 = fma(_1155, _1211, _1223);
        float _1235 = _1227 * _1227;
        float _1237 = _1231 * _1231;
        _1187 = _1233;
        _1173 = _1235;
        _1181 = _1237;
        _1175 = _1219;
        _1177 = _1221;
    }
    float _1239 = _1187;
    float _1241 = _1173;
    float _1243 = _1181;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1251 = _1239 + _1249;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1255 = _993 + 0.5;
    float _1257 = fma(_1167, _1165, _1169);
    float _1259 = fma(_1251, _1251, _1241);
    float _1261 = -_1163;
    float _1263 = _1261 + 0.5;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1267 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1257);
    float _1269 = _1259 + _1243;
    float _1271 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1275 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = _1265 * _1145;
    float _1281 = sqrt(_1269);
    float _1283 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1273 * _1253;
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1279;
    out.m_64.y = _1287;
    out.m_66.x = _1283;
    out.m_66.y = _1285;
    out.m_66.z = _1289;
    out.m_66.w = _1291;
    bool _1293 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1281);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1251;
    float _1305 = _1289;
    float _1307 = _1285;
    float _1309 = _1291;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1311 = _1303;
    bool _1313 = !_1301;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1281);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1281 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1281);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1281 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1239 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1245 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1247 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1401 = _1391 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = rsqrt(_1411);
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1417 = _1401 * _1415;
    float _1419 = _1405 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 * _1419;
    float _1425 = _1421 + _1423;
    float _1427 = sqrt(_1425);
    bool _1429 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1433 = _1427 + _1431;
    float _1435 = _1405;
    float _1437 = _1425;
    float _1439 = _1433;
    float _1441 = _1397;
    if (_1429)
    {
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (_1429)
    {
        float _1447 = rsqrt(_1425);
        _1437 = _1447;
    }
    float _1449 = _1437;
    if (_1429)
    {
        float _1451 = _1433 * _1445;
        _1439 = _1451;
    }
    float _1453 = _1439;
    if (_1429)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1305 = _1455;
    }
    float _1457 = _1305;
    float _1459 = _1413;
    if (_1429)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1445;
    float _1473 = _1469;
    if (_1429)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1415;
    float _1483 = -_1469;
    float _1485 = fma(_1397, _1481, _1483);
    if (_1429)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1487;
    }
    float _1489 = _1441;
    float _1491 = _1465;
    float _1493 = _1489;
    if (_1429)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1495;
    }
    float _1497 = _1307;
    float _1499 = _1497;
    if (!_1429)
    {
        _1491 = _1417;
    }
    float _1501 = _1491;
    float _1503 = _1501;
    if (!_1429)
    {
        _1493 = _1485;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    float _1509 = _1479;
    if (_1429)
    {
        float _1511 = _1479 + (-1.0);
        _1473 = _1511;
    }
    float _1513 = _1473;
    float _1515 = _1513;
    if (_1429)
    {
        float _1517 = _1449 * _1497;
        _1189 = _1517;
    }
    float _1519 = _1189;
    if (!_1429)
    {
        _1499 = _1421;
    }
    float _1521 = _1499;
    float _1523 = sqrt(_1411);
    float _1525 = _1521;
    if (_1429)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1527;
    }
    float _1529 = _1309;
    if (_1429)
    {
        float _1531 = _1417 * _1519;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (!_1429)
    {
        _1515 = _1419;
    }
    float _1535 = _1515;
    float _1537 = _1535;
    if (_1429)
    {
        float _1539 = _1419 * _1519;
        _1537 = _1539;
    }
    float _1541 = _1537;
    if (_1429)
    {
        float _1543 = fma(_1485, _1479, _1529);
        _1507 = _1543;
    }
    float _1545 = _1507;
    if (_1429)
    {
        float _1547 = _1533 * _1533;
        _1525 = _1547;
    }
    float _1549 = _1525;
    if (!_1429)
    {
        _1509 = _1423;
    }
    float _1551 = _1509;
    float _1553 = _1551;
    if (_1429)
    {
        float _1555 = _1541 * _1541;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1573 = rsqrt(_1561);
    float _1575 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1563);
    float _1577 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1575);
    float _1585 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1577);
    float _1589 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = abs(_1581);
    float _1593 = log2(_1591);
    float _1595 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1599 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1587);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1573 * _1533;
    float _1609 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1611 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1573 * _1545;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = -_1603;
    float _1619 = fma(_1617, _1571, 1.0);
    float _1621 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = _1573 * _1541;
    float _1629 = -_1615;
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1623);
    float _1635 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = log2(_1619);
    float _1639 = -_1627;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1641, -0.5, 0.5);
    float _1649 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1653 = exp2(_1635);
    float _1655 = fma(_1641, 0.5, 0.5);
    float _1657 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1659 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1651);
    float _1661 = _1613 + 1.0;
    float _1663 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1657);
    float _1667 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1669 = 1.0 / _1649;
    float _1671 = fma(_1655, _1663, -0.212114393711090087890625);
    float _1673 = _1637 * 0.693147182464599609375;
    float _1675 = fma(_1655, _1671, 1.570728778839111328125);
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = sqrt(_1647);
    float _1681 = -_1613;
    float _1683 = fma(_1653, _1661, _1681);
    float _1685 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1687 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1665);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = _1685 * _1669;
    float _1693 = _1687 * _1669;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1679 * 0.636619746685028076171875;
    float _1701 = -_1675;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4587 = float3(_1695, _1697, _1677);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4587, float3(0.0), isnan(_4587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4587, float3(0.0), isnan(_4587)), level(0.0)).x;
    float3 _4598 = float3(_1695, _1697, _1677);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4615 = float2(_1703, _1689);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4615, float2(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4615, float2(0.0), isnan(_4615)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1734 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1736 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1732);
    float _1738 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1744 = 1.0 / _1740;
    float _1746 = _1742 + _1740;
    float _1748 = _1746 * _1744;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1758 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1760 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.5);
    bool _1768 = _1764 || _1766;
    float _1770 = 1.0 / _1754;
    float _1772 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1758);
    float _1774 = exp2(_1756);
    float _1776 = _1609;
    float _1778 = _1758;
    if (_1768)
    {
        _1776 = 1.0;
    }
    float _1780 = _1776;
    float _1782 = _1780;
    if (_1768)
    {
        _1778 = 1.0;
    }
    float _1784 = _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1788 = _1770 * _1786;
    float _1790 = _1784;
    if (!_1768)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1796 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1794;
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = 1.0 / _1796;
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1798 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1802 * 0.15915493667125701904296875;
        float _1810 = _1798 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1806;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = 1.0 / _1826;
        float _1830 = _1824 * _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1834 = fma(_1788, _1830, _1832);
        float _1836 = _1834 * _1800;
        float _1838 = precise::clamp(_1836, 0.0, 1.0);
        _1782 = _1838;
    }
    float _1840 = _1782;
    if (!_1768)
    {
        float _1842 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1852 = _1850 * 0.15915493667125701904296875;
        float _1854 = _1844 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        float _1858 = 1.0 / _1848;
        float _1860 = _1852 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1856 * _1858;
        float _1866 = _1852 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = 1.0 / _1870;
        float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1874;
        float _1878 = 1.0 / _1876;
        float _1880 = _1868 * _1872;
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = fma(_1788, _1880, _1882);
        float _1886 = _1884 * _1878;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        float _1890 = -_1888;
        float _1892 = _1890 + 1.0;
        _1790 = _1892;
    }
    float _1894 = _1790;
    float _1896 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1898 = -_1774;
    float _1900 = _1898 + 1.0;
    float _1902 = _1840 * _1894;
    bool _1904 = _1840 > 0.0;
    bool _1906 = isnan(_1840);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1916 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1918 = _1894 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    float _1924 = _1914 + _1649;
    float _1926 = _371 * _1916;
    float _1928 = _1924 * 0.5;
    float _1930 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1685;
    out.gl_Position.y = _1687;
    out.gl_Position.z = _1914;
    out.gl_Position.w = _1649;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * _1705;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    out.m_68.z = _1928;
    out.m_68.w = _1649;
    float _1940 = _1716 * _1934;
    float _1942 = _1726 * _1934;
    out.m_47.x = _1932;
    float _1944 = fma(_1722, _1940, _1710);
    float _1946 = fma(_1724, _1940, _1712);
    float _1948 = _1716 * _1938;
    float _1950 = fma(_1716, _1942, _1714);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1950;
    out.m_70.w = _1948;
    if (!_1922)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1952;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1345 = false;
    bool _927 = false;
    bool _545 = false;
    bool _391 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2009 = as_type<float>(_105);
        out.gl_Position.z = _2009;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2078 = as_type<float>(_141);
        out.gl_Position.z = _2078;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_51.x;
    float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _147 = _123 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = _147 * _145;
    float _165 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[20].x, _163);
    float _167 = in.m_49.x;
    float _169 = in.m_49.y;
    float _171 = in.m_49.z;
    float _173 = _165 * 6.283185482025146484375;
    float _175 = floor(_165);
    int _177 = as_type<int>(_149) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_149) & 2;
    bool _183 = _181 != 0;
    float _185 = _149;
    float _187 = _151;
    if (!_161)
    {
        float _189 = _151 * _151;
        float _191 = _189 * 0.5;
        _185 = _191;
    }
    float _193 = _185;
    float _195 = _173 * 0.15915493667125701904296875;
    int _197 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _199 = _197 != 0;
    bool _201 = !_179;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = _193;
    if (!_161)
    {
        float _207 = _193 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _207;
    }
    float _209 = _205;
    float _211 = _195 * 6.283185482025146484375;
    float _213 = cos(_211);
    bool _215 = !_183;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = -_175;
    float _221 = _165 + _219;
    bool _223 = !_161;
    float _225 = _209;
    float _227 = _217;
    if (!_223)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _151 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _151);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _225 = _257;
    }
    float _259 = _225;
    bool _261 = !_161;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _151 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _187 = _281;
    }
    float _283 = _187;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_213, 0.5, 0.5);
    bool _297 = _221 < 0.5;
    float _299 = float(_297);
    float _301 = -_221;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _317 = !_199;
    int _319 = _317 ? 0 : 1;
    float _321 = -_299;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _325 = -_295;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _329 = abs(_313);
    float _331 = fma(_283, _167, _315);
    int _333 = abs(_319);
    float _335 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _337 = !_293;
    int _339 = _337 ? 0 : 1;
    float _341 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = fma(_283, _169, _335);
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _347 = fma(_283, _171, _341);
    int _349 = abs(_339);
    float _351 = float(_329);
    float _353 = float(_333);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_331, _285, _305);
    float _361 = fma(_347, _285, _309);
    float _363 = float(_349);
    float _365 = fma(_353, _327, _357);
    float _367 = fma(_343, _285, _307);
    float _369 = abs(_323);
    float _371 = fma(_363, _369, _365);
    bool _373 = !_345;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_89);
        float _395 = 1.0 / _393;
        float _397 = _123 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _399 + _401;
    bool _405 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_399);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _419 = _399 + _417;
    bool _421 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _423 = isnan(_399);
    bool _425 = _421 || _423;
    bool _427 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _429 = _425 || _427;
    float _431 = float(_429);
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _433;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _441 = -_415;
    float _443 = _441 + 1.0;
    float _445 = 1.0 / _439;
    bool _447 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _449 = isnan(_399);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _431 * _443;
    float _461 = -_431;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _467 = _465 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _469 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _471 = _457 * _463;
    float _473 = 1.0 / _435;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _475;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _419 * _445;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _489 = fma(_467, _483, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _491 = fma(_487, _483, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _493 = _403 * _473;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = in.m_56.x;
    float _501 = in.m_56.y;
    float _503 = fma(_477, _493, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _505 = fma(_497, _493, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _507 = _505 * _471;
    float _509 = _503 * _471;
    float _511 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].x, _507);
    float _513 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[143].y, _509);
    float _515 = fma(_491, _459, _511);
    float _517 = fma(_489, _459, _513);
    float _519 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].x, _515);
    float _521 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[145].y, _517);
    float _523 = _519 * _499;
    float _525 = _521 * _501;
    bool _527 = !_469;
    float _543;
    if (!_527)
    {
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _531 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _533 = fma(_531, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _535 = _533 * _529;
        float _537 = floor(_535);
        float _539 = -_537;
        float _541 = _535 + _539;
        _543 = _541;
        _545 = true;
    }
    else
    {
        float _547 = float(_89);
        float _549 = 1.0 / _547;
        float _551 = _123 * _549;
        _543 = _551;
    }
    _545 = false;
    float _553 = _543;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _557 = _553 + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _559;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _567;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _575 = 1.0 / _561;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _577;
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _583 = _581 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _585 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _587 = isnan(_553);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _569;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _601 = _553 + _599;
    bool _603 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _605 = isnan(_553);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    bool _615 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _617 = isnan(_553);
    bool _619 = _615 || _617;
    bool _621 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _623 = _619 || _621;
    float _625 = float(_623);
    float _627 = 1.0 / _565;
    float _629 = _601 * _575;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _633 = _553 + _631;
    bool _635 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _637 = isnan(_553);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _647;
    float _651 = 1.0 / _583;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _655 = _553 + _653;
    float _657 = _633 * _597;
    bool _659 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _661 = isnan(_553);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = fma(_649, _629, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _675 = 1.0 / _573;
    float _677 = _655 * _627;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _681 = _553 + _679;
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _687;
    float _691 = _595 * _685;
    float _693 = 1.0 / _579;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _695;
    float _699 = _681 * _651;
    float _701 = -_595;
    float _703 = _701 + 1.0;
    float _705 = fma(_689, _629, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _707 = _613 * _703;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _711 = _709 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _715 = _553 + _713;
    float _717 = fma(_711, _677, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _719 = _715 * _675;
    bool _721 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _723 = isnan(_553);
    bool _725 = _721 || _723;
    bool _727 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _729 = _725 || _727;
    float _731 = float(_729);
    float _733 = _557 * _693;
    float _735 = fma(_697, _629, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _737 = -_613;
    float _739 = _737 + 1.0;
    float _741 = -_731;
    float _743 = _741 + 1.0;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _747 = _745 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _751 = _749 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _753 = _731 * _739;
    bool _755 = _553 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _757 = isnan(_553);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _625 * _743;
    float _769 = -_625;
    float _771 = _769 + 1.0;
    float _773 = fma(_747, _677, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_751, _677, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _777 = -_765;
    float _779 = _777 + 1.0;
    float _781 = _765 * _771;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _793 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _791;
    float _795 = _645 * _779;
    float _797 = fma(_785, _733, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _799 = fma(_789, _733, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _801 = fma(_793, _733, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _803 = _671 * _795;
    float _805 = -_645;
    float _807 = _805 + 1.0;
    float _809 = _705 * _795;
    float _811 = _735 * _795;
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _815 = _813 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _817 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].z, _803);
    float _819 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].x, _809);
    float _821 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[107].y, _811);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _827 = fma(_775, _781, _817);
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _831 = _829 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _833 = fma(_773, _781, _819);
    float _835 = fma(_717, _781, _821);
    float _837 = fma(_815, _699, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _839 = fma(_825, _699, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _841 = fma(_831, _699, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _843 = fma(_797, _767, _833);
    float _845 = fma(_799, _767, _835);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _851;
    float _855 = fma(_801, _767, _827);
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _857;
    float _861 = fma(_837, _753, _843);
    float _863 = fma(_839, _753, _845);
    float _865 = fma(_849, _657, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _867 = fma(_853, _657, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _869 = fma(_841, _753, _855);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _873 = _871 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _877 = _875 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _879 = fma(_859, _657, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _885 = fma(_865, _707, _861);
    float _887 = fma(_873, _719, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _889 = fma(_877, _719, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _891 = fma(_883, _719, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _893 = fma(_867, _707, _863);
    float _895 = fma(_879, _707, _869);
    float _897 = fma(_887, _691, _885);
    float _899 = fma(_889, _691, _893);
    float _901 = fma(_891, _691, _895);
    float _903 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].x, _897);
    float _905 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].y, _899);
    float _907 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[113].z, _901);
    bool _909 = !_673;
    float _925;
    if (!_909)
    {
        float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _913 = _143 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _915 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _917 = _915 * _911;
        float _919 = floor(_917);
        float _921 = -_919;
        float _923 = _917 + _921;
        _925 = _923;
        _927 = true;
    }
    else
    {
        float _929 = float(_89);
        float _931 = 1.0 / _929;
        float _933 = _123 * _931;
        _925 = _933;
    }
    _927 = false;
    float _935 = _925;
    float _937 = in.m_58.x;
    float _939 = in.m_58.y;
    float _941 = in.m_58.z;
    float _943 = in.m_58.w;
    float _945 = _525 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _947 = _143 > 0.5;
    float _949 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _951 = in.m_60.x;
    float _953 = in.m_60.y;
    float _955 = in.m_60.z;
    float _957 = in.m_60.w;
    float _959 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _203);
    float _961 = _949 * _959;
    float _963 = in.m_51.y;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _967 = _965 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _975 = _973 != 0;
    float _977 = 1.0 / _967;
    float _979 = _367 * _939;
    float _981 = -_203;
    int _983 = _947 ? as_type<int>(_981) : as_type<int>(_203);
    float _985 = _367 * _953;
    float _987 = fma(_359, _937, _979);
    float _989 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    bool _991 = !_971;
    float _993 = _991 ? _203 : as_type<float>(_983);
    float _995 = fma(_359, _951, _985);
    float _997 = fma(_361, _941, _987);
    float _999 = _945 * _989;
    float _1001 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1003 = fma(_361, _955, _995);
    float _1005 = _997 + _943;
    float _1007 = _999 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1009 = in.m_62.x;
    float _1011 = in.m_62.y;
    float _1013 = in.m_62.z;
    float _1015 = in.m_62.w;
    float _1017 = _999 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1019 = _1003 + _957;
    float _1021 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1007);
    bool _1023 = _963 > 0.5;
    float _1025 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1017);
    float _1027 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1021);
    bool _1029 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1031 = isnan(_935);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    float _1041 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1025);
    bool _1043 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1045 = isnan(_935);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1027 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1061 = _1041 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1063 = _1005 + _1055;
    float _1065 = 1.0 / _1059;
    float _1067 = _1019 + _1061;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1071 = _1063 + _1069;
    float _1073 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1075 = _1067 + _1073;
    float _1077 = _367 * _1011;
    float _1079 = _1071 * _1071;
    float _1081 = _1075 * _1075;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1085 = _935 + _1083;
    float _1087 = fma(_359, _1009, _1077);
    float _1089 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1089;
    float _1093 = _1079 + _1081;
    bool _1095 = _935 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1097 = isnan(_935);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = fma(_361, _1013, _1087);
    float _1109 = _1091 * _977;
    float _1111 = sqrt(_1093);
    float _1113 = _999 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1115 = -_1039;
    float _1117 = _1115 + 1.0;
    float _1119 = fma(_1109, _1085, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1121 = _1107 + _1015;
    float _1123 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1113);
    float _1125 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1127 = _1125 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1129 = _1053 * _1117;
    float _1131 = -_1105;
    float _1133 = _1131 + 1.0;
    float _1135 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1123);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1139 = _935 + _1137;
    float _1141 = -_217;
    float _1143 = _1023 ? _1141 : _217;
    float _1145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1147 = _1135 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1149 = _1127 * _1065;
    float _1151 = _1119 * _1129;
    bool _1153 = _1111 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1155 = _1121 + _1147;
    float _1157 = -_1053;
    float _1159 = _1157 + 1.0;
    bool _1161 = !_975;
    float _1163 = _1161 ? _217 : _1143;
    float _1165 = _1039 * _1133;
    float _1167 = fma(_1149, _1139, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1169 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1151);
    float _1171 = _1143;
    float _1173 = _1079;
    float _1175 = _1063;
    float _1177 = _1067;
    if (!_1153)
    {
        _1171 = _1081;
    }
    float _1179 = _1171;
    float _1181 = _1179;
    if (!_1153)
    {
        _227 = _1155;
    }
    float _1183 = _227;
    bool _1185 = !_1153;
    float _1187 = _1183;
    float _1189 = _1145;
    if (!_1185)
    {
        float _1191 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1193 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1195 = _1111 + _1193;
        float _1197 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1199 = rsqrt(_1093);
        float _1201 = _1195 * _1191;
        float _1203 = _1201 * 0.15915493667125701904296875;
        float _1205 = _1203 * 6.283185482025146484375;
        float _1207 = sin(_1205);
        float _1209 = _1203 * 6.283185482025146484375;
        float _1211 = cos(_1209);
        float _1213 = fma(_1207, _1197, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1215 = _1199 * _1213;
        float _1217 = _1211 + (-1.0);
        float _1219 = fma(_1071, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1221 = fma(_1075, _1215, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1223 = _1217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1227 = _1219 + _1225;
        float _1229 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1231 = _1221 + _1229;
        float _1233 = fma(_1155, _1211, _1223);
        float _1235 = _1227 * _1227;
        float _1237 = _1231 * _1231;
        _1187 = _1233;
        _1173 = _1235;
        _1181 = _1237;
        _1175 = _1219;
        _1177 = _1221;
    }
    float _1239 = _1187;
    float _1241 = _1173;
    float _1243 = _1181;
    float _1245 = _1175;
    float _1247 = _1177;
    float _1249 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1251 = _1239 + _1249;
    float _1253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1255 = _993 + 0.5;
    float _1257 = fma(_1167, _1165, _1169);
    float _1259 = fma(_1251, _1251, _1241);
    float _1261 = -_1163;
    float _1263 = _1261 + 0.5;
    float _1265 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1267 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1257);
    float _1269 = _1259 + _1243;
    float _1271 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1273 = _1263 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1275 = _905 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1277 = _907 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1279 = _1265 * _1145;
    float _1281 = sqrt(_1269);
    float _1283 = _1271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = _1273 * _1253;
    float _1289 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1291 = _1267 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1279;
    out.m_64.y = _1287;
    out.m_66.x = _1283;
    out.m_66.y = _1285;
    out.m_66.z = _1289;
    out.m_66.w = _1291;
    bool _1293 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1295 = isnan(_1281);
    bool _1297 = _1293 || _1295;
    bool _1299 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1301 = _1297 || _1299;
    float _1303 = _1251;
    float _1305 = _1289;
    float _1307 = _1285;
    float _1309 = _1291;
    if (!_1301)
    {
        _1303 = 1.0;
    }
    float _1311 = _1303;
    bool _1313 = !_1301;
    float _1315 = _1311;
    if (!_1313)
    {
        bool _1317 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1319 = isnan(_1281);
        bool _1321 = _1317 || _1319;
        bool _1323 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1325 = _1321 || _1323;
        if (!_1325)
        {
            float _1327 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1329 = _1281 + _1327;
            float _1331 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1333 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1331;
            float _1335 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1337 = _1335 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1339 = 1.0 / _1333;
            float _1341 = _1329 * _1339;
            float _1343 = fma(_1341, _1337, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1315 = _1343;
            _1345 = true;
        }
        else
        {
            bool _1347 = _1281 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1349 = isnan(_1281);
            bool _1351 = _1347 || _1349;
            bool _1353 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1355 = _1351 || _1353;
            if (!_1355)
            {
                float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1359 = _1281 + _1357;
                float _1361 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1363 = _1361 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1365 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1367 = _1365 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1369 = 1.0 / _1363;
                float _1371 = _1359 * _1369;
                float _1373 = fma(_1371, _1367, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1315 = _1373;
                _1345 = true;
            }
            else
            {
                _1315 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1345 = false;
    float _1375 = _1315;
    float _1377 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1379 = _1239 + _1377;
    float _1381 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1383 = _1245 + _1381;
    float _1385 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1387 = _1247 + _1385;
    float _1389 = fma(_1379, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1391 = fma(_1383, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1393 = fma(_1387, _1375, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1395 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1401 = _1391 + _1399;
    float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    float _1409 = fma(_1401, _1401, _1407);
    float _1411 = fma(_1405, _1405, _1409);
    float _1413 = rsqrt(_1411);
    float _1415 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1417 = _1401 * _1415;
    float _1419 = _1405 * _1415;
    float _1421 = _1417 * _1417;
    float _1423 = _1419 * _1419;
    float _1425 = _1421 + _1423;
    float _1427 = sqrt(_1425);
    bool _1429 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1431 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1433 = _1427 + _1431;
    float _1435 = _1405;
    float _1437 = _1425;
    float _1439 = _1433;
    float _1441 = _1397;
    if (_1429)
    {
        float _1443 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1435 = _1443;
    }
    float _1445 = _1435;
    if (_1429)
    {
        float _1447 = rsqrt(_1425);
        _1437 = _1447;
    }
    float _1449 = _1437;
    if (_1429)
    {
        float _1451 = _1433 * _1445;
        _1439 = _1451;
    }
    float _1453 = _1439;
    if (_1429)
    {
        float _1455 = _1453 * 0.15915493667125701904296875;
        _1305 = _1455;
    }
    float _1457 = _1305;
    float _1459 = _1413;
    if (_1429)
    {
        float _1461 = _1457 * 6.283185482025146484375;
        float _1463 = sin(_1461);
        _1459 = _1463;
    }
    float _1465 = _1459;
    float _1467 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1469 = precise::max(0.0, _1467);
    float _1471 = _1445;
    float _1473 = _1469;
    if (_1429)
    {
        float _1475 = _1457 * 6.283185482025146484375;
        float _1477 = cos(_1475);
        _1471 = _1477;
    }
    float _1479 = _1471;
    float _1481 = -_1415;
    float _1483 = -_1469;
    float _1485 = fma(_1397, _1481, _1483);
    if (_1429)
    {
        float _1487 = _1485 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1487;
    }
    float _1489 = _1441;
    float _1491 = _1465;
    float _1493 = _1489;
    if (_1429)
    {
        float _1495 = fma(_1465, _1489, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1307 = _1495;
    }
    float _1497 = _1307;
    float _1499 = _1497;
    if (!_1429)
    {
        _1491 = _1417;
    }
    float _1501 = _1491;
    float _1503 = _1501;
    if (!_1429)
    {
        _1493 = _1485;
    }
    float _1505 = _1493;
    float _1507 = _1505;
    float _1509 = _1479;
    if (_1429)
    {
        float _1511 = _1479 + (-1.0);
        _1473 = _1511;
    }
    float _1513 = _1473;
    float _1515 = _1513;
    if (_1429)
    {
        float _1517 = _1449 * _1497;
        _1189 = _1517;
    }
    float _1519 = _1189;
    if (!_1429)
    {
        _1499 = _1421;
    }
    float _1521 = _1499;
    float _1523 = sqrt(_1411);
    float _1525 = _1521;
    if (_1429)
    {
        float _1527 = _1513 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1309 = _1527;
    }
    float _1529 = _1309;
    if (_1429)
    {
        float _1531 = _1417 * _1519;
        _1503 = _1531;
    }
    float _1533 = _1503;
    if (!_1429)
    {
        _1515 = _1419;
    }
    float _1535 = _1515;
    float _1537 = _1535;
    if (_1429)
    {
        float _1539 = _1419 * _1519;
        _1537 = _1539;
    }
    float _1541 = _1537;
    if (_1429)
    {
        float _1543 = fma(_1485, _1479, _1529);
        _1507 = _1543;
    }
    float _1545 = _1507;
    if (_1429)
    {
        float _1547 = _1533 * _1533;
        _1525 = _1547;
    }
    float _1549 = _1525;
    if (!_1429)
    {
        _1509 = _1423;
    }
    float _1551 = _1509;
    float _1553 = _1551;
    if (_1429)
    {
        float _1555 = _1541 * _1541;
        _1553 = _1555;
    }
    float _1557 = _1553;
    float _1559 = fma(_1545, _1545, _1549);
    float _1561 = _1559 + _1557;
    float _1563 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1567 = fma(_1523, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1565);
    float _1569 = precise::clamp(_1567, 0.0, 1.0);
    float _1571 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1573 = rsqrt(_1561);
    float _1575 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1563);
    float _1577 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1579 = -_1569;
    float _1581 = _1579 + 1.0;
    float _1583 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1575);
    float _1585 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1577);
    float _1589 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1591 = abs(_1581);
    float _1593 = log2(_1591);
    float _1595 = _1583 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1597 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1585);
    float _1599 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1587);
    float _1601 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1589);
    float _1603 = _1595 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1605 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1597);
    float _1607 = _1573 * _1533;
    float _1609 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1611 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1601);
    float _1613 = _1573 * _1545;
    float _1615 = _1607 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1617 = -_1603;
    float _1619 = fma(_1617, _1571, 1.0);
    float _1621 = _1605 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1623 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1625 = _1611 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1627 = _1573 * _1541;
    float _1629 = -_1615;
    float _1631 = fma(_1613, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1629);
    float _1633 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1623);
    float _1635 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1637 = log2(_1619);
    float _1639 = -_1627;
    float _1641 = fma(_1639, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1631);
    float _1643 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1633);
    float _1645 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1647 = fma(_1641, -0.5, 0.5);
    float _1649 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1643);
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1653 = exp2(_1635);
    float _1655 = fma(_1641, 0.5, 0.5);
    float _1657 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1645);
    float _1659 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1651);
    float _1661 = _1613 + 1.0;
    float _1663 = fma(_1655, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1665 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1657);
    float _1667 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1659);
    float _1669 = 1.0 / _1649;
    float _1671 = fma(_1655, _1663, -0.212114393711090087890625);
    float _1673 = _1637 * 0.693147182464599609375;
    float _1675 = fma(_1655, _1671, 1.570728778839111328125);
    float _1677 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1679 = sqrt(_1647);
    float _1681 = -_1613;
    float _1683 = fma(_1653, _1661, _1681);
    float _1685 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1667);
    float _1687 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1665);
    float _1689 = fma(_1683, 0.5, 0.5);
    float _1691 = _1685 * _1669;
    float _1693 = _1687 * _1669;
    float _1695 = fma(_1691, 0.5, 0.5);
    float _1697 = fma(_1693, -0.5, 0.5);
    float _1699 = _1679 * 0.636619746685028076171875;
    float _1701 = -_1675;
    float _1703 = fma(_1699, _1701, 1.0);
    float3 _4587 = float3(_1695, _1697, _1677);
    float _1705 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4587, float3(0.0), isnan(_4587)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4587, float3(0.0), isnan(_4587)), level(0.0)).x;
    float3 _4598 = float3(_1695, _1697, _1677);
    float4 _1708 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4598, float3(0.0), isnan(_4598)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4598, float3(0.0), isnan(_4598)), level(0.0)).xyzw;
    float _1710 = _1708.x;
    float _1712 = _1708.y;
    float _1714 = _1708.z;
    float _1716 = _1708.w;
    float2 _4615 = float2(_1703, _1689);
    float3 _1720 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4615, float2(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4615, float2(0.0), isnan(_4615)), level(0.0)).xyz;
    float _1722 = _1720.x;
    float _1724 = _1720.y;
    float _1726 = _1720.z;
    float _1728 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1730 = _1121 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1732 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1728);
    float _1734 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1730);
    float _1736 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1732);
    float _1738 = fma(_1019, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1734);
    float _1740 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1742 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1744 = 1.0 / _1740;
    float _1746 = _1742 + _1740;
    float _1748 = _1746 * _1744;
    float _1750 = _1748 * 0.5;
    float _1752 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1754 = fma(_1750, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1752);
    float _1756 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1758 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1760 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1764 = _1760 || _1762;
    bool _1766 = isnan(0.5);
    bool _1768 = _1764 || _1766;
    float _1770 = 1.0 / _1754;
    float _1772 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1758);
    float _1774 = exp2(_1756);
    float _1776 = _1609;
    float _1778 = _1758;
    if (_1768)
    {
        _1776 = 1.0;
    }
    float _1780 = _1776;
    float _1782 = _1780;
    if (_1768)
    {
        _1778 = 1.0;
    }
    float _1784 = _1778;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1788 = _1770 * _1786;
    float _1790 = _1784;
    if (!_1768)
    {
        float _1792 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1796 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1794;
        float _1798 = _1792 * 0.15915493667125701904296875;
        float _1800 = 1.0 / _1796;
        float _1802 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1804 = _1798 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1802 * 0.15915493667125701904296875;
        float _1810 = _1798 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = 1.0 / _1806;
        float _1816 = _1808 * 6.283185482025146484375;
        float _1818 = cos(_1816);
        float _1820 = _1812 * _1814;
        float _1822 = _1808 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1818 * _1820;
        float _1828 = 1.0 / _1826;
        float _1830 = _1824 * _1828;
        float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1834 = fma(_1788, _1830, _1832);
        float _1836 = _1834 * _1800;
        float _1838 = precise::clamp(_1836, 0.0, 1.0);
        _1782 = _1838;
    }
    float _1840 = _1782;
    if (!_1768)
    {
        float _1842 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1852 = _1850 * 0.15915493667125701904296875;
        float _1854 = _1844 * 6.283185482025146484375;
        float _1856 = sin(_1854);
        float _1858 = 1.0 / _1848;
        float _1860 = _1852 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = _1856 * _1858;
        float _1866 = _1852 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = 1.0 / _1870;
        float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1876 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1874;
        float _1878 = 1.0 / _1876;
        float _1880 = _1868 * _1872;
        float _1882 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1884 = fma(_1788, _1880, _1882);
        float _1886 = _1884 * _1878;
        float _1888 = precise::clamp(_1886, 0.0, 1.0);
        float _1890 = -_1888;
        float _1892 = _1890 + 1.0;
        _1790 = _1892;
    }
    float _1894 = _1790;
    float _1896 = fma(_1595, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1772);
    float _1898 = -_1774;
    float _1900 = _1898 + 1.0;
    float _1902 = _1840 * _1894;
    bool _1904 = _1840 > 0.0;
    bool _1906 = isnan(_1840);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(0.0);
    bool _1912 = _1908 || _1910;
    float _1914 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1916 = _1902 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1918 = _1894 <= 0.0;
    bool _1920 = !_1912;
    bool _1922 = _1918 || _1920;
    float _1924 = _1914 + _1649;
    float _1926 = _371 * _1916;
    float _1928 = _1924 * 0.5;
    float _1930 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1685;
    out.gl_Position.y = _1687;
    out.gl_Position.z = _1914;
    out.gl_Position.w = _1649;
    float _1932 = _1926 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1934 = _1930 * _1705;
    float _1936 = -_1930;
    float _1938 = _1936 + 1.0;
    out.m_68.z = _1928;
    out.m_68.w = _1649;
    float _1940 = _1716 * _1934;
    float _1942 = _1726 * _1934;
    out.m_47.x = _1932;
    float _1944 = fma(_1722, _1940, _1710);
    float _1946 = fma(_1724, _1940, _1712);
    float _1948 = _1716 * _1938;
    float _1950 = fma(_1716, _1942, _1714);
    out.m_70.x = _1944;
    out.m_70.y = _1946;
    out.m_70.z = _1950;
    out.m_70.w = _1948;
    if (!_1922)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1952 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1952;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

