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
    float4 m_68 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_62 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2777 = as_type<float>(_105);
        out.gl_Position.z = _2777;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_143);
        out.gl_Position.z = _2847;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
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
    float _209 = _149;
    bool _211 = false;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = exp2(_223);
        float _227 = _221 * 0.693147182464599609375;
        float _229 = 1.0 / _227;
        float _231 = 1.0 / _219;
        float _233 = _225 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _229, _147);
        float _239 = _237 * _231;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _241;
    }
    float _243 = _207;
    float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _247 = !_159;
    float _249 = _245;
    float _251 = _243;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _147 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _175 = _271;
    }
    float _273 = _175;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _283 = _123 * _123;
        float _285 = _283 * 0.5;
        _249 = _285;
    }
    float _287 = _249;
    float _289 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _291 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _293 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].z, _281);
    float _295 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _297 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _297;
    }
    float _299 = _251;
    bool _301 = !_159;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = _123 * _307;
        float _317 = exp2(_315);
        float _319 = _313 * 0.693147182464599609375;
        float _321 = 1.0 / _319;
        float _323 = 1.0 / _311;
        float _325 = _317 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _321, _123);
        float _331 = _329 * _323;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].x, _289);
    float _341 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].y, _291);
    float _343 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _347 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _349 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _293);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].x, _345);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].y, _347);
    float _357 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].z, _349);
    float _359 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_273, _161, _339);
    float _363 = fma(_273, _163, _341);
    float _365 = fma(_273, _165, _351);
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _369 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _355);
    float _371 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _373 = _359;
    float _375 = _353;
    if (!_159)
    {
        _373 = _123;
    }
    float _377 = _373;
    bool _379 = !_159;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _123 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
        _375 = _393;
    }
    float _403 = _381;
    float _405 = _375;
    float _407 = fma(_403, _163, _369);
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = fma(_403, _161, _367);
    float _413 = fma(_403, _165, _371);
    float _415 = -_407;
    float _417 = _363 + _415;
    float _419 = fma(_361, _149, _167);
    float _421 = -_411;
    float _423 = _361 + _421;
    float _425 = -_413;
    float _427 = _365 + _425;
    float _429 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _431 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_363, _149, _169);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _441 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _443 = fma(_365, _149, _171);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
    float _447 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    bool _451 = !_409;
    float _453 = _405;
    float _455 = _437;
    bool _457 = _409;
    float _459 = _447;
    float _461 = _445;
    float _463 = _449;
    float _481;
    float _483;
    if (!_451)
    {
        float _465 = in.m_54.x;
        float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _469 = _465 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _471 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _473 = _471 * _467;
        float _475 = floor(_473);
        float _477 = -_475;
        float _479 = _473 + _477;
        _481 = _473;
        _209 = _475;
        _483 = _479;
        _485 = true;
    }
    else
    {
        float _487 = float(_89);
        float _489 = 1.0 / _487;
        float _491 = _123 * _489;
        _481 = _487;
        _483 = _491;
    }
    _485 = false;
    float _493 = _481;
    float _495 = _209;
    float _497 = _483;
    float _499 = in.m_54.z;
    float _501 = in.m_54.w;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _509 = _507 != 0;
    float _511 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _515 = _513 != 0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _527 = 1.0 / _519;
    float _529 = _493;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = _511;
    if (_509)
    {
        float _535 = in.m_54.w;
        _529 = _535;
    }
    float _537 = _529;
    float _539 = _123 * _505;
    float _541 = 0.0;
    int _543 = as_type<int>(_505);
    if (!_515)
    {
        _541 = _203;
    }
    float _545 = _541;
    float _547 = _495;
    float _549 = _545;
    if (_515)
    {
        float _551 = in.m_54.x;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _525;
    bool _557 = _501 > 0.5;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (!_509)
    {
        _531 = _199;
    }
    float _563 = _531;
    float _565 = 1.0 / _561;
    float _567 = _537;
    float _569 = _563;
    if (_509)
    {
        float _571 = _537 * 3.1415927410125732421875;
        _567 = _571;
    }
    float _573 = _567;
    float _575 = _573;
    if (_509)
    {
        float _577 = _573 * 0.15915493667125701904296875;
        _453 = _577;
    }
    float _579 = _453;
    if (_515)
    {
        float _581 = _553 * 3.1415927410125732421875;
        _575 = _581;
    }
    float _583 = _575;
    if (_515)
    {
        float _585 = _583 * 0.15915493667125701904296875;
        _455 = _585;
    }
    float _587 = _455;
    float _589 = _579;
    if (_509)
    {
        float _591 = _579 * 6.283185482025146484375;
        float _593 = sin(_591);
        _589 = _593;
    }
    float _595 = _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = _587;
    if (_515)
    {
        float _603 = _587 * 6.283185482025146484375;
        float _605 = sin(_603);
        _601 = _605;
    }
    float _607 = _601;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _611 = _553;
    if (_599)
    {
        float _613 = in.m_54.x;
        float _615 = in.m_54.y;
        _609 = _613;
        _611 = _615;
    }
    float _617 = _609;
    float _619 = _611;
    float _621 = _595;
    if (_509)
    {
        bool _623 = _595 > 0.5;
        _211 = _623;
    }
    bool _625 = _211;
    int _627 = 0;
    if (_599)
    {
        _627 = 0;
    }
    int _629 = _627;
    int _631 = _629;
    if (_509)
    {
        float _633 = -_199;
        float _635 = _625 ? _633 : _199;
        _569 = _635;
    }
    float _637 = _569;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _641 = _639 != 0;
    if (_515)
    {
        bool _643 = _607 > 0.5;
        _457 = _643;
    }
    bool _645 = _457;
    float _647 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    if (_599)
    {
        _543 = 0;
    }
    int _659 = _543;
    float _661 = _619;
    float _663 = _617;
    int _665 = _659;
    if (_599)
    {
        _533 = _617;
    }
    float _667 = _533;
    float _669 = _667;
    if (_599)
    {
        _621 = _619;
    }
    float _671 = _621;
    float _673 = _671;
    if (!_599)
    {
        float _675 = in.m_54.x;
        float _677 = in.m_54.y;
        float _679 = _675 * 3.1415927410125732421875;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _677 * 3.1415927410125732421875;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        _661 = _677;
        _663 = _675;
        _665 = 2;
        _669 = _689;
        _673 = _693;
        _631 = 1;
    }
    float _695 = _661;
    float _697 = _663;
    int _699 = _665;
    float _701 = _669;
    float _703 = _673;
    int _705 = _631;
    bool _707 = _695 > 0.5;
    float _709 = exp2(_539);
    if (_515)
    {
        float _711 = -_203;
        float _713 = _645 ? _711 : _203;
        _549 = _713;
    }
    float _715 = _549;
    float _717 = _499 * 2.0;
    bool _719 = _697 > 0.5;
    float _721 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _723 = -_203;
    int _725 = _707 ? as_type<int>(_723) : as_type<int>(_203);
    float _727 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _735 = -_203;
    int _737 = _557 ? as_type<int>(_735) : as_type<int>(_203);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _741 = _497 + _739;
    float _743 = -_199;
    int _745 = _719 ? as_type<int>(_743) : as_type<int>(_199);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _749 = !_653;
    float _751 = _749 ? _203 : as_type<float>(_725);
    float _753 = _499 + (-0.5);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _765 = _763 != 0;
    float _767 = in.m_52.x;
    float _769 = in.m_52.y;
    float _771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _773 = floor(_717);
    bool _775 = !_757;
    float _777 = _775 ? _203 : as_type<float>(_737);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _779;
    bool _783 = _499 > 0.5;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _785;
    float _789 = -_709;
    float _791 = _789 + 1.0;
    float _793 = _781 * _527;
    float _795 = -_199;
    int _797 = _783 ? as_type<int>(_795) : as_type<int>(_199);
    float _799 = _787 * _555;
    float _801 = -_203;
    int _803 = _783 ? as_type<int>(_801) : as_type<int>(_203);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = fma(_793, _741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = !_765;
    float _823 = _821 ? _203 : as_type<float>(_803);
    float _825 = _807 * _565;
    float _827 = _817 ? _791 : 0.0;
    float _829 = _727 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _831 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _833 = _773 > 0.0;
    float _835 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _837 = _773 >= 0.0;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    bool _851 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = isnan(_497);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _767 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _865 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _867 = isnan(_497);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _849;
    bool _879 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_497);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_861;
    float _893 = _891 + 1.0;
    bool _895 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _897 = isnan(_497);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = _875 * _893;
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _889 * _913;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _497 + _927;
    float _931 = _905 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _935 = _497 + _933;
    float _937 = _915 * _747;
    float _939 = _819 * _931;
    float _941 = fma(_799, _935, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _943 = _827 * _877;
    int _945 = _845 ? 0 : 1;
    float _947 = fma(_825, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[115].x, _939);
    bool _951 = _699 != 2;
    float _953 = _907 * _733;
    int _955 = ~_945;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _959;
    if (!_833)
    {
        int _965 = ~_945;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_947, _925, _949);
    float _973 = _697 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _975 = _701 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _981 = fma(_941, _909, _971);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _987 = !_731;
    float _989 = _987 ? _199 : as_type<float>(_797);
    float _991 = -_961;
    float _993 = fma(_973, 2.0, _991);
    float _995 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[93].w, _979);
    float _997 = _703 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _999 = _695 * 2.0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1005 = _695 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1007 = -_983;
    float _1009 = fma(_975, 2.0, _1007);
    float _1011 = -_199;
    int _1013 = _707 ? as_type<int>(_1011) : as_type<int>(_199);
    float _1015 = _697 * 2.0;
    float _1017 = fma(_1005, -2.0, _1001);
    float _1019 = fma(_997, -2.0, _1003);
    bool _1021 = !_641;
    float _1023 = _1021 ? _199 : as_type<float>(_745);
    float _1025 = floor(_1015);
    bool _1027 = !_761;
    float _1029 = _1027 ? _199 : as_type<float>(_1013);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1033 = _705 != 1;
    float _1035 = _695 + _499;
    float _1037 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1031);
    float _1039 = _695 + _697;
    float _1041 = floor(_999);
    float _1043 = _499 + _697;
    float _1045 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1037);
    float _1047 = _1039 + (-1.0);
    float _1049 = _1043 + (-1.0);
    float _1051 = _1045 * (-0.15915493667125701904296875);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1055 = _1035 + (-1.0);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1061 = _1025 >= 0.0;
    bool _1063 = isnan(_1025);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(0.0);
    bool _1069 = _1065 || _1067;
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1073 = -_123;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1009);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1079 = _1041 >= 0.0;
    bool _1081 = isnan(_1041);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    float _1089 = _715 + (-0.5);
    bool _1091 = _1025 > 0.0;
    float _1093 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    int _1095 = _1069 ? 0 : 1;
    float _1097 = -_123;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[76].x, _993);
    int _1101 = _1087 ? 0 : 1;
    float _1103 = _1051 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1117 = _1115 != 0;
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1121 = _637 + 0.5;
    float _1123 = fma(_1119, _1121, _1075);
    float _1125 = _1051 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1131 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1019);
    bool _1133 = !_1109;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1139 = _1041 > 0.0;
    float _1141 = -_1129;
    float _1143 = -_1131;
    float _1145 = fma(_1141, _1089, _1143);
    float _1147 = in.m_56.x;
    float _1149 = in.m_56.y;
    float _1151 = in.m_56.z;
    float _1153 = _1089;
    float _1155 = _1051;
    float _1157 = _1131;
    if (!_1033)
    {
        _1153 = _697;
    }
    float _1159 = _1153;
    float _1161 = _751 * _1105;
    int _1163 = abs(_1135);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1167 = _1159;
    if (!_1033)
    {
        _1155 = _1159;
    }
    float _1169 = _1155;
    float _1171 = _1169;
    if (_1033)
    {
        _1171 = _499;
    }
    float _1173 = _1171;
    float _1175 = _751 * _1127;
    float _1177 = -_1161;
    float _1179 = fma(_1023, _1127, _1177);
    float _1181 = float(_969);
    float _1183 = float(_1163);
    float _1185 = fma(_1023, _1105, _1175);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1137);
    float _1189 = _1183 * _1181;
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1187);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1195 = _1189 * (-2.0);
    int _1197 = ~_1095;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1205 = _1201;
    if (!_1091)
    {
        int _1207 = ~_1095;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = _697 + (-0.5);
    float _1217 = fma(_1195, _1147, _1147);
    bool _1219 = !_1113;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    int _1225 = ~_1101;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1217);
    int _1233 = _1229;
    if (!_1139)
    {
        int _1235 = ~_1101;
        int _1237 = _1235 + 1;
        _1233 = _1237;
    }
    int _1239 = _1233;
    float _1241 = fma(_1059, _1195, _1059);
    if (_1033)
    {
        _1167 = _697;
    }
    float _1243 = _1167;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1247 = !_1117;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = abs(_1221);
    float _1253 = float(_1239);
    int _1255 = abs(_1249);
    float _1257 = float(_1211);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1261 = float(_1251);
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1255);
    float _1275 = _1261 * _1257;
    bool _1277 = !_1271;
    float _1279 = _1277 ? _123 : _943;
    float _1281 = _1273 * _1253;
    float _1283 = _1275 * (-2.0);
    float _1285 = fma(_1279, _1241, _1231);
    float _1287 = _695 + (-0.5);
    float _1289 = _1281 * (-2.0);
    float _1291 = fma(_1283, _1149, _1149);
    float _1293 = _1285 * 0.15915493667125701904296875;
    float _1295 = fma(_1071, _1283, _1071);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1291);
    float _1299 = fma(_1289, _1151, _1151);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = fma(_1057, _1289, _1057);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = fma(_1279, _1295, _1297);
    float _1309 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1299);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1313 = _1295;
    float _1315 = _1299;
    float _1317 = _1243;
    float _1319 = _1293;
    float _1321 = _1289;
    if (!_1033)
    {
        _1311 = _695;
    }
    float _1323 = _1311;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1307 * 0.15915493667125701904296875;
    float _1331 = fma(_1279, _1303, _1309);
    float _1333 = _1323;
    if (!_1033)
    {
        _1313 = _1323;
    }
    float _1335 = _1313;
    float _1337 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1339 = _1335;
    if (_1033)
    {
        _1333 = _1243;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1345 = _1293 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1331 * 0.15915493667125701904296875;
    if (_951)
    {
        _1315 = _695;
    }
    float _1351 = _1315;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1343);
    float _1355 = _1351;
    if (_1033)
    {
        _1339 = _1243;
    }
    float _1357 = _1339;
    float _1359 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    if (!_951)
    {
        _1355 = _1243;
    }
    float _1361 = _1355;
    float _1363 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1365 = _1329 * 6.283185482025146484375;
    float _1367 = sin(_1365);
    if (!_1033)
    {
        _1157 = _499;
    }
    float _1369 = _1157;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1373 = _1369;
    if (!_951)
    {
        _1317 = _499;
    }
    float _1375 = _1317;
    float _1377 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_951)
    {
        _1319 = _499;
    }
    float _1379 = _1319;
    float _1381 = _1179 + 0.5;
    float _1383 = _1379;
    if (!_1033)
    {
        _1321 = _1369;
    }
    float _1385 = _1321;
    float _1387 = _1329 * 6.283185482025146484375;
    float _1389 = cos(_1387);
    float _1391 = _1385;
    if (_1033)
    {
        _1373 = _695;
    }
    float _1393 = _1373;
    float _1395 = fma(_1337, _1381, _1099);
    if (_1033)
    {
        _1391 = _695;
    }
    float _1397 = _1391;
    float _1399 = _1185 + (-0.5);
    if (!_951)
    {
        _1383 = _695;
    }
    float _1401 = _1383;
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1017);
    float _1405 = _1349 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1347 * _1367;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1415 = -_1377;
    float _1417 = -_1403;
    float _1419 = fma(_1415, _1399, _1417);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1423 = _1349 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1327 * _1389;
    float _1429 = fma(_1411, -2.0, _1413);
    float _1431 = -_1421;
    float _1433 = fma(_1371, 2.0, _1431);
    float _1435 = _1327 * _1367;
    float _1437 = _1191 * (-0.15915493667125701904296875);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1441 = -_123;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1433);
    float _1445 = -_1409;
    float _1447 = fma(_1407, _1427, _1445);
    float _1449 = -_1427;
    float _1451 = fma(_1407, _1409, _1449);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1439);
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1459 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1453);
    float _1461 = _1389 * _1425;
    float _1463 = _1425 * _953;
    float _1465 = _1347 * _1389;
    float _1467 = _1367 * _1425;
    float _1469 = -_953;
    float _1471 = _1407 * _1469;
    float _1473 = _1347 * _1463;
    float _1475 = fma(_1407, _1465, _1435);
    float _1477 = fma(_1407, _1435, _1465);
    float _1479 = _1327 * _1463;
    float _1481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = fma(_1475, _937, _1473);
    float _1485 = fma(_1461, _937, _1471);
    float _1487 = fma(_1447, _937, _1479);
    float _1489 = _1459 * (-0.15915493667125701904296875);
    float _1491 = fma(_1451, _1481, _1483);
    float _1493 = fma(_1467, _1481, _1485);
    float _1495 = fma(_1477, _1481, _1487);
    float _1497 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1501 = _1489 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1497);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1499);
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1511 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1513 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1505);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1507);
    float _1517 = _1489 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1523 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1525 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1529 = _829 + _1521;
    float _1531 = -_1509;
    float _1533 = fma(_1523, 2.0, _1531);
    float _1535 = _831 + _1525;
    float _1537 = _1437 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1543 = _1529 + _1541;
    float _1545 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1535 + _1547;
    float _1551 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1511);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, -2.0, _1527);
    float _1557 = -_123;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    float _1561 = _1437 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = fma(_1549, _1549, _1553);
    float _1567 = _823 * _1503;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1551);
    float _1571 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1555);
    float _1573 = sqrt(_1565);
    float _1575 = _777 * _1539;
    float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1579 = _777 * _1563;
    float _1581 = -_1575;
    float _1583 = fma(_989, _1563, _1581);
    float _1585 = _823 * _1519;
    float _1587 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = fma(_989, _1539, _1579);
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1429);
    float _1593 = _1583 + 0.5;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1597 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _1589 + (-0.5);
    float _1601 = -_1567;
    float _1603 = fma(_1029, _1519, _1601);
    float _1605 = fma(_1029, _1503, _1585);
    float _1607 = fma(_1587, _1593, _1443);
    float _1609 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _985);
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1615 = -_1613;
    float _1617 = -_1591;
    float _1619 = fma(_1615, _1599, _1617);
    float _1621 = _721 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1623 = _1603 + 0.5;
    float _1625 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1627 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1629 = _1605 + (-0.5);
    float _1631 = fma(_1625, _1623, _1559);
    float _1633 = _1621 + _1627;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1641 = -_1639;
    float _1643 = -_1571;
    float _1645 = fma(_1641, _1629, _1643);
    bool _1647 = !_1597;
    float _1649 = _1633;
    float _1651 = _1535;
    float _1653 = _1529;
    if (!_1647)
    {
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1659 = _1573 + _1657;
        float _1661 = rsqrt(_1565);
        float _1663 = _1659 * _1655;
        float _1665 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1667 = _1663 * 0.15915493667125701904296875;
        float _1669 = _1667 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1667 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        float _1677 = _1671 + (-1.0);
        float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = fma(_1675, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1683 = fma(_1633, _1671, _1679);
        float _1685 = _1661 * _1681;
        float _1687 = fma(_1549, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1689 = fma(_1543, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1649 = _1683;
        _1651 = _1687;
        _1653 = _1689;
    }
    float _1691 = _1649;
    float _1693 = _1651;
    float _1695 = _1653;
    float _1697 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _995);
    float _1699 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1701 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1359);
    float _1703 = -_1637;
    float _1705 = fma(_1703, _637, _1123);
    float _1707 = -_1697;
    float _1709 = _1707 + 1.0;
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = -_1701;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1223);
    float _1721 = fma(_1709, _715, _1145);
    float _1723 = -_1621;
    float _1725 = _1723 + _1691;
    float _1727 = -_1713;
    float _1729 = fma(_1179, _1727, _1395);
    float _1731 = -_831;
    float _1733 = _1731 + _1693;
    float _1735 = -_1719;
    float _1737 = _1735 + 1.0;
    float _1739 = _1725 * _1725;
    float _1741 = -_829;
    float _1743 = _1741 + _1695;
    float _1745 = -_1737;
    float _1747 = fma(_1603, _1745, _1631);
    float _1749 = fma(_1733, _1733, _1739);
    float _1751 = fma(_1185, _1717, _1419);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1755 = fma(_1743, _1743, _1749);
    float _1757 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1759 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1457);
    float _1761 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1363);
    float _1763 = sqrt(_1755);
    float _1765 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1777 = -_1757;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1803 = -_1779;
    float _1805 = fma(_1583, _1803, _1607);
    float _1807 = fma(_1589, _1783, _1619);
    float _1809 = fma(_1605, _1787, _1645);
    out.m_58.x = _1791;
    out.m_58.y = _1793;
    out.m_58.z = _1795;
    out.m_58.w = _1789;
    bool _1811 = _1763 > 0.0;
    out.m_60.x = _1797;
    out.m_60.y = _1799;
    out.m_60.z = _1765;
    out.m_60.w = _1801;
    out.m_62.x = _1705;
    out.m_62.y = _1721;
    out.m_64.x = _1729;
    out.m_64.y = _1751;
    out.m_64.z = _1805;
    out.m_64.w = _1807;
    out.m_66.x = _1747;
    out.m_66.y = _1809;
    bool _1813 = !_1811;
    float _1815 = _1805;
    float _1817 = _1751;
    float _1819 = _1729;
    float _1821 = _1795;
    float _1823 = _1691;
    float _1825 = _1693;
    float _1827 = _1695;
    float _1829 = _1729;
    float _1831 = _1795;
    if (!_1813)
    {
        bool _1833 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1835 = _1807;
        if (_1833)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1835 = _1837;
        }
        float _1839 = _1835;
        if (_1833)
        {
            float _1841 = _445 * _1839;
            _1815 = _1841;
        }
        float _1843 = _1815;
        float _1845 = _1843;
        if (_1833)
        {
            float _1847 = _447 * _1839;
            _1817 = _1847;
        }
        float _1849 = _1817;
        float _1851 = _1849;
        if (_1833)
        {
            float _1853 = _449 * _1839;
            _1819 = _1853;
        }
        float _1855 = _1819;
        float _1857 = _1855;
        if (!_1833)
        {
            float _1859 = _123 + 1.0;
            if (!_159)
            {
                float _1861 = _1859 * _1859;
                float _1863 = _1861 * 0.5;
                _125 = _1863;
            }
            float _1865 = _125;
            float _1867 = _1865;
            if (!_159)
            {
                float _1869 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1867 = _1869;
            }
            float _1871 = _1867;
            bool _1873 = !_159;
            float _1875 = _1871;
            if (!_1873)
            {
                float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1879 = log2(_1877);
                float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1883 = 1.0 + _1881;
                float _1885 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1887 = _1879 * _1859;
                float _1889 = 1.0 / _1883;
                float _1891 = _1885 * 0.693147182464599609375;
                float _1893 = exp2(_1887);
                float _1895 = 1.0 / _1891;
                float _1897 = _1893 + (-1.0);
                float _1899 = -_1897;
                float _1901 = fma(_1899, _1895, _1859);
                float _1903 = _1901 * _1889;
                float _1905 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1875 = _1905;
            }
            float _1907 = _1875;
            float _1909 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1911 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1913 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1915 = _1907;
            if (!_159)
            {
                _1915 = _1859;
            }
            float _1917 = _1915;
            float _1919 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1921 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1923 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1919);
            float _1927 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1921);
            float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1925);
            bool _1931 = !_159;
            float _1933 = _1917;
            _1821 = _1929;
            if (!_1931)
            {
                float _1935 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1937 = log2(_1935);
                float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1941 = 1.0 + _1939;
                float _1943 = 1.0 / _1941;
                float _1945 = _1937 * _1859;
                float _1947 = exp2(_1945);
                float _1949 = -_1947;
                float _1951 = _1949 + 1.0;
                float _1953 = _1951 * _1943;
                _1933 = _1953;
            }
            float _1955 = _1933;
            float _1957 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1923);
            float _1959 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1927);
            float _1961 = fma(_1955, _163, _1929);
            float _1963 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1957);
            float _1965 = fma(_1955, _161, _1959);
            float _1967 = -_407;
            float _1969 = _1967 + _1961;
            float _1971 = fma(_1955, _165, _1963);
            float _1973 = -_411;
            float _1975 = _1973 + _1965;
            float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1983 = -_413;
            float _1985 = _1983 + _1971;
            float _1987 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1977);
            float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1979);
            float _1991 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1981);
            float _1993 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1987);
            float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1989);
            float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1991);
            _459 = _1995;
            _461 = _1993;
            _463 = _1997;
            _1845 = _1993;
            _1851 = _1995;
            _1857 = _1997;
        }
        float _1999 = _459;
        float _2001 = _461;
        float _2003 = _463;
        float _2005 = _1845;
        float _2007 = _1851;
        float _2009 = _1857;
        float _2011 = _1821;
        float _2013 = _1999 * _1999;
        float _2015 = fma(_2001, _2001, _2013);
        float _2017 = fma(_2003, _2003, _2015);
        float _2019 = rsqrt(_1755);
        float _2021 = sqrt(_2017);
        float _2023 = _1733 * _2019;
        float _2025 = _1725 * _2019;
        float _2027 = _1743 * _2019;
        bool _2029 = _2021 > 0.0;
        bool _2031 = !_2029;
        _1829 = _2009;
        _1831 = _2011;
        if (!_2031)
        {
            float _2033 = rsqrt(_2017);
            float _2035 = _2033 * _1999;
            float _2037 = _2033 * _2001;
            float _2039 = _2033 * _2003;
            float _2041 = _2025 * _2035;
            float _2043 = fma(_2023, _2037, _2041);
            float _2045 = fma(_2027, _2039, _2043);
            float _2047 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2049 = fma(_2005, _2047, _1693);
            float _2051 = fma(_2007, _2047, _1691);
            float _2053 = fma(_2009, _2047, _1695);
            _1823 = _2051;
            _1825 = _2049;
            _1827 = _2053;
        }
    }
    float _2055 = _1823;
    float _2057 = _1825;
    float _2059 = _1827;
    float _2061 = _1829;
    float _2063 = _1831;
    float _2065 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2065);
    float _2079 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2083 = isnan(0.5);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2079);
    float _2097 = 1.0 / _2093;
    float _2099 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2095);
    float _2101 = _2061;
    float _2103 = _2093;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2107 = _2063;
    if (_2089)
    {
        _2101 = 1.0;
    }
    float _2109 = _2101;
    float _2111 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2113 = _2111 + _2093;
    float _2115 = _2109;
    if (_2075)
    {
        _2103 = _2055;
    }
    float _2117 = _2103;
    float _2119 = _2113 * _2097;
    float _2121 = _2119 * 0.5;
    float _2123 = _2097;
    float _2125 = _2121;
    float _2127 = _2117;
    if (_2075)
    {
        _2123 = _2057;
    }
    float _2129 = _2123;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2131);
    float _2135 = _2129;
    if (_2075)
    {
        _2125 = _2059;
    }
    float _2137 = _2125;
    float _2139 = 1.0 / _2133;
    float _2141 = _2137;
    if (!_2075)
    {
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2145 = _1621 + _2143;
        float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2149 = _831 + _2147;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = -_1621;
        float _2155 = _2153 + _2055;
        float _2157 = _2145 * _2145;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2161 = _829 + _2159;
        float _2163 = fma(_2149, _2149, _2157);
        float _2165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2167 = fma(_2161, _2161, _2163);
        float _2169 = sqrt(_2167);
        float _2171 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2173 = precise::min(_2169, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2175 = _2173 * _2165;
        float _2177 = -_831;
        float _2179 = _2177 + _2057;
        float _2181 = _2171 * _2175;
        float _2183 = -_829;
        float _2185 = _2183 + _2059;
        float _2187 = fma(_2179, _2181, _831);
        float _2189 = fma(_2155, _2181, _1621);
        float _2191 = fma(_2185, _2181, _829);
        _2105 = _2181;
        _2127 = _2189;
        _2135 = _2187;
        _2141 = _2191;
    }
    float _2193 = _2105;
    float _2195 = _2127;
    float _2197 = _2135;
    float _2199 = _2141;
    float _2201 = _2193;
    if (_2089)
    {
        _2201 = 1.0;
    }
    float _2203 = _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2207 = _2139 * _2205;
    float _2209 = _2203;
    float _2211 = _2207;
    if (!_2089)
    {
        float _2213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2215 = _2213 * 0.15915493667125701904296875;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = cos(_2219);
        float _2223 = _2217 * 0.15915493667125701904296875;
        float _2225 = _2215 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        float _2229 = 1.0 / _2221;
        float _2231 = _2223 * 6.283185482025146484375;
        float _2233 = cos(_2231);
        float _2235 = _2227 * _2229;
        float _2237 = _2223 * 6.283185482025146484375;
        float _2239 = sin(_2237);
        float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2241;
        float _2245 = _2233 * _2235;
        float _2247 = 1.0 / _2243;
        float _2249 = 1.0 / _2245;
        float _2251 = _2239 * _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2255 = fma(_2207, _2251, _2253);
        float _2257 = _2255 * _2247;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        _2107 = _2215;
        _2115 = _2259;
    }
    float _2261 = _2107;
    float _2263 = _2115;
    float _2265 = _2261;
    if (!_2089)
    {
        float _2267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2269 = _2267 * 0.15915493667125701904296875;
        float _2271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = cos(_2273);
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2269 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        float _2283 = 1.0 / _2275;
        float _2285 = _2277 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = _2281 * _2283;
        float _2291 = _2277 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = 1.0 / _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2301 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2299;
        float _2303 = 1.0 / _2301;
        float _2305 = _2293 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2309 = fma(_2207, _2305, _2307);
        float _2311 = _2309 * _2303;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = -_2313;
        float _2317 = _2315 + 1.0;
        _2265 = _2295;
        _2209 = _2317;
    }
    float _2319 = _2265;
    float _2321 = _2209;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2325 = _2195 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2329 = _2197 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2333 = _2199 + _2331;
    float _2335 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2337 = _2325 * _2325;
    float _2339 = fma(_2329, _2329, _2337);
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = rsqrt(_2341);
    float _2345 = sqrt(_2341);
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2329 * _2347;
    float _2351 = _2333 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2333;
    float _2369 = _2337;
    float _2371 = _2365;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2361)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2377;
    }
    float _2379 = _2367;
    if (_2361)
    {
        float _2381 = rsqrt(_2357);
        _2369 = _2381;
    }
    float _2383 = _2369;
    float _2385 = _2383;
    if (_2361)
    {
        float _2387 = _2365 * _2379;
        _2371 = _2387;
    }
    float _2389 = _2371;
    if (_2361)
    {
        float _2391 = _2389 * 0.15915493667125701904296875;
        _2211 = _2391;
    }
    float _2393 = _2211;
    float _2395 = _2343;
    if (_2361)
    {
        float _2397 = _2393 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        _2395 = _2399;
    }
    float _2401 = _2395;
    float _2403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2405 = precise::max(0.0, _2403);
    float _2407 = _2319;
    float _2409 = _2405;
    float _2411 = _2403;
    if (_2361)
    {
        float _2413 = _2393 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        _2407 = _2415;
    }
    float _2417 = _2407;
    float _2419 = -_2347;
    float _2421 = -_2405;
    float _2423 = fma(_2325, _2419, _2421);
    float _2425 = _2423;
    if (_2361)
    {
        float _2427 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2409 = _2427;
    }
    float _2429 = _2409;
    float _2431 = _2401;
    float _2433 = _2429;
    if (_2361)
    {
        float _2435 = fma(_2401, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (_2361)
    {
        float _2441 = _2417 + (-1.0);
        _2411 = _2441;
    }
    float _2443 = _2411;
    float _2445 = _2443;
    if (_2361)
    {
        float _2447 = _2383 * _2437;
        _2373 = _2447;
    }
    float _2449 = _2373;
    if (!_2361)
    {
        _2385 = _2423;
    }
    float _2451 = _2385;
    float _2453 = _2451;
    if (_2361)
    {
        float _2455 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2455;
    }
    float _2457 = _2433;
    if (_2361)
    {
        float _2459 = _2349 * _2449;
        _2375 = _2459;
    }
    float _2461 = _2375;
    if (!_2361)
    {
        _2439 = _2351;
    }
    float _2463 = _2439;
    float _2465 = _2463;
    if (_2361)
    {
        float _2467 = _2351 * _2449;
        _2465 = _2467;
    }
    float _2469 = _2465;
    if (!_2361)
    {
        _2445 = _2353;
    }
    float _2471 = _2445;
    float _2473 = _2471;
    if (_2361)
    {
        float _2475 = fma(_2423, _2417, _2457);
        _2453 = _2475;
    }
    float _2477 = _2453;
    if (_2361)
    {
        float _2479 = _2461 * _2461;
        _2473 = _2479;
    }
    float _2481 = _2473;
    if (!_2361)
    {
        _2425 = _2355;
    }
    float _2483 = _2425;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2469 * _2469;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2497 = _2491 + _2489;
    float _2499 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2501 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2505 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2503);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = rsqrt(_2497);
    float _2511 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2499);
    float _2513 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = -_2507;
    float _2517 = _2515 + 1.0;
    float _2519 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2523 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2495);
    float _2525 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2527 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2531 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2523);
    float _2533 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2535 = abs(_2517);
    float _2537 = log2(_2535);
    float _2539 = -_2529;
    float _2541 = fma(_2539, _2335, 1.0);
    float _2543 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2545 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2509 * _2461;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2509 * _2477;
    float _2553 = _2509 * _2469;
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2561 = log2(_2541);
    float _2563 = -_2555;
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2569 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = -_2553;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2575 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2567);
    float _2577 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2579 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = fma(_2573, -0.5, 0.5);
    float _2583 = 1.0 / _2575;
    float _2585 = fma(_2573, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2591 = _2551 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = exp2(_2577);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = _2561 * 0.693147182464599609375;
    float _2609 = fma(_2585, _2601, 1.570728778839111328125);
    float _2611 = sqrt(_2581);
    float _2613 = _2603 * _2583;
    float _2615 = _2605 * _2583;
    float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2613, 0.5, 0.5);
    float _2621 = fma(_2615, -0.5, 0.5);
    float _2623 = -_2551;
    float _2625 = fma(_2599, _2591, _2623);
    float3 _6762 = float3(_2619, _2621, _2617);
    float _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6762, float3(0.0), isnan(_6762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6762, float3(0.0), isnan(_6762)), level(0.0)).x;
    float _2629 = fma(_2625, 0.5, 0.5);
    float _2631 = _2611 * 0.636619746685028076171875;
    float _2633 = -_2609;
    float _2635 = fma(_2631, _2633, 1.0);
    float3 _6783 = float3(_2619, _2621, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _6800 = float2(_2635, _2629);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2660 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2662 = _2263 > 0.0;
    bool _2664 = isnan(_2263);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2660);
    float _2674 = exp2(_2658);
    bool _2676 = _2321 <= 0.0;
    bool _2678 = !_2670;
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2684 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2682);
    float _2686 = _2263 * _2321;
    float _2688 = _2684 + _2575;
    float _2690 = _2686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2692 = _2688 * 0.5;
    float _2694 = -_2674;
    float _2696 = _2694 + 1.0;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2684;
    out.gl_Position.w = _2575;
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2692;
    out.m_68.w = _2575;
    out.m_45.x = _2698;
    float _2702 = _2700 * _2627;
    float _2704 = -_2700;
    float _2706 = _2704 + 1.0;
    float _2708 = _2646 * _2702;
    float _2710 = _2656 * _2702;
    float _2712 = fma(_2652, _2708, _2640);
    float _2714 = fma(_2654, _2708, _2642);
    float _2716 = _2646 * _2706;
    float _2718 = fma(_2646, _2710, _2644);
    out.m_70.x = _2712;
    out.m_70.y = _2714;
    out.m_70.z = _2718;
    out.m_70.w = _2716;
    if (!_2680)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2720;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2777 = as_type<float>(_105);
        out.gl_Position.z = _2777;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_143);
        out.gl_Position.z = _2847;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
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
    float _209 = _149;
    bool _211 = false;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = exp2(_223);
        float _227 = _221 * 0.693147182464599609375;
        float _229 = 1.0 / _227;
        float _231 = 1.0 / _219;
        float _233 = _225 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _229, _147);
        float _239 = _237 * _231;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _241;
    }
    float _243 = _207;
    float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _247 = !_159;
    float _249 = _245;
    float _251 = _243;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _147 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _175 = _271;
    }
    float _273 = _175;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _283 = _123 * _123;
        float _285 = _283 * 0.5;
        _249 = _285;
    }
    float _287 = _249;
    float _289 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _291 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _293 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].z, _281);
    float _295 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _297 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _297;
    }
    float _299 = _251;
    bool _301 = !_159;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = _123 * _307;
        float _317 = exp2(_315);
        float _319 = _313 * 0.693147182464599609375;
        float _321 = 1.0 / _319;
        float _323 = 1.0 / _311;
        float _325 = _317 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _321, _123);
        float _331 = _329 * _323;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].x, _289);
    float _341 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].y, _291);
    float _343 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _347 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _349 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _293);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].x, _345);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].y, _347);
    float _357 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].z, _349);
    float _359 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_273, _161, _339);
    float _363 = fma(_273, _163, _341);
    float _365 = fma(_273, _165, _351);
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _369 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _355);
    float _371 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _373 = _359;
    float _375 = _353;
    if (!_159)
    {
        _373 = _123;
    }
    float _377 = _373;
    bool _379 = !_159;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _123 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
        _375 = _393;
    }
    float _403 = _381;
    float _405 = _375;
    float _407 = fma(_403, _163, _369);
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = fma(_403, _161, _367);
    float _413 = fma(_403, _165, _371);
    float _415 = -_407;
    float _417 = _363 + _415;
    float _419 = fma(_361, _149, _167);
    float _421 = -_411;
    float _423 = _361 + _421;
    float _425 = -_413;
    float _427 = _365 + _425;
    float _429 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _431 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_363, _149, _169);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _441 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _443 = fma(_365, _149, _171);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
    float _447 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    bool _451 = !_409;
    float _453 = _405;
    float _455 = _437;
    bool _457 = _409;
    float _459 = _447;
    float _461 = _445;
    float _463 = _449;
    float _481;
    float _483;
    if (!_451)
    {
        float _465 = in.m_54.x;
        float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _469 = _465 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _471 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _473 = _471 * _467;
        float _475 = floor(_473);
        float _477 = -_475;
        float _479 = _473 + _477;
        _481 = _473;
        _209 = _475;
        _483 = _479;
        _485 = true;
    }
    else
    {
        float _487 = float(_89);
        float _489 = 1.0 / _487;
        float _491 = _123 * _489;
        _481 = _487;
        _483 = _491;
    }
    _485 = false;
    float _493 = _481;
    float _495 = _209;
    float _497 = _483;
    float _499 = in.m_54.z;
    float _501 = in.m_54.w;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _509 = _507 != 0;
    float _511 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _515 = _513 != 0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _527 = 1.0 / _519;
    float _529 = _493;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = _511;
    if (_509)
    {
        float _535 = in.m_54.w;
        _529 = _535;
    }
    float _537 = _529;
    float _539 = _123 * _505;
    float _541 = 0.0;
    int _543 = as_type<int>(_505);
    if (!_515)
    {
        _541 = _203;
    }
    float _545 = _541;
    float _547 = _495;
    float _549 = _545;
    if (_515)
    {
        float _551 = in.m_54.x;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _525;
    bool _557 = _501 > 0.5;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (!_509)
    {
        _531 = _199;
    }
    float _563 = _531;
    float _565 = 1.0 / _561;
    float _567 = _537;
    float _569 = _563;
    if (_509)
    {
        float _571 = _537 * 3.1415927410125732421875;
        _567 = _571;
    }
    float _573 = _567;
    float _575 = _573;
    if (_509)
    {
        float _577 = _573 * 0.15915493667125701904296875;
        _453 = _577;
    }
    float _579 = _453;
    if (_515)
    {
        float _581 = _553 * 3.1415927410125732421875;
        _575 = _581;
    }
    float _583 = _575;
    if (_515)
    {
        float _585 = _583 * 0.15915493667125701904296875;
        _455 = _585;
    }
    float _587 = _455;
    float _589 = _579;
    if (_509)
    {
        float _591 = _579 * 6.283185482025146484375;
        float _593 = sin(_591);
        _589 = _593;
    }
    float _595 = _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = _587;
    if (_515)
    {
        float _603 = _587 * 6.283185482025146484375;
        float _605 = sin(_603);
        _601 = _605;
    }
    float _607 = _601;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _611 = _553;
    if (_599)
    {
        float _613 = in.m_54.x;
        float _615 = in.m_54.y;
        _609 = _613;
        _611 = _615;
    }
    float _617 = _609;
    float _619 = _611;
    float _621 = _595;
    if (_509)
    {
        bool _623 = _595 > 0.5;
        _211 = _623;
    }
    bool _625 = _211;
    int _627 = 0;
    if (_599)
    {
        _627 = 0;
    }
    int _629 = _627;
    int _631 = _629;
    if (_509)
    {
        float _633 = -_199;
        float _635 = _625 ? _633 : _199;
        _569 = _635;
    }
    float _637 = _569;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _641 = _639 != 0;
    if (_515)
    {
        bool _643 = _607 > 0.5;
        _457 = _643;
    }
    bool _645 = _457;
    float _647 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    if (_599)
    {
        _543 = 0;
    }
    int _659 = _543;
    float _661 = _619;
    float _663 = _617;
    int _665 = _659;
    if (_599)
    {
        _533 = _617;
    }
    float _667 = _533;
    float _669 = _667;
    if (_599)
    {
        _621 = _619;
    }
    float _671 = _621;
    float _673 = _671;
    if (!_599)
    {
        float _675 = in.m_54.x;
        float _677 = in.m_54.y;
        float _679 = _675 * 3.1415927410125732421875;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _677 * 3.1415927410125732421875;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        _661 = _677;
        _663 = _675;
        _665 = 2;
        _669 = _689;
        _673 = _693;
        _631 = 1;
    }
    float _695 = _661;
    float _697 = _663;
    int _699 = _665;
    float _701 = _669;
    float _703 = _673;
    int _705 = _631;
    bool _707 = _695 > 0.5;
    float _709 = exp2(_539);
    if (_515)
    {
        float _711 = -_203;
        float _713 = _645 ? _711 : _203;
        _549 = _713;
    }
    float _715 = _549;
    float _717 = _499 * 2.0;
    bool _719 = _697 > 0.5;
    float _721 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _723 = -_203;
    int _725 = _707 ? as_type<int>(_723) : as_type<int>(_203);
    float _727 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _735 = -_203;
    int _737 = _557 ? as_type<int>(_735) : as_type<int>(_203);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _741 = _497 + _739;
    float _743 = -_199;
    int _745 = _719 ? as_type<int>(_743) : as_type<int>(_199);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _749 = !_653;
    float _751 = _749 ? _203 : as_type<float>(_725);
    float _753 = _499 + (-0.5);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _765 = _763 != 0;
    float _767 = in.m_52.x;
    float _769 = in.m_52.y;
    float _771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _773 = floor(_717);
    bool _775 = !_757;
    float _777 = _775 ? _203 : as_type<float>(_737);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _779;
    bool _783 = _499 > 0.5;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _785;
    float _789 = -_709;
    float _791 = _789 + 1.0;
    float _793 = _781 * _527;
    float _795 = -_199;
    int _797 = _783 ? as_type<int>(_795) : as_type<int>(_199);
    float _799 = _787 * _555;
    float _801 = -_203;
    int _803 = _783 ? as_type<int>(_801) : as_type<int>(_203);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = fma(_793, _741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = !_765;
    float _823 = _821 ? _203 : as_type<float>(_803);
    float _825 = _807 * _565;
    float _827 = _817 ? _791 : 0.0;
    float _829 = _727 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _831 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _833 = _773 > 0.0;
    float _835 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _837 = _773 >= 0.0;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    bool _851 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = isnan(_497);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _767 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _865 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _867 = isnan(_497);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _849;
    bool _879 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_497);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_861;
    float _893 = _891 + 1.0;
    bool _895 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _897 = isnan(_497);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = _875 * _893;
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _889 * _913;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _497 + _927;
    float _931 = _905 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _935 = _497 + _933;
    float _937 = _915 * _747;
    float _939 = _819 * _931;
    float _941 = fma(_799, _935, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _943 = _827 * _877;
    int _945 = _845 ? 0 : 1;
    float _947 = fma(_825, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[115].x, _939);
    bool _951 = _699 != 2;
    float _953 = _907 * _733;
    int _955 = ~_945;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _959;
    if (!_833)
    {
        int _965 = ~_945;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_947, _925, _949);
    float _973 = _697 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _975 = _701 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _981 = fma(_941, _909, _971);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _987 = !_731;
    float _989 = _987 ? _199 : as_type<float>(_797);
    float _991 = -_961;
    float _993 = fma(_973, 2.0, _991);
    float _995 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[93].w, _979);
    float _997 = _703 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _999 = _695 * 2.0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1005 = _695 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1007 = -_983;
    float _1009 = fma(_975, 2.0, _1007);
    float _1011 = -_199;
    int _1013 = _707 ? as_type<int>(_1011) : as_type<int>(_199);
    float _1015 = _697 * 2.0;
    float _1017 = fma(_1005, -2.0, _1001);
    float _1019 = fma(_997, -2.0, _1003);
    bool _1021 = !_641;
    float _1023 = _1021 ? _199 : as_type<float>(_745);
    float _1025 = floor(_1015);
    bool _1027 = !_761;
    float _1029 = _1027 ? _199 : as_type<float>(_1013);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1033 = _705 != 1;
    float _1035 = _695 + _499;
    float _1037 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1031);
    float _1039 = _695 + _697;
    float _1041 = floor(_999);
    float _1043 = _499 + _697;
    float _1045 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1037);
    float _1047 = _1039 + (-1.0);
    float _1049 = _1043 + (-1.0);
    float _1051 = _1045 * (-0.15915493667125701904296875);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1055 = _1035 + (-1.0);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1061 = _1025 >= 0.0;
    bool _1063 = isnan(_1025);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(0.0);
    bool _1069 = _1065 || _1067;
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1073 = -_123;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1009);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1079 = _1041 >= 0.0;
    bool _1081 = isnan(_1041);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    float _1089 = _715 + (-0.5);
    bool _1091 = _1025 > 0.0;
    float _1093 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    int _1095 = _1069 ? 0 : 1;
    float _1097 = -_123;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[76].x, _993);
    int _1101 = _1087 ? 0 : 1;
    float _1103 = _1051 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1117 = _1115 != 0;
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1121 = _637 + 0.5;
    float _1123 = fma(_1119, _1121, _1075);
    float _1125 = _1051 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1131 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1019);
    bool _1133 = !_1109;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1139 = _1041 > 0.0;
    float _1141 = -_1129;
    float _1143 = -_1131;
    float _1145 = fma(_1141, _1089, _1143);
    float _1147 = in.m_56.x;
    float _1149 = in.m_56.y;
    float _1151 = in.m_56.z;
    float _1153 = _1089;
    float _1155 = _1051;
    float _1157 = _1131;
    if (!_1033)
    {
        _1153 = _697;
    }
    float _1159 = _1153;
    float _1161 = _751 * _1105;
    int _1163 = abs(_1135);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1167 = _1159;
    if (!_1033)
    {
        _1155 = _1159;
    }
    float _1169 = _1155;
    float _1171 = _1169;
    if (_1033)
    {
        _1171 = _499;
    }
    float _1173 = _1171;
    float _1175 = _751 * _1127;
    float _1177 = -_1161;
    float _1179 = fma(_1023, _1127, _1177);
    float _1181 = float(_969);
    float _1183 = float(_1163);
    float _1185 = fma(_1023, _1105, _1175);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1137);
    float _1189 = _1183 * _1181;
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1187);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1195 = _1189 * (-2.0);
    int _1197 = ~_1095;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1205 = _1201;
    if (!_1091)
    {
        int _1207 = ~_1095;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = _697 + (-0.5);
    float _1217 = fma(_1195, _1147, _1147);
    bool _1219 = !_1113;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    int _1225 = ~_1101;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1217);
    int _1233 = _1229;
    if (!_1139)
    {
        int _1235 = ~_1101;
        int _1237 = _1235 + 1;
        _1233 = _1237;
    }
    int _1239 = _1233;
    float _1241 = fma(_1059, _1195, _1059);
    if (_1033)
    {
        _1167 = _697;
    }
    float _1243 = _1167;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1247 = !_1117;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = abs(_1221);
    float _1253 = float(_1239);
    int _1255 = abs(_1249);
    float _1257 = float(_1211);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1261 = float(_1251);
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1255);
    float _1275 = _1261 * _1257;
    bool _1277 = !_1271;
    float _1279 = _1277 ? _123 : _943;
    float _1281 = _1273 * _1253;
    float _1283 = _1275 * (-2.0);
    float _1285 = fma(_1279, _1241, _1231);
    float _1287 = _695 + (-0.5);
    float _1289 = _1281 * (-2.0);
    float _1291 = fma(_1283, _1149, _1149);
    float _1293 = _1285 * 0.15915493667125701904296875;
    float _1295 = fma(_1071, _1283, _1071);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1291);
    float _1299 = fma(_1289, _1151, _1151);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = fma(_1057, _1289, _1057);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = fma(_1279, _1295, _1297);
    float _1309 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1299);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1313 = _1295;
    float _1315 = _1299;
    float _1317 = _1243;
    float _1319 = _1293;
    float _1321 = _1289;
    if (!_1033)
    {
        _1311 = _695;
    }
    float _1323 = _1311;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1307 * 0.15915493667125701904296875;
    float _1331 = fma(_1279, _1303, _1309);
    float _1333 = _1323;
    if (!_1033)
    {
        _1313 = _1323;
    }
    float _1335 = _1313;
    float _1337 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1339 = _1335;
    if (_1033)
    {
        _1333 = _1243;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1345 = _1293 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1331 * 0.15915493667125701904296875;
    if (_951)
    {
        _1315 = _695;
    }
    float _1351 = _1315;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1343);
    float _1355 = _1351;
    if (_1033)
    {
        _1339 = _1243;
    }
    float _1357 = _1339;
    float _1359 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    if (!_951)
    {
        _1355 = _1243;
    }
    float _1361 = _1355;
    float _1363 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1365 = _1329 * 6.283185482025146484375;
    float _1367 = sin(_1365);
    if (!_1033)
    {
        _1157 = _499;
    }
    float _1369 = _1157;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1373 = _1369;
    if (!_951)
    {
        _1317 = _499;
    }
    float _1375 = _1317;
    float _1377 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_951)
    {
        _1319 = _499;
    }
    float _1379 = _1319;
    float _1381 = _1179 + 0.5;
    float _1383 = _1379;
    if (!_1033)
    {
        _1321 = _1369;
    }
    float _1385 = _1321;
    float _1387 = _1329 * 6.283185482025146484375;
    float _1389 = cos(_1387);
    float _1391 = _1385;
    if (_1033)
    {
        _1373 = _695;
    }
    float _1393 = _1373;
    float _1395 = fma(_1337, _1381, _1099);
    if (_1033)
    {
        _1391 = _695;
    }
    float _1397 = _1391;
    float _1399 = _1185 + (-0.5);
    if (!_951)
    {
        _1383 = _695;
    }
    float _1401 = _1383;
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1017);
    float _1405 = _1349 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1347 * _1367;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1415 = -_1377;
    float _1417 = -_1403;
    float _1419 = fma(_1415, _1399, _1417);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1423 = _1349 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1327 * _1389;
    float _1429 = fma(_1411, -2.0, _1413);
    float _1431 = -_1421;
    float _1433 = fma(_1371, 2.0, _1431);
    float _1435 = _1327 * _1367;
    float _1437 = _1191 * (-0.15915493667125701904296875);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1441 = -_123;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1433);
    float _1445 = -_1409;
    float _1447 = fma(_1407, _1427, _1445);
    float _1449 = -_1427;
    float _1451 = fma(_1407, _1409, _1449);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1439);
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1459 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1453);
    float _1461 = _1389 * _1425;
    float _1463 = _1425 * _953;
    float _1465 = _1347 * _1389;
    float _1467 = _1367 * _1425;
    float _1469 = -_953;
    float _1471 = _1407 * _1469;
    float _1473 = _1347 * _1463;
    float _1475 = fma(_1407, _1465, _1435);
    float _1477 = fma(_1407, _1435, _1465);
    float _1479 = _1327 * _1463;
    float _1481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = fma(_1475, _937, _1473);
    float _1485 = fma(_1461, _937, _1471);
    float _1487 = fma(_1447, _937, _1479);
    float _1489 = _1459 * (-0.15915493667125701904296875);
    float _1491 = fma(_1451, _1481, _1483);
    float _1493 = fma(_1467, _1481, _1485);
    float _1495 = fma(_1477, _1481, _1487);
    float _1497 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1501 = _1489 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1497);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1499);
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1511 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1513 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1505);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1507);
    float _1517 = _1489 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1523 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1525 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1529 = _829 + _1521;
    float _1531 = -_1509;
    float _1533 = fma(_1523, 2.0, _1531);
    float _1535 = _831 + _1525;
    float _1537 = _1437 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1543 = _1529 + _1541;
    float _1545 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1535 + _1547;
    float _1551 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1511);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, -2.0, _1527);
    float _1557 = -_123;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    float _1561 = _1437 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = fma(_1549, _1549, _1553);
    float _1567 = _823 * _1503;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1551);
    float _1571 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1555);
    float _1573 = sqrt(_1565);
    float _1575 = _777 * _1539;
    float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1579 = _777 * _1563;
    float _1581 = -_1575;
    float _1583 = fma(_989, _1563, _1581);
    float _1585 = _823 * _1519;
    float _1587 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = fma(_989, _1539, _1579);
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1429);
    float _1593 = _1583 + 0.5;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1597 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _1589 + (-0.5);
    float _1601 = -_1567;
    float _1603 = fma(_1029, _1519, _1601);
    float _1605 = fma(_1029, _1503, _1585);
    float _1607 = fma(_1587, _1593, _1443);
    float _1609 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _985);
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1615 = -_1613;
    float _1617 = -_1591;
    float _1619 = fma(_1615, _1599, _1617);
    float _1621 = _721 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1623 = _1603 + 0.5;
    float _1625 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1627 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1629 = _1605 + (-0.5);
    float _1631 = fma(_1625, _1623, _1559);
    float _1633 = _1621 + _1627;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1641 = -_1639;
    float _1643 = -_1571;
    float _1645 = fma(_1641, _1629, _1643);
    bool _1647 = !_1597;
    float _1649 = _1633;
    float _1651 = _1535;
    float _1653 = _1529;
    if (!_1647)
    {
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1659 = _1573 + _1657;
        float _1661 = rsqrt(_1565);
        float _1663 = _1659 * _1655;
        float _1665 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1667 = _1663 * 0.15915493667125701904296875;
        float _1669 = _1667 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1667 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        float _1677 = _1671 + (-1.0);
        float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = fma(_1675, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1683 = fma(_1633, _1671, _1679);
        float _1685 = _1661 * _1681;
        float _1687 = fma(_1549, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1689 = fma(_1543, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1649 = _1683;
        _1651 = _1687;
        _1653 = _1689;
    }
    float _1691 = _1649;
    float _1693 = _1651;
    float _1695 = _1653;
    float _1697 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _995);
    float _1699 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1701 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1359);
    float _1703 = -_1637;
    float _1705 = fma(_1703, _637, _1123);
    float _1707 = -_1697;
    float _1709 = _1707 + 1.0;
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = -_1701;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1223);
    float _1721 = fma(_1709, _715, _1145);
    float _1723 = -_1621;
    float _1725 = _1723 + _1691;
    float _1727 = -_1713;
    float _1729 = fma(_1179, _1727, _1395);
    float _1731 = -_831;
    float _1733 = _1731 + _1693;
    float _1735 = -_1719;
    float _1737 = _1735 + 1.0;
    float _1739 = _1725 * _1725;
    float _1741 = -_829;
    float _1743 = _1741 + _1695;
    float _1745 = -_1737;
    float _1747 = fma(_1603, _1745, _1631);
    float _1749 = fma(_1733, _1733, _1739);
    float _1751 = fma(_1185, _1717, _1419);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1755 = fma(_1743, _1743, _1749);
    float _1757 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1759 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1457);
    float _1761 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1363);
    float _1763 = sqrt(_1755);
    float _1765 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1777 = -_1757;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1803 = -_1779;
    float _1805 = fma(_1583, _1803, _1607);
    float _1807 = fma(_1589, _1783, _1619);
    float _1809 = fma(_1605, _1787, _1645);
    out.m_58.x = _1791;
    out.m_58.y = _1793;
    out.m_58.z = _1795;
    out.m_58.w = _1789;
    bool _1811 = _1763 > 0.0;
    out.m_60.x = _1797;
    out.m_60.y = _1799;
    out.m_60.z = _1765;
    out.m_60.w = _1801;
    out.m_62.x = _1705;
    out.m_62.y = _1721;
    out.m_64.x = _1729;
    out.m_64.y = _1751;
    out.m_64.z = _1805;
    out.m_64.w = _1807;
    out.m_66.x = _1747;
    out.m_66.y = _1809;
    bool _1813 = !_1811;
    float _1815 = _1805;
    float _1817 = _1751;
    float _1819 = _1729;
    float _1821 = _1795;
    float _1823 = _1691;
    float _1825 = _1693;
    float _1827 = _1695;
    float _1829 = _1729;
    float _1831 = _1795;
    if (!_1813)
    {
        bool _1833 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1835 = _1807;
        if (_1833)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1835 = _1837;
        }
        float _1839 = _1835;
        if (_1833)
        {
            float _1841 = _445 * _1839;
            _1815 = _1841;
        }
        float _1843 = _1815;
        float _1845 = _1843;
        if (_1833)
        {
            float _1847 = _447 * _1839;
            _1817 = _1847;
        }
        float _1849 = _1817;
        float _1851 = _1849;
        if (_1833)
        {
            float _1853 = _449 * _1839;
            _1819 = _1853;
        }
        float _1855 = _1819;
        float _1857 = _1855;
        if (!_1833)
        {
            float _1859 = _123 + 1.0;
            if (!_159)
            {
                float _1861 = _1859 * _1859;
                float _1863 = _1861 * 0.5;
                _125 = _1863;
            }
            float _1865 = _125;
            float _1867 = _1865;
            if (!_159)
            {
                float _1869 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1867 = _1869;
            }
            float _1871 = _1867;
            bool _1873 = !_159;
            float _1875 = _1871;
            if (!_1873)
            {
                float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1879 = log2(_1877);
                float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1883 = 1.0 + _1881;
                float _1885 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1887 = _1879 * _1859;
                float _1889 = 1.0 / _1883;
                float _1891 = _1885 * 0.693147182464599609375;
                float _1893 = exp2(_1887);
                float _1895 = 1.0 / _1891;
                float _1897 = _1893 + (-1.0);
                float _1899 = -_1897;
                float _1901 = fma(_1899, _1895, _1859);
                float _1903 = _1901 * _1889;
                float _1905 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1875 = _1905;
            }
            float _1907 = _1875;
            float _1909 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1911 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1913 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1915 = _1907;
            if (!_159)
            {
                _1915 = _1859;
            }
            float _1917 = _1915;
            float _1919 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1921 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1923 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1919);
            float _1927 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1921);
            float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1925);
            bool _1931 = !_159;
            float _1933 = _1917;
            _1821 = _1929;
            if (!_1931)
            {
                float _1935 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1937 = log2(_1935);
                float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1941 = 1.0 + _1939;
                float _1943 = 1.0 / _1941;
                float _1945 = _1937 * _1859;
                float _1947 = exp2(_1945);
                float _1949 = -_1947;
                float _1951 = _1949 + 1.0;
                float _1953 = _1951 * _1943;
                _1933 = _1953;
            }
            float _1955 = _1933;
            float _1957 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1923);
            float _1959 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1927);
            float _1961 = fma(_1955, _163, _1929);
            float _1963 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1957);
            float _1965 = fma(_1955, _161, _1959);
            float _1967 = -_407;
            float _1969 = _1967 + _1961;
            float _1971 = fma(_1955, _165, _1963);
            float _1973 = -_411;
            float _1975 = _1973 + _1965;
            float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1983 = -_413;
            float _1985 = _1983 + _1971;
            float _1987 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1977);
            float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1979);
            float _1991 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1981);
            float _1993 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1987);
            float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1989);
            float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1991);
            _459 = _1995;
            _461 = _1993;
            _463 = _1997;
            _1845 = _1993;
            _1851 = _1995;
            _1857 = _1997;
        }
        float _1999 = _459;
        float _2001 = _461;
        float _2003 = _463;
        float _2005 = _1845;
        float _2007 = _1851;
        float _2009 = _1857;
        float _2011 = _1821;
        float _2013 = _1999 * _1999;
        float _2015 = fma(_2001, _2001, _2013);
        float _2017 = fma(_2003, _2003, _2015);
        float _2019 = rsqrt(_1755);
        float _2021 = sqrt(_2017);
        float _2023 = _1733 * _2019;
        float _2025 = _1725 * _2019;
        float _2027 = _1743 * _2019;
        bool _2029 = _2021 > 0.0;
        bool _2031 = !_2029;
        _1829 = _2009;
        _1831 = _2011;
        if (!_2031)
        {
            float _2033 = rsqrt(_2017);
            float _2035 = _2033 * _1999;
            float _2037 = _2033 * _2001;
            float _2039 = _2033 * _2003;
            float _2041 = _2025 * _2035;
            float _2043 = fma(_2023, _2037, _2041);
            float _2045 = fma(_2027, _2039, _2043);
            float _2047 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2049 = fma(_2005, _2047, _1693);
            float _2051 = fma(_2007, _2047, _1691);
            float _2053 = fma(_2009, _2047, _1695);
            _1823 = _2051;
            _1825 = _2049;
            _1827 = _2053;
        }
    }
    float _2055 = _1823;
    float _2057 = _1825;
    float _2059 = _1827;
    float _2061 = _1829;
    float _2063 = _1831;
    float _2065 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2065);
    float _2079 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2083 = isnan(0.5);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2079);
    float _2097 = 1.0 / _2093;
    float _2099 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2095);
    float _2101 = _2061;
    float _2103 = _2093;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2107 = _2063;
    if (_2089)
    {
        _2101 = 1.0;
    }
    float _2109 = _2101;
    float _2111 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2113 = _2111 + _2093;
    float _2115 = _2109;
    if (_2075)
    {
        _2103 = _2055;
    }
    float _2117 = _2103;
    float _2119 = _2113 * _2097;
    float _2121 = _2119 * 0.5;
    float _2123 = _2097;
    float _2125 = _2121;
    float _2127 = _2117;
    if (_2075)
    {
        _2123 = _2057;
    }
    float _2129 = _2123;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2131);
    float _2135 = _2129;
    if (_2075)
    {
        _2125 = _2059;
    }
    float _2137 = _2125;
    float _2139 = 1.0 / _2133;
    float _2141 = _2137;
    if (!_2075)
    {
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2145 = _1621 + _2143;
        float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2149 = _831 + _2147;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = -_1621;
        float _2155 = _2153 + _2055;
        float _2157 = _2145 * _2145;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2161 = _829 + _2159;
        float _2163 = fma(_2149, _2149, _2157);
        float _2165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2167 = fma(_2161, _2161, _2163);
        float _2169 = sqrt(_2167);
        float _2171 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2173 = precise::min(_2169, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2175 = _2173 * _2165;
        float _2177 = -_831;
        float _2179 = _2177 + _2057;
        float _2181 = _2171 * _2175;
        float _2183 = -_829;
        float _2185 = _2183 + _2059;
        float _2187 = fma(_2179, _2181, _831);
        float _2189 = fma(_2155, _2181, _1621);
        float _2191 = fma(_2185, _2181, _829);
        _2105 = _2181;
        _2127 = _2189;
        _2135 = _2187;
        _2141 = _2191;
    }
    float _2193 = _2105;
    float _2195 = _2127;
    float _2197 = _2135;
    float _2199 = _2141;
    float _2201 = _2193;
    if (_2089)
    {
        _2201 = 1.0;
    }
    float _2203 = _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2207 = _2139 * _2205;
    float _2209 = _2203;
    float _2211 = _2207;
    if (!_2089)
    {
        float _2213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2215 = _2213 * 0.15915493667125701904296875;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = cos(_2219);
        float _2223 = _2217 * 0.15915493667125701904296875;
        float _2225 = _2215 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        float _2229 = 1.0 / _2221;
        float _2231 = _2223 * 6.283185482025146484375;
        float _2233 = cos(_2231);
        float _2235 = _2227 * _2229;
        float _2237 = _2223 * 6.283185482025146484375;
        float _2239 = sin(_2237);
        float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2241;
        float _2245 = _2233 * _2235;
        float _2247 = 1.0 / _2243;
        float _2249 = 1.0 / _2245;
        float _2251 = _2239 * _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2255 = fma(_2207, _2251, _2253);
        float _2257 = _2255 * _2247;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        _2107 = _2215;
        _2115 = _2259;
    }
    float _2261 = _2107;
    float _2263 = _2115;
    float _2265 = _2261;
    if (!_2089)
    {
        float _2267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2269 = _2267 * 0.15915493667125701904296875;
        float _2271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = cos(_2273);
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2269 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        float _2283 = 1.0 / _2275;
        float _2285 = _2277 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = _2281 * _2283;
        float _2291 = _2277 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = 1.0 / _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2301 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2299;
        float _2303 = 1.0 / _2301;
        float _2305 = _2293 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2309 = fma(_2207, _2305, _2307);
        float _2311 = _2309 * _2303;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = -_2313;
        float _2317 = _2315 + 1.0;
        _2265 = _2295;
        _2209 = _2317;
    }
    float _2319 = _2265;
    float _2321 = _2209;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2325 = _2195 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2329 = _2197 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2333 = _2199 + _2331;
    float _2335 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2337 = _2325 * _2325;
    float _2339 = fma(_2329, _2329, _2337);
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = rsqrt(_2341);
    float _2345 = sqrt(_2341);
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2329 * _2347;
    float _2351 = _2333 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2333;
    float _2369 = _2337;
    float _2371 = _2365;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2361)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2377;
    }
    float _2379 = _2367;
    if (_2361)
    {
        float _2381 = rsqrt(_2357);
        _2369 = _2381;
    }
    float _2383 = _2369;
    float _2385 = _2383;
    if (_2361)
    {
        float _2387 = _2365 * _2379;
        _2371 = _2387;
    }
    float _2389 = _2371;
    if (_2361)
    {
        float _2391 = _2389 * 0.15915493667125701904296875;
        _2211 = _2391;
    }
    float _2393 = _2211;
    float _2395 = _2343;
    if (_2361)
    {
        float _2397 = _2393 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        _2395 = _2399;
    }
    float _2401 = _2395;
    float _2403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2405 = precise::max(0.0, _2403);
    float _2407 = _2319;
    float _2409 = _2405;
    float _2411 = _2403;
    if (_2361)
    {
        float _2413 = _2393 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        _2407 = _2415;
    }
    float _2417 = _2407;
    float _2419 = -_2347;
    float _2421 = -_2405;
    float _2423 = fma(_2325, _2419, _2421);
    float _2425 = _2423;
    if (_2361)
    {
        float _2427 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2409 = _2427;
    }
    float _2429 = _2409;
    float _2431 = _2401;
    float _2433 = _2429;
    if (_2361)
    {
        float _2435 = fma(_2401, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (_2361)
    {
        float _2441 = _2417 + (-1.0);
        _2411 = _2441;
    }
    float _2443 = _2411;
    float _2445 = _2443;
    if (_2361)
    {
        float _2447 = _2383 * _2437;
        _2373 = _2447;
    }
    float _2449 = _2373;
    if (!_2361)
    {
        _2385 = _2423;
    }
    float _2451 = _2385;
    float _2453 = _2451;
    if (_2361)
    {
        float _2455 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2455;
    }
    float _2457 = _2433;
    if (_2361)
    {
        float _2459 = _2349 * _2449;
        _2375 = _2459;
    }
    float _2461 = _2375;
    if (!_2361)
    {
        _2439 = _2351;
    }
    float _2463 = _2439;
    float _2465 = _2463;
    if (_2361)
    {
        float _2467 = _2351 * _2449;
        _2465 = _2467;
    }
    float _2469 = _2465;
    if (!_2361)
    {
        _2445 = _2353;
    }
    float _2471 = _2445;
    float _2473 = _2471;
    if (_2361)
    {
        float _2475 = fma(_2423, _2417, _2457);
        _2453 = _2475;
    }
    float _2477 = _2453;
    if (_2361)
    {
        float _2479 = _2461 * _2461;
        _2473 = _2479;
    }
    float _2481 = _2473;
    if (!_2361)
    {
        _2425 = _2355;
    }
    float _2483 = _2425;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2469 * _2469;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2497 = _2491 + _2489;
    float _2499 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2501 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2505 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2503);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = rsqrt(_2497);
    float _2511 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2499);
    float _2513 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = -_2507;
    float _2517 = _2515 + 1.0;
    float _2519 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2523 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2495);
    float _2525 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2527 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2531 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2523);
    float _2533 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2535 = abs(_2517);
    float _2537 = log2(_2535);
    float _2539 = -_2529;
    float _2541 = fma(_2539, _2335, 1.0);
    float _2543 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2545 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2509 * _2461;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2509 * _2477;
    float _2553 = _2509 * _2469;
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2561 = log2(_2541);
    float _2563 = -_2555;
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2569 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = -_2553;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2575 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2567);
    float _2577 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2579 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = fma(_2573, -0.5, 0.5);
    float _2583 = 1.0 / _2575;
    float _2585 = fma(_2573, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2591 = _2551 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = exp2(_2577);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = _2561 * 0.693147182464599609375;
    float _2609 = fma(_2585, _2601, 1.570728778839111328125);
    float _2611 = sqrt(_2581);
    float _2613 = _2603 * _2583;
    float _2615 = _2605 * _2583;
    float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2613, 0.5, 0.5);
    float _2621 = fma(_2615, -0.5, 0.5);
    float _2623 = -_2551;
    float _2625 = fma(_2599, _2591, _2623);
    float3 _6762 = float3(_2619, _2621, _2617);
    float _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6762, float3(0.0), isnan(_6762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6762, float3(0.0), isnan(_6762)), level(0.0)).x;
    float _2629 = fma(_2625, 0.5, 0.5);
    float _2631 = _2611 * 0.636619746685028076171875;
    float _2633 = -_2609;
    float _2635 = fma(_2631, _2633, 1.0);
    float3 _6783 = float3(_2619, _2621, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _6800 = float2(_2635, _2629);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2660 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2662 = _2263 > 0.0;
    bool _2664 = isnan(_2263);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2660);
    float _2674 = exp2(_2658);
    bool _2676 = _2321 <= 0.0;
    bool _2678 = !_2670;
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2684 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2682);
    float _2686 = _2263 * _2321;
    float _2688 = _2684 + _2575;
    float _2690 = _2686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2692 = _2688 * 0.5;
    float _2694 = -_2674;
    float _2696 = _2694 + 1.0;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2684;
    out.gl_Position.w = _2575;
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2692;
    out.m_68.w = _2575;
    out.m_45.x = _2698;
    float _2702 = _2700 * _2627;
    float _2704 = -_2700;
    float _2706 = _2704 + 1.0;
    float _2708 = _2646 * _2702;
    float _2710 = _2656 * _2702;
    float _2712 = fma(_2652, _2708, _2640);
    float _2714 = fma(_2654, _2708, _2642);
    float _2716 = _2646 * _2706;
    float _2718 = fma(_2646, _2710, _2644);
    out.m_70.x = _2712;
    out.m_70.y = _2714;
    out.m_70.z = _2718;
    out.m_70.w = _2716;
    if (!_2680)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2720;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _485 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2777 = as_type<float>(_105);
        out.gl_Position.z = _2777;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2847 = as_type<float>(_143);
        out.gl_Position.z = _2847;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
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
    float _209 = _149;
    bool _211 = false;
    if (!_205)
    {
        float _213 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = log2(_213);
        float _217 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _219 = _217 + 1.0;
        float _221 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _223 = _147 * _215;
        float _225 = exp2(_223);
        float _227 = _221 * 0.693147182464599609375;
        float _229 = 1.0 / _227;
        float _231 = 1.0 / _219;
        float _233 = _225 + (-1.0);
        float _235 = -_233;
        float _237 = fma(_235, _229, _147);
        float _239 = _237 * _231;
        float _241 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _241;
    }
    float _243 = _207;
    float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _247 = !_159;
    float _249 = _245;
    float _251 = _243;
    if (!_247)
    {
        float _253 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _255 = log2(_253);
        float _257 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _259 = _257 + 1.0;
        float _261 = 1.0 / _259;
        float _263 = _147 * _255;
        float _265 = exp2(_263);
        float _267 = -_265;
        float _269 = _267 + 1.0;
        float _271 = _269 * _261;
        _175 = _271;
    }
    float _273 = _175;
    float _275 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _279 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _281 = _245 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _283 = _123 * _123;
        float _285 = _283 * 0.5;
        _249 = _285;
    }
    float _287 = _249;
    float _289 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].x, _277);
    float _291 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].y, _279);
    float _293 = fma(_275, (*spvDescriptorSet0.vp_c10)._m0[8].z, _281);
    float _295 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _297 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _251 = _297;
    }
    float _299 = _251;
    bool _301 = !_159;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _311 = _309 + 1.0;
        float _313 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _315 = _123 * _307;
        float _317 = exp2(_315);
        float _319 = _313 * 0.693147182464599609375;
        float _321 = 1.0 / _319;
        float _323 = 1.0 / _311;
        float _325 = _317 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _321, _123);
        float _331 = _329 * _323;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    float _337 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].x, _289);
    float _341 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].y, _291);
    float _343 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _347 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _349 = _337 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _351 = fma(_295, (*spvDescriptorSet0.vp_c10)._m0[10].z, _293);
    float _353 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].x, _345);
    float _355 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].y, _347);
    float _357 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[8].z, _349);
    float _359 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_273, _161, _339);
    float _363 = fma(_273, _163, _341);
    float _365 = fma(_273, _165, _351);
    float _367 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].x, _353);
    float _369 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].y, _355);
    float _371 = fma(_359, (*spvDescriptorSet0.vp_c10)._m0[10].z, _357);
    float _373 = _359;
    float _375 = _353;
    if (!_159)
    {
        _373 = _123;
    }
    float _377 = _373;
    bool _379 = !_159;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = 1.0 / _389;
        float _393 = _123 * _385;
        float _395 = exp2(_393);
        float _397 = -_395;
        float _399 = _397 + 1.0;
        float _401 = _399 * _391;
        _381 = _401;
        _375 = _393;
    }
    float _403 = _381;
    float _405 = _375;
    float _407 = fma(_403, _163, _369);
    bool _409 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _411 = fma(_403, _161, _367);
    float _413 = fma(_403, _165, _371);
    float _415 = -_407;
    float _417 = _363 + _415;
    float _419 = fma(_361, _149, _167);
    float _421 = -_411;
    float _423 = _361 + _421;
    float _425 = -_413;
    float _427 = _365 + _425;
    float _429 = _417 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _431 = _417 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _433 = _417 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _435 = fma(_363, _149, _169);
    float _437 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[4].x, _429);
    float _439 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[5].x, _431);
    float _441 = fma(_423, (*spvDescriptorSet0.vp_c10)._m0[6].x, _433);
    float _443 = fma(_365, _149, _171);
    float _445 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[4].z, _437);
    float _447 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[5].z, _439);
    float _449 = fma(_427, (*spvDescriptorSet0.vp_c10)._m0[6].z, _441);
    bool _451 = !_409;
    float _453 = _405;
    float _455 = _437;
    bool _457 = _409;
    float _459 = _447;
    float _461 = _445;
    float _463 = _449;
    float _481;
    float _483;
    if (!_451)
    {
        float _465 = in.m_54.x;
        float _467 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _469 = _465 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _471 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _473 = _471 * _467;
        float _475 = floor(_473);
        float _477 = -_475;
        float _479 = _473 + _477;
        _481 = _473;
        _209 = _475;
        _483 = _479;
        _485 = true;
    }
    else
    {
        float _487 = float(_89);
        float _489 = 1.0 / _487;
        float _491 = _123 * _489;
        _481 = _487;
        _483 = _491;
    }
    _485 = false;
    float _493 = _481;
    float _495 = _209;
    float _497 = _483;
    float _499 = in.m_54.z;
    float _501 = in.m_54.w;
    float _503 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _505 = log2(_503);
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _509 = _507 != 0;
    float _511 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _515 = _513 != 0;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[5].x, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _527 = 1.0 / _519;
    float _529 = _493;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _533 = _511;
    if (_509)
    {
        float _535 = in.m_54.w;
        _529 = _535;
    }
    float _537 = _529;
    float _539 = _123 * _505;
    float _541 = 0.0;
    int _543 = as_type<int>(_505);
    if (!_515)
    {
        _541 = _203;
    }
    float _545 = _541;
    float _547 = _495;
    float _549 = _545;
    if (_515)
    {
        float _551 = in.m_54.x;
        _547 = _551;
    }
    float _553 = _547;
    float _555 = 1.0 / _525;
    bool _557 = _501 > 0.5;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    if (!_509)
    {
        _531 = _199;
    }
    float _563 = _531;
    float _565 = 1.0 / _561;
    float _567 = _537;
    float _569 = _563;
    if (_509)
    {
        float _571 = _537 * 3.1415927410125732421875;
        _567 = _571;
    }
    float _573 = _567;
    float _575 = _573;
    if (_509)
    {
        float _577 = _573 * 0.15915493667125701904296875;
        _453 = _577;
    }
    float _579 = _453;
    if (_515)
    {
        float _581 = _553 * 3.1415927410125732421875;
        _575 = _581;
    }
    float _583 = _575;
    if (_515)
    {
        float _585 = _583 * 0.15915493667125701904296875;
        _455 = _585;
    }
    float _587 = _455;
    float _589 = _579;
    if (_509)
    {
        float _591 = _579 * 6.283185482025146484375;
        float _593 = sin(_591);
        _589 = _593;
    }
    float _595 = _589;
    int _597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _599 = _597 != 0;
    float _601 = _587;
    if (_515)
    {
        float _603 = _587 * 6.283185482025146484375;
        float _605 = sin(_603);
        _601 = _605;
    }
    float _607 = _601;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _611 = _553;
    if (_599)
    {
        float _613 = in.m_54.x;
        float _615 = in.m_54.y;
        _609 = _613;
        _611 = _615;
    }
    float _617 = _609;
    float _619 = _611;
    float _621 = _595;
    if (_509)
    {
        bool _623 = _595 > 0.5;
        _211 = _623;
    }
    bool _625 = _211;
    int _627 = 0;
    if (_599)
    {
        _627 = 0;
    }
    int _629 = _627;
    int _631 = _629;
    if (_509)
    {
        float _633 = -_199;
        float _635 = _625 ? _633 : _199;
        _569 = _635;
    }
    float _637 = _569;
    int _639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _641 = _639 != 0;
    if (_515)
    {
        bool _643 = _607 > 0.5;
        _457 = _643;
    }
    bool _645 = _457;
    float _647 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _653 = _651 != 0;
    float _655 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_419, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    if (_599)
    {
        _543 = 0;
    }
    int _659 = _543;
    float _661 = _619;
    float _663 = _617;
    int _665 = _659;
    if (_599)
    {
        _533 = _617;
    }
    float _667 = _533;
    float _669 = _667;
    if (_599)
    {
        _621 = _619;
    }
    float _671 = _621;
    float _673 = _671;
    if (!_599)
    {
        float _675 = in.m_54.x;
        float _677 = in.m_54.y;
        float _679 = _675 * 3.1415927410125732421875;
        float _681 = _679 * 0.15915493667125701904296875;
        float _683 = _677 * 3.1415927410125732421875;
        float _685 = _683 * 0.15915493667125701904296875;
        float _687 = _681 * 6.283185482025146484375;
        float _689 = sin(_687);
        float _691 = _685 * 6.283185482025146484375;
        float _693 = sin(_691);
        _661 = _677;
        _663 = _675;
        _665 = 2;
        _669 = _689;
        _673 = _693;
        _631 = 1;
    }
    float _695 = _661;
    float _697 = _663;
    int _699 = _665;
    float _701 = _669;
    float _703 = _673;
    int _705 = _631;
    bool _707 = _695 > 0.5;
    float _709 = exp2(_539);
    if (_515)
    {
        float _711 = -_203;
        float _713 = _645 ? _711 : _203;
        _549 = _713;
    }
    float _715 = _549;
    float _717 = _499 * 2.0;
    bool _719 = _697 > 0.5;
    float _721 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _521);
    float _723 = -_203;
    int _725 = _707 ? as_type<int>(_723) : as_type<int>(_203);
    float _727 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    int _729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _731 = _729 != 0;
    float _733 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _735 = -_203;
    int _737 = _557 ? as_type<int>(_735) : as_type<int>(_203);
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _741 = _497 + _739;
    float _743 = -_199;
    int _745 = _719 ? as_type<int>(_743) : as_type<int>(_199);
    float _747 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    bool _749 = !_653;
    float _751 = _749 ? _203 : as_type<float>(_725);
    float _753 = _499 + (-0.5);
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _765 = _763 != 0;
    float _767 = in.m_52.x;
    float _769 = in.m_52.y;
    float _771 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _773 = floor(_717);
    bool _775 = !_757;
    float _777 = _775 ? _203 : as_type<float>(_737);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _779;
    bool _783 = _499 > 0.5;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _785;
    float _789 = -_709;
    float _791 = _789 + 1.0;
    float _793 = _781 * _527;
    float _795 = -_199;
    int _797 = _783 ? as_type<int>(_795) : as_type<int>(_199);
    float _799 = _787 * _555;
    float _801 = -_203;
    int _803 = _783 ? as_type<int>(_801) : as_type<int>(_203);
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _807 = _805 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _809 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _811 = isnan(0.0);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _817 = _813 || _815;
    float _819 = fma(_793, _741, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _821 = !_765;
    float _823 = _821 ? _203 : as_type<float>(_803);
    float _825 = _807 * _565;
    float _827 = _817 ? _791 : 0.0;
    float _829 = _727 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _831 = _771 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _833 = _773 > 0.0;
    float _835 = _769 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    bool _837 = _773 >= 0.0;
    bool _839 = isnan(_773);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.0);
    bool _845 = _841 || _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    bool _851 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _853 = isnan(_497);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _767 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _865 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _867 = isnan(_497);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _873 = _869 || _871;
    float _875 = float(_873);
    float _877 = 1.0 / _849;
    bool _879 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _881 = isnan(_497);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_861;
    float _893 = _891 + 1.0;
    bool _895 = _497 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _897 = isnan(_497);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _835 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _909 = _875 * _893;
    float _911 = -_875;
    float _913 = _911 + 1.0;
    float _915 = _863 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _917 = -_889;
    float _919 = _917 + 1.0;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    float _925 = _889 * _913;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _497 + _927;
    float _931 = _905 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _935 = _497 + _933;
    float _937 = _915 * _747;
    float _939 = _819 * _931;
    float _941 = fma(_799, _935, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _943 = _827 * _877;
    int _945 = _845 ? 0 : 1;
    float _947 = fma(_825, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _949 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[115].x, _939);
    bool _951 = _699 != 2;
    float _953 = _907 * _733;
    int _955 = ~_945;
    int _957 = _955 + 1;
    int _959 = _957 + 1;
    float _961 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _963 = _959;
    if (!_833)
    {
        int _965 = ~_945;
        int _967 = _965 + 1;
        _963 = _967;
    }
    int _969 = _963;
    float _971 = fma(_947, _925, _949);
    float _973 = _697 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _975 = _701 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _981 = fma(_941, _909, _971);
    float _983 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _985 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[93].z, _977);
    bool _987 = !_731;
    float _989 = _987 ? _199 : as_type<float>(_797);
    float _991 = -_961;
    float _993 = fma(_973, 2.0, _991);
    float _995 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[93].w, _979);
    float _997 = _703 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _999 = _695 * 2.0;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1005 = _695 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1007 = -_983;
    float _1009 = fma(_975, 2.0, _1007);
    float _1011 = -_199;
    int _1013 = _707 ? as_type<int>(_1011) : as_type<int>(_199);
    float _1015 = _697 * 2.0;
    float _1017 = fma(_1005, -2.0, _1001);
    float _1019 = fma(_997, -2.0, _1003);
    bool _1021 = !_641;
    float _1023 = _1021 ? _199 : as_type<float>(_745);
    float _1025 = floor(_1015);
    bool _1027 = !_761;
    float _1029 = _1027 ? _199 : as_type<float>(_1013);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _1033 = _705 != 1;
    float _1035 = _695 + _499;
    float _1037 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1031);
    float _1039 = _695 + _697;
    float _1041 = floor(_999);
    float _1043 = _499 + _697;
    float _1045 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1037);
    float _1047 = _1039 + (-1.0);
    float _1049 = _1043 + (-1.0);
    float _1051 = _1045 * (-0.15915493667125701904296875);
    float _1053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _1055 = _1035 + (-1.0);
    float _1057 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1059 = fma(_1047, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1061 = _1025 >= 0.0;
    bool _1063 = isnan(_1025);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan(0.0);
    bool _1069 = _1065 || _1067;
    float _1071 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1073 = -_123;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1009);
    float _1077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _1079 = _1041 >= 0.0;
    bool _1081 = isnan(_1041);
    bool _1083 = _1079 || _1081;
    bool _1085 = isnan(0.0);
    bool _1087 = _1083 || _1085;
    float _1089 = _715 + (-0.5);
    bool _1091 = _1025 > 0.0;
    float _1093 = fma(_861, (*spvDescriptorSet0.vp_c9)._m0[118].x, _981);
    int _1095 = _1069 ? 0 : 1;
    float _1097 = -_123;
    float _1099 = fma(_1097, (*spvDescriptorSet0.vp_c9)._m0[76].x, _993);
    int _1101 = _1087 ? 0 : 1;
    float _1103 = _1051 * 6.283185482025146484375;
    float _1105 = sin(_1103);
    int _1107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1109 = _1107 != 0;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1117 = _1115 != 0;
    float _1119 = _1053 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _1121 = _637 + 0.5;
    float _1123 = fma(_1119, _1121, _1075);
    float _1125 = _1051 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1131 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1019);
    bool _1133 = !_1109;
    int _1135 = _1133 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1139 = _1041 > 0.0;
    float _1141 = -_1129;
    float _1143 = -_1131;
    float _1145 = fma(_1141, _1089, _1143);
    float _1147 = in.m_56.x;
    float _1149 = in.m_56.y;
    float _1151 = in.m_56.z;
    float _1153 = _1089;
    float _1155 = _1051;
    float _1157 = _1131;
    if (!_1033)
    {
        _1153 = _697;
    }
    float _1159 = _1153;
    float _1161 = _751 * _1105;
    int _1163 = abs(_1135);
    float _1165 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1167 = _1159;
    if (!_1033)
    {
        _1155 = _1159;
    }
    float _1169 = _1155;
    float _1171 = _1169;
    if (_1033)
    {
        _1171 = _499;
    }
    float _1173 = _1171;
    float _1175 = _751 * _1127;
    float _1177 = -_1161;
    float _1179 = fma(_1023, _1127, _1177);
    float _1181 = float(_969);
    float _1183 = float(_1163);
    float _1185 = fma(_1023, _1105, _1175);
    float _1187 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1137);
    float _1189 = _1183 * _1181;
    float _1191 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1187);
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1195 = _1189 * (-2.0);
    int _1197 = ~_1095;
    int _1199 = _1197 + 1;
    int _1201 = _1199 + 1;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1205 = _1201;
    if (!_1091)
    {
        int _1207 = ~_1095;
        int _1209 = _1207 + 1;
        _1205 = _1209;
    }
    int _1211 = _1205;
    float _1213 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1193);
    float _1215 = _697 + (-0.5);
    float _1217 = fma(_1195, _1147, _1147);
    bool _1219 = !_1113;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1203);
    int _1225 = ~_1101;
    int _1227 = _1225 + 1;
    int _1229 = _1227 + 1;
    float _1231 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1217);
    int _1233 = _1229;
    if (!_1139)
    {
        int _1235 = ~_1101;
        int _1237 = _1235 + 1;
        _1233 = _1237;
    }
    int _1239 = _1233;
    float _1241 = fma(_1059, _1195, _1059);
    if (_1033)
    {
        _1167 = _697;
    }
    float _1243 = _1167;
    float _1245 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1247 = !_1117;
    int _1249 = _1247 ? 0 : 1;
    int _1251 = abs(_1221);
    float _1253 = float(_1239);
    int _1255 = abs(_1249);
    float _1257 = float(_1211);
    float _1259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1261 = float(_1251);
    bool _1263 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1265 = isnan(1.0);
    bool _1267 = _1263 || _1265;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1271 = _1267 || _1269;
    float _1273 = float(_1255);
    float _1275 = _1261 * _1257;
    bool _1277 = !_1271;
    float _1279 = _1277 ? _123 : _943;
    float _1281 = _1273 * _1253;
    float _1283 = _1275 * (-2.0);
    float _1285 = fma(_1279, _1241, _1231);
    float _1287 = _695 + (-0.5);
    float _1289 = _1281 * (-2.0);
    float _1291 = fma(_1283, _1149, _1149);
    float _1293 = _1285 * 0.15915493667125701904296875;
    float _1295 = fma(_1071, _1283, _1071);
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1291);
    float _1299 = fma(_1289, _1151, _1151);
    float _1301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1303 = fma(_1057, _1289, _1057);
    float _1305 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1307 = fma(_1279, _1295, _1297);
    float _1309 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1299);
    float _1311 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    float _1313 = _1295;
    float _1315 = _1299;
    float _1317 = _1243;
    float _1319 = _1293;
    float _1321 = _1289;
    if (!_1033)
    {
        _1311 = _695;
    }
    float _1323 = _1311;
    float _1325 = _1293 * 6.283185482025146484375;
    float _1327 = sin(_1325);
    float _1329 = _1307 * 0.15915493667125701904296875;
    float _1331 = fma(_1279, _1303, _1309);
    float _1333 = _1323;
    if (!_1033)
    {
        _1313 = _1323;
    }
    float _1335 = _1313;
    float _1337 = _1245 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1339 = _1335;
    if (_1033)
    {
        _1333 = _1243;
    }
    float _1341 = _1333;
    float _1343 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1345 = _1293 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    float _1349 = _1331 * 0.15915493667125701904296875;
    if (_951)
    {
        _1315 = _695;
    }
    float _1351 = _1315;
    float _1353 = fma(_1341, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1343);
    float _1355 = _1351;
    if (_1033)
    {
        _1339 = _1243;
    }
    float _1357 = _1339;
    float _1359 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1301);
    if (!_951)
    {
        _1355 = _1243;
    }
    float _1361 = _1355;
    float _1363 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1305);
    float _1365 = _1329 * 6.283185482025146484375;
    float _1367 = sin(_1365);
    if (!_1033)
    {
        _1157 = _499;
    }
    float _1369 = _1157;
    float _1371 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1373 = _1369;
    if (!_951)
    {
        _1317 = _499;
    }
    float _1375 = _1317;
    float _1377 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_951)
    {
        _1319 = _499;
    }
    float _1379 = _1319;
    float _1381 = _1179 + 0.5;
    float _1383 = _1379;
    if (!_1033)
    {
        _1321 = _1369;
    }
    float _1385 = _1321;
    float _1387 = _1329 * 6.283185482025146484375;
    float _1389 = cos(_1387);
    float _1391 = _1385;
    if (_1033)
    {
        _1373 = _695;
    }
    float _1393 = _1373;
    float _1395 = fma(_1337, _1381, _1099);
    if (_1033)
    {
        _1391 = _695;
    }
    float _1397 = _1391;
    float _1399 = _1185 + (-0.5);
    if (!_951)
    {
        _1383 = _695;
    }
    float _1401 = _1383;
    float _1403 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1017);
    float _1405 = _1349 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1347 * _1367;
    float _1411 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1415 = -_1377;
    float _1417 = -_1403;
    float _1419 = fma(_1415, _1399, _1417);
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1423 = _1349 * 6.283185482025146484375;
    float _1425 = cos(_1423);
    float _1427 = _1327 * _1389;
    float _1429 = fma(_1411, -2.0, _1413);
    float _1431 = -_1421;
    float _1433 = fma(_1371, 2.0, _1431);
    float _1435 = _1327 * _1367;
    float _1437 = _1191 * (-0.15915493667125701904296875);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[89].z + (*spvDescriptorSet0.vp_c9)._m0[89].y;
    float _1441 = -_123;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1433);
    float _1445 = -_1409;
    float _1447 = fma(_1407, _1427, _1445);
    float _1449 = -_1427;
    float _1451 = fma(_1407, _1409, _1449);
    float _1453 = fma(_1401, (*spvDescriptorSet0.vp_c9)._m0[89].z, _1439);
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1457 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1165);
    float _1459 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[89].x, _1453);
    float _1461 = _1389 * _1425;
    float _1463 = _1425 * _953;
    float _1465 = _1347 * _1389;
    float _1467 = _1367 * _1425;
    float _1469 = -_953;
    float _1471 = _1407 * _1469;
    float _1473 = _1347 * _1463;
    float _1475 = fma(_1407, _1465, _1435);
    float _1477 = fma(_1407, _1435, _1465);
    float _1479 = _1327 * _1463;
    float _1481 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1483 = fma(_1475, _937, _1473);
    float _1485 = fma(_1461, _937, _1471);
    float _1487 = fma(_1447, _937, _1479);
    float _1489 = _1459 * (-0.15915493667125701904296875);
    float _1491 = fma(_1451, _1481, _1483);
    float _1493 = fma(_1467, _1481, _1485);
    float _1495 = fma(_1477, _1481, _1487);
    float _1497 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1501 = _1489 * 6.283185482025146484375;
    float _1503 = sin(_1501);
    float _1505 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1497);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1499);
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1511 = _1491 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1513 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1505);
    float _1515 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1507);
    float _1517 = _1489 * 6.283185482025146484375;
    float _1519 = cos(_1517);
    float _1521 = _1513 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1523 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1525 = _1515 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1529 = _829 + _1521;
    float _1531 = -_1509;
    float _1533 = fma(_1523, 2.0, _1531);
    float _1535 = _831 + _1525;
    float _1537 = _1437 * 6.283185482025146484375;
    float _1539 = sin(_1537);
    float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1543 = _1529 + _1541;
    float _1545 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1547 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1549 = _1535 + _1547;
    float _1551 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1511);
    float _1553 = _1543 * _1543;
    float _1555 = fma(_1545, -2.0, _1527);
    float _1557 = -_123;
    float _1559 = fma(_1557, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    float _1561 = _1437 * 6.283185482025146484375;
    float _1563 = cos(_1561);
    float _1565 = fma(_1549, _1549, _1553);
    float _1567 = _823 * _1503;
    float _1569 = fma(_1495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1551);
    float _1571 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1555);
    float _1573 = sqrt(_1565);
    float _1575 = _777 * _1539;
    float _1577 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1579 = _777 * _1563;
    float _1581 = -_1575;
    float _1583 = fma(_989, _1563, _1581);
    float _1585 = _823 * _1519;
    float _1587 = _1455 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1589 = fma(_989, _1539, _1579);
    float _1591 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1429);
    float _1593 = _1583 + 0.5;
    float _1595 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1597 = _1573 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = _1589 + (-0.5);
    float _1601 = -_1567;
    float _1603 = fma(_1029, _1519, _1601);
    float _1605 = fma(_1029, _1503, _1585);
    float _1607 = fma(_1587, _1593, _1443);
    float _1609 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _985);
    float _1611 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1613 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1615 = -_1613;
    float _1617 = -_1591;
    float _1619 = fma(_1615, _1599, _1617);
    float _1621 = _721 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1623 = _1603 + 0.5;
    float _1625 = _1595 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1627 = _1569 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1629 = _1605 + (-0.5);
    float _1631 = fma(_1625, _1623, _1559);
    float _1633 = _1621 + _1627;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1611 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1641 = -_1639;
    float _1643 = -_1571;
    float _1645 = fma(_1641, _1629, _1643);
    bool _1647 = !_1597;
    float _1649 = _1633;
    float _1651 = _1535;
    float _1653 = _1529;
    if (!_1647)
    {
        float _1655 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1657 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1659 = _1573 + _1657;
        float _1661 = rsqrt(_1565);
        float _1663 = _1659 * _1655;
        float _1665 = _1633 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1667 = _1663 * 0.15915493667125701904296875;
        float _1669 = _1667 * 6.283185482025146484375;
        float _1671 = cos(_1669);
        float _1673 = _1667 * 6.283185482025146484375;
        float _1675 = sin(_1673);
        float _1677 = _1671 + (-1.0);
        float _1679 = _1677 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1681 = fma(_1675, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1683 = fma(_1633, _1671, _1679);
        float _1685 = _1661 * _1681;
        float _1687 = fma(_1549, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1689 = fma(_1543, _1685, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1649 = _1683;
        _1651 = _1687;
        _1653 = _1689;
    }
    float _1691 = _1649;
    float _1693 = _1651;
    float _1695 = _1653;
    float _1697 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _995);
    float _1699 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1213);
    float _1701 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1359);
    float _1703 = -_1637;
    float _1705 = fma(_1703, _637, _1123);
    float _1707 = -_1697;
    float _1709 = _1707 + 1.0;
    float _1711 = -_1699;
    float _1713 = _1711 + 1.0;
    float _1715 = -_1701;
    float _1717 = _1715 + 1.0;
    float _1719 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1223);
    float _1721 = fma(_1709, _715, _1145);
    float _1723 = -_1621;
    float _1725 = _1723 + _1691;
    float _1727 = -_1713;
    float _1729 = fma(_1179, _1727, _1395);
    float _1731 = -_831;
    float _1733 = _1731 + _1693;
    float _1735 = -_1719;
    float _1737 = _1735 + 1.0;
    float _1739 = _1725 * _1725;
    float _1741 = -_829;
    float _1743 = _1741 + _1695;
    float _1745 = -_1737;
    float _1747 = fma(_1603, _1745, _1631);
    float _1749 = fma(_1733, _1733, _1739);
    float _1751 = fma(_1185, _1717, _1419);
    float _1753 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1755 = fma(_1743, _1743, _1749);
    float _1757 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1353);
    float _1759 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1457);
    float _1761 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1363);
    float _1763 = sqrt(_1755);
    float _1765 = _1753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1767 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1769 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1773 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1777 = -_1757;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1759;
    float _1783 = _1781 + 1.0;
    float _1785 = -_1761;
    float _1787 = _1785 + 1.0;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1791 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1793 = _1769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1771 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1797 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1799 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1801 = _1093 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1803 = -_1779;
    float _1805 = fma(_1583, _1803, _1607);
    float _1807 = fma(_1589, _1783, _1619);
    float _1809 = fma(_1605, _1787, _1645);
    out.m_58.x = _1791;
    out.m_58.y = _1793;
    out.m_58.z = _1795;
    out.m_58.w = _1789;
    bool _1811 = _1763 > 0.0;
    out.m_60.x = _1797;
    out.m_60.y = _1799;
    out.m_60.z = _1765;
    out.m_60.w = _1801;
    out.m_62.x = _1705;
    out.m_62.y = _1721;
    out.m_64.x = _1729;
    out.m_64.y = _1751;
    out.m_64.z = _1805;
    out.m_64.w = _1807;
    out.m_66.x = _1747;
    out.m_66.y = _1809;
    bool _1813 = !_1811;
    float _1815 = _1805;
    float _1817 = _1751;
    float _1819 = _1729;
    float _1821 = _1795;
    float _1823 = _1691;
    float _1825 = _1693;
    float _1827 = _1695;
    float _1829 = _1729;
    float _1831 = _1795;
    if (!_1813)
    {
        bool _1833 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1835 = _1807;
        if (_1833)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1835 = _1837;
        }
        float _1839 = _1835;
        if (_1833)
        {
            float _1841 = _445 * _1839;
            _1815 = _1841;
        }
        float _1843 = _1815;
        float _1845 = _1843;
        if (_1833)
        {
            float _1847 = _447 * _1839;
            _1817 = _1847;
        }
        float _1849 = _1817;
        float _1851 = _1849;
        if (_1833)
        {
            float _1853 = _449 * _1839;
            _1819 = _1853;
        }
        float _1855 = _1819;
        float _1857 = _1855;
        if (!_1833)
        {
            float _1859 = _123 + 1.0;
            if (!_159)
            {
                float _1861 = _1859 * _1859;
                float _1863 = _1861 * 0.5;
                _125 = _1863;
            }
            float _1865 = _125;
            float _1867 = _1865;
            if (!_159)
            {
                float _1869 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1867 = _1869;
            }
            float _1871 = _1867;
            bool _1873 = !_159;
            float _1875 = _1871;
            if (!_1873)
            {
                float _1877 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1879 = log2(_1877);
                float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1883 = 1.0 + _1881;
                float _1885 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1887 = _1879 * _1859;
                float _1889 = 1.0 / _1883;
                float _1891 = _1885 * 0.693147182464599609375;
                float _1893 = exp2(_1887);
                float _1895 = 1.0 / _1891;
                float _1897 = _1893 + (-1.0);
                float _1899 = -_1897;
                float _1901 = fma(_1899, _1895, _1859);
                float _1903 = _1901 * _1889;
                float _1905 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1875 = _1905;
            }
            float _1907 = _1875;
            float _1909 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1911 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1913 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1915 = _1907;
            if (!_159)
            {
                _1915 = _1859;
            }
            float _1917 = _1915;
            float _1919 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _1921 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _1923 = _1909 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _1925 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1919);
            float _1927 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1921);
            float _1929 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1925);
            bool _1931 = !_159;
            float _1933 = _1917;
            _1821 = _1929;
            if (!_1931)
            {
                float _1935 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1937 = log2(_1935);
                float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1941 = 1.0 + _1939;
                float _1943 = 1.0 / _1941;
                float _1945 = _1937 * _1859;
                float _1947 = exp2(_1945);
                float _1949 = -_1947;
                float _1951 = _1949 + 1.0;
                float _1953 = _1951 * _1943;
                _1933 = _1953;
            }
            float _1955 = _1933;
            float _1957 = fma(_1911, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1923);
            float _1959 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1927);
            float _1961 = fma(_1955, _163, _1929);
            float _1963 = fma(_1913, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1957);
            float _1965 = fma(_1955, _161, _1959);
            float _1967 = -_407;
            float _1969 = _1967 + _1961;
            float _1971 = fma(_1955, _165, _1963);
            float _1973 = -_411;
            float _1975 = _1973 + _1965;
            float _1977 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1979 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1981 = _1969 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1983 = -_413;
            float _1985 = _1983 + _1971;
            float _1987 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1977);
            float _1989 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1979);
            float _1991 = fma(_1975, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1981);
            float _1993 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1987);
            float _1995 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1989);
            float _1997 = fma(_1985, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1991);
            _459 = _1995;
            _461 = _1993;
            _463 = _1997;
            _1845 = _1993;
            _1851 = _1995;
            _1857 = _1997;
        }
        float _1999 = _459;
        float _2001 = _461;
        float _2003 = _463;
        float _2005 = _1845;
        float _2007 = _1851;
        float _2009 = _1857;
        float _2011 = _1821;
        float _2013 = _1999 * _1999;
        float _2015 = fma(_2001, _2001, _2013);
        float _2017 = fma(_2003, _2003, _2015);
        float _2019 = rsqrt(_1755);
        float _2021 = sqrt(_2017);
        float _2023 = _1733 * _2019;
        float _2025 = _1725 * _2019;
        float _2027 = _1743 * _2019;
        bool _2029 = _2021 > 0.0;
        bool _2031 = !_2029;
        _1829 = _2009;
        _1831 = _2011;
        if (!_2031)
        {
            float _2033 = rsqrt(_2017);
            float _2035 = _2033 * _1999;
            float _2037 = _2033 * _2001;
            float _2039 = _2033 * _2003;
            float _2041 = _2025 * _2035;
            float _2043 = fma(_2023, _2037, _2041);
            float _2045 = fma(_2027, _2039, _2043);
            float _2047 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2049 = fma(_2005, _2047, _1693);
            float _2051 = fma(_2007, _2047, _1691);
            float _2053 = fma(_2009, _2047, _1695);
            _1823 = _2051;
            _1825 = _2049;
            _1827 = _2053;
        }
    }
    float _2055 = _1823;
    float _2057 = _1825;
    float _2059 = _1827;
    float _2061 = _1829;
    float _2063 = _1831;
    float _2065 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2067 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    bool _2073 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2075 = _2071 || _2073;
    float _2077 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2065);
    float _2079 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2081 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2083 = isnan(0.5);
    bool _2085 = _2081 || _2083;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2089 = _2085 || _2087;
    float _2091 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2077);
    float _2093 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2095 = fma(_831, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2079);
    float _2097 = 1.0 / _2093;
    float _2099 = fma(_829, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2095);
    float _2101 = _2061;
    float _2103 = _2093;
    float _2105 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _2107 = _2063;
    if (_2089)
    {
        _2101 = 1.0;
    }
    float _2109 = _2101;
    float _2111 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2113 = _2111 + _2093;
    float _2115 = _2109;
    if (_2075)
    {
        _2103 = _2055;
    }
    float _2117 = _2103;
    float _2119 = _2113 * _2097;
    float _2121 = _2119 * 0.5;
    float _2123 = _2097;
    float _2125 = _2121;
    float _2127 = _2117;
    if (_2075)
    {
        _2123 = _2057;
    }
    float _2129 = _2123;
    float _2131 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2133 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2131);
    float _2135 = _2129;
    if (_2075)
    {
        _2125 = _2059;
    }
    float _2137 = _2125;
    float _2139 = 1.0 / _2133;
    float _2141 = _2137;
    if (!_2075)
    {
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2145 = _1621 + _2143;
        float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2149 = _831 + _2147;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = -_1621;
        float _2155 = _2153 + _2055;
        float _2157 = _2145 * _2145;
        float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2161 = _829 + _2159;
        float _2163 = fma(_2149, _2149, _2157);
        float _2165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2167 = fma(_2161, _2161, _2163);
        float _2169 = sqrt(_2167);
        float _2171 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2173 = precise::min(_2169, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2175 = _2173 * _2165;
        float _2177 = -_831;
        float _2179 = _2177 + _2057;
        float _2181 = _2171 * _2175;
        float _2183 = -_829;
        float _2185 = _2183 + _2059;
        float _2187 = fma(_2179, _2181, _831);
        float _2189 = fma(_2155, _2181, _1621);
        float _2191 = fma(_2185, _2181, _829);
        _2105 = _2181;
        _2127 = _2189;
        _2135 = _2187;
        _2141 = _2191;
    }
    float _2193 = _2105;
    float _2195 = _2127;
    float _2197 = _2135;
    float _2199 = _2141;
    float _2201 = _2193;
    if (_2089)
    {
        _2201 = 1.0;
    }
    float _2203 = _2201;
    float _2205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2207 = _2139 * _2205;
    float _2209 = _2203;
    float _2211 = _2207;
    if (!_2089)
    {
        float _2213 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2215 = _2213 * 0.15915493667125701904296875;
        float _2217 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2219 = _2215 * 6.283185482025146484375;
        float _2221 = cos(_2219);
        float _2223 = _2217 * 0.15915493667125701904296875;
        float _2225 = _2215 * 6.283185482025146484375;
        float _2227 = sin(_2225);
        float _2229 = 1.0 / _2221;
        float _2231 = _2223 * 6.283185482025146484375;
        float _2233 = cos(_2231);
        float _2235 = _2227 * _2229;
        float _2237 = _2223 * 6.283185482025146484375;
        float _2239 = sin(_2237);
        float _2241 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2243 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2241;
        float _2245 = _2233 * _2235;
        float _2247 = 1.0 / _2243;
        float _2249 = 1.0 / _2245;
        float _2251 = _2239 * _2249;
        float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2255 = fma(_2207, _2251, _2253);
        float _2257 = _2255 * _2247;
        float _2259 = precise::clamp(_2257, 0.0, 1.0);
        _2107 = _2215;
        _2115 = _2259;
    }
    float _2261 = _2107;
    float _2263 = _2115;
    float _2265 = _2261;
    if (!_2089)
    {
        float _2267 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2269 = _2267 * 0.15915493667125701904296875;
        float _2271 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2273 = _2269 * 6.283185482025146484375;
        float _2275 = cos(_2273);
        float _2277 = _2271 * 0.15915493667125701904296875;
        float _2279 = _2269 * 6.283185482025146484375;
        float _2281 = sin(_2279);
        float _2283 = 1.0 / _2275;
        float _2285 = _2277 * 6.283185482025146484375;
        float _2287 = cos(_2285);
        float _2289 = _2281 * _2283;
        float _2291 = _2277 * 6.283185482025146484375;
        float _2293 = sin(_2291);
        float _2295 = _2287 * _2289;
        float _2297 = 1.0 / _2295;
        float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2301 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2299;
        float _2303 = 1.0 / _2301;
        float _2305 = _2293 * _2297;
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2309 = fma(_2207, _2305, _2307);
        float _2311 = _2309 * _2303;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = -_2313;
        float _2317 = _2315 + 1.0;
        _2265 = _2295;
        _2209 = _2317;
    }
    float _2319 = _2265;
    float _2321 = _2209;
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2325 = _2195 + _2323;
    float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2329 = _2197 + _2327;
    float _2331 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2333 = _2199 + _2331;
    float _2335 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2337 = _2325 * _2325;
    float _2339 = fma(_2329, _2329, _2337);
    float _2341 = fma(_2333, _2333, _2339);
    float _2343 = rsqrt(_2341);
    float _2345 = sqrt(_2341);
    float _2347 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2349 = _2329 * _2347;
    float _2351 = _2333 * _2347;
    float _2353 = _2349 * _2349;
    float _2355 = _2351 * _2351;
    float _2357 = _2353 + _2355;
    float _2359 = sqrt(_2357);
    bool _2361 = _2359 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2365 = _2359 + _2363;
    float _2367 = _2333;
    float _2369 = _2337;
    float _2371 = _2365;
    float _2373 = _2347;
    float _2375 = _2349;
    if (_2361)
    {
        float _2377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2367 = _2377;
    }
    float _2379 = _2367;
    if (_2361)
    {
        float _2381 = rsqrt(_2357);
        _2369 = _2381;
    }
    float _2383 = _2369;
    float _2385 = _2383;
    if (_2361)
    {
        float _2387 = _2365 * _2379;
        _2371 = _2387;
    }
    float _2389 = _2371;
    if (_2361)
    {
        float _2391 = _2389 * 0.15915493667125701904296875;
        _2211 = _2391;
    }
    float _2393 = _2211;
    float _2395 = _2343;
    if (_2361)
    {
        float _2397 = _2393 * 6.283185482025146484375;
        float _2399 = sin(_2397);
        _2395 = _2399;
    }
    float _2401 = _2395;
    float _2403 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2405 = precise::max(0.0, _2403);
    float _2407 = _2319;
    float _2409 = _2405;
    float _2411 = _2403;
    if (_2361)
    {
        float _2413 = _2393 * 6.283185482025146484375;
        float _2415 = cos(_2413);
        _2407 = _2415;
    }
    float _2417 = _2407;
    float _2419 = -_2347;
    float _2421 = -_2405;
    float _2423 = fma(_2325, _2419, _2421);
    float _2425 = _2423;
    if (_2361)
    {
        float _2427 = _2423 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2409 = _2427;
    }
    float _2429 = _2409;
    float _2431 = _2401;
    float _2433 = _2429;
    if (_2361)
    {
        float _2435 = fma(_2401, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2431 = _2435;
    }
    float _2437 = _2431;
    float _2439 = _2437;
    if (_2361)
    {
        float _2441 = _2417 + (-1.0);
        _2411 = _2441;
    }
    float _2443 = _2411;
    float _2445 = _2443;
    if (_2361)
    {
        float _2447 = _2383 * _2437;
        _2373 = _2447;
    }
    float _2449 = _2373;
    if (!_2361)
    {
        _2385 = _2423;
    }
    float _2451 = _2385;
    float _2453 = _2451;
    if (_2361)
    {
        float _2455 = _2443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2433 = _2455;
    }
    float _2457 = _2433;
    if (_2361)
    {
        float _2459 = _2349 * _2449;
        _2375 = _2459;
    }
    float _2461 = _2375;
    if (!_2361)
    {
        _2439 = _2351;
    }
    float _2463 = _2439;
    float _2465 = _2463;
    if (_2361)
    {
        float _2467 = _2351 * _2449;
        _2465 = _2467;
    }
    float _2469 = _2465;
    if (!_2361)
    {
        _2445 = _2353;
    }
    float _2471 = _2445;
    float _2473 = _2471;
    if (_2361)
    {
        float _2475 = fma(_2423, _2417, _2457);
        _2453 = _2475;
    }
    float _2477 = _2453;
    if (_2361)
    {
        float _2479 = _2461 * _2461;
        _2473 = _2479;
    }
    float _2481 = _2473;
    if (!_2361)
    {
        _2425 = _2355;
    }
    float _2483 = _2425;
    float _2485 = _2483;
    if (_2361)
    {
        float _2487 = _2469 * _2469;
        _2485 = _2487;
    }
    float _2489 = _2485;
    float _2491 = fma(_2477, _2477, _2481);
    float _2493 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2495 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2497 = _2491 + _2489;
    float _2499 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2493);
    float _2501 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2503 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2505 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2503);
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = rsqrt(_2497);
    float _2511 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2499);
    float _2513 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2501);
    float _2515 = -_2507;
    float _2517 = _2515 + 1.0;
    float _2519 = _2195 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2521 = _2511 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2523 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2495);
    float _2525 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2513);
    float _2527 = fma(_2197, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2531 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2523);
    float _2533 = _2525 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2535 = abs(_2517);
    float _2537 = log2(_2535);
    float _2539 = -_2529;
    float _2541 = fma(_2539, _2335, 1.0);
    float _2543 = fma(_2199, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2527);
    float _2545 = _2531 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2547 = _2509 * _2461;
    float _2549 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2551 = _2509 * _2477;
    float _2553 = _2509 * _2469;
    float _2555 = _2547 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2557 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2549);
    float _2559 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2561 = log2(_2541);
    float _2563 = -_2555;
    float _2565 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2563);
    float _2567 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2557);
    float _2569 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2571 = -_2553;
    float _2573 = fma(_2571, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2565);
    float _2575 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2567);
    float _2577 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2579 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2581 = fma(_2573, -0.5, 0.5);
    float _2583 = 1.0 / _2575;
    float _2585 = fma(_2573, 0.5, 0.5);
    float _2587 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2579);
    float _2589 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2569);
    float _2591 = _2551 + 1.0;
    float _2593 = fma(_2585, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2595 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2587);
    float _2597 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2589);
    float _2599 = exp2(_2577);
    float _2601 = fma(_2585, _2593, -0.212114393711090087890625);
    float _2603 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2595);
    float _2605 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2597);
    float _2607 = _2561 * 0.693147182464599609375;
    float _2609 = fma(_2585, _2601, 1.570728778839111328125);
    float _2611 = sqrt(_2581);
    float _2613 = _2603 * _2583;
    float _2615 = _2605 * _2583;
    float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2619 = fma(_2613, 0.5, 0.5);
    float _2621 = fma(_2615, -0.5, 0.5);
    float _2623 = -_2551;
    float _2625 = fma(_2599, _2591, _2623);
    float3 _6762 = float3(_2619, _2621, _2617);
    float _2627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6762, float3(0.0), isnan(_6762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6762, float3(0.0), isnan(_6762)), level(0.0)).x;
    float _2629 = fma(_2625, 0.5, 0.5);
    float _2631 = _2611 * 0.636619746685028076171875;
    float _2633 = -_2609;
    float _2635 = fma(_2631, _2633, 1.0);
    float3 _6783 = float3(_2619, _2621, _2617);
    float4 _2638 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6783, float3(0.0), isnan(_6783)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6783, float3(0.0), isnan(_6783)), level(0.0)).xyzw;
    float _2640 = _2638.x;
    float _2642 = _2638.y;
    float _2644 = _2638.z;
    float _2646 = _2638.w;
    float2 _6800 = float2(_2635, _2629);
    float3 _2650 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6800, float2(0.0), isnan(_6800)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6800, float2(0.0), isnan(_6800)), level(0.0)).xyz;
    float _2652 = _2650.x;
    float _2654 = _2650.y;
    float _2656 = _2650.z;
    float _2658 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2660 = _2533 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2662 = _2263 > 0.0;
    bool _2664 = isnan(_2263);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = fma(_2545, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2660);
    float _2674 = exp2(_2658);
    bool _2676 = _2321 <= 0.0;
    bool _2678 = !_2670;
    bool _2680 = _2676 || _2678;
    float _2682 = fma(_2521, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2672);
    float _2684 = fma(_2559, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2682);
    float _2686 = _2263 * _2321;
    float _2688 = _2684 + _2575;
    float _2690 = _2686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2692 = _2688 * 0.5;
    float _2694 = -_2674;
    float _2696 = _2694 + 1.0;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2603;
    out.gl_Position.y = _2605;
    out.gl_Position.z = _2684;
    out.gl_Position.w = _2575;
    float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.z = _2692;
    out.m_68.w = _2575;
    out.m_45.x = _2698;
    float _2702 = _2700 * _2627;
    float _2704 = -_2700;
    float _2706 = _2704 + 1.0;
    float _2708 = _2646 * _2702;
    float _2710 = _2656 * _2702;
    float _2712 = fma(_2652, _2708, _2640);
    float _2714 = fma(_2654, _2708, _2642);
    float _2716 = _2646 * _2706;
    float _2718 = fma(_2646, _2710, _2644);
    out.m_70.x = _2712;
    out.m_70.y = _2714;
    out.m_70.z = _2718;
    out.m_70.w = _2716;
    if (!_2680)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2720;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

