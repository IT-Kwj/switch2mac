#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
};

struct main0_out
{
    float4 m_50 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_56 [[user(locn5)]];
    float4 m_60 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_46 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_48 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _77(thread const int& _4360, thread const int& _4361, constant _10& support_buffer)
{
    float _4364 = as_type<float>(support_buffer._m4);
    int _4366 = _4361 + as_type<int>(_4364);
    int _4368 = 1 + _4366;
    float _4370 = support_buffer._m5[_4368].x;
    float _4372 = abs(_4370);
    bool _4374 = _4372 == 1.0;
    if (_4374)
    {
        return _4360;
    }
    float _4376 = float(_4360);
    float _4378 = _4376 / _4372;
    int _4380 = int(_4378);
    return _4380;
}

static inline __attribute__((always_inline))
int _78(thread const int& _4410, thread const int& _4411, constant _10& support_buffer)
{
    float _4414 = as_type<float>(support_buffer._m4);
    int _4416 = _4411 + as_type<int>(_4414);
    int _4418 = 1 + _4416;
    float _4420 = support_buffer._m5[_4418].x;
    bool _4422 = _4420 == 1.0;
    if (_4422)
    {
        return _4410;
    }
    float _4424 = float(_4410);
    float _4426 = _4424 * _4420;
    int _4428 = int(_4426);
    return _4428;
}

static inline __attribute__((always_inline))
void _75(thread int& _4357, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _4357 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_102);
        out.gl_Position.z = _1776;
    }
    if (!_90)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _106 = in.m_42.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _112;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_128)
    {
        out.m_40.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_136);
        out.gl_Position.z = _1840;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_44.w;
    float _140 = 1.0 / _108;
    float _142 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = in.m_37.x;
    float _162 = in.m_37.y;
    float _164 = in.m_37.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = _112 * _140;
    float _252 = fma(_240, _154, _244);
    float _254 = fma(_240, _156, _246);
    float _256 = fma(_240, _158, _248);
    float _258 = fma(_252, _138, _160);
    float _260 = fma(_254, _138, _162);
    float _262 = fma(_256, _138, _164);
    bool _264 = !_242;
    float _282;
    if (!_264)
    {
        float _266 = in.m_46.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _250;
    }
    _284 = false;
    float _286 = _282;
    int _288 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _290 = _288;
    int _292 = 0;
    int _294 = _77(_290, _292, (*spvDescriptorSet0.support_buffer));
    float _296 = in.m_48.z;
    float _298 = 0.0 + _250;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = trunc(_296);
    int _304 = int(_302);
    int _306 = _294 + (-1);
    float _308 = float(_306);
    float _310 = _300 * _308;
    float _312 = trunc(_310);
    int _314 = int(_312);
    int _316 = _314;
    int _318 = 0;
    int _320 = _78(_316, _318, (*spvDescriptorSet0.support_buffer));
    int _322 = _304;
    int _324 = 0;
    int _326 = _78(_322, _324, (*spvDescriptorSet0.support_buffer));
    float4 _329 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_320, _326)), 0).xyzw;
    float _331 = _329.x;
    float _333 = _329.y;
    float _335 = _329.z;
    float _337 = _329.w;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _347 = in.m_48.y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _355 = _353 != 0;
    float _357 = in.m_48.x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = 0.0;
    float _373 = _347;
    if (_355)
    {
        float _375 = in.m_46.x;
        _371 = _375;
    }
    float _377 = _371;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _381 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[79].z, _349);
    float _383 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].z, _351);
    float _387 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _389 = -_359;
    float _391 = fma(_383, 2.0, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = fma(_387, -2.0, _367);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = 1.0 / _397;
    bool _405 = _341 > 0.5;
    bool _407 = _405 && _363;
    float _409 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].w, _393);
    float _419 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[79].x, _381);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _286 + _421;
    out.m_50.x = _409;
    out.m_50.y = _413;
    out.m_50.z = _415;
    out.m_50.w = _411;
    bool _425 = _377 > 0.5;
    bool _427 = _425 && _355;
    float _429 = _419 * (-0.15915493667125701904296875);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _409;
    if (_407)
    {
        float _437 = -_347;
        float _439 = _437 + 1.0;
        _373 = _439;
    }
    float _441 = _373;
    float _443 = 0.0;
    if (_355)
    {
        _443 = _357;
    }
    float _445 = _443;
    float _447 = _423 * _403;
    float _449 = _429 * 6.283185482025146484375;
    float _451 = sin(_449);
    float _453 = _365 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = -_112;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _399);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _465;
    bool _469 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _471 = isnan(_286);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = _345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _485 = fma(_433, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _489 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_286);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_483, _441, -0.5);
    float _503 = _445;
    if (_427)
    {
        float _505 = -_445;
        float _507 = _505 + 1.0;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = in.m_44.x;
    float _513 = in.m_44.y;
    float _515 = in.m_44.z;
    if (!_355)
    {
        _435 = _357;
    }
    float _517 = _435;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _429 * 6.283185482025146484375;
    float _525 = cos(_523);
    float _527 = _517;
    if (_355)
    {
        _527 = _509;
    }
    float _529 = _527;
    float _531 = _451 * _501;
    float _533 = _479 * _521;
    float _535 = -_479;
    float _537 = _535 + 1.0;
    float _539 = fma(_453, _529, -0.5);
    float _541 = _481 * _533;
    float _543 = _485 * _533;
    float _545 = _487 * _533;
    float _547 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _417);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].z, _545);
    float _555 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _385);
    float _557 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].x, _549);
    float _559 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].y, _551);
    float _561 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].z, _553);
    float _563 = _525 * _501;
    float _565 = -_531;
    float _567 = fma(_525, _539, _565);
    float _569 = _557 * _511;
    float _571 = _559 * _513;
    float _573 = fma(_451, _539, _563);
    float _575 = fma(_555, _567, _457);
    int _577 = _314 + 1;
    float _579 = _561 * _515;
    float _581 = -_463;
    float _583 = fma(_547, _573, _581);
    float _585 = _575 + 0.5;
    int _587 = min(_306, _577);
    float _589 = _583 + 0.5;
    uint _592 = as_type<uint>(half2(float2(_337, 0.0)));
    uint _594 = extract_bits(_592, 0u, 8u);
    int _596 = int(_594) & 255;
    uint _598 = extract_bits(_592, 8u, 8u);
    int _600 = int(_598) & 255;
    int _602 = _600 << 8;
    int _604 = _596 | _602;
    bool _606 = _604 >= 32768;
    int _608 = _604 + (-1024);
    int _610 = _608;
    if (_606)
    {
        int _612 = ~_604;
        int _614 = _612 + 33792;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    int _620 = _618 + 30719;
    float _622 = float(_620);
    float _624 = fma(_622, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _626 = abs(_624);
    float _628 = -_626;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_630) + (-218103808);
    bool _634 = uint(_632) >= 1920991232u;
    bool _636 = !_634;
    if (!_636)
    {
        int _638;
        _75(_638, out.gl_Position, out.gl_PointSize);
    }
    int _640 = _587;
    int _642 = 0;
    int _644 = _78(_640, _642, (*spvDescriptorSet0.support_buffer));
    int _646 = _304;
    int _648 = 0;
    int _650 = _78(_646, _648, (*spvDescriptorSet0.support_buffer));
    float4 _652 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_644, _650)), 0).xyzw;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float _660 = _652.w;
    float _662 = floor(_310);
    float _664 = -_662;
    float _666 = _310 + _664;
    uint _668 = as_type<uint>(half2(float2(_660, 0.0)));
    float _670 = -_331;
    float _672 = _670 + _654;
    uint _674 = extract_bits(_668, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_668, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_666, _672, _331);
    bool _688 = _684 >= 32768;
    int _690 = _684 + (-1024);
    int _692 = _690;
    if (_688)
    {
        int _694 = ~_684;
        int _696 = _694 + 33792;
        int _698 = _696 + 1;
        _692 = _698;
    }
    int _700 = _692;
    int _702 = _700 + 30719;
    float _704 = float(_702);
    float _706 = fma(_704, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _708 = -_335;
    float _710 = _708 + _658;
    float _712 = abs(_706);
    float _714 = -_712;
    float _716 = _714 + 1.0;
    float _718 = fma(_666, _710, _335);
    int _720 = as_type<int>(_716) + (-218103808);
    bool _722 = uint(_720) >= 1920991232u;
    float _724 = -_333;
    float _726 = _724 + _656;
    float _728 = fma(_666, _726, _333);
    bool _730 = !_722;
    if (!_730)
    {
        int _732;
        _75(_732, out.gl_Position, out.gl_PointSize);
    }
    float _734 = in.m_46.x;
    float _736 = in.m_46.y;
    float _738 = in.m_46.z;
    float _740 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _748 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _750 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _752 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _754 = log2(_752);
    float _756 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_52.x = _585;
    out.m_52.y = _589;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _762 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _774 = _764 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _766 + _776;
    float _780 = _770 * _770;
    float _782 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _738 * 2.0;
    float _786 = _734 * 2.0;
    float _788 = fma(_774, _774, _780);
    float _790 = _736 * 2.0;
    float _792 = _754 * _112;
    float _794 = floor(_786);
    float _796 = floor(_784);
    float _798 = fma(_778, _778, _788);
    float _800 = rsqrt(_798);
    bool _802 = _796 > 0.0;
    float _804 = floor(_790);
    bool _806 = _796 >= 0.0;
    bool _808 = isnan(_796);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + _738;
    int _818 = _814 ? 0 : 1;
    float _820 = _816 + (-1.0);
    float _822 = _770 * _800;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _774 * _800;
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _770 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _842 = _794 > 0.0;
    float _844 = -_822;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    int _848 = ~_818;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    int _856 = _852;
    float _858 = _800;
    if (!_802)
    {
        int _860 = ~_818;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    float _866 = -_836;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    bool _870 = _804 > 0.0;
    float _872 = _778 * _800;
    bool _874 = _804 >= 0.0;
    bool _876 = isnan(_804);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _854);
    bool _886 = _794 >= 0.0;
    bool _888 = isnan(_794);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = _846 * _846;
    float _898 = -_872;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _902 = exp2(_792);
    int _904 = _894 ? 0 : 1;
    float _906 = fma(_868, _868, _896);
    bool _908 = !_826;
    int _910 = _908 ? 0 : 1;
    int _912 = ~_904;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_900, _900, _906);
    int _920 = _916;
    if (!_842)
    {
        int _922 = ~_904;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = sqrt(_918);
    bool _930 = _884 >= 0.0;
    float _932 = _736 + _734;
    int _934 = abs(_910);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _938 = 1.0 + _936;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = -_902;
    float _952 = _950 + 1.0;
    float _954 = in.m_54.x;
    float _956 = in.m_54.y;
    float _958 = in.m_54.z;
    float _960 = 1.0 / _938;
    float _962 = float(_864);
    float _964 = _932 + (-1.0);
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _978 = !_830;
    int _980 = _978 ? 0 : 1;
    if (_930)
    {
        out.m_40.x = 0.0;
    }
    float _982 = _974 ? _952 : 0.0;
    float _984 = float(_934);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _988 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _990 = abs(_980);
    float _992 = _984 * _962;
    float _994 = _800 * _928;
    int _996 = as_type<int>(_986);
    if (_930)
    {
        _858 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _998 = _858;
    if (_948)
    {
        float _1000 = _982 * _960;
        _130 = _1000;
    }
    float _1002 = _130;
    float _1004 = _992 * (-2.0);
    float _1006 = _976 * _994;
    float _1008 = _988 * _994;
    float _1010 = fma(_986, _1004, _986);
    if (_930)
    {
        float _1012 = _998 * 5.0;
        _996 = as_type<int>(_1012);
    }
    int _1014 = _996;
    float _1016 = _782 * _994;
    int _1018 = _882 ? 0 : 1;
    float _1020 = fma(_1004, _954, _954);
    float _1022 = float(_990);
    float _1024 = _958;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3174 = as_type<float>(_1014);
        out.gl_Position.z = _3174;
    }
    float _1026 = float(_926);
    float _1028 = _734 + (-0.5);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    out.m_56.x = _1016;
    out.m_56.y = _1006;
    out.m_56.z = _1008;
    int _1036 = _1034;
    if (!_870)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _1022 * _1026;
    bool _1046 = !_834;
    int _1048 = _1046 ? 0 : 1;
    if (_930)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1050 = -_822;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _1054 = -_836;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _1058 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1020);
    float _1060 = _1044 * (-2.0);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    int _1066 = abs(_1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_838, _1060, _838);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_1060, _956, _956);
    float _1078 = fma(_1010, _1002, _1058);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1082 = -_872;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _1086 = _736 + (-0.5);
    float _1088 = float(_1066);
    float _1090 = _1078 * 0.15915493667125701904296875;
    float _1092 = float(_1042);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1084 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1076);
    float _1100 = _738 + _734;
    float _1102 = _1088 * _1092;
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1080);
    float _1106 = fma(_1072, _1002, _1098);
    float _1108 = _1100 + (-1.0);
    float _1110 = _1102 * (-2.0);
    float _1112 = _738 + (-0.5);
    bool _1114 = _1104 >= 0.0;
    float _1116 = _1106 * 0.15915493667125701904296875;
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1110, _958, _958);
    float _1122 = _1090 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1118, _1110, _1118);
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1130 = fma(_1126, _1002, _1128);
    float _1132 = _1090 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    if (_1114)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1136 = _1024;
    int _1138 = as_type<int>(_1136);
    if (_1114)
    {
        out.m_40.x = 0.0;
    }
    float _1140 = _1130 * 0.15915493667125701904296875;
    if (_1114)
    {
        float _1142 = _1136 * 5.0;
        _1138 = as_type<int>(_1142);
    }
    int _1144 = _1138;
    float _1146 = _1116 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1144);
        out.gl_Position.z = _3385;
    }
    float _1150 = _1116 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1140 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    if (_1114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1158 = _1140 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _1134 * _1152;
    float _1164 = _1124 * _1152;
    float _1166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _686);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _718);
    float _1172 = _1134 * _1148;
    float _1174 = _1006 * _1166;
    float _1176 = _1124 * _1148;
    float _1178 = _1016 * _1168;
    float _1180 = _1008 * _1170;
    float _1182 = -_1164;
    float _1184 = fma(_1156, _1172, _1182);
    float _1186 = fma(_1156, _1162, _1176);
    float _1188 = _1160 * _1174;
    float _1190 = _1148 * _1160;
    float _1192 = _1152 * _1160;
    float _1194 = -_1174;
    float _1196 = _1156 * _1194;
    float _1198 = _1134 * _1188;
    float _1200 = -_1172;
    float _1202 = fma(_1156, _1164, _1200);
    float _1204 = _1124 * _1188;
    float _1206 = fma(_1192, _1178, _1196);
    float _1208 = fma(_1186, _1178, _1198);
    float _1210 = fma(_1156, _1176, _1162);
    float _1212 = fma(_1202, _1178, _1204);
    float _1214 = fma(_1190, _1180, _1206);
    float _1216 = fma(_1184, _1180, _1208);
    float _1218 = fma(_1210, _1180, _1212);
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1224);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1226);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1230);
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = _764 + _1238;
    float _1246 = _766 + _1240;
    float _1248 = _762 + _1242;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1252 = _1244 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1256 = _1246 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1218;
    float _1270 = _1246;
    float _1272 = _1258;
    float _1274 = _1260;
    float _1276 = _1244;
    if (!_1266)
    {
        _1268 = _1246;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1266)
    {
        _1270 = _1248;
    }
    float _1282 = _1270;
    bool _1284 = !_1266;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1264 + _1290;
        float _1294 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1262);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = _1308 + (-1.0);
        float _1316 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1252 * _1312;
        float _1320 = _1256 * _1312;
        float _1322 = fma(_1248, _1308, _1316);
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 * _1318;
        float _1330 = _1320 * _1320;
        _1286 = _1322;
        _1272 = _1328;
        _1274 = _1330;
        _1276 = _1324;
        _1280 = _1326;
    }
    float _1332 = _1286;
    float _1334 = _1272;
    float _1336 = _1274;
    float _1338 = _1276;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1344, _1344, _1334);
    float _1348 = _1346 + _1336;
    float _1350 = sqrt(_1348);
    bool _1352 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1354 = isnan(_1350);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1360 = _1356 || _1358;
    float _1362 = _1334;
    if (!_1360)
    {
        _1362 = 1.0;
    }
    float _1364 = _1362;
    bool _1366 = !_1360;
    float _1368 = _1364;
    if (!_1366)
    {
        bool _1370 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1372 = isnan(_1350);
        bool _1374 = _1370 || _1372;
        bool _1376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1378 = _1374 || _1376;
        if (!_1378)
        {
            float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1382 = _1350 + _1380;
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1390 = _1388 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1392 = 1.0 / _1386;
            float _1394 = _1382 * _1392;
            float _1396 = fma(_1394, _1390, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1402 = isnan(_1350);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1412 = _1350 + _1410;
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1414 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1422 = 1.0 / _1416;
                float _1424 = _1412 * _1422;
                float _1426 = fma(_1424, _1420, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1426;
                _1398 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1398 = false;
    float _1428 = _1368;
    float _1430 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1338 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1438 = _1340 + _1436;
    out.m_58.x = _1056;
    out.m_58.y = _1052;
    out.m_58.z = _1084;
    float _1440 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1430);
    float _1442 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1444 = fma(_1438, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1440);
    float _1448 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1450 = -_836;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_872;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1460 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1448);
    float _1462 = 1.0 / _1458;
    float _1464 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1460);
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1468 = _1332 + _1466;
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1472 = fma(_1468, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1474 = _1470 + _1458;
    float _1476 = -_822;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = _1474 * _1462;
    float _1496 = _1494 * 0.5;
    float _1498 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1500 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    float _1502 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1506);
    float _1510 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1516 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1520 = 1.0 / _1508;
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1526);
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    float _1542 = _1522;
    float _1544 = _1526;
    if (_1488)
    {
        _1542 = 1.0;
    }
    float _1546 = _1542;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1550 = _1546;
    if (_1488)
    {
        _1544 = 1.0;
    }
    float _1552 = _1544;
    float _1554 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1558 = _1520 * _1556;
    float _1560 = _1552;
    if (!_1488)
    {
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1564 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1572 = _1570 * 0.15915493667125701904296875;
        float _1574 = _1564 * 6.283185482025146484375;
        float _1576 = sin(_1574);
        float _1578 = 1.0 / _1568;
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = _1576 * _1578;
        float _1586 = _1572 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1590;
        float _1594 = _1582 * _1584;
        float _1596 = 1.0 / _1592;
        float _1598 = 1.0 / _1594;
        float _1600 = _1588 * _1598;
        float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1604 = fma(_1558, _1600, _1602);
        float _1606 = _1604 * _1596;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        _1550 = _1608;
    }
    float _1610 = _1550;
    if (!_1488)
    {
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = _1614 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = 1.0 / _1618;
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1626 * _1628;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1632 * _1634;
        float _1642 = 1.0 / _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1644;
        float _1648 = 1.0 / _1646;
        float _1650 = _1638 * _1642;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1654 = fma(_1558, _1650, _1652);
        float _1656 = _1654 * _1648;
        float _1658 = precise::clamp(_1656, 0.0, 1.0);
        float _1660 = -_1658;
        float _1662 = _1660 + 1.0;
        _1560 = _1662;
    }
    float _1664 = _1560;
    bool _1666 = _1610 > 0.0;
    bool _1668 = isnan(_1610);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1534);
    float _1680 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1538);
    float _1682 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1684 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1686 = _1610 * _1664;
    bool _1688 = _1664 <= 0.0;
    bool _1690 = !_1674;
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1678);
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1698 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1680);
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1684);
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1704 = _1694 + _1696;
    float _1706 = _1698 + _1696;
    float _1708 = _1696 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = _1706 * 0.5;
    float _1714 = fma(_1700, -0.5, _1708);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1452;
    out.m_60.y = _1478;
    out.m_60.z = _1456;
    out.gl_Position.x = _1694;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1698;
    out.gl_Position.w = _1696;
    out.m_62.x = _1710;
    out.m_62.y = _1714;
    out.m_62.z = _1712;
    out.m_62.w = _1696;
    out.m_40.x = _1716;
    if (!_1692)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_40.x = 0.0;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1718;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_102);
        out.gl_Position.z = _1776;
    }
    if (!_90)
    {
        return out;
    }
    float _106 = in.m_42.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _112;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_128)
    {
        out.m_40.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_136);
        out.gl_Position.z = _1840;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_44.w;
    float _140 = 1.0 / _108;
    float _142 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = in.m_37.x;
    float _162 = in.m_37.y;
    float _164 = in.m_37.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = _112 * _140;
    float _252 = fma(_240, _154, _244);
    float _254 = fma(_240, _156, _246);
    float _256 = fma(_240, _158, _248);
    float _258 = fma(_252, _138, _160);
    float _260 = fma(_254, _138, _162);
    float _262 = fma(_256, _138, _164);
    bool _264 = !_242;
    float _282;
    if (!_264)
    {
        float _266 = in.m_46.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _250;
    }
    _284 = false;
    float _286 = _282;
    int _288 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _290 = _288;
    int _292 = 0;
    int _294 = _77(_290, _292, (*spvDescriptorSet0.support_buffer));
    float _296 = in.m_48.z;
    float _298 = 0.0 + _250;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = trunc(_296);
    int _304 = int(_302);
    int _306 = _294 + (-1);
    float _308 = float(_306);
    float _310 = _300 * _308;
    float _312 = trunc(_310);
    int _314 = int(_312);
    int _316 = _314;
    int _318 = 0;
    int _320 = _78(_316, _318, (*spvDescriptorSet0.support_buffer));
    int _322 = _304;
    int _324 = 0;
    int _326 = _78(_322, _324, (*spvDescriptorSet0.support_buffer));
    float4 _329 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_320, _326)), 0).xyzw;
    float _331 = _329.x;
    float _333 = _329.y;
    float _335 = _329.z;
    float _337 = _329.w;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _347 = in.m_48.y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _355 = _353 != 0;
    float _357 = in.m_48.x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = 0.0;
    float _373 = _347;
    if (_355)
    {
        float _375 = in.m_46.x;
        _371 = _375;
    }
    float _377 = _371;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _381 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[79].z, _349);
    float _383 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].z, _351);
    float _387 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _389 = -_359;
    float _391 = fma(_383, 2.0, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = fma(_387, -2.0, _367);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = 1.0 / _397;
    bool _405 = _341 > 0.5;
    bool _407 = _405 && _363;
    float _409 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].w, _393);
    float _419 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[79].x, _381);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _286 + _421;
    out.m_50.x = _409;
    out.m_50.y = _413;
    out.m_50.z = _415;
    out.m_50.w = _411;
    bool _425 = _377 > 0.5;
    bool _427 = _425 && _355;
    float _429 = _419 * (-0.15915493667125701904296875);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _409;
    if (_407)
    {
        float _437 = -_347;
        float _439 = _437 + 1.0;
        _373 = _439;
    }
    float _441 = _373;
    float _443 = 0.0;
    if (_355)
    {
        _443 = _357;
    }
    float _445 = _443;
    float _447 = _423 * _403;
    float _449 = _429 * 6.283185482025146484375;
    float _451 = sin(_449);
    float _453 = _365 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = -_112;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _399);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _465;
    bool _469 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _471 = isnan(_286);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = _345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _485 = fma(_433, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _489 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_286);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_483, _441, -0.5);
    float _503 = _445;
    if (_427)
    {
        float _505 = -_445;
        float _507 = _505 + 1.0;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = in.m_44.x;
    float _513 = in.m_44.y;
    float _515 = in.m_44.z;
    if (!_355)
    {
        _435 = _357;
    }
    float _517 = _435;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _429 * 6.283185482025146484375;
    float _525 = cos(_523);
    float _527 = _517;
    if (_355)
    {
        _527 = _509;
    }
    float _529 = _527;
    float _531 = _451 * _501;
    float _533 = _479 * _521;
    float _535 = -_479;
    float _537 = _535 + 1.0;
    float _539 = fma(_453, _529, -0.5);
    float _541 = _481 * _533;
    float _543 = _485 * _533;
    float _545 = _487 * _533;
    float _547 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _417);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].z, _545);
    float _555 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _385);
    float _557 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].x, _549);
    float _559 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].y, _551);
    float _561 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].z, _553);
    float _563 = _525 * _501;
    float _565 = -_531;
    float _567 = fma(_525, _539, _565);
    float _569 = _557 * _511;
    float _571 = _559 * _513;
    float _573 = fma(_451, _539, _563);
    float _575 = fma(_555, _567, _457);
    int _577 = _314 + 1;
    float _579 = _561 * _515;
    float _581 = -_463;
    float _583 = fma(_547, _573, _581);
    float _585 = _575 + 0.5;
    int _587 = min(_306, _577);
    float _589 = _583 + 0.5;
    uint _592 = as_type<uint>(half2(float2(_337, 0.0)));
    uint _594 = extract_bits(_592, 0u, 8u);
    int _596 = int(_594) & 255;
    uint _598 = extract_bits(_592, 8u, 8u);
    int _600 = int(_598) & 255;
    int _602 = _600 << 8;
    int _604 = _596 | _602;
    bool _606 = _604 >= 32768;
    int _608 = _604 + (-1024);
    int _610 = _608;
    if (_606)
    {
        int _612 = ~_604;
        int _614 = _612 + 33792;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    int _620 = _618 + 30719;
    float _622 = float(_620);
    float _624 = fma(_622, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _626 = abs(_624);
    float _628 = -_626;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_630) + (-218103808);
    bool _634 = uint(_632) >= 1920991232u;
    bool _636 = !_634;
    if (!_636)
    {
        int _638;
        _75(_638, out.gl_Position, out.gl_PointSize);
    }
    int _640 = _587;
    int _642 = 0;
    int _644 = _78(_640, _642, (*spvDescriptorSet0.support_buffer));
    int _646 = _304;
    int _648 = 0;
    int _650 = _78(_646, _648, (*spvDescriptorSet0.support_buffer));
    float4 _652 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_644, _650)), 0).xyzw;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float _660 = _652.w;
    float _662 = floor(_310);
    float _664 = -_662;
    float _666 = _310 + _664;
    uint _668 = as_type<uint>(half2(float2(_660, 0.0)));
    float _670 = -_331;
    float _672 = _670 + _654;
    uint _674 = extract_bits(_668, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_668, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_666, _672, _331);
    bool _688 = _684 >= 32768;
    int _690 = _684 + (-1024);
    int _692 = _690;
    if (_688)
    {
        int _694 = ~_684;
        int _696 = _694 + 33792;
        int _698 = _696 + 1;
        _692 = _698;
    }
    int _700 = _692;
    int _702 = _700 + 30719;
    float _704 = float(_702);
    float _706 = fma(_704, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _708 = -_335;
    float _710 = _708 + _658;
    float _712 = abs(_706);
    float _714 = -_712;
    float _716 = _714 + 1.0;
    float _718 = fma(_666, _710, _335);
    int _720 = as_type<int>(_716) + (-218103808);
    bool _722 = uint(_720) >= 1920991232u;
    float _724 = -_333;
    float _726 = _724 + _656;
    float _728 = fma(_666, _726, _333);
    bool _730 = !_722;
    if (!_730)
    {
        int _732;
        _75(_732, out.gl_Position, out.gl_PointSize);
    }
    float _734 = in.m_46.x;
    float _736 = in.m_46.y;
    float _738 = in.m_46.z;
    float _740 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _748 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _750 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _752 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _754 = log2(_752);
    float _756 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_52.x = _585;
    out.m_52.y = _589;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _762 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _774 = _764 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _766 + _776;
    float _780 = _770 * _770;
    float _782 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _738 * 2.0;
    float _786 = _734 * 2.0;
    float _788 = fma(_774, _774, _780);
    float _790 = _736 * 2.0;
    float _792 = _754 * _112;
    float _794 = floor(_786);
    float _796 = floor(_784);
    float _798 = fma(_778, _778, _788);
    float _800 = rsqrt(_798);
    bool _802 = _796 > 0.0;
    float _804 = floor(_790);
    bool _806 = _796 >= 0.0;
    bool _808 = isnan(_796);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + _738;
    int _818 = _814 ? 0 : 1;
    float _820 = _816 + (-1.0);
    float _822 = _770 * _800;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _774 * _800;
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _770 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _842 = _794 > 0.0;
    float _844 = -_822;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    int _848 = ~_818;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    int _856 = _852;
    float _858 = _800;
    if (!_802)
    {
        int _860 = ~_818;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    float _866 = -_836;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    bool _870 = _804 > 0.0;
    float _872 = _778 * _800;
    bool _874 = _804 >= 0.0;
    bool _876 = isnan(_804);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _854);
    bool _886 = _794 >= 0.0;
    bool _888 = isnan(_794);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = _846 * _846;
    float _898 = -_872;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _902 = exp2(_792);
    int _904 = _894 ? 0 : 1;
    float _906 = fma(_868, _868, _896);
    bool _908 = !_826;
    int _910 = _908 ? 0 : 1;
    int _912 = ~_904;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_900, _900, _906);
    int _920 = _916;
    if (!_842)
    {
        int _922 = ~_904;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = sqrt(_918);
    bool _930 = _884 >= 0.0;
    float _932 = _736 + _734;
    int _934 = abs(_910);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _938 = 1.0 + _936;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = -_902;
    float _952 = _950 + 1.0;
    float _954 = in.m_54.x;
    float _956 = in.m_54.y;
    float _958 = in.m_54.z;
    float _960 = 1.0 / _938;
    float _962 = float(_864);
    float _964 = _932 + (-1.0);
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _978 = !_830;
    int _980 = _978 ? 0 : 1;
    if (_930)
    {
        out.m_40.x = 0.0;
    }
    float _982 = _974 ? _952 : 0.0;
    float _984 = float(_934);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _988 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _990 = abs(_980);
    float _992 = _984 * _962;
    float _994 = _800 * _928;
    int _996 = as_type<int>(_986);
    if (_930)
    {
        _858 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _998 = _858;
    if (_948)
    {
        float _1000 = _982 * _960;
        _130 = _1000;
    }
    float _1002 = _130;
    float _1004 = _992 * (-2.0);
    float _1006 = _976 * _994;
    float _1008 = _988 * _994;
    float _1010 = fma(_986, _1004, _986);
    if (_930)
    {
        float _1012 = _998 * 5.0;
        _996 = as_type<int>(_1012);
    }
    int _1014 = _996;
    float _1016 = _782 * _994;
    int _1018 = _882 ? 0 : 1;
    float _1020 = fma(_1004, _954, _954);
    float _1022 = float(_990);
    float _1024 = _958;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3174 = as_type<float>(_1014);
        out.gl_Position.z = _3174;
    }
    float _1026 = float(_926);
    float _1028 = _734 + (-0.5);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    out.m_56.x = _1016;
    out.m_56.y = _1006;
    out.m_56.z = _1008;
    int _1036 = _1034;
    if (!_870)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _1022 * _1026;
    bool _1046 = !_834;
    int _1048 = _1046 ? 0 : 1;
    if (_930)
    {
        return out;
    }
    float _1050 = -_822;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _1054 = -_836;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _1058 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1020);
    float _1060 = _1044 * (-2.0);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    int _1066 = abs(_1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_838, _1060, _838);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_1060, _956, _956);
    float _1078 = fma(_1010, _1002, _1058);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1082 = -_872;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _1086 = _736 + (-0.5);
    float _1088 = float(_1066);
    float _1090 = _1078 * 0.15915493667125701904296875;
    float _1092 = float(_1042);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1084 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1076);
    float _1100 = _738 + _734;
    float _1102 = _1088 * _1092;
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1080);
    float _1106 = fma(_1072, _1002, _1098);
    float _1108 = _1100 + (-1.0);
    float _1110 = _1102 * (-2.0);
    float _1112 = _738 + (-0.5);
    bool _1114 = _1104 >= 0.0;
    float _1116 = _1106 * 0.15915493667125701904296875;
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1110, _958, _958);
    float _1122 = _1090 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1118, _1110, _1118);
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1130 = fma(_1126, _1002, _1128);
    float _1132 = _1090 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    if (_1114)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1136 = _1024;
    int _1138 = as_type<int>(_1136);
    if (_1114)
    {
        out.m_40.x = 0.0;
    }
    float _1140 = _1130 * 0.15915493667125701904296875;
    if (_1114)
    {
        float _1142 = _1136 * 5.0;
        _1138 = as_type<int>(_1142);
    }
    int _1144 = _1138;
    float _1146 = _1116 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1144);
        out.gl_Position.z = _3385;
    }
    float _1150 = _1116 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1140 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    if (_1114)
    {
        return out;
    }
    float _1158 = _1140 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _1134 * _1152;
    float _1164 = _1124 * _1152;
    float _1166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _686);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _718);
    float _1172 = _1134 * _1148;
    float _1174 = _1006 * _1166;
    float _1176 = _1124 * _1148;
    float _1178 = _1016 * _1168;
    float _1180 = _1008 * _1170;
    float _1182 = -_1164;
    float _1184 = fma(_1156, _1172, _1182);
    float _1186 = fma(_1156, _1162, _1176);
    float _1188 = _1160 * _1174;
    float _1190 = _1148 * _1160;
    float _1192 = _1152 * _1160;
    float _1194 = -_1174;
    float _1196 = _1156 * _1194;
    float _1198 = _1134 * _1188;
    float _1200 = -_1172;
    float _1202 = fma(_1156, _1164, _1200);
    float _1204 = _1124 * _1188;
    float _1206 = fma(_1192, _1178, _1196);
    float _1208 = fma(_1186, _1178, _1198);
    float _1210 = fma(_1156, _1176, _1162);
    float _1212 = fma(_1202, _1178, _1204);
    float _1214 = fma(_1190, _1180, _1206);
    float _1216 = fma(_1184, _1180, _1208);
    float _1218 = fma(_1210, _1180, _1212);
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1224);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1226);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1230);
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = _764 + _1238;
    float _1246 = _766 + _1240;
    float _1248 = _762 + _1242;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1252 = _1244 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1256 = _1246 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1218;
    float _1270 = _1246;
    float _1272 = _1258;
    float _1274 = _1260;
    float _1276 = _1244;
    if (!_1266)
    {
        _1268 = _1246;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1266)
    {
        _1270 = _1248;
    }
    float _1282 = _1270;
    bool _1284 = !_1266;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1264 + _1290;
        float _1294 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1262);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = _1308 + (-1.0);
        float _1316 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1252 * _1312;
        float _1320 = _1256 * _1312;
        float _1322 = fma(_1248, _1308, _1316);
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 * _1318;
        float _1330 = _1320 * _1320;
        _1286 = _1322;
        _1272 = _1328;
        _1274 = _1330;
        _1276 = _1324;
        _1280 = _1326;
    }
    float _1332 = _1286;
    float _1334 = _1272;
    float _1336 = _1274;
    float _1338 = _1276;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1344, _1344, _1334);
    float _1348 = _1346 + _1336;
    float _1350 = sqrt(_1348);
    bool _1352 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1354 = isnan(_1350);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1360 = _1356 || _1358;
    float _1362 = _1334;
    if (!_1360)
    {
        _1362 = 1.0;
    }
    float _1364 = _1362;
    bool _1366 = !_1360;
    float _1368 = _1364;
    if (!_1366)
    {
        bool _1370 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1372 = isnan(_1350);
        bool _1374 = _1370 || _1372;
        bool _1376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1378 = _1374 || _1376;
        if (!_1378)
        {
            float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1382 = _1350 + _1380;
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1390 = _1388 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1392 = 1.0 / _1386;
            float _1394 = _1382 * _1392;
            float _1396 = fma(_1394, _1390, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1402 = isnan(_1350);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1412 = _1350 + _1410;
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1414 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1422 = 1.0 / _1416;
                float _1424 = _1412 * _1422;
                float _1426 = fma(_1424, _1420, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1426;
                _1398 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1398 = false;
    float _1428 = _1368;
    float _1430 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1338 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1438 = _1340 + _1436;
    out.m_58.x = _1056;
    out.m_58.y = _1052;
    out.m_58.z = _1084;
    float _1440 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1430);
    float _1442 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1444 = fma(_1438, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1440);
    float _1448 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1450 = -_836;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_872;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1460 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1448);
    float _1462 = 1.0 / _1458;
    float _1464 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1460);
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1468 = _1332 + _1466;
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1472 = fma(_1468, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1474 = _1470 + _1458;
    float _1476 = -_822;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = _1474 * _1462;
    float _1496 = _1494 * 0.5;
    float _1498 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1500 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    float _1502 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1506);
    float _1510 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1516 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1520 = 1.0 / _1508;
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1526);
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    float _1542 = _1522;
    float _1544 = _1526;
    if (_1488)
    {
        _1542 = 1.0;
    }
    float _1546 = _1542;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1550 = _1546;
    if (_1488)
    {
        _1544 = 1.0;
    }
    float _1552 = _1544;
    float _1554 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1558 = _1520 * _1556;
    float _1560 = _1552;
    if (!_1488)
    {
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1564 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1572 = _1570 * 0.15915493667125701904296875;
        float _1574 = _1564 * 6.283185482025146484375;
        float _1576 = sin(_1574);
        float _1578 = 1.0 / _1568;
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = _1576 * _1578;
        float _1586 = _1572 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1590;
        float _1594 = _1582 * _1584;
        float _1596 = 1.0 / _1592;
        float _1598 = 1.0 / _1594;
        float _1600 = _1588 * _1598;
        float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1604 = fma(_1558, _1600, _1602);
        float _1606 = _1604 * _1596;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        _1550 = _1608;
    }
    float _1610 = _1550;
    if (!_1488)
    {
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = _1614 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = 1.0 / _1618;
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1626 * _1628;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1632 * _1634;
        float _1642 = 1.0 / _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1644;
        float _1648 = 1.0 / _1646;
        float _1650 = _1638 * _1642;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1654 = fma(_1558, _1650, _1652);
        float _1656 = _1654 * _1648;
        float _1658 = precise::clamp(_1656, 0.0, 1.0);
        float _1660 = -_1658;
        float _1662 = _1660 + 1.0;
        _1560 = _1662;
    }
    float _1664 = _1560;
    bool _1666 = _1610 > 0.0;
    bool _1668 = isnan(_1610);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1534);
    float _1680 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1538);
    float _1682 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1684 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1686 = _1610 * _1664;
    bool _1688 = _1664 <= 0.0;
    bool _1690 = !_1674;
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1678);
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1698 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1680);
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1684);
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1704 = _1694 + _1696;
    float _1706 = _1698 + _1696;
    float _1708 = _1696 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = _1706 * 0.5;
    float _1714 = fma(_1700, -0.5, _1708);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1452;
    out.m_60.y = _1478;
    out.m_60.z = _1456;
    out.gl_Position.x = _1694;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1698;
    out.gl_Position.w = _1696;
    out.m_62.x = _1710;
    out.m_62.y = _1714;
    out.m_62.z = _1712;
    out.m_62.w = _1696;
    out.m_40.x = _1716;
    if (!_1692)
    {
        return out;
    }
    out.m_40.x = 0.0;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1718;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1398 = false;
    bool _284 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_37.w;
    float _84 = trunc(_82);
    int _86 = int(_84);
    bool _90 = _86 >= 1;
    float _92 = 0.0;
    float _94 = as_type<float>(_86);
    if (!_90)
    {
        _92 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _92;
    if (!_90)
    {
        out.m_40.x = 0.0;
    }
    int _98 = 0;
    if (!_90)
    {
        float _100 = _96 * 5.0;
        _98 = as_type<int>(_100);
    }
    int _102 = _98;
    int _104 = _102;
    if (!_90)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1776 = as_type<float>(_102);
        out.gl_Position.z = _1776;
    }
    if (!_90)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _106 = in.m_42.w;
    float _108 = float(_86);
    float _110 = -_106;
    float _112 = _110 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_106);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    bool _124 = _112 >= _108;
    bool _126 = !_122;
    bool _128 = _124 || _126;
    float _130 = _112;
    if (_128)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _94;
    if (_128)
    {
        out.m_40.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _104 = as_type<int>(_134);
    }
    int _136 = _104;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1840 = as_type<float>(_136);
        out.gl_Position.z = _1840;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_44.w;
    float _140 = 1.0 / _108;
    float _142 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _144 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _146 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _148 = _144 || _146;
    bool _150 = isnan(1.0);
    bool _152 = _148 || _150;
    float _154 = in.m_42.x;
    float _156 = in.m_42.y;
    float _158 = in.m_42.z;
    float _160 = in.m_37.x;
    float _162 = in.m_37.y;
    float _164 = in.m_37.z;
    float _166 = 0.0;
    float _168 = _142;
    if (!_152)
    {
        float _170 = _142 * _142;
        float _172 = _170 * 0.5;
        _166 = _172;
    }
    float _174 = _166;
    float _176 = _174;
    if (!_152)
    {
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _176 = _178;
    }
    float _180 = _176;
    bool _182 = !_152;
    float _184 = _180;
    if (!_182)
    {
        float _186 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _188 = log2(_186);
        float _190 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _192 = _190 + 1.0;
        float _194 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = _142 * _188;
        float _198 = 1.0 / _192;
        float _200 = _194 * 0.693147182464599609375;
        float _202 = exp2(_196);
        float _204 = 1.0 / _200;
        float _206 = _202 + (-1.0);
        float _208 = -_206;
        float _210 = fma(_208, _204, _142);
        float _212 = _210 * _198;
        float _214 = _212 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _214;
    }
    float _216 = _184;
    bool _218 = !_152;
    if (!_218)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = 1.0 / _226;
        float _230 = _142 * _222;
        float _232 = exp2(_230);
        float _234 = -_232;
        float _236 = _234 + 1.0;
        float _238 = _236 * _228;
        _168 = _238;
    }
    float _240 = _168;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = _112 * _140;
    float _252 = fma(_240, _154, _244);
    float _254 = fma(_240, _156, _246);
    float _256 = fma(_240, _158, _248);
    float _258 = fma(_252, _138, _160);
    float _260 = fma(_254, _138, _162);
    float _262 = fma(_256, _138, _164);
    bool _264 = !_242;
    float _282;
    if (!_264)
    {
        float _266 = in.m_46.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _112);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        _282 = _250;
    }
    _284 = false;
    float _286 = _282;
    int _288 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _290 = _288;
    int _292 = 0;
    int _294 = _77(_290, _292, (*spvDescriptorSet0.support_buffer));
    float _296 = in.m_48.z;
    float _298 = 0.0 + _250;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = trunc(_296);
    int _304 = int(_302);
    int _306 = _294 + (-1);
    float _308 = float(_306);
    float _310 = _300 * _308;
    float _312 = trunc(_310);
    int _314 = int(_312);
    int _316 = _314;
    int _318 = 0;
    int _320 = _78(_316, _318, (*spvDescriptorSet0.support_buffer));
    int _322 = _304;
    int _324 = 0;
    int _326 = _78(_322, _324, (*spvDescriptorSet0.support_buffer));
    float4 _329 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_320, _326)), 0).xyzw;
    float _331 = _329.x;
    float _333 = _329.y;
    float _335 = _329.z;
    float _337 = _329.w;
    float _339 = in.m_46.x;
    float _341 = in.m_46.y;
    float _343 = in.m_46.z;
    float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _347 = in.m_48.y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _355 = _353 != 0;
    float _357 = in.m_48.x;
    float _359 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _363 = _361 != 0;
    float _365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _371 = 0.0;
    float _373 = _347;
    if (_355)
    {
        float _375 = in.m_46.x;
        _371 = _375;
    }
    float _377 = _371;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _381 = fma(_343, (*spvDescriptorSet0.vp_c9)._m0[79].z, _349);
    float _383 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _385 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].z, _351);
    float _387 = _341 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _389 = -_359;
    float _391 = fma(_383, 2.0, _389);
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _395;
    float _399 = fma(_387, -2.0, _367);
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _403 = 1.0 / _397;
    bool _405 = _341 > 0.5;
    bool _407 = _405 && _363;
    float _409 = _369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _413 = _401 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _415 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _417 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[78].w, _393);
    float _419 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[79].x, _381);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _423 = _286 + _421;
    out.m_50.x = _409;
    out.m_50.y = _413;
    out.m_50.z = _415;
    out.m_50.w = _411;
    bool _425 = _377 > 0.5;
    bool _427 = _425 && _355;
    float _429 = _419 * (-0.15915493667125701904296875);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _431;
    float _435 = _409;
    if (_407)
    {
        float _437 = -_347;
        float _439 = _437 + 1.0;
        _373 = _439;
    }
    float _441 = _373;
    float _443 = 0.0;
    if (_355)
    {
        _443 = _357;
    }
    float _445 = _443;
    float _447 = _423 * _403;
    float _449 = _429 * 6.283185482025146484375;
    float _451 = sin(_449);
    float _453 = _365 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _455 = -_112;
    float _457 = fma(_455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _391);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _459;
    float _463 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[76].y, _399);
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _465;
    bool _469 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _471 = isnan(_286);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = fma(_461, _447, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _483 = _345 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _485 = fma(_433, _447, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _487 = fma(_467, _447, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _489 = _286 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _491 = isnan(_286);
    bool _493 = _489 || _491;
    bool _495 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _497 = _493 || _495;
    float _499 = float(_497);
    float _501 = fma(_483, _441, -0.5);
    float _503 = _445;
    if (_427)
    {
        float _505 = -_445;
        float _507 = _505 + 1.0;
        _503 = _507;
    }
    float _509 = _503;
    float _511 = in.m_44.x;
    float _513 = in.m_44.y;
    float _515 = in.m_44.z;
    if (!_355)
    {
        _435 = _357;
    }
    float _517 = _435;
    float _519 = -_499;
    float _521 = _519 + 1.0;
    float _523 = _429 * 6.283185482025146484375;
    float _525 = cos(_523);
    float _527 = _517;
    if (_355)
    {
        _527 = _509;
    }
    float _529 = _527;
    float _531 = _451 * _501;
    float _533 = _479 * _521;
    float _535 = -_479;
    float _537 = _535 + 1.0;
    float _539 = fma(_453, _529, -0.5);
    float _541 = _481 * _533;
    float _543 = _485 * _533;
    float _545 = _487 * _533;
    float _547 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].w, _417);
    float _549 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].x, _541);
    float _551 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].y, _543);
    float _553 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[143].z, _545);
    float _555 = fma(_112, (*spvDescriptorSet0.vp_c9)._m0[77].z, _385);
    float _557 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].x, _549);
    float _559 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].y, _551);
    float _561 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[144].z, _553);
    float _563 = _525 * _501;
    float _565 = -_531;
    float _567 = fma(_525, _539, _565);
    float _569 = _557 * _511;
    float _571 = _559 * _513;
    float _573 = fma(_451, _539, _563);
    float _575 = fma(_555, _567, _457);
    int _577 = _314 + 1;
    float _579 = _561 * _515;
    float _581 = -_463;
    float _583 = fma(_547, _573, _581);
    float _585 = _575 + 0.5;
    int _587 = min(_306, _577);
    float _589 = _583 + 0.5;
    uint _592 = as_type<uint>(half2(float2(_337, 0.0)));
    uint _594 = extract_bits(_592, 0u, 8u);
    int _596 = int(_594) & 255;
    uint _598 = extract_bits(_592, 8u, 8u);
    int _600 = int(_598) & 255;
    int _602 = _600 << 8;
    int _604 = _596 | _602;
    bool _606 = _604 >= 32768;
    int _608 = _604 + (-1024);
    int _610 = _608;
    if (_606)
    {
        int _612 = ~_604;
        int _614 = _612 + 33792;
        int _616 = _614 + 1;
        _610 = _616;
    }
    int _618 = _610;
    int _620 = _618 + 30719;
    float _622 = float(_620);
    float _624 = fma(_622, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _626 = abs(_624);
    float _628 = -_626;
    float _630 = _628 + 1.0;
    int _632 = as_type<int>(_630) + (-218103808);
    bool _634 = uint(_632) >= 1920991232u;
    bool _636 = !_634;
    if (!_636)
    {
        int _638;
        _75(_638, out.gl_Position, out.gl_PointSize);
    }
    int _640 = _587;
    int _642 = 0;
    int _644 = _78(_640, _642, (*spvDescriptorSet0.support_buffer));
    int _646 = _304;
    int _648 = 0;
    int _650 = _78(_646, _648, (*spvDescriptorSet0.support_buffer));
    float4 _652 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_644, _650)), 0).xyzw;
    float _654 = _652.x;
    float _656 = _652.y;
    float _658 = _652.z;
    float _660 = _652.w;
    float _662 = floor(_310);
    float _664 = -_662;
    float _666 = _310 + _664;
    uint _668 = as_type<uint>(half2(float2(_660, 0.0)));
    float _670 = -_331;
    float _672 = _670 + _654;
    uint _674 = extract_bits(_668, 0u, 8u);
    int _676 = int(_674) & 255;
    uint _678 = extract_bits(_668, 8u, 8u);
    int _680 = int(_678) & 255;
    int _682 = _680 << 8;
    int _684 = _676 | _682;
    float _686 = fma(_666, _672, _331);
    bool _688 = _684 >= 32768;
    int _690 = _684 + (-1024);
    int _692 = _690;
    if (_688)
    {
        int _694 = ~_684;
        int _696 = _694 + 33792;
        int _698 = _696 + 1;
        _692 = _698;
    }
    int _700 = _692;
    int _702 = _700 + 30719;
    float _704 = float(_702);
    float _706 = fma(_704, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _708 = -_335;
    float _710 = _708 + _658;
    float _712 = abs(_706);
    float _714 = -_712;
    float _716 = _714 + 1.0;
    float _718 = fma(_666, _710, _335);
    int _720 = as_type<int>(_716) + (-218103808);
    bool _722 = uint(_720) >= 1920991232u;
    float _724 = -_333;
    float _726 = _724 + _656;
    float _728 = fma(_666, _726, _333);
    bool _730 = !_722;
    if (!_730)
    {
        int _732;
        _75(_732, out.gl_Position, out.gl_PointSize);
    }
    float _734 = in.m_46.x;
    float _736 = in.m_46.y;
    float _738 = in.m_46.z;
    float _740 = _260 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _260 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _744 = _260 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _746 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _748 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[4].x, _742);
    float _750 = fma(_258, (*spvDescriptorSet0.vp_c10)._m0[6].x, _744);
    float _752 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _754 = log2(_752);
    float _756 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _746);
    float _758 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _748);
    float _760 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _750);
    float _762 = _756 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _764 = _758 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _760 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    out.m_52.x = _585;
    out.m_52.y = _589;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _762 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _774 = _764 + _772;
    float _776 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _778 = _766 + _776;
    float _780 = _770 * _770;
    float _782 = _569 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _784 = _738 * 2.0;
    float _786 = _734 * 2.0;
    float _788 = fma(_774, _774, _780);
    float _790 = _736 * 2.0;
    float _792 = _754 * _112;
    float _794 = floor(_786);
    float _796 = floor(_784);
    float _798 = fma(_778, _778, _788);
    float _800 = rsqrt(_798);
    bool _802 = _796 > 0.0;
    float _804 = floor(_790);
    bool _806 = _796 >= 0.0;
    bool _808 = isnan(_796);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + _738;
    int _818 = _814 ? 0 : 1;
    float _820 = _816 + (-1.0);
    float _822 = _770 * _800;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _826 = _824 != 0;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _834 = _832 != 0;
    float _836 = _774 * _800;
    float _838 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _840 = _770 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _842 = _794 > 0.0;
    float _844 = -_822;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _770);
    int _848 = ~_818;
    int _850 = _848 + 1;
    int _852 = _850 + 1;
    float _854 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[28].x, _840);
    int _856 = _852;
    float _858 = _800;
    if (!_802)
    {
        int _860 = ~_818;
        int _862 = _860 + 1;
        _856 = _862;
    }
    int _864 = _856;
    float _866 = -_836;
    float _868 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _774);
    bool _870 = _804 > 0.0;
    float _872 = _778 * _800;
    bool _874 = _804 >= 0.0;
    bool _876 = isnan(_804);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[28].z, _854);
    bool _886 = _794 >= 0.0;
    bool _888 = isnan(_794);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = _846 * _846;
    float _898 = -_872;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _778);
    float _902 = exp2(_792);
    int _904 = _894 ? 0 : 1;
    float _906 = fma(_868, _868, _896);
    bool _908 = !_826;
    int _910 = _908 ? 0 : 1;
    int _912 = ~_904;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = fma(_900, _900, _906);
    int _920 = _916;
    if (!_842)
    {
        int _922 = ~_904;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = sqrt(_918);
    bool _930 = _884 >= 0.0;
    float _932 = _736 + _734;
    int _934 = abs(_910);
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _938 = 1.0 + _936;
    bool _940 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _942 = isnan(1.0);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _948 = _944 || _946;
    float _950 = -_902;
    float _952 = _950 + 1.0;
    float _954 = in.m_54.x;
    float _956 = in.m_54.y;
    float _958 = in.m_54.z;
    float _960 = 1.0 / _938;
    float _962 = float(_864);
    float _964 = _932 + (-1.0);
    bool _966 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = _571 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _978 = !_830;
    int _980 = _978 ? 0 : 1;
    if (_930)
    {
        out.m_40.x = 0.0;
    }
    float _982 = _974 ? _952 : 0.0;
    float _984 = float(_934);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _988 = _579 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _990 = abs(_980);
    float _992 = _984 * _962;
    float _994 = _800 * _928;
    int _996 = as_type<int>(_986);
    if (_930)
    {
        _858 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _998 = _858;
    if (_948)
    {
        float _1000 = _982 * _960;
        _130 = _1000;
    }
    float _1002 = _130;
    float _1004 = _992 * (-2.0);
    float _1006 = _976 * _994;
    float _1008 = _988 * _994;
    float _1010 = fma(_986, _1004, _986);
    if (_930)
    {
        float _1012 = _998 * 5.0;
        _996 = as_type<int>(_1012);
    }
    int _1014 = _996;
    float _1016 = _782 * _994;
    int _1018 = _882 ? 0 : 1;
    float _1020 = fma(_1004, _954, _954);
    float _1022 = float(_990);
    float _1024 = _958;
    if (_930)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3174 = as_type<float>(_1014);
        out.gl_Position.z = _3174;
    }
    float _1026 = float(_926);
    float _1028 = _734 + (-0.5);
    int _1030 = ~_1018;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    out.m_56.x = _1016;
    out.m_56.y = _1006;
    out.m_56.z = _1008;
    int _1036 = _1034;
    if (!_870)
    {
        int _1038 = ~_1018;
        int _1040 = _1038 + 1;
        _1036 = _1040;
    }
    int _1042 = _1036;
    float _1044 = _1022 * _1026;
    bool _1046 = !_834;
    int _1048 = _1046 ? 0 : 1;
    if (_930)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1050 = -_822;
    float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _1054 = -_836;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _1058 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1020);
    float _1060 = _1044 * (-2.0);
    float _1062 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1064 = _1052 + _1062;
    int _1066 = abs(_1048);
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_838, _1060, _838);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1076 = fma(_1060, _956, _956);
    float _1078 = fma(_1010, _1002, _1058);
    float _1080 = fma(_1070, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1074);
    float _1082 = -_872;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _1086 = _736 + (-0.5);
    float _1088 = float(_1066);
    float _1090 = _1078 * 0.15915493667125701904296875;
    float _1092 = float(_1042);
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1084 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1076);
    float _1100 = _738 + _734;
    float _1102 = _1088 * _1092;
    float _1104 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1080);
    float _1106 = fma(_1072, _1002, _1098);
    float _1108 = _1100 + (-1.0);
    float _1110 = _1102 * (-2.0);
    float _1112 = _738 + (-0.5);
    bool _1114 = _1104 >= 0.0;
    float _1116 = _1106 * 0.15915493667125701904296875;
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1120 = fma(_1110, _958, _958);
    float _1122 = _1090 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = fma(_1118, _1110, _1118);
    float _1128 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1120);
    float _1130 = fma(_1126, _1002, _1128);
    float _1132 = _1090 * 6.283185482025146484375;
    float _1134 = cos(_1132);
    if (_1114)
    {
        _1024 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1136 = _1024;
    int _1138 = as_type<int>(_1136);
    if (_1114)
    {
        out.m_40.x = 0.0;
    }
    float _1140 = _1130 * 0.15915493667125701904296875;
    if (_1114)
    {
        float _1142 = _1136 * 5.0;
        _1138 = as_type<int>(_1142);
    }
    int _1144 = _1138;
    float _1146 = _1116 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    if (_1114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3385 = as_type<float>(_1144);
        out.gl_Position.z = _3385;
    }
    float _1150 = _1116 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = _1140 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    if (_1114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1158 = _1140 * 6.283185482025146484375;
    float _1160 = cos(_1158);
    float _1162 = _1134 * _1152;
    float _1164 = _1124 * _1152;
    float _1166 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _728);
    float _1168 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _686);
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _718);
    float _1172 = _1134 * _1148;
    float _1174 = _1006 * _1166;
    float _1176 = _1124 * _1148;
    float _1178 = _1016 * _1168;
    float _1180 = _1008 * _1170;
    float _1182 = -_1164;
    float _1184 = fma(_1156, _1172, _1182);
    float _1186 = fma(_1156, _1162, _1176);
    float _1188 = _1160 * _1174;
    float _1190 = _1148 * _1160;
    float _1192 = _1152 * _1160;
    float _1194 = -_1174;
    float _1196 = _1156 * _1194;
    float _1198 = _1134 * _1188;
    float _1200 = -_1172;
    float _1202 = fma(_1156, _1164, _1200);
    float _1204 = _1124 * _1188;
    float _1206 = fma(_1192, _1178, _1196);
    float _1208 = fma(_1186, _1178, _1198);
    float _1210 = fma(_1156, _1176, _1162);
    float _1212 = fma(_1202, _1178, _1204);
    float _1214 = fma(_1190, _1180, _1206);
    float _1216 = fma(_1184, _1180, _1208);
    float _1218 = fma(_1210, _1180, _1212);
    float _1220 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1224 = _1216 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1226 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1228 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1222);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1224);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1226);
    float _1234 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1228);
    float _1236 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1230);
    float _1238 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1240 = _1234 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1242 = _1236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1244 = _764 + _1238;
    float _1246 = _766 + _1240;
    float _1248 = _762 + _1242;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1252 = _1244 + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1256 = _1246 + _1254;
    float _1258 = _1252 * _1252;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1218;
    float _1270 = _1246;
    float _1272 = _1258;
    float _1274 = _1260;
    float _1276 = _1244;
    if (!_1266)
    {
        _1268 = _1246;
    }
    float _1278 = _1268;
    float _1280 = _1278;
    if (!_1266)
    {
        _1270 = _1248;
    }
    float _1282 = _1270;
    bool _1284 = !_1266;
    float _1286 = _1282;
    if (!_1284)
    {
        float _1288 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1292 = _1264 + _1290;
        float _1294 = _1248 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1296 = rsqrt(_1262);
        float _1298 = _1292 * _1288;
        float _1300 = _1298 * 0.15915493667125701904296875;
        float _1302 = _1300 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        float _1306 = _1300 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = fma(_1304, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1312 = _1296 * _1310;
        float _1314 = _1308 + (-1.0);
        float _1316 = _1314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1318 = _1252 * _1312;
        float _1320 = _1256 * _1312;
        float _1322 = fma(_1248, _1308, _1316);
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1326 = _1320 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1328 = _1318 * _1318;
        float _1330 = _1320 * _1320;
        _1286 = _1322;
        _1272 = _1328;
        _1274 = _1330;
        _1276 = _1324;
        _1280 = _1326;
    }
    float _1332 = _1286;
    float _1334 = _1272;
    float _1336 = _1274;
    float _1338 = _1276;
    float _1340 = _1280;
    float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1344 = _1332 + _1342;
    float _1346 = fma(_1344, _1344, _1334);
    float _1348 = _1346 + _1336;
    float _1350 = sqrt(_1348);
    bool _1352 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1354 = isnan(_1350);
    bool _1356 = _1352 || _1354;
    bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1360 = _1356 || _1358;
    float _1362 = _1334;
    if (!_1360)
    {
        _1362 = 1.0;
    }
    float _1364 = _1362;
    bool _1366 = !_1360;
    float _1368 = _1364;
    if (!_1366)
    {
        bool _1370 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1372 = isnan(_1350);
        bool _1374 = _1370 || _1372;
        bool _1376 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1378 = _1374 || _1376;
        if (!_1378)
        {
            float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1382 = _1350 + _1380;
            float _1384 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1386 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1384;
            float _1388 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1390 = _1388 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1392 = 1.0 / _1386;
            float _1394 = _1382 * _1392;
            float _1396 = fma(_1394, _1390, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1368 = _1396;
            _1398 = true;
        }
        else
        {
            bool _1400 = _1350 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1402 = isnan(_1350);
            bool _1404 = _1400 || _1402;
            bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1408 = _1404 || _1406;
            if (!_1408)
            {
                float _1410 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1412 = _1350 + _1410;
                float _1414 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1416 = _1414 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1418 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1420 = _1418 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1422 = 1.0 / _1416;
                float _1424 = _1412 * _1422;
                float _1426 = fma(_1424, _1420, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1368 = _1426;
                _1398 = true;
            }
            else
            {
                _1368 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1398 = false;
    float _1428 = _1368;
    float _1430 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1338 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1438 = _1340 + _1436;
    out.m_58.x = _1056;
    out.m_58.y = _1052;
    out.m_58.z = _1084;
    float _1440 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1430);
    float _1442 = fma(_1434, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1444 = fma(_1438, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1446 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1440);
    float _1448 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1450 = -_836;
    float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1442);
    float _1454 = -_872;
    float _1456 = fma(_1454, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1444);
    float _1458 = _1446 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1460 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1448);
    float _1462 = 1.0 / _1458;
    float _1464 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1460);
    float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1468 = _1332 + _1466;
    float _1470 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1472 = fma(_1468, _1428, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1474 = _1470 + _1458;
    float _1476 = -_822;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    bool _1480 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.5);
    bool _1488 = _1484 || _1486;
    float _1490 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1492 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1494 = _1474 * _1462;
    float _1496 = _1494 * 0.5;
    float _1498 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1490);
    float _1500 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1492);
    float _1502 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1478 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1508 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1506);
    float _1510 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1512 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1516 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1504);
    float _1518 = _1510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1520 = 1.0 / _1508;
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1514);
    float _1526 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1528 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1532 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1534 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1526);
    float _1536 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1528);
    float _1538 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1530);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1532);
    float _1542 = _1522;
    float _1544 = _1526;
    if (_1488)
    {
        _1542 = 1.0;
    }
    float _1546 = _1542;
    float _1548 = fma(_1456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1516);
    float _1550 = _1546;
    if (_1488)
    {
        _1544 = 1.0;
    }
    float _1552 = _1544;
    float _1554 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1558 = _1520 * _1556;
    float _1560 = _1552;
    if (!_1488)
    {
        float _1562 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1564 = _1562 * 0.15915493667125701904296875;
        float _1566 = _1564 * 6.283185482025146484375;
        float _1568 = cos(_1566);
        float _1570 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1572 = _1570 * 0.15915493667125701904296875;
        float _1574 = _1564 * 6.283185482025146484375;
        float _1576 = sin(_1574);
        float _1578 = 1.0 / _1568;
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        float _1584 = _1576 * _1578;
        float _1586 = _1572 * 6.283185482025146484375;
        float _1588 = sin(_1586);
        float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1590;
        float _1594 = _1582 * _1584;
        float _1596 = 1.0 / _1592;
        float _1598 = 1.0 / _1594;
        float _1600 = _1588 * _1598;
        float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1604 = fma(_1558, _1600, _1602);
        float _1606 = _1604 * _1596;
        float _1608 = precise::clamp(_1606, 0.0, 1.0);
        _1550 = _1608;
    }
    float _1610 = _1550;
    if (!_1488)
    {
        float _1612 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1622 = _1620 * 0.15915493667125701904296875;
        float _1624 = _1614 * 6.283185482025146484375;
        float _1626 = sin(_1624);
        float _1628 = 1.0 / _1618;
        float _1630 = _1622 * 6.283185482025146484375;
        float _1632 = cos(_1630);
        float _1634 = _1626 * _1628;
        float _1636 = _1622 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1632 * _1634;
        float _1642 = 1.0 / _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1646 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1644;
        float _1648 = 1.0 / _1646;
        float _1650 = _1638 * _1642;
        float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1654 = fma(_1558, _1650, _1652);
        float _1656 = _1654 * _1648;
        float _1658 = precise::clamp(_1656, 0.0, 1.0);
        float _1660 = -_1658;
        float _1662 = _1660 + 1.0;
        _1560 = _1662;
    }
    float _1664 = _1560;
    bool _1666 = _1610 > 0.0;
    bool _1668 = isnan(_1610);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.0);
    bool _1674 = _1670 || _1672;
    float _1676 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1678 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1534);
    float _1680 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1538);
    float _1682 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1684 = fma(_1554, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1536);
    float _1686 = _1610 * _1664;
    bool _1688 = _1664 <= 0.0;
    bool _1690 = !_1674;
    bool _1692 = _1688 || _1690;
    float _1694 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1678);
    float _1696 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1698 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1680);
    float _1700 = fma(_1676, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1684);
    float _1702 = _1686 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1704 = _1694 + _1696;
    float _1706 = _1698 + _1696;
    float _1708 = _1696 * 0.5;
    float _1710 = _1704 * 0.5;
    float _1712 = _1706 * 0.5;
    float _1714 = fma(_1700, -0.5, _1708);
    float _1716 = _1702 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_60.x = _1452;
    out.m_60.y = _1478;
    out.m_60.z = _1456;
    out.gl_Position.x = _1694;
    out.gl_Position.y = _1700;
    out.gl_Position.z = _1698;
    out.gl_Position.w = _1696;
    out.m_62.x = _1710;
    out.m_62.y = _1714;
    out.m_62.z = _1712;
    out.m_62.w = _1696;
    out.m_40.x = _1716;
    if (!_1692)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_40.x = 0.0;
    float _1718 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1718;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

