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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2573 = false;
    bool _457 = false;
    bool _341 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2884 = as_type<float>(_127);
        out.gl_Position.z = _2884;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_153);
        out.gl_Position.z = _2939;
    }
    if (_147)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_155) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_155) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 * _157;
    bool _171 = !_163;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_167;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_58.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _169;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    bool _219 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_201);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -_217;
    float _241 = _239 + 1.0;
    float _243 = 1.0 / _233;
    bool _245 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_201);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = _229 * _241;
    float _259 = -_229;
    float _261 = _259 + 1.0;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = _255 * _261;
    float _267 = 1.0 / _237;
    float _269 = -_255;
    float _271 = _269 + 1.0;
    float _273 = _205 * _243;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _201 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_281, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _277 * _267;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _287 * _265;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _303 = _289 * _265;
    float _305 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _309 = fma(_301, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _313 = fma(_305, _257, _307);
    float _315 = fma(_309, _257, _311);
    float _317 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _313);
    float _319 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _315);
    bool _321 = !_263;
    float _339;
    if (!_321)
    {
        float _323 = in.m_58.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        _339 = _169;
    }
    _341 = false;
    float _343 = _339;
    float _345 = in.m_60.x;
    float _347 = in.m_60.y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _351 = _343 + _349;
    bool _353 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_343);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _367;
    float _377 = _319 * _347;
    float _379 = _351 * _375;
    bool _381 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _383 = isnan(_343);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _401;
    float _405 = _391 * _371;
    float _407 = fma(_395, _379, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _409 = fma(_399, _379, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _411 = fma(_403, _379, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = _407 * _405;
    float _419 = _409 * _405;
    float _421 = _411 * _405;
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _417);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _419);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _421);
    float _429 = _317 * _345;
    float _431 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].x, _423);
    float _433 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].y, _425);
    float _435 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].z, _427);
    bool _437 = !_373;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _169;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = in.m_58.x;
    float _467 = in.m_58.y;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = float(_463);
    float _481 = 1.0 / _479;
    float _483 = float(uint(_471));
    int _485 = ~_471;
    int _487 = _485 + 1;
    int _489 = ~_471;
    int _491 = _489 + 1;
    float _493 = 1.0 / _483;
    int _495 = ~_471;
    int _497 = _495 + 1;
    float _499 = _481 * _109;
    float _501 = trunc(_499);
    int _503 = int(_501);
    int _505 = as_type<int>(_493) + (-2);
    float _507 = float(uint(_503));
    float _509 = as_type<float>(_505) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _487 * int(_516);
    int _520 = _518 + _503;
    float _522 = float(uint(_520));
    float _524 = as_type<float>(_505) * _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _528 = _526 != 0;
    float _530 = trunc(_524);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    bool _536 = !_528;
    float _538 = _536 ? 7.345489978790283203125 : 1.0;
    float _540 = _538 * _465;
    float _542 = floor(_540);
    int _544 = int(_516) + int(_534);
    float _546 = float(_471);
    float _548 = float(_503);
    int _550 = _491 * _544;
    int _552 = _550 + _503;
    bool _554 = _548 >= _546;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan(_546);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _546 * _109;
    bool _568 = uint(_552) >= uint(_471);
    float _570 = -_542;
    float _572 = _540 + _570;
    float _574 = _566 * _157;
    float _576 = trunc(_564);
    int _578 = int(_576);
    bool _580 = !_568;
    int _582 = _580 ? 0 : (-1);
    float _584 = _572 * _546;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _596 = _594 != 0;
    int _598 = ~_544;
    int _600 = _598 + _582;
    int _602 = _600 + 1;
    bool _604 = _471 == 0;
    float _606 = trunc(_584);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _612 = _610 != 0;
    int _614 = _471 * _602;
    int _616 = _614 + _503;
    int _618 = _471 + (-1);
    bool _620 = !_592;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_604;
    int _626 = _624 ? _616 : (-1);
    float _628 = trunc(_574);
    int _630 = int(_628);
    int _632 = ~_578;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_588;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    int _646 = _626 * _636;
    int _648 = abs(_622);
    int _650 = abs(_640);
    int _652 = _578 * _618;
    int _654 = _652 + _646;
    int _656 = abs(_644);
    float _658 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = !_596;
    int _662 = _660 ? 0 : 1;
    int _664 = _654 * _648;
    int _666 = _608 * _656;
    int _668 = _666 + _503;
    int _670 = abs(_662);
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _678 = _676 != 0;
    int _680 = _630 * _650;
    int _682 = _680 + _664;
    float _684 = in.m_46.x;
    float _686 = in.m_46.y;
    float _688 = in.m_46.z;
    bool _690 = !_678;
    int _692 = _690 ? 0 : 1;
    int _694 = _668 * _670;
    int _696 = _694 + _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _702 = abs(_692);
    float _704 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_658, -2.0, _473);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _710 = _608 * _702;
    int _712 = _710 + _696;
    float _714 = -_708;
    float _716 = fma(_704, 2.0, _714);
    float _718 = 1.0 / _700;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _674 * _109;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = float(uint(_712));
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _752 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _477 * _718;
    float _758 = as_type<float>(_505) * _748;
    float _760 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _762 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _764 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    out.m_62.x = _740;
    out.m_62.y = _752;
    out.m_62.z = _754;
    out.m_62.w = _750;
    float _766 = _467 + _465;
    float _768 = trunc(_758);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = _465 * 2.0;
    float _776 = _766 + (-1.0);
    float _778 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _706);
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _792 = exp2(_738);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    bool _806 = _465 > 0.5;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    float _812 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _814 = -_109;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _818 = _497 * int(_772);
    int _820 = _818 + _712;
    float _822 = floor(_774);
    float _824 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _826 = -_173;
    int _828 = _806 ? as_type<int>(_826) : as_type<int>(_173);
    float _830 = float(uint(_820));
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = 1.0 / _810;
    float _838 = in.m_58.z;
    float _840 = as_type<float>(_505) * _830;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _467 * 2.0;
    float _848 = _802 ? _834 : 0.0;
    float _850 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _852 = trunc(_840);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    float _858 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    bool _860 = _822 > 0.0;
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    float _864 = float(uint(_668));
    float _866 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    bool _868 = _822 >= 0.0;
    bool _870 = isnan(_822);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = floor(_846);
    if (_788)
    {
        float _884 = _848 * _836;
        _119 = _884;
    }
    float _886 = _119;
    bool _888 = _467 > 0.5;
    float _890 = as_type<float>(_505) * _864;
    int _892 = ~_471;
    int _894 = _892 + 1;
    float _896 = -_866;
    float _898 = _896 + 1.0;
    int _900 = _876 ? 0 : 1;
    int _902 = int(_772) + int(_856);
    float _904 = _838 * 2.0;
    float _906 = -_177;
    int _908 = _888 ? as_type<int>(_906) : as_type<int>(_177);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = ~_900;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    int _922 = _920;
    if (!_860)
    {
        int _924 = ~_900;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _467 + _838;
    bool _932 = _882 > 0.0;
    bool _934 = _882 >= 0.0;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = _894 * _902;
    int _946 = _944 + _712;
    float _948 = floor(_904);
    float _950 = _930 + (-1.0);
    int _952 = _942 ? 0 : 1;
    bool _954 = uint(_946) >= uint(_471);
    float _956 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _958 = ~_471;
    int _960 = _958 + 1;
    bool _962 = !_954;
    int _964 = _962 ? 0 : (-1);
    int _966 = ~_952;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = ~_902;
    int _974 = _972 + _964;
    int _976 = _974 + 1;
    bool _978 = !_728;
    float _980 = _978 ? _173 : as_type<float>(_828);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _992 = _990 != 0;
    int _994 = _970;
    if (!_932)
    {
        int _996 = ~_952;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    int _1002 = _960 * int(_914);
    int _1004 = _1002 + _668;
    bool _1006 = !_734;
    float _1008 = _1006 ? _177 : as_type<float>(_908);
    bool _1010 = _948 > 0.0;
    bool _1012 = _948 >= 0.0;
    bool _1014 = isnan(_948);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    int _1022 = _471 * _976;
    int _1024 = _1022 + _712;
    bool _1026 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1028 = isnan(_459);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = float(uint(_1004));
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1042 = _459 + _1040;
    bool _1044 = !_604;
    int _1046 = _1044 ? _1024 : (-1);
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1054 = isnan(_459);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = as_type<float>(_505) * _1038;
    int _1066 = _1046 >> 31;
    float _1068 = fma(_756, _1042, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1070 = _1062 * _1050;
    float _1072 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    int _1074 = _1066 & 3;
    float _1076 = _980 + 0.5;
    float _1078 = _1068 * _1070;
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    int _1084 = _1046 + _1074;
    float _1086 = _1008 + (-0.5);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[80].x, _816);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1078);
    int _1092 = _1084 >> 2;
    float _1094 = -_1086;
    float _1096 = -_778;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1096);
    bool _1100 = !_988;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1064);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1046 & 3;
    bool _1112 = _1110 != 0;
    float _1114 = fma(_1008, _898, _1098);
    int _1116 = _1020 ? 0 : 1;
    float _1118 = -_880;
    float _1120 = fma(_980, _1118, _1088);
    int _1122 = _1092 << 4;
    int _1124 = _1122 + 368;
    float _1126 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1090);
    int _1128 = _1046 & 3;
    bool _1130 = _1128 != 0;
    float _1132 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1134 = _1112 ? 0 : 1;
    uint _1136 = uint(int(uint(_1124) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    bool _1152 = uint(_1128) > 1u;
    out.m_64.x = _1120;
    out.m_64.y = _1114;
    int _1154 = ~_1116;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1162 = _1158;
    if (!_1010)
    {
        int _1164 = ~_1116;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    float _1170 = float(_928);
    int _1172 = ~_1134;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_984;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1184 = uint(_1128) >= 2u;
    float _1186 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1188 = _1176;
    if (!_1152)
    {
        int _1190 = ~_1134;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1198 = _1124 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = int(_914) + int(_1108);
    float _1218 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1220 = ~_471;
    int _1222 = _1220 + 1;
    int _1224 = _1184 ? 0 : 1;
    bool _1226 = _1128 != 3;
    int _1228 = _1222 * _1216;
    int _1230 = _1228 + _668;
    int _1232 = abs(_1102);
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = float(_1232);
    bool _1242 = uint(_1230) >= uint(_471);
    float _1244 = float(_1168);
    float _1246 = _1240 * _1170;
    int _1248 = abs(_1180);
    float _1250 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1252 = !_1242;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = _1246 * (-2.0);
    int _1258 = _1238;
    if (_1226)
    {
        int _1260 = ~_1224;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1270 = ~_1216;
    int _1272 = _1270 + _1254;
    int _1274 = _1272 + 1;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1278 = _1132 + _1276;
    float _1280 = float(_1248);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1266 + _1282;
    int _1286 = abs(_1194);
    out.m_66.x = _1218;
    out.m_66.y = _1196;
    out.m_66.z = _1268;
    out.m_66.w = _1160;
    bool _1288 = _1128 != 3;
    float _1290 = _1280 * _1244;
    int _1292 = ~_1286;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _471 * _1274;
    int _1300 = _1298 + _668;
    bool _1302 = !_1130;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = _1290 * (-2.0);
    int _1308 = abs(_1264);
    int _1310 = _1296 * as_type<int>(_1150);
    bool _1312 = !_722;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = in.m_68.x;
    float _1318 = in.m_68.y;
    float _1320 = in.m_68.z;
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1326 = _824 + _1324;
    bool _1328 = !_1288;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1322);
    int _1334 = abs(_1304);
    int _1336 = abs(_1330);
    float _1338 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    int _1340 = ~_1334;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1314);
    int _1348 = _1344 * as_type<int>(_1142);
    int _1350 = _1348 + _1310;
    bool _1352 = _1338 >= 0.0;
    float _1354 = _1284 * _1284;
    int _1356 = ~_1308;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1278, _1278, _1354);
    int _1364 = ~_1336;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    int _1370 = _1360 * as_type<int>(_1206);
    int _1372 = _1370 + _1350;
    int _1374 = ~_1346;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1326, _1326, _1362);
    int _1382 = _1368 * as_type<int>(_1214);
    int _1384 = _1382 + _1372;
    bool _1386 = !_604;
    int _1388 = _1386 ? _1300 : (-1);
    float _1390 = _1362;
    if (_1352)
    {
        out.m_53.x = 0.0;
    }
    if (_1352)
    {
        _1390 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1392 = _1390;
    int _1394 = _1384 * _1378;
    float _1396 = rsqrt(_1380);
    float _1398 = fma(_812, _1306, _812);
    float _1400 = fma(_1306, _1316, _1316);
    int _1402 = _1388 * _1346;
    int _1404 = _1402 + _1394;
    float _1406 = _465 + (-0.5);
    int _1408 = as_type<int>(_1392);
    if (_1352)
    {
        float _1410 = _1392 * 5.0;
        _1408 = as_type<int>(_1410);
    }
    int _1412 = _1408;
    float _1414 = fma(_1256, _1318, _1318);
    float _1416 = float(_1404);
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1400);
    bool _1420 = !_992;
    int _1422 = _1420 ? 0 : 1;
    if (_1352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4840 = as_type<float>(_1412);
        out.gl_Position.z = _4840;
    }
    float _1424 = fma(_956, _1256, _956);
    float _1426 = _467 + (-0.5);
    float _1428 = fma(_1398, _886, _1418);
    out.m_70.x = _1416;
    float _1430 = _1284 * _1396;
    float _1432 = _1278 * _1396;
    int _1434 = abs(_1422);
    if (_1352)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1436 = -_1430;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _1440 = _1326 * _1396;
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1446 = float(_1000);
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1438 + _1448;
    float _1452 = -_1440;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1458 = _1444 + _1456;
    float _1460 = float(_1434);
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1466 = _1454 + _1464;
    float _1468 = -_1430;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1472 = _838 + _465;
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1462);
    float _1476 = _1428 * 0.15915493667125701904296875;
    float _1478 = _1460 * _1446;
    float _1480 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1474);
    float _1484 = -_1432;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1488 = _1470 * _1470;
    float _1490 = _1472 + (-1.0);
    bool _1492 = _1482 >= 0.0;
    float _1494 = _1478 * (-2.0);
    float _1496 = fma(_1424, _886, _1480);
    float _1498 = fma(_1486, _1486, _1488);
    float _1500 = -_1440;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1506 = _838 + (-0.5);
    float _1508 = fma(_1494, _1320, _1320);
    float _1510 = _1496 * 0.15915493667125701904296875;
    float _1512 = fma(_1502, _1502, _1498);
    float _1514 = fma(_1504, _1494, _1504);
    float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1508);
    float _1518 = _1476 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1524 = as_type<int>(_1508);
    float _1526 = _1466;
    if (_1492)
    {
        _1522 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1528 = _1522;
    float _1530 = fma(_1514, _886, _1516);
    if (_1492)
    {
        out.m_53.x = 0.0;
    }
    if (_1492)
    {
        float _1532 = _1528 * 5.0;
        _1524 = as_type<int>(_1532);
    }
    int _1534 = _1524;
    float _1536 = _1530 * 0.15915493667125701904296875;
    float _1538 = _1476 * 6.283185482025146484375;
    float _1540 = cos(_1538);
    if (_1492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5049 = as_type<float>(_1534);
        out.gl_Position.z = _5049;
    }
    float _1542 = _1510 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = sqrt(_1512);
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    if (_1492)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1552 = _1536 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    float _1556 = _1396 * _1546;
    float _1558 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1562 = _1540 * _1550;
    float _1564 = _1540 * _1544;
    float _1566 = _1556 * _1558;
    float _1568 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1570 = _1536 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1576 = _1560 * _1566;
    float _1578 = _1520 * _1544;
    float _1580 = _1556 * _1568;
    float _1582 = _1520 * _1550;
    bool _1584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1592 = _1588 || _1590;
    float _1594 = _1540 * _1554;
    float _1596 = _1550 * _1554;
    float _1598 = _1520 * _1554;
    float _1600 = _1544 * _1554;
    float _1602 = _1574 * _1580;
    float _1604 = _1594 * _1576;
    float _1606 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1608 = _1606 * 0.5;
    float _1610 = _1598 * _1576;
    float _1612 = fma(_1572, _1562, _1578);
    float _1614 = -_1582;
    float _1616 = fma(_1572, _1564, _1614);
    float _1618 = -_1576;
    float _1620 = _1572 * _1618;
    float _1622 = -_1564;
    float _1624 = fma(_1572, _1582, _1622);
    float _1626 = fma(_1612, _1602, _1604);
    float _1628 = fma(_1572, _1578, _1562);
    float _1630 = fma(_1596, _1602, _1620);
    float _1632 = fma(_1624, _1602, _1610);
    float _1634 = fma(_1616, _1608, _1626);
    float _1636 = fma(_1600, _1608, _1630);
    float _1638 = fma(_1628, _1608, _1632);
    float _1640 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1646 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1648 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1644);
    float _1650 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1654 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1656 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1658 = _824 + _1652;
    float _1660 = _1132 + _1654;
    float _1662 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1656);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1666 = _1658 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1674 = _1666 * _1666;
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1678 = fma(_1670, _1670, _1674);
    float _1680 = _1266 + _1676;
    float _1682 = sqrt(_1678);
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1686 = _1674;
    float _1688 = _1636;
    float _1690 = _1660;
    float _1692 = _1634;
    float _1694 = _1598;
    if (!_1684)
    {
        _1686 = _1660;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (!_1684)
    {
        _1688 = _1658;
    }
    float _1700 = _1688;
    float _1702 = _1700;
    if (!_1684)
    {
        _1690 = _1680;
    }
    float _1704 = _1690;
    bool _1706 = !_1684;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1682 + _1712;
        float _1716 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1678);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1680, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1670, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1666, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1698 = _1742;
        _1708 = _1738;
        _1702 = _1744;
        _1692 = _1740;
    }
    float _1746 = _1698;
    float _1748 = _1708;
    float _1750 = _1702;
    float _1752 = _1692;
    float _1754 = -_1432;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1430;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1762 = -_1440;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _1766 = _1760;
    float _1768 = _1756;
    float _1770 = _1764;
    float _1772 = _1752;
    if (!_1592)
    {
        float _1774 = _1450 * _1450;
        float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1778 = -_824;
        float _1780 = _1778 + _1750;
        float _1782 = -_1132;
        float _1784 = _1782 + _1746;
        float _1786 = fma(_1458, _1458, _1774);
        float _1788 = -_1266;
        float _1790 = _1788 + _1748;
        float _1792 = fma(_1466, _1466, _1786);
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = sqrt(_1792);
        float _1798 = 1.0 / _1556;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1802 = precise::min(_1796, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1804 = _1802 * _1776;
        float _1806 = _1804 * _1798;
        float _1808 = _1800 * _1806;
        float _1810 = _1780 * _1806;
        float _1812 = fma(_1784, _1808, _1444);
        float _1814 = fma(_1790, _1808, _1438);
        float _1816 = fma(_1800, _1810, _1454);
        _1766 = _1814;
        _1768 = _1812;
        _1770 = _1816;
        _1772 = _1798;
    }
    float _1818 = _1766;
    float _1820 = _1768;
    float _1822 = _1770;
    float _1824 = _1772;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1828 = _1818 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = _1820 + _1830;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1822 + _1834;
    float _1838 = _1828 * _1828;
    float _1840 = fma(_1832, _1832, _1838);
    float _1842 = fma(_1836, _1836, _1840);
    float _1844 = rsqrt(_1842);
    float _1846 = sqrt(_1842);
    float _1848 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1832 * _1848;
    float _1852 = _1836 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1836;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1824;
    float _1876 = _1828;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = _1884;
    if (_1862)
    {
        float _1888 = _1866 * _1880;
        _1872 = _1888;
    }
    float _1890 = _1872;
    if (_1862)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1844;
    float _1898 = _1894;
    if (_1862)
    {
        float _1900 = _1894 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1896 = _1902;
    }
    float _1904 = _1896;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1880;
    float _1912 = _1908;
    if (_1862)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1848;
    float _1922 = -_1908;
    float _1924 = fma(_1828, _1920, _1922);
    if (_1862)
    {
        float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1926;
    }
    float _1928 = _1876;
    float _1930 = _1928;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1932 = _1898;
    float _1934 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1936 = _1904;
    float _1938 = _1932;
    if (_1862)
    {
        float _1940 = fma(_1904, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1940;
    }
    float _1942 = _1526;
    float _1944 = _1942;
    if (!_1862)
    {
        _1936 = _1924;
    }
    float _1946 = _1936;
    float _1948 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1934);
    float _1950 = _1946;
    float _1952 = _1918;
    if (_1862)
    {
        float _1954 = _1918 + (-1.0);
        _1912 = _1954;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1862)
    {
        float _1960 = _1884 * _1942;
        _1930 = _1960;
    }
    float _1962 = _1930;
    if (!_1862)
    {
        _1944 = _1850;
    }
    float _1964 = _1944;
    float _1966 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1968 = _1964;
    if (_1862)
    {
        float _1970 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _1970;
    }
    float _1972 = _1958;
    if (_1862)
    {
        float _1974 = _1850 * _1962;
        _1968 = _1974;
    }
    float _1976 = _1968;
    if (!_1862)
    {
        _1886 = _1854;
    }
    float _1978 = _1886;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1978;
    if (_1862)
    {
        float _1984 = fma(_1924, _1918, _1972);
        _1950 = _1984;
    }
    float _1986 = _1950;
    if (!_1862)
    {
        _1952 = _1852;
    }
    float _1988 = _1952;
    float _1990 = _1988;
    if (_1862)
    {
        float _1992 = _1852 * _1962;
        _1990 = _1992;
    }
    float _1994 = _1990;
    if (_1862)
    {
        float _1996 = _1976 * _1976;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1862)
    {
        float _2000 = _1994 * _1994;
        _1938 = _2000;
    }
    float _2002 = _1938;
    float _2004 = fma(_1986, _1986, _1998);
    float _2006 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2008 = _2004 + _2002;
    float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2006);
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2014 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2012);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = rsqrt(_2008);
    float _2020 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = -_2016;
    float _2026 = _2024 + 1.0;
    float _2028 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2030 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2032 = floor(_2022);
    float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2040 = -_2034;
    float _2042 = fma(_2040, _2030, 1.0);
    float _2044 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = abs(_2026);
    float _2050 = log2(_2048);
    float _2052 = _2018 * _1976;
    float _2054 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2056 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2058 = _2018 * _1994;
    float _2060 = _2018 * _1986;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2054);
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2068 = floor(_2038);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2078 = -_2058;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2082 = -_2032;
    float _2084 = _2022 + _2082;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2076);
    float _2088 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2090 = fma(_2080, -0.5, 0.5);
    float _2092 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2094 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2086);
    float _2096 = exp2(_2088);
    float _2098 = fma(_2080, 0.5, 0.5);
    float _2100 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2094);
    float _2102 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2092);
    float _2104 = -_2068;
    float _2106 = _2038 + _2104;
    float _2108 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = _2060 + 1.0;
    float _2112 = 1.0 / _2100;
    float _2114 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2102);
    float _2118 = fma(_2098, _2108, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2122 = log2(_2042);
    float _2124 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2120);
    float _2126 = -_2060;
    float _2128 = fma(_2096, _2110, _2126);
    float _2130 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2132 = sqrt(_2090);
    float _2134 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2136 = _2130 * _2112;
    float2 _6020 = float2(_2084, _2106);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _2140 = fma(_2098, _2118, 1.570728778839111328125);
    float _2142 = _2134 * _2112;
    float _2144 = fma(_2136, 0.5, 0.5);
    float _2146 = fma(_2128, 0.5, 0.5);
    float _2148 = _2122 * 0.693147182464599609375;
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2154 = _2132 * 0.636619746685028076171875;
    float3 _6054 = float3(_2144, _2150, _2152);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).x;
    float3 _6065 = float3(_2144, _2150, _2152);
    float4 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6065, float3(0.0), isnan(_6065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6065, float3(0.0), isnan(_6065)), level(0.0)).xyzw;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2159.w;
    float _2169 = -_2140;
    float _2171 = fma(_2154, _2169, 1.0);
    float2 _6086 = float2(_2171, _2146);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6086, float2(0.0), isnan(_6086)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6086, float2(0.0), isnan(_6086)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2187 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2189 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2201 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2185);
    float _2203 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2205 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2199);
    float _2207 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2209 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2211 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2213 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2215 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2187);
    float _2217 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2219 = 1.0 / _2211;
    float _2221 = _2213 + _2211;
    float _2223 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2225 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2227 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2229 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2203);
    float _2231 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = -_1572;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2237 = _2221 * _2219;
    float _2239 = _2237 * 0.5;
    float _2241 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2235);
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2245 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2243);
    float _2247 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2209);
    float _2249 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2251 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    float _2253 = 1.0 / _2245;
    float _2255 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = -_1572;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2249);
    float _2261 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2247);
    float _2263 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2229);
    float _2265 = -_1572;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2269 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2251);
    float _2271 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2275 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2277 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2279 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2273);
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2275);
    float _2283 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2259);
    float _2285 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2267);
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2289 = _2253 * _2287;
    float _2291 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2281);
    float _2293 = _2281;
    float _2295 = _2217;
    float _2297 = _2100;
    float _2299 = _2134;
    if (!_2197)
    {
        _1694 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2301 = _1694;
    float _2303 = _2217 * _2283;
    float _2305 = abs(_2289);
    float _2307 = log2(_2305);
    float _2309 = _2217 * _2241;
    float _2311 = _2217 * _2285;
    float _2313 = _2301;
    if (!_2197)
    {
        float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2317 = _2301 + _2315;
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (!_2197)
    {
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = _2289 + _2321;
        _2293 = _2323;
    }
    float _2325 = _2293;
    float _2327 = fma(_2225, _2263, _2309);
    if (_2197)
    {
        _2295 = 1.0;
    }
    float _2329 = _2295;
    float _2331 = _2074;
    float _2333 = _2329;
    if (!_2197)
    {
        float _2335 = 1.0 / _2319;
        _2331 = _2335;
    }
    float _2337 = _2331;
    float _2339 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2341 = exp2(_2339);
    if (!_2197)
    {
        float _2343 = _2325 * _2337;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2333 = _2345;
    }
    float _2347 = _2333;
    bool _2349 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2351 = isnan(_1846);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2357 = _2353 || _2355;
    float _2359 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    float _2365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2279);
    float _2367 = fma(_2225, _2261, _2303);
    float _2369 = fma(_2361, -2.0, 3.0);
    float _2371 = _2361 * _2361;
    float _2373 = _2100 * 0.5;
    float _2375 = fma(_2225, _2269, _2311);
    float _2377 = _2371 * _2369;
    float _2379 = fma(_2134, -0.5, _2373);
    float _2381 = in.m_72.x;
    float _2383 = _2363 + _2367;
    float _2385 = -_2377;
    float _2387 = _2385 + 1.0;
    float _2389 = _2365 + _2327;
    float _2391 = _2291 + _2375;
    float _2393 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2377);
    float _2395 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2223);
    float _2397 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _2289 <= 8000.0;
    bool _2401 = isnan(_2289);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2130 + _2100;
    float _2413 = _2395 + _2100;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2134;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2100;
    float _2415 = exp2(_2397);
    float _2417 = _2409 * _2393;
    float _2419 = _2413 * 0.5;
    float _2421 = _2411 * 0.5;
    out.m_74.x = _2383;
    out.m_74.y = _2389;
    out.m_74.z = _2391;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2421;
    out.m_76.y = _2379;
    out.m_76.z = _2419;
    out.m_76.w = _2100;
    float _2425 = _2395;
    if (!_2357)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2427 = _2297;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2357)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2433 = _2425;
    float _2435 = -_2415;
    float _2437 = _2435 + 1.0;
    float _2439 = _2433;
    float _2441 = _2433;
    if (!_2357)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2443 = _2299;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = -_2138;
    float _2449 = _2447 + 1.0;
    float _2451 = _2449 * _2423;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = -_2453;
    float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2459 = _2457 * _2381;
    float _2461 = _2445 * _2156;
    float _2463 = -_2445;
    float _2465 = _2463 + 1.0;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2469 = _2167 * _2461;
    float _2471 = _2167 * _2465;
    out.m_78.x = _2467;
    float _2473 = _2181 * _2461;
    float _2475 = fma(_2177, _2469, _2161);
    float _2477 = fma(_2179, _2469, _2163);
    float _2479 = _2163;
    float _2481 = _2161;
    float _2483 = _2461;
    float _2485 = _2443;
    float _2487 = _2443;
    if (!_2357)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2489 = _2479;
    float _2491 = fma(_2167, _2473, _2165);
    float _2493 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = _2489;
    float _2497 = _2489;
    if (!_2357)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2357)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2505 = _2483;
    out.m_80.x = _2475;
    out.m_80.y = _2477;
    out.m_80.z = _2491;
    out.m_80.w = _2471;
    bool _2507 = !_2357;
    float _2509 = _2505;
    float _2511 = _2505;
    if (!_2507)
    {
        bool _2513 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2515 = isnan(_1846);
        bool _2517 = _2513 || _2515;
        bool _2519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2521 = _2517 || _2519;
        if (!_2521)
        {
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2525 = _1846 + _2523;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = 1.0 / _2529;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2553 = _2525 * _2535;
            float _2555 = precise::clamp(_2553, 0.0, 1.0);
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = fma(_2555, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2563 = fma(_2555, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2555, _2539, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2567 = fma(_2555, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2569 = fma(_2555, _2547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2571 = fma(_2555, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2503 = _2565;
            _2487 = _2569;
            _2497 = _2561;
            _2441 = _2567;
            _2431 = _2563;
            _2511 = _2571;
            _2573 = true;
        }
        else
        {
            bool _2575 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2577 = isnan(_1846);
            bool _2579 = _2575 || _2577;
            bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2583 = _2579 || _2581;
            if (!_2583)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2585 = _2495;
            _2497 = _2585;
            if (!_2583)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2587 = _2501;
            _2503 = _2587;
            if (!_2583)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2589 = _2429;
            _2431 = _2589;
            if (!_2583)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2591 = _2439;
            _2441 = _2591;
            if (!_2583)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2593 = _2485;
            _2487 = _2593;
            if (!_2583)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2595 = _2509;
            bool _2597 = !_2583;
            _2511 = _2595;
            if (!_2597)
            {
                bool _2599 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2601 = isnan(_1846);
                bool _2603 = _2599 || _2601;
                bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2607 = _2603 || _2605;
                if (!_2607)
                {
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2611 = _1846 + _2609;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = 1.0 / _2615;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2639 = _2611 * _2621;
                    float _2641 = precise::clamp(_2639, 0.0, 1.0);
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = fma(_2641, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2649 = fma(_2641, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2641, _2625, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2653 = fma(_2641, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2655 = fma(_2641, _2633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2657 = fma(_2641, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2503 = _2651;
                    _2487 = _2655;
                    _2497 = _2647;
                    _2441 = _2653;
                    _2431 = _2649;
                    _2511 = _2657;
                    _2573 = true;
                }
                else
                {
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2573 = false;
    float _2659 = _2503;
    float _2661 = _2487;
    float _2663 = _2497;
    float _2665 = _2441;
    float _2667 = _2431;
    float _2669 = _2511;
    float _2671 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2673 = fma(_2389, -0.5, 0.5);
    float _2675 = precise::clamp(_2673, 0.0, 1.0);
    float _2677 = -_2659;
    float _2679 = _2677 + _2661;
    float _2681 = -_2663;
    float _2683 = _2681 + _2665;
    out.m_82.x = 0.0;
    float _2685 = fma(_2675, _2679, _2659);
    float _2687 = -_2667;
    float _2689 = _2687 + _2669;
    float _2691 = fma(_2675, _2683, _2663);
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2697 = fma(_2675, _2689, _2667);
    out.m_53.x = _2671;
    float _2699 = fma(_2691, 0.298911988735198974609375, _2693);
    bool _2701 = _2347 > 0.0;
    bool _2703 = isnan(_2347);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2697, 0.114477999508380889892578125, _2699);
    float _2713 = -_2711;
    float _2715 = _2691 + _2713;
    float _2717 = -_2711;
    float _2719 = _2685 + _2717;
    float _2721 = -_2711;
    float _2723 = _2697 + _2721;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2727 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2729 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    bool _2731 = !_2695;
    if (!_2731)
    {
        float _2733 = -_1818;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2737 = -_1820;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2741 = -_1822;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2745 = _2735 * _2735;
        float _2747 = fma(_2739, _2739, _2745);
        float _2749 = fma(_2743, _2743, _2747);
        float _2751 = sqrt(_2749);
        float _2753 = rsqrt(_2749);
        float _2755 = -_2751;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2761 = precise::clamp(_2759, 0.0, 1.0);
        float _2763 = _2739 * _2753;
        float _2765 = _2735 * _2753;
        float _2767 = abs(_2761);
        float _2769 = log2(_2767);
        float _2771 = _2743 * _2753;
        float _2773 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2775 = _2389 * _2765;
        float _2777 = -_2765;
        float _2779 = -_2773;
        float _2781 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2779);
        float _2783 = fma(_2383, _2763, _2775);
        float _2785 = -_2771;
        float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2781);
        float _2789 = fma(_2391, _2771, _2783);
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2795 = _2787 + _2793;
        float _2797 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2799 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = exp2(_2797);
        float _2805 = _2803 * _2801;
        float _2807 = _2791 * _2805;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2813 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2809;
        out.m_82.y = _2811;
        out.m_82.z = _2813;
    }
    out.m_84.x = _2725;
    out.m_84.y = _2727;
    out.m_84.z = _2729;
    if (_2709)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2815 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2815;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2573 = false;
    bool _457 = false;
    bool _341 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2884 = as_type<float>(_127);
        out.gl_Position.z = _2884;
    }
    if (!_113)
    {
        return out;
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_153);
        out.gl_Position.z = _2939;
    }
    if (_147)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_155) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_155) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 * _157;
    bool _171 = !_163;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_167;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_58.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _169;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    bool _219 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_201);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -_217;
    float _241 = _239 + 1.0;
    float _243 = 1.0 / _233;
    bool _245 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_201);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = _229 * _241;
    float _259 = -_229;
    float _261 = _259 + 1.0;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = _255 * _261;
    float _267 = 1.0 / _237;
    float _269 = -_255;
    float _271 = _269 + 1.0;
    float _273 = _205 * _243;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _201 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_281, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _277 * _267;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _287 * _265;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _303 = _289 * _265;
    float _305 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _309 = fma(_301, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _313 = fma(_305, _257, _307);
    float _315 = fma(_309, _257, _311);
    float _317 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _313);
    float _319 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _315);
    bool _321 = !_263;
    float _339;
    if (!_321)
    {
        float _323 = in.m_58.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        _339 = _169;
    }
    _341 = false;
    float _343 = _339;
    float _345 = in.m_60.x;
    float _347 = in.m_60.y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _351 = _343 + _349;
    bool _353 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_343);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _367;
    float _377 = _319 * _347;
    float _379 = _351 * _375;
    bool _381 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _383 = isnan(_343);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _401;
    float _405 = _391 * _371;
    float _407 = fma(_395, _379, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _409 = fma(_399, _379, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _411 = fma(_403, _379, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = _407 * _405;
    float _419 = _409 * _405;
    float _421 = _411 * _405;
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _417);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _419);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _421);
    float _429 = _317 * _345;
    float _431 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].x, _423);
    float _433 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].y, _425);
    float _435 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].z, _427);
    bool _437 = !_373;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _169;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = in.m_58.x;
    float _467 = in.m_58.y;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = float(_463);
    float _481 = 1.0 / _479;
    float _483 = float(uint(_471));
    int _485 = ~_471;
    int _487 = _485 + 1;
    int _489 = ~_471;
    int _491 = _489 + 1;
    float _493 = 1.0 / _483;
    int _495 = ~_471;
    int _497 = _495 + 1;
    float _499 = _481 * _109;
    float _501 = trunc(_499);
    int _503 = int(_501);
    int _505 = as_type<int>(_493) + (-2);
    float _507 = float(uint(_503));
    float _509 = as_type<float>(_505) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _487 * int(_516);
    int _520 = _518 + _503;
    float _522 = float(uint(_520));
    float _524 = as_type<float>(_505) * _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _528 = _526 != 0;
    float _530 = trunc(_524);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    bool _536 = !_528;
    float _538 = _536 ? 7.345489978790283203125 : 1.0;
    float _540 = _538 * _465;
    float _542 = floor(_540);
    int _544 = int(_516) + int(_534);
    float _546 = float(_471);
    float _548 = float(_503);
    int _550 = _491 * _544;
    int _552 = _550 + _503;
    bool _554 = _548 >= _546;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan(_546);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _546 * _109;
    bool _568 = uint(_552) >= uint(_471);
    float _570 = -_542;
    float _572 = _540 + _570;
    float _574 = _566 * _157;
    float _576 = trunc(_564);
    int _578 = int(_576);
    bool _580 = !_568;
    int _582 = _580 ? 0 : (-1);
    float _584 = _572 * _546;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _596 = _594 != 0;
    int _598 = ~_544;
    int _600 = _598 + _582;
    int _602 = _600 + 1;
    bool _604 = _471 == 0;
    float _606 = trunc(_584);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _612 = _610 != 0;
    int _614 = _471 * _602;
    int _616 = _614 + _503;
    int _618 = _471 + (-1);
    bool _620 = !_592;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_604;
    int _626 = _624 ? _616 : (-1);
    float _628 = trunc(_574);
    int _630 = int(_628);
    int _632 = ~_578;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_588;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    int _646 = _626 * _636;
    int _648 = abs(_622);
    int _650 = abs(_640);
    int _652 = _578 * _618;
    int _654 = _652 + _646;
    int _656 = abs(_644);
    float _658 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = !_596;
    int _662 = _660 ? 0 : 1;
    int _664 = _654 * _648;
    int _666 = _608 * _656;
    int _668 = _666 + _503;
    int _670 = abs(_662);
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _678 = _676 != 0;
    int _680 = _630 * _650;
    int _682 = _680 + _664;
    float _684 = in.m_46.x;
    float _686 = in.m_46.y;
    float _688 = in.m_46.z;
    bool _690 = !_678;
    int _692 = _690 ? 0 : 1;
    int _694 = _668 * _670;
    int _696 = _694 + _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _702 = abs(_692);
    float _704 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_658, -2.0, _473);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _710 = _608 * _702;
    int _712 = _710 + _696;
    float _714 = -_708;
    float _716 = fma(_704, 2.0, _714);
    float _718 = 1.0 / _700;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _674 * _109;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = float(uint(_712));
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _752 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _477 * _718;
    float _758 = as_type<float>(_505) * _748;
    float _760 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _762 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _764 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    out.m_62.x = _740;
    out.m_62.y = _752;
    out.m_62.z = _754;
    out.m_62.w = _750;
    float _766 = _467 + _465;
    float _768 = trunc(_758);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = _465 * 2.0;
    float _776 = _766 + (-1.0);
    float _778 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _706);
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _792 = exp2(_738);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    bool _806 = _465 > 0.5;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    float _812 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _814 = -_109;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _818 = _497 * int(_772);
    int _820 = _818 + _712;
    float _822 = floor(_774);
    float _824 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _826 = -_173;
    int _828 = _806 ? as_type<int>(_826) : as_type<int>(_173);
    float _830 = float(uint(_820));
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = 1.0 / _810;
    float _838 = in.m_58.z;
    float _840 = as_type<float>(_505) * _830;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _467 * 2.0;
    float _848 = _802 ? _834 : 0.0;
    float _850 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _852 = trunc(_840);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    float _858 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    bool _860 = _822 > 0.0;
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    float _864 = float(uint(_668));
    float _866 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    bool _868 = _822 >= 0.0;
    bool _870 = isnan(_822);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = floor(_846);
    if (_788)
    {
        float _884 = _848 * _836;
        _119 = _884;
    }
    float _886 = _119;
    bool _888 = _467 > 0.5;
    float _890 = as_type<float>(_505) * _864;
    int _892 = ~_471;
    int _894 = _892 + 1;
    float _896 = -_866;
    float _898 = _896 + 1.0;
    int _900 = _876 ? 0 : 1;
    int _902 = int(_772) + int(_856);
    float _904 = _838 * 2.0;
    float _906 = -_177;
    int _908 = _888 ? as_type<int>(_906) : as_type<int>(_177);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = ~_900;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    int _922 = _920;
    if (!_860)
    {
        int _924 = ~_900;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _467 + _838;
    bool _932 = _882 > 0.0;
    bool _934 = _882 >= 0.0;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = _894 * _902;
    int _946 = _944 + _712;
    float _948 = floor(_904);
    float _950 = _930 + (-1.0);
    int _952 = _942 ? 0 : 1;
    bool _954 = uint(_946) >= uint(_471);
    float _956 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _958 = ~_471;
    int _960 = _958 + 1;
    bool _962 = !_954;
    int _964 = _962 ? 0 : (-1);
    int _966 = ~_952;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = ~_902;
    int _974 = _972 + _964;
    int _976 = _974 + 1;
    bool _978 = !_728;
    float _980 = _978 ? _173 : as_type<float>(_828);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _992 = _990 != 0;
    int _994 = _970;
    if (!_932)
    {
        int _996 = ~_952;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    int _1002 = _960 * int(_914);
    int _1004 = _1002 + _668;
    bool _1006 = !_734;
    float _1008 = _1006 ? _177 : as_type<float>(_908);
    bool _1010 = _948 > 0.0;
    bool _1012 = _948 >= 0.0;
    bool _1014 = isnan(_948);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    int _1022 = _471 * _976;
    int _1024 = _1022 + _712;
    bool _1026 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1028 = isnan(_459);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = float(uint(_1004));
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1042 = _459 + _1040;
    bool _1044 = !_604;
    int _1046 = _1044 ? _1024 : (-1);
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1054 = isnan(_459);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = as_type<float>(_505) * _1038;
    int _1066 = _1046 >> 31;
    float _1068 = fma(_756, _1042, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1070 = _1062 * _1050;
    float _1072 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    int _1074 = _1066 & 3;
    float _1076 = _980 + 0.5;
    float _1078 = _1068 * _1070;
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    int _1084 = _1046 + _1074;
    float _1086 = _1008 + (-0.5);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[80].x, _816);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1078);
    int _1092 = _1084 >> 2;
    float _1094 = -_1086;
    float _1096 = -_778;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1096);
    bool _1100 = !_988;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1064);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1046 & 3;
    bool _1112 = _1110 != 0;
    float _1114 = fma(_1008, _898, _1098);
    int _1116 = _1020 ? 0 : 1;
    float _1118 = -_880;
    float _1120 = fma(_980, _1118, _1088);
    int _1122 = _1092 << 4;
    int _1124 = _1122 + 368;
    float _1126 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1090);
    int _1128 = _1046 & 3;
    bool _1130 = _1128 != 0;
    float _1132 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1134 = _1112 ? 0 : 1;
    uint _1136 = uint(int(uint(_1124) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    bool _1152 = uint(_1128) > 1u;
    out.m_64.x = _1120;
    out.m_64.y = _1114;
    int _1154 = ~_1116;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1162 = _1158;
    if (!_1010)
    {
        int _1164 = ~_1116;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    float _1170 = float(_928);
    int _1172 = ~_1134;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_984;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1184 = uint(_1128) >= 2u;
    float _1186 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1188 = _1176;
    if (!_1152)
    {
        int _1190 = ~_1134;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1198 = _1124 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = int(_914) + int(_1108);
    float _1218 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1220 = ~_471;
    int _1222 = _1220 + 1;
    int _1224 = _1184 ? 0 : 1;
    bool _1226 = _1128 != 3;
    int _1228 = _1222 * _1216;
    int _1230 = _1228 + _668;
    int _1232 = abs(_1102);
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = float(_1232);
    bool _1242 = uint(_1230) >= uint(_471);
    float _1244 = float(_1168);
    float _1246 = _1240 * _1170;
    int _1248 = abs(_1180);
    float _1250 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1252 = !_1242;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = _1246 * (-2.0);
    int _1258 = _1238;
    if (_1226)
    {
        int _1260 = ~_1224;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1270 = ~_1216;
    int _1272 = _1270 + _1254;
    int _1274 = _1272 + 1;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1278 = _1132 + _1276;
    float _1280 = float(_1248);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1266 + _1282;
    int _1286 = abs(_1194);
    out.m_66.x = _1218;
    out.m_66.y = _1196;
    out.m_66.z = _1268;
    out.m_66.w = _1160;
    bool _1288 = _1128 != 3;
    float _1290 = _1280 * _1244;
    int _1292 = ~_1286;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _471 * _1274;
    int _1300 = _1298 + _668;
    bool _1302 = !_1130;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = _1290 * (-2.0);
    int _1308 = abs(_1264);
    int _1310 = _1296 * as_type<int>(_1150);
    bool _1312 = !_722;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = in.m_68.x;
    float _1318 = in.m_68.y;
    float _1320 = in.m_68.z;
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1326 = _824 + _1324;
    bool _1328 = !_1288;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1322);
    int _1334 = abs(_1304);
    int _1336 = abs(_1330);
    float _1338 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    int _1340 = ~_1334;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1314);
    int _1348 = _1344 * as_type<int>(_1142);
    int _1350 = _1348 + _1310;
    bool _1352 = _1338 >= 0.0;
    float _1354 = _1284 * _1284;
    int _1356 = ~_1308;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1278, _1278, _1354);
    int _1364 = ~_1336;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    int _1370 = _1360 * as_type<int>(_1206);
    int _1372 = _1370 + _1350;
    int _1374 = ~_1346;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1326, _1326, _1362);
    int _1382 = _1368 * as_type<int>(_1214);
    int _1384 = _1382 + _1372;
    bool _1386 = !_604;
    int _1388 = _1386 ? _1300 : (-1);
    float _1390 = _1362;
    if (_1352)
    {
        out.m_53.x = 0.0;
    }
    if (_1352)
    {
        _1390 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1392 = _1390;
    int _1394 = _1384 * _1378;
    float _1396 = rsqrt(_1380);
    float _1398 = fma(_812, _1306, _812);
    float _1400 = fma(_1306, _1316, _1316);
    int _1402 = _1388 * _1346;
    int _1404 = _1402 + _1394;
    float _1406 = _465 + (-0.5);
    int _1408 = as_type<int>(_1392);
    if (_1352)
    {
        float _1410 = _1392 * 5.0;
        _1408 = as_type<int>(_1410);
    }
    int _1412 = _1408;
    float _1414 = fma(_1256, _1318, _1318);
    float _1416 = float(_1404);
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1400);
    bool _1420 = !_992;
    int _1422 = _1420 ? 0 : 1;
    if (_1352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4840 = as_type<float>(_1412);
        out.gl_Position.z = _4840;
    }
    float _1424 = fma(_956, _1256, _956);
    float _1426 = _467 + (-0.5);
    float _1428 = fma(_1398, _886, _1418);
    out.m_70.x = _1416;
    float _1430 = _1284 * _1396;
    float _1432 = _1278 * _1396;
    int _1434 = abs(_1422);
    if (_1352)
    {
        return out;
    }
    float _1436 = -_1430;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _1440 = _1326 * _1396;
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1446 = float(_1000);
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1438 + _1448;
    float _1452 = -_1440;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1458 = _1444 + _1456;
    float _1460 = float(_1434);
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1466 = _1454 + _1464;
    float _1468 = -_1430;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1472 = _838 + _465;
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1462);
    float _1476 = _1428 * 0.15915493667125701904296875;
    float _1478 = _1460 * _1446;
    float _1480 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1474);
    float _1484 = -_1432;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1488 = _1470 * _1470;
    float _1490 = _1472 + (-1.0);
    bool _1492 = _1482 >= 0.0;
    float _1494 = _1478 * (-2.0);
    float _1496 = fma(_1424, _886, _1480);
    float _1498 = fma(_1486, _1486, _1488);
    float _1500 = -_1440;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1506 = _838 + (-0.5);
    float _1508 = fma(_1494, _1320, _1320);
    float _1510 = _1496 * 0.15915493667125701904296875;
    float _1512 = fma(_1502, _1502, _1498);
    float _1514 = fma(_1504, _1494, _1504);
    float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1508);
    float _1518 = _1476 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1524 = as_type<int>(_1508);
    float _1526 = _1466;
    if (_1492)
    {
        _1522 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1528 = _1522;
    float _1530 = fma(_1514, _886, _1516);
    if (_1492)
    {
        out.m_53.x = 0.0;
    }
    if (_1492)
    {
        float _1532 = _1528 * 5.0;
        _1524 = as_type<int>(_1532);
    }
    int _1534 = _1524;
    float _1536 = _1530 * 0.15915493667125701904296875;
    float _1538 = _1476 * 6.283185482025146484375;
    float _1540 = cos(_1538);
    if (_1492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5049 = as_type<float>(_1534);
        out.gl_Position.z = _5049;
    }
    float _1542 = _1510 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = sqrt(_1512);
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    if (_1492)
    {
        return out;
    }
    float _1552 = _1536 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    float _1556 = _1396 * _1546;
    float _1558 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1562 = _1540 * _1550;
    float _1564 = _1540 * _1544;
    float _1566 = _1556 * _1558;
    float _1568 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1570 = _1536 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1576 = _1560 * _1566;
    float _1578 = _1520 * _1544;
    float _1580 = _1556 * _1568;
    float _1582 = _1520 * _1550;
    bool _1584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1592 = _1588 || _1590;
    float _1594 = _1540 * _1554;
    float _1596 = _1550 * _1554;
    float _1598 = _1520 * _1554;
    float _1600 = _1544 * _1554;
    float _1602 = _1574 * _1580;
    float _1604 = _1594 * _1576;
    float _1606 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1608 = _1606 * 0.5;
    float _1610 = _1598 * _1576;
    float _1612 = fma(_1572, _1562, _1578);
    float _1614 = -_1582;
    float _1616 = fma(_1572, _1564, _1614);
    float _1618 = -_1576;
    float _1620 = _1572 * _1618;
    float _1622 = -_1564;
    float _1624 = fma(_1572, _1582, _1622);
    float _1626 = fma(_1612, _1602, _1604);
    float _1628 = fma(_1572, _1578, _1562);
    float _1630 = fma(_1596, _1602, _1620);
    float _1632 = fma(_1624, _1602, _1610);
    float _1634 = fma(_1616, _1608, _1626);
    float _1636 = fma(_1600, _1608, _1630);
    float _1638 = fma(_1628, _1608, _1632);
    float _1640 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1646 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1648 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1644);
    float _1650 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1654 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1656 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1658 = _824 + _1652;
    float _1660 = _1132 + _1654;
    float _1662 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1656);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1666 = _1658 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1674 = _1666 * _1666;
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1678 = fma(_1670, _1670, _1674);
    float _1680 = _1266 + _1676;
    float _1682 = sqrt(_1678);
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1686 = _1674;
    float _1688 = _1636;
    float _1690 = _1660;
    float _1692 = _1634;
    float _1694 = _1598;
    if (!_1684)
    {
        _1686 = _1660;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (!_1684)
    {
        _1688 = _1658;
    }
    float _1700 = _1688;
    float _1702 = _1700;
    if (!_1684)
    {
        _1690 = _1680;
    }
    float _1704 = _1690;
    bool _1706 = !_1684;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1682 + _1712;
        float _1716 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1678);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1680, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1670, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1666, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1698 = _1742;
        _1708 = _1738;
        _1702 = _1744;
        _1692 = _1740;
    }
    float _1746 = _1698;
    float _1748 = _1708;
    float _1750 = _1702;
    float _1752 = _1692;
    float _1754 = -_1432;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1430;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1762 = -_1440;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _1766 = _1760;
    float _1768 = _1756;
    float _1770 = _1764;
    float _1772 = _1752;
    if (!_1592)
    {
        float _1774 = _1450 * _1450;
        float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1778 = -_824;
        float _1780 = _1778 + _1750;
        float _1782 = -_1132;
        float _1784 = _1782 + _1746;
        float _1786 = fma(_1458, _1458, _1774);
        float _1788 = -_1266;
        float _1790 = _1788 + _1748;
        float _1792 = fma(_1466, _1466, _1786);
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = sqrt(_1792);
        float _1798 = 1.0 / _1556;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1802 = precise::min(_1796, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1804 = _1802 * _1776;
        float _1806 = _1804 * _1798;
        float _1808 = _1800 * _1806;
        float _1810 = _1780 * _1806;
        float _1812 = fma(_1784, _1808, _1444);
        float _1814 = fma(_1790, _1808, _1438);
        float _1816 = fma(_1800, _1810, _1454);
        _1766 = _1814;
        _1768 = _1812;
        _1770 = _1816;
        _1772 = _1798;
    }
    float _1818 = _1766;
    float _1820 = _1768;
    float _1822 = _1770;
    float _1824 = _1772;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1828 = _1818 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = _1820 + _1830;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1822 + _1834;
    float _1838 = _1828 * _1828;
    float _1840 = fma(_1832, _1832, _1838);
    float _1842 = fma(_1836, _1836, _1840);
    float _1844 = rsqrt(_1842);
    float _1846 = sqrt(_1842);
    float _1848 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1832 * _1848;
    float _1852 = _1836 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1836;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1824;
    float _1876 = _1828;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = _1884;
    if (_1862)
    {
        float _1888 = _1866 * _1880;
        _1872 = _1888;
    }
    float _1890 = _1872;
    if (_1862)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1844;
    float _1898 = _1894;
    if (_1862)
    {
        float _1900 = _1894 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1896 = _1902;
    }
    float _1904 = _1896;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1880;
    float _1912 = _1908;
    if (_1862)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1848;
    float _1922 = -_1908;
    float _1924 = fma(_1828, _1920, _1922);
    if (_1862)
    {
        float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1926;
    }
    float _1928 = _1876;
    float _1930 = _1928;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1932 = _1898;
    float _1934 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1936 = _1904;
    float _1938 = _1932;
    if (_1862)
    {
        float _1940 = fma(_1904, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1940;
    }
    float _1942 = _1526;
    float _1944 = _1942;
    if (!_1862)
    {
        _1936 = _1924;
    }
    float _1946 = _1936;
    float _1948 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1934);
    float _1950 = _1946;
    float _1952 = _1918;
    if (_1862)
    {
        float _1954 = _1918 + (-1.0);
        _1912 = _1954;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1862)
    {
        float _1960 = _1884 * _1942;
        _1930 = _1960;
    }
    float _1962 = _1930;
    if (!_1862)
    {
        _1944 = _1850;
    }
    float _1964 = _1944;
    float _1966 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1968 = _1964;
    if (_1862)
    {
        float _1970 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _1970;
    }
    float _1972 = _1958;
    if (_1862)
    {
        float _1974 = _1850 * _1962;
        _1968 = _1974;
    }
    float _1976 = _1968;
    if (!_1862)
    {
        _1886 = _1854;
    }
    float _1978 = _1886;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1978;
    if (_1862)
    {
        float _1984 = fma(_1924, _1918, _1972);
        _1950 = _1984;
    }
    float _1986 = _1950;
    if (!_1862)
    {
        _1952 = _1852;
    }
    float _1988 = _1952;
    float _1990 = _1988;
    if (_1862)
    {
        float _1992 = _1852 * _1962;
        _1990 = _1992;
    }
    float _1994 = _1990;
    if (_1862)
    {
        float _1996 = _1976 * _1976;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1862)
    {
        float _2000 = _1994 * _1994;
        _1938 = _2000;
    }
    float _2002 = _1938;
    float _2004 = fma(_1986, _1986, _1998);
    float _2006 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2008 = _2004 + _2002;
    float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2006);
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2014 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2012);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = rsqrt(_2008);
    float _2020 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = -_2016;
    float _2026 = _2024 + 1.0;
    float _2028 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2030 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2032 = floor(_2022);
    float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2040 = -_2034;
    float _2042 = fma(_2040, _2030, 1.0);
    float _2044 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = abs(_2026);
    float _2050 = log2(_2048);
    float _2052 = _2018 * _1976;
    float _2054 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2056 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2058 = _2018 * _1994;
    float _2060 = _2018 * _1986;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2054);
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2068 = floor(_2038);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2078 = -_2058;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2082 = -_2032;
    float _2084 = _2022 + _2082;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2076);
    float _2088 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2090 = fma(_2080, -0.5, 0.5);
    float _2092 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2094 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2086);
    float _2096 = exp2(_2088);
    float _2098 = fma(_2080, 0.5, 0.5);
    float _2100 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2094);
    float _2102 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2092);
    float _2104 = -_2068;
    float _2106 = _2038 + _2104;
    float _2108 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = _2060 + 1.0;
    float _2112 = 1.0 / _2100;
    float _2114 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2102);
    float _2118 = fma(_2098, _2108, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2122 = log2(_2042);
    float _2124 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2120);
    float _2126 = -_2060;
    float _2128 = fma(_2096, _2110, _2126);
    float _2130 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2132 = sqrt(_2090);
    float _2134 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2136 = _2130 * _2112;
    float2 _6020 = float2(_2084, _2106);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _2140 = fma(_2098, _2118, 1.570728778839111328125);
    float _2142 = _2134 * _2112;
    float _2144 = fma(_2136, 0.5, 0.5);
    float _2146 = fma(_2128, 0.5, 0.5);
    float _2148 = _2122 * 0.693147182464599609375;
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2154 = _2132 * 0.636619746685028076171875;
    float3 _6054 = float3(_2144, _2150, _2152);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).x;
    float3 _6065 = float3(_2144, _2150, _2152);
    float4 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6065, float3(0.0), isnan(_6065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6065, float3(0.0), isnan(_6065)), level(0.0)).xyzw;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2159.w;
    float _2169 = -_2140;
    float _2171 = fma(_2154, _2169, 1.0);
    float2 _6086 = float2(_2171, _2146);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6086, float2(0.0), isnan(_6086)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6086, float2(0.0), isnan(_6086)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2187 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2189 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2201 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2185);
    float _2203 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2205 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2199);
    float _2207 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2209 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2211 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2213 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2215 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2187);
    float _2217 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2219 = 1.0 / _2211;
    float _2221 = _2213 + _2211;
    float _2223 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2225 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2227 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2229 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2203);
    float _2231 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = -_1572;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2237 = _2221 * _2219;
    float _2239 = _2237 * 0.5;
    float _2241 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2235);
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2245 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2243);
    float _2247 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2209);
    float _2249 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2251 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    float _2253 = 1.0 / _2245;
    float _2255 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = -_1572;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2249);
    float _2261 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2247);
    float _2263 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2229);
    float _2265 = -_1572;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2269 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2251);
    float _2271 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2275 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2277 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2279 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2273);
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2275);
    float _2283 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2259);
    float _2285 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2267);
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2289 = _2253 * _2287;
    float _2291 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2281);
    float _2293 = _2281;
    float _2295 = _2217;
    float _2297 = _2100;
    float _2299 = _2134;
    if (!_2197)
    {
        _1694 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2301 = _1694;
    float _2303 = _2217 * _2283;
    float _2305 = abs(_2289);
    float _2307 = log2(_2305);
    float _2309 = _2217 * _2241;
    float _2311 = _2217 * _2285;
    float _2313 = _2301;
    if (!_2197)
    {
        float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2317 = _2301 + _2315;
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (!_2197)
    {
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = _2289 + _2321;
        _2293 = _2323;
    }
    float _2325 = _2293;
    float _2327 = fma(_2225, _2263, _2309);
    if (_2197)
    {
        _2295 = 1.0;
    }
    float _2329 = _2295;
    float _2331 = _2074;
    float _2333 = _2329;
    if (!_2197)
    {
        float _2335 = 1.0 / _2319;
        _2331 = _2335;
    }
    float _2337 = _2331;
    float _2339 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2341 = exp2(_2339);
    if (!_2197)
    {
        float _2343 = _2325 * _2337;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2333 = _2345;
    }
    float _2347 = _2333;
    bool _2349 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2351 = isnan(_1846);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2357 = _2353 || _2355;
    float _2359 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    float _2365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2279);
    float _2367 = fma(_2225, _2261, _2303);
    float _2369 = fma(_2361, -2.0, 3.0);
    float _2371 = _2361 * _2361;
    float _2373 = _2100 * 0.5;
    float _2375 = fma(_2225, _2269, _2311);
    float _2377 = _2371 * _2369;
    float _2379 = fma(_2134, -0.5, _2373);
    float _2381 = in.m_72.x;
    float _2383 = _2363 + _2367;
    float _2385 = -_2377;
    float _2387 = _2385 + 1.0;
    float _2389 = _2365 + _2327;
    float _2391 = _2291 + _2375;
    float _2393 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2377);
    float _2395 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2223);
    float _2397 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _2289 <= 8000.0;
    bool _2401 = isnan(_2289);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2130 + _2100;
    float _2413 = _2395 + _2100;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2134;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2100;
    float _2415 = exp2(_2397);
    float _2417 = _2409 * _2393;
    float _2419 = _2413 * 0.5;
    float _2421 = _2411 * 0.5;
    out.m_74.x = _2383;
    out.m_74.y = _2389;
    out.m_74.z = _2391;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2421;
    out.m_76.y = _2379;
    out.m_76.z = _2419;
    out.m_76.w = _2100;
    float _2425 = _2395;
    if (!_2357)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2427 = _2297;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2357)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2433 = _2425;
    float _2435 = -_2415;
    float _2437 = _2435 + 1.0;
    float _2439 = _2433;
    float _2441 = _2433;
    if (!_2357)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2443 = _2299;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = -_2138;
    float _2449 = _2447 + 1.0;
    float _2451 = _2449 * _2423;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = -_2453;
    float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2459 = _2457 * _2381;
    float _2461 = _2445 * _2156;
    float _2463 = -_2445;
    float _2465 = _2463 + 1.0;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2469 = _2167 * _2461;
    float _2471 = _2167 * _2465;
    out.m_78.x = _2467;
    float _2473 = _2181 * _2461;
    float _2475 = fma(_2177, _2469, _2161);
    float _2477 = fma(_2179, _2469, _2163);
    float _2479 = _2163;
    float _2481 = _2161;
    float _2483 = _2461;
    float _2485 = _2443;
    float _2487 = _2443;
    if (!_2357)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2489 = _2479;
    float _2491 = fma(_2167, _2473, _2165);
    float _2493 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = _2489;
    float _2497 = _2489;
    if (!_2357)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2357)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2505 = _2483;
    out.m_80.x = _2475;
    out.m_80.y = _2477;
    out.m_80.z = _2491;
    out.m_80.w = _2471;
    bool _2507 = !_2357;
    float _2509 = _2505;
    float _2511 = _2505;
    if (!_2507)
    {
        bool _2513 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2515 = isnan(_1846);
        bool _2517 = _2513 || _2515;
        bool _2519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2521 = _2517 || _2519;
        if (!_2521)
        {
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2525 = _1846 + _2523;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = 1.0 / _2529;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2553 = _2525 * _2535;
            float _2555 = precise::clamp(_2553, 0.0, 1.0);
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = fma(_2555, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2563 = fma(_2555, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2555, _2539, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2567 = fma(_2555, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2569 = fma(_2555, _2547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2571 = fma(_2555, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2503 = _2565;
            _2487 = _2569;
            _2497 = _2561;
            _2441 = _2567;
            _2431 = _2563;
            _2511 = _2571;
            _2573 = true;
        }
        else
        {
            bool _2575 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2577 = isnan(_1846);
            bool _2579 = _2575 || _2577;
            bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2583 = _2579 || _2581;
            if (!_2583)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2585 = _2495;
            _2497 = _2585;
            if (!_2583)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2587 = _2501;
            _2503 = _2587;
            if (!_2583)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2589 = _2429;
            _2431 = _2589;
            if (!_2583)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2591 = _2439;
            _2441 = _2591;
            if (!_2583)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2593 = _2485;
            _2487 = _2593;
            if (!_2583)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2595 = _2509;
            bool _2597 = !_2583;
            _2511 = _2595;
            if (!_2597)
            {
                bool _2599 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2601 = isnan(_1846);
                bool _2603 = _2599 || _2601;
                bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2607 = _2603 || _2605;
                if (!_2607)
                {
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2611 = _1846 + _2609;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = 1.0 / _2615;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2639 = _2611 * _2621;
                    float _2641 = precise::clamp(_2639, 0.0, 1.0);
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = fma(_2641, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2649 = fma(_2641, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2641, _2625, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2653 = fma(_2641, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2655 = fma(_2641, _2633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2657 = fma(_2641, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2503 = _2651;
                    _2487 = _2655;
                    _2497 = _2647;
                    _2441 = _2653;
                    _2431 = _2649;
                    _2511 = _2657;
                    _2573 = true;
                }
                else
                {
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2573 = false;
    float _2659 = _2503;
    float _2661 = _2487;
    float _2663 = _2497;
    float _2665 = _2441;
    float _2667 = _2431;
    float _2669 = _2511;
    float _2671 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2673 = fma(_2389, -0.5, 0.5);
    float _2675 = precise::clamp(_2673, 0.0, 1.0);
    float _2677 = -_2659;
    float _2679 = _2677 + _2661;
    float _2681 = -_2663;
    float _2683 = _2681 + _2665;
    out.m_82.x = 0.0;
    float _2685 = fma(_2675, _2679, _2659);
    float _2687 = -_2667;
    float _2689 = _2687 + _2669;
    float _2691 = fma(_2675, _2683, _2663);
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2697 = fma(_2675, _2689, _2667);
    out.m_53.x = _2671;
    float _2699 = fma(_2691, 0.298911988735198974609375, _2693);
    bool _2701 = _2347 > 0.0;
    bool _2703 = isnan(_2347);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2697, 0.114477999508380889892578125, _2699);
    float _2713 = -_2711;
    float _2715 = _2691 + _2713;
    float _2717 = -_2711;
    float _2719 = _2685 + _2717;
    float _2721 = -_2711;
    float _2723 = _2697 + _2721;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2727 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2729 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    bool _2731 = !_2695;
    if (!_2731)
    {
        float _2733 = -_1818;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2737 = -_1820;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2741 = -_1822;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2745 = _2735 * _2735;
        float _2747 = fma(_2739, _2739, _2745);
        float _2749 = fma(_2743, _2743, _2747);
        float _2751 = sqrt(_2749);
        float _2753 = rsqrt(_2749);
        float _2755 = -_2751;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2761 = precise::clamp(_2759, 0.0, 1.0);
        float _2763 = _2739 * _2753;
        float _2765 = _2735 * _2753;
        float _2767 = abs(_2761);
        float _2769 = log2(_2767);
        float _2771 = _2743 * _2753;
        float _2773 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2775 = _2389 * _2765;
        float _2777 = -_2765;
        float _2779 = -_2773;
        float _2781 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2779);
        float _2783 = fma(_2383, _2763, _2775);
        float _2785 = -_2771;
        float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2781);
        float _2789 = fma(_2391, _2771, _2783);
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2795 = _2787 + _2793;
        float _2797 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2799 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = exp2(_2797);
        float _2805 = _2803 * _2801;
        float _2807 = _2791 * _2805;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2813 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2809;
        out.m_82.y = _2811;
        out.m_82.z = _2813;
    }
    out.m_84.x = _2725;
    out.m_84.y = _2727;
    out.m_84.z = _2729;
    if (_2709)
    {
        return out;
    }
    float _2815 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2815;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2573 = false;
    bool _457 = false;
    bool _341 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = in.m_48.w;
    float _102 = trunc(_98);
    int _105 = int(_102);
    float _107 = -_100;
    float _109 = _107 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _109;
    bool _113 = _105 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_105);
    float _119 = _109;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _115;
    if (!_113)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_113)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2884 = as_type<float>(_127);
        out.gl_Position.z = _2884;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _131 = _100 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_100);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = float(_105);
    bool _143 = _109 >= _141;
    bool _145 = !_139;
    bool _147 = _143 || _145;
    if (_147)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _117;
    if (_147)
    {
        out.m_53.x = 0.0;
    }
    if (_147)
    {
        float _151 = _149 * 5.0;
        _129 = as_type<int>(_151);
    }
    int _153 = _129;
    if (_147)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2939 = as_type<float>(_153);
        out.gl_Position.z = _2939;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = 1.0 / _141;
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _161 = as_type<int>(_155) & 1;
    bool _163 = _161 != 0;
    int _165 = as_type<int>(_155) & 2;
    bool _167 = _165 != 0;
    float _169 = _109 * _157;
    bool _171 = !_163;
    float _173 = _171 ? (-0.5) : 0.5;
    bool _175 = !_167;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_159;
    float _197;
    if (!_179)
    {
        float _181 = in.m_58.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _109);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        _197 = _169;
    }
    _199 = false;
    float _201 = _197;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    bool _219 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _221 = isnan(_201);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -_217;
    float _241 = _239 + 1.0;
    float _243 = 1.0 / _233;
    bool _245 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _247 = isnan(_201);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = _229 * _241;
    float _259 = -_229;
    float _261 = _259 + 1.0;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = _255 * _261;
    float _267 = 1.0 / _237;
    float _269 = -_255;
    float _271 = _269 + 1.0;
    float _273 = _205 * _243;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _201 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = fma(_281, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _289 = fma(_285, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _291 = _277 * _267;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _297 = _287 * _265;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _303 = _289 * _265;
    float _305 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _307 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].x, _297);
    float _309 = fma(_301, _291, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _311 = fma(_271, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _313 = fma(_305, _257, _307);
    float _315 = fma(_309, _257, _311);
    float _317 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _313);
    float _319 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _315);
    bool _321 = !_263;
    float _339;
    if (!_321)
    {
        float _323 = in.m_58.x;
        float _325 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _327 = _323 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[11].x, _109);
        float _331 = _329 * _325;
        float _333 = floor(_331);
        float _335 = -_333;
        float _337 = _331 + _335;
        _339 = _337;
        _341 = true;
    }
    else
    {
        _339 = _169;
    }
    _341 = false;
    float _343 = _339;
    float _345 = in.m_60.x;
    float _347 = in.m_60.y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _351 = _343 + _349;
    bool _353 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _355 = isnan(_343);
    bool _357 = _353 || _355;
    bool _359 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _361 = _357 || _359;
    float _363 = float(_361);
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _365;
    float _369 = -_363;
    float _371 = _369 + 1.0;
    bool _373 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _375 = 1.0 / _367;
    float _377 = _319 * _347;
    float _379 = _351 * _375;
    bool _381 = _343 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _383 = isnan(_343);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _401;
    float _405 = _391 * _371;
    float _407 = fma(_395, _379, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _409 = fma(_399, _379, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _411 = fma(_403, _379, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = _407 * _405;
    float _419 = _409 * _405;
    float _421 = _411 * _405;
    float _423 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].x, _417);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].y, _419);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[107].z, _421);
    float _429 = _317 * _345;
    float _431 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].x, _423);
    float _433 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].y, _425);
    float _435 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[108].z, _427);
    bool _437 = !_373;
    float _455;
    if (!_437)
    {
        float _439 = in.m_58.x;
        float _441 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _443 = _439 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _445 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[11].y, _109);
        float _447 = _445 * _441;
        float _449 = floor(_447);
        float _451 = -_449;
        float _453 = _447 + _451;
        _455 = _453;
        _457 = true;
    }
    else
    {
        _455 = _169;
    }
    _457 = false;
    float _459 = _455;
    float _461 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _463 = int(_461);
    float _465 = in.m_58.x;
    float _467 = in.m_58.y;
    float _469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _471 = int(_469);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = float(_463);
    float _481 = 1.0 / _479;
    float _483 = float(uint(_471));
    int _485 = ~_471;
    int _487 = _485 + 1;
    int _489 = ~_471;
    int _491 = _489 + 1;
    float _493 = 1.0 / _483;
    int _495 = ~_471;
    int _497 = _495 + 1;
    float _499 = _481 * _109;
    float _501 = trunc(_499);
    int _503 = int(_501);
    int _505 = as_type<int>(_493) + (-2);
    float _507 = float(uint(_503));
    float _509 = as_type<float>(_505) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    int _518 = _487 * int(_516);
    int _520 = _518 + _503;
    float _522 = float(uint(_520));
    float _524 = as_type<float>(_505) * _522;
    int _526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _528 = _526 != 0;
    float _530 = trunc(_524);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    bool _536 = !_528;
    float _538 = _536 ? 7.345489978790283203125 : 1.0;
    float _540 = _538 * _465;
    float _542 = floor(_540);
    int _544 = int(_516) + int(_534);
    float _546 = float(_471);
    float _548 = float(_503);
    int _550 = _491 * _544;
    int _552 = _550 + _503;
    bool _554 = _548 >= _546;
    bool _556 = isnan(_548);
    bool _558 = _554 || _556;
    bool _560 = isnan(_546);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = _546 * _109;
    bool _568 = uint(_552) >= uint(_471);
    float _570 = -_542;
    float _572 = _540 + _570;
    float _574 = _566 * _157;
    float _576 = trunc(_564);
    int _578 = int(_576);
    bool _580 = !_568;
    int _582 = _580 ? 0 : (-1);
    float _584 = _572 * _546;
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _588 = _586 != 0;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _596 = _594 != 0;
    int _598 = ~_544;
    int _600 = _598 + _582;
    int _602 = _600 + 1;
    bool _604 = _471 == 0;
    float _606 = trunc(_584);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _612 = _610 != 0;
    int _614 = _471 * _602;
    int _616 = _614 + _503;
    int _618 = _471 + (-1);
    bool _620 = !_592;
    int _622 = _620 ? 0 : 1;
    bool _624 = !_604;
    int _626 = _624 ? _616 : (-1);
    float _628 = trunc(_574);
    int _630 = int(_628);
    int _632 = ~_578;
    int _634 = _632 + 1;
    int _636 = _634 + 1;
    bool _638 = !_588;
    int _640 = _638 ? 0 : 1;
    bool _642 = !_612;
    int _644 = _642 ? 0 : 1;
    int _646 = _626 * _636;
    int _648 = abs(_622);
    int _650 = abs(_640);
    int _652 = _578 * _618;
    int _654 = _652 + _646;
    int _656 = abs(_644);
    float _658 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _660 = !_596;
    int _662 = _660 ? 0 : 1;
    int _664 = _654 * _648;
    int _666 = _608 * _656;
    int _668 = _666 + _503;
    int _670 = abs(_662);
    float _672 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _674 = log2(_672);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _678 = _676 != 0;
    int _680 = _630 * _650;
    int _682 = _680 + _664;
    float _684 = in.m_46.x;
    float _686 = in.m_46.y;
    float _688 = in.m_46.z;
    bool _690 = !_678;
    int _692 = _690 ? 0 : 1;
    int _694 = _668 * _670;
    int _696 = _694 + _682;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _702 = abs(_692);
    float _704 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _706 = fma(_658, -2.0, _473);
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _710 = _608 * _702;
    int _712 = _710 + _696;
    float _714 = -_708;
    float _716 = fma(_704, 2.0, _714);
    float _718 = 1.0 / _700;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _728 = _726 != 0;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = _674 * _109;
    float _740 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = _686 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _686 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _746 = _686 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = float(uint(_712));
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _752 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _477 * _718;
    float _758 = as_type<float>(_505) * _748;
    float _760 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _762 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[5].x, _744);
    float _764 = fma(_684, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    out.m_62.x = _740;
    out.m_62.y = _752;
    out.m_62.z = _754;
    out.m_62.w = _750;
    float _766 = _467 + _465;
    float _768 = trunc(_758);
    float _770 = precise::max(_768, 0.0);
    uint _772 = uint(_770);
    float _774 = _465 * 2.0;
    float _776 = _766 + (-1.0);
    float _778 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _706);
    bool _780 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _782 = isnan(1.0);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _788 = _784 || _786;
    float _790 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[5].z, _762);
    float _792 = exp2(_738);
    bool _794 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _796 = isnan(0.0);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _802 = _798 || _800;
    float _804 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[6].z, _764);
    bool _806 = _465 > 0.5;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _810 = 1.0 + _808;
    float _812 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _814 = -_109;
    float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[76].x, _716);
    int _818 = _497 * int(_772);
    int _820 = _818 + _712;
    float _822 = floor(_774);
    float _824 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _826 = -_173;
    int _828 = _806 ? as_type<int>(_826) : as_type<int>(_173);
    float _830 = float(uint(_820));
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = 1.0 / _810;
    float _838 = in.m_58.z;
    float _840 = as_type<float>(_505) * _830;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _846 = _467 * 2.0;
    float _848 = _802 ? _834 : 0.0;
    float _850 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _842);
    float _852 = trunc(_840);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    float _858 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _844);
    bool _860 = _822 > 0.0;
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    float _864 = float(uint(_668));
    float _866 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    bool _868 = _822 >= 0.0;
    bool _870 = isnan(_822);
    bool _872 = _868 || _870;
    bool _874 = isnan(0.0);
    bool _876 = _872 || _874;
    float _878 = -_862;
    float _880 = _878 + 1.0;
    float _882 = floor(_846);
    if (_788)
    {
        float _884 = _848 * _836;
        _119 = _884;
    }
    float _886 = _119;
    bool _888 = _467 > 0.5;
    float _890 = as_type<float>(_505) * _864;
    int _892 = ~_471;
    int _894 = _892 + 1;
    float _896 = -_866;
    float _898 = _896 + 1.0;
    int _900 = _876 ? 0 : 1;
    int _902 = int(_772) + int(_856);
    float _904 = _838 * 2.0;
    float _906 = -_177;
    int _908 = _888 ? as_type<int>(_906) : as_type<int>(_177);
    float _910 = trunc(_890);
    float _912 = precise::max(_910, 0.0);
    uint _914 = uint(_912);
    int _916 = ~_900;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    int _922 = _920;
    if (!_860)
    {
        int _924 = ~_900;
        int _926 = _924 + 1;
        _922 = _926;
    }
    int _928 = _922;
    float _930 = _467 + _838;
    bool _932 = _882 > 0.0;
    bool _934 = _882 >= 0.0;
    bool _936 = isnan(_882);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    int _944 = _894 * _902;
    int _946 = _944 + _712;
    float _948 = floor(_904);
    float _950 = _930 + (-1.0);
    int _952 = _942 ? 0 : 1;
    bool _954 = uint(_946) >= uint(_471);
    float _956 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _958 = ~_471;
    int _960 = _958 + 1;
    bool _962 = !_954;
    int _964 = _962 ? 0 : (-1);
    int _966 = ~_952;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    int _972 = ~_902;
    int _974 = _972 + _964;
    int _976 = _974 + 1;
    bool _978 = !_728;
    float _980 = _978 ? _173 : as_type<float>(_828);
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _984 = _982 != 0;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _988 = _986 != 0;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _992 = _990 != 0;
    int _994 = _970;
    if (!_932)
    {
        int _996 = ~_952;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    int _1002 = _960 * int(_914);
    int _1004 = _1002 + _668;
    bool _1006 = !_734;
    float _1008 = _1006 ? _177 : as_type<float>(_908);
    bool _1010 = _948 > 0.0;
    bool _1012 = _948 >= 0.0;
    bool _1014 = isnan(_948);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan(0.0);
    bool _1020 = _1016 || _1018;
    int _1022 = _471 * _976;
    int _1024 = _1022 + _712;
    bool _1026 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1028 = isnan(_459);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = float(uint(_1004));
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1042 = _459 + _1040;
    bool _1044 = !_604;
    int _1046 = _1044 ? _1024 : (-1);
    float _1048 = -_1036;
    float _1050 = _1048 + 1.0;
    bool _1052 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1054 = isnan(_459);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = as_type<float>(_505) * _1038;
    int _1066 = _1046 >> 31;
    float _1068 = fma(_756, _1042, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1070 = _1062 * _1050;
    float _1072 = fma(_688, (*spvDescriptorSet0.vp_c10)._m0[4].z, _760);
    int _1074 = _1066 & 3;
    float _1076 = _980 + 0.5;
    float _1078 = _1068 * _1070;
    float _1080 = -_1062;
    float _1082 = _1080 + 1.0;
    int _1084 = _1046 + _1074;
    float _1086 = _1008 + (-0.5);
    float _1088 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[80].x, _816);
    float _1090 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1078);
    int _1092 = _1084 >> 2;
    float _1094 = -_1086;
    float _1096 = -_778;
    float _1098 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1096);
    bool _1100 = !_988;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = trunc(_1064);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    int _1110 = _1046 & 3;
    bool _1112 = _1110 != 0;
    float _1114 = fma(_1008, _898, _1098);
    int _1116 = _1020 ? 0 : 1;
    float _1118 = -_880;
    float _1120 = fma(_980, _1118, _1088);
    int _1122 = _1092 << 4;
    int _1124 = _1122 + 368;
    float _1126 = fma(_1036, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1090);
    int _1128 = _1046 & 3;
    bool _1130 = _1128 != 0;
    float _1132 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1134 = _1112 ? 0 : 1;
    uint _1136 = uint(int(uint(_1124) >> uint(2)));
    uint _1138 = uint(int(uint(int(_1136)) >> uint(2)));
    int _1140 = int(_1136) & 3;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[int(_1138)][_1140];
    int _1144 = int(_1136) + 1;
    uint _1146 = uint(int(uint(_1144) >> uint(2)));
    int _1148 = _1144 & 3;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[int(_1146)][_1148];
    bool _1152 = uint(_1128) > 1u;
    out.m_64.x = _1120;
    out.m_64.y = _1114;
    int _1154 = ~_1116;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1162 = _1158;
    if (!_1010)
    {
        int _1164 = ~_1116;
        int _1166 = _1164 + 1;
        _1162 = _1166;
    }
    int _1168 = _1162;
    float _1170 = float(_928);
    int _1172 = ~_1134;
    int _1174 = _1172 + 1;
    int _1176 = _1174 + 1;
    bool _1178 = !_984;
    int _1180 = _1178 ? 0 : 1;
    float _1182 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1184 = uint(_1128) >= 2u;
    float _1186 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1188 = _1176;
    if (!_1152)
    {
        int _1190 = ~_1134;
        int _1192 = _1190 + 1;
        _1188 = _1192;
    }
    int _1194 = _1188;
    float _1196 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1198 = _1124 + 8;
    uint _1200 = uint(int(uint(_1198) >> uint(2)));
    uint _1202 = uint(int(uint(int(_1200)) >> uint(2)));
    int _1204 = int(_1200) & 3;
    float _1206 = (*spvDescriptorSet0.vp_c9)._m0[int(_1202)][_1204];
    int _1208 = int(_1200) + 1;
    uint _1210 = uint(int(uint(_1208) >> uint(2)));
    int _1212 = _1208 & 3;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[int(_1210)][_1212];
    int _1216 = int(_914) + int(_1108);
    float _1218 = _1186 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1220 = ~_471;
    int _1222 = _1220 + 1;
    int _1224 = _1184 ? 0 : 1;
    bool _1226 = _1128 != 3;
    int _1228 = _1222 * _1216;
    int _1230 = _1228 + _668;
    int _1232 = abs(_1102);
    int _1234 = ~_1224;
    int _1236 = _1234 + 1;
    int _1238 = _1236 + 1;
    float _1240 = float(_1232);
    bool _1242 = uint(_1230) >= uint(_471);
    float _1244 = float(_1168);
    float _1246 = _1240 * _1170;
    int _1248 = abs(_1180);
    float _1250 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1252 = !_1242;
    int _1254 = _1252 ? 0 : (-1);
    float _1256 = _1246 * (-2.0);
    int _1258 = _1238;
    if (_1226)
    {
        int _1260 = ~_1224;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = _790 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1268 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1270 = ~_1216;
    int _1272 = _1270 + _1254;
    int _1274 = _1272 + 1;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1278 = _1132 + _1276;
    float _1280 = float(_1248);
    float _1282 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1284 = _1266 + _1282;
    int _1286 = abs(_1194);
    out.m_66.x = _1218;
    out.m_66.y = _1196;
    out.m_66.z = _1268;
    out.m_66.w = _1160;
    bool _1288 = _1128 != 3;
    float _1290 = _1280 * _1244;
    int _1292 = ~_1286;
    int _1294 = _1292 + 1;
    int _1296 = _1294 + 1;
    int _1298 = _471 * _1274;
    int _1300 = _1298 + _668;
    bool _1302 = !_1130;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = _1290 * (-2.0);
    int _1308 = abs(_1264);
    int _1310 = _1296 * as_type<int>(_1150);
    bool _1312 = !_722;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = in.m_68.x;
    float _1318 = in.m_68.y;
    float _1320 = in.m_68.z;
    float _1322 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1326 = _824 + _1324;
    bool _1328 = !_1288;
    int _1330 = _1328 ? 0 : (-1);
    float _1332 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1322);
    int _1334 = abs(_1304);
    int _1336 = abs(_1330);
    float _1338 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1332);
    int _1340 = ~_1334;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    int _1346 = abs(_1314);
    int _1348 = _1344 * as_type<int>(_1142);
    int _1350 = _1348 + _1310;
    bool _1352 = _1338 >= 0.0;
    float _1354 = _1284 * _1284;
    int _1356 = ~_1308;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1278, _1278, _1354);
    int _1364 = ~_1336;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    int _1370 = _1360 * as_type<int>(_1206);
    int _1372 = _1370 + _1350;
    int _1374 = ~_1346;
    int _1376 = _1374 + 1;
    int _1378 = _1376 + 1;
    float _1380 = fma(_1326, _1326, _1362);
    int _1382 = _1368 * as_type<int>(_1214);
    int _1384 = _1382 + _1372;
    bool _1386 = !_604;
    int _1388 = _1386 ? _1300 : (-1);
    float _1390 = _1362;
    if (_1352)
    {
        out.m_53.x = 0.0;
    }
    if (_1352)
    {
        _1390 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1392 = _1390;
    int _1394 = _1384 * _1378;
    float _1396 = rsqrt(_1380);
    float _1398 = fma(_812, _1306, _812);
    float _1400 = fma(_1306, _1316, _1316);
    int _1402 = _1388 * _1346;
    int _1404 = _1402 + _1394;
    float _1406 = _465 + (-0.5);
    int _1408 = as_type<int>(_1392);
    if (_1352)
    {
        float _1410 = _1392 * 5.0;
        _1408 = as_type<int>(_1410);
    }
    int _1412 = _1408;
    float _1414 = fma(_1256, _1318, _1318);
    float _1416 = float(_1404);
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1400);
    bool _1420 = !_992;
    int _1422 = _1420 ? 0 : 1;
    if (_1352)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4840 = as_type<float>(_1412);
        out.gl_Position.z = _4840;
    }
    float _1424 = fma(_956, _1256, _956);
    float _1426 = _467 + (-0.5);
    float _1428 = fma(_1398, _886, _1418);
    out.m_70.x = _1416;
    float _1430 = _1284 * _1396;
    float _1432 = _1278 * _1396;
    int _1434 = abs(_1422);
    if (_1352)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1436 = -_1430;
    float _1438 = fma(_1436, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1266);
    float _1440 = _1326 * _1396;
    float _1442 = -_1432;
    float _1444 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1132);
    float _1446 = float(_1000);
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1438 + _1448;
    float _1452 = -_1440;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[18].w, _824);
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1458 = _1444 + _1456;
    float _1460 = float(_1434);
    float _1462 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1466 = _1454 + _1464;
    float _1468 = -_1430;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1284);
    float _1472 = _838 + _465;
    float _1474 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1462);
    float _1476 = _1428 * 0.15915493667125701904296875;
    float _1478 = _1460 * _1446;
    float _1480 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1482 = fma(_1466, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1474);
    float _1484 = -_1432;
    float _1486 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1278);
    float _1488 = _1470 * _1470;
    float _1490 = _1472 + (-1.0);
    bool _1492 = _1482 >= 0.0;
    float _1494 = _1478 * (-2.0);
    float _1496 = fma(_1424, _886, _1480);
    float _1498 = fma(_1486, _1486, _1488);
    float _1500 = -_1440;
    float _1502 = fma(_1500, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1326);
    float _1504 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1506 = _838 + (-0.5);
    float _1508 = fma(_1494, _1320, _1320);
    float _1510 = _1496 * 0.15915493667125701904296875;
    float _1512 = fma(_1502, _1502, _1498);
    float _1514 = fma(_1504, _1494, _1504);
    float _1516 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1508);
    float _1518 = _1476 * 6.283185482025146484375;
    float _1520 = sin(_1518);
    float _1522 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    int _1524 = as_type<int>(_1508);
    float _1526 = _1466;
    if (_1492)
    {
        _1522 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1528 = _1522;
    float _1530 = fma(_1514, _886, _1516);
    if (_1492)
    {
        out.m_53.x = 0.0;
    }
    if (_1492)
    {
        float _1532 = _1528 * 5.0;
        _1524 = as_type<int>(_1532);
    }
    int _1534 = _1524;
    float _1536 = _1530 * 0.15915493667125701904296875;
    float _1538 = _1476 * 6.283185482025146484375;
    float _1540 = cos(_1538);
    if (_1492)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5049 = as_type<float>(_1534);
        out.gl_Position.z = _5049;
    }
    float _1542 = _1510 * 6.283185482025146484375;
    float _1544 = sin(_1542);
    float _1546 = sqrt(_1512);
    float _1548 = _1510 * 6.283185482025146484375;
    float _1550 = cos(_1548);
    if (_1492)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1552 = _1536 * 6.283185482025146484375;
    float _1554 = cos(_1552);
    float _1556 = _1396 * _1546;
    float _1558 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1560 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1562 = _1540 * _1550;
    float _1564 = _1540 * _1544;
    float _1566 = _1556 * _1558;
    float _1568 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1570 = _1536 * 6.283185482025146484375;
    float _1572 = sin(_1570);
    float _1574 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1576 = _1560 * _1566;
    float _1578 = _1520 * _1544;
    float _1580 = _1556 * _1568;
    float _1582 = _1520 * _1550;
    bool _1584 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1586 = isnan(0.5);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1592 = _1588 || _1590;
    float _1594 = _1540 * _1554;
    float _1596 = _1550 * _1554;
    float _1598 = _1520 * _1554;
    float _1600 = _1544 * _1554;
    float _1602 = _1574 * _1580;
    float _1604 = _1594 * _1576;
    float _1606 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1608 = _1606 * 0.5;
    float _1610 = _1598 * _1576;
    float _1612 = fma(_1572, _1562, _1578);
    float _1614 = -_1582;
    float _1616 = fma(_1572, _1564, _1614);
    float _1618 = -_1576;
    float _1620 = _1572 * _1618;
    float _1622 = -_1564;
    float _1624 = fma(_1572, _1582, _1622);
    float _1626 = fma(_1612, _1602, _1604);
    float _1628 = fma(_1572, _1578, _1562);
    float _1630 = fma(_1596, _1602, _1620);
    float _1632 = fma(_1624, _1602, _1610);
    float _1634 = fma(_1616, _1608, _1626);
    float _1636 = fma(_1600, _1608, _1630);
    float _1638 = fma(_1628, _1608, _1632);
    float _1640 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1644 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1640);
    float _1646 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1642);
    float _1648 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1644);
    float _1650 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1646);
    float _1652 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1654 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1656 = _1634 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1658 = _824 + _1652;
    float _1660 = _1132 + _1654;
    float _1662 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1656);
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1666 = _1658 + _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1660 + _1668;
    float _1672 = fma(_1638, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1662);
    float _1674 = _1666 * _1666;
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1678 = fma(_1670, _1670, _1674);
    float _1680 = _1266 + _1676;
    float _1682 = sqrt(_1678);
    bool _1684 = _1682 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1686 = _1674;
    float _1688 = _1636;
    float _1690 = _1660;
    float _1692 = _1634;
    float _1694 = _1598;
    if (!_1684)
    {
        _1686 = _1660;
    }
    float _1696 = _1686;
    float _1698 = _1696;
    if (!_1684)
    {
        _1688 = _1658;
    }
    float _1700 = _1688;
    float _1702 = _1700;
    if (!_1684)
    {
        _1690 = _1680;
    }
    float _1704 = _1690;
    bool _1706 = !_1684;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1712 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1714 = _1682 + _1712;
        float _1716 = _1680 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1718 = rsqrt(_1678);
        float _1720 = _1714 * _1710;
        float _1722 = _1720 * 0.15915493667125701904296875;
        float _1724 = _1722 * 6.283185482025146484375;
        float _1726 = cos(_1724);
        float _1728 = _1722 * 6.283185482025146484375;
        float _1730 = sin(_1728);
        float _1732 = _1726 + (-1.0);
        float _1734 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1736 = fma(_1730, _1716, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1738 = fma(_1680, _1726, _1734);
        float _1740 = _1718 * _1736;
        float _1742 = fma(_1670, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1744 = fma(_1666, _1740, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1698 = _1742;
        _1708 = _1738;
        _1702 = _1744;
        _1692 = _1740;
    }
    float _1746 = _1698;
    float _1748 = _1708;
    float _1750 = _1702;
    float _1752 = _1692;
    float _1754 = -_1432;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1430;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1762 = -_1440;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1750);
    float _1766 = _1760;
    float _1768 = _1756;
    float _1770 = _1764;
    float _1772 = _1752;
    if (!_1592)
    {
        float _1774 = _1450 * _1450;
        float _1776 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1778 = -_824;
        float _1780 = _1778 + _1750;
        float _1782 = -_1132;
        float _1784 = _1782 + _1746;
        float _1786 = fma(_1458, _1458, _1774);
        float _1788 = -_1266;
        float _1790 = _1788 + _1748;
        float _1792 = fma(_1466, _1466, _1786);
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = sqrt(_1792);
        float _1798 = 1.0 / _1556;
        float _1800 = _1794 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1802 = precise::min(_1796, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1804 = _1802 * _1776;
        float _1806 = _1804 * _1798;
        float _1808 = _1800 * _1806;
        float _1810 = _1780 * _1806;
        float _1812 = fma(_1784, _1808, _1444);
        float _1814 = fma(_1790, _1808, _1438);
        float _1816 = fma(_1800, _1810, _1454);
        _1766 = _1814;
        _1768 = _1812;
        _1770 = _1816;
        _1772 = _1798;
    }
    float _1818 = _1766;
    float _1820 = _1768;
    float _1822 = _1770;
    float _1824 = _1772;
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1828 = _1818 + _1826;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1832 = _1820 + _1830;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1836 = _1822 + _1834;
    float _1838 = _1828 * _1828;
    float _1840 = fma(_1832, _1832, _1838);
    float _1842 = fma(_1836, _1836, _1840);
    float _1844 = rsqrt(_1842);
    float _1846 = sqrt(_1842);
    float _1848 = _1844 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1850 = _1832 * _1848;
    float _1852 = _1836 * _1848;
    float _1854 = _1850 * _1850;
    float _1856 = _1852 * _1852;
    float _1858 = _1854 + _1856;
    float _1860 = sqrt(_1858);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1866 = _1860 + _1864;
    float _1868 = _1836;
    float _1870 = _1858;
    float _1872 = _1866;
    float _1874 = _1824;
    float _1876 = _1828;
    if (_1862)
    {
        float _1878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1868 = _1878;
    }
    float _1880 = _1868;
    if (_1862)
    {
        float _1882 = rsqrt(_1858);
        _1870 = _1882;
    }
    float _1884 = _1870;
    float _1886 = _1884;
    if (_1862)
    {
        float _1888 = _1866 * _1880;
        _1872 = _1888;
    }
    float _1890 = _1872;
    if (_1862)
    {
        float _1892 = _1890 * 0.15915493667125701904296875;
        _1874 = _1892;
    }
    float _1894 = _1874;
    float _1896 = _1844;
    float _1898 = _1894;
    if (_1862)
    {
        float _1900 = _1894 * 6.283185482025146484375;
        float _1902 = sin(_1900);
        _1896 = _1902;
    }
    float _1904 = _1896;
    float _1906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1908 = precise::max(0.0, _1906);
    float _1910 = _1880;
    float _1912 = _1908;
    if (_1862)
    {
        float _1914 = _1894 * 6.283185482025146484375;
        float _1916 = cos(_1914);
        _1910 = _1916;
    }
    float _1918 = _1910;
    float _1920 = -_1848;
    float _1922 = -_1908;
    float _1924 = fma(_1828, _1920, _1922);
    if (_1862)
    {
        float _1926 = _1924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1876 = _1926;
    }
    float _1928 = _1876;
    float _1930 = _1928;
    if (!_1862)
    {
        _1898 = _1856;
    }
    float _1932 = _1898;
    float _1934 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1936 = _1904;
    float _1938 = _1932;
    if (_1862)
    {
        float _1940 = fma(_1904, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1526 = _1940;
    }
    float _1942 = _1526;
    float _1944 = _1942;
    if (!_1862)
    {
        _1936 = _1924;
    }
    float _1946 = _1936;
    float _1948 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1934);
    float _1950 = _1946;
    float _1952 = _1918;
    if (_1862)
    {
        float _1954 = _1918 + (-1.0);
        _1912 = _1954;
    }
    float _1956 = _1912;
    float _1958 = _1956;
    if (_1862)
    {
        float _1960 = _1884 * _1942;
        _1930 = _1960;
    }
    float _1962 = _1930;
    if (!_1862)
    {
        _1944 = _1850;
    }
    float _1964 = _1944;
    float _1966 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1948);
    float _1968 = _1964;
    if (_1862)
    {
        float _1970 = _1956 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _1970;
    }
    float _1972 = _1958;
    if (_1862)
    {
        float _1974 = _1850 * _1962;
        _1968 = _1974;
    }
    float _1976 = _1968;
    if (!_1862)
    {
        _1886 = _1854;
    }
    float _1978 = _1886;
    float _1980 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1982 = _1978;
    if (_1862)
    {
        float _1984 = fma(_1924, _1918, _1972);
        _1950 = _1984;
    }
    float _1986 = _1950;
    if (!_1862)
    {
        _1952 = _1852;
    }
    float _1988 = _1952;
    float _1990 = _1988;
    if (_1862)
    {
        float _1992 = _1852 * _1962;
        _1990 = _1992;
    }
    float _1994 = _1990;
    if (_1862)
    {
        float _1996 = _1976 * _1976;
        _1982 = _1996;
    }
    float _1998 = _1982;
    if (_1862)
    {
        float _2000 = _1994 * _1994;
        _1938 = _2000;
    }
    float _2002 = _1938;
    float _2004 = fma(_1986, _1986, _1998);
    float _2006 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2008 = _2004 + _2002;
    float _2010 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2006);
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2014 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2012);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = rsqrt(_2008);
    float _2020 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2010);
    float _2022 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2024 = -_2016;
    float _2026 = _2024 + 1.0;
    float _2028 = _2020 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2030 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2032 = floor(_2022);
    float _2034 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2038 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2040 = -_2034;
    float _2042 = fma(_2040, _2030, 1.0);
    float _2044 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2036);
    float _2048 = abs(_2026);
    float _2050 = log2(_2048);
    float _2052 = _2018 * _1976;
    float _2054 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2056 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2046);
    float _2058 = _2018 * _1994;
    float _2060 = _2018 * _1986;
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2054);
    float _2066 = _2056 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2068 = floor(_2038);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2076 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2078 = -_2058;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2082 = -_2032;
    float _2084 = _2022 + _2082;
    float _2086 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2076);
    float _2088 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2090 = fma(_2080, -0.5, 0.5);
    float _2092 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2094 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2086);
    float _2096 = exp2(_2088);
    float _2098 = fma(_2080, 0.5, 0.5);
    float _2100 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2094);
    float _2102 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2092);
    float _2104 = -_2068;
    float _2106 = _2038 + _2104;
    float _2108 = fma(_2098, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = _2060 + 1.0;
    float _2112 = 1.0 / _2100;
    float _2114 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2116 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2102);
    float _2118 = fma(_2098, _2108, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2114);
    float _2122 = log2(_2042);
    float _2124 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2120);
    float _2126 = -_2060;
    float _2128 = fma(_2096, _2110, _2126);
    float _2130 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2116);
    float _2132 = sqrt(_2090);
    float _2134 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2136 = _2130 * _2112;
    float2 _6020 = float2(_2084, _2106);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6020, float2(0.0), isnan(_6020)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6020, float2(0.0), isnan(_6020)), level(0.0)).x;
    float _2140 = fma(_2098, _2118, 1.570728778839111328125);
    float _2142 = _2134 * _2112;
    float _2144 = fma(_2136, 0.5, 0.5);
    float _2146 = fma(_2128, 0.5, 0.5);
    float _2148 = _2122 * 0.693147182464599609375;
    float _2150 = fma(_2142, -0.5, 0.5);
    float _2152 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2154 = _2132 * 0.636619746685028076171875;
    float3 _6054 = float3(_2144, _2150, _2152);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6054, float3(0.0), isnan(_6054)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6054, float3(0.0), isnan(_6054)), level(0.0)).x;
    float3 _6065 = float3(_2144, _2150, _2152);
    float4 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6065, float3(0.0), isnan(_6065)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6065, float3(0.0), isnan(_6065)), level(0.0)).xyzw;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = _2159.w;
    float _2169 = -_2140;
    float _2171 = fma(_2154, _2169, 1.0);
    float2 _6086 = float2(_2171, _2146);
    float3 _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6086, float2(0.0), isnan(_6086)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6086, float2(0.0), isnan(_6086)), level(0.0)).xyz;
    float _2177 = _2175.x;
    float _2179 = _2175.y;
    float _2181 = _2175.z;
    float _2183 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _1438 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2187 = _2066 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2189 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2197 = _2193 || _2195;
    float _2199 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    float _2201 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2185);
    float _2203 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2205 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2199);
    float _2207 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2201);
    float _2209 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2211 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2213 = _2207 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2215 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2187);
    float _2217 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2219 = 1.0 / _2211;
    float _2221 = _2213 + _2211;
    float _2223 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2215);
    float _2225 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2227 = _1612 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2229 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2203);
    float _2231 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2233 = -_1572;
    float _2235 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2231);
    float _2237 = _2221 * _2219;
    float _2239 = _2237 * 0.5;
    float _2241 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2235);
    float _2243 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2245 = fma(_2239, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2243);
    float _2247 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2209);
    float _2249 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2251 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2227);
    float _2253 = 1.0 / _2245;
    float _2255 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = -_1572;
    float _2259 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2249);
    float _2261 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2247);
    float _2263 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2229);
    float _2265 = -_1572;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2269 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2251);
    float _2271 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2275 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2277 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2279 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2273);
    float _2281 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2275);
    float _2283 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2259);
    float _2285 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2267);
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2289 = _2253 * _2287;
    float _2291 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2281);
    float _2293 = _2281;
    float _2295 = _2217;
    float _2297 = _2100;
    float _2299 = _2134;
    if (!_2197)
    {
        _1694 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2301 = _1694;
    float _2303 = _2217 * _2283;
    float _2305 = abs(_2289);
    float _2307 = log2(_2305);
    float _2309 = _2217 * _2241;
    float _2311 = _2217 * _2285;
    float _2313 = _2301;
    if (!_2197)
    {
        float _2315 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2317 = _2301 + _2315;
        _2313 = _2317;
    }
    float _2319 = _2313;
    if (!_2197)
    {
        float _2321 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2323 = _2289 + _2321;
        _2293 = _2323;
    }
    float _2325 = _2293;
    float _2327 = fma(_2225, _2263, _2309);
    if (_2197)
    {
        _2295 = 1.0;
    }
    float _2329 = _2295;
    float _2331 = _2074;
    float _2333 = _2329;
    if (!_2197)
    {
        float _2335 = 1.0 / _2319;
        _2331 = _2335;
    }
    float _2337 = _2331;
    float _2339 = _2307 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2341 = exp2(_2339);
    if (!_2197)
    {
        float _2343 = _2325 * _2337;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2333 = _2345;
    }
    float _2347 = _2333;
    bool _2349 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2351 = isnan(_1846);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2357 = _2353 || _2355;
    float _2359 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2361 = precise::clamp(_2359, 0.0, 1.0);
    float _2363 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2277);
    float _2365 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2279);
    float _2367 = fma(_2225, _2261, _2303);
    float _2369 = fma(_2361, -2.0, 3.0);
    float _2371 = _2361 * _2361;
    float _2373 = _2100 * 0.5;
    float _2375 = fma(_2225, _2269, _2311);
    float _2377 = _2371 * _2369;
    float _2379 = fma(_2134, -0.5, _2373);
    float _2381 = in.m_72.x;
    float _2383 = _2363 + _2367;
    float _2385 = -_2377;
    float _2387 = _2385 + 1.0;
    float _2389 = _2365 + _2327;
    float _2391 = _2291 + _2375;
    float _2393 = fma(_2387, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2377);
    float _2395 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2223);
    float _2397 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2399 = _2289 <= 8000.0;
    bool _2401 = isnan(_2289);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = _2130 + _2100;
    float _2413 = _2395 + _2100;
    out.gl_Position.x = _2130;
    out.gl_Position.y = _2134;
    out.gl_Position.z = _2395;
    out.gl_Position.w = _2100;
    float _2415 = exp2(_2397);
    float _2417 = _2409 * _2393;
    float _2419 = _2413 * 0.5;
    float _2421 = _2411 * 0.5;
    out.m_74.x = _2383;
    out.m_74.y = _2389;
    out.m_74.z = _2391;
    float _2423 = _2417 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_76.x = _2421;
    out.m_76.y = _2379;
    out.m_76.z = _2419;
    out.m_76.w = _2100;
    float _2425 = _2395;
    if (!_2357)
    {
        _2297 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2427 = _2297;
    float _2429 = _2427;
    float _2431 = _2427;
    if (!_2357)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2433 = _2425;
    float _2435 = -_2415;
    float _2437 = _2435 + 1.0;
    float _2439 = _2433;
    float _2441 = _2433;
    if (!_2357)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2443 = _2299;
    float _2445 = _2437 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2447 = -_2138;
    float _2449 = _2447 + 1.0;
    float _2451 = _2449 * _2423;
    float _2453 = precise::clamp(_2451, 0.0, 1.0);
    float _2455 = -_2453;
    float _2457 = fma(_2455, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2459 = _2457 * _2381;
    float _2461 = _2445 * _2156;
    float _2463 = -_2445;
    float _2465 = _2463 + 1.0;
    float _2467 = _2459 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2469 = _2167 * _2461;
    float _2471 = _2167 * _2465;
    out.m_78.x = _2467;
    float _2473 = _2181 * _2461;
    float _2475 = fma(_2177, _2469, _2161);
    float _2477 = fma(_2179, _2469, _2163);
    float _2479 = _2163;
    float _2481 = _2161;
    float _2483 = _2461;
    float _2485 = _2443;
    float _2487 = _2443;
    if (!_2357)
    {
        _2479 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2489 = _2479;
    float _2491 = fma(_2167, _2473, _2165);
    float _2493 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2495 = _2489;
    float _2497 = _2489;
    if (!_2357)
    {
        _2481 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2499 = _2481;
    float _2501 = _2499;
    float _2503 = _2499;
    if (!_2357)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2505 = _2483;
    out.m_80.x = _2475;
    out.m_80.y = _2477;
    out.m_80.z = _2491;
    out.m_80.w = _2471;
    bool _2507 = !_2357;
    float _2509 = _2505;
    float _2511 = _2505;
    if (!_2507)
    {
        bool _2513 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2515 = isnan(_1846);
        bool _2517 = _2513 || _2515;
        bool _2519 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2521 = _2517 || _2519;
        if (!_2521)
        {
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2525 = _1846 + _2523;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2529 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2527;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2535 = 1.0 / _2529;
            float _2537 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2539 = _2537 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2541 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2545 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2553 = _2525 * _2535;
            float _2555 = precise::clamp(_2553, 0.0, 1.0);
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2561 = fma(_2555, _2533, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2563 = fma(_2555, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2565 = fma(_2555, _2539, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2567 = fma(_2555, _2543, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2569 = fma(_2555, _2547, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2571 = fma(_2555, _2551, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2503 = _2565;
            _2487 = _2569;
            _2497 = _2561;
            _2441 = _2567;
            _2431 = _2563;
            _2511 = _2571;
            _2573 = true;
        }
        else
        {
            bool _2575 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2577 = isnan(_1846);
            bool _2579 = _2575 || _2577;
            bool _2581 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2583 = _2579 || _2581;
            if (!_2583)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2585 = _2495;
            _2497 = _2585;
            if (!_2583)
            {
                _2501 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2587 = _2501;
            _2503 = _2587;
            if (!_2583)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2589 = _2429;
            _2431 = _2589;
            if (!_2583)
            {
                _2439 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2591 = _2439;
            _2441 = _2591;
            if (!_2583)
            {
                _2485 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2593 = _2485;
            _2487 = _2593;
            if (!_2583)
            {
                _2509 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2595 = _2509;
            bool _2597 = !_2583;
            _2511 = _2595;
            if (!_2597)
            {
                bool _2599 = _1846 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2601 = isnan(_1846);
                bool _2603 = _2599 || _2601;
                bool _2605 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2607 = _2603 || _2605;
                if (!_2607)
                {
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2611 = _1846 + _2609;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2615 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2613;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2621 = 1.0 / _2615;
                    float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2637 = _2635 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2639 = _2611 * _2621;
                    float _2641 = precise::clamp(_2639, 0.0, 1.0);
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2647 = fma(_2641, _2619, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2649 = fma(_2641, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2651 = fma(_2641, _2625, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2653 = fma(_2641, _2629, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2655 = fma(_2641, _2633, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2657 = fma(_2641, _2637, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2503 = _2651;
                    _2487 = _2655;
                    _2497 = _2647;
                    _2441 = _2653;
                    _2431 = _2649;
                    _2511 = _2657;
                    _2573 = true;
                }
                else
                {
                    _2503 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2487 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2441 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2511 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2573 = false;
    float _2659 = _2503;
    float _2661 = _2487;
    float _2663 = _2497;
    float _2665 = _2441;
    float _2667 = _2431;
    float _2669 = _2511;
    float _2671 = _2493 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2673 = fma(_2389, -0.5, 0.5);
    float _2675 = precise::clamp(_2673, 0.0, 1.0);
    float _2677 = -_2659;
    float _2679 = _2677 + _2661;
    float _2681 = -_2663;
    float _2683 = _2681 + _2665;
    out.m_82.x = 0.0;
    float _2685 = fma(_2675, _2679, _2659);
    float _2687 = -_2667;
    float _2689 = _2687 + _2669;
    float _2691 = fma(_2675, _2683, _2663);
    float _2693 = _2685 * 0.586610972881317138671875;
    bool _2695 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2697 = fma(_2675, _2689, _2667);
    out.m_53.x = _2671;
    float _2699 = fma(_2691, 0.298911988735198974609375, _2693);
    bool _2701 = _2347 > 0.0;
    bool _2703 = isnan(_2347);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan(0.0);
    bool _2709 = _2705 || _2707;
    float _2711 = fma(_2697, 0.114477999508380889892578125, _2699);
    float _2713 = -_2711;
    float _2715 = _2691 + _2713;
    float _2717 = -_2711;
    float _2719 = _2685 + _2717;
    float _2721 = -_2711;
    float _2723 = _2697 + _2721;
    float _2725 = fma(_2715, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2727 = fma(_2719, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    float _2729 = fma(_2723, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2711);
    bool _2731 = !_2695;
    if (!_2731)
    {
        float _2733 = -_1818;
        float _2735 = _2733 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2737 = -_1820;
        float _2739 = _2737 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2741 = -_1822;
        float _2743 = _2741 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2745 = _2735 * _2735;
        float _2747 = fma(_2739, _2739, _2745);
        float _2749 = fma(_2743, _2743, _2747);
        float _2751 = sqrt(_2749);
        float _2753 = rsqrt(_2749);
        float _2755 = -_2751;
        float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2759 = _2757 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2761 = precise::clamp(_2759, 0.0, 1.0);
        float _2763 = _2739 * _2753;
        float _2765 = _2735 * _2753;
        float _2767 = abs(_2761);
        float _2769 = log2(_2767);
        float _2771 = _2743 * _2753;
        float _2773 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2775 = _2389 * _2765;
        float _2777 = -_2765;
        float _2779 = -_2773;
        float _2781 = fma(_2777, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2779);
        float _2783 = fma(_2383, _2763, _2775);
        float _2785 = -_2771;
        float _2787 = fma(_2785, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2781);
        float _2789 = fma(_2391, _2771, _2783);
        float _2791 = precise::clamp(_2789, 0.0, 1.0);
        float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2795 = _2787 + _2793;
        float _2797 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2799 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        float _2803 = exp2(_2797);
        float _2805 = _2803 * _2801;
        float _2807 = _2791 * _2805;
        float _2809 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2811 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2813 = _2807 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2809;
        out.m_82.y = _2811;
        out.m_82.z = _2813;
    }
    out.m_84.x = _2725;
    out.m_84.y = _2727;
    out.m_84.z = _2729;
    if (_2709)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2815 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2815;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

