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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
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
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _309 = false;
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
        float _1459 = as_type<float>(_107);
        out.gl_Position.z = _1459;
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
        float _1527 = as_type<float>(_143);
        out.gl_Position.z = _1527;
    }
    if (_137)
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
    float _209 = _199;
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
    }
    float _241 = _207;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _175 = _263;
    }
    float _265 = _175;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _317 + _319;
    bool _323 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_317);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = 1.0 / _353;
    float _361 = _345 * _357;
    bool _363 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_317);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = 1.0 / _349;
    float _385 = _373 * _377;
    float _387 = _321 * _383;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _317 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _391 * _359;
    float _403 = fma(_395, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_399, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = in.m_58.x;
    float _413 = in.m_58.y;
    float _415 = in.m_58.z;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _405 * _385;
    float _423 = _403 * _385;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = in.m_60.x;
    float _431 = in.m_60.y;
    float _433 = in.m_60.z;
    float _435 = fma(_409, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = fma(_435, _361, _437);
    float _449 = fma(_439, _361, _441);
    float _451 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].y, _447);
    float _453 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].x, _449);
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _457 = _451 * _381;
    float _459 = _453 * _379;
    float _461 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _463 = _283 * _413;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _467 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = _461 * _455;
    float _471 = fma(_281, _411, _463);
    float _473 = _283 * _431;
    float _475 = _467 * _465;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = fma(_281, _429, _473);
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _477);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_285, _415, _471);
    float _491 = fma(_285, _433, _481);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _499 = _491 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _507 = _443 > 0.5;
    float _509 = _497 + _501;
    float _511 = _499 + _503;
    float _513 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = in.m_62.x;
    float _517 = in.m_62.y;
    float _519 = in.m_62.z;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _523 = _509 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _511 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _531 = _523 * _523;
    float _533 = _527 * _527;
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _537 = _529 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = _531 + _533;
    float _545 = sqrt(_543);
    float _547 = _283 * _517;
    float _549 = fma(_281, _515, _547);
    float _551 = -_199;
    float _553 = _507 ? _551 : _199;
    bool _555 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = fma(_285, _519, _549);
    bool _559 = !_541;
    float _561 = _559 ? _199 : _553;
    bool _563 = _445 > 0.5;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = _565 + _537;
    float _569 = _517;
    float _571 = _553;
    float _573 = _509;
    if (!_555)
    {
        _569 = _533;
    }
    float _575 = _569;
    float _577 = _575;
    if (!_555)
    {
        _571 = _531;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_555)
    {
        _209 = _511;
    }
    float _583 = _209;
    float _585 = _583;
    if (!_555)
    {
        _289 = _567;
    }
    float _587 = _289;
    bool _589 = !_555;
    float _591 = _587;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _597 = _545 + _595;
        float _599 = _567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = rsqrt(_543);
        float _603 = _597 * _593;
        float _605 = _603 * 0.15915493667125701904296875;
        float _607 = _605 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = _605 * 6.283185482025146484375;
        float _613 = cos(_611);
        float _615 = fma(_609, _599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _601 * _615;
        float _619 = _613 + (-1.0);
        float _621 = fma(_523, _617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _623 = fma(_527, _617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _625 = _619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _629 = _621 + _627;
        float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _633 = _623 + _631;
        float _635 = fma(_567, _613, _625);
        float _637 = _629 * _629;
        float _639 = _633 * _633;
        _591 = _635;
        _581 = _637;
        _577 = _639;
        _573 = _621;
        _585 = _623;
    }
    float _641 = _591;
    float _643 = _581;
    float _645 = _577;
    float _647 = _573;
    float _649 = _585;
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _641 + _651;
    float _655 = _561 + 0.5;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _663 = -_203;
    int _665 = _563 ? as_type<int>(_663) : as_type<int>(_203);
    float _667 = fma(_653, _653, _643);
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _671 = !_659;
    float _673 = _671 ? _203 : as_type<float>(_665);
    float _675 = _667 + _645;
    float _677 = _669 * _535;
    float _679 = -_673;
    float _681 = _679 + 0.5;
    float _683 = sqrt(_675);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _681 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _703 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * _661;
    bool _715 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _717 = isnan(_683);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _723 = _719 || _721;
    out.m_64.x = _703;
    out.m_64.y = _705;
    out.m_64.z = _707;
    out.m_64.w = _701;
    out.m_66.x = _709;
    out.m_66.y = _699;
    out.m_66.z = _711;
    out.m_68.x = _677;
    out.m_68.y = _713;
    float _725 = _693;
    float _727 = _649;
    float _729 = _699;
    if (!_723)
    {
        _725 = 1.0;
    }
    float _731 = _725;
    bool _733 = !_723;
    float _735 = _731;
    if (!_733)
    {
        bool _737 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _739 = isnan(_683);
        bool _741 = _737 || _739;
        bool _743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _745 = _741 || _743;
        if (!_745)
        {
            float _747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _749 = _683 + _747;
            float _751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _751;
            float _755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _757 = _755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _759 = 1.0 / _753;
            float _761 = _749 * _759;
            float _763 = fma(_761, _757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _735 = _763;
            _765 = true;
        }
        else
        {
            bool _767 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _769 = isnan(_683);
            bool _771 = _767 || _769;
            bool _773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _775 = _771 || _773;
            if (!_775)
            {
                float _777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _779 = _683 + _777;
                float _781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _783 = _781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _787 = _785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _789 = 1.0 / _783;
                float _791 = _779 * _789;
                float _793 = fma(_791, _787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _735 = _793;
                _765 = true;
            }
            else
            {
                _735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _765 = false;
    float _795 = _735;
    float _797 = _565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _801 = _647 + _799;
    float _803 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _805 = _565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _807 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.5);
    bool _815 = _811 || _813;
    float _817 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _803);
    float _819 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    bool _821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.5);
    bool _829 = _825 || _827;
    float _831 = _817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _819);
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _837 = _641 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _841 = _649 + _839;
    float _843 = 1.0 / _831;
    float _845 = fma(_801, _795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _847 = _833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _849 = fma(_837, _795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _851 = fma(_841, _795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = _847 + _831;
    float _855 = _837;
    float _857 = _847;
    float _859 = _795;
    float _861 = _851;
    float _863 = _831;
    float _865 = _849;
    if (_815)
    {
        _855 = _845;
    }
    float _867 = _855;
    float _869 = _867;
    if (_815)
    {
        _857 = _849;
    }
    float _871 = _857;
    float _873 = _871;
    if (_815)
    {
        _727 = _851;
    }
    float _875 = _727;
    float _877 = _875;
    if (!_815)
    {
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _881 = _565 + _879;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _885 = _497 + _883;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _889 = _881 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _893 = _499 + _891;
        float _895 = fma(_885, _885, _889);
        float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _899 = fma(_893, _893, _895);
        float _901 = sqrt(_899);
        float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _905 = precise::min(_901, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _907 = _905 * _897;
        float _909 = -_497;
        float _911 = _909 + _845;
        float _913 = -_499;
        float _915 = _913 + _851;
        float _917 = _903 * _907;
        float _919 = -_565;
        float _921 = _919 + _849;
        float _923 = fma(_911, _917, _497);
        float _925 = fma(_921, _917, _565);
        float _927 = fma(_915, _917, _499);
        _873 = _925;
        _869 = _923;
        _877 = _927;
        _859 = _911;
    }
    float _929 = _873;
    float _931 = _869;
    float _933 = _877;
    float _935 = _859;
    float _937 = _935;
    if (_829)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = _853 * _843;
    float _943 = _941 * 0.5;
    float _945 = _939;
    if (!_829)
    {
        float _947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _951 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
        float _953 = _947 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _961 = _959 * 0.15915493667125701904296875;
        float _963 = _953 * 6.283185482025146484375;
        float _965 = sin(_963);
        float _967 = 1.0 / _957;
        float _969 = _961 * 6.283185482025146484375;
        float _971 = cos(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _951;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = _971 * _973;
        float _983 = _961 * 6.283185482025146484375;
        float _985 = sin(_983);
        float _987 = 1.0 / _981;
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _991 = _975 * _989;
        float _993 = 1.0 / _979;
        float _995 = _985 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_995, _991, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _861 = _993;
        _945 = _1003;
    }
    float _1005 = _861;
    float _1007 = _945;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _929 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _931 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _933 + _1017;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1031 = _1015 * _1029;
    float _1033 = _1019 * _1029;
    float _1035 = _1031 * _1031;
    float _1037 = _1033 * _1033;
    float _1039 = _1035 + _1037;
    float _1041 = sqrt(_1039);
    bool _1043 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = _1041 + _1045;
    float _1049 = _1019;
    float _1051 = _1039;
    float _1053 = _1047;
    float _1055 = _1031;
    if (_1043)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1057;
    }
    float _1059 = _1049;
    if (_1043)
    {
        float _1061 = rsqrt(_1039);
        _1051 = _1061;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (_1043)
    {
        float _1067 = _1047 * _1059;
        _1053 = _1067;
    }
    float _1069 = _1053;
    if (_1043)
    {
        float _1071 = _1069 * 0.15915493667125701904296875;
        _863 = _1071;
    }
    float _1073 = _863;
    float _1075 = _1027;
    if (_1043)
    {
        float _1077 = _1073 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1085 = precise::max(0.0, _1083);
    float _1087 = _1005;
    float _1089 = _1085;
    float _1091 = _1083;
    if (_1043)
    {
        float _1093 = _1073 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        _1087 = _1095;
    }
    float _1097 = _1087;
    float _1099 = -_1029;
    float _1101 = -_1085;
    float _1103 = fma(_1011, _1099, _1101);
    if (_1043)
    {
        float _1105 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1105;
    }
    float _1107 = _1089;
    float _1109 = sqrt(_1025);
    float _1111 = _1081;
    float _1113 = _1107;
    if (_1043)
    {
        float _1115 = fma(_1081, _1107, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = _1117;
    if (!_1043)
    {
        _1113 = _1033;
    }
    float _1121 = _1113;
    float _1123 = _1121;
    if (_1043)
    {
        float _1125 = _1097 + (-1.0);
        _1091 = _1125;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (_1043)
    {
        float _1131 = _1063 * _1117;
        _729 = _1131;
    }
    float _1133 = _729;
    if (!_1043)
    {
        _1119 = _1103;
    }
    float _1135 = _1119;
    float _1137 = _1135;
    if (_1043)
    {
        float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _1139;
    }
    float _1141 = _865;
    if (_1043)
    {
        float _1143 = _1031 * _1133;
        _1055 = _1143;
    }
    float _1145 = _1055;
    if (!_1043)
    {
        _1065 = _1035;
    }
    float _1147 = _1065;
    float _1149 = _1147;
    if (_1043)
    {
        float _1151 = _1033 * _1133;
        _1123 = _1151;
    }
    float _1153 = _1123;
    if (_1043)
    {
        float _1155 = fma(_1103, _1097, _1141);
        _1137 = _1155;
    }
    float _1157 = _1137;
    if (_1043)
    {
        float _1159 = _1145 * _1145;
        _1149 = _1159;
    }
    float _1161 = _1149;
    if (!_1043)
    {
        _1129 = _1037;
    }
    float _1163 = _1129;
    float _1165 = _1163;
    if (_1043)
    {
        float _1167 = _1153 * _1153;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_1157, _1157, _1161);
    float _1173 = _1171 + _1169;
    float _1175 = _929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1179 = fma(_1109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1177);
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    float _1183 = _929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1185 = rsqrt(_1173);
    float _1187 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1175);
    float _1189 = _929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1191 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1183);
    float _1193 = _929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1189);
    float _1201 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1191);
    float _1203 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1193);
    float _1205 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1207 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1217 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = _1185 * _1145;
    float _1221 = abs(_1197);
    float _1223 = log2(_1221);
    float _1225 = _1185 * _1157;
    float _1227 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1235 = _1185 * _1153;
    float _1237 = -_1229;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1237);
    float _1241 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1227);
    float _1245 = -_1233;
    float _1247 = fma(_1245, _1231, 1.0);
    float _1249 = -_1235;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1239);
    float _1253 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1257 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1259 = fma(_1251, -0.5, 0.5);
    float _1261 = log2(_1247);
    float _1263 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1257);
    float _1267 = fma(_1251, 0.5, 0.5);
    float _1269 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1253);
    float _1271 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1273 = fma(_1267, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1275 = 1.0 / _1255;
    float _1277 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1279 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1281 = fma(_1267, _1273, -0.212114393711090087890625);
    float _1283 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1285 = fma(_1267, _1281, 1.570728778839111328125);
    float _1287 = sqrt(_1259);
    float _1289 = _1261 * 0.693147182464599609375;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1293 = exp2(_1263);
    float _1295 = _1279 * _1275;
    float _1297 = _1283 * _1275;
    float _1299 = fma(_1295, 0.5, 0.5);
    float _1301 = fma(_1297, -0.5, 0.5);
    float _1303 = _1287 * 0.636619746685028076171875;
    float _1305 = _1225 + 1.0;
    float3 _3411 = float3(_1299, _1301, _1291);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3411, float3(0.0), isnan(_3411)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3411, float3(0.0), isnan(_3411)), level(0.0)).x;
    float _1309 = -_1285;
    float _1311 = fma(_1303, _1309, 1.0);
    float _1313 = -_1225;
    float _1315 = fma(_1293, _1305, _1313);
    float3 _3433 = float3(_1299, _1301, _1291);
    float4 _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3433, float3(0.0), isnan(_3433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3433, float3(0.0), isnan(_3433)), level(0.0)).xyzw;
    float _1320 = _1318.x;
    float _1322 = _1318.y;
    float _1324 = _1318.z;
    float _1326 = _1318.w;
    float _1328 = fma(_1315, 0.5, 0.5);
    float2 _3452 = float2(_1311, _1328);
    float3 _1332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3452, float2(0.0), isnan(_3452)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3452, float2(0.0), isnan(_3452)), level(0.0)).xyz;
    float _1334 = _1332.x;
    float _1336 = _1332.y;
    float _1338 = _1332.z;
    float _1340 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1344 = _1255 * 0.5;
    bool _1346 = _1007 > 0.0;
    bool _1348 = isnan(_1007);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = _1279 + _1255;
    float _1358 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1342);
    float _1360 = exp2(_1340);
    float _1362 = _1356 * 0.5;
    float _1364 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1358);
    float _1366 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1364);
    float _1368 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1370 = _1366 + _1255;
    out.gl_Position.x = _1279;
    out.gl_Position.y = _1283;
    out.gl_Position.z = _1366;
    out.gl_Position.w = _1255;
    float _1372 = _1370 * 0.5;
    float _1374 = -_1360;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1283, -0.5, _1344);
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1362;
    out.m_70.y = _1378;
    out.m_70.z = _1372;
    out.m_70.w = _1255;
    out.m_47.x = _1380;
    float _1384 = _1382 * _1307;
    float _1386 = -_1382;
    float _1388 = _1386 + 1.0;
    float _1390 = _1326 * _1384;
    float _1392 = _1338 * _1384;
    float _1394 = fma(_1334, _1390, _1320);
    float _1396 = fma(_1336, _1390, _1322);
    float _1398 = _1326 * _1388;
    float _1400 = fma(_1326, _1392, _1324);
    out.m_72.x = _1394;
    out.m_72.y = _1396;
    out.m_72.z = _1400;
    out.m_72.w = _1398;
    if (_1354)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1402;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _309 = false;
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
        float _1459 = as_type<float>(_107);
        out.gl_Position.z = _1459;
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
        float _1527 = as_type<float>(_143);
        out.gl_Position.z = _1527;
    }
    if (_137)
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
    float _209 = _199;
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
    }
    float _241 = _207;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _175 = _263;
    }
    float _265 = _175;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _317 + _319;
    bool _323 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_317);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = 1.0 / _353;
    float _361 = _345 * _357;
    bool _363 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_317);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = 1.0 / _349;
    float _385 = _373 * _377;
    float _387 = _321 * _383;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _317 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _391 * _359;
    float _403 = fma(_395, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_399, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = in.m_58.x;
    float _413 = in.m_58.y;
    float _415 = in.m_58.z;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _405 * _385;
    float _423 = _403 * _385;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = in.m_60.x;
    float _431 = in.m_60.y;
    float _433 = in.m_60.z;
    float _435 = fma(_409, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = fma(_435, _361, _437);
    float _449 = fma(_439, _361, _441);
    float _451 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].y, _447);
    float _453 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].x, _449);
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _457 = _451 * _381;
    float _459 = _453 * _379;
    float _461 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _463 = _283 * _413;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _467 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = _461 * _455;
    float _471 = fma(_281, _411, _463);
    float _473 = _283 * _431;
    float _475 = _467 * _465;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = fma(_281, _429, _473);
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _477);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_285, _415, _471);
    float _491 = fma(_285, _433, _481);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _499 = _491 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _507 = _443 > 0.5;
    float _509 = _497 + _501;
    float _511 = _499 + _503;
    float _513 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = in.m_62.x;
    float _517 = in.m_62.y;
    float _519 = in.m_62.z;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _523 = _509 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _511 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _531 = _523 * _523;
    float _533 = _527 * _527;
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _537 = _529 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = _531 + _533;
    float _545 = sqrt(_543);
    float _547 = _283 * _517;
    float _549 = fma(_281, _515, _547);
    float _551 = -_199;
    float _553 = _507 ? _551 : _199;
    bool _555 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = fma(_285, _519, _549);
    bool _559 = !_541;
    float _561 = _559 ? _199 : _553;
    bool _563 = _445 > 0.5;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = _565 + _537;
    float _569 = _517;
    float _571 = _553;
    float _573 = _509;
    if (!_555)
    {
        _569 = _533;
    }
    float _575 = _569;
    float _577 = _575;
    if (!_555)
    {
        _571 = _531;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_555)
    {
        _209 = _511;
    }
    float _583 = _209;
    float _585 = _583;
    if (!_555)
    {
        _289 = _567;
    }
    float _587 = _289;
    bool _589 = !_555;
    float _591 = _587;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _597 = _545 + _595;
        float _599 = _567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = rsqrt(_543);
        float _603 = _597 * _593;
        float _605 = _603 * 0.15915493667125701904296875;
        float _607 = _605 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = _605 * 6.283185482025146484375;
        float _613 = cos(_611);
        float _615 = fma(_609, _599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _601 * _615;
        float _619 = _613 + (-1.0);
        float _621 = fma(_523, _617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _623 = fma(_527, _617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _625 = _619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _629 = _621 + _627;
        float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _633 = _623 + _631;
        float _635 = fma(_567, _613, _625);
        float _637 = _629 * _629;
        float _639 = _633 * _633;
        _591 = _635;
        _581 = _637;
        _577 = _639;
        _573 = _621;
        _585 = _623;
    }
    float _641 = _591;
    float _643 = _581;
    float _645 = _577;
    float _647 = _573;
    float _649 = _585;
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _641 + _651;
    float _655 = _561 + 0.5;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _663 = -_203;
    int _665 = _563 ? as_type<int>(_663) : as_type<int>(_203);
    float _667 = fma(_653, _653, _643);
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _671 = !_659;
    float _673 = _671 ? _203 : as_type<float>(_665);
    float _675 = _667 + _645;
    float _677 = _669 * _535;
    float _679 = -_673;
    float _681 = _679 + 0.5;
    float _683 = sqrt(_675);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _681 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _703 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * _661;
    bool _715 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _717 = isnan(_683);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _723 = _719 || _721;
    out.m_64.x = _703;
    out.m_64.y = _705;
    out.m_64.z = _707;
    out.m_64.w = _701;
    out.m_66.x = _709;
    out.m_66.y = _699;
    out.m_66.z = _711;
    out.m_68.x = _677;
    out.m_68.y = _713;
    float _725 = _693;
    float _727 = _649;
    float _729 = _699;
    if (!_723)
    {
        _725 = 1.0;
    }
    float _731 = _725;
    bool _733 = !_723;
    float _735 = _731;
    if (!_733)
    {
        bool _737 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _739 = isnan(_683);
        bool _741 = _737 || _739;
        bool _743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _745 = _741 || _743;
        if (!_745)
        {
            float _747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _749 = _683 + _747;
            float _751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _751;
            float _755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _757 = _755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _759 = 1.0 / _753;
            float _761 = _749 * _759;
            float _763 = fma(_761, _757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _735 = _763;
            _765 = true;
        }
        else
        {
            bool _767 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _769 = isnan(_683);
            bool _771 = _767 || _769;
            bool _773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _775 = _771 || _773;
            if (!_775)
            {
                float _777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _779 = _683 + _777;
                float _781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _783 = _781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _787 = _785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _789 = 1.0 / _783;
                float _791 = _779 * _789;
                float _793 = fma(_791, _787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _735 = _793;
                _765 = true;
            }
            else
            {
                _735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _765 = false;
    float _795 = _735;
    float _797 = _565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _801 = _647 + _799;
    float _803 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _805 = _565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _807 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.5);
    bool _815 = _811 || _813;
    float _817 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _803);
    float _819 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    bool _821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.5);
    bool _829 = _825 || _827;
    float _831 = _817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _819);
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _837 = _641 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _841 = _649 + _839;
    float _843 = 1.0 / _831;
    float _845 = fma(_801, _795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _847 = _833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _849 = fma(_837, _795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _851 = fma(_841, _795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = _847 + _831;
    float _855 = _837;
    float _857 = _847;
    float _859 = _795;
    float _861 = _851;
    float _863 = _831;
    float _865 = _849;
    if (_815)
    {
        _855 = _845;
    }
    float _867 = _855;
    float _869 = _867;
    if (_815)
    {
        _857 = _849;
    }
    float _871 = _857;
    float _873 = _871;
    if (_815)
    {
        _727 = _851;
    }
    float _875 = _727;
    float _877 = _875;
    if (!_815)
    {
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _881 = _565 + _879;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _885 = _497 + _883;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _889 = _881 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _893 = _499 + _891;
        float _895 = fma(_885, _885, _889);
        float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _899 = fma(_893, _893, _895);
        float _901 = sqrt(_899);
        float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _905 = precise::min(_901, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _907 = _905 * _897;
        float _909 = -_497;
        float _911 = _909 + _845;
        float _913 = -_499;
        float _915 = _913 + _851;
        float _917 = _903 * _907;
        float _919 = -_565;
        float _921 = _919 + _849;
        float _923 = fma(_911, _917, _497);
        float _925 = fma(_921, _917, _565);
        float _927 = fma(_915, _917, _499);
        _873 = _925;
        _869 = _923;
        _877 = _927;
        _859 = _911;
    }
    float _929 = _873;
    float _931 = _869;
    float _933 = _877;
    float _935 = _859;
    float _937 = _935;
    if (_829)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = _853 * _843;
    float _943 = _941 * 0.5;
    float _945 = _939;
    if (!_829)
    {
        float _947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _951 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
        float _953 = _947 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _961 = _959 * 0.15915493667125701904296875;
        float _963 = _953 * 6.283185482025146484375;
        float _965 = sin(_963);
        float _967 = 1.0 / _957;
        float _969 = _961 * 6.283185482025146484375;
        float _971 = cos(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _951;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = _971 * _973;
        float _983 = _961 * 6.283185482025146484375;
        float _985 = sin(_983);
        float _987 = 1.0 / _981;
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _991 = _975 * _989;
        float _993 = 1.0 / _979;
        float _995 = _985 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_995, _991, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _861 = _993;
        _945 = _1003;
    }
    float _1005 = _861;
    float _1007 = _945;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _929 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _931 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _933 + _1017;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1031 = _1015 * _1029;
    float _1033 = _1019 * _1029;
    float _1035 = _1031 * _1031;
    float _1037 = _1033 * _1033;
    float _1039 = _1035 + _1037;
    float _1041 = sqrt(_1039);
    bool _1043 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = _1041 + _1045;
    float _1049 = _1019;
    float _1051 = _1039;
    float _1053 = _1047;
    float _1055 = _1031;
    if (_1043)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1057;
    }
    float _1059 = _1049;
    if (_1043)
    {
        float _1061 = rsqrt(_1039);
        _1051 = _1061;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (_1043)
    {
        float _1067 = _1047 * _1059;
        _1053 = _1067;
    }
    float _1069 = _1053;
    if (_1043)
    {
        float _1071 = _1069 * 0.15915493667125701904296875;
        _863 = _1071;
    }
    float _1073 = _863;
    float _1075 = _1027;
    if (_1043)
    {
        float _1077 = _1073 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1085 = precise::max(0.0, _1083);
    float _1087 = _1005;
    float _1089 = _1085;
    float _1091 = _1083;
    if (_1043)
    {
        float _1093 = _1073 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        _1087 = _1095;
    }
    float _1097 = _1087;
    float _1099 = -_1029;
    float _1101 = -_1085;
    float _1103 = fma(_1011, _1099, _1101);
    if (_1043)
    {
        float _1105 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1105;
    }
    float _1107 = _1089;
    float _1109 = sqrt(_1025);
    float _1111 = _1081;
    float _1113 = _1107;
    if (_1043)
    {
        float _1115 = fma(_1081, _1107, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = _1117;
    if (!_1043)
    {
        _1113 = _1033;
    }
    float _1121 = _1113;
    float _1123 = _1121;
    if (_1043)
    {
        float _1125 = _1097 + (-1.0);
        _1091 = _1125;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (_1043)
    {
        float _1131 = _1063 * _1117;
        _729 = _1131;
    }
    float _1133 = _729;
    if (!_1043)
    {
        _1119 = _1103;
    }
    float _1135 = _1119;
    float _1137 = _1135;
    if (_1043)
    {
        float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _1139;
    }
    float _1141 = _865;
    if (_1043)
    {
        float _1143 = _1031 * _1133;
        _1055 = _1143;
    }
    float _1145 = _1055;
    if (!_1043)
    {
        _1065 = _1035;
    }
    float _1147 = _1065;
    float _1149 = _1147;
    if (_1043)
    {
        float _1151 = _1033 * _1133;
        _1123 = _1151;
    }
    float _1153 = _1123;
    if (_1043)
    {
        float _1155 = fma(_1103, _1097, _1141);
        _1137 = _1155;
    }
    float _1157 = _1137;
    if (_1043)
    {
        float _1159 = _1145 * _1145;
        _1149 = _1159;
    }
    float _1161 = _1149;
    if (!_1043)
    {
        _1129 = _1037;
    }
    float _1163 = _1129;
    float _1165 = _1163;
    if (_1043)
    {
        float _1167 = _1153 * _1153;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_1157, _1157, _1161);
    float _1173 = _1171 + _1169;
    float _1175 = _929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1179 = fma(_1109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1177);
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    float _1183 = _929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1185 = rsqrt(_1173);
    float _1187 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1175);
    float _1189 = _929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1191 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1183);
    float _1193 = _929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1189);
    float _1201 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1191);
    float _1203 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1193);
    float _1205 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1207 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1217 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = _1185 * _1145;
    float _1221 = abs(_1197);
    float _1223 = log2(_1221);
    float _1225 = _1185 * _1157;
    float _1227 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1235 = _1185 * _1153;
    float _1237 = -_1229;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1237);
    float _1241 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1227);
    float _1245 = -_1233;
    float _1247 = fma(_1245, _1231, 1.0);
    float _1249 = -_1235;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1239);
    float _1253 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1257 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1259 = fma(_1251, -0.5, 0.5);
    float _1261 = log2(_1247);
    float _1263 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1257);
    float _1267 = fma(_1251, 0.5, 0.5);
    float _1269 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1253);
    float _1271 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1273 = fma(_1267, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1275 = 1.0 / _1255;
    float _1277 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1279 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1281 = fma(_1267, _1273, -0.212114393711090087890625);
    float _1283 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1285 = fma(_1267, _1281, 1.570728778839111328125);
    float _1287 = sqrt(_1259);
    float _1289 = _1261 * 0.693147182464599609375;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1293 = exp2(_1263);
    float _1295 = _1279 * _1275;
    float _1297 = _1283 * _1275;
    float _1299 = fma(_1295, 0.5, 0.5);
    float _1301 = fma(_1297, -0.5, 0.5);
    float _1303 = _1287 * 0.636619746685028076171875;
    float _1305 = _1225 + 1.0;
    float3 _3411 = float3(_1299, _1301, _1291);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3411, float3(0.0), isnan(_3411)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3411, float3(0.0), isnan(_3411)), level(0.0)).x;
    float _1309 = -_1285;
    float _1311 = fma(_1303, _1309, 1.0);
    float _1313 = -_1225;
    float _1315 = fma(_1293, _1305, _1313);
    float3 _3433 = float3(_1299, _1301, _1291);
    float4 _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3433, float3(0.0), isnan(_3433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3433, float3(0.0), isnan(_3433)), level(0.0)).xyzw;
    float _1320 = _1318.x;
    float _1322 = _1318.y;
    float _1324 = _1318.z;
    float _1326 = _1318.w;
    float _1328 = fma(_1315, 0.5, 0.5);
    float2 _3452 = float2(_1311, _1328);
    float3 _1332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3452, float2(0.0), isnan(_3452)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3452, float2(0.0), isnan(_3452)), level(0.0)).xyz;
    float _1334 = _1332.x;
    float _1336 = _1332.y;
    float _1338 = _1332.z;
    float _1340 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1344 = _1255 * 0.5;
    bool _1346 = _1007 > 0.0;
    bool _1348 = isnan(_1007);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = _1279 + _1255;
    float _1358 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1342);
    float _1360 = exp2(_1340);
    float _1362 = _1356 * 0.5;
    float _1364 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1358);
    float _1366 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1364);
    float _1368 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1370 = _1366 + _1255;
    out.gl_Position.x = _1279;
    out.gl_Position.y = _1283;
    out.gl_Position.z = _1366;
    out.gl_Position.w = _1255;
    float _1372 = _1370 * 0.5;
    float _1374 = -_1360;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1283, -0.5, _1344);
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1362;
    out.m_70.y = _1378;
    out.m_70.z = _1372;
    out.m_70.w = _1255;
    out.m_47.x = _1380;
    float _1384 = _1382 * _1307;
    float _1386 = -_1382;
    float _1388 = _1386 + 1.0;
    float _1390 = _1326 * _1384;
    float _1392 = _1338 * _1384;
    float _1394 = fma(_1334, _1390, _1320);
    float _1396 = fma(_1336, _1390, _1322);
    float _1398 = _1326 * _1388;
    float _1400 = fma(_1326, _1392, _1324);
    out.m_72.x = _1394;
    out.m_72.y = _1396;
    out.m_72.z = _1400;
    out.m_72.w = _1398;
    if (_1354)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1402;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _765 = false;
    bool _309 = false;
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
        float _1459 = as_type<float>(_107);
        out.gl_Position.z = _1459;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _1527 = as_type<float>(_143);
        out.gl_Position.z = _1527;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _209 = _199;
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
    }
    float _241 = _207;
    bool _243 = !_159;
    if (!_243)
    {
        float _245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = log2(_245);
        float _249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _251 = _249 + 1.0;
        float _253 = 1.0 / _251;
        float _255 = _147 * _247;
        float _257 = exp2(_255);
        float _259 = -_257;
        float _261 = _259 + 1.0;
        float _263 = _261 * _253;
        _175 = _263;
    }
    float _265 = _175;
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _269 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _273 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _275 = fma(_265, _161, _269);
    float _277 = fma(_265, _163, _271);
    float _279 = fma(_265, _165, _273);
    float _281 = fma(_275, _149, _167);
    float _283 = fma(_277, _149, _169);
    float _285 = fma(_279, _149, _171);
    bool _287 = !_267;
    float _289 = _285;
    float _307;
    if (!_287)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _317 + _319;
    bool _323 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _325 = isnan(_317);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _355 = -_333;
    float _357 = _355 + 1.0;
    float _359 = 1.0 / _353;
    float _361 = _345 * _357;
    bool _363 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_317);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = -_345;
    float _377 = _375 + 1.0;
    float _379 = in.m_54.x;
    float _381 = in.m_54.y;
    float _383 = 1.0 / _349;
    float _385 = _373 * _377;
    float _387 = _321 * _383;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _391 = _317 + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _397;
    float _401 = _391 * _359;
    float _403 = fma(_395, _387, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _405 = fma(_399, _387, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _409 = _407 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _411 = in.m_58.x;
    float _413 = in.m_58.y;
    float _415 = in.m_58.z;
    float _417 = -_373;
    float _419 = _417 + 1.0;
    float _421 = _405 * _385;
    float _423 = _403 * _385;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _429 = in.m_60.x;
    float _431 = in.m_60.y;
    float _433 = in.m_60.z;
    float _435 = fma(_409, _401, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _437 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _421);
    float _439 = fma(_427, _401, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _441 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _443 = in.m_56.x;
    float _445 = in.m_56.y;
    float _447 = fma(_435, _361, _437);
    float _449 = fma(_439, _361, _441);
    float _451 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].y, _447);
    float _453 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[145].x, _449);
    float _455 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _457 = _451 * _381;
    float _459 = _453 * _379;
    float _461 = _457 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _463 = _283 * _413;
    float _465 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _467 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _469 = _461 * _455;
    float _471 = fma(_281, _411, _463);
    float _473 = _283 * _431;
    float _475 = _467 * _465;
    float _477 = _469 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _479 = _469 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _481 = fma(_281, _429, _473);
    float _483 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _485 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[24].x, _477);
    float _487 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[26].x, _479);
    float _489 = fma(_285, _415, _471);
    float _491 = fma(_285, _433, _481);
    float _493 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[24].z, _485);
    float _495 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[26].z, _487);
    float _497 = _489 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _499 = _491 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _501 = _493 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _503 = _495 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _505 = _469 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _507 = _443 > 0.5;
    float _509 = _497 + _501;
    float _511 = _499 + _503;
    float _513 = fma(_475, (*spvDescriptorSet0.vp_c8)._m0[25].x, _505);
    float _515 = in.m_62.x;
    float _517 = in.m_62.y;
    float _519 = in.m_62.z;
    float _521 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _523 = _509 + _521;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _511 + _525;
    float _529 = fma(_483, (*spvDescriptorSet0.vp_c8)._m0[25].z, _513);
    float _531 = _523 * _523;
    float _533 = _527 * _527;
    float _535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _537 = _529 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _541 = _539 != 0;
    float _543 = _531 + _533;
    float _545 = sqrt(_543);
    float _547 = _283 * _517;
    float _549 = fma(_281, _515, _547);
    float _551 = -_199;
    float _553 = _507 ? _551 : _199;
    bool _555 = _545 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _557 = fma(_285, _519, _549);
    bool _559 = !_541;
    float _561 = _559 ? _199 : _553;
    bool _563 = _445 > 0.5;
    float _565 = _557 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _567 = _565 + _537;
    float _569 = _517;
    float _571 = _553;
    float _573 = _509;
    if (!_555)
    {
        _569 = _533;
    }
    float _575 = _569;
    float _577 = _575;
    if (!_555)
    {
        _571 = _531;
    }
    float _579 = _571;
    float _581 = _579;
    if (!_555)
    {
        _209 = _511;
    }
    float _583 = _209;
    float _585 = _583;
    if (!_555)
    {
        _289 = _567;
    }
    float _587 = _289;
    bool _589 = !_555;
    float _591 = _587;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _597 = _545 + _595;
        float _599 = _567 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _601 = rsqrt(_543);
        float _603 = _597 * _593;
        float _605 = _603 * 0.15915493667125701904296875;
        float _607 = _605 * 6.283185482025146484375;
        float _609 = sin(_607);
        float _611 = _605 * 6.283185482025146484375;
        float _613 = cos(_611);
        float _615 = fma(_609, _599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _617 = _601 * _615;
        float _619 = _613 + (-1.0);
        float _621 = fma(_523, _617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _623 = fma(_527, _617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _625 = _619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _629 = _621 + _627;
        float _631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _633 = _623 + _631;
        float _635 = fma(_567, _613, _625);
        float _637 = _629 * _629;
        float _639 = _633 * _633;
        _591 = _635;
        _581 = _637;
        _577 = _639;
        _573 = _621;
        _585 = _623;
    }
    float _641 = _591;
    float _643 = _581;
    float _645 = _577;
    float _647 = _573;
    float _649 = _585;
    float _651 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _653 = _641 + _651;
    float _655 = _561 + 0.5;
    int _657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _659 = _657 != 0;
    float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _663 = -_203;
    int _665 = _563 ? as_type<int>(_663) : as_type<int>(_203);
    float _667 = fma(_653, _653, _643);
    float _669 = _655 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _671 = !_659;
    float _673 = _671 ? _203 : as_type<float>(_665);
    float _675 = _667 + _645;
    float _677 = _669 * _535;
    float _679 = -_673;
    float _681 = _679 + 0.5;
    float _683 = sqrt(_675);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _697 = _681 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _699 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _703 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _697 * _661;
    bool _715 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _717 = isnan(_683);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _723 = _719 || _721;
    out.m_64.x = _703;
    out.m_64.y = _705;
    out.m_64.z = _707;
    out.m_64.w = _701;
    out.m_66.x = _709;
    out.m_66.y = _699;
    out.m_66.z = _711;
    out.m_68.x = _677;
    out.m_68.y = _713;
    float _725 = _693;
    float _727 = _649;
    float _729 = _699;
    if (!_723)
    {
        _725 = 1.0;
    }
    float _731 = _725;
    bool _733 = !_723;
    float _735 = _731;
    if (!_733)
    {
        bool _737 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _739 = isnan(_683);
        bool _741 = _737 || _739;
        bool _743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _745 = _741 || _743;
        if (!_745)
        {
            float _747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _749 = _683 + _747;
            float _751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _751;
            float _755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _757 = _755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _759 = 1.0 / _753;
            float _761 = _749 * _759;
            float _763 = fma(_761, _757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _735 = _763;
            _765 = true;
        }
        else
        {
            bool _767 = _683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _769 = isnan(_683);
            bool _771 = _767 || _769;
            bool _773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _775 = _771 || _773;
            if (!_775)
            {
                float _777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _779 = _683 + _777;
                float _781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _783 = _781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _787 = _785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _789 = 1.0 / _783;
                float _791 = _779 * _789;
                float _793 = fma(_791, _787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _735 = _793;
                _765 = true;
            }
            else
            {
                _735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _765 = false;
    float _795 = _735;
    float _797 = _565 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _801 = _647 + _799;
    float _803 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[11].x, _797);
    float _805 = _565 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _807 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _809 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _811 = _807 || _809;
    bool _813 = isnan(0.5);
    bool _815 = _811 || _813;
    float _817 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[11].z, _803);
    float _819 = fma(_497, (*spvDescriptorSet0.vp_c8)._m0[10].x, _805);
    bool _821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.5);
    bool _829 = _825 || _827;
    float _831 = _817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_499, (*spvDescriptorSet0.vp_c8)._m0[10].z, _819);
    float _835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _837 = _641 + _835;
    float _839 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _841 = _649 + _839;
    float _843 = 1.0 / _831;
    float _845 = fma(_801, _795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _847 = _833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _849 = fma(_837, _795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _851 = fma(_841, _795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _853 = _847 + _831;
    float _855 = _837;
    float _857 = _847;
    float _859 = _795;
    float _861 = _851;
    float _863 = _831;
    float _865 = _849;
    if (_815)
    {
        _855 = _845;
    }
    float _867 = _855;
    float _869 = _867;
    if (_815)
    {
        _857 = _849;
    }
    float _871 = _857;
    float _873 = _871;
    if (_815)
    {
        _727 = _851;
    }
    float _875 = _727;
    float _877 = _875;
    if (!_815)
    {
        float _879 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _881 = _565 + _879;
        float _883 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _885 = _497 + _883;
        float _887 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _889 = _881 * _881;
        float _891 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _893 = _499 + _891;
        float _895 = fma(_885, _885, _889);
        float _897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _899 = fma(_893, _893, _895);
        float _901 = sqrt(_899);
        float _903 = _887 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _905 = precise::min(_901, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _907 = _905 * _897;
        float _909 = -_497;
        float _911 = _909 + _845;
        float _913 = -_499;
        float _915 = _913 + _851;
        float _917 = _903 * _907;
        float _919 = -_565;
        float _921 = _919 + _849;
        float _923 = fma(_911, _917, _497);
        float _925 = fma(_921, _917, _565);
        float _927 = fma(_915, _917, _499);
        _873 = _925;
        _869 = _923;
        _877 = _927;
        _859 = _911;
    }
    float _929 = _873;
    float _931 = _869;
    float _933 = _877;
    float _935 = _859;
    float _937 = _935;
    if (_829)
    {
        _937 = 1.0;
    }
    float _939 = _937;
    float _941 = _853 * _843;
    float _943 = _941 * 0.5;
    float _945 = _939;
    if (!_829)
    {
        float _947 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _949 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _951 = fma(_943, (*spvDescriptorSet0.vp_c8)._m0[30].w, _949);
        float _953 = _947 * 0.15915493667125701904296875;
        float _955 = _953 * 6.283185482025146484375;
        float _957 = cos(_955);
        float _959 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _961 = _959 * 0.15915493667125701904296875;
        float _963 = _953 * 6.283185482025146484375;
        float _965 = sin(_963);
        float _967 = 1.0 / _957;
        float _969 = _961 * 6.283185482025146484375;
        float _971 = cos(_969);
        float _973 = _965 * _967;
        float _975 = 1.0 / _951;
        float _977 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _979 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _977;
        float _981 = _971 * _973;
        float _983 = _961 * 6.283185482025146484375;
        float _985 = sin(_983);
        float _987 = 1.0 / _981;
        float _989 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _991 = _975 * _989;
        float _993 = 1.0 / _979;
        float _995 = _985 * _987;
        float _997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _999 = fma(_995, _991, _997);
        float _1001 = _999 * _993;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        _861 = _993;
        _945 = _1003;
    }
    float _1005 = _861;
    float _1007 = _945;
    float _1009 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1011 = _929 + _1009;
    float _1013 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1015 = _931 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1019 = _933 + _1017;
    float _1021 = _1011 * _1011;
    float _1023 = fma(_1015, _1015, _1021);
    float _1025 = fma(_1019, _1019, _1023);
    float _1027 = rsqrt(_1025);
    float _1029 = _1027 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1031 = _1015 * _1029;
    float _1033 = _1019 * _1029;
    float _1035 = _1031 * _1031;
    float _1037 = _1033 * _1033;
    float _1039 = _1035 + _1037;
    float _1041 = sqrt(_1039);
    bool _1043 = _1041 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1045 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1047 = _1041 + _1045;
    float _1049 = _1019;
    float _1051 = _1039;
    float _1053 = _1047;
    float _1055 = _1031;
    if (_1043)
    {
        float _1057 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1049 = _1057;
    }
    float _1059 = _1049;
    if (_1043)
    {
        float _1061 = rsqrt(_1039);
        _1051 = _1061;
    }
    float _1063 = _1051;
    float _1065 = _1063;
    if (_1043)
    {
        float _1067 = _1047 * _1059;
        _1053 = _1067;
    }
    float _1069 = _1053;
    if (_1043)
    {
        float _1071 = _1069 * 0.15915493667125701904296875;
        _863 = _1071;
    }
    float _1073 = _863;
    float _1075 = _1027;
    if (_1043)
    {
        float _1077 = _1073 * 6.283185482025146484375;
        float _1079 = sin(_1077);
        _1075 = _1079;
    }
    float _1081 = _1075;
    float _1083 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1085 = precise::max(0.0, _1083);
    float _1087 = _1005;
    float _1089 = _1085;
    float _1091 = _1083;
    if (_1043)
    {
        float _1093 = _1073 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        _1087 = _1095;
    }
    float _1097 = _1087;
    float _1099 = -_1029;
    float _1101 = -_1085;
    float _1103 = fma(_1011, _1099, _1101);
    if (_1043)
    {
        float _1105 = _1103 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1089 = _1105;
    }
    float _1107 = _1089;
    float _1109 = sqrt(_1025);
    float _1111 = _1081;
    float _1113 = _1107;
    if (_1043)
    {
        float _1115 = fma(_1081, _1107, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = _1117;
    if (!_1043)
    {
        _1113 = _1033;
    }
    float _1121 = _1113;
    float _1123 = _1121;
    if (_1043)
    {
        float _1125 = _1097 + (-1.0);
        _1091 = _1125;
    }
    float _1127 = _1091;
    float _1129 = _1127;
    if (_1043)
    {
        float _1131 = _1063 * _1117;
        _729 = _1131;
    }
    float _1133 = _729;
    if (!_1043)
    {
        _1119 = _1103;
    }
    float _1135 = _1119;
    float _1137 = _1135;
    if (_1043)
    {
        float _1139 = _1127 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _865 = _1139;
    }
    float _1141 = _865;
    if (_1043)
    {
        float _1143 = _1031 * _1133;
        _1055 = _1143;
    }
    float _1145 = _1055;
    if (!_1043)
    {
        _1065 = _1035;
    }
    float _1147 = _1065;
    float _1149 = _1147;
    if (_1043)
    {
        float _1151 = _1033 * _1133;
        _1123 = _1151;
    }
    float _1153 = _1123;
    if (_1043)
    {
        float _1155 = fma(_1103, _1097, _1141);
        _1137 = _1155;
    }
    float _1157 = _1137;
    if (_1043)
    {
        float _1159 = _1145 * _1145;
        _1149 = _1159;
    }
    float _1161 = _1149;
    if (!_1043)
    {
        _1129 = _1037;
    }
    float _1163 = _1129;
    float _1165 = _1163;
    if (_1043)
    {
        float _1167 = _1153 * _1153;
        _1165 = _1167;
    }
    float _1169 = _1165;
    float _1171 = fma(_1157, _1157, _1161);
    float _1173 = _1171 + _1169;
    float _1175 = _929 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1179 = fma(_1109, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1177);
    float _1181 = precise::clamp(_1179, 0.0, 1.0);
    float _1183 = _929 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1185 = rsqrt(_1173);
    float _1187 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1175);
    float _1189 = _929 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1191 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1183);
    float _1193 = _929 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1195 = -_1181;
    float _1197 = _1195 + 1.0;
    float _1199 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1189);
    float _1201 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1191);
    float _1203 = fma(_931, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1193);
    float _1205 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1187);
    float _1207 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1211 = fma(_933, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1203);
    float _1213 = _1205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1215 = _1207 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1217 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1219 = _1185 * _1145;
    float _1221 = abs(_1197);
    float _1223 = log2(_1221);
    float _1225 = _1185 * _1157;
    float _1227 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1217);
    float _1229 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1231 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1233 = _1213 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1235 = _1185 * _1153;
    float _1237 = -_1229;
    float _1239 = fma(_1225, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1237);
    float _1241 = _1211 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1243 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1227);
    float _1245 = -_1233;
    float _1247 = fma(_1245, _1231, 1.0);
    float _1249 = -_1235;
    float _1251 = fma(_1249, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1239);
    float _1253 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1255 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1243);
    float _1257 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1259 = fma(_1251, -0.5, 0.5);
    float _1261 = log2(_1247);
    float _1263 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1265 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1257);
    float _1267 = fma(_1251, 0.5, 0.5);
    float _1269 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1253);
    float _1271 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1265);
    float _1273 = fma(_1267, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1275 = 1.0 / _1255;
    float _1277 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1269);
    float _1279 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1271);
    float _1281 = fma(_1267, _1273, -0.212114393711090087890625);
    float _1283 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1277);
    float _1285 = fma(_1267, _1281, 1.570728778839111328125);
    float _1287 = sqrt(_1259);
    float _1289 = _1261 * 0.693147182464599609375;
    float _1291 = _1289 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1293 = exp2(_1263);
    float _1295 = _1279 * _1275;
    float _1297 = _1283 * _1275;
    float _1299 = fma(_1295, 0.5, 0.5);
    float _1301 = fma(_1297, -0.5, 0.5);
    float _1303 = _1287 * 0.636619746685028076171875;
    float _1305 = _1225 + 1.0;
    float3 _3411 = float3(_1299, _1301, _1291);
    float _1307 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3411, float3(0.0), isnan(_3411)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3411, float3(0.0), isnan(_3411)), level(0.0)).x;
    float _1309 = -_1285;
    float _1311 = fma(_1303, _1309, 1.0);
    float _1313 = -_1225;
    float _1315 = fma(_1293, _1305, _1313);
    float3 _3433 = float3(_1299, _1301, _1291);
    float4 _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3433, float3(0.0), isnan(_3433)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3433, float3(0.0), isnan(_3433)), level(0.0)).xyzw;
    float _1320 = _1318.x;
    float _1322 = _1318.y;
    float _1324 = _1318.z;
    float _1326 = _1318.w;
    float _1328 = fma(_1315, 0.5, 0.5);
    float2 _3452 = float2(_1311, _1328);
    float3 _1332 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3452, float2(0.0), isnan(_3452)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3452, float2(0.0), isnan(_3452)), level(0.0)).xyz;
    float _1334 = _1332.x;
    float _1336 = _1332.y;
    float _1338 = _1332.z;
    float _1340 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1342 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1344 = _1255 * 0.5;
    bool _1346 = _1007 > 0.0;
    bool _1348 = isnan(_1007);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = _1279 + _1255;
    float _1358 = fma(_1215, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1342);
    float _1360 = exp2(_1340);
    float _1362 = _1356 * 0.5;
    float _1364 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1358);
    float _1366 = fma(_1241, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1364);
    float _1368 = _1007 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1370 = _1366 + _1255;
    out.gl_Position.x = _1279;
    out.gl_Position.y = _1283;
    out.gl_Position.z = _1366;
    out.gl_Position.w = _1255;
    float _1372 = _1370 * 0.5;
    float _1374 = -_1360;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1283, -0.5, _1344);
    float _1380 = _1368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1382 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _1362;
    out.m_70.y = _1378;
    out.m_70.z = _1372;
    out.m_70.w = _1255;
    out.m_47.x = _1380;
    float _1384 = _1382 * _1307;
    float _1386 = -_1382;
    float _1388 = _1386 + 1.0;
    float _1390 = _1326 * _1384;
    float _1392 = _1338 * _1384;
    float _1394 = fma(_1334, _1390, _1320);
    float _1396 = fma(_1336, _1390, _1322);
    float _1398 = _1326 * _1388;
    float _1400 = fma(_1326, _1392, _1324);
    out.m_72.x = _1394;
    out.m_72.y = _1396;
    out.m_72.z = _1400;
    out.m_72.w = _1398;
    if (_1354)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1402;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

