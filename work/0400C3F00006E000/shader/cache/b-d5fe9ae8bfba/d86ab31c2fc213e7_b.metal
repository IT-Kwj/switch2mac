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
    float4 m_58 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _697 = false;
    bool _391 = false;
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
        float _1987 = as_type<float>(_107);
        out.gl_Position.z = _1987;
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
        float _2056 = as_type<float>(_143);
        out.gl_Position.z = _2056;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = -_295;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_313);
    float _327 = fma(_283, _185, _315);
    bool _329 = !_293;
    int _331 = _329 ? 0 : 1;
    float _333 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = !_207;
    int _337 = _335 ? 0 : 1;
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_283, _187, _333);
    int _345 = abs(_331);
    float _347 = fma(_283, _189, _339);
    int _349 = abs(_337);
    float _351 = float(_325);
    float _353 = float(_349);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_327, _285, _305);
    float _361 = float(_345);
    float _363 = fma(_353, _323, _357);
    float _365 = fma(_343, _285, _307);
    float _367 = fma(_347, _285, _309);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_341;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _419;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _399 + _427;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _407;
    float _441 = _429 * _417;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _399 + _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _399 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _415;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _399 + _459;
    float _463 = _445 * _425;
    bool _465 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_399);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    out.m_58.x = _435;
    out.m_58.y = _447;
    out.m_58.z = _449;
    out.m_58.w = _437;
    float _477 = 1.0 / _421;
    float _479 = _461 * _439;
    bool _481 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _483 = isnan(_399);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _495 = _399 + _493;
    float _497 = _453 * _457;
    float _499 = -_491;
    float _501 = _499 + 1.0;
    bool _503 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_399);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_475;
    float _517 = _515 + 1.0;
    float _519 = _475 * _501;
    bool _521 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _523 = isnan(_399);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_513;
    float _535 = _533 + 1.0;
    float _537 = _495 * _477;
    float _539 = _513 * _517;
    bool _541 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_399);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    bool _561 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_399);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _531 * _535;
    float _575 = -_531;
    float _577 = _575 + 1.0;
    float _579 = -_551;
    float _581 = _579 + 1.0;
    float _583 = fma(_555, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = fma(_559, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = _551 * _577;
    float _593 = _571 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = fma(_589, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _601;
    float _605 = _583 * _593;
    float _607 = -_571;
    float _609 = _607 + 1.0;
    float _611 = _585 * _593;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _621 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = fma(_615, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_599, _591, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_617, _591, _623);
    float _643 = fma(_633, _497, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _645;
    float _649 = fma(_619, _573, _635);
    float _651 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _653;
    float _657 = fma(_629, _573, _641);
    float _659 = fma(_647, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _661 = fma(_643, _539, _649);
    float _663 = fma(_655, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _665 = fma(_651, _539, _657);
    float _667 = fma(_659, _519, _661);
    float _669 = fma(_663, _519, _665);
    float _671 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].x, _667);
    float _673 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].y, _669);
    float _675 = _671 * _625;
    float _677 = _673 * _627;
    bool _679 = !_455;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_91);
        float _701 = 1.0 / _699;
        float _703 = _125 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_60.x;
    float _709 = in.m_60.y;
    float _711 = in.m_60.z;
    float _713 = _371 * _675;
    bool _715 = _145 > 0.5;
    float _717 = in.m_62.x;
    float _719 = in.m_62.y;
    float _721 = in.m_62.z;
    float _723 = _371 * _677;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _733 = in.m_64.x;
    float _735 = in.m_64.y;
    float _737 = in.m_64.z;
    float _739 = 1.0 / _727;
    float _741 = in.m_51.y;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _751 = _749 != 0;
    float _753 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _755 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _757 = isnan(_705);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = 1.0 / _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _769;
    bool _773 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _775 = isnan(_705);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    bool _785 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_705);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = _365 * _709;
    float _799 = 1.0 / _771;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _803 = _365 * _719;
    float _805 = fma(_359, _707, _797);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _807;
    float _811 = _365 * _735;
    float _813 = fma(_359, _717, _803);
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _817 = fma(_359, _733, _811);
    float _819 = -_215;
    int _821 = _715 ? as_type<int>(_819) : as_type<int>(_215);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _827;
    float _831 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _833 = !_745;
    float _835 = _833 ? _215 : as_type<float>(_821);
    float _837 = _747 * _815;
    float _839 = 1.0 / _825;
    float _841 = _831 * _801;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _845 = _705 + _843;
    bool _847 = _741 > 0.5;
    float _849 = fma(_367, _711, _805);
    float _851 = fma(_367, _737, _817);
    float _853 = _845 * _799;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _857 = _705 + _855;
    float _859 = 1.0 / _829;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _705 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _867 = _705 + _865;
    float _869 = fma(_367, _721, _813);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _705 + _871;
    float _875 = _863 * _767;
    float _877 = -_223;
    int _879 = _847 ? as_type<int>(_877) : as_type<int>(_223);
    float _881 = _857 * _839;
    float _883 = _873 * _739;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    bool _893 = !_751;
    float _895 = _893 ? _223 : as_type<float>(_879);
    float _897 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _867 * _859;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _907 = fma(_903, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _909 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _911 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _939 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _941 = fma(_927, _881, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _943 = fma(_931, _881, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _945 = fma(_935, _881, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _947 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _961 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _963 = isnan(_705);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _939);
    float _975 = fma(_915, _853, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _977 = fma(_919, _853, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _979 = fma(_923, _853, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _981 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_705);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = _849 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_951, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _999 = fma(_955, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1001 = fma(_959, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1003 = _851 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1005 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1007 = -_971;
    float _1009 = _1007 + 1.0;
    float _1011 = -_991;
    float _1013 = _1011 + 1.0;
    float _1015 = _993 + _995;
    float _1017 = _1003 + _1005;
    float _1019 = _991 * _1009;
    bool _1021 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1023 = isnan(_705);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _765 * _1013;
    float _1035 = -_765;
    float _1037 = _1035 + 1.0;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1015 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1045 = _1017 + _1043;
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = _1031 * _1037;
    float _1053 = _1041 * _1041;
    float _1055 = _1045 * _1045;
    float _1057 = _795 * _1049;
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1065 = _1053 + _1055;
    float _1067 = _783 * _1061;
    float _1069 = -_783;
    float _1071 = _1069 + 1.0;
    float _1073 = sqrt(_1065);
    float _1075 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1063);
    float _1077 = _907 * _1067;
    float _1079 = _905 * _1067;
    float _1081 = _909 * _1067;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1079);
    float _1089 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1081);
    float _1093 = fma(_997, _1057, _1085);
    float _1095 = fma(_999, _1057, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1105;
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _1089 + _1099;
    float _1113 = fma(_1001, _1057, _1091);
    float _1115 = fma(_975, _1051, _1093);
    float _1117 = fma(_809, _899, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1119 = fma(_1103, _899, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1121 = fma(_1107, _899, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1123 = fma(_977, _1051, _1095);
    float _1125 = fma(_979, _1051, _1113);
    float _1127 = fma(_941, _1033, _1115);
    float _1129 = _1099;
    float _1131 = _1053;
    float _1133 = _1055;
    float _1135 = _1017;
    float _1137 = _1015;
    if (!_1109)
    {
        _1129 = _1111;
    }
    float _1139 = _1129;
    bool _1141 = !_1109;
    float _1143 = _1139;
    float _1145 = _1097;
    if (!_1141)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1073 + _1149;
        float _1153 = rsqrt(_1065);
        float _1155 = _1151 * _1147;
        float _1157 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = _1155 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1157, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1153 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1041, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1045, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1111, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1143 = _1189;
        _1131 = _1191;
        _1133 = _1193;
        _1135 = _1177;
        _1137 = _1175;
    }
    float _1195 = _1143;
    float _1197 = _1131;
    float _1199 = _1133;
    float _1201 = _1135;
    float _1203 = _1137;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1211 = fma(_943, _1033, _1123);
    float _1213 = fma(_945, _1033, _1125);
    float _1215 = fma(_1207, _1207, _1197);
    float _1217 = fma(_1117, _1019, _1127);
    float _1219 = fma(_1119, _1019, _1211);
    float _1221 = fma(_1121, _1019, _1213);
    float _1223 = _1215 + _1199;
    float _1225 = -_895;
    float _1227 = _1225 + 0.5;
    float _1229 = _835 + 0.5;
    float _1231 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1217);
    float _1233 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1219);
    float _1235 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1221);
    float _1237 = sqrt(_1223);
    float _1239 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = _1239 * _1209;
    float _1251 = _1241 * _1097;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1251;
    out.m_66.y = _1249;
    out.m_68.x = _1253;
    out.m_68.y = _1255;
    out.m_68.z = _1257;
    bool _1259 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1261 = isnan(_1237);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1267 = _1263 || _1265;
    float _1269 = _1251;
    if (!_1267)
    {
        _1145 = 1.0;
    }
    float _1271 = _1145;
    bool _1273 = !_1267;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1237);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1237 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1237);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1237 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1195 + _1339;
    float _1343 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1337);
    float _1345 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1201 + _1357;
    float _1361 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1343);
    bool _1363 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1377 = _1203 + _1375;
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1381 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1383 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1373);
    float _1385 = fma(_1377, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1387 = 1.0 / _1379;
    float _1389 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = _1377;
    float _1395 = _1391;
    float _1397 = _1341;
    float _1399 = _1335;
    if (_1355)
    {
        _1393 = _1385;
    }
    float _1401 = _1393;
    float _1403 = _1391 + _1379;
    float _1405 = _1401;
    if (_1355)
    {
        _1395 = _1381;
    }
    float _1407 = _1395;
    float _1409 = _1407;
    if (_1355)
    {
        _1397 = _1389;
    }
    float _1411 = _1397;
    float _1413 = _1411;
    float _1415 = _1387;
    if (!_1355)
    {
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1419 = _1089 + _1417;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1423 = _993 + _1421;
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1427 = -_1089;
        float _1429 = _1427 + _1381;
        float _1431 = _1419 * _1419;
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1435 = _1003 + _1433;
        float _1437 = fma(_1423, _1423, _1431);
        float _1439 = -_993;
        float _1441 = _1439 + _1385;
        float _1443 = fma(_1435, _1435, _1437);
        float _1445 = sqrt(_1443);
        float _1447 = precise::min(_1445, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1449 = _1447 * _1425;
        float _1451 = -_1003;
        float _1453 = _1451 + _1389;
        float _1455 = fma(_1441, _1449, _993);
        float _1457 = fma(_1429, _1449, _1089);
        float _1459 = fma(_1453, _1449, _1003);
        _1409 = _1457;
        _1405 = _1455;
        _1413 = _1459;
        _1399 = _1445;
    }
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _1399;
    float _1469 = _1467;
    if (_1371)
    {
        _1469 = 1.0;
    }
    float _1471 = _1469;
    float _1473 = _1403 * _1387;
    float _1475 = _1473 * 0.5;
    float _1477 = _1471;
    if (!_1371)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = 1.0 / _1483;
        float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1509;
        float _1513 = _1503 * _1505;
        float _1515 = _1493 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = 1.0 / _1513;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1523 = _1507 * _1521;
        float _1525 = 1.0 / _1511;
        float _1527 = _1517 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1531 = fma(_1527, _1523, _1529);
        float _1533 = _1531 * _1525;
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -_1535;
        float _1539 = _1537 + 1.0;
        _1415 = _1493;
        _1477 = _1539;
    }
    float _1541 = _1415;
    float _1543 = _1477;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1461 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1463 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1465 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1567 = _1551 * _1565;
    float _1569 = _1555 * _1565;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1559;
    float _1587 = _1541;
    float _1589 = _1583;
    float _1591 = _1565;
    float _1593 = _1567;
    float _1595 = _1571;
    if (_1579)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1597;
    }
    float _1599 = _1585;
    if (_1579)
    {
        float _1601 = rsqrt(_1575);
        _1587 = _1601;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1579)
    {
        float _1607 = _1583 * _1599;
        _1589 = _1607;
    }
    float _1609 = _1589;
    if (_1579)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1269 = _1611;
    }
    float _1613 = _1269;
    float _1615 = _1563;
    if (_1579)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1555;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1579)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1565;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (_1579)
    {
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1645;
    }
    float _1647 = _1629;
    float _1649 = sqrt(_1561);
    float _1651 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1653 = _1647;
    float _1655 = _1621;
    if (_1579)
    {
        float _1657 = fma(_1621, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1651);
    float _1663 = _1659;
    if (_1579)
    {
        float _1665 = _1637 + (-1.0);
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = _1667;
    if (_1579)
    {
        float _1671 = _1603 * _1659;
        _1655 = _1671;
    }
    float _1673 = _1655;
    if (!_1579)
    {
        _1605 = _1643;
    }
    float _1675 = _1605;
    float _1677 = _1675;
    if (_1579)
    {
        float _1679 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1679;
    }
    float _1681 = _1591;
    if (_1579)
    {
        float _1683 = _1567 * _1673;
        _1593 = _1683;
    }
    float _1685 = _1593;
    if (!_1579)
    {
        _1663 = _1569;
    }
    float _1687 = _1663;
    float _1689 = _1687;
    if (_1579)
    {
        float _1691 = _1569 * _1673;
        _1689 = _1691;
    }
    float _1693 = _1689;
    if (_1579)
    {
        float _1695 = fma(_1643, _1637, _1681);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (_1579)
    {
        float _1699 = _1685 * _1685;
        _1595 = _1699;
    }
    float _1701 = _1595;
    if (!_1579)
    {
        _1669 = _1573;
    }
    float _1703 = _1669;
    float _1705 = _1703;
    if (_1579)
    {
        float _1707 = _1693 * _1693;
        _1705 = _1707;
    }
    float _1709 = _1705;
    float _1711 = fma(_1697, _1697, _1701);
    float _1713 = _1711 + _1709;
    float _1715 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1719 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1717);
    float _1721 = precise::clamp(_1719, 0.0, 1.0);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = rsqrt(_1713);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1715);
    float _1729 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1731 = -_1721;
    float _1733 = _1731 + 1.0;
    float _1735 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1739 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1729);
    float _1741 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1743 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1747 = abs(_1733);
    float _1749 = log2(_1747);
    float _1751 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1759 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1725 * _1685;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1765 = -_1753;
    float _1767 = fma(_1765, _1723, 1.0);
    float _1769 = _1725 * _1697;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1775 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = _1725 * _1693;
    float _1779 = -_1771;
    float _1781 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1773);
    float _1785 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1787 = log2(_1767);
    float _1789 = -_1777;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1793 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1797 = fma(_1791, -0.5, 0.5);
    float _1799 = fma(_1791, 0.5, 0.5);
    float _1801 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1803 = exp2(_1785);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1793);
    float _1809 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1801);
    float _1811 = _1769 + 1.0;
    float _1813 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1805;
    float _1819 = fma(_1799, _1813, -0.212114393711090087890625);
    float _1821 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1809);
    float _1825 = _1787 * 0.693147182464599609375;
    float _1827 = fma(_1799, _1819, 1.570728778839111328125);
    float _1829 = sqrt(_1797);
    float _1831 = -_1769;
    float _1833 = fma(_1803, _1811, _1831);
    float _1835 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1837 = fma(_1833, 0.5, 0.5);
    float _1839 = _1821 * _1817;
    float _1841 = _1823 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1829 * 0.636619746685028076171875;
    float3 _4799 = float3(_1843, _1845, _1835);
    float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).x;
    float _1851 = -_1827;
    float _1853 = fma(_1847, _1851, 1.0);
    float3 _4815 = float3(_1843, _1845, _1835);
    float4 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4815, float3(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4815, float3(0.0), isnan(_4815)), level(0.0)).xyzw;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = _1856.w;
    float2 _4832 = float2(_1853, _1837);
    float3 _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4832, float2(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4832, float2(0.0), isnan(_4832)), level(0.0)).xyz;
    float _1870 = _1868.x;
    float _1872 = _1868.y;
    float _1874 = _1868.z;
    float _1876 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1878 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1880 = _1543 > 0.0;
    bool _1882 = isnan(_1543);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1892 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1878);
    float _1894 = exp2(_1876);
    float _1896 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1898 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1900 = _1898 + _1805;
    out.gl_Position.x = _1821;
    out.gl_Position.y = _1823;
    out.gl_Position.z = _1898;
    out.gl_Position.w = _1805;
    float _1902 = _1900 * 0.5;
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1910 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1902;
    out.m_70.w = _1805;
    out.m_47.x = _1908;
    float _1912 = _1910 * _1849;
    float _1914 = -_1910;
    float _1916 = _1914 + 1.0;
    float _1918 = _1864 * _1912;
    float _1920 = _1874 * _1912;
    float _1922 = fma(_1870, _1918, _1858);
    float _1924 = fma(_1872, _1918, _1860);
    float _1926 = _1864 * _1916;
    float _1928 = fma(_1864, _1920, _1862);
    out.m_72.x = _1922;
    out.m_72.y = _1924;
    out.m_72.z = _1928;
    out.m_72.w = _1926;
    if (_1888)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1930;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _697 = false;
    bool _391 = false;
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
        float _1987 = as_type<float>(_107);
        out.gl_Position.z = _1987;
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
        float _2056 = as_type<float>(_143);
        out.gl_Position.z = _2056;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = -_295;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_313);
    float _327 = fma(_283, _185, _315);
    bool _329 = !_293;
    int _331 = _329 ? 0 : 1;
    float _333 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = !_207;
    int _337 = _335 ? 0 : 1;
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_283, _187, _333);
    int _345 = abs(_331);
    float _347 = fma(_283, _189, _339);
    int _349 = abs(_337);
    float _351 = float(_325);
    float _353 = float(_349);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_327, _285, _305);
    float _361 = float(_345);
    float _363 = fma(_353, _323, _357);
    float _365 = fma(_343, _285, _307);
    float _367 = fma(_347, _285, _309);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_341;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _419;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _399 + _427;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _407;
    float _441 = _429 * _417;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _399 + _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _399 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _415;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _399 + _459;
    float _463 = _445 * _425;
    bool _465 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_399);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    out.m_58.x = _435;
    out.m_58.y = _447;
    out.m_58.z = _449;
    out.m_58.w = _437;
    float _477 = 1.0 / _421;
    float _479 = _461 * _439;
    bool _481 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _483 = isnan(_399);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _495 = _399 + _493;
    float _497 = _453 * _457;
    float _499 = -_491;
    float _501 = _499 + 1.0;
    bool _503 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_399);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_475;
    float _517 = _515 + 1.0;
    float _519 = _475 * _501;
    bool _521 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _523 = isnan(_399);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_513;
    float _535 = _533 + 1.0;
    float _537 = _495 * _477;
    float _539 = _513 * _517;
    bool _541 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_399);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    bool _561 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_399);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _531 * _535;
    float _575 = -_531;
    float _577 = _575 + 1.0;
    float _579 = -_551;
    float _581 = _579 + 1.0;
    float _583 = fma(_555, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = fma(_559, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = _551 * _577;
    float _593 = _571 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = fma(_589, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _601;
    float _605 = _583 * _593;
    float _607 = -_571;
    float _609 = _607 + 1.0;
    float _611 = _585 * _593;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _621 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = fma(_615, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_599, _591, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_617, _591, _623);
    float _643 = fma(_633, _497, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _645;
    float _649 = fma(_619, _573, _635);
    float _651 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _653;
    float _657 = fma(_629, _573, _641);
    float _659 = fma(_647, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _661 = fma(_643, _539, _649);
    float _663 = fma(_655, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _665 = fma(_651, _539, _657);
    float _667 = fma(_659, _519, _661);
    float _669 = fma(_663, _519, _665);
    float _671 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].x, _667);
    float _673 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].y, _669);
    float _675 = _671 * _625;
    float _677 = _673 * _627;
    bool _679 = !_455;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_91);
        float _701 = 1.0 / _699;
        float _703 = _125 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_60.x;
    float _709 = in.m_60.y;
    float _711 = in.m_60.z;
    float _713 = _371 * _675;
    bool _715 = _145 > 0.5;
    float _717 = in.m_62.x;
    float _719 = in.m_62.y;
    float _721 = in.m_62.z;
    float _723 = _371 * _677;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _733 = in.m_64.x;
    float _735 = in.m_64.y;
    float _737 = in.m_64.z;
    float _739 = 1.0 / _727;
    float _741 = in.m_51.y;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _751 = _749 != 0;
    float _753 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _755 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _757 = isnan(_705);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = 1.0 / _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _769;
    bool _773 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _775 = isnan(_705);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    bool _785 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_705);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = _365 * _709;
    float _799 = 1.0 / _771;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _803 = _365 * _719;
    float _805 = fma(_359, _707, _797);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _807;
    float _811 = _365 * _735;
    float _813 = fma(_359, _717, _803);
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _817 = fma(_359, _733, _811);
    float _819 = -_215;
    int _821 = _715 ? as_type<int>(_819) : as_type<int>(_215);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _827;
    float _831 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _833 = !_745;
    float _835 = _833 ? _215 : as_type<float>(_821);
    float _837 = _747 * _815;
    float _839 = 1.0 / _825;
    float _841 = _831 * _801;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _845 = _705 + _843;
    bool _847 = _741 > 0.5;
    float _849 = fma(_367, _711, _805);
    float _851 = fma(_367, _737, _817);
    float _853 = _845 * _799;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _857 = _705 + _855;
    float _859 = 1.0 / _829;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _705 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _867 = _705 + _865;
    float _869 = fma(_367, _721, _813);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _705 + _871;
    float _875 = _863 * _767;
    float _877 = -_223;
    int _879 = _847 ? as_type<int>(_877) : as_type<int>(_223);
    float _881 = _857 * _839;
    float _883 = _873 * _739;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    bool _893 = !_751;
    float _895 = _893 ? _223 : as_type<float>(_879);
    float _897 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _867 * _859;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _907 = fma(_903, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _909 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _911 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _939 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _941 = fma(_927, _881, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _943 = fma(_931, _881, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _945 = fma(_935, _881, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _947 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _961 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _963 = isnan(_705);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _939);
    float _975 = fma(_915, _853, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _977 = fma(_919, _853, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _979 = fma(_923, _853, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _981 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_705);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = _849 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_951, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _999 = fma(_955, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1001 = fma(_959, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1003 = _851 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1005 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1007 = -_971;
    float _1009 = _1007 + 1.0;
    float _1011 = -_991;
    float _1013 = _1011 + 1.0;
    float _1015 = _993 + _995;
    float _1017 = _1003 + _1005;
    float _1019 = _991 * _1009;
    bool _1021 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1023 = isnan(_705);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _765 * _1013;
    float _1035 = -_765;
    float _1037 = _1035 + 1.0;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1015 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1045 = _1017 + _1043;
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = _1031 * _1037;
    float _1053 = _1041 * _1041;
    float _1055 = _1045 * _1045;
    float _1057 = _795 * _1049;
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1065 = _1053 + _1055;
    float _1067 = _783 * _1061;
    float _1069 = -_783;
    float _1071 = _1069 + 1.0;
    float _1073 = sqrt(_1065);
    float _1075 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1063);
    float _1077 = _907 * _1067;
    float _1079 = _905 * _1067;
    float _1081 = _909 * _1067;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1079);
    float _1089 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1081);
    float _1093 = fma(_997, _1057, _1085);
    float _1095 = fma(_999, _1057, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1105;
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _1089 + _1099;
    float _1113 = fma(_1001, _1057, _1091);
    float _1115 = fma(_975, _1051, _1093);
    float _1117 = fma(_809, _899, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1119 = fma(_1103, _899, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1121 = fma(_1107, _899, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1123 = fma(_977, _1051, _1095);
    float _1125 = fma(_979, _1051, _1113);
    float _1127 = fma(_941, _1033, _1115);
    float _1129 = _1099;
    float _1131 = _1053;
    float _1133 = _1055;
    float _1135 = _1017;
    float _1137 = _1015;
    if (!_1109)
    {
        _1129 = _1111;
    }
    float _1139 = _1129;
    bool _1141 = !_1109;
    float _1143 = _1139;
    float _1145 = _1097;
    if (!_1141)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1073 + _1149;
        float _1153 = rsqrt(_1065);
        float _1155 = _1151 * _1147;
        float _1157 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = _1155 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1157, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1153 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1041, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1045, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1111, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1143 = _1189;
        _1131 = _1191;
        _1133 = _1193;
        _1135 = _1177;
        _1137 = _1175;
    }
    float _1195 = _1143;
    float _1197 = _1131;
    float _1199 = _1133;
    float _1201 = _1135;
    float _1203 = _1137;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1211 = fma(_943, _1033, _1123);
    float _1213 = fma(_945, _1033, _1125);
    float _1215 = fma(_1207, _1207, _1197);
    float _1217 = fma(_1117, _1019, _1127);
    float _1219 = fma(_1119, _1019, _1211);
    float _1221 = fma(_1121, _1019, _1213);
    float _1223 = _1215 + _1199;
    float _1225 = -_895;
    float _1227 = _1225 + 0.5;
    float _1229 = _835 + 0.5;
    float _1231 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1217);
    float _1233 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1219);
    float _1235 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1221);
    float _1237 = sqrt(_1223);
    float _1239 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = _1239 * _1209;
    float _1251 = _1241 * _1097;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1251;
    out.m_66.y = _1249;
    out.m_68.x = _1253;
    out.m_68.y = _1255;
    out.m_68.z = _1257;
    bool _1259 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1261 = isnan(_1237);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1267 = _1263 || _1265;
    float _1269 = _1251;
    if (!_1267)
    {
        _1145 = 1.0;
    }
    float _1271 = _1145;
    bool _1273 = !_1267;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1237);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1237 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1237);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1237 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1195 + _1339;
    float _1343 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1337);
    float _1345 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1201 + _1357;
    float _1361 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1343);
    bool _1363 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1377 = _1203 + _1375;
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1381 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1383 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1373);
    float _1385 = fma(_1377, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1387 = 1.0 / _1379;
    float _1389 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = _1377;
    float _1395 = _1391;
    float _1397 = _1341;
    float _1399 = _1335;
    if (_1355)
    {
        _1393 = _1385;
    }
    float _1401 = _1393;
    float _1403 = _1391 + _1379;
    float _1405 = _1401;
    if (_1355)
    {
        _1395 = _1381;
    }
    float _1407 = _1395;
    float _1409 = _1407;
    if (_1355)
    {
        _1397 = _1389;
    }
    float _1411 = _1397;
    float _1413 = _1411;
    float _1415 = _1387;
    if (!_1355)
    {
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1419 = _1089 + _1417;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1423 = _993 + _1421;
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1427 = -_1089;
        float _1429 = _1427 + _1381;
        float _1431 = _1419 * _1419;
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1435 = _1003 + _1433;
        float _1437 = fma(_1423, _1423, _1431);
        float _1439 = -_993;
        float _1441 = _1439 + _1385;
        float _1443 = fma(_1435, _1435, _1437);
        float _1445 = sqrt(_1443);
        float _1447 = precise::min(_1445, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1449 = _1447 * _1425;
        float _1451 = -_1003;
        float _1453 = _1451 + _1389;
        float _1455 = fma(_1441, _1449, _993);
        float _1457 = fma(_1429, _1449, _1089);
        float _1459 = fma(_1453, _1449, _1003);
        _1409 = _1457;
        _1405 = _1455;
        _1413 = _1459;
        _1399 = _1445;
    }
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _1399;
    float _1469 = _1467;
    if (_1371)
    {
        _1469 = 1.0;
    }
    float _1471 = _1469;
    float _1473 = _1403 * _1387;
    float _1475 = _1473 * 0.5;
    float _1477 = _1471;
    if (!_1371)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = 1.0 / _1483;
        float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1509;
        float _1513 = _1503 * _1505;
        float _1515 = _1493 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = 1.0 / _1513;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1523 = _1507 * _1521;
        float _1525 = 1.0 / _1511;
        float _1527 = _1517 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1531 = fma(_1527, _1523, _1529);
        float _1533 = _1531 * _1525;
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -_1535;
        float _1539 = _1537 + 1.0;
        _1415 = _1493;
        _1477 = _1539;
    }
    float _1541 = _1415;
    float _1543 = _1477;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1461 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1463 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1465 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1567 = _1551 * _1565;
    float _1569 = _1555 * _1565;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1559;
    float _1587 = _1541;
    float _1589 = _1583;
    float _1591 = _1565;
    float _1593 = _1567;
    float _1595 = _1571;
    if (_1579)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1597;
    }
    float _1599 = _1585;
    if (_1579)
    {
        float _1601 = rsqrt(_1575);
        _1587 = _1601;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1579)
    {
        float _1607 = _1583 * _1599;
        _1589 = _1607;
    }
    float _1609 = _1589;
    if (_1579)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1269 = _1611;
    }
    float _1613 = _1269;
    float _1615 = _1563;
    if (_1579)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1555;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1579)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1565;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (_1579)
    {
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1645;
    }
    float _1647 = _1629;
    float _1649 = sqrt(_1561);
    float _1651 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1653 = _1647;
    float _1655 = _1621;
    if (_1579)
    {
        float _1657 = fma(_1621, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1651);
    float _1663 = _1659;
    if (_1579)
    {
        float _1665 = _1637 + (-1.0);
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = _1667;
    if (_1579)
    {
        float _1671 = _1603 * _1659;
        _1655 = _1671;
    }
    float _1673 = _1655;
    if (!_1579)
    {
        _1605 = _1643;
    }
    float _1675 = _1605;
    float _1677 = _1675;
    if (_1579)
    {
        float _1679 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1679;
    }
    float _1681 = _1591;
    if (_1579)
    {
        float _1683 = _1567 * _1673;
        _1593 = _1683;
    }
    float _1685 = _1593;
    if (!_1579)
    {
        _1663 = _1569;
    }
    float _1687 = _1663;
    float _1689 = _1687;
    if (_1579)
    {
        float _1691 = _1569 * _1673;
        _1689 = _1691;
    }
    float _1693 = _1689;
    if (_1579)
    {
        float _1695 = fma(_1643, _1637, _1681);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (_1579)
    {
        float _1699 = _1685 * _1685;
        _1595 = _1699;
    }
    float _1701 = _1595;
    if (!_1579)
    {
        _1669 = _1573;
    }
    float _1703 = _1669;
    float _1705 = _1703;
    if (_1579)
    {
        float _1707 = _1693 * _1693;
        _1705 = _1707;
    }
    float _1709 = _1705;
    float _1711 = fma(_1697, _1697, _1701);
    float _1713 = _1711 + _1709;
    float _1715 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1719 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1717);
    float _1721 = precise::clamp(_1719, 0.0, 1.0);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = rsqrt(_1713);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1715);
    float _1729 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1731 = -_1721;
    float _1733 = _1731 + 1.0;
    float _1735 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1739 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1729);
    float _1741 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1743 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1747 = abs(_1733);
    float _1749 = log2(_1747);
    float _1751 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1759 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1725 * _1685;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1765 = -_1753;
    float _1767 = fma(_1765, _1723, 1.0);
    float _1769 = _1725 * _1697;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1775 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = _1725 * _1693;
    float _1779 = -_1771;
    float _1781 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1773);
    float _1785 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1787 = log2(_1767);
    float _1789 = -_1777;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1793 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1797 = fma(_1791, -0.5, 0.5);
    float _1799 = fma(_1791, 0.5, 0.5);
    float _1801 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1803 = exp2(_1785);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1793);
    float _1809 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1801);
    float _1811 = _1769 + 1.0;
    float _1813 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1805;
    float _1819 = fma(_1799, _1813, -0.212114393711090087890625);
    float _1821 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1809);
    float _1825 = _1787 * 0.693147182464599609375;
    float _1827 = fma(_1799, _1819, 1.570728778839111328125);
    float _1829 = sqrt(_1797);
    float _1831 = -_1769;
    float _1833 = fma(_1803, _1811, _1831);
    float _1835 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1837 = fma(_1833, 0.5, 0.5);
    float _1839 = _1821 * _1817;
    float _1841 = _1823 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1829 * 0.636619746685028076171875;
    float3 _4799 = float3(_1843, _1845, _1835);
    float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).x;
    float _1851 = -_1827;
    float _1853 = fma(_1847, _1851, 1.0);
    float3 _4815 = float3(_1843, _1845, _1835);
    float4 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4815, float3(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4815, float3(0.0), isnan(_4815)), level(0.0)).xyzw;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = _1856.w;
    float2 _4832 = float2(_1853, _1837);
    float3 _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4832, float2(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4832, float2(0.0), isnan(_4832)), level(0.0)).xyz;
    float _1870 = _1868.x;
    float _1872 = _1868.y;
    float _1874 = _1868.z;
    float _1876 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1878 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1880 = _1543 > 0.0;
    bool _1882 = isnan(_1543);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1892 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1878);
    float _1894 = exp2(_1876);
    float _1896 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1898 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1900 = _1898 + _1805;
    out.gl_Position.x = _1821;
    out.gl_Position.y = _1823;
    out.gl_Position.z = _1898;
    out.gl_Position.w = _1805;
    float _1902 = _1900 * 0.5;
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1910 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1902;
    out.m_70.w = _1805;
    out.m_47.x = _1908;
    float _1912 = _1910 * _1849;
    float _1914 = -_1910;
    float _1916 = _1914 + 1.0;
    float _1918 = _1864 * _1912;
    float _1920 = _1874 * _1912;
    float _1922 = fma(_1870, _1918, _1858);
    float _1924 = fma(_1872, _1918, _1860);
    float _1926 = _1864 * _1916;
    float _1928 = fma(_1864, _1920, _1862);
    out.m_72.x = _1922;
    out.m_72.y = _1924;
    out.m_72.z = _1928;
    out.m_72.w = _1926;
    if (_1888)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1930;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1305 = false;
    bool _697 = false;
    bool _391 = false;
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
        float _1987 = as_type<float>(_107);
        out.gl_Position.z = _1987;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2056 = as_type<float>(_143);
        out.gl_Position.z = _2056;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _149 = _125 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _155 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _157 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _159 = _155 || _157;
    bool _161 = isnan(1.0);
    bool _163 = _159 || _161;
    float _165 = _149 * _147;
    float _167 = 0.0;
    float _169 = _153;
    if (!_163)
    {
        float _171 = _153 * _153;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    float _177 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _165);
    float _179 = _175;
    if (!_163)
    {
        float _181 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    float _185 = in.m_49.x;
    float _187 = in.m_49.y;
    float _189 = in.m_49.z;
    float _191 = _177 * 6.283185482025146484375;
    float _193 = floor(_177);
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    float _203 = _191 * 0.15915493667125701904296875;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _203 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_193;
    float _219 = _177 + _217;
    bool _221 = !_201;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_163;
    float _227 = _183;
    if (!_225)
    {
        float _229 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _231 = log2(_229);
        float _233 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _235 = _233 + 1.0;
        float _237 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = _153 * _231;
        float _241 = 1.0 / _235;
        float _243 = _237 * 0.693147182464599609375;
        float _245 = exp2(_239);
        float _247 = 1.0 / _243;
        float _249 = _245 + (-1.0);
        float _251 = -_249;
        float _253 = fma(_251, _247, _153);
        float _255 = _253 * _241;
        float _257 = _255 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _257;
    }
    float _259 = _227;
    bool _261 = !_163;
    if (!_261)
    {
        float _263 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _265 = log2(_263);
        float _267 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _269 = _267 + 1.0;
        float _271 = 1.0 / _269;
        float _273 = _153 * _265;
        float _275 = exp2(_273);
        float _277 = -_275;
        float _279 = _277 + 1.0;
        float _281 = _279 * _271;
        _169 = _281;
    }
    float _283 = _169;
    float _285 = in.m_56.w;
    int _287 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _289 = _287 != 0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _293 = _291 != 0;
    float _295 = fma(_211, 0.5, 0.5);
    bool _297 = _219 < 0.5;
    float _299 = float(_297);
    float _301 = -_219;
    float _303 = fma(_301, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _305 = in.m_44.x;
    float _307 = in.m_44.y;
    float _309 = in.m_44.z;
    bool _311 = !_289;
    int _313 = _311 ? 0 : 1;
    float _315 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _317 = -_299;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = -_295;
    float _323 = fma(_321, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _325 = abs(_313);
    float _327 = fma(_283, _185, _315);
    bool _329 = !_293;
    int _331 = _329 ? 0 : 1;
    float _333 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _335 = !_207;
    int _337 = _335 ? 0 : 1;
    float _339 = _259 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _341 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _343 = fma(_283, _187, _333);
    int _345 = abs(_331);
    float _347 = fma(_283, _189, _339);
    int _349 = abs(_337);
    float _351 = float(_325);
    float _353 = float(_349);
    float _355 = abs(_303);
    float _357 = _351 * _355;
    float _359 = fma(_327, _285, _305);
    float _361 = float(_345);
    float _363 = fma(_353, _323, _357);
    float _365 = fma(_343, _285, _307);
    float _367 = fma(_347, _285, _309);
    float _369 = abs(_319);
    float _371 = fma(_361, _369, _363);
    bool _373 = !_341;
    float _389;
    if (!_373)
    {
        float _375 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _377 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _379 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _381 = _379 * _375;
        float _383 = floor(_381);
        float _385 = -_383;
        float _387 = _381 + _385;
        _389 = _387;
        _391 = true;
    }
    else
    {
        float _393 = float(_91);
        float _395 = 1.0 / _393;
        float _397 = _125 * _395;
        _389 = _397;
    }
    _391 = false;
    float _399 = _389;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = 1.0 / _403;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _419;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _425 = 1.0 / _411;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _429 = _399 + _427;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _435 = _423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _439 = 1.0 / _407;
    float _441 = _429 * _417;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _445 = _399 + _443;
    float _447 = _431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _453 = _399 + _451;
    bool _455 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _457 = 1.0 / _415;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _461 = _399 + _459;
    float _463 = _445 * _425;
    bool _465 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_399);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    out.m_58.x = _435;
    out.m_58.y = _447;
    out.m_58.z = _449;
    out.m_58.w = _437;
    float _477 = 1.0 / _421;
    float _479 = _461 * _439;
    bool _481 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _483 = isnan(_399);
    bool _485 = _481 || _483;
    bool _487 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _489 = _485 || _487;
    float _491 = float(_489);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _495 = _399 + _493;
    float _497 = _453 * _457;
    float _499 = -_491;
    float _501 = _499 + 1.0;
    bool _503 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_399);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_475;
    float _517 = _515 + 1.0;
    float _519 = _475 * _501;
    bool _521 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _523 = isnan(_399);
    bool _525 = _521 || _523;
    bool _527 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _529 = _525 || _527;
    float _531 = float(_529);
    float _533 = -_513;
    float _535 = _533 + 1.0;
    float _537 = _495 * _477;
    float _539 = _513 * _517;
    bool _541 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _543 = isnan(_399);
    bool _545 = _541 || _543;
    bool _547 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _549 = _545 || _547;
    float _551 = float(_549);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _557;
    bool _561 = _399 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _563 = isnan(_399);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = _531 * _535;
    float _575 = -_531;
    float _577 = _575 + 1.0;
    float _579 = -_551;
    float _581 = _579 + 1.0;
    float _583 = fma(_555, _441, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _585 = fma(_559, _441, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _591 = _551 * _577;
    float _593 = _571 * _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _599 = fma(_589, _479, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _601;
    float _605 = _583 * _593;
    float _607 = -_571;
    float _609 = _607 + 1.0;
    float _611 = _585 * _593;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _613;
    float _617 = fma(_597, _479, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _619 = fma(_603, _463, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _621 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].x, _605);
    float _623 = fma(_609, (*spvDescriptorSet0.vp_c9)._m0[143].y, _611);
    float _625 = in.m_56.x;
    float _627 = in.m_56.y;
    float _629 = fma(_615, _463, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_599, _591, _621);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _641 = fma(_617, _591, _623);
    float _643 = fma(_633, _497, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _647 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _645;
    float _649 = fma(_619, _573, _635);
    float _651 = fma(_639, _497, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _653;
    float _657 = fma(_629, _573, _641);
    float _659 = fma(_647, _537, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _661 = fma(_643, _539, _649);
    float _663 = fma(_655, _537, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _665 = fma(_651, _539, _657);
    float _667 = fma(_659, _519, _661);
    float _669 = fma(_663, _519, _665);
    float _671 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].x, _667);
    float _673 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[148].y, _669);
    float _675 = _671 * _625;
    float _677 = _673 * _627;
    bool _679 = !_455;
    float _695;
    if (!_679)
    {
        float _681 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _683 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _687 = _685 * _681;
        float _689 = floor(_687);
        float _691 = -_689;
        float _693 = _687 + _691;
        _695 = _693;
        _697 = true;
    }
    else
    {
        float _699 = float(_91);
        float _701 = 1.0 / _699;
        float _703 = _125 * _701;
        _695 = _703;
    }
    _697 = false;
    float _705 = _695;
    float _707 = in.m_60.x;
    float _709 = in.m_60.y;
    float _711 = in.m_60.z;
    float _713 = _371 * _675;
    bool _715 = _145 > 0.5;
    float _717 = in.m_62.x;
    float _719 = in.m_62.y;
    float _721 = in.m_62.z;
    float _723 = _371 * _677;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _725;
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _731 = _729 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _733 = in.m_64.x;
    float _735 = in.m_64.y;
    float _737 = in.m_64.z;
    float _739 = 1.0 / _727;
    float _741 = in.m_51.y;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _745 = _743 != 0;
    float _747 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _751 = _749 != 0;
    float _753 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _755 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _757 = isnan(_705);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = 1.0 / _731;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _769;
    bool _773 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _775 = isnan(_705);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    bool _785 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _787 = isnan(_705);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = _365 * _709;
    float _799 = 1.0 / _771;
    float _801 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _223);
    float _803 = _365 * _719;
    float _805 = fma(_359, _707, _797);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _807;
    float _811 = _365 * _735;
    float _813 = fma(_359, _717, _803);
    float _815 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _817 = fma(_359, _733, _811);
    float _819 = -_215;
    int _821 = _715 ? as_type<int>(_819) : as_type<int>(_215);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _827;
    float _831 = _723 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _833 = !_745;
    float _835 = _833 ? _215 : as_type<float>(_821);
    float _837 = _747 * _815;
    float _839 = 1.0 / _825;
    float _841 = _831 * _801;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _845 = _705 + _843;
    bool _847 = _741 > 0.5;
    float _849 = fma(_367, _711, _805);
    float _851 = fma(_367, _737, _817);
    float _853 = _845 * _799;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _857 = _705 + _855;
    float _859 = 1.0 / _829;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _705 + _861;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _867 = _705 + _865;
    float _869 = fma(_367, _721, _813);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _705 + _871;
    float _875 = _863 * _767;
    float _877 = -_223;
    int _879 = _847 ? as_type<int>(_877) : as_type<int>(_223);
    float _881 = _857 * _839;
    float _883 = _873 * _739;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _885;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _889;
    bool _893 = !_751;
    float _895 = _893 ? _223 : as_type<float>(_879);
    float _897 = _841 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _899 = _867 * _859;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _901;
    float _905 = fma(_887, _883, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _907 = fma(_903, _883, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _909 = fma(_891, _883, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _911 = _841 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _915 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _913;
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _917;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[24].x, _911);
    float _939 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[26].x, _897);
    float _941 = fma(_927, _881, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _943 = fma(_931, _881, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _945 = fma(_935, _881, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _947 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].z, _937);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _961 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _963 = isnan(_705);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].z, _939);
    float _975 = fma(_915, _853, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _977 = fma(_919, _853, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _979 = fma(_923, _853, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _981 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _983 = isnan(_705);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    float _993 = _849 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _995 = _947 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _997 = fma(_951, _875, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _999 = fma(_955, _875, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1001 = fma(_959, _875, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1003 = _851 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1005 = _973 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1007 = -_971;
    float _1009 = _1007 + 1.0;
    float _1011 = -_991;
    float _1013 = _1011 + 1.0;
    float _1015 = _993 + _995;
    float _1017 = _1003 + _1005;
    float _1019 = _991 * _1009;
    bool _1021 = _705 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1023 = isnan(_705);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _765 * _1013;
    float _1035 = -_765;
    float _1037 = _1035 + 1.0;
    float _1039 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1041 = _1015 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1045 = _1017 + _1043;
    float _1047 = -_1031;
    float _1049 = _1047 + 1.0;
    float _1051 = _1031 * _1037;
    float _1053 = _1041 * _1041;
    float _1055 = _1045 * _1045;
    float _1057 = _795 * _1049;
    float _1059 = -_795;
    float _1061 = _1059 + 1.0;
    float _1063 = _841 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1065 = _1053 + _1055;
    float _1067 = _783 * _1061;
    float _1069 = -_783;
    float _1071 = _1069 + 1.0;
    float _1073 = sqrt(_1065);
    float _1075 = fma(_837, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1063);
    float _1077 = _907 * _1067;
    float _1079 = _905 * _1067;
    float _1081 = _909 * _1067;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1075);
    float _1085 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1077);
    float _1087 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1079);
    float _1089 = _869 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1091 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1081);
    float _1093 = fma(_997, _1057, _1085);
    float _1095 = fma(_999, _1057, _1087);
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1099 = _1083 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1101 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1101;
    float _1105 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1105;
    bool _1109 = _1073 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1111 = _1089 + _1099;
    float _1113 = fma(_1001, _1057, _1091);
    float _1115 = fma(_975, _1051, _1093);
    float _1117 = fma(_809, _899, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1119 = fma(_1103, _899, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1121 = fma(_1107, _899, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1123 = fma(_977, _1051, _1095);
    float _1125 = fma(_979, _1051, _1113);
    float _1127 = fma(_941, _1033, _1115);
    float _1129 = _1099;
    float _1131 = _1053;
    float _1133 = _1055;
    float _1135 = _1017;
    float _1137 = _1015;
    if (!_1109)
    {
        _1129 = _1111;
    }
    float _1139 = _1129;
    bool _1141 = !_1109;
    float _1143 = _1139;
    float _1145 = _1097;
    if (!_1141)
    {
        float _1147 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1149 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1151 = _1073 + _1149;
        float _1153 = rsqrt(_1065);
        float _1155 = _1151 * _1147;
        float _1157 = _1111 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1159 = _1155 * 0.15915493667125701904296875;
        float _1161 = _1159 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1159 * 6.283185482025146484375;
        float _1167 = cos(_1165);
        float _1169 = fma(_1163, _1157, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1171 = _1153 * _1169;
        float _1173 = _1167 + (-1.0);
        float _1175 = fma(_1041, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1177 = fma(_1045, _1171, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1179 = _1173 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1183 = _1175 + _1181;
        float _1185 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1187 = _1177 + _1185;
        float _1189 = fma(_1111, _1167, _1179);
        float _1191 = _1183 * _1183;
        float _1193 = _1187 * _1187;
        _1143 = _1189;
        _1131 = _1191;
        _1133 = _1193;
        _1135 = _1177;
        _1137 = _1175;
    }
    float _1195 = _1143;
    float _1197 = _1131;
    float _1199 = _1133;
    float _1201 = _1135;
    float _1203 = _1137;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1207 = _1195 + _1205;
    float _1209 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1211 = fma(_943, _1033, _1123);
    float _1213 = fma(_945, _1033, _1125);
    float _1215 = fma(_1207, _1207, _1197);
    float _1217 = fma(_1117, _1019, _1127);
    float _1219 = fma(_1119, _1019, _1211);
    float _1221 = fma(_1121, _1019, _1213);
    float _1223 = _1215 + _1199;
    float _1225 = -_895;
    float _1227 = _1225 + 0.5;
    float _1229 = _835 + 0.5;
    float _1231 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1217);
    float _1233 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1219);
    float _1235 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1221);
    float _1237 = sqrt(_1223);
    float _1239 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1241 = _1229 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1243 = _1231 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1245 = _1233 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1247 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1249 = _1239 * _1209;
    float _1251 = _1241 * _1097;
    float _1253 = _1243 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1255 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1257 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _1251;
    out.m_66.y = _1249;
    out.m_68.x = _1253;
    out.m_68.y = _1255;
    out.m_68.z = _1257;
    bool _1259 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1261 = isnan(_1237);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1267 = _1263 || _1265;
    float _1269 = _1251;
    if (!_1267)
    {
        _1145 = 1.0;
    }
    float _1271 = _1145;
    bool _1273 = !_1267;
    float _1275 = _1271;
    if (!_1273)
    {
        bool _1277 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1279 = isnan(_1237);
        bool _1281 = _1277 || _1279;
        bool _1283 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1285 = _1281 || _1283;
        if (!_1285)
        {
            float _1287 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1289 = _1237 + _1287;
            float _1291 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1293 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1291;
            float _1295 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1297 = _1295 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1299 = 1.0 / _1293;
            float _1301 = _1289 * _1299;
            float _1303 = fma(_1301, _1297, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1275 = _1303;
            _1305 = true;
        }
        else
        {
            bool _1307 = _1237 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1309 = isnan(_1237);
            bool _1311 = _1307 || _1309;
            bool _1313 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1315 = _1311 || _1313;
            if (!_1315)
            {
                float _1317 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1319 = _1237 + _1317;
                float _1321 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1323 = _1321 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1325 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1327 = _1325 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1329 = 1.0 / _1323;
                float _1331 = _1319 * _1329;
                float _1333 = fma(_1331, _1327, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1275 = _1333;
                _1305 = true;
            }
            else
            {
                _1275 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1305 = false;
    float _1335 = _1275;
    float _1337 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1339 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1341 = _1195 + _1339;
    float _1343 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1337);
    float _1345 = _1089 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1347 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1351 = _1347 || _1349;
    bool _1353 = isnan(0.5);
    bool _1355 = _1351 || _1353;
    float _1357 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1359 = _1201 + _1357;
    float _1361 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1343);
    bool _1363 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan(0.5);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1345);
    float _1375 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1377 = _1203 + _1375;
    float _1379 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1381 = fma(_1341, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1383 = fma(_1003, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1373);
    float _1385 = fma(_1377, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1387 = 1.0 / _1379;
    float _1389 = fma(_1359, _1335, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1391 = _1383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1393 = _1377;
    float _1395 = _1391;
    float _1397 = _1341;
    float _1399 = _1335;
    if (_1355)
    {
        _1393 = _1385;
    }
    float _1401 = _1393;
    float _1403 = _1391 + _1379;
    float _1405 = _1401;
    if (_1355)
    {
        _1395 = _1381;
    }
    float _1407 = _1395;
    float _1409 = _1407;
    if (_1355)
    {
        _1397 = _1389;
    }
    float _1411 = _1397;
    float _1413 = _1411;
    float _1415 = _1387;
    if (!_1355)
    {
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1419 = _1089 + _1417;
        float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1423 = _993 + _1421;
        float _1425 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1427 = -_1089;
        float _1429 = _1427 + _1381;
        float _1431 = _1419 * _1419;
        float _1433 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1435 = _1003 + _1433;
        float _1437 = fma(_1423, _1423, _1431);
        float _1439 = -_993;
        float _1441 = _1439 + _1385;
        float _1443 = fma(_1435, _1435, _1437);
        float _1445 = sqrt(_1443);
        float _1447 = precise::min(_1445, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1449 = _1447 * _1425;
        float _1451 = -_1003;
        float _1453 = _1451 + _1389;
        float _1455 = fma(_1441, _1449, _993);
        float _1457 = fma(_1429, _1449, _1089);
        float _1459 = fma(_1453, _1449, _1003);
        _1409 = _1457;
        _1405 = _1455;
        _1413 = _1459;
        _1399 = _1445;
    }
    float _1461 = _1409;
    float _1463 = _1405;
    float _1465 = _1413;
    float _1467 = _1399;
    float _1469 = _1467;
    if (_1371)
    {
        _1469 = 1.0;
    }
    float _1471 = _1469;
    float _1473 = _1403 * _1387;
    float _1475 = _1473 * 0.5;
    float _1477 = _1471;
    if (!_1371)
    {
        float _1479 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1483 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1481);
        float _1485 = _1479 * 0.15915493667125701904296875;
        float _1487 = _1485 * 6.283185482025146484375;
        float _1489 = cos(_1487);
        float _1491 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1493 = _1491 * 0.15915493667125701904296875;
        float _1495 = _1485 * 6.283185482025146484375;
        float _1497 = sin(_1495);
        float _1499 = 1.0 / _1489;
        float _1501 = _1493 * 6.283185482025146484375;
        float _1503 = cos(_1501);
        float _1505 = _1497 * _1499;
        float _1507 = 1.0 / _1483;
        float _1509 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1511 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1509;
        float _1513 = _1503 * _1505;
        float _1515 = _1493 * 6.283185482025146484375;
        float _1517 = sin(_1515);
        float _1519 = 1.0 / _1513;
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1523 = _1507 * _1521;
        float _1525 = 1.0 / _1511;
        float _1527 = _1517 * _1519;
        float _1529 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1531 = fma(_1527, _1523, _1529);
        float _1533 = _1531 * _1525;
        float _1535 = precise::clamp(_1533, 0.0, 1.0);
        float _1537 = -_1535;
        float _1539 = _1537 + 1.0;
        _1415 = _1493;
        _1477 = _1539;
    }
    float _1541 = _1415;
    float _1543 = _1477;
    float _1545 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1547 = _1461 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1551 = _1463 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1555 = _1465 + _1553;
    float _1557 = _1547 * _1547;
    float _1559 = fma(_1551, _1551, _1557);
    float _1561 = fma(_1555, _1555, _1559);
    float _1563 = rsqrt(_1561);
    float _1565 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1567 = _1551 * _1565;
    float _1569 = _1555 * _1565;
    float _1571 = _1567 * _1567;
    float _1573 = _1569 * _1569;
    float _1575 = _1571 + _1573;
    float _1577 = sqrt(_1575);
    bool _1579 = _1577 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1583 = _1577 + _1581;
    float _1585 = _1559;
    float _1587 = _1541;
    float _1589 = _1583;
    float _1591 = _1565;
    float _1593 = _1567;
    float _1595 = _1571;
    if (_1579)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1585 = _1597;
    }
    float _1599 = _1585;
    if (_1579)
    {
        float _1601 = rsqrt(_1575);
        _1587 = _1601;
    }
    float _1603 = _1587;
    float _1605 = _1603;
    if (_1579)
    {
        float _1607 = _1583 * _1599;
        _1589 = _1607;
    }
    float _1609 = _1589;
    if (_1579)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1269 = _1611;
    }
    float _1613 = _1269;
    float _1615 = _1563;
    if (_1579)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1555;
    float _1629 = _1625;
    float _1631 = _1623;
    if (_1579)
    {
        float _1633 = _1613 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        _1627 = _1635;
    }
    float _1637 = _1627;
    float _1639 = -_1565;
    float _1641 = -_1625;
    float _1643 = fma(_1547, _1639, _1641);
    if (_1579)
    {
        float _1645 = _1643 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1645;
    }
    float _1647 = _1629;
    float _1649 = sqrt(_1561);
    float _1651 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1653 = _1647;
    float _1655 = _1621;
    if (_1579)
    {
        float _1657 = fma(_1621, _1647, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1653 = _1657;
    }
    float _1659 = _1653;
    float _1661 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1651);
    float _1663 = _1659;
    if (_1579)
    {
        float _1665 = _1637 + (-1.0);
        _1631 = _1665;
    }
    float _1667 = _1631;
    float _1669 = _1667;
    if (_1579)
    {
        float _1671 = _1603 * _1659;
        _1655 = _1671;
    }
    float _1673 = _1655;
    if (!_1579)
    {
        _1605 = _1643;
    }
    float _1675 = _1605;
    float _1677 = _1675;
    if (_1579)
    {
        float _1679 = _1667 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1679;
    }
    float _1681 = _1591;
    if (_1579)
    {
        float _1683 = _1567 * _1673;
        _1593 = _1683;
    }
    float _1685 = _1593;
    if (!_1579)
    {
        _1663 = _1569;
    }
    float _1687 = _1663;
    float _1689 = _1687;
    if (_1579)
    {
        float _1691 = _1569 * _1673;
        _1689 = _1691;
    }
    float _1693 = _1689;
    if (_1579)
    {
        float _1695 = fma(_1643, _1637, _1681);
        _1677 = _1695;
    }
    float _1697 = _1677;
    if (_1579)
    {
        float _1699 = _1685 * _1685;
        _1595 = _1699;
    }
    float _1701 = _1595;
    if (!_1579)
    {
        _1669 = _1573;
    }
    float _1703 = _1669;
    float _1705 = _1703;
    if (_1579)
    {
        float _1707 = _1693 * _1693;
        _1705 = _1707;
    }
    float _1709 = _1705;
    float _1711 = fma(_1697, _1697, _1701);
    float _1713 = _1711 + _1709;
    float _1715 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1719 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1717);
    float _1721 = precise::clamp(_1719, 0.0, 1.0);
    float _1723 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1725 = rsqrt(_1713);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1715);
    float _1729 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1731 = -_1721;
    float _1733 = _1731 + 1.0;
    float _1735 = _1461 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1737 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1727);
    float _1739 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1729);
    float _1741 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1735);
    float _1743 = _1737 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1745 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1739);
    float _1747 = abs(_1733);
    float _1749 = log2(_1747);
    float _1751 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1741);
    float _1753 = _1743 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1757 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1661);
    float _1759 = _1751 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1761 = _1725 * _1685;
    float _1763 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1765 = -_1753;
    float _1767 = fma(_1765, _1723, 1.0);
    float _1769 = _1725 * _1697;
    float _1771 = _1761 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1773 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1763);
    float _1775 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = _1725 * _1693;
    float _1779 = -_1771;
    float _1781 = fma(_1769, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1779);
    float _1783 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1773);
    float _1785 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1787 = log2(_1767);
    float _1789 = -_1777;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1781);
    float _1793 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1795 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1797 = fma(_1791, -0.5, 0.5);
    float _1799 = fma(_1791, 0.5, 0.5);
    float _1801 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1795);
    float _1803 = exp2(_1785);
    float _1805 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1783);
    float _1807 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1793);
    float _1809 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1801);
    float _1811 = _1769 + 1.0;
    float _1813 = fma(_1799, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1815 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1807);
    float _1817 = 1.0 / _1805;
    float _1819 = fma(_1799, _1813, -0.212114393711090087890625);
    float _1821 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1815);
    float _1823 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1809);
    float _1825 = _1787 * 0.693147182464599609375;
    float _1827 = fma(_1799, _1819, 1.570728778839111328125);
    float _1829 = sqrt(_1797);
    float _1831 = -_1769;
    float _1833 = fma(_1803, _1811, _1831);
    float _1835 = _1825 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1837 = fma(_1833, 0.5, 0.5);
    float _1839 = _1821 * _1817;
    float _1841 = _1823 * _1817;
    float _1843 = fma(_1839, 0.5, 0.5);
    float _1845 = fma(_1841, -0.5, 0.5);
    float _1847 = _1829 * 0.636619746685028076171875;
    float3 _4799 = float3(_1843, _1845, _1835);
    float _1849 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4799, float3(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4799, float3(0.0), isnan(_4799)), level(0.0)).x;
    float _1851 = -_1827;
    float _1853 = fma(_1847, _1851, 1.0);
    float3 _4815 = float3(_1843, _1845, _1835);
    float4 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4815, float3(0.0), isnan(_4815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4815, float3(0.0), isnan(_4815)), level(0.0)).xyzw;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = _1856.w;
    float2 _4832 = float2(_1853, _1837);
    float3 _1868 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4832, float2(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4832, float2(0.0), isnan(_4832)), level(0.0)).xyz;
    float _1870 = _1868.x;
    float _1872 = _1868.y;
    float _1874 = _1868.z;
    float _1876 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1878 = _1755 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1880 = _1543 > 0.0;
    bool _1882 = isnan(_1543);
    bool _1884 = _1880 || _1882;
    bool _1886 = isnan(0.0);
    bool _1888 = _1884 || _1886;
    float _1890 = _1543 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1892 = fma(_1759, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1878);
    float _1894 = exp2(_1876);
    float _1896 = fma(_1743, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1892);
    float _1898 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1896);
    float _1900 = _1898 + _1805;
    out.gl_Position.x = _1821;
    out.gl_Position.y = _1823;
    out.gl_Position.z = _1898;
    out.gl_Position.w = _1805;
    float _1902 = _1900 * 0.5;
    float _1904 = -_1894;
    float _1906 = _1904 + 1.0;
    float _1908 = _1890 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1910 = _1906 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1902;
    out.m_70.w = _1805;
    out.m_47.x = _1908;
    float _1912 = _1910 * _1849;
    float _1914 = -_1910;
    float _1916 = _1914 + 1.0;
    float _1918 = _1864 * _1912;
    float _1920 = _1874 * _1912;
    float _1922 = fma(_1870, _1918, _1858);
    float _1924 = fma(_1872, _1918, _1860);
    float _1926 = _1864 * _1916;
    float _1928 = fma(_1864, _1920, _1862);
    out.m_72.x = _1922;
    out.m_72.y = _1924;
    out.m_72.z = _1928;
    out.m_72.w = _1926;
    if (_1888)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1930;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

