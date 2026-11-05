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
    float4 m_68 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2599 = false;
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
        float _2910 = as_type<float>(_127);
        out.gl_Position.z = _2910;
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
        float _2965 = as_type<float>(_153);
        out.gl_Position.z = _2965;
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
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = float(_463);
    float _481 = 1.0 / _477;
    float _483 = float(uint(_471));
    float _485 = _465 * 2.0;
    int _487 = ~_471;
    int _489 = _487 + 1;
    float _491 = 1.0 / _479;
    float _493 = 1.0 / _483;
    float _495 = _491 * _109;
    float _497 = trunc(_495);
    int _499 = int(_497);
    int _501 = as_type<int>(_493) + (-2);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = float(uint(_499));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    bool _518 = !_505;
    float _520 = _518 ? 7.345489978790283203125 : 1.0;
    float _522 = float(_499);
    float _524 = _520 * _465;
    int _526 = _489 * int(_516);
    int _528 = _526 + _499;
    float _530 = float(uint(_528));
    float _532 = as_type<float>(_501) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = int(_516) + int(_538);
    float _542 = float(_471);
    float _544 = floor(_524);
    int _546 = _489 * _540;
    int _548 = _546 + _499;
    bool _550 = _522 >= _542;
    bool _552 = isnan(_522);
    bool _554 = _550 || _552;
    bool _556 = isnan(_542);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_471);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    bool _572 = _471 == 0;
    int _574 = ~_540;
    int _576 = _574 + _570;
    int _578 = _576 + 1;
    float _580 = -_544;
    float _582 = _524 + _580;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _471 * _578;
    int _602 = _600 + _499;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _606 = _604 != 0;
    bool _608 = !_572;
    int _610 = _608 ? _602 : (-1);
    float _612 = _582 * _542;
    float _614 = _542 * _109;
    int _616 = ~_566;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _614 * _157;
    float _626 = trunc(_612);
    int _628 = int(_626);
    int _630 = _610 * _620;
    int _632 = _471 + (-1);
    bool _634 = !_590;
    int _636 = _634 ? 0 : 1;
    bool _638 = !_586;
    int _640 = _638 ? 0 : 1;
    int _642 = _566 * _632;
    int _644 = _642 + _630;
    float _646 = trunc(_624);
    int _648 = int(_646);
    int _650 = abs(_636);
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    bool _656 = !_598;
    int _658 = _656 ? 0 : 1;
    int _660 = _644 * _650;
    int _662 = abs(_640);
    float _664 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _666 = abs(_654);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _670 = _668 != 0;
    float _672 = fma(_664, -2.0, _622);
    int _674 = abs(_658);
    bool _676 = !_670;
    int _678 = _676 ? 0 : 1;
    int _680 = _628 * _674;
    int _682 = _680 + _499;
    float _684 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = _648 * _662;
    int _688 = _686 + _660;
    int _690 = abs(_678);
    float _692 = -_473;
    float _694 = fma(_684, 2.0, _692);
    int _696 = _682 * _666;
    int _698 = _696 + _688;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _702 = _700 != 0;
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = _628 * _690;
    int _714 = _712 + _698;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _726 = float(uint(_714));
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _734 = isnan(0.0);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _740 = _736 || _738;
    float _742 = as_type<float>(_501) * _726;
    float _744 = 1.0 / _730;
    bool _746 = _465 > 0.5;
    float _748 = _706 * _109;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _756 = trunc(_742);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = in.m_58.z;
    float _770 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _772 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = ~_471;
    int _776 = _774 + 1;
    float _778 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _782 = exp2(_748);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _786 = _776 * int(_760);
    int _788 = _786 + _714;
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = floor(_485);
    float _800 = float(uint(_788));
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = _796 * _481;
    out.m_62.x = _762;
    out.m_62.y = _764;
    out.m_62.z = _766;
    out.m_62.w = _784;
    float _808 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _810 = as_type<float>(_501) * _800;
    float _812 = _804 * _744;
    float _814 = -_782;
    float _816 = _814 + 1.0;
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _740 ? _816 : 0.0;
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _842 = ~_471;
    int _844 = _842 + 1;
    float _846 = 1.0 / _838;
    float _848 = -_173;
    int _850 = _746 ? as_type<int>(_848) : as_type<int>(_173);
    float _852 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _840);
    int _854 = int(_760) + int(_822);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = _467 * 2.0;
    float _860 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _852);
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _864 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _866 = _798 > 0.0;
    float _868 = _467 + _465;
    bool _870 = _798 >= 0.0;
    bool _872 = isnan(_798);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _882 = floor(_858);
    if (_834)
    {
        float _884 = _824 * _846;
        _119 = _884;
    }
    float _886 = _119;
    float _888 = _467 + _768;
    int _890 = _844 * _854;
    int _892 = _890 + _714;
    float _894 = _868 + (-1.0);
    float _896 = _888 + (-1.0);
    float _898 = -_880;
    float _900 = _898 + 1.0;
    bool _902 = uint(_892) >= uint(_471);
    float _904 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _906 = _878 ? 0 : 1;
    float _908 = _768 * 2.0;
    bool _910 = !_902;
    int _912 = _910 ? 0 : (-1);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_860;
    float _924 = _922 + 1.0;
    int _926 = ~_854;
    int _928 = _926 + _912;
    int _930 = _928 + 1;
    bool _932 = _882 > 0.0;
    int _934 = _920;
    if (!_866)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    int _942 = _471 * _930;
    int _944 = _942 + _714;
    bool _946 = _882 >= 0.0;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = floor(_908);
    bool _958 = _467 > 0.5;
    float _960 = float(uint(_682));
    int _962 = _954 ? 0 : 1;
    float _964 = -_177;
    int _966 = _958 ? as_type<int>(_964) : as_type<int>(_177);
    float _968 = as_type<float>(_501) * _960;
    bool _970 = !_710;
    float _972 = _970 ? _173 : as_type<float>(_850);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = trunc(_968);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    bool _992 = !_572;
    int _994 = _992 ? _944 : (-1);
    bool _996 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_459);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    int _1008 = ~_962;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (!_932)
    {
        int _1016 = ~_962;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = -_1006;
    float _1024 = _1022 + 1.0;
    bool _1026 = !_606;
    float _1028 = _1026 ? _177 : as_type<float>(_966);
    int _1030 = _994 & 3;
    bool _1032 = _1030 != 0;
    bool _1034 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1036 = isnan(_459);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    int _1046 = _1032 ? 0 : 1;
    bool _1048 = _956 > 0.0;
    float _1050 = _1044 * _1024;
    bool _1052 = _956 >= 0.0;
    bool _1054 = isnan(_956);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1064 = _459 + _1062;
    bool _1066 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1068 = isnan(_459);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1044;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_471;
    int _1084 = _1082 + 1;
    float _1086 = fma(_806, _1064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1088 = _972 + 0.5;
    float _1090 = _1076 * _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1094 = _459 + _1092;
    int _1096 = _1084 * int(_990);
    int _1098 = _1096 + _682;
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    float _1102 = _1086 * _1090;
    int _1104 = _994 >> 31;
    float _1106 = fma(_812, _1094, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1108 = float(uint(_1098));
    float _1110 = _1028 + (-0.5);
    int _1112 = _1104 & 3;
    float _1114 = -_1076;
    float _1116 = _1114 + 1.0;
    float _1118 = -_924;
    float _1120 = fma(_972, _1118, _1100);
    float _1122 = -_1110;
    float _1124 = -_862;
    float _1126 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1124);
    int _1128 = _994 + _1112;
    float _1130 = as_type<float>(_501) * _1108;
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1102);
    float _1134 = fma(_1028, _900, _1126);
    int _1136 = _1128 >> 2;
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = fma(_1106, _1050, _1132);
    float _1146 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1148 = _1136 << 4;
    int _1150 = _1148 + 368;
    float _1152 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    bool _1154 = !_980;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1144);
    uint _1160 = uint(int(uint(_1150) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = int(_1160) + 1;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    int _1172 = _1168 & 3;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[int(_1170)][_1172];
    int _1176 = _994 & 3;
    bool _1178 = _1176 != 0;
    float _1180 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1182 = _1060 ? 0 : 1;
    out.m_64.x = _1120;
    out.m_64.y = _1134;
    bool _1184 = uint(_1176) > 1u;
    int _1186 = ~_1182;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _1190;
    if (!_1048)
    {
        int _1194 = ~_1182;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    int _1200 = _1150 + 8;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = abs(_1156);
    float _1220 = float(_940);
    float _1222 = float(_1218);
    int _1224 = int(_990) + int(_1142);
    int _1226 = ~_471;
    int _1228 = _1226 + 1;
    float _1230 = _1222 * _1220;
    bool _1232 = !_976;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _1180 + _1236;
    int _1240 = ~_1046;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    float _1246 = _1230 * (-2.0);
    bool _1248 = _1176 != 3;
    int _1250 = _1244;
    if (!_1184)
    {
        int _1252 = ~_1046;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_904, _1246, _904);
    float _1260 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1262 = abs(_1234);
    float _1264 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1266 = uint(_1176) >= 2u;
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1270 = _1260 + _1268;
    float _1272 = float(_1262);
    float _1274 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1276 = float(_1198);
    int _1278 = _1228 * _1224;
    int _1280 = _1278 + _682;
    int _1282 = _1266 ? 0 : 1;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = _1264 + _1284;
    int _1288 = abs(_1256);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1274);
    float _1292 = _1272 * _1276;
    int _1294 = ~_1282;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1302 = uint(_1280) >= uint(_471);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1306 = _1298;
    if (_1248)
    {
        int _1308 = ~_1282;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    float _1314 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1316 = !_1178;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _1176 != 3;
    float _1332 = _1292 * (-2.0);
    bool _1334 = !_1302;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1326 * as_type<int>(_1174);
    int _1340 = abs(_1318);
    bool _1342 = !_1330;
    int _1344 = _1342 ? 0 : (-1);
    bool _1346 = _1304 >= 0.0;
    float _1348 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1350 = !_702;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = ~_1224;
    int _1356 = _1354 + _1336;
    int _1358 = _1356 + 1;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1362 = abs(_1312);
    float _1364 = in.m_66.x;
    float _1366 = in.m_66.y;
    float _1368 = in.m_66.z;
    int _1370 = ~_1340;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _471 * _1358;
    int _1378 = _1376 + _682;
    int _1380 = abs(_1344);
    float _1382 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1384 = abs(_1352);
    int _1386 = _1374 * as_type<int>(_1166);
    int _1388 = _1386 + _1338;
    int _1390 = ~_1362;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = _1238 * _1238;
    out.m_68.x = _1328;
    out.m_68.y = _1360;
    out.m_68.z = _1320;
    out.m_68.w = _1382;
    int _1398 = ~_1380;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1394 * as_type<int>(_1208);
    int _1406 = _1404 + _1388;
    float _1408 = fma(_1270, _1270, _1396);
    int _1410 = ~_1384;
    int _1412 = _1410 + 1;
    int _1414 = _1412 + 1;
    float _1416 = _1320;
    if (_1346)
    {
        out.m_53.x = 0.0;
    }
    int _1418 = _1402 * as_type<int>(_1216);
    int _1420 = _1418 + _1406;
    float _1422 = fma(_1286, _1286, _1408);
    bool _1424 = !_572;
    int _1426 = _1424 ? _1378 : (-1);
    int _1428 = _1420 * _1414;
    float _1430 = rsqrt(_1422);
    int _1432 = _1426 * _1384;
    int _1434 = _1432 + _1428;
    if (_1346)
    {
        _1416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1416;
    float _1438 = fma(_914, _1332, _914);
    float _1440 = fma(_1332, _1364, _1364);
    float _1442 = _465 + (-0.5);
    int _1444 = as_type<int>(_1436);
    float _1446 = _1368;
    if (_1346)
    {
        float _1448 = _1436 * 5.0;
        _1444 = as_type<int>(_1448);
    }
    int _1450 = _1444;
    float _1452 = float(_1434);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1440);
    float _1456 = fma(_1246, _1366, _1366);
    bool _1458 = !_984;
    int _1460 = _1458 ? 0 : 1;
    if (_1346)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4926 = as_type<float>(_1450);
        out.gl_Position.z = _4926;
    }
    float _1462 = fma(_1438, _886, _1454);
    float _1464 = _467 + (-0.5);
    int _1466 = abs(_1460);
    out.m_70.x = _1452;
    float _1468 = _1238 * _1430;
    float _1470 = _1270 * _1430;
    float _1472 = _1468;
    if (_1346)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1474 = -_1468;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1478 = _1286 * _1430;
    float _1480 = -_1470;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1484 = _1462 * 0.15915493667125701904296875;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1482 + _1494;
    float _1498 = float(_1020);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1492 + _1502;
    float _1506 = float(_1466);
    float _1508 = -_1468;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1500);
    float _1514 = -_1470;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1456);
    float _1520 = _1506 * _1498;
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1512);
    float _1524 = _1510 * _1510;
    float _1526 = -_1478;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _1530 = _768 + _465;
    float _1532 = fma(_1258, _886, _1518);
    bool _1534 = _1522 >= 0.0;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = _1520 * (-2.0);
    float _1540 = _1530 + (-1.0);
    float _1542 = fma(_1528, _1528, _1536);
    float _1544 = _1532 * 0.15915493667125701904296875;
    float _1546 = fma(_1538, _1368, _1368);
    float _1548 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1550 = _1484 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = _768 + (-0.5);
    float _1556 = fma(_1548, _1538, _1548);
    float _1558 = _1504;
    if (_1534)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1560 = _1446;
    float _1562 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1546);
    int _1564 = as_type<int>(_1560);
    if (_1534)
    {
        out.m_53.x = 0.0;
    }
    float _1566 = _1484 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    if (_1534)
    {
        float _1570 = _1560 * 5.0;
        _1564 = as_type<int>(_1570);
    }
    int _1572 = _1564;
    float _1574 = fma(_1556, _886, _1562);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5128 = as_type<float>(_1572);
        out.gl_Position.z = _5128;
    }
    float _1576 = _1574 * 0.15915493667125701904296875;
    float _1578 = _1544 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = sqrt(_1542);
    float _1584 = _1544 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    if (_1534)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1588 = _1576 * 6.283185482025146484375;
    float _1590 = cos(_1588);
    float _1592 = _1430 * _1582;
    float _1594 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1598 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1600 = _1568 * _1586;
    float _1602 = _1592 * _1594;
    float _1604 = _1568 * _1580;
    float _1606 = _1576 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1592 * _1598;
    float _1612 = _1596 * _1602;
    float _1614 = _1552 * _1580;
    float _1616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1618 = _1552 * _1586;
    float _1620 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1622 = _1620 * 0.5;
    float _1624 = _1568 * _1590;
    float _1626 = _1616 * _1610;
    float _1628 = _1552 * _1590;
    float _1630 = _1586 * _1590;
    float _1632 = _1624 * _1612;
    float _1634 = _1580 * _1590;
    bool _1636 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1644 = _1640 || _1642;
    float _1646 = fma(_1608, _1600, _1614);
    float _1648 = -_1618;
    float _1650 = fma(_1608, _1604, _1648);
    float _1652 = -_1612;
    float _1654 = _1608 * _1652;
    float _1656 = -_1604;
    float _1658 = fma(_1608, _1618, _1656);
    float _1660 = fma(_1646, _1626, _1632);
    float _1662 = _1628 * _1612;
    float _1664 = fma(_1630, _1626, _1654);
    float _1666 = fma(_1608, _1614, _1600);
    float _1668 = fma(_1650, _1622, _1660);
    float _1670 = fma(_1658, _1626, _1662);
    float _1672 = fma(_1634, _1622, _1664);
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1676 = fma(_1666, _1622, _1670);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1680);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1682);
    float _1688 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1690 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1692 = _1264 + _1688;
    float _1694 = _1260 + _1690;
    float _1696 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1696);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1706);
    float _1712 = fma(_1704, _1704, _1708);
    float _1714 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1716 = sqrt(_1712);
    float _1718 = _1180 + _1714;
    bool _1720 = _1716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = _1714;
    float _1724 = _1710;
    float _1726 = _1662;
    float _1728 = _1666;
    if (!_1720)
    {
        _1722 = _1694;
    }
    float _1730 = _1722;
    float _1732 = _1730;
    if (!_1720)
    {
        _1724 = _1692;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1720)
    {
        _1726 = _1718;
    }
    float _1738 = _1726;
    bool _1740 = !_1720;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1716 + _1746;
        float _1750 = rsqrt(_1712);
        float _1752 = _1748 * _1744;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = _1752 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = _1760 + (-1.0);
        float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = fma(_1764, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1772 = fma(_1718, _1760, _1768);
        float _1774 = _1750 * _1770;
        float _1776 = fma(_1704, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1778 = fma(_1700, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1732 = _1776;
        _1742 = _1772;
        _1736 = _1778;
    }
    float _1780 = _1732;
    float _1782 = _1742;
    float _1784 = _1736;
    float _1786 = -_1470;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1780);
    float _1790 = -_1468;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _1794 = -_1478;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1798 = _1792;
    float _1800 = _1788;
    float _1802 = _1796;
    if (!_1644)
    {
        float _1804 = _1488 * _1488;
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1808 = -_1264;
        float _1810 = _1808 + _1784;
        float _1812 = fma(_1496, _1496, _1804);
        float _1814 = fma(_1504, _1504, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1818 = sqrt(_1814);
        float _1820 = 1.0 / _1592;
        float _1822 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1824 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1826 = _1824 * _1806;
        float _1828 = -_1260;
        float _1830 = _1828 + _1780;
        float _1832 = -_1180;
        float _1834 = _1832 + _1782;
        float _1836 = _1826 * _1820;
        float _1838 = _1822 * _1836;
        float _1840 = _1810 * _1836;
        float _1842 = fma(_1830, _1838, _1482);
        float _1844 = fma(_1834, _1838, _1476);
        float _1846 = fma(_1822, _1840, _1492);
        _1798 = _1844;
        _1800 = _1842;
        _1802 = _1846;
    }
    float _1848 = _1798;
    float _1850 = _1800;
    float _1852 = _1802;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1848 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1852 + _1862;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1860, _1860, _1866);
    float _1870 = fma(_1864, _1864, _1868);
    float _1872 = rsqrt(_1870);
    float _1874 = sqrt(_1870);
    float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1878 = _1860 * _1876;
    float _1880 = _1864 * _1876;
    float _1882 = _1878 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 + _1884;
    float _1888 = sqrt(_1886);
    bool _1890 = _1888 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = _1888 + _1892;
    float _1896 = _1864;
    float _1898 = _1886;
    float _1900 = _1894;
    float _1902 = _1856;
    if (_1890)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1904;
    }
    float _1906 = _1896;
    if (_1890)
    {
        float _1908 = rsqrt(_1886);
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1890)
    {
        float _1914 = _1894 * _1906;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1890)
    {
        float _1918 = _1916 * 0.15915493667125701904296875;
        _1472 = _1918;
    }
    float _1920 = _1472;
    float _1922 = _1872;
    float _1924 = _1920;
    if (_1890)
    {
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1934 = precise::max(0.0, _1932);
    float _1936 = _1906;
    float _1938 = _1934;
    if (_1890)
    {
        float _1940 = _1920 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        _1936 = _1942;
    }
    float _1944 = _1936;
    float _1946 = -_1876;
    float _1948 = -_1934;
    float _1950 = fma(_1856, _1946, _1948);
    if (_1890)
    {
        float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1952;
    }
    float _1954 = _1902;
    float _1956 = _1954;
    if (!_1890)
    {
        _1924 = _1884;
    }
    float _1958 = _1924;
    float _1960 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1930;
    float _1964 = _1958;
    if (_1890)
    {
        float _1966 = fma(_1930, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1966;
    }
    float _1968 = _1558;
    float _1970 = _1968;
    if (!_1890)
    {
        _1962 = _1950;
    }
    float _1972 = _1962;
    float _1974 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1976 = _1972;
    float _1978 = _1944;
    if (_1890)
    {
        float _1980 = _1944 + (-1.0);
        _1938 = _1980;
    }
    float _1982 = _1938;
    float _1984 = _1982;
    if (_1890)
    {
        float _1986 = _1910 * _1968;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (!_1890)
    {
        _1970 = _1878;
    }
    float _1990 = _1970;
    float _1992 = _1990;
    if (_1890)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1890)
    {
        float _1998 = _1878 * _1988;
        _1992 = _1998;
    }
    float _2000 = _1992;
    if (!_1890)
    {
        _1912 = _1882;
    }
    float _2002 = _1912;
    float _2004 = _2002;
    if (_1890)
    {
        float _2006 = fma(_1950, _1944, _1996);
        _1976 = _2006;
    }
    float _2008 = _1976;
    if (!_1890)
    {
        _1978 = _1880;
    }
    float _2010 = _1978;
    float _2012 = _2010;
    if (_1890)
    {
        float _2014 = _1880 * _1988;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1890)
    {
        float _2018 = _2000 * _2000;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1890)
    {
        float _2022 = _2016 * _2016;
        _1964 = _2022;
    }
    float _2024 = _1964;
    float _2026 = fma(_2008, _2008, _2020);
    float _2028 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2030 = _2026 + _2024;
    float _2032 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2028);
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2030);
    float _2042 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2044 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2056 = floor(_2044);
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2060 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2062 = -_2058;
    float _2064 = fma(_2062, _2054, 1.0);
    float _2066 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2068 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2060);
    float _2070 = _2040 * _2000;
    float _2072 = abs(_2048);
    float _2074 = log2(_2072);
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2066);
    float _2078 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2080 = _2040 * _2008;
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2084 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2088 = _2040 * _2016;
    float _2090 = -_2082;
    float _2092 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2090);
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2096 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2098 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _2100 = -_2088;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2092);
    float _2104 = floor(_2050);
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2096);
    float _2108 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2102, -0.5, 0.5);
    float _2112 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2116 = -_2056;
    float _2118 = _2044 + _2116;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2122 = log2(_2064);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2120);
    float _2130 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2132 = sqrt(_2110);
    float _2134 = fma(_2102, 0.5, 0.5);
    float _2136 = -_2104;
    float _2138 = _2050 + _2136;
    float _2140 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2142 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2144 = fma(_2134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = _2080 + 1.0;
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = 1.0 / _2124;
    float _2152 = fma(_2134, _2144, -0.212114393711090087890625);
    float _2154 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2156 = _2122 * 0.693147182464599609375;
    float _2158 = fma(_2134, _2152, 1.570728778839111328125);
    float _2160 = exp2(_2112);
    float _2162 = _2132 * 0.636619746685028076171875;
    float2 _6095 = float2(_2118, _2138);
    float _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _2166 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = -_2158;
    float _2170 = fma(_2162, _2168, 1.0);
    float _2172 = _2148 * _2150;
    float _2174 = _2154 * _2150;
    float _2176 = fma(_2172, 0.5, 0.5);
    float _2178 = fma(_2174, -0.5, 0.5);
    float _2180 = -_2080;
    float _2182 = fma(_2160, _2146, _2180);
    float3 _6131 = float3(_2176, _2178, _2166);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6131, float3(0.0), isnan(_6131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6131, float3(0.0), isnan(_6131)), level(0.0)).x;
    float _2186 = fma(_2182, 0.5, 0.5);
    float3 _6144 = float3(_2176, _2178, _2166);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6144, float3(0.0), isnan(_6144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6144, float3(0.0), isnan(_6144)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6160 = float2(_2170, _2186);
    float3 _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6160, float2(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6160, float2(0.0), isnan(_6160)), level(0.0)).xyz;
    float _2203 = _2201.x;
    float _2205 = _2201.y;
    float _2207 = _2201.z;
    float _2209 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2211 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2213 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2215 = isnan(0.5);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2221 = _2217 || _2219;
    float _2223 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2225 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2209);
    float _2227 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2211);
    float _2229 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2231 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    float _2233 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2227);
    float _2235 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2241 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2243 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2235);
    float _2245 = 1.0 / _2237;
    float _2247 = _2239 + _2237;
    float _2249 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2229);
    float _2251 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2253 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2241);
    float _2255 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2253);
    float _2259 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2261 = _2124 * 0.5;
    float _2263 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2265 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2267 = _2247 * _2245;
    float _2269 = _2267 * 0.5;
    float _2271 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2265);
    float _2275 = exp2(_2259);
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2277);
    float _2281 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2283 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2285 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    float _2287 = 1.0 / _2279;
    float _2289 = -_2275;
    float _2291 = _2289 + 1.0;
    float _2293 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2295 = -_1608;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2283);
    float _2299 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2281);
    float _2301 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2263);
    float _2303 = -_1608;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2293);
    float _2307 = -_1608;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2223);
    float _2311 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2297);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2287 * _2313;
    float _2317 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2305);
    float _2319 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2309);
    float _2321 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2323 = abs(_2315);
    float _2325 = log2(_2323);
    float _2327 = _2251 * _2311;
    float _2329 = _2251 * _2317;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2333 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2335 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    float _2337 = _2251 * _2319;
    float _2339 = _2148 + _2124;
    float _2341 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2333);
    float _2343 = exp2(_2331);
    float _2345 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2249);
    float _2347 = fma(_2321, _2301, _2337);
    float _2349 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2341);
    float _2351 = _2327;
    float _2353 = _2257;
    float _2355 = _2124;
    float _2357 = _2154;
    if (!_2221)
    {
        _1728 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2359 = _1728;
    float _2361 = _2339 * 0.5;
    float _2363 = fma(_2343, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = fma(_2365, -2.0, 3.0);
    float _2369 = _2365 * _2365;
    float _2371 = _2369 * _2367;
    float _2373 = fma(_2321, _2299, _2327);
    if (!_2221)
    {
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = _2359 + _2375;
        _2351 = _2377;
    }
    float _2379 = _2351;
    float _2381 = fma(_2321, _2285, _2329);
    float _2383 = -_2371;
    float _2385 = _2383 + 1.0;
    float _2387 = in.m_72.x;
    float _2389 = _2311;
    float _2391 = _2385;
    if (!_2221)
    {
        float _2393 = 1.0 / _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    float _2397 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    bool _2399 = _2315 <= 8000.0;
    bool _2401 = isnan(_2315);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2371);
    float _2413 = _2397;
    if (!_2221)
    {
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = _2315 + _2415;
        _2353 = _2417;
    }
    float _2419 = _2353;
    if (_2221)
    {
        _2391 = 1.0;
    }
    float _2421 = _2391;
    float _2423 = _2397 + _2124;
    float _2425 = _2409 * _2411;
    float _2427 = _2345 + _2347;
    float _2429 = fma(_2154, -0.5, _2261);
    float _2431 = _2335 + _2373;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2435 = _2423 * 0.5;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2154;
    out.gl_Position.z = _2397;
    out.gl_Position.w = _2124;
    float _2437 = _2421;
    if (!_2221)
    {
        float _2439 = _2419 * _2395;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    float _2445 = _2349 + _2381;
    float _2447 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2361;
    out.m_74.y = _2429;
    out.m_74.z = _2435;
    out.m_74.w = _2124;
    bool _2449 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2451 = isnan(_1874);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2457 = _2453 || _2455;
    out.m_76.x = _2431;
    out.m_76.y = _2445;
    out.m_76.z = _2427;
    float _2459 = -_2447;
    float _2461 = _2459 + 1.0;
    float _2463 = _2461;
    if (!_2457)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2465 = _2355;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2457)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2471 = _2413;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2457)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2477 = _2357;
    float _2479 = -_2164;
    float _2481 = _2479 + 1.0;
    float _2483 = _2481 * _2433;
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -_2485;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2491 = _2489 * _2387;
    float _2493 = _2447 * _2184;
    float _2495 = _2491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2497 = _2197 * _2493;
    float _2499 = _2197 * _2461;
    out.m_78.x = _2495;
    float _2501 = _2193;
    float _2503 = _2191;
    float _2505 = _2477;
    float _2507 = _2477;
    if (!_2457)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = _2207 * _2493;
    float _2513 = fma(_2203, _2497, _2191);
    float _2515 = fma(_2205, _2497, _2193);
    float _2517 = _2509;
    float _2519 = _2509;
    if (!_2457)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2521 = _2501;
    float _2523 = fma(_2197, _2511, _2195);
    float _2525 = _2443 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2527 = _2521;
    float _2529 = _2521;
    if (!_2457)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2531 = _2503;
    out.m_80.x = _2513;
    out.m_80.y = _2515;
    out.m_80.z = _2523;
    out.m_80.w = _2499;
    bool _2533 = !_2457;
    float _2535 = _2531;
    float _2537 = _2531;
    if (!_2533)
    {
        bool _2539 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2541 = isnan(_1874);
        bool _2543 = _2539 || _2541;
        bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2547 = _2543 || _2545;
        if (!_2547)
        {
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2551 = _1874 + _2549;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2553;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2561 = 1.0 / _2555;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2579 = _2551 * _2561;
            float _2581 = precise::clamp(_2579, 0.0, 1.0);
            float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2587 = fma(_2581, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2537 = _2591;
            _2507 = _2595;
            _2529 = _2587;
            _2475 = _2593;
            _2469 = _2589;
            _2519 = _2597;
            _2599 = true;
        }
        else
        {
            bool _2601 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2603 = isnan(_1874);
            bool _2605 = _2601 || _2603;
            bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2609 = _2605 || _2607;
            if (!_2609)
            {
                _2527 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2611 = _2527;
            _2529 = _2611;
            if (!_2609)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2613 = _2535;
            _2537 = _2613;
            if (!_2609)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2615 = _2467;
            _2469 = _2615;
            if (!_2609)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2617 = _2473;
            _2475 = _2617;
            if (!_2609)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2619 = _2505;
            _2507 = _2619;
            if (!_2609)
            {
                _2517 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2621 = _2517;
            bool _2623 = !_2609;
            _2519 = _2621;
            if (!_2623)
            {
                bool _2625 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2627 = isnan(_1874);
                bool _2629 = _2625 || _2627;
                bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2633 = _2629 || _2631;
                if (!_2633)
                {
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2637 = _1874 + _2635;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2639;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2647 = 1.0 / _2641;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2665 = _2637 * _2647;
                    float _2667 = precise::clamp(_2665, 0.0, 1.0);
                    float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2537 = _2677;
                    _2507 = _2681;
                    _2529 = _2673;
                    _2475 = _2679;
                    _2469 = _2675;
                    _2519 = _2683;
                    _2599 = true;
                }
                else
                {
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2529 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2519 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2599 = false;
    float _2685 = _2537;
    float _2687 = _2507;
    float _2689 = _2529;
    float _2691 = _2475;
    float _2693 = _2469;
    float _2695 = _2519;
    float _2697 = _2525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2445, -0.5, 0.5);
    float _2701 = precise::clamp(_2699, 0.0, 1.0);
    float _2703 = -_2685;
    float _2705 = _2703 + _2687;
    float _2707 = -_2689;
    float _2709 = _2707 + _2691;
    out.m_82.x = 0.0;
    float _2711 = fma(_2701, _2705, _2685);
    float _2713 = -_2693;
    float _2715 = _2713 + _2695;
    float _2717 = fma(_2701, _2709, _2689);
    float _2719 = _2711 * 0.586610972881317138671875;
    bool _2721 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2723 = fma(_2701, _2715, _2693);
    out.m_53.x = _2697;
    float _2725 = fma(_2717, 0.298911988735198974609375, _2719);
    bool _2727 = _2443 > 0.0;
    bool _2729 = isnan(_2443);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = fma(_2723, 0.114477999508380889892578125, _2725);
    float _2739 = -_2737;
    float _2741 = _2717 + _2739;
    float _2743 = -_2737;
    float _2745 = _2711 + _2743;
    float _2747 = -_2737;
    float _2749 = _2723 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    bool _2757 = !_2721;
    if (!_2757)
    {
        float _2759 = -_1848;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1850;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1852;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2445 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2431, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2427, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2835;
        out.m_82.y = _2837;
        out.m_82.z = _2839;
    }
    out.m_84.x = _2751;
    out.m_84.y = _2753;
    out.m_84.z = _2755;
    if (_2735)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2599 = false;
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
        float _2910 = as_type<float>(_127);
        out.gl_Position.z = _2910;
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
        float _2965 = as_type<float>(_153);
        out.gl_Position.z = _2965;
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
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = float(_463);
    float _481 = 1.0 / _477;
    float _483 = float(uint(_471));
    float _485 = _465 * 2.0;
    int _487 = ~_471;
    int _489 = _487 + 1;
    float _491 = 1.0 / _479;
    float _493 = 1.0 / _483;
    float _495 = _491 * _109;
    float _497 = trunc(_495);
    int _499 = int(_497);
    int _501 = as_type<int>(_493) + (-2);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = float(uint(_499));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    bool _518 = !_505;
    float _520 = _518 ? 7.345489978790283203125 : 1.0;
    float _522 = float(_499);
    float _524 = _520 * _465;
    int _526 = _489 * int(_516);
    int _528 = _526 + _499;
    float _530 = float(uint(_528));
    float _532 = as_type<float>(_501) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = int(_516) + int(_538);
    float _542 = float(_471);
    float _544 = floor(_524);
    int _546 = _489 * _540;
    int _548 = _546 + _499;
    bool _550 = _522 >= _542;
    bool _552 = isnan(_522);
    bool _554 = _550 || _552;
    bool _556 = isnan(_542);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_471);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    bool _572 = _471 == 0;
    int _574 = ~_540;
    int _576 = _574 + _570;
    int _578 = _576 + 1;
    float _580 = -_544;
    float _582 = _524 + _580;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _471 * _578;
    int _602 = _600 + _499;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _606 = _604 != 0;
    bool _608 = !_572;
    int _610 = _608 ? _602 : (-1);
    float _612 = _582 * _542;
    float _614 = _542 * _109;
    int _616 = ~_566;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _614 * _157;
    float _626 = trunc(_612);
    int _628 = int(_626);
    int _630 = _610 * _620;
    int _632 = _471 + (-1);
    bool _634 = !_590;
    int _636 = _634 ? 0 : 1;
    bool _638 = !_586;
    int _640 = _638 ? 0 : 1;
    int _642 = _566 * _632;
    int _644 = _642 + _630;
    float _646 = trunc(_624);
    int _648 = int(_646);
    int _650 = abs(_636);
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    bool _656 = !_598;
    int _658 = _656 ? 0 : 1;
    int _660 = _644 * _650;
    int _662 = abs(_640);
    float _664 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _666 = abs(_654);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _670 = _668 != 0;
    float _672 = fma(_664, -2.0, _622);
    int _674 = abs(_658);
    bool _676 = !_670;
    int _678 = _676 ? 0 : 1;
    int _680 = _628 * _674;
    int _682 = _680 + _499;
    float _684 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = _648 * _662;
    int _688 = _686 + _660;
    int _690 = abs(_678);
    float _692 = -_473;
    float _694 = fma(_684, 2.0, _692);
    int _696 = _682 * _666;
    int _698 = _696 + _688;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _702 = _700 != 0;
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = _628 * _690;
    int _714 = _712 + _698;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _726 = float(uint(_714));
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _734 = isnan(0.0);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _740 = _736 || _738;
    float _742 = as_type<float>(_501) * _726;
    float _744 = 1.0 / _730;
    bool _746 = _465 > 0.5;
    float _748 = _706 * _109;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _756 = trunc(_742);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = in.m_58.z;
    float _770 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _772 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = ~_471;
    int _776 = _774 + 1;
    float _778 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _782 = exp2(_748);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _786 = _776 * int(_760);
    int _788 = _786 + _714;
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = floor(_485);
    float _800 = float(uint(_788));
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = _796 * _481;
    out.m_62.x = _762;
    out.m_62.y = _764;
    out.m_62.z = _766;
    out.m_62.w = _784;
    float _808 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _810 = as_type<float>(_501) * _800;
    float _812 = _804 * _744;
    float _814 = -_782;
    float _816 = _814 + 1.0;
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _740 ? _816 : 0.0;
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _842 = ~_471;
    int _844 = _842 + 1;
    float _846 = 1.0 / _838;
    float _848 = -_173;
    int _850 = _746 ? as_type<int>(_848) : as_type<int>(_173);
    float _852 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _840);
    int _854 = int(_760) + int(_822);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = _467 * 2.0;
    float _860 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _852);
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _864 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _866 = _798 > 0.0;
    float _868 = _467 + _465;
    bool _870 = _798 >= 0.0;
    bool _872 = isnan(_798);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _882 = floor(_858);
    if (_834)
    {
        float _884 = _824 * _846;
        _119 = _884;
    }
    float _886 = _119;
    float _888 = _467 + _768;
    int _890 = _844 * _854;
    int _892 = _890 + _714;
    float _894 = _868 + (-1.0);
    float _896 = _888 + (-1.0);
    float _898 = -_880;
    float _900 = _898 + 1.0;
    bool _902 = uint(_892) >= uint(_471);
    float _904 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _906 = _878 ? 0 : 1;
    float _908 = _768 * 2.0;
    bool _910 = !_902;
    int _912 = _910 ? 0 : (-1);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_860;
    float _924 = _922 + 1.0;
    int _926 = ~_854;
    int _928 = _926 + _912;
    int _930 = _928 + 1;
    bool _932 = _882 > 0.0;
    int _934 = _920;
    if (!_866)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    int _942 = _471 * _930;
    int _944 = _942 + _714;
    bool _946 = _882 >= 0.0;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = floor(_908);
    bool _958 = _467 > 0.5;
    float _960 = float(uint(_682));
    int _962 = _954 ? 0 : 1;
    float _964 = -_177;
    int _966 = _958 ? as_type<int>(_964) : as_type<int>(_177);
    float _968 = as_type<float>(_501) * _960;
    bool _970 = !_710;
    float _972 = _970 ? _173 : as_type<float>(_850);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = trunc(_968);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    bool _992 = !_572;
    int _994 = _992 ? _944 : (-1);
    bool _996 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_459);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    int _1008 = ~_962;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (!_932)
    {
        int _1016 = ~_962;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = -_1006;
    float _1024 = _1022 + 1.0;
    bool _1026 = !_606;
    float _1028 = _1026 ? _177 : as_type<float>(_966);
    int _1030 = _994 & 3;
    bool _1032 = _1030 != 0;
    bool _1034 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1036 = isnan(_459);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    int _1046 = _1032 ? 0 : 1;
    bool _1048 = _956 > 0.0;
    float _1050 = _1044 * _1024;
    bool _1052 = _956 >= 0.0;
    bool _1054 = isnan(_956);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1064 = _459 + _1062;
    bool _1066 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1068 = isnan(_459);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1044;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_471;
    int _1084 = _1082 + 1;
    float _1086 = fma(_806, _1064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1088 = _972 + 0.5;
    float _1090 = _1076 * _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1094 = _459 + _1092;
    int _1096 = _1084 * int(_990);
    int _1098 = _1096 + _682;
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    float _1102 = _1086 * _1090;
    int _1104 = _994 >> 31;
    float _1106 = fma(_812, _1094, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1108 = float(uint(_1098));
    float _1110 = _1028 + (-0.5);
    int _1112 = _1104 & 3;
    float _1114 = -_1076;
    float _1116 = _1114 + 1.0;
    float _1118 = -_924;
    float _1120 = fma(_972, _1118, _1100);
    float _1122 = -_1110;
    float _1124 = -_862;
    float _1126 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1124);
    int _1128 = _994 + _1112;
    float _1130 = as_type<float>(_501) * _1108;
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1102);
    float _1134 = fma(_1028, _900, _1126);
    int _1136 = _1128 >> 2;
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = fma(_1106, _1050, _1132);
    float _1146 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1148 = _1136 << 4;
    int _1150 = _1148 + 368;
    float _1152 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    bool _1154 = !_980;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1144);
    uint _1160 = uint(int(uint(_1150) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = int(_1160) + 1;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    int _1172 = _1168 & 3;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[int(_1170)][_1172];
    int _1176 = _994 & 3;
    bool _1178 = _1176 != 0;
    float _1180 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1182 = _1060 ? 0 : 1;
    out.m_64.x = _1120;
    out.m_64.y = _1134;
    bool _1184 = uint(_1176) > 1u;
    int _1186 = ~_1182;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _1190;
    if (!_1048)
    {
        int _1194 = ~_1182;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    int _1200 = _1150 + 8;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = abs(_1156);
    float _1220 = float(_940);
    float _1222 = float(_1218);
    int _1224 = int(_990) + int(_1142);
    int _1226 = ~_471;
    int _1228 = _1226 + 1;
    float _1230 = _1222 * _1220;
    bool _1232 = !_976;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _1180 + _1236;
    int _1240 = ~_1046;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    float _1246 = _1230 * (-2.0);
    bool _1248 = _1176 != 3;
    int _1250 = _1244;
    if (!_1184)
    {
        int _1252 = ~_1046;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_904, _1246, _904);
    float _1260 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1262 = abs(_1234);
    float _1264 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1266 = uint(_1176) >= 2u;
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1270 = _1260 + _1268;
    float _1272 = float(_1262);
    float _1274 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1276 = float(_1198);
    int _1278 = _1228 * _1224;
    int _1280 = _1278 + _682;
    int _1282 = _1266 ? 0 : 1;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = _1264 + _1284;
    int _1288 = abs(_1256);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1274);
    float _1292 = _1272 * _1276;
    int _1294 = ~_1282;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1302 = uint(_1280) >= uint(_471);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1306 = _1298;
    if (_1248)
    {
        int _1308 = ~_1282;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    float _1314 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1316 = !_1178;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _1176 != 3;
    float _1332 = _1292 * (-2.0);
    bool _1334 = !_1302;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1326 * as_type<int>(_1174);
    int _1340 = abs(_1318);
    bool _1342 = !_1330;
    int _1344 = _1342 ? 0 : (-1);
    bool _1346 = _1304 >= 0.0;
    float _1348 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1350 = !_702;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = ~_1224;
    int _1356 = _1354 + _1336;
    int _1358 = _1356 + 1;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1362 = abs(_1312);
    float _1364 = in.m_66.x;
    float _1366 = in.m_66.y;
    float _1368 = in.m_66.z;
    int _1370 = ~_1340;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _471 * _1358;
    int _1378 = _1376 + _682;
    int _1380 = abs(_1344);
    float _1382 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1384 = abs(_1352);
    int _1386 = _1374 * as_type<int>(_1166);
    int _1388 = _1386 + _1338;
    int _1390 = ~_1362;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = _1238 * _1238;
    out.m_68.x = _1328;
    out.m_68.y = _1360;
    out.m_68.z = _1320;
    out.m_68.w = _1382;
    int _1398 = ~_1380;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1394 * as_type<int>(_1208);
    int _1406 = _1404 + _1388;
    float _1408 = fma(_1270, _1270, _1396);
    int _1410 = ~_1384;
    int _1412 = _1410 + 1;
    int _1414 = _1412 + 1;
    float _1416 = _1320;
    if (_1346)
    {
        out.m_53.x = 0.0;
    }
    int _1418 = _1402 * as_type<int>(_1216);
    int _1420 = _1418 + _1406;
    float _1422 = fma(_1286, _1286, _1408);
    bool _1424 = !_572;
    int _1426 = _1424 ? _1378 : (-1);
    int _1428 = _1420 * _1414;
    float _1430 = rsqrt(_1422);
    int _1432 = _1426 * _1384;
    int _1434 = _1432 + _1428;
    if (_1346)
    {
        _1416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1416;
    float _1438 = fma(_914, _1332, _914);
    float _1440 = fma(_1332, _1364, _1364);
    float _1442 = _465 + (-0.5);
    int _1444 = as_type<int>(_1436);
    float _1446 = _1368;
    if (_1346)
    {
        float _1448 = _1436 * 5.0;
        _1444 = as_type<int>(_1448);
    }
    int _1450 = _1444;
    float _1452 = float(_1434);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1440);
    float _1456 = fma(_1246, _1366, _1366);
    bool _1458 = !_984;
    int _1460 = _1458 ? 0 : 1;
    if (_1346)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4926 = as_type<float>(_1450);
        out.gl_Position.z = _4926;
    }
    float _1462 = fma(_1438, _886, _1454);
    float _1464 = _467 + (-0.5);
    int _1466 = abs(_1460);
    out.m_70.x = _1452;
    float _1468 = _1238 * _1430;
    float _1470 = _1270 * _1430;
    float _1472 = _1468;
    if (_1346)
    {
        return out;
    }
    float _1474 = -_1468;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1478 = _1286 * _1430;
    float _1480 = -_1470;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1484 = _1462 * 0.15915493667125701904296875;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1482 + _1494;
    float _1498 = float(_1020);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1492 + _1502;
    float _1506 = float(_1466);
    float _1508 = -_1468;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1500);
    float _1514 = -_1470;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1456);
    float _1520 = _1506 * _1498;
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1512);
    float _1524 = _1510 * _1510;
    float _1526 = -_1478;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _1530 = _768 + _465;
    float _1532 = fma(_1258, _886, _1518);
    bool _1534 = _1522 >= 0.0;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = _1520 * (-2.0);
    float _1540 = _1530 + (-1.0);
    float _1542 = fma(_1528, _1528, _1536);
    float _1544 = _1532 * 0.15915493667125701904296875;
    float _1546 = fma(_1538, _1368, _1368);
    float _1548 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1550 = _1484 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = _768 + (-0.5);
    float _1556 = fma(_1548, _1538, _1548);
    float _1558 = _1504;
    if (_1534)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1560 = _1446;
    float _1562 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1546);
    int _1564 = as_type<int>(_1560);
    if (_1534)
    {
        out.m_53.x = 0.0;
    }
    float _1566 = _1484 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    if (_1534)
    {
        float _1570 = _1560 * 5.0;
        _1564 = as_type<int>(_1570);
    }
    int _1572 = _1564;
    float _1574 = fma(_1556, _886, _1562);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5128 = as_type<float>(_1572);
        out.gl_Position.z = _5128;
    }
    float _1576 = _1574 * 0.15915493667125701904296875;
    float _1578 = _1544 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = sqrt(_1542);
    float _1584 = _1544 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    if (_1534)
    {
        return out;
    }
    float _1588 = _1576 * 6.283185482025146484375;
    float _1590 = cos(_1588);
    float _1592 = _1430 * _1582;
    float _1594 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1598 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1600 = _1568 * _1586;
    float _1602 = _1592 * _1594;
    float _1604 = _1568 * _1580;
    float _1606 = _1576 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1592 * _1598;
    float _1612 = _1596 * _1602;
    float _1614 = _1552 * _1580;
    float _1616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1618 = _1552 * _1586;
    float _1620 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1622 = _1620 * 0.5;
    float _1624 = _1568 * _1590;
    float _1626 = _1616 * _1610;
    float _1628 = _1552 * _1590;
    float _1630 = _1586 * _1590;
    float _1632 = _1624 * _1612;
    float _1634 = _1580 * _1590;
    bool _1636 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1644 = _1640 || _1642;
    float _1646 = fma(_1608, _1600, _1614);
    float _1648 = -_1618;
    float _1650 = fma(_1608, _1604, _1648);
    float _1652 = -_1612;
    float _1654 = _1608 * _1652;
    float _1656 = -_1604;
    float _1658 = fma(_1608, _1618, _1656);
    float _1660 = fma(_1646, _1626, _1632);
    float _1662 = _1628 * _1612;
    float _1664 = fma(_1630, _1626, _1654);
    float _1666 = fma(_1608, _1614, _1600);
    float _1668 = fma(_1650, _1622, _1660);
    float _1670 = fma(_1658, _1626, _1662);
    float _1672 = fma(_1634, _1622, _1664);
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1676 = fma(_1666, _1622, _1670);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1680);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1682);
    float _1688 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1690 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1692 = _1264 + _1688;
    float _1694 = _1260 + _1690;
    float _1696 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1696);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1706);
    float _1712 = fma(_1704, _1704, _1708);
    float _1714 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1716 = sqrt(_1712);
    float _1718 = _1180 + _1714;
    bool _1720 = _1716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = _1714;
    float _1724 = _1710;
    float _1726 = _1662;
    float _1728 = _1666;
    if (!_1720)
    {
        _1722 = _1694;
    }
    float _1730 = _1722;
    float _1732 = _1730;
    if (!_1720)
    {
        _1724 = _1692;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1720)
    {
        _1726 = _1718;
    }
    float _1738 = _1726;
    bool _1740 = !_1720;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1716 + _1746;
        float _1750 = rsqrt(_1712);
        float _1752 = _1748 * _1744;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = _1752 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = _1760 + (-1.0);
        float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = fma(_1764, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1772 = fma(_1718, _1760, _1768);
        float _1774 = _1750 * _1770;
        float _1776 = fma(_1704, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1778 = fma(_1700, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1732 = _1776;
        _1742 = _1772;
        _1736 = _1778;
    }
    float _1780 = _1732;
    float _1782 = _1742;
    float _1784 = _1736;
    float _1786 = -_1470;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1780);
    float _1790 = -_1468;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _1794 = -_1478;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1798 = _1792;
    float _1800 = _1788;
    float _1802 = _1796;
    if (!_1644)
    {
        float _1804 = _1488 * _1488;
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1808 = -_1264;
        float _1810 = _1808 + _1784;
        float _1812 = fma(_1496, _1496, _1804);
        float _1814 = fma(_1504, _1504, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1818 = sqrt(_1814);
        float _1820 = 1.0 / _1592;
        float _1822 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1824 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1826 = _1824 * _1806;
        float _1828 = -_1260;
        float _1830 = _1828 + _1780;
        float _1832 = -_1180;
        float _1834 = _1832 + _1782;
        float _1836 = _1826 * _1820;
        float _1838 = _1822 * _1836;
        float _1840 = _1810 * _1836;
        float _1842 = fma(_1830, _1838, _1482);
        float _1844 = fma(_1834, _1838, _1476);
        float _1846 = fma(_1822, _1840, _1492);
        _1798 = _1844;
        _1800 = _1842;
        _1802 = _1846;
    }
    float _1848 = _1798;
    float _1850 = _1800;
    float _1852 = _1802;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1848 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1852 + _1862;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1860, _1860, _1866);
    float _1870 = fma(_1864, _1864, _1868);
    float _1872 = rsqrt(_1870);
    float _1874 = sqrt(_1870);
    float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1878 = _1860 * _1876;
    float _1880 = _1864 * _1876;
    float _1882 = _1878 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 + _1884;
    float _1888 = sqrt(_1886);
    bool _1890 = _1888 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = _1888 + _1892;
    float _1896 = _1864;
    float _1898 = _1886;
    float _1900 = _1894;
    float _1902 = _1856;
    if (_1890)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1904;
    }
    float _1906 = _1896;
    if (_1890)
    {
        float _1908 = rsqrt(_1886);
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1890)
    {
        float _1914 = _1894 * _1906;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1890)
    {
        float _1918 = _1916 * 0.15915493667125701904296875;
        _1472 = _1918;
    }
    float _1920 = _1472;
    float _1922 = _1872;
    float _1924 = _1920;
    if (_1890)
    {
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1934 = precise::max(0.0, _1932);
    float _1936 = _1906;
    float _1938 = _1934;
    if (_1890)
    {
        float _1940 = _1920 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        _1936 = _1942;
    }
    float _1944 = _1936;
    float _1946 = -_1876;
    float _1948 = -_1934;
    float _1950 = fma(_1856, _1946, _1948);
    if (_1890)
    {
        float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1952;
    }
    float _1954 = _1902;
    float _1956 = _1954;
    if (!_1890)
    {
        _1924 = _1884;
    }
    float _1958 = _1924;
    float _1960 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1930;
    float _1964 = _1958;
    if (_1890)
    {
        float _1966 = fma(_1930, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1966;
    }
    float _1968 = _1558;
    float _1970 = _1968;
    if (!_1890)
    {
        _1962 = _1950;
    }
    float _1972 = _1962;
    float _1974 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1976 = _1972;
    float _1978 = _1944;
    if (_1890)
    {
        float _1980 = _1944 + (-1.0);
        _1938 = _1980;
    }
    float _1982 = _1938;
    float _1984 = _1982;
    if (_1890)
    {
        float _1986 = _1910 * _1968;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (!_1890)
    {
        _1970 = _1878;
    }
    float _1990 = _1970;
    float _1992 = _1990;
    if (_1890)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1890)
    {
        float _1998 = _1878 * _1988;
        _1992 = _1998;
    }
    float _2000 = _1992;
    if (!_1890)
    {
        _1912 = _1882;
    }
    float _2002 = _1912;
    float _2004 = _2002;
    if (_1890)
    {
        float _2006 = fma(_1950, _1944, _1996);
        _1976 = _2006;
    }
    float _2008 = _1976;
    if (!_1890)
    {
        _1978 = _1880;
    }
    float _2010 = _1978;
    float _2012 = _2010;
    if (_1890)
    {
        float _2014 = _1880 * _1988;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1890)
    {
        float _2018 = _2000 * _2000;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1890)
    {
        float _2022 = _2016 * _2016;
        _1964 = _2022;
    }
    float _2024 = _1964;
    float _2026 = fma(_2008, _2008, _2020);
    float _2028 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2030 = _2026 + _2024;
    float _2032 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2028);
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2030);
    float _2042 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2044 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2056 = floor(_2044);
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2060 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2062 = -_2058;
    float _2064 = fma(_2062, _2054, 1.0);
    float _2066 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2068 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2060);
    float _2070 = _2040 * _2000;
    float _2072 = abs(_2048);
    float _2074 = log2(_2072);
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2066);
    float _2078 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2080 = _2040 * _2008;
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2084 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2088 = _2040 * _2016;
    float _2090 = -_2082;
    float _2092 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2090);
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2096 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2098 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _2100 = -_2088;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2092);
    float _2104 = floor(_2050);
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2096);
    float _2108 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2102, -0.5, 0.5);
    float _2112 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2116 = -_2056;
    float _2118 = _2044 + _2116;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2122 = log2(_2064);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2120);
    float _2130 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2132 = sqrt(_2110);
    float _2134 = fma(_2102, 0.5, 0.5);
    float _2136 = -_2104;
    float _2138 = _2050 + _2136;
    float _2140 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2142 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2144 = fma(_2134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = _2080 + 1.0;
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = 1.0 / _2124;
    float _2152 = fma(_2134, _2144, -0.212114393711090087890625);
    float _2154 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2156 = _2122 * 0.693147182464599609375;
    float _2158 = fma(_2134, _2152, 1.570728778839111328125);
    float _2160 = exp2(_2112);
    float _2162 = _2132 * 0.636619746685028076171875;
    float2 _6095 = float2(_2118, _2138);
    float _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _2166 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = -_2158;
    float _2170 = fma(_2162, _2168, 1.0);
    float _2172 = _2148 * _2150;
    float _2174 = _2154 * _2150;
    float _2176 = fma(_2172, 0.5, 0.5);
    float _2178 = fma(_2174, -0.5, 0.5);
    float _2180 = -_2080;
    float _2182 = fma(_2160, _2146, _2180);
    float3 _6131 = float3(_2176, _2178, _2166);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6131, float3(0.0), isnan(_6131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6131, float3(0.0), isnan(_6131)), level(0.0)).x;
    float _2186 = fma(_2182, 0.5, 0.5);
    float3 _6144 = float3(_2176, _2178, _2166);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6144, float3(0.0), isnan(_6144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6144, float3(0.0), isnan(_6144)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6160 = float2(_2170, _2186);
    float3 _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6160, float2(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6160, float2(0.0), isnan(_6160)), level(0.0)).xyz;
    float _2203 = _2201.x;
    float _2205 = _2201.y;
    float _2207 = _2201.z;
    float _2209 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2211 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2213 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2215 = isnan(0.5);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2221 = _2217 || _2219;
    float _2223 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2225 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2209);
    float _2227 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2211);
    float _2229 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2231 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    float _2233 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2227);
    float _2235 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2241 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2243 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2235);
    float _2245 = 1.0 / _2237;
    float _2247 = _2239 + _2237;
    float _2249 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2229);
    float _2251 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2253 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2241);
    float _2255 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2253);
    float _2259 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2261 = _2124 * 0.5;
    float _2263 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2265 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2267 = _2247 * _2245;
    float _2269 = _2267 * 0.5;
    float _2271 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2265);
    float _2275 = exp2(_2259);
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2277);
    float _2281 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2283 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2285 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    float _2287 = 1.0 / _2279;
    float _2289 = -_2275;
    float _2291 = _2289 + 1.0;
    float _2293 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2295 = -_1608;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2283);
    float _2299 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2281);
    float _2301 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2263);
    float _2303 = -_1608;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2293);
    float _2307 = -_1608;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2223);
    float _2311 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2297);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2287 * _2313;
    float _2317 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2305);
    float _2319 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2309);
    float _2321 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2323 = abs(_2315);
    float _2325 = log2(_2323);
    float _2327 = _2251 * _2311;
    float _2329 = _2251 * _2317;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2333 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2335 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    float _2337 = _2251 * _2319;
    float _2339 = _2148 + _2124;
    float _2341 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2333);
    float _2343 = exp2(_2331);
    float _2345 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2249);
    float _2347 = fma(_2321, _2301, _2337);
    float _2349 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2341);
    float _2351 = _2327;
    float _2353 = _2257;
    float _2355 = _2124;
    float _2357 = _2154;
    if (!_2221)
    {
        _1728 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2359 = _1728;
    float _2361 = _2339 * 0.5;
    float _2363 = fma(_2343, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = fma(_2365, -2.0, 3.0);
    float _2369 = _2365 * _2365;
    float _2371 = _2369 * _2367;
    float _2373 = fma(_2321, _2299, _2327);
    if (!_2221)
    {
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = _2359 + _2375;
        _2351 = _2377;
    }
    float _2379 = _2351;
    float _2381 = fma(_2321, _2285, _2329);
    float _2383 = -_2371;
    float _2385 = _2383 + 1.0;
    float _2387 = in.m_72.x;
    float _2389 = _2311;
    float _2391 = _2385;
    if (!_2221)
    {
        float _2393 = 1.0 / _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    float _2397 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    bool _2399 = _2315 <= 8000.0;
    bool _2401 = isnan(_2315);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2371);
    float _2413 = _2397;
    if (!_2221)
    {
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = _2315 + _2415;
        _2353 = _2417;
    }
    float _2419 = _2353;
    if (_2221)
    {
        _2391 = 1.0;
    }
    float _2421 = _2391;
    float _2423 = _2397 + _2124;
    float _2425 = _2409 * _2411;
    float _2427 = _2345 + _2347;
    float _2429 = fma(_2154, -0.5, _2261);
    float _2431 = _2335 + _2373;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2435 = _2423 * 0.5;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2154;
    out.gl_Position.z = _2397;
    out.gl_Position.w = _2124;
    float _2437 = _2421;
    if (!_2221)
    {
        float _2439 = _2419 * _2395;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    float _2445 = _2349 + _2381;
    float _2447 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2361;
    out.m_74.y = _2429;
    out.m_74.z = _2435;
    out.m_74.w = _2124;
    bool _2449 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2451 = isnan(_1874);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2457 = _2453 || _2455;
    out.m_76.x = _2431;
    out.m_76.y = _2445;
    out.m_76.z = _2427;
    float _2459 = -_2447;
    float _2461 = _2459 + 1.0;
    float _2463 = _2461;
    if (!_2457)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2465 = _2355;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2457)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2471 = _2413;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2457)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2477 = _2357;
    float _2479 = -_2164;
    float _2481 = _2479 + 1.0;
    float _2483 = _2481 * _2433;
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -_2485;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2491 = _2489 * _2387;
    float _2493 = _2447 * _2184;
    float _2495 = _2491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2497 = _2197 * _2493;
    float _2499 = _2197 * _2461;
    out.m_78.x = _2495;
    float _2501 = _2193;
    float _2503 = _2191;
    float _2505 = _2477;
    float _2507 = _2477;
    if (!_2457)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = _2207 * _2493;
    float _2513 = fma(_2203, _2497, _2191);
    float _2515 = fma(_2205, _2497, _2193);
    float _2517 = _2509;
    float _2519 = _2509;
    if (!_2457)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2521 = _2501;
    float _2523 = fma(_2197, _2511, _2195);
    float _2525 = _2443 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2527 = _2521;
    float _2529 = _2521;
    if (!_2457)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2531 = _2503;
    out.m_80.x = _2513;
    out.m_80.y = _2515;
    out.m_80.z = _2523;
    out.m_80.w = _2499;
    bool _2533 = !_2457;
    float _2535 = _2531;
    float _2537 = _2531;
    if (!_2533)
    {
        bool _2539 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2541 = isnan(_1874);
        bool _2543 = _2539 || _2541;
        bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2547 = _2543 || _2545;
        if (!_2547)
        {
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2551 = _1874 + _2549;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2553;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2561 = 1.0 / _2555;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2579 = _2551 * _2561;
            float _2581 = precise::clamp(_2579, 0.0, 1.0);
            float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2587 = fma(_2581, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2537 = _2591;
            _2507 = _2595;
            _2529 = _2587;
            _2475 = _2593;
            _2469 = _2589;
            _2519 = _2597;
            _2599 = true;
        }
        else
        {
            bool _2601 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2603 = isnan(_1874);
            bool _2605 = _2601 || _2603;
            bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2609 = _2605 || _2607;
            if (!_2609)
            {
                _2527 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2611 = _2527;
            _2529 = _2611;
            if (!_2609)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2613 = _2535;
            _2537 = _2613;
            if (!_2609)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2615 = _2467;
            _2469 = _2615;
            if (!_2609)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2617 = _2473;
            _2475 = _2617;
            if (!_2609)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2619 = _2505;
            _2507 = _2619;
            if (!_2609)
            {
                _2517 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2621 = _2517;
            bool _2623 = !_2609;
            _2519 = _2621;
            if (!_2623)
            {
                bool _2625 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2627 = isnan(_1874);
                bool _2629 = _2625 || _2627;
                bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2633 = _2629 || _2631;
                if (!_2633)
                {
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2637 = _1874 + _2635;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2639;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2647 = 1.0 / _2641;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2665 = _2637 * _2647;
                    float _2667 = precise::clamp(_2665, 0.0, 1.0);
                    float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2537 = _2677;
                    _2507 = _2681;
                    _2529 = _2673;
                    _2475 = _2679;
                    _2469 = _2675;
                    _2519 = _2683;
                    _2599 = true;
                }
                else
                {
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2529 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2519 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2599 = false;
    float _2685 = _2537;
    float _2687 = _2507;
    float _2689 = _2529;
    float _2691 = _2475;
    float _2693 = _2469;
    float _2695 = _2519;
    float _2697 = _2525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2445, -0.5, 0.5);
    float _2701 = precise::clamp(_2699, 0.0, 1.0);
    float _2703 = -_2685;
    float _2705 = _2703 + _2687;
    float _2707 = -_2689;
    float _2709 = _2707 + _2691;
    out.m_82.x = 0.0;
    float _2711 = fma(_2701, _2705, _2685);
    float _2713 = -_2693;
    float _2715 = _2713 + _2695;
    float _2717 = fma(_2701, _2709, _2689);
    float _2719 = _2711 * 0.586610972881317138671875;
    bool _2721 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2723 = fma(_2701, _2715, _2693);
    out.m_53.x = _2697;
    float _2725 = fma(_2717, 0.298911988735198974609375, _2719);
    bool _2727 = _2443 > 0.0;
    bool _2729 = isnan(_2443);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = fma(_2723, 0.114477999508380889892578125, _2725);
    float _2739 = -_2737;
    float _2741 = _2717 + _2739;
    float _2743 = -_2737;
    float _2745 = _2711 + _2743;
    float _2747 = -_2737;
    float _2749 = _2723 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    bool _2757 = !_2721;
    if (!_2757)
    {
        float _2759 = -_1848;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1850;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1852;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2445 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2431, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2427, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2835;
        out.m_82.y = _2837;
        out.m_82.z = _2839;
    }
    out.m_84.x = _2751;
    out.m_84.y = _2753;
    out.m_84.z = _2755;
    if (_2735)
    {
        return out;
    }
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2599 = false;
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
        float _2910 = as_type<float>(_127);
        out.gl_Position.z = _2910;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2965 = as_type<float>(_153);
        out.gl_Position.z = _2965;
    }
    if (_147)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _479 = float(_463);
    float _481 = 1.0 / _477;
    float _483 = float(uint(_471));
    float _485 = _465 * 2.0;
    int _487 = ~_471;
    int _489 = _487 + 1;
    float _491 = 1.0 / _479;
    float _493 = 1.0 / _483;
    float _495 = _491 * _109;
    float _497 = trunc(_495);
    int _499 = int(_497);
    int _501 = as_type<int>(_493) + (-2);
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _505 = _503 != 0;
    float _507 = float(uint(_499));
    float _509 = as_type<float>(_501) * _507;
    float _511 = trunc(_509);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    bool _518 = !_505;
    float _520 = _518 ? 7.345489978790283203125 : 1.0;
    float _522 = float(_499);
    float _524 = _520 * _465;
    int _526 = _489 * int(_516);
    int _528 = _526 + _499;
    float _530 = float(uint(_528));
    float _532 = as_type<float>(_501) * _530;
    float _534 = trunc(_532);
    float _536 = precise::max(_534, 0.0);
    uint _538 = uint(_536);
    int _540 = int(_516) + int(_538);
    float _542 = float(_471);
    float _544 = floor(_524);
    int _546 = _489 * _540;
    int _548 = _546 + _499;
    bool _550 = _522 >= _542;
    bool _552 = isnan(_522);
    bool _554 = _550 || _552;
    bool _556 = isnan(_542);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    bool _562 = uint(_548) >= uint(_471);
    float _564 = trunc(_560);
    int _566 = int(_564);
    bool _568 = !_562;
    int _570 = _568 ? 0 : (-1);
    bool _572 = _471 == 0;
    int _574 = ~_540;
    int _576 = _574 + _570;
    int _578 = _576 + 1;
    float _580 = -_544;
    float _582 = _524 + _580;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _586 = _584 != 0;
    int _588 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _590 = _588 != 0;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _598 = _596 != 0;
    int _600 = _471 * _578;
    int _602 = _600 + _499;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _606 = _604 != 0;
    bool _608 = !_572;
    int _610 = _608 ? _602 : (-1);
    float _612 = _582 * _542;
    float _614 = _542 * _109;
    int _616 = ~_566;
    int _618 = _616 + 1;
    int _620 = _618 + 1;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _624 = _614 * _157;
    float _626 = trunc(_612);
    int _628 = int(_626);
    int _630 = _610 * _620;
    int _632 = _471 + (-1);
    bool _634 = !_590;
    int _636 = _634 ? 0 : 1;
    bool _638 = !_586;
    int _640 = _638 ? 0 : 1;
    int _642 = _566 * _632;
    int _644 = _642 + _630;
    float _646 = trunc(_624);
    int _648 = int(_646);
    int _650 = abs(_636);
    bool _652 = !_594;
    int _654 = _652 ? 0 : 1;
    bool _656 = !_598;
    int _658 = _656 ? 0 : 1;
    int _660 = _644 * _650;
    int _662 = abs(_640);
    float _664 = _467 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _666 = abs(_654);
    int _668 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _670 = _668 != 0;
    float _672 = fma(_664, -2.0, _622);
    int _674 = abs(_658);
    bool _676 = !_670;
    int _678 = _676 ? 0 : 1;
    int _680 = _628 * _674;
    int _682 = _680 + _499;
    float _684 = _465 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _686 = _648 * _662;
    int _688 = _686 + _660;
    int _690 = abs(_678);
    float _692 = -_473;
    float _694 = fma(_684, 2.0, _692);
    int _696 = _682 * _666;
    int _698 = _696 + _688;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _702 = _700 != 0;
    float _704 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _706 = log2(_704);
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _710 = _708 != 0;
    int _712 = _628 * _690;
    int _714 = _712 + _698;
    float _716 = in.m_46.x;
    float _718 = in.m_46.y;
    float _720 = in.m_46.z;
    float _722 = -_109;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _694);
    float _726 = float(uint(_714));
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _732 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _734 = isnan(0.0);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _740 = _736 || _738;
    float _742 = as_type<float>(_501) * _726;
    float _744 = 1.0 / _730;
    bool _746 = _465 > 0.5;
    float _748 = _706 * _109;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _756 = trunc(_742);
    float _758 = precise::max(_756, 0.0);
    uint _760 = uint(_758);
    float _762 = _750 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _752 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _766 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = in.m_58.z;
    float _770 = _718 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _772 = _718 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _774 = ~_471;
    int _776 = _774 + 1;
    float _778 = _718 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _780 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[4].x, _770);
    float _782 = exp2(_748);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _786 = _776 * int(_760);
    int _788 = _786 + _714;
    float _790 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[5].x, _772);
    float _792 = fma(_716, (*spvDescriptorSet0.vp_c10)._m0[6].x, _778);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _794;
    float _798 = floor(_485);
    float _800 = float(uint(_788));
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _806 = _796 * _481;
    out.m_62.x = _762;
    out.m_62.y = _764;
    out.m_62.z = _766;
    out.m_62.w = _784;
    float _808 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[5].z, _790);
    float _810 = as_type<float>(_501) * _800;
    float _812 = _804 * _744;
    float _814 = -_782;
    float _816 = _814 + 1.0;
    float _818 = trunc(_810);
    float _820 = precise::max(_818, 0.0);
    uint _822 = uint(_820);
    float _824 = _740 ? _816 : 0.0;
    bool _826 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _828 = isnan(1.0);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _834 = _830 || _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _842 = ~_471;
    int _844 = _842 + 1;
    float _846 = 1.0 / _838;
    float _848 = -_173;
    int _850 = _746 ? as_type<int>(_848) : as_type<int>(_173);
    float _852 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[78].z, _840);
    int _854 = int(_760) + int(_822);
    float _856 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _858 = _467 * 2.0;
    float _860 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].z, _852);
    float _862 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[76].y, _672);
    float _864 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[78].w, _856);
    bool _866 = _798 > 0.0;
    float _868 = _467 + _465;
    bool _870 = _798 >= 0.0;
    bool _872 = isnan(_798);
    bool _874 = _870 || _872;
    bool _876 = isnan(0.0);
    bool _878 = _874 || _876;
    float _880 = fma(_109, (*spvDescriptorSet0.vp_c9)._m0[77].w, _864);
    float _882 = floor(_858);
    if (_834)
    {
        float _884 = _824 * _846;
        _119 = _884;
    }
    float _886 = _119;
    float _888 = _467 + _768;
    int _890 = _844 * _854;
    int _892 = _890 + _714;
    float _894 = _868 + (-1.0);
    float _896 = _888 + (-1.0);
    float _898 = -_880;
    float _900 = _898 + 1.0;
    bool _902 = uint(_892) >= uint(_471);
    float _904 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _906 = _878 ? 0 : 1;
    float _908 = _768 * 2.0;
    bool _910 = !_902;
    int _912 = _910 ? 0 : (-1);
    float _914 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _916 = ~_906;
    int _918 = _916 + 1;
    int _920 = _918 + 1;
    float _922 = -_860;
    float _924 = _922 + 1.0;
    int _926 = ~_854;
    int _928 = _926 + _912;
    int _930 = _928 + 1;
    bool _932 = _882 > 0.0;
    int _934 = _920;
    if (!_866)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    int _942 = _471 * _930;
    int _944 = _942 + _714;
    bool _946 = _882 >= 0.0;
    bool _948 = isnan(_882);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    float _956 = floor(_908);
    bool _958 = _467 > 0.5;
    float _960 = float(uint(_682));
    int _962 = _954 ? 0 : 1;
    float _964 = -_177;
    int _966 = _958 ? as_type<int>(_964) : as_type<int>(_177);
    float _968 = as_type<float>(_501) * _960;
    bool _970 = !_710;
    float _972 = _970 ? _173 : as_type<float>(_850);
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _976 = _974 != 0;
    int _978 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _980 = _978 != 0;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _984 = _982 != 0;
    float _986 = trunc(_968);
    float _988 = precise::max(_986, 0.0);
    uint _990 = uint(_988);
    bool _992 = !_572;
    int _994 = _992 ? _944 : (-1);
    bool _996 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _998 = isnan(_459);
    bool _1000 = _996 || _998;
    bool _1002 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1004 = _1000 || _1002;
    float _1006 = float(_1004);
    int _1008 = ~_962;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    int _1014 = _1012;
    if (!_932)
    {
        int _1016 = ~_962;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = -_1006;
    float _1024 = _1022 + 1.0;
    bool _1026 = !_606;
    float _1028 = _1026 ? _177 : as_type<float>(_966);
    int _1030 = _994 & 3;
    bool _1032 = _1030 != 0;
    bool _1034 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1036 = isnan(_459);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    int _1046 = _1032 ? 0 : 1;
    bool _1048 = _956 > 0.0;
    float _1050 = _1044 * _1024;
    bool _1052 = _956 >= 0.0;
    bool _1054 = isnan(_956);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1064 = _459 + _1062;
    bool _1066 = _459 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1068 = isnan(_459);
    bool _1070 = _1066 || _1068;
    bool _1072 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1074 = _1070 || _1072;
    float _1076 = float(_1074);
    float _1078 = -_1044;
    float _1080 = _1078 + 1.0;
    int _1082 = ~_471;
    int _1084 = _1082 + 1;
    float _1086 = fma(_806, _1064, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1088 = _972 + 0.5;
    float _1090 = _1076 * _1080;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1094 = _459 + _1092;
    int _1096 = _1084 * int(_990);
    int _1098 = _1096 + _682;
    float _1100 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[80].x, _724);
    float _1102 = _1086 * _1090;
    int _1104 = _994 >> 31;
    float _1106 = fma(_812, _1094, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1108 = float(uint(_1098));
    float _1110 = _1028 + (-0.5);
    int _1112 = _1104 & 3;
    float _1114 = -_1076;
    float _1116 = _1114 + 1.0;
    float _1118 = -_924;
    float _1120 = fma(_972, _1118, _1100);
    float _1122 = -_1110;
    float _1124 = -_862;
    float _1126 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1124);
    int _1128 = _994 + _1112;
    float _1130 = as_type<float>(_501) * _1108;
    float _1132 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1102);
    float _1134 = fma(_1028, _900, _1126);
    int _1136 = _1128 >> 2;
    float _1138 = trunc(_1130);
    float _1140 = precise::max(_1138, 0.0);
    uint _1142 = uint(_1140);
    float _1144 = fma(_1106, _1050, _1132);
    float _1146 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1148 = _1136 << 4;
    int _1150 = _1148 + 368;
    float _1152 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    bool _1154 = !_980;
    int _1156 = _1154 ? 0 : 1;
    float _1158 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1144);
    uint _1160 = uint(int(uint(_1150) >> uint(2)));
    uint _1162 = uint(int(uint(int(_1160)) >> uint(2)));
    int _1164 = int(_1160) & 3;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[int(_1162)][_1164];
    int _1168 = int(_1160) + 1;
    uint _1170 = uint(int(uint(_1168) >> uint(2)));
    int _1172 = _1168 & 3;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[int(_1170)][_1172];
    int _1176 = _994 & 3;
    bool _1178 = _1176 != 0;
    float _1180 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1182 = _1060 ? 0 : 1;
    out.m_64.x = _1120;
    out.m_64.y = _1134;
    bool _1184 = uint(_1176) > 1u;
    int _1186 = ~_1182;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    int _1192 = _1190;
    if (!_1048)
    {
        int _1194 = ~_1182;
        int _1196 = _1194 + 1;
        _1192 = _1196;
    }
    int _1198 = _1192;
    int _1200 = _1150 + 8;
    uint _1202 = uint(int(uint(_1200) >> uint(2)));
    uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
    int _1206 = int(_1202) & 3;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[int(_1204)][_1206];
    int _1210 = int(_1202) + 1;
    uint _1212 = uint(int(uint(_1210) >> uint(2)));
    int _1214 = _1210 & 3;
    float _1216 = (*spvDescriptorSet0.vp_c9)._m0[int(_1212)][_1214];
    int _1218 = abs(_1156);
    float _1220 = float(_940);
    float _1222 = float(_1218);
    int _1224 = int(_990) + int(_1142);
    int _1226 = ~_471;
    int _1228 = _1226 + 1;
    float _1230 = _1222 * _1220;
    bool _1232 = !_976;
    int _1234 = _1232 ? 0 : 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1238 = _1180 + _1236;
    int _1240 = ~_1046;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    float _1246 = _1230 * (-2.0);
    bool _1248 = _1176 != 3;
    int _1250 = _1244;
    if (!_1184)
    {
        int _1252 = ~_1046;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = fma(_904, _1246, _904);
    float _1260 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1262 = abs(_1234);
    float _1264 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1266 = uint(_1176) >= 2u;
    float _1268 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1270 = _1260 + _1268;
    float _1272 = float(_1262);
    float _1274 = _1238 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1276 = float(_1198);
    int _1278 = _1228 * _1224;
    int _1280 = _1278 + _682;
    int _1282 = _1266 ? 0 : 1;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1286 = _1264 + _1284;
    int _1288 = abs(_1256);
    float _1290 = fma(_1270, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1274);
    float _1292 = _1272 * _1276;
    int _1294 = ~_1282;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = _435 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1302 = uint(_1280) >= uint(_471);
    float _1304 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1290);
    int _1306 = _1298;
    if (_1248)
    {
        int _1308 = ~_1282;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    float _1314 = _431 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1316 = !_1178;
    int _1318 = _1316 ? 0 : 1;
    float _1320 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1322 = ~_1288;
    int _1324 = _1322 + 1;
    int _1326 = _1324 + 1;
    float _1328 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1330 = _1176 != 3;
    float _1332 = _1292 * (-2.0);
    bool _1334 = !_1302;
    int _1336 = _1334 ? 0 : (-1);
    int _1338 = _1326 * as_type<int>(_1174);
    int _1340 = abs(_1318);
    bool _1342 = !_1330;
    int _1344 = _1342 ? 0 : (-1);
    bool _1346 = _1304 >= 0.0;
    float _1348 = _433 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1350 = !_702;
    int _1352 = _1350 ? 0 : 1;
    int _1354 = ~_1224;
    int _1356 = _1354 + _1336;
    int _1358 = _1356 + 1;
    float _1360 = _1348 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1362 = abs(_1312);
    float _1364 = in.m_66.x;
    float _1366 = in.m_66.y;
    float _1368 = in.m_66.z;
    int _1370 = ~_1340;
    int _1372 = _1370 + 1;
    int _1374 = _1372 + 1;
    int _1376 = _471 * _1358;
    int _1378 = _1376 + _682;
    int _1380 = abs(_1344);
    float _1382 = _1158 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1384 = abs(_1352);
    int _1386 = _1374 * as_type<int>(_1166);
    int _1388 = _1386 + _1338;
    int _1390 = ~_1362;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = _1238 * _1238;
    out.m_68.x = _1328;
    out.m_68.y = _1360;
    out.m_68.z = _1320;
    out.m_68.w = _1382;
    int _1398 = ~_1380;
    int _1400 = _1398 + 1;
    int _1402 = _1400 + 1;
    int _1404 = _1394 * as_type<int>(_1208);
    int _1406 = _1404 + _1388;
    float _1408 = fma(_1270, _1270, _1396);
    int _1410 = ~_1384;
    int _1412 = _1410 + 1;
    int _1414 = _1412 + 1;
    float _1416 = _1320;
    if (_1346)
    {
        out.m_53.x = 0.0;
    }
    int _1418 = _1402 * as_type<int>(_1216);
    int _1420 = _1418 + _1406;
    float _1422 = fma(_1286, _1286, _1408);
    bool _1424 = !_572;
    int _1426 = _1424 ? _1378 : (-1);
    int _1428 = _1420 * _1414;
    float _1430 = rsqrt(_1422);
    int _1432 = _1426 * _1384;
    int _1434 = _1432 + _1428;
    if (_1346)
    {
        _1416 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1436 = _1416;
    float _1438 = fma(_914, _1332, _914);
    float _1440 = fma(_1332, _1364, _1364);
    float _1442 = _465 + (-0.5);
    int _1444 = as_type<int>(_1436);
    float _1446 = _1368;
    if (_1346)
    {
        float _1448 = _1436 * 5.0;
        _1444 = as_type<int>(_1448);
    }
    int _1450 = _1444;
    float _1452 = float(_1434);
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1440);
    float _1456 = fma(_1246, _1366, _1366);
    bool _1458 = !_984;
    int _1460 = _1458 ? 0 : 1;
    if (_1346)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4926 = as_type<float>(_1450);
        out.gl_Position.z = _4926;
    }
    float _1462 = fma(_1438, _886, _1454);
    float _1464 = _467 + (-0.5);
    int _1466 = abs(_1460);
    out.m_70.x = _1452;
    float _1468 = _1238 * _1430;
    float _1470 = _1270 * _1430;
    float _1472 = _1468;
    if (_1346)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1474 = -_1468;
    float _1476 = fma(_1474, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1478 = _1286 * _1430;
    float _1480 = -_1470;
    float _1482 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1484 = _1462 * 0.15915493667125701904296875;
    float _1486 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1488 = _1476 + _1486;
    float _1490 = -_1478;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1264);
    float _1494 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1496 = _1482 + _1494;
    float _1498 = float(_1020);
    float _1500 = _1488 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1504 = _1492 + _1502;
    float _1506 = float(_1466);
    float _1508 = -_1468;
    float _1510 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1512 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1500);
    float _1514 = -_1470;
    float _1516 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1518 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1456);
    float _1520 = _1506 * _1498;
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1512);
    float _1524 = _1510 * _1510;
    float _1526 = -_1478;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1286);
    float _1530 = _768 + _465;
    float _1532 = fma(_1258, _886, _1518);
    bool _1534 = _1522 >= 0.0;
    float _1536 = fma(_1516, _1516, _1524);
    float _1538 = _1520 * (-2.0);
    float _1540 = _1530 + (-1.0);
    float _1542 = fma(_1528, _1528, _1536);
    float _1544 = _1532 * 0.15915493667125701904296875;
    float _1546 = fma(_1538, _1368, _1368);
    float _1548 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1550 = _1484 * 6.283185482025146484375;
    float _1552 = sin(_1550);
    float _1554 = _768 + (-0.5);
    float _1556 = fma(_1548, _1538, _1548);
    float _1558 = _1504;
    if (_1534)
    {
        _1446 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1560 = _1446;
    float _1562 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1546);
    int _1564 = as_type<int>(_1560);
    if (_1534)
    {
        out.m_53.x = 0.0;
    }
    float _1566 = _1484 * 6.283185482025146484375;
    float _1568 = cos(_1566);
    if (_1534)
    {
        float _1570 = _1560 * 5.0;
        _1564 = as_type<int>(_1570);
    }
    int _1572 = _1564;
    float _1574 = fma(_1556, _886, _1562);
    if (_1534)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5128 = as_type<float>(_1572);
        out.gl_Position.z = _5128;
    }
    float _1576 = _1574 * 0.15915493667125701904296875;
    float _1578 = _1544 * 6.283185482025146484375;
    float _1580 = sin(_1578);
    float _1582 = sqrt(_1542);
    float _1584 = _1544 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    if (_1534)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1588 = _1576 * 6.283185482025146484375;
    float _1590 = cos(_1588);
    float _1592 = _1430 * _1582;
    float _1594 = _377 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _1598 = _429 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1600 = _1568 * _1586;
    float _1602 = _1592 * _1594;
    float _1604 = _1568 * _1580;
    float _1606 = _1576 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = _1592 * _1598;
    float _1612 = _1596 * _1602;
    float _1614 = _1552 * _1580;
    float _1616 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _173);
    float _1618 = _1552 * _1586;
    float _1620 = _1592 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1622 = _1620 * 0.5;
    float _1624 = _1568 * _1590;
    float _1626 = _1616 * _1610;
    float _1628 = _1552 * _1590;
    float _1630 = _1586 * _1590;
    float _1632 = _1624 * _1612;
    float _1634 = _1580 * _1590;
    bool _1636 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    bool _1642 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1644 = _1640 || _1642;
    float _1646 = fma(_1608, _1600, _1614);
    float _1648 = -_1618;
    float _1650 = fma(_1608, _1604, _1648);
    float _1652 = -_1612;
    float _1654 = _1608 * _1652;
    float _1656 = -_1604;
    float _1658 = fma(_1608, _1618, _1656);
    float _1660 = fma(_1646, _1626, _1632);
    float _1662 = _1628 * _1612;
    float _1664 = fma(_1630, _1626, _1654);
    float _1666 = fma(_1608, _1614, _1600);
    float _1668 = fma(_1650, _1622, _1660);
    float _1670 = fma(_1658, _1626, _1662);
    float _1672 = fma(_1634, _1622, _1664);
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1676 = fma(_1666, _1622, _1670);
    float _1678 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1680 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1674);
    float _1682 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1678);
    float _1684 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1680);
    float _1686 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1682);
    float _1688 = _1684 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1690 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1692 = _1264 + _1688;
    float _1694 = _1260 + _1690;
    float _1696 = _1668 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1700 = _1692 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1696);
    float _1708 = _1700 * _1700;
    float _1710 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1706);
    float _1712 = fma(_1704, _1704, _1708);
    float _1714 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1716 = sqrt(_1712);
    float _1718 = _1180 + _1714;
    bool _1720 = _1716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = _1714;
    float _1724 = _1710;
    float _1726 = _1662;
    float _1728 = _1666;
    if (!_1720)
    {
        _1722 = _1694;
    }
    float _1730 = _1722;
    float _1732 = _1730;
    if (!_1720)
    {
        _1724 = _1692;
    }
    float _1734 = _1724;
    float _1736 = _1734;
    if (!_1720)
    {
        _1726 = _1718;
    }
    float _1738 = _1726;
    bool _1740 = !_1720;
    float _1742 = _1738;
    if (!_1740)
    {
        float _1744 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1746 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1748 = _1716 + _1746;
        float _1750 = rsqrt(_1712);
        float _1752 = _1748 * _1744;
        float _1754 = _1718 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1756 = _1752 * 0.15915493667125701904296875;
        float _1758 = _1756 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        float _1762 = _1756 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = _1760 + (-1.0);
        float _1768 = _1766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1770 = fma(_1764, _1754, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1772 = fma(_1718, _1760, _1768);
        float _1774 = _1750 * _1770;
        float _1776 = fma(_1704, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1778 = fma(_1700, _1774, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1732 = _1776;
        _1742 = _1772;
        _1736 = _1778;
    }
    float _1780 = _1732;
    float _1782 = _1742;
    float _1784 = _1736;
    float _1786 = -_1470;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1780);
    float _1790 = -_1468;
    float _1792 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1782);
    float _1794 = -_1478;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1784);
    float _1798 = _1792;
    float _1800 = _1788;
    float _1802 = _1796;
    if (!_1644)
    {
        float _1804 = _1488 * _1488;
        float _1806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1808 = -_1264;
        float _1810 = _1808 + _1784;
        float _1812 = fma(_1496, _1496, _1804);
        float _1814 = fma(_1504, _1504, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1818 = sqrt(_1814);
        float _1820 = 1.0 / _1592;
        float _1822 = _1816 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1824 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1826 = _1824 * _1806;
        float _1828 = -_1260;
        float _1830 = _1828 + _1780;
        float _1832 = -_1180;
        float _1834 = _1832 + _1782;
        float _1836 = _1826 * _1820;
        float _1838 = _1822 * _1836;
        float _1840 = _1810 * _1836;
        float _1842 = fma(_1830, _1838, _1482);
        float _1844 = fma(_1834, _1838, _1476);
        float _1846 = fma(_1822, _1840, _1492);
        _1798 = _1844;
        _1800 = _1842;
        _1802 = _1846;
    }
    float _1848 = _1798;
    float _1850 = _1800;
    float _1852 = _1802;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1856 = _1848 + _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1860 = _1850 + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1864 = _1852 + _1862;
    float _1866 = _1856 * _1856;
    float _1868 = fma(_1860, _1860, _1866);
    float _1870 = fma(_1864, _1864, _1868);
    float _1872 = rsqrt(_1870);
    float _1874 = sqrt(_1870);
    float _1876 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1878 = _1860 * _1876;
    float _1880 = _1864 * _1876;
    float _1882 = _1878 * _1878;
    float _1884 = _1880 * _1880;
    float _1886 = _1882 + _1884;
    float _1888 = sqrt(_1886);
    bool _1890 = _1888 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = _1888 + _1892;
    float _1896 = _1864;
    float _1898 = _1886;
    float _1900 = _1894;
    float _1902 = _1856;
    if (_1890)
    {
        float _1904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1896 = _1904;
    }
    float _1906 = _1896;
    if (_1890)
    {
        float _1908 = rsqrt(_1886);
        _1898 = _1908;
    }
    float _1910 = _1898;
    float _1912 = _1910;
    if (_1890)
    {
        float _1914 = _1894 * _1906;
        _1900 = _1914;
    }
    float _1916 = _1900;
    if (_1890)
    {
        float _1918 = _1916 * 0.15915493667125701904296875;
        _1472 = _1918;
    }
    float _1920 = _1472;
    float _1922 = _1872;
    float _1924 = _1920;
    if (_1890)
    {
        float _1926 = _1920 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        _1922 = _1928;
    }
    float _1930 = _1922;
    float _1932 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1934 = precise::max(0.0, _1932);
    float _1936 = _1906;
    float _1938 = _1934;
    if (_1890)
    {
        float _1940 = _1920 * 6.283185482025146484375;
        float _1942 = cos(_1940);
        _1936 = _1942;
    }
    float _1944 = _1936;
    float _1946 = -_1876;
    float _1948 = -_1934;
    float _1950 = fma(_1856, _1946, _1948);
    if (_1890)
    {
        float _1952 = _1950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1952;
    }
    float _1954 = _1902;
    float _1956 = _1954;
    if (!_1890)
    {
        _1924 = _1884;
    }
    float _1958 = _1924;
    float _1960 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1930;
    float _1964 = _1958;
    if (_1890)
    {
        float _1966 = fma(_1930, _1954, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1558 = _1966;
    }
    float _1968 = _1558;
    float _1970 = _1968;
    if (!_1890)
    {
        _1962 = _1950;
    }
    float _1972 = _1962;
    float _1974 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1976 = _1972;
    float _1978 = _1944;
    if (_1890)
    {
        float _1980 = _1944 + (-1.0);
        _1938 = _1980;
    }
    float _1982 = _1938;
    float _1984 = _1982;
    if (_1890)
    {
        float _1986 = _1910 * _1968;
        _1956 = _1986;
    }
    float _1988 = _1956;
    if (!_1890)
    {
        _1970 = _1878;
    }
    float _1990 = _1970;
    float _1992 = _1990;
    if (_1890)
    {
        float _1994 = _1982 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1994;
    }
    float _1996 = _1984;
    if (_1890)
    {
        float _1998 = _1878 * _1988;
        _1992 = _1998;
    }
    float _2000 = _1992;
    if (!_1890)
    {
        _1912 = _1882;
    }
    float _2002 = _1912;
    float _2004 = _2002;
    if (_1890)
    {
        float _2006 = fma(_1950, _1944, _1996);
        _1976 = _2006;
    }
    float _2008 = _1976;
    if (!_1890)
    {
        _1978 = _1880;
    }
    float _2010 = _1978;
    float _2012 = _2010;
    if (_1890)
    {
        float _2014 = _1880 * _1988;
        _2012 = _2014;
    }
    float _2016 = _2012;
    if (_1890)
    {
        float _2018 = _2000 * _2000;
        _2004 = _2018;
    }
    float _2020 = _2004;
    if (_1890)
    {
        float _2022 = _2016 * _2016;
        _1964 = _2022;
    }
    float _2024 = _1964;
    float _2026 = fma(_2008, _2008, _2020);
    float _2028 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2030 = _2026 + _2024;
    float _2032 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2028);
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2036 = fma(_1874, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2034);
    float _2038 = precise::clamp(_2036, 0.0, 1.0);
    float _2040 = rsqrt(_2030);
    float _2042 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2032);
    float _2044 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2046 = -_2038;
    float _2048 = _2046 + 1.0;
    float _2050 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2054 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2056 = floor(_2044);
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2060 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2062 = -_2058;
    float _2064 = fma(_2062, _2054, 1.0);
    float _2066 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2068 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2060);
    float _2070 = _2040 * _2000;
    float _2072 = abs(_2048);
    float _2074 = log2(_2072);
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2066);
    float _2078 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2068);
    float _2080 = _2040 * _2008;
    float _2082 = _2070 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2084 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2076);
    float _2086 = _2078 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2088 = _2040 * _2016;
    float _2090 = -_2082;
    float _2092 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2090);
    float _2094 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2096 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2098 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1974);
    float _2100 = -_2088;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2092);
    float _2104 = floor(_2050);
    float _2106 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2096);
    float _2108 = _2098 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2110 = fma(_2102, -0.5, 0.5);
    float _2112 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2106);
    float _2116 = -_2056;
    float _2118 = _2044 + _2116;
    float _2120 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2122 = log2(_2064);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2114);
    float _2126 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2128 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2120);
    float _2130 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2126);
    float _2132 = sqrt(_2110);
    float _2134 = fma(_2102, 0.5, 0.5);
    float _2136 = -_2104;
    float _2138 = _2050 + _2136;
    float _2140 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2128);
    float _2142 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2130);
    float _2144 = fma(_2134, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2146 = _2080 + 1.0;
    float _2148 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2150 = 1.0 / _2124;
    float _2152 = fma(_2134, _2144, -0.212114393711090087890625);
    float _2154 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2142);
    float _2156 = _2122 * 0.693147182464599609375;
    float _2158 = fma(_2134, _2152, 1.570728778839111328125);
    float _2160 = exp2(_2112);
    float _2162 = _2132 * 0.636619746685028076171875;
    float2 _6095 = float2(_2118, _2138);
    float _2164 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6095, float2(0.0), isnan(_6095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6095, float2(0.0), isnan(_6095)), level(0.0)).x;
    float _2166 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = -_2158;
    float _2170 = fma(_2162, _2168, 1.0);
    float _2172 = _2148 * _2150;
    float _2174 = _2154 * _2150;
    float _2176 = fma(_2172, 0.5, 0.5);
    float _2178 = fma(_2174, -0.5, 0.5);
    float _2180 = -_2080;
    float _2182 = fma(_2160, _2146, _2180);
    float3 _6131 = float3(_2176, _2178, _2166);
    float _2184 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6131, float3(0.0), isnan(_6131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6131, float3(0.0), isnan(_6131)), level(0.0)).x;
    float _2186 = fma(_2182, 0.5, 0.5);
    float3 _6144 = float3(_2176, _2178, _2166);
    float4 _2189 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6144, float3(0.0), isnan(_6144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6144, float3(0.0), isnan(_6144)), level(0.0)).xyzw;
    float _2191 = _2189.x;
    float _2193 = _2189.y;
    float _2195 = _2189.z;
    float _2197 = _2189.w;
    float2 _6160 = float2(_2170, _2186);
    float3 _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6160, float2(0.0), isnan(_6160)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6160, float2(0.0), isnan(_6160)), level(0.0)).xyz;
    float _2203 = _2201.x;
    float _2205 = _2201.y;
    float _2207 = _2201.z;
    float _2209 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2211 = _1476 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2213 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2215 = isnan(0.5);
    bool _2217 = _2213 || _2215;
    bool _2219 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2221 = _2217 || _2219;
    float _2223 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2225 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2209);
    float _2227 = fma(_1482, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2211);
    float _2229 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2231 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2225);
    float _2233 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2227);
    float _2235 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2237 = _2231 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2239 = _2233 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2241 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2243 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2235);
    float _2245 = 1.0 / _2237;
    float _2247 = _2239 + _2237;
    float _2249 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2229);
    float _2251 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2253 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2241);
    float _2255 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2257 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2253);
    float _2259 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2261 = _2124 * 0.5;
    float _2263 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2255);
    float _2265 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2267 = _2247 * _2245;
    float _2269 = _2267 * 0.5;
    float _2271 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2273 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2265);
    float _2275 = exp2(_2259);
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2279 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2277);
    float _2281 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2271);
    float _2283 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2285 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2243);
    float _2287 = 1.0 / _2279;
    float _2289 = -_2275;
    float _2291 = _2289 + 1.0;
    float _2293 = _1624 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2295 = -_1608;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2283);
    float _2299 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2281);
    float _2301 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2263);
    float _2303 = -_1608;
    float _2305 = fma(_2303, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2293);
    float _2307 = -_1608;
    float _2309 = fma(_2307, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2223);
    float _2311 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2297);
    float _2313 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2315 = _2287 * _2313;
    float _2317 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2305);
    float _2319 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2309);
    float _2321 = _173 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2323 = abs(_2315);
    float _2325 = log2(_2323);
    float _2327 = _2251 * _2311;
    float _2329 = _2251 * _2317;
    float _2331 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2333 = _1650 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2335 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2273);
    float _2337 = _2251 * _2319;
    float _2339 = _2148 + _2124;
    float _2341 = fma(_1634, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2333);
    float _2343 = exp2(_2331);
    float _2345 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2249);
    float _2347 = fma(_2321, _2301, _2337);
    float _2349 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2341);
    float _2351 = _2327;
    float _2353 = _2257;
    float _2355 = _2124;
    float _2357 = _2154;
    if (!_2221)
    {
        _1728 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2359 = _1728;
    float _2361 = _2339 * 0.5;
    float _2363 = fma(_2343, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2365 = precise::clamp(_2363, 0.0, 1.0);
    float _2367 = fma(_2365, -2.0, 3.0);
    float _2369 = _2365 * _2365;
    float _2371 = _2369 * _2367;
    float _2373 = fma(_2321, _2299, _2327);
    if (!_2221)
    {
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = _2359 + _2375;
        _2351 = _2377;
    }
    float _2379 = _2351;
    float _2381 = fma(_2321, _2285, _2329);
    float _2383 = -_2371;
    float _2385 = _2383 + 1.0;
    float _2387 = in.m_72.x;
    float _2389 = _2311;
    float _2391 = _2385;
    if (!_2221)
    {
        float _2393 = 1.0 / _2379;
        _2389 = _2393;
    }
    float _2395 = _2389;
    float _2397 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2257);
    bool _2399 = _2315 <= 8000.0;
    bool _2401 = isnan(_2315);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(8000.0);
    bool _2407 = _2403 || _2405;
    float _2409 = float(_2407);
    float _2411 = fma(_2385, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2371);
    float _2413 = _2397;
    if (!_2221)
    {
        float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2417 = _2315 + _2415;
        _2353 = _2417;
    }
    float _2419 = _2353;
    if (_2221)
    {
        _2391 = 1.0;
    }
    float _2421 = _2391;
    float _2423 = _2397 + _2124;
    float _2425 = _2409 * _2411;
    float _2427 = _2345 + _2347;
    float _2429 = fma(_2154, -0.5, _2261);
    float _2431 = _2335 + _2373;
    float _2433 = _2425 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2435 = _2423 * 0.5;
    out.gl_Position.x = _2148;
    out.gl_Position.y = _2154;
    out.gl_Position.z = _2397;
    out.gl_Position.w = _2124;
    float _2437 = _2421;
    if (!_2221)
    {
        float _2439 = _2419 * _2395;
        float _2441 = precise::clamp(_2439, 0.0, 1.0);
        _2437 = _2441;
    }
    float _2443 = _2437;
    float _2445 = _2349 + _2381;
    float _2447 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _2361;
    out.m_74.y = _2429;
    out.m_74.z = _2435;
    out.m_74.w = _2124;
    bool _2449 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2451 = isnan(_1874);
    bool _2453 = _2449 || _2451;
    bool _2455 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2457 = _2453 || _2455;
    out.m_76.x = _2431;
    out.m_76.y = _2445;
    out.m_76.z = _2427;
    float _2459 = -_2447;
    float _2461 = _2459 + 1.0;
    float _2463 = _2461;
    if (!_2457)
    {
        _2355 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2465 = _2355;
    float _2467 = _2465;
    float _2469 = _2465;
    if (!_2457)
    {
        _2413 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2471 = _2413;
    float _2473 = _2471;
    float _2475 = _2471;
    if (!_2457)
    {
        _2357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2477 = _2357;
    float _2479 = -_2164;
    float _2481 = _2479 + 1.0;
    float _2483 = _2481 * _2433;
    float _2485 = precise::clamp(_2483, 0.0, 1.0);
    float _2487 = -_2485;
    float _2489 = fma(_2487, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2491 = _2489 * _2387;
    float _2493 = _2447 * _2184;
    float _2495 = _2491 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2497 = _2197 * _2493;
    float _2499 = _2197 * _2461;
    out.m_78.x = _2495;
    float _2501 = _2193;
    float _2503 = _2191;
    float _2505 = _2477;
    float _2507 = _2477;
    if (!_2457)
    {
        _2463 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2509 = _2463;
    float _2511 = _2207 * _2493;
    float _2513 = fma(_2203, _2497, _2191);
    float _2515 = fma(_2205, _2497, _2193);
    float _2517 = _2509;
    float _2519 = _2509;
    if (!_2457)
    {
        _2501 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2521 = _2501;
    float _2523 = fma(_2197, _2511, _2195);
    float _2525 = _2443 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2527 = _2521;
    float _2529 = _2521;
    if (!_2457)
    {
        _2503 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2531 = _2503;
    out.m_80.x = _2513;
    out.m_80.y = _2515;
    out.m_80.z = _2523;
    out.m_80.w = _2499;
    bool _2533 = !_2457;
    float _2535 = _2531;
    float _2537 = _2531;
    if (!_2533)
    {
        bool _2539 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2541 = isnan(_1874);
        bool _2543 = _2539 || _2541;
        bool _2545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2547 = _2543 || _2545;
        if (!_2547)
        {
            float _2549 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2551 = _1874 + _2549;
            float _2553 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2555 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2553;
            float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2561 = 1.0 / _2555;
            float _2563 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2569 = _2567 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2571 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2573 = _2571 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2575 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2577 = _2575 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2579 = _2551 * _2561;
            float _2581 = precise::clamp(_2579, 0.0, 1.0);
            float _2583 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2585 = _2583 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2587 = fma(_2581, _2559, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2589 = fma(_2581, _2585, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2591 = fma(_2581, _2565, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2593 = fma(_2581, _2569, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2595 = fma(_2581, _2573, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2597 = fma(_2581, _2577, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2537 = _2591;
            _2507 = _2595;
            _2529 = _2587;
            _2475 = _2593;
            _2469 = _2589;
            _2519 = _2597;
            _2599 = true;
        }
        else
        {
            bool _2601 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2603 = isnan(_1874);
            bool _2605 = _2601 || _2603;
            bool _2607 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2609 = _2605 || _2607;
            if (!_2609)
            {
                _2527 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2611 = _2527;
            _2529 = _2611;
            if (!_2609)
            {
                _2535 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2613 = _2535;
            _2537 = _2613;
            if (!_2609)
            {
                _2467 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2615 = _2467;
            _2469 = _2615;
            if (!_2609)
            {
                _2473 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2617 = _2473;
            _2475 = _2617;
            if (!_2609)
            {
                _2505 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2619 = _2505;
            _2507 = _2619;
            if (!_2609)
            {
                _2517 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2621 = _2517;
            bool _2623 = !_2609;
            _2519 = _2621;
            if (!_2623)
            {
                bool _2625 = _1874 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2627 = isnan(_1874);
                bool _2629 = _2625 || _2627;
                bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2633 = _2629 || _2631;
                if (!_2633)
                {
                    float _2635 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2637 = _1874 + _2635;
                    float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2641 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2639;
                    float _2643 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2645 = _2643 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2647 = 1.0 / _2641;
                    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2651 = _2649 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2655 = _2653 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2657 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2659 = _2657 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2663 = _2661 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2665 = _2637 * _2647;
                    float _2667 = precise::clamp(_2665, 0.0, 1.0);
                    float _2669 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2671 = _2669 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2673 = fma(_2667, _2645, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2675 = fma(_2667, _2671, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2677 = fma(_2667, _2651, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2679 = fma(_2667, _2655, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2681 = fma(_2667, _2659, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2683 = fma(_2667, _2663, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2537 = _2677;
                    _2507 = _2681;
                    _2529 = _2673;
                    _2475 = _2679;
                    _2469 = _2675;
                    _2519 = _2683;
                    _2599 = true;
                }
                else
                {
                    _2537 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2507 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2529 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2475 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2469 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2519 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2599 = false;
    float _2685 = _2537;
    float _2687 = _2507;
    float _2689 = _2529;
    float _2691 = _2475;
    float _2693 = _2469;
    float _2695 = _2519;
    float _2697 = _2525 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2699 = fma(_2445, -0.5, 0.5);
    float _2701 = precise::clamp(_2699, 0.0, 1.0);
    float _2703 = -_2685;
    float _2705 = _2703 + _2687;
    float _2707 = -_2689;
    float _2709 = _2707 + _2691;
    out.m_82.x = 0.0;
    float _2711 = fma(_2701, _2705, _2685);
    float _2713 = -_2693;
    float _2715 = _2713 + _2695;
    float _2717 = fma(_2701, _2709, _2689);
    float _2719 = _2711 * 0.586610972881317138671875;
    bool _2721 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2723 = fma(_2701, _2715, _2693);
    out.m_53.x = _2697;
    float _2725 = fma(_2717, 0.298911988735198974609375, _2719);
    bool _2727 = _2443 > 0.0;
    bool _2729 = isnan(_2443);
    bool _2731 = _2727 || _2729;
    bool _2733 = isnan(0.0);
    bool _2735 = _2731 || _2733;
    float _2737 = fma(_2723, 0.114477999508380889892578125, _2725);
    float _2739 = -_2737;
    float _2741 = _2717 + _2739;
    float _2743 = -_2737;
    float _2745 = _2711 + _2743;
    float _2747 = -_2737;
    float _2749 = _2723 + _2747;
    float _2751 = fma(_2741, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2753 = fma(_2745, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    float _2755 = fma(_2749, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2737);
    bool _2757 = !_2721;
    if (!_2757)
    {
        float _2759 = -_1848;
        float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2763 = -_1850;
        float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2767 = -_1852;
        float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2771 = _2761 * _2761;
        float _2773 = fma(_2765, _2765, _2771);
        float _2775 = fma(_2769, _2769, _2773);
        float _2777 = sqrt(_2775);
        float _2779 = rsqrt(_2775);
        float _2781 = -_2777;
        float _2783 = _2781 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2785 = _2783 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2787 = precise::clamp(_2785, 0.0, 1.0);
        float _2789 = _2765 * _2779;
        float _2791 = _2761 * _2779;
        float _2793 = abs(_2787);
        float _2795 = log2(_2793);
        float _2797 = _2769 * _2779;
        float _2799 = _2789 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2801 = _2445 * _2791;
        float _2803 = -_2791;
        float _2805 = -_2799;
        float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2805);
        float _2809 = fma(_2431, _2789, _2801);
        float _2811 = -_2797;
        float _2813 = fma(_2811, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2807);
        float _2815 = fma(_2427, _2797, _2809);
        float _2817 = precise::clamp(_2815, 0.0, 1.0);
        float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2821 = _2813 + _2819;
        float _2823 = _2795 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2825 = _2821 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2827 = precise::clamp(_2825, 0.0, 1.0);
        float _2829 = exp2(_2823);
        float _2831 = _2829 * _2827;
        float _2833 = _2817 * _2831;
        float _2835 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2837 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2839 = _2833 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2835;
        out.m_82.y = _2837;
        out.m_82.z = _2839;
    }
    out.m_84.x = _2751;
    out.m_84.y = _2753;
    out.m_84.z = _2755;
    if (_2735)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2841 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2841;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

