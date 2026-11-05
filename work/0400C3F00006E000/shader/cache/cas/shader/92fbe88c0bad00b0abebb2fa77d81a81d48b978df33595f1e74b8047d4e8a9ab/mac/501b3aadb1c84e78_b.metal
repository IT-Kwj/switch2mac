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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_70 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2939 = false;
    bool _2308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3236 = as_type<float>(_131);
        out.gl_Position.z = _3236;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _135 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_104);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_55.x;
    float _147 = float(_109);
    float _149 = in.m_55.y;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_55.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    out.m_57.x = _145;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3299 = as_type<float>(_163);
        out.gl_Position.z = _3299;
    }
    out.m_57.y = _149;
    out.m_57.z = _157;
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _147;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _113 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    if (!_189)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _191 = _205;
    }
    float _207 = _191;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = _145 * 2.0;
    float _215 = _149 * 2.0;
    bool _217 = _145 > 0.5;
    float _219 = in.m_55.w;
    float _221 = _167 * _113;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    bool _227 = _149 > 0.5;
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = floor(_213);
    float _239 = float(_211);
    float _241 = _157 * 2.0;
    bool _243 = _157 > 0.5;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _239;
    float _251 = float(_225);
    float _253 = -_183;
    int _255 = _217 ? as_type<int>(_253) : as_type<int>(_183);
    float _257 = -_187;
    int _259 = _227 ? as_type<int>(_257) : as_type<int>(_187);
    bool _261 = !_231;
    float _263 = _261 ? _183 : as_type<float>(_255);
    float _265 = 1.0 / _251;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _277 = _275 != 0;
    bool _279 = !_247;
    float _281 = _279 ? _187 : as_type<float>(_259);
    bool _283 = _237 > 0.0;
    bool _285 = _237 >= 0.0;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    float _295 = floor(_215);
    float _297 = -_183;
    float _299 = _243 ? _297 : _183;
    float _301 = _249 * _113;
    bool _303 = !_273;
    int _305 = _303 ? 0 : 1;
    int _307 = _255;
    float _309 = _299;
    float _311 = _251;
    if (_235)
    {
        _307 = 0;
    }
    int _313 = _307;
    int _315 = _313;
    if (!_235)
    {
        _315 = 1;
    }
    int _317 = _315;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _321 = int(_319);
    float _323 = _265 * _113;
    bool _325 = !_269;
    int _327 = _325 ? 0 : 1;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _331 = int(_329);
    bool _333 = _295 > 0.0;
    bool _335 = _295 >= 0.0;
    bool _337 = isnan(_295);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    int _345 = _343 ? 0 : 1;
    float _347 = floor(_241);
    float _349 = float(uint(_321));
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _353 = _219 > 0.5;
    float _355 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _357 = !_277;
    int _359 = _357 ? 0 : 1;
    float _361 = 1.0 / _349;
    int _363 = _293 ? 0 : 1;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _369 = _367 != 0;
    int _371 = ~_363;
    int _373 = _371 + 1;
    int _375 = _373 + 1;
    int _377 = _375;
    float _379 = _349;
    if (!_283)
    {
        int _381 = ~_363;
        int _383 = _381 + 1;
        _377 = _383;
    }
    int _385 = _377;
    float _387 = trunc(_301);
    int _389 = int(_387);
    float _391 = float(uint(_331));
    bool _393 = !_369;
    float _395 = _393 ? _183 : _299;
    bool _397 = _317 != 1;
    float _399 = 1.0 / _391;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _403 = _401 != 0;
    int _405 = as_type<int>(_361) + (-2);
    int _407 = int(_235);
    int _409 = _283 ? 2 : 0;
    int _411 = _407 | _409;
    int _413 = _353 ? 4 : 0;
    int _415 = _411 | _413;
    int _417 = _397 ? 8 : 0;
    int _419 = _415 | _417;
    int _421 = _403 ? 16 : 0;
    int _423 = _419 | _421;
    int _425 = _333 ? 32 : 0;
    int _427 = _423 | _425;
    int _429 = _277 ? 64 : 0;
    int _431 = _427 | _429;
    int _433 = _431 & 16;
    bool _435 = _347 >= 0.0;
    bool _437 = isnan(_347);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = trunc(_323);
    int _447 = int(_445);
    int _449 = ~_345;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    float _457 = as_type<float>(_433);
    if (!_333)
    {
        int _459 = ~_345;
        int _461 = _459 + 1;
        _455 = _461;
    }
    int _463 = _455;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _467 = _443 ? 0 : 1;
    bool _469 = _347 > 0.0;
    float _471 = -_465;
    float _473 = fma(_355, 2.0, _471);
    float _475 = float(uint(_389));
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    int _481 = as_type<int>(_399) + (-2);
    float _483 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_397)
    {
        _379 = _149;
    }
    float _485 = _379;
    float _487 = as_type<float>(_405) * _475;
    float _489 = _485;
    if (_397)
    {
        _489 = _145;
    }
    float _491 = _489;
    float _493 = fma(_483, -2.0, _351);
    float _495 = float(uint(_447));
    float _497 = trunc(_487);
    float _499 = precise::max(_497, 0.0);
    uint _502 = uint(_499);
    int _504 = ~_467;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = as_type<float>(_481) * _495;
    int _512 = _508;
    if (!_397)
    {
        _309 = _149;
    }
    float _514 = _309;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _518 = _514;
    if (!_469)
    {
        int _520 = ~_467;
        int _522 = _520 + 1;
        _512 = _522;
    }
    int _524 = _512;
    float _526 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    if (_397)
    {
        _518 = _145;
    }
    float _528 = _518;
    float _530 = trunc(_510);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _516);
    float _538 = _479 * _113;
    int _540 = ~_321;
    int _542 = _540 + 1;
    float _544 = _528 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _546 = ~_331;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_397)
    {
        _311 = _157;
    }
    float _552 = _311;
    float _554 = exp2(_538);
    float _556 = _552;
    if (_397)
    {
        _556 = _149;
    }
    float _558 = _556;
    float _560 = -_550;
    float _562 = fma(_544, 2.0, _560);
    int _564 = _542 * int(_502);
    int _566 = _564 + _389;
    if (!_397)
    {
        _457 = _157;
    }
    float _568 = _457;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    int _572 = _548 * int(_534);
    int _574 = _572 + _447;
    float _576 = -_113;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _562);
    float _580 = float(uint(_566));
    float _582 = -_113;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _586 = float(uint(_574));
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = as_type<float>(_405) * _580;
    float _592 = _568;
    if (_397)
    {
        _592 = _149;
    }
    float _594 = _592;
    float _596 = as_type<float>(_481) * _586;
    float _598 = -_554;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _604 = 1.0 + _602;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _618 = trunc(_590);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    float _624 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _570);
    float _626 = fma(_616, -2.0, _588);
    float _628 = _614 ? _600 : 0.0;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = 1.0 / _604;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _646 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _648 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _536);
    float _650 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _626);
    float _652 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _656 = _654 != 0;
    float _658 = trunc(_596);
    float _660 = precise::max(_658, 0.0);
    uint _662 = uint(_660);
    float _664 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _646);
    float _666 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _652);
    int _668 = ~_321;
    int _670 = _668 + 1;
    float _672 = _145 + _157;
    int _674 = int(_502) + int(_622);
    bool _676 = !_656;
    int _678 = _676 ? 0 : 1;
    if (_642)
    {
        float _680 = _628 * _632;
        _123 = _680;
    }
    float _682 = _123;
    int _684 = ~_331;
    int _686 = _684 + 1;
    int _688 = _670 * _674;
    int _690 = _688 + _389;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    float _696 = _672 + (-1.0);
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _700 = _698 != 0;
    float _702 = -_187;
    int _704 = _353 ? as_type<int>(_702) : as_type<int>(_187);
    int _706 = int(_534) + int(_662);
    float _708 = 0.0;
    if (_235)
    {
        _708 = 1.0;
    }
    float _710 = _708;
    float _712 = 0.0;
    float _714 = _710;
    if (_235)
    {
        _712 = _145;
    }
    float _716 = _712;
    int _718 = _686 * _706;
    int _720 = _718 + _447;
    float _722 = 0.0;
    float _724 = _716;
    if (_235)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (!_235)
    {
        _714 = 7.345489978790283203125;
    }
    float _730 = _714;
    if (!_235)
    {
        _724 = _149;
    }
    float _732 = _724;
    if (!_235)
    {
        _728 = 1.2345600128173828125;
    }
    float _734 = _728;
    float _736 = _730 * _145;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _748 = _746 != 0;
    bool _750 = !_694;
    float _752 = _750 ? _187 : as_type<float>(_704);
    bool _754 = uint(_690) >= uint(_321);
    bool _756 = uint(_720) >= uint(_331);
    float _758 = in.m_46.x;
    float _760 = in.m_46.y;
    float _762 = in.m_46.z;
    bool _764 = !_744;
    int _766 = _764 ? 0 : 1;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _770 = _768 != 0;
    bool _772 = !_700;
    int _774 = _772 ? 0 : 1;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _776;
    bool _780 = !_754;
    int _782 = _780 ? 0 : (-1);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _788 = !_756;
    int _790 = _788 ? 0 : (-1);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _806 = _804 != 0;
    float _808 = _145 + _149;
    float _810 = 1.0 / _786;
    float _812 = _808 + (-1.0);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _149 + _157;
    float _822 = 1.0 / _778;
    float _824 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _828 = _820 + (-1.0);
    float _830 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].x, _826);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = 1.0 / _816;
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _842 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _846 = _207 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _850 = _207 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _854 = _207 + _852;
    float _856 = _846 * _810;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _860 = _850 * _822;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _862;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].z, _840);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _872 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _874 = isnan(_207);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _145 + (-0.5);
    float _886 = _854 * _838;
    float _888 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _890 = fma(_864, _860, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _892 = _732 * _734;
    bool _894 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _896 = isnan(_207);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _906;
    bool _910 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _912 = isnan(_207);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_882;
    float _924 = _922 + 1.0;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_908, _860, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _932 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _934 = isnan(_207);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _948 = _904 * _924;
    float _950 = _920 * _928;
    float _952 = floor(_736);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _954;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = fma(_946, _856, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _964 = _281 + (-0.5);
    float _966 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _968 = _942 * _960;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = floor(_892);
    float _976 = -_964;
    float _978 = -_526;
    float _980 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[80].y, _978);
    float _982 = _890 * _968;
    float _984 = _930 * _968;
    float _986 = fma(_956, _886, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _988 = _263 + 0.5;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].x, _982);
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].y, _984);
    float _994 = -_952;
    float _996 = _736 + _994;
    float _998 = float(_331);
    float _1000 = fma(_966, _950, _990);
    float _1002 = float(_447);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _584);
    bool _1006 = !_748;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = _998 * _221;
    bool _1012 = !_740;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = -_974;
    float _1018 = _892 + _1016;
    float _1020 = float(_321);
    float _1022 = fma(_962, _950, _992);
    float _1024 = _1018 * _998;
    float _1026 = float(_389);
    float _1028 = _1020 * _221;
    bool _1030 = _1002 >= _998;
    bool _1032 = isnan(_1002);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(_998);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = fma(_986, _948, _1000);
    int _1044 = abs(_1008);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    int _1050 = abs(_1014);
    float _1052 = _996 * _1020;
    float _1054 = float(_463);
    float _1056 = fma(_1048, _886, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1058 = _1026 >= _1020;
    bool _1060 = isnan(_1026);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1020);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1024);
    int _1072 = int(_1070);
    float _1074 = in.m_62.x;
    float _1076 = in.m_62.y;
    float _1078 = in.m_62.z;
    float _1080 = float(_524);
    float _1082 = fma(_1056, _948, _1022);
    float _1084 = float(_1050);
    float _1086 = _395 + 0.5;
    float _1088 = in.m_64.x;
    float _1090 = in.m_64.y;
    int _1092 = abs(_766);
    float _1094 = trunc(_1052);
    int _1096 = int(_1094);
    float _1098 = float(_1044);
    float _1100 = _1084 * _1080;
    float _1102 = float(_385);
    float _1104 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1042);
    float _1106 = float(_1092);
    float _1108 = _1098 * _1054;
    float _1110 = _752 + (-0.5);
    float _1112 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1082);
    float _1114 = _1100 * (-2.0);
    float _1116 = _1106 * _1102;
    float _1118 = -_1110;
    float _1120 = -_650;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1120);
    float _1124 = _1108 * (-2.0);
    float _1126 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[85].x, _578);
    float _1128 = _1116 * (-2.0);
    float _1130 = fma(_818, _1114, _818);
    float _1132 = trunc(_1040);
    int _1134 = int(_1132);
    float _1136 = fma(_1114, _1074, _1074);
    float _1138 = fma(_836, _1128, _836);
    float _1140 = fma(_824, _1124, _824);
    float _1142 = fma(_1128, _1076, _1076);
    float _1144 = fma(_1124, _1078, _1078);
    int _1146 = abs(_678);
    float _1148 = _149 + (-0.5);
    float _1150 = trunc(_1068);
    int _1152 = int(_1150);
    float _1154 = _157 + (-0.5);
    float _1156 = _1112 * _1090;
    float _1158 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1136);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1142);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1144);
    int _1164 = ~_706;
    int _1166 = _1164 + _790;
    int _1168 = _1166 + 1;
    float _1170 = fma(_1130, _682, _1158);
    int _1172 = ~_674;
    int _1174 = _1172 + _782;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1138, _682, _1160);
    float _1180 = fma(_1140, _682, _1162);
    int _1182 = abs(_774);
    int _1184 = _1096 * _1146;
    int _1186 = _1184 + _389;
    bool _1188 = !_798;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _331 * _1168;
    int _1194 = _1192 + _447;
    bool _1196 = _331 == 0;
    int _1198 = _321 * _1176;
    int _1200 = _1198 + _389;
    bool _1202 = _321 == 0;
    int _1204 = _1072 * _1182;
    int _1206 = _1204 + _447;
    int _1208 = ~_1134;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1028);
    int _1216 = int(_1214);
    bool _1218 = !_1196;
    int _1220 = _1218 ? _1194 : (-1);
    float _1222 = _1104 * _1088;
    int _1224 = ~_1152;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1170 * 0.15915493667125701904296875;
    bool _1232 = !_1202;
    int _1234 = _1232 ? _1200 : (-1);
    int _1236 = _1220 * _1212;
    int _1238 = _321 + (-1);
    float _1240 = trunc(_1010);
    int _1242 = int(_1240);
    int _1244 = _331 + (-1);
    int _1246 = _1234 * _1228;
    float _1248 = float(uint(_1186));
    float _1250 = _1178 * 0.15915493667125701904296875;
    int _1252 = abs(_1190);
    int _1254 = _1152 * _1238;
    int _1256 = _1254 + _1246;
    int _1258 = abs(_305);
    int _1260 = _1134 * _1244;
    int _1262 = _1260 + _1236;
    int _1264 = abs(_327);
    float _1266 = as_type<float>(_405) * _1248;
    float _1268 = float(uint(_1206));
    int _1270 = _1256 * _1258;
    bool _1272 = !_770;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1262 * _1252;
    int _1278 = abs(_359);
    float _1280 = as_type<float>(_481) * _1268;
    float _1282 = trunc(_1266);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = !_794;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1294 = abs(_1274);
    int _1296 = _1216 * _1264;
    int _1298 = _1296 + _1270;
    float _1300 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1302 = abs(_1290);
    float _1304 = trunc(_1280);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = _1186 * _1278;
    int _1312 = _1310 + _1298;
    bool _1314 = !_802;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1320 = _1096 * _1294;
    int _1322 = _1320 + _1312;
    int _1324 = abs(_1316);
    float _1326 = _1230 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    int _1330 = ~_331;
    int _1332 = _1330 + 1;
    int _1334 = _1242 * _1302;
    int _1336 = _1334 + _1276;
    float _1338 = float(uint(_1322));
    float _1340 = _1300 * _1292;
    float _1342 = _888 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1344 = !_806;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1230 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = as_type<float>(_405) * _1338;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1356 = abs(_1346);
    int _1358 = _1332 * int(_1308);
    int _1360 = _1358 + _1206;
    int _1362 = ~_321;
    int _1364 = _1362 + 1;
    int _1366 = _1206 * _1324;
    int _1368 = _1366 + _1336;
    float _1370 = _1318 * _1354;
    float _1372 = _1250 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    float _1376 = _1180 * 0.15915493667125701904296875;
    int _1378 = ~_321;
    int _1380 = _1378 + 1;
    int _1382 = _1072 * _1356;
    int _1384 = _1382 + _1368;
    float _1386 = float(uint(_1360));
    int _1388 = _1380 * int(_1286);
    int _1390 = _1388 + _1186;
    float _1392 = _1250 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = as_type<float>(_481) * _1386;
    float _1398 = float(uint(_1384));
    float _1400 = float(uint(_1390));
    float _1402 = _1376 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1328 * _1374;
    float _1408 = trunc(_1352);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = _1350 * _1394;
    float _1416 = _1376 * 6.283185482025146484375;
    float _1418 = sin(_1416);
    float _1420 = _1350 * _1404;
    float _1422 = _1394 * _1404;
    float _1424 = _1328 * _1404;
    float _1426 = trunc(_1396);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_405) * _1400;
    float _1434 = _1328 * _1394;
    int _1436 = _1364 * int(_1412);
    int _1438 = _1436 + _1322;
    int _1440 = ~_331;
    int _1442 = _1440 + 1;
    float _1444 = trunc(_1432);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    float _1450 = _1420 * _1370;
    int _1452 = int(_1308) + int(_1430);
    float _1454 = _1350 * _1374;
    float _1456 = _1374 * _1404;
    float _1458 = as_type<float>(_481) * _1398;
    float _1460 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = -_1454;
    float _1464 = fma(_1418, _1434, _1462);
    float _1466 = -_1434;
    float _1468 = fma(_1418, _1454, _1466);
    float _1470 = float(uint(_1438));
    float _1472 = fma(_1418, _1414, _1406);
    float _1474 = trunc(_1458);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_1418, _1406, _1414);
    float _1482 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = as_type<float>(_405) * _1470;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1488 = int(_1286) + int(_1448);
    float _1490 = -_1418;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1494 = -_1418;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1498 = -_1418;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1502 = -_1370;
    float _1504 = _1418 * _1502;
    float _1506 = _1424 * _1370;
    float _1508 = trunc(_1484);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1500);
    float _1516 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1518 = fma(_1464, _1340, _1506);
    float _1520 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    int _1522 = _1442 * int(_1478);
    int _1524 = _1522 + _1384;
    float _1526 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    float _1528 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1530 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = float(uint(_1524));
    float _1536 = fma(_1422, _1340, _1504);
    float _1538 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1516);
    float _1540 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1528);
    float _1542 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1544 = as_type<float>(_481) * _1534;
    float _1546 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    int _1550 = ~_321;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1472, _1340, _1450);
    int _1556 = ~_331;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1546);
    int _1568 = ~_321;
    int _1570 = _1568 + 1;
    float _1572 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1574 = int(_1412) + int(_1512);
    float _1576 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1548);
    float _1580 = fma(_1468, _1572, _1554);
    float _1582 = fma(_1456, _1572, _1536);
    float _1584 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    float _1586 = fma(_1480, _1572, _1518);
    int _1588 = ~_331;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    float _1594 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1596 = int(_1478) + int(_1564);
    int _1598 = _1570 * _1574;
    int _1600 = _1598 + _1322;
    bool _1602 = uint(_1600) >= uint(_321);
    int _1604 = _1552 * _1488;
    int _1606 = _1604 + _1186;
    int _1608 = _1558 * _1596;
    int _1610 = _1608 + _1384;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    bool _1616 = uint(_1606) >= uint(_321);
    float _1618 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1566);
    bool _1620 = uint(_1610) >= uint(_331);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1594);
    int _1624 = ~_1574;
    int _1626 = _1624 + _1614;
    int _1628 = _1626 + 1;
    float _1630 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1638 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    int _1640 = _321 * _1628;
    int _1642 = _1640 + _1322;
    int _1644 = ~_1596;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    bool _1652 = !_1616;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1636);
    bool _1658 = !_1202;
    int _1660 = _1658 ? _1642 : (-1);
    int _1662 = _331 * _1648;
    int _1664 = _1662 + _1384;
    int _1666 = ~_1488;
    int _1668 = _1666 + _1654;
    int _1670 = _1668 + 1;
    float _1672 = _858 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1674 = _1660 >> 31;
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1656);
    bool _1678 = !_1196;
    int _1680 = _1678 ? _1664 : (-1);
    float _1682 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1684 = _1674 & 3;
    float _1686 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1688 = _1680 >> 31;
    float _1690 = _1672 + _1682;
    int _1692 = _1660 + _1684;
    float _1694 = _1342 + _1686;
    int _1696 = _1688 & 3;
    int _1698 = _1590 * _1452;
    int _1700 = _1698 + _1206;
    int _1702 = _1692 >> 2;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1690 + _1704;
    int _1708 = _1680 + _1696;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1694 + _1710;
    int _1714 = _1702 << 4;
    int _1716 = _1714 + 368;
    float _1718 = _1706 * _1706;
    int _1720 = _1708 >> 2;
    float _1722 = _1712 * _1712;
    int _1724 = _1716 + 8;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    bool _1742 = uint(_1700) >= uint(_331);
    float _1744 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1746 = _1720 << 4;
    int _1748 = _1746 + 512;
    float _1750 = _1718 + _1722;
    bool _1752 = !_1742;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1538);
    int _1758 = _1660 & 3;
    bool _1760 = _1758 != 0;
    uint _1762 = uint(int(uint(_1716) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1660 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1650);
    int _1784 = ~_1452;
    int _1786 = _1784 + _1754;
    int _1788 = _1786 + 1;
    float _1790 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1540);
    int _1792 = _1760 ? 0 : 1;
    float _1794 = sqrt(_1750);
    bool _1796 = uint(_1778) > 1u;
    uint _1798 = uint(int(uint(_1748) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = ~_1792;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1542);
    bool _1822 = _1778 != 3;
    float _1824 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1826 = _1744 * _1514;
    float _1828 = _1744 * _1526;
    bool _1830 = !_1780;
    int _1832 = _1830 ? 0 : 1;
    int _1834 = _1748 + 8;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = fma(_1824, _1756, _1826);
    int _1854 = _321 * _1670;
    int _1856 = _1854 + _1186;
    float _1858 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1860 = _1818;
    float _1862 = _1718;
    float _1864 = _1722;
    float _1866 = _1690;
    float _1868 = _1694;
    float _1870 = _1790;
    float _1872 = _1342;
    float _1874 = _1858;
    float _1876 = _1672;
    if (!_1796)
    {
        int _1878 = ~_1792;
        int _1880 = _1878 + 1;
        _1860 = _1880;
    }
    int _1882 = _1860;
    float _1884 = _1744 * _1520;
    bool _1886 = uint(_1778) >= 2u;
    int _1888 = _331 * _1788;
    int _1890 = _1888 + _1206;
    bool _1892 = _1794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = fma(_1824, _1790, _1884);
    float _1896 = fma(_1824, _1820, _1828);
    int _1898 = _1886 ? 0 : 1;
    int _1900 = _1680 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = ~_1898;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1908;
    if (_1822)
    {
        int _1912 = ~_1898;
        int _1914 = _1912 + 1;
        _1910 = _1914;
    }
    int _1916 = _1910;
    bool _1918 = !_1902;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = _1680 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1928 = uint(_1900) >= 2u;
    int _1930 = _1924 ? 0 : 1;
    float _1932 = _1858 + _1926;
    int _1934 = _1928 ? 0 : 1;
    bool _1936 = uint(_1900) > 1u;
    bool _1938 = _1900 != 3;
    int _1940 = abs(_1882);
    bool _1942 = !_1892;
    float _1944 = _1932;
    if (!_1942)
    {
        float _1946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1950 = _1794 + _1948;
        float _1952 = rsqrt(_1750);
        float _1954 = _1950 * _1946;
        float _1956 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = _1954 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = fma(_1962, _1956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = _1952 * _1968;
        float _1972 = _1966 + (-1.0);
        float _1974 = fma(_1706, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1712, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1982 = _1974 + _1980;
        float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1986 = _1976 + _1984;
        float _1988 = fma(_1932, _1966, _1978);
        float _1990 = _1982 * _1982;
        float _1992 = _1986 * _1986;
        _1944 = _1988;
        _1862 = _1990;
        _1864 = _1992;
        _1866 = _1974;
        _1868 = _1976;
    }
    float _1994 = _1944;
    float _1996 = _1862;
    float _1998 = _1864;
    float _2000 = _1866;
    float _2002 = _1868;
    int _2004 = ~_1930;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = -_666;
    float _2012 = _2010 + 1.0;
    int _2014 = _2008;
    if (!_1936)
    {
        int _2016 = ~_1930;
        int _2018 = _2016 + 1;
        _2014 = _2018;
    }
    int _2020 = _2014;
    float _2022 = -_648;
    float _2024 = _2022 + 1.0;
    int _2026 = abs(_1832);
    float _2028 = -_624;
    float _2030 = _2028 + 1.0;
    int _2032 = ~_1934;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_281, _2012, _980);
    int _2040 = abs(_2020);
    float _2042 = -_664;
    float _2044 = _2042 + 1.0;
    int _2046 = ~_1940;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1592 + _1896;
    int _2054 = _2036;
    if (_1938)
    {
        int _2056 = ~_1934;
        int _2058 = _2056 + 1;
        _2054 = _2058;
    }
    int _2060 = _2054;
    float _2062 = -_2044;
    float _2064 = fma(_263, _2062, _1004);
    int _2066 = _2050 * as_type<int>(_1776);
    bool _2068 = _1778 != 3;
    out.m_66.x = _1756;
    out.m_66.y = _1790;
    out.m_66.z = _1820;
    int _2070 = abs(_1920);
    int _2072 = abs(_1916);
    int _2074 = abs(_2060);
    int _2076 = ~_2040;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_2026;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2080 * as_type<int>(_1812);
    int _2096 = _2086 * as_type<int>(_1768);
    int _2098 = _2096 + _2066;
    int _2100 = _2092 * as_type<int>(_1804);
    int _2102 = _2100 + _2094;
    int _2104 = ~_2072;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1744, _1744, 1.0);
    bool _2112 = _1900 != 3;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    int _2118 = _2108 * as_type<int>(_1732);
    int _2120 = _2118 + _2098;
    bool _2122 = !_2068;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2128 = _2126 != 0;
    int _2130 = ~_2074;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    bool _2136 = !_2112;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2134 * as_type<int>(_1842);
    int _2146 = _2144 + _2102;
    int _2148 = abs(_2124);
    float _2150 = rsqrt(_2110);
    bool _2152 = !_2128;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = abs(_2138);
    int _2158 = abs(_2142);
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2162 = _1994 + _2160;
    int _2164 = abs(_2154);
    float _2166 = fma(_2162, _2162, _1996);
    int _2168 = ~_2148;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = ~_2156;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _2166 + _1998;
    int _2182 = ~_2158;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2172 * as_type<int>(_1740);
    int _2190 = _2188 + _2120;
    int _2192 = ~_2164;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * as_type<int>(_1850);
    int _2200 = _2198 + _2146;
    bool _2202 = !_1196;
    int _2204 = _2202 ? _1890 : (-1);
    int _2206 = _2190 * _2186;
    bool _2208 = !_1202;
    int _2210 = _2208 ? _1856 : (-1);
    int _2212 = _2200 * _2196;
    float _2214 = _1744 * _2150;
    float _2216 = -_2024;
    float _2218 = fma(_395, _2216, _1126);
    float _2220 = sqrt(_2180);
    int _2222 = _2204 * _2164;
    int _2224 = _2222 + _2212;
    float _2226 = -_1618;
    float _2228 = _2214 * _2226;
    int _2230 = _2210 * _2158;
    int _2232 = _2230 + _2206;
    float _2234 = fma(_752, _2030, _1122);
    float _2236 = -_1578;
    float _2238 = _2214 * _2236;
    float _2240 = -_1592;
    float _2242 = _2214 * _2240;
    float _2244 = fma(_2150, _1514, _2228);
    float _2246 = _1618 + _1852;
    float _2248 = fma(_2150, _1520, _2238);
    float _2250 = fma(_2150, _1526, _2242);
    float _2252 = _1578 + _1894;
    float _2254 = float(_2232);
    out.m_68.x = _2064;
    out.m_68.y = _2038;
    out.m_68.z = _2218;
    out.m_68.w = _2234;
    float _2256 = float(_2224);
    bool _2258 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2260 = isnan(_2220);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2266 = _2262 || _2264;
    out.m_70.x = _2244;
    out.m_70.y = _2248;
    out.m_70.z = _2250;
    out.m_72.x = _2254;
    out.m_72.y = _2256;
    out.m_74.x = _2246;
    out.m_74.y = _2252;
    out.m_74.z = _2052;
    float _2268 = _2242;
    float _2270 = as_type<float>(_2190);
    float _2272 = _2218;
    if (!_2266)
    {
        _2268 = 1.0;
    }
    float _2274 = _2268;
    bool _2276 = !_2266;
    float _2278 = _2274;
    if (!_2276)
    {
        bool _2280 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2282 = isnan(_2220);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2288 = _2284 || _2286;
        if (!_2288)
        {
            float _2290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2292 = _2220 + _2290;
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2302 = 1.0 / _2296;
            float _2304 = _2292 * _2302;
            float _2306 = fma(_2304, _2300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2278 = _2306;
            _1870 = _2302;
            _2308 = true;
        }
        else
        {
            bool _2310 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2312 = isnan(_2220);
            bool _2314 = _2310 || _2312;
            bool _2316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2318 = _2314 || _2316;
            if (!_2318)
            {
                float _2320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2322 = _2220 + _2320;
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2332 = 1.0 / _2326;
                float _2334 = _2322 * _2332;
                float _2336 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2278 = _2336;
                _1870 = _2332;
                _2308 = true;
            }
            else
            {
                _2278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2308 = false;
    float _2338 = _2278;
    float _2340 = _1870;
    float _2342 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2344 = _2000 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2348 = _2002 + _2346;
    bool _2350 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.5);
    bool _2358 = _2354 || _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2362 = _1994 + _2360;
    float _2364 = fma(_2344, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = fma(_2348, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2368 = fma(_2362, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2370 = _2362;
    float _2372 = _2340;
    float _2374 = _2348;
    float _2376 = _2366;
    if (_2358)
    {
        _2370 = _2364;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (_2358)
    {
        _2372 = _2368;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    if (_2358)
    {
        _2374 = _2366;
    }
    float _2386 = _2374;
    float _2388 = _2386;
    if (!_2358)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1858 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _1672 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2392 * _2392;
        float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2404 = _1342 + _2402;
        float _2406 = fma(_2396, _2396, _2400);
        float _2408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2410 = fma(_2404, _2404, _2406);
        float _2412 = sqrt(_2410);
        float _2414 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2416 = precise::min(_2412, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2418 = _2416 * _2408;
        float _2420 = -_1672;
        float _2422 = _2420 + _2364;
        float _2424 = -_1858;
        float _2426 = _2424 + _2368;
        float _2428 = _2414 * _2418;
        float _2430 = -_1342;
        float _2432 = _2430 + _2366;
        float _2434 = fma(_2422, _2428, _1672);
        float _2436 = fma(_2426, _2428, _1858);
        float _2438 = fma(_2432, _2428, _1342);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2448 = _2440 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2452 = _2442 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2444 + _2454;
    float _2458 = _2448 * _2448;
    float _2460 = fma(_2452, _2452, _2458);
    float _2462 = fma(_2456, _2456, _2460);
    float _2464 = rsqrt(_2462);
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2452 * _2466;
    float _2470 = _2456 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2456;
    float _2488 = _2484;
    float _2490 = _2468;
    if (_2480)
    {
        float _2492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2492;
    }
    float _2494 = _2486;
    if (_2480)
    {
        float _2496 = rsqrt(_2476);
        _2376 = _2496;
    }
    float _2498 = _2376;
    float _2500 = _2498;
    if (_2480)
    {
        float _2502 = _2484 * _2494;
        _2488 = _2502;
    }
    float _2504 = _2488;
    if (_2480)
    {
        float _2506 = _2504 * 0.15915493667125701904296875;
        _2270 = _2506;
    }
    float _2508 = _2270;
    float _2510 = _2458;
    float _2512 = _2508;
    if (_2480)
    {
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        _2510 = _2516;
    }
    float _2518 = _2510;
    float _2520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2522 = precise::max(0.0, _2520);
    float _2524 = _2464;
    float _2526 = _2522;
    float _2528 = _2520;
    if (_2480)
    {
        float _2530 = _2508 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = -_2466;
    float _2538 = -_2522;
    float _2540 = fma(_2448, _2536, _2538);
    float _2542 = _2540;
    if (!_2480)
    {
        _2526 = _2472;
    }
    float _2544 = _2526;
    float _2546 = _2544;
    if (_2480)
    {
        float _2548 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2548;
    }
    float _2550 = _2528;
    float _2552 = _2518;
    float _2554 = _2550;
    if (_2480)
    {
        float _2556 = fma(_2518, _2550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2552 = _2556;
    }
    float _2558 = _2552;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2562 = _2558;
    if (_2480)
    {
        float _2564 = _2534 + (-1.0);
        _2554 = _2564;
    }
    float _2566 = _2554;
    if (_2480)
    {
        float _2568 = _2498 * _2558;
        _2272 = _2568;
    }
    float _2570 = _2272;
    if (!_2480)
    {
        _2500 = _2540;
    }
    float _2572 = _2500;
    float _2574 = _2572;
    if (_2480)
    {
        float _2576 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2576;
    }
    float _2578 = _2512;
    if (_2480)
    {
        float _2580 = _2468 * _2570;
        _2490 = _2580;
    }
    float _2582 = _2490;
    if (!_2480)
    {
        _2562 = _2470;
    }
    float _2584 = _2562;
    float _2586 = _2584;
    if (_2480)
    {
        float _2588 = _2470 * _2570;
        _2586 = _2588;
    }
    float _2590 = _2586;
    if (_2480)
    {
        float _2592 = fma(_2540, _2534, _2578);
        _2574 = _2592;
    }
    float _2594 = _2574;
    if (_2480)
    {
        float _2596 = _2582 * _2582;
        _2546 = _2596;
    }
    float _2598 = _2546;
    float _2600 = sqrt(_2462);
    if (!_2480)
    {
        _2542 = _2474;
    }
    float _2602 = _2542;
    float _2604 = _2602;
    if (_2480)
    {
        float _2606 = _2590 * _2590;
        _2604 = _2606;
    }
    float _2608 = _2604;
    float _2610 = fma(_2594, _2594, _2598);
    float _2612 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2614 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2616 = _2610 + _2608;
    float _2618 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2612);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2622 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2614);
    float _2624 = rsqrt(_2616);
    float _2626 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2618);
    float _2628 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2630 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2620);
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2634 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2632);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2640 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2628);
    float _2642 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2630);
    float _2644 = -_2636;
    float _2646 = _2644 + 1.0;
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2650 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2640);
    float _2652 = _2642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2654 = abs(_2646);
    float _2656 = log2(_2654);
    float _2658 = -_2648;
    float _2660 = fma(_2658, _2560, 1.0);
    float _2662 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2622);
    float _2664 = _2624 * _2582;
    float _2666 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2670 = _2624 * _2594;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2674 = _2624 * _2590;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2668);
    float _2678 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2680 = -_2672;
    float _2682 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2680);
    float _2684 = log2(_2660);
    float _2686 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2676);
    float _2688 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2690 = -_2674;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2696 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2686);
    float _2698 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2700 = fma(_2692, -0.5, 0.5);
    float _2702 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2688);
    float _2704 = 1.0 / _2696;
    float _2706 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2698);
    float _2708 = fma(_2692, 0.5, 0.5);
    float _2710 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2702);
    float _2712 = _2670 + 1.0;
    float _2714 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2706);
    float _2716 = fma(_2708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2718 = _2684 * 0.693147182464599609375;
    float _2720 = exp2(_2694);
    float _2722 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2714);
    float _2724 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2710);
    float _2726 = fma(_2708, _2716, -0.212114393711090087890625);
    float _2728 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2730 = fma(_2708, _2726, 1.570728778839111328125);
    float _2732 = sqrt(_2700);
    float _2734 = _2722 * _2704;
    float _2736 = fma(_2734, 0.5, 0.5);
    float _2738 = -_2670;
    float _2740 = fma(_2720, _2712, _2738);
    float _2742 = _2724 * _2704;
    float _2744 = fma(_2740, 0.5, 0.5);
    float _2746 = fma(_2742, -0.5, 0.5);
    float _2748 = _2732 * 0.636619746685028076171875;
    float3 _7189 = float3(_2736, _2746, _2728);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7189, float3(0.0), isnan(_7189)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7189, float3(0.0), isnan(_7189)), level(0.0)).x;
    float _2752 = -_2730;
    float _2754 = fma(_2748, _2752, 1.0);
    float3 _7205 = float3(_2736, _2746, _2728);
    float4 _2757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7205, float3(0.0), isnan(_7205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7205, float3(0.0), isnan(_7205)), level(0.0)).xyzw;
    float _2759 = _2757.x;
    float _2761 = _2757.y;
    float _2763 = _2757.z;
    float _2765 = _2757.w;
    float2 _7222 = float2(_2754, _2744);
    float3 _2769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7222, float2(0.0), isnan(_7222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7222, float2(0.0), isnan(_7222)), level(0.0)).xyz;
    float _2771 = _2769.x;
    float _2773 = _2769.y;
    float _2775 = _2769.z;
    float _2777 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2779 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2781 = _2696 * 0.5;
    out.m_76.x = _2442;
    out.m_76.y = _2440;
    out.m_76.z = _2444;
    float _2783 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2779);
    float _2785 = exp2(_2777);
    float _2787 = fma(_2724, -0.5, _2781);
    bool _2789 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2791 = isnan(_2600);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2797 = _2793 || _2795;
    float _2799 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2783);
    float _2801 = _2722 + _2696;
    out.m_78.x = _1672;
    out.m_78.y = _1858;
    out.m_78.z = _1342;
    float _2803 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2799);
    float _2805 = _2801 * 0.5;
    float _2807 = _2803 + _2696;
    out.gl_Position.x = _2722;
    out.gl_Position.y = _2724;
    out.gl_Position.z = _2803;
    out.gl_Position.w = _2696;
    float _2809 = _2807 * 0.5;
    float _2811 = -_2785;
    float _2813 = _2811 + 1.0;
    if (!_2797)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2815 = _1872;
    float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2805;
    out.m_80.y = _2787;
    out.m_80.z = _2809;
    out.m_80.w = _2696;
    float _2819 = _2817;
    float _2821 = _2815;
    float _2823 = _2815;
    if (!_2797)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2825 = _1874;
    float _2827 = -_2817;
    float _2829 = _2827 + 1.0;
    float _2831 = _2829;
    float _2833 = _2825;
    float _2835 = _2825;
    if (!_2797)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2837 = _1876;
    float _2839 = _2817 * _2750;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2797)
    {
        _2819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2819;
    float _2847 = _2765 * _2839;
    float _2849 = _2765 * _2829;
    float _2851 = _2847;
    float _2853 = _2845;
    float _2855 = _2845;
    if (!_2797)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2831;
    float _2859 = _2775 * _2839;
    float _2861 = fma(_2771, _2847, _2759);
    float _2863 = fma(_2773, _2847, _2761);
    float _2865 = _2857;
    float _2867 = _2857;
    if (!_2797)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2869 = _2851;
    float _2871 = fma(_2765, _2859, _2763);
    out.m_82.x = _2861;
    out.m_82.y = _2863;
    out.m_82.z = _2871;
    out.m_82.w = _2849;
    bool _2873 = !_2797;
    float _2875 = _2869;
    float _2877 = _2869;
    if (!_2873)
    {
        bool _2879 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2881 = isnan(_2600);
        bool _2883 = _2879 || _2881;
        bool _2885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2887 = _2883 || _2885;
        if (!_2887)
        {
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = _2600 + _2889;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2893;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2901 = 1.0 / _2895;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2919 = _2891 * _2901;
            float _2921 = precise::clamp(_2919, 0.0, 1.0);
            float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2927 = fma(_2921, _2899, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2929 = fma(_2921, _2925, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2931 = fma(_2921, _2905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2921, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2935 = fma(_2921, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2937 = fma(_2921, _2917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2867 = _2931;
            _2835 = _2935;
            _2877 = _2927;
            _2823 = _2933;
            _2855 = _2929;
            _2843 = _2937;
            _2939 = true;
        }
        else
        {
            bool _2941 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2943 = isnan(_2600);
            bool _2945 = _2941 || _2943;
            bool _2947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2949 = _2945 || _2947;
            if (!_2949)
            {
                _2875 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2951 = _2875;
            _2877 = _2951;
            if (!_2949)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2953 = _2865;
            _2867 = _2953;
            if (!_2949)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2955 = _2853;
            _2855 = _2955;
            if (!_2949)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2957 = _2821;
            _2823 = _2957;
            if (!_2949)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2959 = _2833;
            _2835 = _2959;
            if (!_2949)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2961 = _2841;
            bool _2963 = !_2949;
            _2843 = _2961;
            if (!_2963)
            {
                bool _2965 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2967 = isnan(_2600);
                bool _2969 = _2965 || _2967;
                bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2973 = _2969 || _2971;
                if (!_2973)
                {
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = _2600 + _2975;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2979;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2987 = 1.0 / _2981;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3005 = _2977 * _2987;
                    float _3007 = precise::clamp(_3005, 0.0, 1.0);
                    float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3013 = fma(_3007, _2985, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3015 = fma(_3007, _3011, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3017 = fma(_3007, _2991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3007, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3021 = fma(_3007, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3023 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2867 = _3017;
                    _2835 = _3021;
                    _2877 = _3013;
                    _2823 = _3019;
                    _2855 = _3015;
                    _2843 = _3023;
                    _2939 = true;
                }
                else
                {
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2877 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2939 = false;
    float _3025 = _2867;
    float _3027 = _2835;
    float _3029 = _2877;
    float _3031 = _2823;
    float _3033 = _2855;
    float _3035 = _2843;
    float _3037 = fma(_2252, -0.5, 0.5);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = -_3025;
    float _3043 = _3041 + _3027;
    float _3045 = -_3029;
    float _3047 = _3045 + _3031;
    float _3049 = -_3033;
    float _3051 = _3049 + _3035;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3039, _3043, _3025);
    float _3057 = fma(_3039, _3047, _3029);
    float _3059 = fma(_3039, _3051, _3033);
    float _3061 = _3055 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3063 = fma(_3057, 0.298911988735198974609375, _3061);
    float _3065 = fma(_3059, 0.114477999508380889892578125, _3063);
    out.m_84.x = 0.0;
    float _3067 = -_3065;
    float _3069 = _3057 + _3067;
    float _3071 = -_3065;
    float _3073 = _3055 + _3071;
    float _3075 = -_3065;
    float _3077 = _3059 + _3075;
    float _3079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3081 = fma(_3069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3085 = fma(_3077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    out.m_86.w = _3079;
    out.m_88.x = _3081;
    out.m_88.y = _3083;
    out.m_88.z = _3085;
    if (!_3053)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3087 = -_2440;
    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3091 = -_2442;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3095 = -_2444;
    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3099 = _3089 * _3089;
    float _3101 = fma(_3093, _3093, _3099);
    float _3103 = fma(_3097, _3097, _3101);
    float _3105 = sqrt(_3103);
    float _3107 = rsqrt(_3103);
    float _3109 = -_3105;
    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3115 = precise::clamp(_3113, 0.0, 1.0);
    float _3117 = _3093 * _3107;
    float _3119 = _3089 * _3107;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = _3097 * _3107;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3129 = _2252 * _3119;
    float _3131 = -_3119;
    float _3133 = -_3127;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3133);
    float _3137 = fma(_2246, _3117, _3129);
    float _3139 = -_3125;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3135);
    float _3143 = fma(_2052, _3125, _3137);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3149 = _3141 + _3147;
    float _3151 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = exp2(_3151);
    float _3159 = _3157 * _3155;
    float _3161 = _3145 * _3159;
    float _3163 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3167 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3163;
    out.m_84.y = _3165;
    out.m_84.z = _3167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2939 = false;
    bool _2308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3236 = as_type<float>(_131);
        out.gl_Position.z = _3236;
    }
    if (!_117)
    {
        return out;
    }
    bool _135 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_104);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_55.x;
    float _147 = float(_109);
    float _149 = in.m_55.y;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_55.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    out.m_57.x = _145;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3299 = as_type<float>(_163);
        out.gl_Position.z = _3299;
    }
    out.m_57.y = _149;
    out.m_57.z = _157;
    if (_155)
    {
        return out;
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _147;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _113 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    if (!_189)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _191 = _205;
    }
    float _207 = _191;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = _145 * 2.0;
    float _215 = _149 * 2.0;
    bool _217 = _145 > 0.5;
    float _219 = in.m_55.w;
    float _221 = _167 * _113;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    bool _227 = _149 > 0.5;
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = floor(_213);
    float _239 = float(_211);
    float _241 = _157 * 2.0;
    bool _243 = _157 > 0.5;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _239;
    float _251 = float(_225);
    float _253 = -_183;
    int _255 = _217 ? as_type<int>(_253) : as_type<int>(_183);
    float _257 = -_187;
    int _259 = _227 ? as_type<int>(_257) : as_type<int>(_187);
    bool _261 = !_231;
    float _263 = _261 ? _183 : as_type<float>(_255);
    float _265 = 1.0 / _251;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _277 = _275 != 0;
    bool _279 = !_247;
    float _281 = _279 ? _187 : as_type<float>(_259);
    bool _283 = _237 > 0.0;
    bool _285 = _237 >= 0.0;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    float _295 = floor(_215);
    float _297 = -_183;
    float _299 = _243 ? _297 : _183;
    float _301 = _249 * _113;
    bool _303 = !_273;
    int _305 = _303 ? 0 : 1;
    int _307 = _255;
    float _309 = _299;
    float _311 = _251;
    if (_235)
    {
        _307 = 0;
    }
    int _313 = _307;
    int _315 = _313;
    if (!_235)
    {
        _315 = 1;
    }
    int _317 = _315;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _321 = int(_319);
    float _323 = _265 * _113;
    bool _325 = !_269;
    int _327 = _325 ? 0 : 1;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _331 = int(_329);
    bool _333 = _295 > 0.0;
    bool _335 = _295 >= 0.0;
    bool _337 = isnan(_295);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    int _345 = _343 ? 0 : 1;
    float _347 = floor(_241);
    float _349 = float(uint(_321));
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _353 = _219 > 0.5;
    float _355 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _357 = !_277;
    int _359 = _357 ? 0 : 1;
    float _361 = 1.0 / _349;
    int _363 = _293 ? 0 : 1;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _369 = _367 != 0;
    int _371 = ~_363;
    int _373 = _371 + 1;
    int _375 = _373 + 1;
    int _377 = _375;
    float _379 = _349;
    if (!_283)
    {
        int _381 = ~_363;
        int _383 = _381 + 1;
        _377 = _383;
    }
    int _385 = _377;
    float _387 = trunc(_301);
    int _389 = int(_387);
    float _391 = float(uint(_331));
    bool _393 = !_369;
    float _395 = _393 ? _183 : _299;
    bool _397 = _317 != 1;
    float _399 = 1.0 / _391;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _403 = _401 != 0;
    int _405 = as_type<int>(_361) + (-2);
    int _407 = int(_235);
    int _409 = _283 ? 2 : 0;
    int _411 = _407 | _409;
    int _413 = _353 ? 4 : 0;
    int _415 = _411 | _413;
    int _417 = _397 ? 8 : 0;
    int _419 = _415 | _417;
    int _421 = _403 ? 16 : 0;
    int _423 = _419 | _421;
    int _425 = _333 ? 32 : 0;
    int _427 = _423 | _425;
    int _429 = _277 ? 64 : 0;
    int _431 = _427 | _429;
    int _433 = _431 & 16;
    bool _435 = _347 >= 0.0;
    bool _437 = isnan(_347);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = trunc(_323);
    int _447 = int(_445);
    int _449 = ~_345;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    float _457 = as_type<float>(_433);
    if (!_333)
    {
        int _459 = ~_345;
        int _461 = _459 + 1;
        _455 = _461;
    }
    int _463 = _455;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _467 = _443 ? 0 : 1;
    bool _469 = _347 > 0.0;
    float _471 = -_465;
    float _473 = fma(_355, 2.0, _471);
    float _475 = float(uint(_389));
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    int _481 = as_type<int>(_399) + (-2);
    float _483 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_397)
    {
        _379 = _149;
    }
    float _485 = _379;
    float _487 = as_type<float>(_405) * _475;
    float _489 = _485;
    if (_397)
    {
        _489 = _145;
    }
    float _491 = _489;
    float _493 = fma(_483, -2.0, _351);
    float _495 = float(uint(_447));
    float _497 = trunc(_487);
    float _499 = precise::max(_497, 0.0);
    uint _502 = uint(_499);
    int _504 = ~_467;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = as_type<float>(_481) * _495;
    int _512 = _508;
    if (!_397)
    {
        _309 = _149;
    }
    float _514 = _309;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _518 = _514;
    if (!_469)
    {
        int _520 = ~_467;
        int _522 = _520 + 1;
        _512 = _522;
    }
    int _524 = _512;
    float _526 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    if (_397)
    {
        _518 = _145;
    }
    float _528 = _518;
    float _530 = trunc(_510);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _516);
    float _538 = _479 * _113;
    int _540 = ~_321;
    int _542 = _540 + 1;
    float _544 = _528 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _546 = ~_331;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_397)
    {
        _311 = _157;
    }
    float _552 = _311;
    float _554 = exp2(_538);
    float _556 = _552;
    if (_397)
    {
        _556 = _149;
    }
    float _558 = _556;
    float _560 = -_550;
    float _562 = fma(_544, 2.0, _560);
    int _564 = _542 * int(_502);
    int _566 = _564 + _389;
    if (!_397)
    {
        _457 = _157;
    }
    float _568 = _457;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    int _572 = _548 * int(_534);
    int _574 = _572 + _447;
    float _576 = -_113;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _562);
    float _580 = float(uint(_566));
    float _582 = -_113;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _586 = float(uint(_574));
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = as_type<float>(_405) * _580;
    float _592 = _568;
    if (_397)
    {
        _592 = _149;
    }
    float _594 = _592;
    float _596 = as_type<float>(_481) * _586;
    float _598 = -_554;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _604 = 1.0 + _602;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _618 = trunc(_590);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    float _624 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _570);
    float _626 = fma(_616, -2.0, _588);
    float _628 = _614 ? _600 : 0.0;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = 1.0 / _604;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _646 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _648 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _536);
    float _650 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _626);
    float _652 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _656 = _654 != 0;
    float _658 = trunc(_596);
    float _660 = precise::max(_658, 0.0);
    uint _662 = uint(_660);
    float _664 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _646);
    float _666 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _652);
    int _668 = ~_321;
    int _670 = _668 + 1;
    float _672 = _145 + _157;
    int _674 = int(_502) + int(_622);
    bool _676 = !_656;
    int _678 = _676 ? 0 : 1;
    if (_642)
    {
        float _680 = _628 * _632;
        _123 = _680;
    }
    float _682 = _123;
    int _684 = ~_331;
    int _686 = _684 + 1;
    int _688 = _670 * _674;
    int _690 = _688 + _389;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    float _696 = _672 + (-1.0);
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _700 = _698 != 0;
    float _702 = -_187;
    int _704 = _353 ? as_type<int>(_702) : as_type<int>(_187);
    int _706 = int(_534) + int(_662);
    float _708 = 0.0;
    if (_235)
    {
        _708 = 1.0;
    }
    float _710 = _708;
    float _712 = 0.0;
    float _714 = _710;
    if (_235)
    {
        _712 = _145;
    }
    float _716 = _712;
    int _718 = _686 * _706;
    int _720 = _718 + _447;
    float _722 = 0.0;
    float _724 = _716;
    if (_235)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (!_235)
    {
        _714 = 7.345489978790283203125;
    }
    float _730 = _714;
    if (!_235)
    {
        _724 = _149;
    }
    float _732 = _724;
    if (!_235)
    {
        _728 = 1.2345600128173828125;
    }
    float _734 = _728;
    float _736 = _730 * _145;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _748 = _746 != 0;
    bool _750 = !_694;
    float _752 = _750 ? _187 : as_type<float>(_704);
    bool _754 = uint(_690) >= uint(_321);
    bool _756 = uint(_720) >= uint(_331);
    float _758 = in.m_46.x;
    float _760 = in.m_46.y;
    float _762 = in.m_46.z;
    bool _764 = !_744;
    int _766 = _764 ? 0 : 1;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _770 = _768 != 0;
    bool _772 = !_700;
    int _774 = _772 ? 0 : 1;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _776;
    bool _780 = !_754;
    int _782 = _780 ? 0 : (-1);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _788 = !_756;
    int _790 = _788 ? 0 : (-1);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _806 = _804 != 0;
    float _808 = _145 + _149;
    float _810 = 1.0 / _786;
    float _812 = _808 + (-1.0);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _149 + _157;
    float _822 = 1.0 / _778;
    float _824 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _828 = _820 + (-1.0);
    float _830 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].x, _826);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = 1.0 / _816;
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _842 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _846 = _207 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _850 = _207 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _854 = _207 + _852;
    float _856 = _846 * _810;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _860 = _850 * _822;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _862;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].z, _840);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _872 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _874 = isnan(_207);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _145 + (-0.5);
    float _886 = _854 * _838;
    float _888 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _890 = fma(_864, _860, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _892 = _732 * _734;
    bool _894 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _896 = isnan(_207);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _906;
    bool _910 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _912 = isnan(_207);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_882;
    float _924 = _922 + 1.0;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_908, _860, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _932 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _934 = isnan(_207);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _948 = _904 * _924;
    float _950 = _920 * _928;
    float _952 = floor(_736);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _954;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = fma(_946, _856, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _964 = _281 + (-0.5);
    float _966 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _968 = _942 * _960;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = floor(_892);
    float _976 = -_964;
    float _978 = -_526;
    float _980 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[80].y, _978);
    float _982 = _890 * _968;
    float _984 = _930 * _968;
    float _986 = fma(_956, _886, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _988 = _263 + 0.5;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].x, _982);
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].y, _984);
    float _994 = -_952;
    float _996 = _736 + _994;
    float _998 = float(_331);
    float _1000 = fma(_966, _950, _990);
    float _1002 = float(_447);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _584);
    bool _1006 = !_748;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = _998 * _221;
    bool _1012 = !_740;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = -_974;
    float _1018 = _892 + _1016;
    float _1020 = float(_321);
    float _1022 = fma(_962, _950, _992);
    float _1024 = _1018 * _998;
    float _1026 = float(_389);
    float _1028 = _1020 * _221;
    bool _1030 = _1002 >= _998;
    bool _1032 = isnan(_1002);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(_998);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = fma(_986, _948, _1000);
    int _1044 = abs(_1008);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    int _1050 = abs(_1014);
    float _1052 = _996 * _1020;
    float _1054 = float(_463);
    float _1056 = fma(_1048, _886, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1058 = _1026 >= _1020;
    bool _1060 = isnan(_1026);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1020);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1024);
    int _1072 = int(_1070);
    float _1074 = in.m_62.x;
    float _1076 = in.m_62.y;
    float _1078 = in.m_62.z;
    float _1080 = float(_524);
    float _1082 = fma(_1056, _948, _1022);
    float _1084 = float(_1050);
    float _1086 = _395 + 0.5;
    float _1088 = in.m_64.x;
    float _1090 = in.m_64.y;
    int _1092 = abs(_766);
    float _1094 = trunc(_1052);
    int _1096 = int(_1094);
    float _1098 = float(_1044);
    float _1100 = _1084 * _1080;
    float _1102 = float(_385);
    float _1104 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1042);
    float _1106 = float(_1092);
    float _1108 = _1098 * _1054;
    float _1110 = _752 + (-0.5);
    float _1112 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1082);
    float _1114 = _1100 * (-2.0);
    float _1116 = _1106 * _1102;
    float _1118 = -_1110;
    float _1120 = -_650;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1120);
    float _1124 = _1108 * (-2.0);
    float _1126 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[85].x, _578);
    float _1128 = _1116 * (-2.0);
    float _1130 = fma(_818, _1114, _818);
    float _1132 = trunc(_1040);
    int _1134 = int(_1132);
    float _1136 = fma(_1114, _1074, _1074);
    float _1138 = fma(_836, _1128, _836);
    float _1140 = fma(_824, _1124, _824);
    float _1142 = fma(_1128, _1076, _1076);
    float _1144 = fma(_1124, _1078, _1078);
    int _1146 = abs(_678);
    float _1148 = _149 + (-0.5);
    float _1150 = trunc(_1068);
    int _1152 = int(_1150);
    float _1154 = _157 + (-0.5);
    float _1156 = _1112 * _1090;
    float _1158 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1136);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1142);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1144);
    int _1164 = ~_706;
    int _1166 = _1164 + _790;
    int _1168 = _1166 + 1;
    float _1170 = fma(_1130, _682, _1158);
    int _1172 = ~_674;
    int _1174 = _1172 + _782;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1138, _682, _1160);
    float _1180 = fma(_1140, _682, _1162);
    int _1182 = abs(_774);
    int _1184 = _1096 * _1146;
    int _1186 = _1184 + _389;
    bool _1188 = !_798;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _331 * _1168;
    int _1194 = _1192 + _447;
    bool _1196 = _331 == 0;
    int _1198 = _321 * _1176;
    int _1200 = _1198 + _389;
    bool _1202 = _321 == 0;
    int _1204 = _1072 * _1182;
    int _1206 = _1204 + _447;
    int _1208 = ~_1134;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1028);
    int _1216 = int(_1214);
    bool _1218 = !_1196;
    int _1220 = _1218 ? _1194 : (-1);
    float _1222 = _1104 * _1088;
    int _1224 = ~_1152;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1170 * 0.15915493667125701904296875;
    bool _1232 = !_1202;
    int _1234 = _1232 ? _1200 : (-1);
    int _1236 = _1220 * _1212;
    int _1238 = _321 + (-1);
    float _1240 = trunc(_1010);
    int _1242 = int(_1240);
    int _1244 = _331 + (-1);
    int _1246 = _1234 * _1228;
    float _1248 = float(uint(_1186));
    float _1250 = _1178 * 0.15915493667125701904296875;
    int _1252 = abs(_1190);
    int _1254 = _1152 * _1238;
    int _1256 = _1254 + _1246;
    int _1258 = abs(_305);
    int _1260 = _1134 * _1244;
    int _1262 = _1260 + _1236;
    int _1264 = abs(_327);
    float _1266 = as_type<float>(_405) * _1248;
    float _1268 = float(uint(_1206));
    int _1270 = _1256 * _1258;
    bool _1272 = !_770;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1262 * _1252;
    int _1278 = abs(_359);
    float _1280 = as_type<float>(_481) * _1268;
    float _1282 = trunc(_1266);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = !_794;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1294 = abs(_1274);
    int _1296 = _1216 * _1264;
    int _1298 = _1296 + _1270;
    float _1300 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1302 = abs(_1290);
    float _1304 = trunc(_1280);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = _1186 * _1278;
    int _1312 = _1310 + _1298;
    bool _1314 = !_802;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1320 = _1096 * _1294;
    int _1322 = _1320 + _1312;
    int _1324 = abs(_1316);
    float _1326 = _1230 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    int _1330 = ~_331;
    int _1332 = _1330 + 1;
    int _1334 = _1242 * _1302;
    int _1336 = _1334 + _1276;
    float _1338 = float(uint(_1322));
    float _1340 = _1300 * _1292;
    float _1342 = _888 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1344 = !_806;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1230 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = as_type<float>(_405) * _1338;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1356 = abs(_1346);
    int _1358 = _1332 * int(_1308);
    int _1360 = _1358 + _1206;
    int _1362 = ~_321;
    int _1364 = _1362 + 1;
    int _1366 = _1206 * _1324;
    int _1368 = _1366 + _1336;
    float _1370 = _1318 * _1354;
    float _1372 = _1250 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    float _1376 = _1180 * 0.15915493667125701904296875;
    int _1378 = ~_321;
    int _1380 = _1378 + 1;
    int _1382 = _1072 * _1356;
    int _1384 = _1382 + _1368;
    float _1386 = float(uint(_1360));
    int _1388 = _1380 * int(_1286);
    int _1390 = _1388 + _1186;
    float _1392 = _1250 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = as_type<float>(_481) * _1386;
    float _1398 = float(uint(_1384));
    float _1400 = float(uint(_1390));
    float _1402 = _1376 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1328 * _1374;
    float _1408 = trunc(_1352);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = _1350 * _1394;
    float _1416 = _1376 * 6.283185482025146484375;
    float _1418 = sin(_1416);
    float _1420 = _1350 * _1404;
    float _1422 = _1394 * _1404;
    float _1424 = _1328 * _1404;
    float _1426 = trunc(_1396);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_405) * _1400;
    float _1434 = _1328 * _1394;
    int _1436 = _1364 * int(_1412);
    int _1438 = _1436 + _1322;
    int _1440 = ~_331;
    int _1442 = _1440 + 1;
    float _1444 = trunc(_1432);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    float _1450 = _1420 * _1370;
    int _1452 = int(_1308) + int(_1430);
    float _1454 = _1350 * _1374;
    float _1456 = _1374 * _1404;
    float _1458 = as_type<float>(_481) * _1398;
    float _1460 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = -_1454;
    float _1464 = fma(_1418, _1434, _1462);
    float _1466 = -_1434;
    float _1468 = fma(_1418, _1454, _1466);
    float _1470 = float(uint(_1438));
    float _1472 = fma(_1418, _1414, _1406);
    float _1474 = trunc(_1458);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_1418, _1406, _1414);
    float _1482 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = as_type<float>(_405) * _1470;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1488 = int(_1286) + int(_1448);
    float _1490 = -_1418;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1494 = -_1418;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1498 = -_1418;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1502 = -_1370;
    float _1504 = _1418 * _1502;
    float _1506 = _1424 * _1370;
    float _1508 = trunc(_1484);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1500);
    float _1516 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1518 = fma(_1464, _1340, _1506);
    float _1520 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    int _1522 = _1442 * int(_1478);
    int _1524 = _1522 + _1384;
    float _1526 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    float _1528 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1530 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = float(uint(_1524));
    float _1536 = fma(_1422, _1340, _1504);
    float _1538 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1516);
    float _1540 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1528);
    float _1542 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1544 = as_type<float>(_481) * _1534;
    float _1546 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    int _1550 = ~_321;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1472, _1340, _1450);
    int _1556 = ~_331;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1546);
    int _1568 = ~_321;
    int _1570 = _1568 + 1;
    float _1572 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1574 = int(_1412) + int(_1512);
    float _1576 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1548);
    float _1580 = fma(_1468, _1572, _1554);
    float _1582 = fma(_1456, _1572, _1536);
    float _1584 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    float _1586 = fma(_1480, _1572, _1518);
    int _1588 = ~_331;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    float _1594 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1596 = int(_1478) + int(_1564);
    int _1598 = _1570 * _1574;
    int _1600 = _1598 + _1322;
    bool _1602 = uint(_1600) >= uint(_321);
    int _1604 = _1552 * _1488;
    int _1606 = _1604 + _1186;
    int _1608 = _1558 * _1596;
    int _1610 = _1608 + _1384;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    bool _1616 = uint(_1606) >= uint(_321);
    float _1618 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1566);
    bool _1620 = uint(_1610) >= uint(_331);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1594);
    int _1624 = ~_1574;
    int _1626 = _1624 + _1614;
    int _1628 = _1626 + 1;
    float _1630 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1638 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    int _1640 = _321 * _1628;
    int _1642 = _1640 + _1322;
    int _1644 = ~_1596;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    bool _1652 = !_1616;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1636);
    bool _1658 = !_1202;
    int _1660 = _1658 ? _1642 : (-1);
    int _1662 = _331 * _1648;
    int _1664 = _1662 + _1384;
    int _1666 = ~_1488;
    int _1668 = _1666 + _1654;
    int _1670 = _1668 + 1;
    float _1672 = _858 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1674 = _1660 >> 31;
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1656);
    bool _1678 = !_1196;
    int _1680 = _1678 ? _1664 : (-1);
    float _1682 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1684 = _1674 & 3;
    float _1686 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1688 = _1680 >> 31;
    float _1690 = _1672 + _1682;
    int _1692 = _1660 + _1684;
    float _1694 = _1342 + _1686;
    int _1696 = _1688 & 3;
    int _1698 = _1590 * _1452;
    int _1700 = _1698 + _1206;
    int _1702 = _1692 >> 2;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1690 + _1704;
    int _1708 = _1680 + _1696;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1694 + _1710;
    int _1714 = _1702 << 4;
    int _1716 = _1714 + 368;
    float _1718 = _1706 * _1706;
    int _1720 = _1708 >> 2;
    float _1722 = _1712 * _1712;
    int _1724 = _1716 + 8;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    bool _1742 = uint(_1700) >= uint(_331);
    float _1744 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1746 = _1720 << 4;
    int _1748 = _1746 + 512;
    float _1750 = _1718 + _1722;
    bool _1752 = !_1742;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1538);
    int _1758 = _1660 & 3;
    bool _1760 = _1758 != 0;
    uint _1762 = uint(int(uint(_1716) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1660 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1650);
    int _1784 = ~_1452;
    int _1786 = _1784 + _1754;
    int _1788 = _1786 + 1;
    float _1790 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1540);
    int _1792 = _1760 ? 0 : 1;
    float _1794 = sqrt(_1750);
    bool _1796 = uint(_1778) > 1u;
    uint _1798 = uint(int(uint(_1748) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = ~_1792;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1542);
    bool _1822 = _1778 != 3;
    float _1824 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1826 = _1744 * _1514;
    float _1828 = _1744 * _1526;
    bool _1830 = !_1780;
    int _1832 = _1830 ? 0 : 1;
    int _1834 = _1748 + 8;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = fma(_1824, _1756, _1826);
    int _1854 = _321 * _1670;
    int _1856 = _1854 + _1186;
    float _1858 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1860 = _1818;
    float _1862 = _1718;
    float _1864 = _1722;
    float _1866 = _1690;
    float _1868 = _1694;
    float _1870 = _1790;
    float _1872 = _1342;
    float _1874 = _1858;
    float _1876 = _1672;
    if (!_1796)
    {
        int _1878 = ~_1792;
        int _1880 = _1878 + 1;
        _1860 = _1880;
    }
    int _1882 = _1860;
    float _1884 = _1744 * _1520;
    bool _1886 = uint(_1778) >= 2u;
    int _1888 = _331 * _1788;
    int _1890 = _1888 + _1206;
    bool _1892 = _1794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = fma(_1824, _1790, _1884);
    float _1896 = fma(_1824, _1820, _1828);
    int _1898 = _1886 ? 0 : 1;
    int _1900 = _1680 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = ~_1898;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1908;
    if (_1822)
    {
        int _1912 = ~_1898;
        int _1914 = _1912 + 1;
        _1910 = _1914;
    }
    int _1916 = _1910;
    bool _1918 = !_1902;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = _1680 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1928 = uint(_1900) >= 2u;
    int _1930 = _1924 ? 0 : 1;
    float _1932 = _1858 + _1926;
    int _1934 = _1928 ? 0 : 1;
    bool _1936 = uint(_1900) > 1u;
    bool _1938 = _1900 != 3;
    int _1940 = abs(_1882);
    bool _1942 = !_1892;
    float _1944 = _1932;
    if (!_1942)
    {
        float _1946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1950 = _1794 + _1948;
        float _1952 = rsqrt(_1750);
        float _1954 = _1950 * _1946;
        float _1956 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = _1954 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = fma(_1962, _1956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = _1952 * _1968;
        float _1972 = _1966 + (-1.0);
        float _1974 = fma(_1706, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1712, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1982 = _1974 + _1980;
        float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1986 = _1976 + _1984;
        float _1988 = fma(_1932, _1966, _1978);
        float _1990 = _1982 * _1982;
        float _1992 = _1986 * _1986;
        _1944 = _1988;
        _1862 = _1990;
        _1864 = _1992;
        _1866 = _1974;
        _1868 = _1976;
    }
    float _1994 = _1944;
    float _1996 = _1862;
    float _1998 = _1864;
    float _2000 = _1866;
    float _2002 = _1868;
    int _2004 = ~_1930;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = -_666;
    float _2012 = _2010 + 1.0;
    int _2014 = _2008;
    if (!_1936)
    {
        int _2016 = ~_1930;
        int _2018 = _2016 + 1;
        _2014 = _2018;
    }
    int _2020 = _2014;
    float _2022 = -_648;
    float _2024 = _2022 + 1.0;
    int _2026 = abs(_1832);
    float _2028 = -_624;
    float _2030 = _2028 + 1.0;
    int _2032 = ~_1934;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_281, _2012, _980);
    int _2040 = abs(_2020);
    float _2042 = -_664;
    float _2044 = _2042 + 1.0;
    int _2046 = ~_1940;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1592 + _1896;
    int _2054 = _2036;
    if (_1938)
    {
        int _2056 = ~_1934;
        int _2058 = _2056 + 1;
        _2054 = _2058;
    }
    int _2060 = _2054;
    float _2062 = -_2044;
    float _2064 = fma(_263, _2062, _1004);
    int _2066 = _2050 * as_type<int>(_1776);
    bool _2068 = _1778 != 3;
    out.m_66.x = _1756;
    out.m_66.y = _1790;
    out.m_66.z = _1820;
    int _2070 = abs(_1920);
    int _2072 = abs(_1916);
    int _2074 = abs(_2060);
    int _2076 = ~_2040;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_2026;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2080 * as_type<int>(_1812);
    int _2096 = _2086 * as_type<int>(_1768);
    int _2098 = _2096 + _2066;
    int _2100 = _2092 * as_type<int>(_1804);
    int _2102 = _2100 + _2094;
    int _2104 = ~_2072;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1744, _1744, 1.0);
    bool _2112 = _1900 != 3;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    int _2118 = _2108 * as_type<int>(_1732);
    int _2120 = _2118 + _2098;
    bool _2122 = !_2068;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2128 = _2126 != 0;
    int _2130 = ~_2074;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    bool _2136 = !_2112;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2134 * as_type<int>(_1842);
    int _2146 = _2144 + _2102;
    int _2148 = abs(_2124);
    float _2150 = rsqrt(_2110);
    bool _2152 = !_2128;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = abs(_2138);
    int _2158 = abs(_2142);
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2162 = _1994 + _2160;
    int _2164 = abs(_2154);
    float _2166 = fma(_2162, _2162, _1996);
    int _2168 = ~_2148;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = ~_2156;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _2166 + _1998;
    int _2182 = ~_2158;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2172 * as_type<int>(_1740);
    int _2190 = _2188 + _2120;
    int _2192 = ~_2164;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * as_type<int>(_1850);
    int _2200 = _2198 + _2146;
    bool _2202 = !_1196;
    int _2204 = _2202 ? _1890 : (-1);
    int _2206 = _2190 * _2186;
    bool _2208 = !_1202;
    int _2210 = _2208 ? _1856 : (-1);
    int _2212 = _2200 * _2196;
    float _2214 = _1744 * _2150;
    float _2216 = -_2024;
    float _2218 = fma(_395, _2216, _1126);
    float _2220 = sqrt(_2180);
    int _2222 = _2204 * _2164;
    int _2224 = _2222 + _2212;
    float _2226 = -_1618;
    float _2228 = _2214 * _2226;
    int _2230 = _2210 * _2158;
    int _2232 = _2230 + _2206;
    float _2234 = fma(_752, _2030, _1122);
    float _2236 = -_1578;
    float _2238 = _2214 * _2236;
    float _2240 = -_1592;
    float _2242 = _2214 * _2240;
    float _2244 = fma(_2150, _1514, _2228);
    float _2246 = _1618 + _1852;
    float _2248 = fma(_2150, _1520, _2238);
    float _2250 = fma(_2150, _1526, _2242);
    float _2252 = _1578 + _1894;
    float _2254 = float(_2232);
    out.m_68.x = _2064;
    out.m_68.y = _2038;
    out.m_68.z = _2218;
    out.m_68.w = _2234;
    float _2256 = float(_2224);
    bool _2258 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2260 = isnan(_2220);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2266 = _2262 || _2264;
    out.m_70.x = _2244;
    out.m_70.y = _2248;
    out.m_70.z = _2250;
    out.m_72.x = _2254;
    out.m_72.y = _2256;
    out.m_74.x = _2246;
    out.m_74.y = _2252;
    out.m_74.z = _2052;
    float _2268 = _2242;
    float _2270 = as_type<float>(_2190);
    float _2272 = _2218;
    if (!_2266)
    {
        _2268 = 1.0;
    }
    float _2274 = _2268;
    bool _2276 = !_2266;
    float _2278 = _2274;
    if (!_2276)
    {
        bool _2280 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2282 = isnan(_2220);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2288 = _2284 || _2286;
        if (!_2288)
        {
            float _2290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2292 = _2220 + _2290;
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2302 = 1.0 / _2296;
            float _2304 = _2292 * _2302;
            float _2306 = fma(_2304, _2300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2278 = _2306;
            _1870 = _2302;
            _2308 = true;
        }
        else
        {
            bool _2310 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2312 = isnan(_2220);
            bool _2314 = _2310 || _2312;
            bool _2316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2318 = _2314 || _2316;
            if (!_2318)
            {
                float _2320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2322 = _2220 + _2320;
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2332 = 1.0 / _2326;
                float _2334 = _2322 * _2332;
                float _2336 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2278 = _2336;
                _1870 = _2332;
                _2308 = true;
            }
            else
            {
                _2278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2308 = false;
    float _2338 = _2278;
    float _2340 = _1870;
    float _2342 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2344 = _2000 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2348 = _2002 + _2346;
    bool _2350 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.5);
    bool _2358 = _2354 || _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2362 = _1994 + _2360;
    float _2364 = fma(_2344, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = fma(_2348, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2368 = fma(_2362, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2370 = _2362;
    float _2372 = _2340;
    float _2374 = _2348;
    float _2376 = _2366;
    if (_2358)
    {
        _2370 = _2364;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (_2358)
    {
        _2372 = _2368;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    if (_2358)
    {
        _2374 = _2366;
    }
    float _2386 = _2374;
    float _2388 = _2386;
    if (!_2358)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1858 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _1672 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2392 * _2392;
        float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2404 = _1342 + _2402;
        float _2406 = fma(_2396, _2396, _2400);
        float _2408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2410 = fma(_2404, _2404, _2406);
        float _2412 = sqrt(_2410);
        float _2414 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2416 = precise::min(_2412, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2418 = _2416 * _2408;
        float _2420 = -_1672;
        float _2422 = _2420 + _2364;
        float _2424 = -_1858;
        float _2426 = _2424 + _2368;
        float _2428 = _2414 * _2418;
        float _2430 = -_1342;
        float _2432 = _2430 + _2366;
        float _2434 = fma(_2422, _2428, _1672);
        float _2436 = fma(_2426, _2428, _1858);
        float _2438 = fma(_2432, _2428, _1342);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2448 = _2440 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2452 = _2442 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2444 + _2454;
    float _2458 = _2448 * _2448;
    float _2460 = fma(_2452, _2452, _2458);
    float _2462 = fma(_2456, _2456, _2460);
    float _2464 = rsqrt(_2462);
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2452 * _2466;
    float _2470 = _2456 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2456;
    float _2488 = _2484;
    float _2490 = _2468;
    if (_2480)
    {
        float _2492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2492;
    }
    float _2494 = _2486;
    if (_2480)
    {
        float _2496 = rsqrt(_2476);
        _2376 = _2496;
    }
    float _2498 = _2376;
    float _2500 = _2498;
    if (_2480)
    {
        float _2502 = _2484 * _2494;
        _2488 = _2502;
    }
    float _2504 = _2488;
    if (_2480)
    {
        float _2506 = _2504 * 0.15915493667125701904296875;
        _2270 = _2506;
    }
    float _2508 = _2270;
    float _2510 = _2458;
    float _2512 = _2508;
    if (_2480)
    {
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        _2510 = _2516;
    }
    float _2518 = _2510;
    float _2520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2522 = precise::max(0.0, _2520);
    float _2524 = _2464;
    float _2526 = _2522;
    float _2528 = _2520;
    if (_2480)
    {
        float _2530 = _2508 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = -_2466;
    float _2538 = -_2522;
    float _2540 = fma(_2448, _2536, _2538);
    float _2542 = _2540;
    if (!_2480)
    {
        _2526 = _2472;
    }
    float _2544 = _2526;
    float _2546 = _2544;
    if (_2480)
    {
        float _2548 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2548;
    }
    float _2550 = _2528;
    float _2552 = _2518;
    float _2554 = _2550;
    if (_2480)
    {
        float _2556 = fma(_2518, _2550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2552 = _2556;
    }
    float _2558 = _2552;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2562 = _2558;
    if (_2480)
    {
        float _2564 = _2534 + (-1.0);
        _2554 = _2564;
    }
    float _2566 = _2554;
    if (_2480)
    {
        float _2568 = _2498 * _2558;
        _2272 = _2568;
    }
    float _2570 = _2272;
    if (!_2480)
    {
        _2500 = _2540;
    }
    float _2572 = _2500;
    float _2574 = _2572;
    if (_2480)
    {
        float _2576 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2576;
    }
    float _2578 = _2512;
    if (_2480)
    {
        float _2580 = _2468 * _2570;
        _2490 = _2580;
    }
    float _2582 = _2490;
    if (!_2480)
    {
        _2562 = _2470;
    }
    float _2584 = _2562;
    float _2586 = _2584;
    if (_2480)
    {
        float _2588 = _2470 * _2570;
        _2586 = _2588;
    }
    float _2590 = _2586;
    if (_2480)
    {
        float _2592 = fma(_2540, _2534, _2578);
        _2574 = _2592;
    }
    float _2594 = _2574;
    if (_2480)
    {
        float _2596 = _2582 * _2582;
        _2546 = _2596;
    }
    float _2598 = _2546;
    float _2600 = sqrt(_2462);
    if (!_2480)
    {
        _2542 = _2474;
    }
    float _2602 = _2542;
    float _2604 = _2602;
    if (_2480)
    {
        float _2606 = _2590 * _2590;
        _2604 = _2606;
    }
    float _2608 = _2604;
    float _2610 = fma(_2594, _2594, _2598);
    float _2612 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2614 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2616 = _2610 + _2608;
    float _2618 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2612);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2622 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2614);
    float _2624 = rsqrt(_2616);
    float _2626 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2618);
    float _2628 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2630 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2620);
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2634 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2632);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2640 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2628);
    float _2642 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2630);
    float _2644 = -_2636;
    float _2646 = _2644 + 1.0;
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2650 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2640);
    float _2652 = _2642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2654 = abs(_2646);
    float _2656 = log2(_2654);
    float _2658 = -_2648;
    float _2660 = fma(_2658, _2560, 1.0);
    float _2662 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2622);
    float _2664 = _2624 * _2582;
    float _2666 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2670 = _2624 * _2594;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2674 = _2624 * _2590;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2668);
    float _2678 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2680 = -_2672;
    float _2682 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2680);
    float _2684 = log2(_2660);
    float _2686 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2676);
    float _2688 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2690 = -_2674;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2696 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2686);
    float _2698 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2700 = fma(_2692, -0.5, 0.5);
    float _2702 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2688);
    float _2704 = 1.0 / _2696;
    float _2706 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2698);
    float _2708 = fma(_2692, 0.5, 0.5);
    float _2710 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2702);
    float _2712 = _2670 + 1.0;
    float _2714 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2706);
    float _2716 = fma(_2708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2718 = _2684 * 0.693147182464599609375;
    float _2720 = exp2(_2694);
    float _2722 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2714);
    float _2724 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2710);
    float _2726 = fma(_2708, _2716, -0.212114393711090087890625);
    float _2728 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2730 = fma(_2708, _2726, 1.570728778839111328125);
    float _2732 = sqrt(_2700);
    float _2734 = _2722 * _2704;
    float _2736 = fma(_2734, 0.5, 0.5);
    float _2738 = -_2670;
    float _2740 = fma(_2720, _2712, _2738);
    float _2742 = _2724 * _2704;
    float _2744 = fma(_2740, 0.5, 0.5);
    float _2746 = fma(_2742, -0.5, 0.5);
    float _2748 = _2732 * 0.636619746685028076171875;
    float3 _7189 = float3(_2736, _2746, _2728);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7189, float3(0.0), isnan(_7189)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7189, float3(0.0), isnan(_7189)), level(0.0)).x;
    float _2752 = -_2730;
    float _2754 = fma(_2748, _2752, 1.0);
    float3 _7205 = float3(_2736, _2746, _2728);
    float4 _2757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7205, float3(0.0), isnan(_7205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7205, float3(0.0), isnan(_7205)), level(0.0)).xyzw;
    float _2759 = _2757.x;
    float _2761 = _2757.y;
    float _2763 = _2757.z;
    float _2765 = _2757.w;
    float2 _7222 = float2(_2754, _2744);
    float3 _2769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7222, float2(0.0), isnan(_7222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7222, float2(0.0), isnan(_7222)), level(0.0)).xyz;
    float _2771 = _2769.x;
    float _2773 = _2769.y;
    float _2775 = _2769.z;
    float _2777 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2779 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2781 = _2696 * 0.5;
    out.m_76.x = _2442;
    out.m_76.y = _2440;
    out.m_76.z = _2444;
    float _2783 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2779);
    float _2785 = exp2(_2777);
    float _2787 = fma(_2724, -0.5, _2781);
    bool _2789 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2791 = isnan(_2600);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2797 = _2793 || _2795;
    float _2799 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2783);
    float _2801 = _2722 + _2696;
    out.m_78.x = _1672;
    out.m_78.y = _1858;
    out.m_78.z = _1342;
    float _2803 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2799);
    float _2805 = _2801 * 0.5;
    float _2807 = _2803 + _2696;
    out.gl_Position.x = _2722;
    out.gl_Position.y = _2724;
    out.gl_Position.z = _2803;
    out.gl_Position.w = _2696;
    float _2809 = _2807 * 0.5;
    float _2811 = -_2785;
    float _2813 = _2811 + 1.0;
    if (!_2797)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2815 = _1872;
    float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2805;
    out.m_80.y = _2787;
    out.m_80.z = _2809;
    out.m_80.w = _2696;
    float _2819 = _2817;
    float _2821 = _2815;
    float _2823 = _2815;
    if (!_2797)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2825 = _1874;
    float _2827 = -_2817;
    float _2829 = _2827 + 1.0;
    float _2831 = _2829;
    float _2833 = _2825;
    float _2835 = _2825;
    if (!_2797)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2837 = _1876;
    float _2839 = _2817 * _2750;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2797)
    {
        _2819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2819;
    float _2847 = _2765 * _2839;
    float _2849 = _2765 * _2829;
    float _2851 = _2847;
    float _2853 = _2845;
    float _2855 = _2845;
    if (!_2797)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2831;
    float _2859 = _2775 * _2839;
    float _2861 = fma(_2771, _2847, _2759);
    float _2863 = fma(_2773, _2847, _2761);
    float _2865 = _2857;
    float _2867 = _2857;
    if (!_2797)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2869 = _2851;
    float _2871 = fma(_2765, _2859, _2763);
    out.m_82.x = _2861;
    out.m_82.y = _2863;
    out.m_82.z = _2871;
    out.m_82.w = _2849;
    bool _2873 = !_2797;
    float _2875 = _2869;
    float _2877 = _2869;
    if (!_2873)
    {
        bool _2879 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2881 = isnan(_2600);
        bool _2883 = _2879 || _2881;
        bool _2885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2887 = _2883 || _2885;
        if (!_2887)
        {
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = _2600 + _2889;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2893;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2901 = 1.0 / _2895;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2919 = _2891 * _2901;
            float _2921 = precise::clamp(_2919, 0.0, 1.0);
            float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2927 = fma(_2921, _2899, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2929 = fma(_2921, _2925, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2931 = fma(_2921, _2905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2921, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2935 = fma(_2921, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2937 = fma(_2921, _2917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2867 = _2931;
            _2835 = _2935;
            _2877 = _2927;
            _2823 = _2933;
            _2855 = _2929;
            _2843 = _2937;
            _2939 = true;
        }
        else
        {
            bool _2941 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2943 = isnan(_2600);
            bool _2945 = _2941 || _2943;
            bool _2947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2949 = _2945 || _2947;
            if (!_2949)
            {
                _2875 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2951 = _2875;
            _2877 = _2951;
            if (!_2949)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2953 = _2865;
            _2867 = _2953;
            if (!_2949)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2955 = _2853;
            _2855 = _2955;
            if (!_2949)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2957 = _2821;
            _2823 = _2957;
            if (!_2949)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2959 = _2833;
            _2835 = _2959;
            if (!_2949)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2961 = _2841;
            bool _2963 = !_2949;
            _2843 = _2961;
            if (!_2963)
            {
                bool _2965 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2967 = isnan(_2600);
                bool _2969 = _2965 || _2967;
                bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2973 = _2969 || _2971;
                if (!_2973)
                {
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = _2600 + _2975;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2979;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2987 = 1.0 / _2981;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3005 = _2977 * _2987;
                    float _3007 = precise::clamp(_3005, 0.0, 1.0);
                    float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3013 = fma(_3007, _2985, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3015 = fma(_3007, _3011, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3017 = fma(_3007, _2991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3007, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3021 = fma(_3007, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3023 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2867 = _3017;
                    _2835 = _3021;
                    _2877 = _3013;
                    _2823 = _3019;
                    _2855 = _3015;
                    _2843 = _3023;
                    _2939 = true;
                }
                else
                {
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2877 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2939 = false;
    float _3025 = _2867;
    float _3027 = _2835;
    float _3029 = _2877;
    float _3031 = _2823;
    float _3033 = _2855;
    float _3035 = _2843;
    float _3037 = fma(_2252, -0.5, 0.5);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = -_3025;
    float _3043 = _3041 + _3027;
    float _3045 = -_3029;
    float _3047 = _3045 + _3031;
    float _3049 = -_3033;
    float _3051 = _3049 + _3035;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3039, _3043, _3025);
    float _3057 = fma(_3039, _3047, _3029);
    float _3059 = fma(_3039, _3051, _3033);
    float _3061 = _3055 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3063 = fma(_3057, 0.298911988735198974609375, _3061);
    float _3065 = fma(_3059, 0.114477999508380889892578125, _3063);
    out.m_84.x = 0.0;
    float _3067 = -_3065;
    float _3069 = _3057 + _3067;
    float _3071 = -_3065;
    float _3073 = _3055 + _3071;
    float _3075 = -_3065;
    float _3077 = _3059 + _3075;
    float _3079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3081 = fma(_3069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3085 = fma(_3077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    out.m_86.w = _3079;
    out.m_88.x = _3081;
    out.m_88.y = _3083;
    out.m_88.z = _3085;
    if (!_3053)
    {
        return out;
    }
    float _3087 = -_2440;
    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3091 = -_2442;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3095 = -_2444;
    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3099 = _3089 * _3089;
    float _3101 = fma(_3093, _3093, _3099);
    float _3103 = fma(_3097, _3097, _3101);
    float _3105 = sqrt(_3103);
    float _3107 = rsqrt(_3103);
    float _3109 = -_3105;
    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3115 = precise::clamp(_3113, 0.0, 1.0);
    float _3117 = _3093 * _3107;
    float _3119 = _3089 * _3107;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = _3097 * _3107;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3129 = _2252 * _3119;
    float _3131 = -_3119;
    float _3133 = -_3127;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3133);
    float _3137 = fma(_2246, _3117, _3129);
    float _3139 = -_3125;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3135);
    float _3143 = fma(_2052, _3125, _3137);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3149 = _3141 + _3147;
    float _3151 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = exp2(_3151);
    float _3159 = _3157 * _3155;
    float _3161 = _3145 * _3159;
    float _3163 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3167 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3163;
    out.m_84.y = _3165;
    out.m_84.z = _3167;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2939 = false;
    bool _2308 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _127 = 0;
    if (!_117)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3236 = as_type<float>(_131);
        out.gl_Position.z = _3236;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _135 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_104);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_55.x;
    float _147 = float(_109);
    float _149 = in.m_55.y;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_55.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_155)
    {
        out.m_53.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    out.m_57.x = _145;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3299 = as_type<float>(_163);
        out.gl_Position.z = _3299;
    }
    out.m_57.y = _149;
    out.m_57.z = _157;
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = as_type<float>(int(gl_VertexIndex));
    float _167 = 1.0 / _147;
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _171 = _113 * _167;
    int _173 = as_type<int>(_165) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_165) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_169;
    float _191 = _171;
    if (!_189)
    {
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _191 = _205;
    }
    float _207 = _191;
    float _209 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _211 = int(_209);
    float _213 = _145 * 2.0;
    float _215 = _149 * 2.0;
    bool _217 = _145 > 0.5;
    float _219 = in.m_55.w;
    float _221 = _167 * _113;
    float _223 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _225 = int(_223);
    bool _227 = _149 > 0.5;
    int _229 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _231 = _229 != 0;
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _235 = _233 != 0;
    float _237 = floor(_213);
    float _239 = float(_211);
    float _241 = _157 * 2.0;
    bool _243 = _157 > 0.5;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _239;
    float _251 = float(_225);
    float _253 = -_183;
    int _255 = _217 ? as_type<int>(_253) : as_type<int>(_183);
    float _257 = -_187;
    int _259 = _227 ? as_type<int>(_257) : as_type<int>(_187);
    bool _261 = !_231;
    float _263 = _261 ? _183 : as_type<float>(_255);
    float _265 = 1.0 / _251;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _269 = _267 != 0;
    int _271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _273 = _271 != 0;
    int _275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _277 = _275 != 0;
    bool _279 = !_247;
    float _281 = _279 ? _187 : as_type<float>(_259);
    bool _283 = _237 > 0.0;
    bool _285 = _237 >= 0.0;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan(0.0);
    bool _293 = _289 || _291;
    float _295 = floor(_215);
    float _297 = -_183;
    float _299 = _243 ? _297 : _183;
    float _301 = _249 * _113;
    bool _303 = !_273;
    int _305 = _303 ? 0 : 1;
    int _307 = _255;
    float _309 = _299;
    float _311 = _251;
    if (_235)
    {
        _307 = 0;
    }
    int _313 = _307;
    int _315 = _313;
    if (!_235)
    {
        _315 = 1;
    }
    int _317 = _315;
    float _319 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _321 = int(_319);
    float _323 = _265 * _113;
    bool _325 = !_269;
    int _327 = _325 ? 0 : 1;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _331 = int(_329);
    bool _333 = _295 > 0.0;
    bool _335 = _295 >= 0.0;
    bool _337 = isnan(_295);
    bool _339 = _335 || _337;
    bool _341 = isnan(0.0);
    bool _343 = _339 || _341;
    int _345 = _343 ? 0 : 1;
    float _347 = floor(_241);
    float _349 = float(uint(_321));
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _353 = _219 > 0.5;
    float _355 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _357 = !_277;
    int _359 = _357 ? 0 : 1;
    float _361 = 1.0 / _349;
    int _363 = _293 ? 0 : 1;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _367 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _369 = _367 != 0;
    int _371 = ~_363;
    int _373 = _371 + 1;
    int _375 = _373 + 1;
    int _377 = _375;
    float _379 = _349;
    if (!_283)
    {
        int _381 = ~_363;
        int _383 = _381 + 1;
        _377 = _383;
    }
    int _385 = _377;
    float _387 = trunc(_301);
    int _389 = int(_387);
    float _391 = float(uint(_331));
    bool _393 = !_369;
    float _395 = _393 ? _183 : _299;
    bool _397 = _317 != 1;
    float _399 = 1.0 / _391;
    int _401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _403 = _401 != 0;
    int _405 = as_type<int>(_361) + (-2);
    int _407 = int(_235);
    int _409 = _283 ? 2 : 0;
    int _411 = _407 | _409;
    int _413 = _353 ? 4 : 0;
    int _415 = _411 | _413;
    int _417 = _397 ? 8 : 0;
    int _419 = _415 | _417;
    int _421 = _403 ? 16 : 0;
    int _423 = _419 | _421;
    int _425 = _333 ? 32 : 0;
    int _427 = _423 | _425;
    int _429 = _277 ? 64 : 0;
    int _431 = _427 | _429;
    int _433 = _431 & 16;
    bool _435 = _347 >= 0.0;
    bool _437 = isnan(_347);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = trunc(_323);
    int _447 = int(_445);
    int _449 = ~_345;
    int _451 = _449 + 1;
    int _453 = _451 + 1;
    int _455 = _453;
    float _457 = as_type<float>(_433);
    if (!_333)
    {
        int _459 = ~_345;
        int _461 = _459 + 1;
        _455 = _461;
    }
    int _463 = _455;
    float _465 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _467 = _443 ? 0 : 1;
    bool _469 = _347 > 0.0;
    float _471 = -_465;
    float _473 = fma(_355, 2.0, _471);
    float _475 = float(uint(_389));
    float _477 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _479 = log2(_477);
    int _481 = as_type<int>(_399) + (-2);
    float _483 = _149 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_397)
    {
        _379 = _149;
    }
    float _485 = _379;
    float _487 = as_type<float>(_405) * _475;
    float _489 = _485;
    if (_397)
    {
        _489 = _145;
    }
    float _491 = _489;
    float _493 = fma(_483, -2.0, _351);
    float _495 = float(uint(_447));
    float _497 = trunc(_487);
    float _499 = precise::max(_497, 0.0);
    uint _502 = uint(_499);
    int _504 = ~_467;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    float _510 = as_type<float>(_481) * _495;
    int _512 = _508;
    if (!_397)
    {
        _309 = _149;
    }
    float _514 = _309;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _518 = _514;
    if (!_469)
    {
        int _520 = ~_467;
        int _522 = _520 + 1;
        _512 = _522;
    }
    int _524 = _512;
    float _526 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _493);
    if (_397)
    {
        _518 = _145;
    }
    float _528 = _518;
    float _530 = trunc(_510);
    float _532 = precise::max(_530, 0.0);
    uint _534 = uint(_532);
    float _536 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[83].z, _516);
    float _538 = _479 * _113;
    int _540 = ~_321;
    int _542 = _540 + 1;
    float _544 = _528 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _546 = ~_331;
    int _548 = _546 + 1;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (!_397)
    {
        _311 = _157;
    }
    float _552 = _311;
    float _554 = exp2(_538);
    float _556 = _552;
    if (_397)
    {
        _556 = _149;
    }
    float _558 = _556;
    float _560 = -_550;
    float _562 = fma(_544, 2.0, _560);
    int _564 = _542 * int(_502);
    int _566 = _564 + _389;
    if (!_397)
    {
        _457 = _157;
    }
    float _568 = _457;
    float _570 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[83].w, _365);
    int _572 = _548 * int(_534);
    int _574 = _572 + _447;
    float _576 = -_113;
    float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[81].x, _562);
    float _580 = float(uint(_566));
    float _582 = -_113;
    float _584 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[76].x, _473);
    float _586 = float(uint(_574));
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = as_type<float>(_405) * _580;
    float _592 = _568;
    if (_397)
    {
        _592 = _149;
    }
    float _594 = _592;
    float _596 = as_type<float>(_481) * _586;
    float _598 = -_554;
    float _600 = _598 + 1.0;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _604 = 1.0 + _602;
    bool _606 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(0.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _618 = trunc(_590);
    float _620 = precise::max(_618, 0.0);
    uint _622 = uint(_620);
    float _624 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _570);
    float _626 = fma(_616, -2.0, _588);
    float _628 = _614 ? _600 : 0.0;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _632 = 1.0 / _604;
    bool _634 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _642 = _638 || _640;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _646 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _630);
    float _648 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _536);
    float _650 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _626);
    float _652 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[78].w, _644);
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _656 = _654 != 0;
    float _658 = trunc(_596);
    float _660 = precise::max(_658, 0.0);
    uint _662 = uint(_660);
    float _664 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _646);
    float _666 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _652);
    int _668 = ~_321;
    int _670 = _668 + 1;
    float _672 = _145 + _157;
    int _674 = int(_502) + int(_622);
    bool _676 = !_656;
    int _678 = _676 ? 0 : 1;
    if (_642)
    {
        float _680 = _628 * _632;
        _123 = _680;
    }
    float _682 = _123;
    int _684 = ~_331;
    int _686 = _684 + 1;
    int _688 = _670 * _674;
    int _690 = _688 + _389;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _694 = _692 != 0;
    float _696 = _672 + (-1.0);
    int _698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _700 = _698 != 0;
    float _702 = -_187;
    int _704 = _353 ? as_type<int>(_702) : as_type<int>(_187);
    int _706 = int(_534) + int(_662);
    float _708 = 0.0;
    if (_235)
    {
        _708 = 1.0;
    }
    float _710 = _708;
    float _712 = 0.0;
    float _714 = _710;
    if (_235)
    {
        _712 = _145;
    }
    float _716 = _712;
    int _718 = _686 * _706;
    int _720 = _718 + _447;
    float _722 = 0.0;
    float _724 = _716;
    if (_235)
    {
        _722 = 1.0;
    }
    float _726 = _722;
    float _728 = _726;
    if (!_235)
    {
        _714 = 7.345489978790283203125;
    }
    float _730 = _714;
    if (!_235)
    {
        _724 = _149;
    }
    float _732 = _724;
    if (!_235)
    {
        _728 = 1.2345600128173828125;
    }
    float _734 = _728;
    float _736 = _730 * _145;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _748 = _746 != 0;
    bool _750 = !_694;
    float _752 = _750 ? _187 : as_type<float>(_704);
    bool _754 = uint(_690) >= uint(_321);
    bool _756 = uint(_720) >= uint(_331);
    float _758 = in.m_46.x;
    float _760 = in.m_46.y;
    float _762 = in.m_46.z;
    bool _764 = !_744;
    int _766 = _764 ? 0 : 1;
    int _768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _770 = _768 != 0;
    bool _772 = !_700;
    int _774 = _772 ? 0 : 1;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _776;
    bool _780 = !_754;
    int _782 = _780 ? 0 : (-1);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _788 = !_756;
    int _790 = _788 ? 0 : (-1);
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _794 = _792 != 0;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _806 = _804 != 0;
    float _808 = _145 + _149;
    float _810 = 1.0 / _786;
    float _812 = _808 + (-1.0);
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _820 = _149 + _157;
    float _822 = 1.0 / _778;
    float _824 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _826 = _760 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _828 = _820 + (-1.0);
    float _830 = _760 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _832 = _760 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _834 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[4].x, _826);
    float _836 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _838 = 1.0 / _816;
    float _840 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[5].x, _830);
    float _842 = fma(_758, (*spvDescriptorSet0.vp_c10)._m0[6].x, _832);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _846 = _207 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _850 = _207 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _854 = _207 + _852;
    float _856 = _846 * _810;
    float _858 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[4].z, _834);
    float _860 = _850 * _822;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _862;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[5].z, _840);
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _872 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _874 = isnan(_207);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = _145 + (-0.5);
    float _886 = _854 * _838;
    float _888 = fma(_762, (*spvDescriptorSet0.vp_c10)._m0[6].z, _842);
    float _890 = fma(_864, _860, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _892 = _732 * _734;
    bool _894 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _896 = isnan(_207);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _906;
    bool _910 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _912 = isnan(_207);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_882;
    float _924 = _922 + 1.0;
    float _926 = -_904;
    float _928 = _926 + 1.0;
    float _930 = fma(_908, _860, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _932 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _934 = isnan(_207);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _946 = _944 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _948 = _904 * _924;
    float _950 = _920 * _928;
    float _952 = floor(_736);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _954;
    float _958 = -_920;
    float _960 = _958 + 1.0;
    float _962 = fma(_946, _856, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _964 = _281 + (-0.5);
    float _966 = fma(_870, _856, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _968 = _942 * _960;
    float _970 = -_942;
    float _972 = _970 + 1.0;
    float _974 = floor(_892);
    float _976 = -_964;
    float _978 = -_526;
    float _980 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[80].y, _978);
    float _982 = _890 * _968;
    float _984 = _930 * _968;
    float _986 = fma(_956, _886, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _988 = _263 + 0.5;
    float _990 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].x, _982);
    float _992 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[143].y, _984);
    float _994 = -_952;
    float _996 = _736 + _994;
    float _998 = float(_331);
    float _1000 = fma(_966, _950, _990);
    float _1002 = float(_447);
    float _1004 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[80].x, _584);
    bool _1006 = !_748;
    int _1008 = _1006 ? 0 : 1;
    float _1010 = _998 * _221;
    bool _1012 = !_740;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = -_974;
    float _1018 = _892 + _1016;
    float _1020 = float(_321);
    float _1022 = fma(_962, _950, _992);
    float _1024 = _1018 * _998;
    float _1026 = float(_389);
    float _1028 = _1020 * _221;
    bool _1030 = _1002 >= _998;
    bool _1032 = isnan(_1002);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan(_998);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = fma(_986, _948, _1000);
    int _1044 = abs(_1008);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1046;
    int _1050 = abs(_1014);
    float _1052 = _996 * _1020;
    float _1054 = float(_463);
    float _1056 = fma(_1048, _886, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _1058 = _1026 >= _1020;
    bool _1060 = isnan(_1026);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(_1020);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = trunc(_1024);
    int _1072 = int(_1070);
    float _1074 = in.m_62.x;
    float _1076 = in.m_62.y;
    float _1078 = in.m_62.z;
    float _1080 = float(_524);
    float _1082 = fma(_1056, _948, _1022);
    float _1084 = float(_1050);
    float _1086 = _395 + 0.5;
    float _1088 = in.m_64.x;
    float _1090 = in.m_64.y;
    int _1092 = abs(_766);
    float _1094 = trunc(_1052);
    int _1096 = int(_1094);
    float _1098 = float(_1044);
    float _1100 = _1084 * _1080;
    float _1102 = float(_385);
    float _1104 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1042);
    float _1106 = float(_1092);
    float _1108 = _1098 * _1054;
    float _1110 = _752 + (-0.5);
    float _1112 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1082);
    float _1114 = _1100 * (-2.0);
    float _1116 = _1106 * _1102;
    float _1118 = -_1110;
    float _1120 = -_650;
    float _1122 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1120);
    float _1124 = _1108 * (-2.0);
    float _1126 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[85].x, _578);
    float _1128 = _1116 * (-2.0);
    float _1130 = fma(_818, _1114, _818);
    float _1132 = trunc(_1040);
    int _1134 = int(_1132);
    float _1136 = fma(_1114, _1074, _1074);
    float _1138 = fma(_836, _1128, _836);
    float _1140 = fma(_824, _1124, _824);
    float _1142 = fma(_1128, _1076, _1076);
    float _1144 = fma(_1124, _1078, _1078);
    int _1146 = abs(_678);
    float _1148 = _149 + (-0.5);
    float _1150 = trunc(_1068);
    int _1152 = int(_1150);
    float _1154 = _157 + (-0.5);
    float _1156 = _1112 * _1090;
    float _1158 = fma(_884, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1136);
    float _1160 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1142);
    float _1162 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1144);
    int _1164 = ~_706;
    int _1166 = _1164 + _790;
    int _1168 = _1166 + 1;
    float _1170 = fma(_1130, _682, _1158);
    int _1172 = ~_674;
    int _1174 = _1172 + _782;
    int _1176 = _1174 + 1;
    float _1178 = fma(_1138, _682, _1160);
    float _1180 = fma(_1140, _682, _1162);
    int _1182 = abs(_774);
    int _1184 = _1096 * _1146;
    int _1186 = _1184 + _389;
    bool _1188 = !_798;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _331 * _1168;
    int _1194 = _1192 + _447;
    bool _1196 = _331 == 0;
    int _1198 = _321 * _1176;
    int _1200 = _1198 + _389;
    bool _1202 = _321 == 0;
    int _1204 = _1072 * _1182;
    int _1206 = _1204 + _447;
    int _1208 = ~_1134;
    int _1210 = _1208 + 1;
    int _1212 = _1210 + 1;
    float _1214 = trunc(_1028);
    int _1216 = int(_1214);
    bool _1218 = !_1196;
    int _1220 = _1218 ? _1194 : (-1);
    float _1222 = _1104 * _1088;
    int _1224 = ~_1152;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1170 * 0.15915493667125701904296875;
    bool _1232 = !_1202;
    int _1234 = _1232 ? _1200 : (-1);
    int _1236 = _1220 * _1212;
    int _1238 = _321 + (-1);
    float _1240 = trunc(_1010);
    int _1242 = int(_1240);
    int _1244 = _331 + (-1);
    int _1246 = _1234 * _1228;
    float _1248 = float(uint(_1186));
    float _1250 = _1178 * 0.15915493667125701904296875;
    int _1252 = abs(_1190);
    int _1254 = _1152 * _1238;
    int _1256 = _1254 + _1246;
    int _1258 = abs(_305);
    int _1260 = _1134 * _1244;
    int _1262 = _1260 + _1236;
    int _1264 = abs(_327);
    float _1266 = as_type<float>(_405) * _1248;
    float _1268 = float(uint(_1206));
    int _1270 = _1256 * _1258;
    bool _1272 = !_770;
    int _1274 = _1272 ? 0 : 1;
    int _1276 = _1262 * _1252;
    int _1278 = abs(_359);
    float _1280 = as_type<float>(_481) * _1268;
    float _1282 = trunc(_1266);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    bool _1288 = !_794;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1294 = abs(_1274);
    int _1296 = _1216 * _1264;
    int _1298 = _1296 + _1270;
    float _1300 = _1222 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1302 = abs(_1290);
    float _1304 = trunc(_1280);
    float _1306 = precise::max(_1304, 0.0);
    uint _1308 = uint(_1306);
    int _1310 = _1186 * _1278;
    int _1312 = _1310 + _1298;
    bool _1314 = !_802;
    int _1316 = _1314 ? 0 : 1;
    float _1318 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1320 = _1096 * _1294;
    int _1322 = _1320 + _1312;
    int _1324 = abs(_1316);
    float _1326 = _1230 * 6.283185482025146484375;
    float _1328 = sin(_1326);
    int _1330 = ~_331;
    int _1332 = _1330 + 1;
    int _1334 = _1242 * _1302;
    int _1336 = _1334 + _1276;
    float _1338 = float(uint(_1322));
    float _1340 = _1300 * _1292;
    float _1342 = _888 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1344 = !_806;
    int _1346 = _1344 ? 0 : 1;
    float _1348 = _1230 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = as_type<float>(_405) * _1338;
    float _1354 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    int _1356 = abs(_1346);
    int _1358 = _1332 * int(_1308);
    int _1360 = _1358 + _1206;
    int _1362 = ~_321;
    int _1364 = _1362 + 1;
    int _1366 = _1206 * _1324;
    int _1368 = _1366 + _1336;
    float _1370 = _1318 * _1354;
    float _1372 = _1250 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    float _1376 = _1180 * 0.15915493667125701904296875;
    int _1378 = ~_321;
    int _1380 = _1378 + 1;
    int _1382 = _1072 * _1356;
    int _1384 = _1382 + _1368;
    float _1386 = float(uint(_1360));
    int _1388 = _1380 * int(_1286);
    int _1390 = _1388 + _1186;
    float _1392 = _1250 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    float _1396 = as_type<float>(_481) * _1386;
    float _1398 = float(uint(_1384));
    float _1400 = float(uint(_1390));
    float _1402 = _1376 * 6.283185482025146484375;
    float _1404 = cos(_1402);
    float _1406 = _1328 * _1374;
    float _1408 = trunc(_1352);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = _1350 * _1394;
    float _1416 = _1376 * 6.283185482025146484375;
    float _1418 = sin(_1416);
    float _1420 = _1350 * _1404;
    float _1422 = _1394 * _1404;
    float _1424 = _1328 * _1404;
    float _1426 = trunc(_1396);
    float _1428 = precise::max(_1426, 0.0);
    uint _1430 = uint(_1428);
    float _1432 = as_type<float>(_405) * _1400;
    float _1434 = _1328 * _1394;
    int _1436 = _1364 * int(_1412);
    int _1438 = _1436 + _1322;
    int _1440 = ~_331;
    int _1442 = _1440 + 1;
    float _1444 = trunc(_1432);
    float _1446 = precise::max(_1444, 0.0);
    uint _1448 = uint(_1446);
    float _1450 = _1420 * _1370;
    int _1452 = int(_1308) + int(_1430);
    float _1454 = _1350 * _1374;
    float _1456 = _1374 * _1404;
    float _1458 = as_type<float>(_481) * _1398;
    float _1460 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1462 = -_1454;
    float _1464 = fma(_1418, _1434, _1462);
    float _1466 = -_1434;
    float _1468 = fma(_1418, _1454, _1466);
    float _1470 = float(uint(_1438));
    float _1472 = fma(_1418, _1414, _1406);
    float _1474 = trunc(_1458);
    float _1476 = precise::max(_1474, 0.0);
    uint _1478 = uint(_1476);
    float _1480 = fma(_1418, _1406, _1414);
    float _1482 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1484 = as_type<float>(_405) * _1470;
    float _1486 = _1420 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1488 = int(_1286) + int(_1448);
    float _1490 = -_1418;
    float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1482);
    float _1494 = -_1418;
    float _1496 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1460);
    float _1498 = -_1418;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1486);
    float _1502 = -_1370;
    float _1504 = _1418 * _1502;
    float _1506 = _1424 * _1370;
    float _1508 = trunc(_1484);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1500);
    float _1516 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1518 = fma(_1464, _1340, _1506);
    float _1520 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1492);
    int _1522 = _1442 * int(_1478);
    int _1524 = _1522 + _1384;
    float _1526 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1496);
    float _1528 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1530 = _1472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1532 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = float(uint(_1524));
    float _1536 = fma(_1422, _1340, _1504);
    float _1538 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1516);
    float _1540 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1528);
    float _1542 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1530);
    float _1544 = as_type<float>(_481) * _1534;
    float _1546 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    int _1550 = ~_321;
    int _1552 = _1550 + 1;
    float _1554 = fma(_1472, _1340, _1450);
    int _1556 = ~_331;
    int _1558 = _1556 + 1;
    float _1560 = trunc(_1544);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1546);
    int _1568 = ~_321;
    int _1570 = _1568 + 1;
    float _1572 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1574 = int(_1412) + int(_1512);
    float _1576 = _1468 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1578 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1548);
    float _1580 = fma(_1468, _1572, _1554);
    float _1582 = fma(_1456, _1572, _1536);
    float _1584 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1576);
    float _1586 = fma(_1480, _1572, _1518);
    int _1588 = ~_331;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1584);
    float _1594 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1596 = int(_1478) + int(_1564);
    int _1598 = _1570 * _1574;
    int _1600 = _1598 + _1322;
    bool _1602 = uint(_1600) >= uint(_321);
    int _1604 = _1552 * _1488;
    int _1606 = _1604 + _1186;
    int _1608 = _1558 * _1596;
    int _1610 = _1608 + _1384;
    bool _1612 = !_1602;
    int _1614 = _1612 ? 0 : (-1);
    bool _1616 = uint(_1606) >= uint(_321);
    float _1618 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1566);
    bool _1620 = uint(_1610) >= uint(_331);
    float _1622 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1594);
    int _1624 = ~_1574;
    int _1626 = _1624 + _1614;
    int _1628 = _1626 + 1;
    float _1630 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1632 = !_1620;
    int _1634 = _1632 ? 0 : (-1);
    float _1636 = _1580 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1638 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1622);
    int _1640 = _321 * _1628;
    int _1642 = _1640 + _1322;
    int _1644 = ~_1596;
    int _1646 = _1644 + _1634;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1630);
    bool _1652 = !_1616;
    int _1654 = _1652 ? 0 : (-1);
    float _1656 = fma(_1582, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1636);
    bool _1658 = !_1202;
    int _1660 = _1658 ? _1642 : (-1);
    int _1662 = _331 * _1648;
    int _1664 = _1662 + _1384;
    int _1666 = ~_1488;
    int _1668 = _1666 + _1654;
    int _1670 = _1668 + 1;
    float _1672 = _858 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1674 = _1660 >> 31;
    float _1676 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1656);
    bool _1678 = !_1196;
    int _1680 = _1678 ? _1664 : (-1);
    float _1682 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _1684 = _1674 & 3;
    float _1686 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _1688 = _1680 >> 31;
    float _1690 = _1672 + _1682;
    int _1692 = _1660 + _1684;
    float _1694 = _1342 + _1686;
    int _1696 = _1688 & 3;
    int _1698 = _1590 * _1452;
    int _1700 = _1698 + _1206;
    int _1702 = _1692 >> 2;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1706 = _1690 + _1704;
    int _1708 = _1680 + _1696;
    float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1712 = _1694 + _1710;
    int _1714 = _1702 << 4;
    int _1716 = _1714 + 368;
    float _1718 = _1706 * _1706;
    int _1720 = _1708 >> 2;
    float _1722 = _1712 * _1712;
    int _1724 = _1716 + 8;
    uint _1726 = uint(int(uint(_1724) >> uint(2)));
    uint _1728 = uint(int(uint(int(_1726)) >> uint(2)));
    int _1730 = int(_1726) & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    int _1734 = int(_1726) + 1;
    uint _1736 = uint(int(uint(_1734) >> uint(2)));
    int _1738 = _1734 & 3;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[int(_1736)][_1738];
    bool _1742 = uint(_1700) >= uint(_331);
    float _1744 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1746 = _1720 << 4;
    int _1748 = _1746 + 512;
    float _1750 = _1718 + _1722;
    bool _1752 = !_1742;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1538);
    int _1758 = _1660 & 3;
    bool _1760 = _1758 != 0;
    uint _1762 = uint(int(uint(_1716) >> uint(2)));
    uint _1764 = uint(int(uint(int(_1762)) >> uint(2)));
    int _1766 = int(_1762) & 3;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[int(_1764)][_1766];
    int _1770 = int(_1762) + 1;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    int _1774 = _1770 & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = _1660 & 3;
    bool _1780 = _1778 != 0;
    float _1782 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1650);
    int _1784 = ~_1452;
    int _1786 = _1784 + _1754;
    int _1788 = _1786 + 1;
    float _1790 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1540);
    int _1792 = _1760 ? 0 : 1;
    float _1794 = sqrt(_1750);
    bool _1796 = uint(_1778) > 1u;
    uint _1798 = uint(int(uint(_1748) >> uint(2)));
    uint _1800 = uint(int(uint(int(_1798)) >> uint(2)));
    int _1802 = int(_1798) & 3;
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[int(_1800)][_1802];
    int _1806 = int(_1798) + 1;
    uint _1808 = uint(int(uint(_1806) >> uint(2)));
    int _1810 = _1806 & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = ~_1792;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    float _1820 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1542);
    bool _1822 = _1778 != 3;
    float _1824 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1826 = _1744 * _1514;
    float _1828 = _1744 * _1526;
    bool _1830 = !_1780;
    int _1832 = _1830 ? 0 : 1;
    int _1834 = _1748 + 8;
    uint _1836 = uint(int(uint(_1834) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = fma(_1824, _1756, _1826);
    int _1854 = _321 * _1670;
    int _1856 = _1854 + _1186;
    float _1858 = _866 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1860 = _1818;
    float _1862 = _1718;
    float _1864 = _1722;
    float _1866 = _1690;
    float _1868 = _1694;
    float _1870 = _1790;
    float _1872 = _1342;
    float _1874 = _1858;
    float _1876 = _1672;
    if (!_1796)
    {
        int _1878 = ~_1792;
        int _1880 = _1878 + 1;
        _1860 = _1880;
    }
    int _1882 = _1860;
    float _1884 = _1744 * _1520;
    bool _1886 = uint(_1778) >= 2u;
    int _1888 = _331 * _1788;
    int _1890 = _1888 + _1206;
    bool _1892 = _1794 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1894 = fma(_1824, _1790, _1884);
    float _1896 = fma(_1824, _1820, _1828);
    int _1898 = _1886 ? 0 : 1;
    int _1900 = _1680 & 3;
    bool _1902 = _1900 != 0;
    int _1904 = ~_1898;
    int _1906 = _1904 + 1;
    int _1908 = _1906 + 1;
    int _1910 = _1908;
    if (_1822)
    {
        int _1912 = ~_1898;
        int _1914 = _1912 + 1;
        _1910 = _1914;
    }
    int _1916 = _1910;
    bool _1918 = !_1902;
    int _1920 = _1918 ? 0 : 1;
    int _1922 = _1680 & 3;
    bool _1924 = _1922 != 0;
    float _1926 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1928 = uint(_1900) >= 2u;
    int _1930 = _1924 ? 0 : 1;
    float _1932 = _1858 + _1926;
    int _1934 = _1928 ? 0 : 1;
    bool _1936 = uint(_1900) > 1u;
    bool _1938 = _1900 != 3;
    int _1940 = abs(_1882);
    bool _1942 = !_1892;
    float _1944 = _1932;
    if (!_1942)
    {
        float _1946 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1950 = _1794 + _1948;
        float _1952 = rsqrt(_1750);
        float _1954 = _1950 * _1946;
        float _1956 = _1932 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1958 = _1954 * 0.15915493667125701904296875;
        float _1960 = _1958 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = _1958 * 6.283185482025146484375;
        float _1966 = cos(_1964);
        float _1968 = fma(_1962, _1956, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1970 = _1952 * _1968;
        float _1972 = _1966 + (-1.0);
        float _1974 = fma(_1706, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1976 = fma(_1712, _1970, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1978 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1982 = _1974 + _1980;
        float _1984 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1986 = _1976 + _1984;
        float _1988 = fma(_1932, _1966, _1978);
        float _1990 = _1982 * _1982;
        float _1992 = _1986 * _1986;
        _1944 = _1988;
        _1862 = _1990;
        _1864 = _1992;
        _1866 = _1974;
        _1868 = _1976;
    }
    float _1994 = _1944;
    float _1996 = _1862;
    float _1998 = _1864;
    float _2000 = _1866;
    float _2002 = _1868;
    int _2004 = ~_1930;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = -_666;
    float _2012 = _2010 + 1.0;
    int _2014 = _2008;
    if (!_1936)
    {
        int _2016 = ~_1930;
        int _2018 = _2016 + 1;
        _2014 = _2018;
    }
    int _2020 = _2014;
    float _2022 = -_648;
    float _2024 = _2022 + 1.0;
    int _2026 = abs(_1832);
    float _2028 = -_624;
    float _2030 = _2028 + 1.0;
    int _2032 = ~_1934;
    int _2034 = _2032 + 1;
    int _2036 = _2034 + 1;
    float _2038 = fma(_281, _2012, _980);
    int _2040 = abs(_2020);
    float _2042 = -_664;
    float _2044 = _2042 + 1.0;
    int _2046 = ~_1940;
    int _2048 = _2046 + 1;
    int _2050 = _2048 + 1;
    float _2052 = _1592 + _1896;
    int _2054 = _2036;
    if (_1938)
    {
        int _2056 = ~_1934;
        int _2058 = _2056 + 1;
        _2054 = _2058;
    }
    int _2060 = _2054;
    float _2062 = -_2044;
    float _2064 = fma(_263, _2062, _1004);
    int _2066 = _2050 * as_type<int>(_1776);
    bool _2068 = _1778 != 3;
    out.m_66.x = _1756;
    out.m_66.y = _1790;
    out.m_66.z = _1820;
    int _2070 = abs(_1920);
    int _2072 = abs(_1916);
    int _2074 = abs(_2060);
    int _2076 = ~_2040;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_2026;
    int _2084 = _2082 + 1;
    int _2086 = _2084 + 1;
    int _2088 = ~_2070;
    int _2090 = _2088 + 1;
    int _2092 = _2090 + 1;
    int _2094 = _2080 * as_type<int>(_1812);
    int _2096 = _2086 * as_type<int>(_1768);
    int _2098 = _2096 + _2066;
    int _2100 = _2092 * as_type<int>(_1804);
    int _2102 = _2100 + _2094;
    int _2104 = ~_2072;
    int _2106 = _2104 + 1;
    int _2108 = _2106 + 1;
    float _2110 = fma(_1744, _1744, 1.0);
    bool _2112 = _1900 != 3;
    int _2114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2116 = _2114 != 0;
    int _2118 = _2108 * as_type<int>(_1732);
    int _2120 = _2118 + _2098;
    bool _2122 = !_2068;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2128 = _2126 != 0;
    int _2130 = ~_2074;
    int _2132 = _2130 + 1;
    int _2134 = _2132 + 1;
    bool _2136 = !_2112;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2116;
    int _2142 = _2140 ? 0 : 1;
    int _2144 = _2134 * as_type<int>(_1842);
    int _2146 = _2144 + _2102;
    int _2148 = abs(_2124);
    float _2150 = rsqrt(_2110);
    bool _2152 = !_2128;
    int _2154 = _2152 ? 0 : 1;
    int _2156 = abs(_2138);
    int _2158 = abs(_2142);
    float _2160 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2162 = _1994 + _2160;
    int _2164 = abs(_2154);
    float _2166 = fma(_2162, _2162, _1996);
    int _2168 = ~_2148;
    int _2170 = _2168 + 1;
    int _2172 = _2170 + 1;
    int _2174 = ~_2156;
    int _2176 = _2174 + 1;
    int _2178 = _2176 + 1;
    float _2180 = _2166 + _1998;
    int _2182 = ~_2158;
    int _2184 = _2182 + 1;
    int _2186 = _2184 + 1;
    int _2188 = _2172 * as_type<int>(_1740);
    int _2190 = _2188 + _2120;
    int _2192 = ~_2164;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * as_type<int>(_1850);
    int _2200 = _2198 + _2146;
    bool _2202 = !_1196;
    int _2204 = _2202 ? _1890 : (-1);
    int _2206 = _2190 * _2186;
    bool _2208 = !_1202;
    int _2210 = _2208 ? _1856 : (-1);
    int _2212 = _2200 * _2196;
    float _2214 = _1744 * _2150;
    float _2216 = -_2024;
    float _2218 = fma(_395, _2216, _1126);
    float _2220 = sqrt(_2180);
    int _2222 = _2204 * _2164;
    int _2224 = _2222 + _2212;
    float _2226 = -_1618;
    float _2228 = _2214 * _2226;
    int _2230 = _2210 * _2158;
    int _2232 = _2230 + _2206;
    float _2234 = fma(_752, _2030, _1122);
    float _2236 = -_1578;
    float _2238 = _2214 * _2236;
    float _2240 = -_1592;
    float _2242 = _2214 * _2240;
    float _2244 = fma(_2150, _1514, _2228);
    float _2246 = _1618 + _1852;
    float _2248 = fma(_2150, _1520, _2238);
    float _2250 = fma(_2150, _1526, _2242);
    float _2252 = _1578 + _1894;
    float _2254 = float(_2232);
    out.m_68.x = _2064;
    out.m_68.y = _2038;
    out.m_68.z = _2218;
    out.m_68.w = _2234;
    float _2256 = float(_2224);
    bool _2258 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2260 = isnan(_2220);
    bool _2262 = _2258 || _2260;
    bool _2264 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2266 = _2262 || _2264;
    out.m_70.x = _2244;
    out.m_70.y = _2248;
    out.m_70.z = _2250;
    out.m_72.x = _2254;
    out.m_72.y = _2256;
    out.m_74.x = _2246;
    out.m_74.y = _2252;
    out.m_74.z = _2052;
    float _2268 = _2242;
    float _2270 = as_type<float>(_2190);
    float _2272 = _2218;
    if (!_2266)
    {
        _2268 = 1.0;
    }
    float _2274 = _2268;
    bool _2276 = !_2266;
    float _2278 = _2274;
    if (!_2276)
    {
        bool _2280 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2282 = isnan(_2220);
        bool _2284 = _2280 || _2282;
        bool _2286 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2288 = _2284 || _2286;
        if (!_2288)
        {
            float _2290 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2292 = _2220 + _2290;
            float _2294 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2296 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2294;
            float _2298 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2300 = _2298 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2302 = 1.0 / _2296;
            float _2304 = _2292 * _2302;
            float _2306 = fma(_2304, _2300, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2278 = _2306;
            _1870 = _2302;
            _2308 = true;
        }
        else
        {
            bool _2310 = _2220 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2312 = isnan(_2220);
            bool _2314 = _2310 || _2312;
            bool _2316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2318 = _2314 || _2316;
            if (!_2318)
            {
                float _2320 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2322 = _2220 + _2320;
                float _2324 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2326 = _2324 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2328 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2330 = _2328 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2332 = 1.0 / _2326;
                float _2334 = _2322 * _2332;
                float _2336 = fma(_2334, _2330, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2278 = _2336;
                _1870 = _2332;
                _2308 = true;
            }
            else
            {
                _2278 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2308 = false;
    float _2338 = _2278;
    float _2340 = _1870;
    float _2342 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2344 = _2000 + _2342;
    float _2346 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2348 = _2002 + _2346;
    bool _2350 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(0.5);
    bool _2358 = _2354 || _2356;
    float _2360 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2362 = _1994 + _2360;
    float _2364 = fma(_2344, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2366 = fma(_2348, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2368 = fma(_2362, _2338, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2370 = _2362;
    float _2372 = _2340;
    float _2374 = _2348;
    float _2376 = _2366;
    if (_2358)
    {
        _2370 = _2364;
    }
    float _2378 = _2370;
    float _2380 = _2378;
    if (_2358)
    {
        _2372 = _2368;
    }
    float _2382 = _2372;
    float _2384 = _2382;
    if (_2358)
    {
        _2374 = _2366;
    }
    float _2386 = _2374;
    float _2388 = _2386;
    if (!_2358)
    {
        float _2390 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2392 = _1858 + _2390;
        float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2396 = _1672 + _2394;
        float _2398 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2400 = _2392 * _2392;
        float _2402 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2404 = _1342 + _2402;
        float _2406 = fma(_2396, _2396, _2400);
        float _2408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2410 = fma(_2404, _2404, _2406);
        float _2412 = sqrt(_2410);
        float _2414 = _2398 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2416 = precise::min(_2412, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2418 = _2416 * _2408;
        float _2420 = -_1672;
        float _2422 = _2420 + _2364;
        float _2424 = -_1858;
        float _2426 = _2424 + _2368;
        float _2428 = _2414 * _2418;
        float _2430 = -_1342;
        float _2432 = _2430 + _2366;
        float _2434 = fma(_2422, _2428, _1672);
        float _2436 = fma(_2426, _2428, _1858);
        float _2438 = fma(_2432, _2428, _1342);
        _2384 = _2436;
        _2380 = _2434;
        _2388 = _2438;
    }
    float _2440 = _2384;
    float _2442 = _2380;
    float _2444 = _2388;
    float _2446 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2448 = _2440 + _2446;
    float _2450 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2452 = _2442 + _2450;
    float _2454 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2456 = _2444 + _2454;
    float _2458 = _2448 * _2448;
    float _2460 = fma(_2452, _2452, _2458);
    float _2462 = fma(_2456, _2456, _2460);
    float _2464 = rsqrt(_2462);
    float _2466 = _2464 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2468 = _2452 * _2466;
    float _2470 = _2456 * _2466;
    float _2472 = _2468 * _2468;
    float _2474 = _2470 * _2470;
    float _2476 = _2472 + _2474;
    float _2478 = sqrt(_2476);
    bool _2480 = _2478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2484 = _2478 + _2482;
    float _2486 = _2456;
    float _2488 = _2484;
    float _2490 = _2468;
    if (_2480)
    {
        float _2492 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2486 = _2492;
    }
    float _2494 = _2486;
    if (_2480)
    {
        float _2496 = rsqrt(_2476);
        _2376 = _2496;
    }
    float _2498 = _2376;
    float _2500 = _2498;
    if (_2480)
    {
        float _2502 = _2484 * _2494;
        _2488 = _2502;
    }
    float _2504 = _2488;
    if (_2480)
    {
        float _2506 = _2504 * 0.15915493667125701904296875;
        _2270 = _2506;
    }
    float _2508 = _2270;
    float _2510 = _2458;
    float _2512 = _2508;
    if (_2480)
    {
        float _2514 = _2508 * 6.283185482025146484375;
        float _2516 = sin(_2514);
        _2510 = _2516;
    }
    float _2518 = _2510;
    float _2520 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2522 = precise::max(0.0, _2520);
    float _2524 = _2464;
    float _2526 = _2522;
    float _2528 = _2520;
    if (_2480)
    {
        float _2530 = _2508 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        _2524 = _2532;
    }
    float _2534 = _2524;
    float _2536 = -_2466;
    float _2538 = -_2522;
    float _2540 = fma(_2448, _2536, _2538);
    float _2542 = _2540;
    if (!_2480)
    {
        _2526 = _2472;
    }
    float _2544 = _2526;
    float _2546 = _2544;
    if (_2480)
    {
        float _2548 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2528 = _2548;
    }
    float _2550 = _2528;
    float _2552 = _2518;
    float _2554 = _2550;
    if (_2480)
    {
        float _2556 = fma(_2518, _2550, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2552 = _2556;
    }
    float _2558 = _2552;
    float _2560 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2562 = _2558;
    if (_2480)
    {
        float _2564 = _2534 + (-1.0);
        _2554 = _2564;
    }
    float _2566 = _2554;
    if (_2480)
    {
        float _2568 = _2498 * _2558;
        _2272 = _2568;
    }
    float _2570 = _2272;
    if (!_2480)
    {
        _2500 = _2540;
    }
    float _2572 = _2500;
    float _2574 = _2572;
    if (_2480)
    {
        float _2576 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2576;
    }
    float _2578 = _2512;
    if (_2480)
    {
        float _2580 = _2468 * _2570;
        _2490 = _2580;
    }
    float _2582 = _2490;
    if (!_2480)
    {
        _2562 = _2470;
    }
    float _2584 = _2562;
    float _2586 = _2584;
    if (_2480)
    {
        float _2588 = _2470 * _2570;
        _2586 = _2588;
    }
    float _2590 = _2586;
    if (_2480)
    {
        float _2592 = fma(_2540, _2534, _2578);
        _2574 = _2592;
    }
    float _2594 = _2574;
    if (_2480)
    {
        float _2596 = _2582 * _2582;
        _2546 = _2596;
    }
    float _2598 = _2546;
    float _2600 = sqrt(_2462);
    if (!_2480)
    {
        _2542 = _2474;
    }
    float _2602 = _2542;
    float _2604 = _2602;
    if (_2480)
    {
        float _2606 = _2590 * _2590;
        _2604 = _2606;
    }
    float _2608 = _2604;
    float _2610 = fma(_2594, _2594, _2598);
    float _2612 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2614 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2616 = _2610 + _2608;
    float _2618 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2612);
    float _2620 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2622 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2614);
    float _2624 = rsqrt(_2616);
    float _2626 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2618);
    float _2628 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2630 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2620);
    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2634 = fma(_2600, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2632);
    float _2636 = precise::clamp(_2634, 0.0, 1.0);
    float _2638 = _2626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2640 = fma(_2442, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2628);
    float _2642 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2630);
    float _2644 = -_2636;
    float _2646 = _2644 + 1.0;
    float _2648 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2650 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2640);
    float _2652 = _2642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2654 = abs(_2646);
    float _2656 = log2(_2654);
    float _2658 = -_2648;
    float _2660 = fma(_2658, _2560, 1.0);
    float _2662 = fma(_2444, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2622);
    float _2664 = _2624 * _2582;
    float _2666 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2668 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2670 = _2624 * _2594;
    float _2672 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2674 = _2624 * _2590;
    float _2676 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2668);
    float _2678 = _2662 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2680 = -_2672;
    float _2682 = fma(_2670, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2680);
    float _2684 = log2(_2660);
    float _2686 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2676);
    float _2688 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2690 = -_2674;
    float _2692 = fma(_2690, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2682);
    float _2694 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2696 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2686);
    float _2698 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2700 = fma(_2692, -0.5, 0.5);
    float _2702 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2688);
    float _2704 = 1.0 / _2696;
    float _2706 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2698);
    float _2708 = fma(_2692, 0.5, 0.5);
    float _2710 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2702);
    float _2712 = _2670 + 1.0;
    float _2714 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2706);
    float _2716 = fma(_2708, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2718 = _2684 * 0.693147182464599609375;
    float _2720 = exp2(_2694);
    float _2722 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2714);
    float _2724 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2710);
    float _2726 = fma(_2708, _2716, -0.212114393711090087890625);
    float _2728 = _2718 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2730 = fma(_2708, _2726, 1.570728778839111328125);
    float _2732 = sqrt(_2700);
    float _2734 = _2722 * _2704;
    float _2736 = fma(_2734, 0.5, 0.5);
    float _2738 = -_2670;
    float _2740 = fma(_2720, _2712, _2738);
    float _2742 = _2724 * _2704;
    float _2744 = fma(_2740, 0.5, 0.5);
    float _2746 = fma(_2742, -0.5, 0.5);
    float _2748 = _2732 * 0.636619746685028076171875;
    float3 _7189 = float3(_2736, _2746, _2728);
    float _2750 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7189, float3(0.0), isnan(_7189)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7189, float3(0.0), isnan(_7189)), level(0.0)).x;
    float _2752 = -_2730;
    float _2754 = fma(_2748, _2752, 1.0);
    float3 _7205 = float3(_2736, _2746, _2728);
    float4 _2757 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7205, float3(0.0), isnan(_7205)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7205, float3(0.0), isnan(_7205)), level(0.0)).xyzw;
    float _2759 = _2757.x;
    float _2761 = _2757.y;
    float _2763 = _2757.z;
    float _2765 = _2757.w;
    float2 _7222 = float2(_2754, _2744);
    float3 _2769 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7222, float2(0.0), isnan(_7222)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7222, float2(0.0), isnan(_7222)), level(0.0)).xyz;
    float _2771 = _2769.x;
    float _2773 = _2769.y;
    float _2775 = _2769.z;
    float _2777 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2779 = _2652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2781 = _2696 * 0.5;
    out.m_76.x = _2442;
    out.m_76.y = _2440;
    out.m_76.z = _2444;
    float _2783 = fma(_2666, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2779);
    float _2785 = exp2(_2777);
    float _2787 = fma(_2724, -0.5, _2781);
    bool _2789 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2791 = isnan(_2600);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2797 = _2793 || _2795;
    float _2799 = fma(_2638, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2783);
    float _2801 = _2722 + _2696;
    out.m_78.x = _1672;
    out.m_78.y = _1858;
    out.m_78.z = _1342;
    float _2803 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2799);
    float _2805 = _2801 * 0.5;
    float _2807 = _2803 + _2696;
    out.gl_Position.x = _2722;
    out.gl_Position.y = _2724;
    out.gl_Position.z = _2803;
    out.gl_Position.w = _2696;
    float _2809 = _2807 * 0.5;
    float _2811 = -_2785;
    float _2813 = _2811 + 1.0;
    if (!_2797)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2815 = _1872;
    float _2817 = _2813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2805;
    out.m_80.y = _2787;
    out.m_80.z = _2809;
    out.m_80.w = _2696;
    float _2819 = _2817;
    float _2821 = _2815;
    float _2823 = _2815;
    if (!_2797)
    {
        _1874 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2825 = _1874;
    float _2827 = -_2817;
    float _2829 = _2827 + 1.0;
    float _2831 = _2829;
    float _2833 = _2825;
    float _2835 = _2825;
    if (!_2797)
    {
        _1876 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2837 = _1876;
    float _2839 = _2817 * _2750;
    float _2841 = _2837;
    float _2843 = _2837;
    if (!_2797)
    {
        _2819 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2819;
    float _2847 = _2765 * _2839;
    float _2849 = _2765 * _2829;
    float _2851 = _2847;
    float _2853 = _2845;
    float _2855 = _2845;
    if (!_2797)
    {
        _2831 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2857 = _2831;
    float _2859 = _2775 * _2839;
    float _2861 = fma(_2771, _2847, _2759);
    float _2863 = fma(_2773, _2847, _2761);
    float _2865 = _2857;
    float _2867 = _2857;
    if (!_2797)
    {
        _2851 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2869 = _2851;
    float _2871 = fma(_2765, _2859, _2763);
    out.m_82.x = _2861;
    out.m_82.y = _2863;
    out.m_82.z = _2871;
    out.m_82.w = _2849;
    bool _2873 = !_2797;
    float _2875 = _2869;
    float _2877 = _2869;
    if (!_2873)
    {
        bool _2879 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2881 = isnan(_2600);
        bool _2883 = _2879 || _2881;
        bool _2885 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2887 = _2883 || _2885;
        if (!_2887)
        {
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = _2600 + _2889;
            float _2893 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2895 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2893;
            float _2897 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2899 = _2897 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2901 = 1.0 / _2895;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2919 = _2891 * _2901;
            float _2921 = precise::clamp(_2919, 0.0, 1.0);
            float _2923 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2925 = _2923 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2927 = fma(_2921, _2899, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2929 = fma(_2921, _2925, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2931 = fma(_2921, _2905, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2933 = fma(_2921, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2935 = fma(_2921, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2937 = fma(_2921, _2917, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2867 = _2931;
            _2835 = _2935;
            _2877 = _2927;
            _2823 = _2933;
            _2855 = _2929;
            _2843 = _2937;
            _2939 = true;
        }
        else
        {
            bool _2941 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2943 = isnan(_2600);
            bool _2945 = _2941 || _2943;
            bool _2947 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2949 = _2945 || _2947;
            if (!_2949)
            {
                _2875 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2951 = _2875;
            _2877 = _2951;
            if (!_2949)
            {
                _2865 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2953 = _2865;
            _2867 = _2953;
            if (!_2949)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2955 = _2853;
            _2855 = _2955;
            if (!_2949)
            {
                _2821 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2957 = _2821;
            _2823 = _2957;
            if (!_2949)
            {
                _2833 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2959 = _2833;
            _2835 = _2959;
            if (!_2949)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2961 = _2841;
            bool _2963 = !_2949;
            _2843 = _2961;
            if (!_2963)
            {
                bool _2965 = _2600 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2967 = isnan(_2600);
                bool _2969 = _2965 || _2967;
                bool _2971 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2973 = _2969 || _2971;
                if (!_2973)
                {
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = _2600 + _2975;
                    float _2979 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2981 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2979;
                    float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2987 = 1.0 / _2981;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3005 = _2977 * _2987;
                    float _3007 = precise::clamp(_3005, 0.0, 1.0);
                    float _3009 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3011 = _3009 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3013 = fma(_3007, _2985, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3015 = fma(_3007, _3011, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3017 = fma(_3007, _2991, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3019 = fma(_3007, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3021 = fma(_3007, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3023 = fma(_3007, _3003, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2867 = _3017;
                    _2835 = _3021;
                    _2877 = _3013;
                    _2823 = _3019;
                    _2855 = _3015;
                    _2843 = _3023;
                    _2939 = true;
                }
                else
                {
                    _2867 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2835 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2877 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2823 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2939 = false;
    float _3025 = _2867;
    float _3027 = _2835;
    float _3029 = _2877;
    float _3031 = _2823;
    float _3033 = _2855;
    float _3035 = _2843;
    float _3037 = fma(_2252, -0.5, 0.5);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = -_3025;
    float _3043 = _3041 + _3027;
    float _3045 = -_3029;
    float _3047 = _3045 + _3031;
    float _3049 = -_3033;
    float _3051 = _3049 + _3035;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3039, _3043, _3025);
    float _3057 = fma(_3039, _3047, _3029);
    float _3059 = fma(_3039, _3051, _3033);
    float _3061 = _3055 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _3063 = fma(_3057, 0.298911988735198974609375, _3061);
    float _3065 = fma(_3059, 0.114477999508380889892578125, _3063);
    out.m_84.x = 0.0;
    float _3067 = -_3065;
    float _3069 = _3057 + _3067;
    float _3071 = -_3065;
    float _3073 = _3055 + _3071;
    float _3075 = -_3065;
    float _3077 = _3059 + _3075;
    float _3079 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3081 = fma(_3069, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3083 = fma(_3073, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    float _3085 = fma(_3077, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3065);
    out.m_86.w = _3079;
    out.m_88.x = _3081;
    out.m_88.y = _3083;
    out.m_88.z = _3085;
    if (!_3053)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3087 = -_2440;
    float _3089 = _3087 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3091 = -_2442;
    float _3093 = _3091 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3095 = -_2444;
    float _3097 = _3095 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3099 = _3089 * _3089;
    float _3101 = fma(_3093, _3093, _3099);
    float _3103 = fma(_3097, _3097, _3101);
    float _3105 = sqrt(_3103);
    float _3107 = rsqrt(_3103);
    float _3109 = -_3105;
    float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3113 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3115 = precise::clamp(_3113, 0.0, 1.0);
    float _3117 = _3093 * _3107;
    float _3119 = _3089 * _3107;
    float _3121 = abs(_3115);
    float _3123 = log2(_3121);
    float _3125 = _3097 * _3107;
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3129 = _2252 * _3119;
    float _3131 = -_3119;
    float _3133 = -_3127;
    float _3135 = fma(_3131, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3133);
    float _3137 = fma(_2246, _3117, _3129);
    float _3139 = -_3125;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3135);
    float _3143 = fma(_2052, _3125, _3137);
    float _3145 = precise::clamp(_3143, 0.0, 1.0);
    float _3147 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3149 = _3141 + _3147;
    float _3151 = _3123 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3153 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3155 = precise::clamp(_3153, 0.0, 1.0);
    float _3157 = exp2(_3151);
    float _3159 = _3157 * _3155;
    float _3161 = _3145 * _3159;
    float _3163 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3165 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3167 = _3161 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _3163;
    out.m_84.y = _3165;
    out.m_84.z = _3167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

