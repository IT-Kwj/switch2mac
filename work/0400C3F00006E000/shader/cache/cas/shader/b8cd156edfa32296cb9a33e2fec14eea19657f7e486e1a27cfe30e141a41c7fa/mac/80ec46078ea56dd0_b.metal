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
    float4 m_56 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_60 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_37 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_46 [[attribute(6)]];
    float4 m_44 [[attribute(7)]];
    float4 m_48 [[attribute(8)]];
    float4 m_52 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _75(thread const int& _5132, thread const int& _5133, constant _10& support_buffer)
{
    float _5136 = as_type<float>(support_buffer._m4);
    int _5138 = _5133 + as_type<int>(_5136);
    int _5140 = 1 + _5138;
    float _5142 = support_buffer._m5[_5140].x;
    float _5144 = abs(_5142);
    bool _5146 = _5144 == 1.0;
    if (_5146)
    {
        return _5132;
    }
    float _5148 = float(_5132);
    float _5150 = _5148 / _5144;
    int _5152 = int(_5150);
    return _5152;
}

static inline __attribute__((always_inline))
int _76(thread const int& _5182, thread const int& _5183, constant _10& support_buffer)
{
    float _5186 = as_type<float>(support_buffer._m4);
    int _5188 = _5183 + as_type<int>(_5186);
    int _5190 = 1 + _5188;
    float _5192 = support_buffer._m5[_5190].x;
    bool _5194 = _5192 == 1.0;
    if (_5194)
    {
        return _5182;
    }
    float _5196 = float(_5182);
    float _5198 = _5196 * _5192;
    int _5200 = int(_5198);
    return _5200;
}

static inline __attribute__((always_inline))
void _73(thread int& _5129, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _5129 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1894 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_100);
        out.gl_Position.z = _2077;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_138);
        out.gl_Position.z = _2147;
    }
    if (_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_44.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_46.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    int _292 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _294 = _292;
    int _296 = 0;
    int _298 = _75(_294, _296, (*spvDescriptorSet0.support_buffer));
    float _300 = in.m_46.x;
    float _302 = in.m_46.y;
    float _304 = in.m_46.z;
    float _306 = _118 + _304;
    float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _310 = float(_298);
    int _312 = abs(_298);
    bool _314 = _298 == 0;
    float _316 = _308 * _310;
    float _318 = float(uint(_312));
    float _320 = trunc(_316);
    int _322 = int(_320);
    float _324 = 1.0 / _318;
    int _326 = abs(_322);
    uint _329 = uint(int(uint(_322) >> uint(31)));
    float _331 = float(uint(_326));
    int _333 = ~int(_329);
    int _335 = _333 + 1;
    int _337 = as_type<int>(_324) + (-2);
    float _339 = as_type<float>(_337) * _331;
    float _341 = trunc(_339);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = ~int(_345);
    int _349 = _347 + 1;
    int _351 = _349 * _312;
    int _353 = _351 + _326;
    float _355 = float(uint(_353));
    float _357 = as_type<float>(_337) * _355;
    float _359 = in.m_48.z;
    float _361 = trunc(_357);
    float _363 = precise::max(_361, 0.0);
    uint _365 = uint(_363);
    int _367 = int(_345) + int(_365);
    int _369 = ~_367;
    int _371 = _369 + 1;
    float _373 = trunc(_359);
    int _375 = int(_373);
    int _377 = _371 * _312;
    int _379 = _377 + _326;
    bool _381 = uint(_379) >= uint(_312);
    bool _383 = !_381;
    int _385 = _383 ? 0 : (-1);
    int _387 = ~_367;
    int _389 = _387 + _385;
    int _391 = _389 + 1;
    int _393 = _391 * _312;
    int _395 = _393 + _326;
    int _397 = _395 ^ _335;
    int _399 = ~_335;
    int _401 = _399 + _397;
    int _403 = _401 + 1;
    bool _405 = !_314;
    int _407 = _405 ? _403 : (-1);
    int _409 = _407;
    int _411 = 0;
    int _413 = _76(_409, _411, (*spvDescriptorSet0.support_buffer));
    int _415 = _375;
    int _417 = 0;
    int _419 = _76(_415, _417, (*spvDescriptorSet0.support_buffer));
    float4 _422 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_413, _419)), 0).xyzw;
    float _424 = _422.x;
    float _426 = _422.y;
    float _428 = _422.z;
    float _430 = _422.w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _434 = _290 + _432;
    float _436 = in.m_48.y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _440 = _438 != 0;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _454;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _460 = _458 != 0;
    float _462 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[79].z, _452);
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _472;
    float _476 = 0.0;
    float _478 = _436;
    if (_440)
    {
        float _480 = in.m_46.x;
        _476 = _480;
    }
    float _482 = _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = _302 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _488 = 1.0 / _456;
    float _490 = _300 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _302 > 0.5;
    bool _494 = _492 && _460;
    float _496 = in.m_48.x;
    float _498 = -_470;
    float _500 = fma(_490, 2.0, _498);
    float _502 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[79].x, _462);
    float _504 = 1.0 / _450;
    float _506 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _508 = _502 * (-0.15915493667125701904296875);
    float _510 = 1.0 / _468;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _512;
    bool _516 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _518 = isnan(_290);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _528;
    bool _532 = _482 > 0.5;
    bool _534 = _532 && _440;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _538 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _540 = 1.0 / _474;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _544 = _290 + _542;
    float _546 = fma(_486, -2.0, _536);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _290 + _550;
    float _554 = _544 * _488;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _290 + _556;
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[78].w, _548);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _290 + _562;
    float _566 = _552 * _464;
    float _568 = _558 * _504;
    float _570 = _564 * _510;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _580;
    float _584 = _434 * _540;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = fma(_574, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = fma(_578, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_582, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _616 = fma(_602, _554, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _618 = fma(_606, _554, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _620 = fma(_610, _554, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _634 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _636 = isnan(_290);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = fma(_614, _568, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_598, _568, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _652 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _654 = isnan(_290);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = fma(_624, _570, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _666 = fma(_628, _570, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _668 = fma(_632, _570, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _670 = -_644;
    float _672 = _670 + 1.0;
    float _674 = -_662;
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _678;
    bool _682 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_290);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _662 * _672;
    float _696 = fma(_514, _584, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _698 = _526 * _676;
    float _700 = -_526;
    float _702 = _700 + 1.0;
    float _704 = fma(_530, _584, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _706 = fma(_680, _584, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _708 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_290);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _692 * _702;
    bool _722 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_290);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_692;
    float _736 = _734 + 1.0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _740 = _496;
    float _742 = _668;
    if (_494)
    {
        float _744 = -_436;
        float _746 = _744 + 1.0;
        _478 = _746;
    }
    float _748 = _478;
    float _750 = _732 * _736;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = fma(_506, _748, -0.5);
    float _758 = _748;
    if (_440)
    {
        _758 = _496;
    }
    float _760 = _758;
    float _762 = _718 * _754;
    float _764 = _508 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_718;
    float _770 = _768 + 1.0;
    float _772 = _760;
    if (_534)
    {
        float _774 = -_760;
        float _776 = _774 + 1.0;
        _772 = _776;
    }
    float _778 = _772;
    float _780 = _590 * _762;
    float _782 = _592 * _762;
    float _784 = _594 * _762;
    float _786 = -_118;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = _508 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _782);
    float _798 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _784);
    if (_440)
    {
        _740 = _778;
    }
    float _800 = _740;
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _804 = _407 + 1;
    float _806 = fma(_650, _750, _798);
    float _808 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _810 = fma(_802, _800, -0.5);
    float _812 = fma(_646, _750, _790);
    float _814 = fma(_620, _720, _806);
    float _816 = _766 * _756;
    float _818 = fma(_648, _750, _796);
    float _820 = fma(_616, _720, _812);
    float _822 = fma(_668, _698, _814);
    float _824 = _794 * _756;
    float _826 = -_816;
    float _828 = fma(_794, _810, _826);
    float _830 = fma(_618, _720, _818);
    float _832 = fma(_664, _698, _820);
    float _834 = fma(_766, _810, _824);
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _538);
    float _838 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _840 = fma(_666, _698, _830);
    float _842 = fma(_696, _694, _832);
    float _844 = fma(_836, _828, _788);
    int _846 = abs(_804);
    float _848 = -_838;
    float _850 = fma(_808, _834, _848);
    float _852 = fma(_704, _694, _840);
    float _854 = fma(_706, _694, _822);
    float _856 = float(uint(_846));
    float _858 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].x, _842);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].y, _852);
    float _862 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].z, _854);
    float _864 = as_type<float>(_337) * _856;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _886 = uint(int(uint(_804) >> uint(31)));
    out.m_50.x = _874;
    out.m_50.y = _882;
    out.m_50.z = _884;
    out.m_50.w = _868;
    int _888 = ~int(_886);
    int _890 = _888 + 1;
    int _892 = ~int(_880);
    int _894 = _892 + 1;
    int _896 = _894 * _312;
    int _898 = _896 + _846;
    float _900 = float(uint(_898));
    float _902 = as_type<float>(_337) * _900;
    float _904 = trunc(_902);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    int _910 = int(_880) + int(_908);
    int _912 = ~_910;
    int _914 = _912 + 1;
    int _916 = _914 * _312;
    int _918 = _916 + _846;
    bool _920 = uint(_918) >= uint(_312);
    bool _922 = !_920;
    int _924 = _922 ? 0 : (-1);
    int _926 = ~_910;
    int _928 = _926 + _924;
    int _930 = _928 + 1;
    int _932 = _930 * _312;
    int _934 = _932 + _846;
    int _936 = _934 ^ _890;
    int _938 = ~_890;
    int _940 = _938 + _936;
    int _942 = _940 + 1;
    float _944 = _844 + 0.5;
    float _946 = _850 + 0.5;
    bool _948 = !_314;
    int _950 = _948 ? _942 : (-1);
    uint _952 = as_type<uint>(half2(float2(_430, 0.0)));
    uint _954 = extract_bits(_952, 0u, 8u);
    int _956 = int(_954) & 255;
    uint _958 = extract_bits(_952, 8u, 8u);
    int _960 = int(_958) & 255;
    int _962 = _960 << 8;
    int _964 = _956 | _962;
    bool _966 = _964 >= 32768;
    int _968 = _964 + (-1024);
    int _970 = _968;
    if (_966)
    {
        int _972 = ~_964;
        int _974 = _972 + 33792;
        int _976 = _974 + 1;
        _970 = _976;
    }
    int _978 = _970;
    int _980 = _978 + 30719;
    float _982 = float(_980);
    float _984 = fma(_982, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _986 = abs(_984);
    float _988 = -_986;
    float _990 = _988 + 1.0;
    int _992 = as_type<int>(_990) + (-218103808);
    bool _994 = uint(_992) >= 1920991232u;
    bool _996 = !_994;
    if (!_996)
    {
        int _998;
        _73(_998, out.gl_Position, out.gl_PointSize);
    }
    int _1000 = _950;
    int _1002 = 0;
    int _1004 = _76(_1000, _1002, (*spvDescriptorSet0.support_buffer));
    int _1006 = _375;
    int _1008 = 0;
    int _1010 = _76(_1006, _1008, (*spvDescriptorSet0.support_buffer));
    float4 _1012 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1004, _1010)), 0).xyzw;
    float _1014 = _1012.x;
    float _1016 = _1012.y;
    float _1018 = _1012.z;
    float _1020 = _1012.w;
    float _1022 = floor(_316);
    float _1024 = -_1022;
    float _1026 = _316 + _1024;
    uint _1028 = as_type<uint>(half2(float2(_1020, 0.0)));
    float _1030 = -_424;
    float _1032 = _1030 + _1014;
    uint _1034 = extract_bits(_1028, 0u, 8u);
    int _1036 = int(_1034) & 255;
    uint _1038 = extract_bits(_1028, 8u, 8u);
    int _1040 = int(_1038) & 255;
    int _1042 = _1040 << 8;
    int _1044 = _1036 | _1042;
    bool _1046 = _1044 >= 32768;
    int _1048 = _1044 + (-1024);
    int _1050 = _1048;
    if (_1046)
    {
        int _1052 = ~_1044;
        int _1054 = _1052 + 33792;
        int _1056 = _1054 + 1;
        _1050 = _1056;
    }
    int _1058 = _1050;
    int _1060 = _1058 + 30719;
    float _1062 = float(_1060);
    float _1064 = fma(_1062, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1066 = -_428;
    float _1068 = _1066 + _1018;
    float _1070 = abs(_1064);
    float _1072 = -_1070;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1026, _1068, _428);
    int _1078 = as_type<int>(_1074) + (-218103808);
    bool _1080 = uint(_1078) >= 1920991232u;
    float _1082 = -_426;
    float _1084 = _1082 + _1016;
    float _1086 = fma(_1026, _1032, _424);
    float _1088 = fma(_1026, _1084, _426);
    bool _1090 = !_1080;
    if (!_1090)
    {
        int _1092;
        _73(_1092, out.gl_Position, out.gl_PointSize);
    }
    float _1094 = in.m_46.x;
    float _1096 = in.m_46.y;
    float _1098 = in.m_46.z;
    float _1100 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1102 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1104 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1106 = in.m_52.w;
    float _1108 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1100);
    float _1110 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1102);
    float _1112 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1104);
    out.m_54.x = _944;
    out.m_54.y = _946;
    float _1114 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1108);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1126 = _1124 != 0;
    float _1128 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1130 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1132 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1098 * 2.0;
    float _1136 = _1096 * 2.0;
    float _1138 = _1094 * 2.0;
    float _1140 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1142 = floor(_1134);
    out.m_56.w = _1106;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1132);
    float _1146 = _1096 + _1094;
    float _1148 = floor(_1136);
    float _1150 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1110);
    float _1152 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1154 = _1146 + (-1.0);
    float _1156 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1162 = log2(_1160);
    bool _1164 = _1142 > 0.0;
    float _1166 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1168 = _1142 >= 0.0;
    bool _1170 = isnan(_1142);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1096 + _1098;
    float _1180 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1166);
    int _1184 = _1176 ? 0 : 1;
    float _1186 = floor(_1138);
    float _1188 = _1178 + (-1.0);
    bool _1190 = _1148 >= 0.0;
    bool _1192 = isnan(_1148);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    int _1204 = ~_1184;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1212 = _1208;
    if (!_1164)
    {
        int _1214 = ~_1184;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1156 + _1220;
    float _1224 = _1162 * _118;
    bool _1226 = _1148 > 0.0;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1128 + _1228;
    float _1232 = 1.0 / _1202;
    float _1234 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    bool _1236 = !_1118;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1242 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1182);
    bool _1244 = _1186 > 0.0;
    float _1246 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1240);
    float _1248 = exp2(_1224);
    bool _1250 = _1186 >= 0.0;
    bool _1252 = isnan(_1186);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1158 + _1260;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1230 * _1230;
    int _1276 = _1258 ? 0 : 1;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1246);
    float _1280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1144);
    int _1282 = abs(_1238);
    float _1284 = fma(_1222, _1222, _1274);
    float _1286 = in.m_58.x;
    float _1288 = in.m_58.y;
    float _1290 = in.m_58.z;
    bool _1292 = _1278 >= 0.0;
    float _1294 = rsqrt(_1242);
    bool _1296 = !_1122;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_1262, _1262, _1284);
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = -_1248;
    float _1314 = _1312 + 1.0;
    float _1316 = float(_1282);
    float _1318 = float(_1218);
    float _1320 = rsqrt(_1280);
    float _1322 = _1310 ? _1314 : 0.0;
    int _1324 = abs(_1298);
    if (_1292)
    {
        out.m_40.x = 0.0;
    }
    if (_1292)
    {
        _742 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1326 = _742;
    if (_1272)
    {
        float _1328 = _1322 * _1232;
        _120 = _1328;
    }
    float _1330 = _120;
    float _1332 = _1316 * _1318;
    int _1334 = ~_1276;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = rsqrt(_1300);
    int _1342 = _1338;
    int _1344 = as_type<int>(_1332);
    if (!_1244)
    {
        int _1346 = ~_1276;
        int _1348 = _1346 + 1;
        _1342 = _1348;
    }
    int _1350 = _1342;
    float _1352 = _1332 * (-2.0);
    if (_1292)
    {
        float _1354 = _1326 * 5.0;
        _1344 = as_type<int>(_1354);
    }
    int _1356 = _1344;
    int _1358 = _1198 ? 0 : 1;
    float _1360 = fma(_1352, _1286, _1286);
    float _1362 = float(_1324);
    float _1364 = fma(_1180, _1352, _1180);
    float _1366 = float(_1350);
    if (_1292)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_1356);
        out.gl_Position.z = _4025;
    }
    int _1368 = ~_1358;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = _1372;
    if (!_1226)
    {
        int _1376 = ~_1358;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1362 * _1366;
    float _1384 = _1094 + (-0.5);
    bool _1386 = !_1126;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1230 * _1340;
    float _1392 = _1222 * _1340;
    if (_1292)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1394 = -_1390;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1398 = _1382 * (-2.0);
    float _1400 = -_1392;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    int _1404 = abs(_1388);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1396 + _1406;
    float _1410 = _1262 * _1340;
    float _1412 = fma(_1210, _1398, _1210);
    float _1414 = fma(_1398, _1288, _1288);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1402 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1422 = -_1410;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1426 = _1096 + (-0.5);
    float _1428 = float(_1380);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1420);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1424 + _1432;
    float _1436 = _1098 + _1094;
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1440 = rsqrt(_1234);
    float _1442 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = float(_1404);
    float _1446 = _1436 + (-1.0);
    float _1448 = fma(_1412, _1330, _1438);
    float _1450 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    bool _1452 = _1442 >= 0.0;
    float _1454 = _1444 * _1428;
    float _1456 = sqrt(_1234);
    float _1458 = _1098 + (-0.5);
    float _1460 = fma(_1364, _1330, _1450);
    float _1462 = _1454 * (-2.0);
    float _1464 = _1448 * 0.15915493667125701904296875;
    float _1466 = -_1390;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1470 = _1460 * 0.15915493667125701904296875;
    float _1472 = _1470 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1428;
    int _1478 = as_type<int>(_1458);
    if (_1452)
    {
        _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1476;
    if (_1452)
    {
        out.m_40.x = 0.0;
    }
    float _1482 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1484 = fma(_1462, _1290, _1290);
    float _1486 = fma(_1482, _1462, _1482);
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1484);
    float _1490 = _1470 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1452)
    {
        float _1494 = _1480 * 5.0;
        _1478 = as_type<int>(_1494);
    }
    int _1496 = _1478;
    float _1498 = fma(_1486, _1330, _1488);
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1496);
        out.gl_Position.z = _4244;
    }
    float _1500 = _1464 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1464 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    if (_1452)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1508 = -_1128;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = -_1392;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1516 = _1498 * 0.15915493667125701904296875;
    float _1518 = -_1156;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 * _1510;
    float _1524 = -_1158;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1468 * _1468;
    float _1530 = -_1410;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1534 = fma(_1520, _1520, _1522);
    float _1536 = _1516 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = fma(_1514, _1514, _1528);
    float _1542 = _1088 * _1320;
    float _1544 = fma(_1526, _1526, _1534);
    float _1546 = _1086 * _1440;
    float _1548 = fma(_1532, _1532, _1540);
    float _1550 = _1076 * _1294;
    float _1552 = in.m_44.x;
    float _1554 = in.m_44.y;
    float _1556 = in.m_44.z;
    float _1558 = rsqrt(_1544);
    float _1560 = _1456 * _1546;
    float _1562 = _1456 * _1542;
    float _1564 = _1456 * _1550;
    float _1566 = _1474 * _1502;
    float _1568 = _1492 * _1506;
    float _1570 = sqrt(_1548);
    float _1572 = fma(_1538, _1568, _1566);
    float _1574 = fma(_1538, _1566, _1568);
    float _1576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1560);
    float _1578 = _1520 * _1558;
    float _1580 = _1526 * _1558;
    float _1582 = _1510 * _1558;
    float _1584 = _1516 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1590 = _1578 * _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1580 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1598 = -_1590;
    float _1600 = fma(_1580, _1596, _1598);
    float _1602 = _1340 * _1570;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1562);
    float _1606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1564);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1610 = _1582 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1614 = -_1594;
    float _1616 = fma(_1582, _1612, _1614);
    float _1618 = _1600 * _1600;
    float _1620 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = -_1610;
    float _1626 = fma(_1578, _1622, _1624);
    float _1628 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1630 = fma(_1616, _1616, _1618);
    float _1632 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1634 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1636 = _1492 * _1502;
    float _1638 = fma(_1626, _1626, _1630);
    float _1640 = _1602 * _1632;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1646 = rsqrt(_1638);
    float _1648 = _1604 * _1640;
    float _1650 = _1602 * _1642;
    float _1652 = _1474 * _1506;
    float _1654 = _1506 * _1586;
    float _1656 = -_1648;
    float _1658 = _1538 * _1656;
    float _1660 = _1586 * _1648;
    float _1662 = _1502 * _1586;
    float _1664 = _1602 * _1644;
    float _1666 = _1576 * _1650;
    float _1668 = _1492 * _1660;
    float _1670 = -_1636;
    float _1672 = fma(_1538, _1652, _1670);
    float _1674 = -_1652;
    float _1676 = fma(_1538, _1636, _1674);
    float _1678 = _1606 * _1664;
    float _1680 = fma(_1572, _1666, _1668);
    float _1682 = fma(_1654, _1666, _1658);
    float _1684 = _1600 * _1646;
    float _1686 = _1616 * _1646;
    float _1688 = _1626 * _1646;
    float _1690 = fma(_1676, _1678, _1680);
    float _1692 = _1580 * _1684;
    float _1694 = _1582 * _1686;
    float _1696 = _1474 * _1660;
    float _1698 = fma(_1662, _1678, _1682);
    float _1700 = -_1692;
    float _1702 = fma(_1582, _1688, _1700);
    float _1704 = -_1694;
    float _1706 = fma(_1578, _1684, _1704);
    float _1708 = fma(_1672, _1666, _1696);
    float _1710 = _1702 * _1690;
    float _1712 = _1706 * _1690;
    float _1714 = fma(_1574, _1678, _1708);
    float _1716 = fma(_1686, _1698, _1710);
    float _1718 = fma(_1688, _1698, _1712);
    float _1720 = _1578 * _1688;
    float _1722 = fma(_1578, _1714, _1716);
    float _1724 = fma(_1580, _1714, _1718);
    float _1726 = -_1720;
    float _1728 = fma(_1580, _1686, _1726);
    float _1730 = _1156 + _1722;
    float _1732 = _1158 + _1724;
    float _1734 = _1728 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1738 = _1730 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1742 = _1732 + _1740;
    float _1744 = fma(_1684, _1698, _1734);
    float _1746 = _1738 * _1738;
    float _1748 = _1742 * _1742;
    float _1750 = fma(_1582, _1714, _1744);
    float _1752 = _1746 + _1748;
    float _1754 = _1128 + _1750;
    float _1756 = sqrt(_1752);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = _1750;
    float _1762 = _1730;
    float _1764 = _1714;
    float _1766 = _1746;
    float _1768 = _1748;
    if (!_1758)
    {
        _1760 = _1730;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (!_1758)
    {
        _1762 = _1732;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1758)
    {
        _1764 = _1754;
    }
    float _1778 = _1764;
    bool _1780 = !_1758;
    float _1782 = _1778;
    if (!_1780)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1788 = _1756 + _1786;
        float _1790 = rsqrt(_1752);
        float _1792 = _1788 * _1784;
        float _1794 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1796 = _1792 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1796 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = fma(_1800, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1808 = _1790 * _1806;
        float _1810 = _1804 + (-1.0);
        float _1812 = _1742 * _1808;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = _1738 * _1808;
        float _1818 = fma(_1754, _1804, _1814);
        float _1820 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1822 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1824 = _1816 * _1816;
        float _1826 = _1812 * _1812;
        _1782 = _1818;
        _1766 = _1824;
        _1768 = _1826;
        _1772 = _1820;
        _1776 = _1822;
    }
    float _1828 = _1782;
    float _1830 = _1766;
    float _1832 = _1768;
    float _1834 = _1772;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1840 = _1828 + _1838;
    float _1842 = fma(_1840, _1840, _1830);
    float _1844 = _1842 + _1832;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1850 = isnan(_1846);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1856 = _1852 || _1854;
    float _1858 = _1842;
    if (!_1856)
    {
        _1858 = 1.0;
    }
    float _1860 = _1858;
    bool _1862 = !_1856;
    float _1864 = _1860;
    if (!_1862)
    {
        bool _1866 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1868 = isnan(_1846);
        bool _1870 = _1866 || _1868;
        bool _1872 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1874 = _1870 || _1872;
        if (!_1874)
        {
            float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1878 = _1846 + _1876;
            float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1882 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1880;
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1888 = 1.0 / _1882;
            float _1890 = _1878 * _1888;
            float _1892 = fma(_1890, _1886, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1864 = _1892;
            _1894 = true;
        }
        else
        {
            bool _1896 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1898 = isnan(_1846);
            bool _1900 = _1896 || _1898;
            bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1904 = _1900 || _1902;
            if (!_1904)
            {
                float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1908 = _1846 + _1906;
                float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1912 = _1910 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1918 = 1.0 / _1912;
                float _1920 = _1908 * _1918;
                float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1864 = _1922;
                _1894 = true;
            }
            else
            {
                _1864 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1894 = false;
    float _1924 = _1864;
    float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1928 = _1828 + _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1932 = _1834 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1936 = _1836 + _1934;
    float _1938 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1940 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = fma(_1936, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1944 = -_1390;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _1948 = -_1392;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1940);
    float _1952 = -_1410;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1942);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1960);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1964);
    float _1974 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1978 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1970);
    float _1980 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1988);
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    float _2006 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1998);
    float _2008 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2004);
    float _2014 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2016 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
    float _2018 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_60.w = _2014;
    out.gl_Position.x = _2016;
    out.gl_Position.y = _2018;
    out.gl_Position.z = _2012;
    out.gl_Position.w = _2020;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_50 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1894 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_100);
        out.gl_Position.z = _2077;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_138);
        out.gl_Position.z = _2147;
    }
    if (_130)
    {
        return out;
    }
    float _140 = in.m_44.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_46.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    int _292 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _294 = _292;
    int _296 = 0;
    int _298 = _75(_294, _296, (*spvDescriptorSet0.support_buffer));
    float _300 = in.m_46.x;
    float _302 = in.m_46.y;
    float _304 = in.m_46.z;
    float _306 = _118 + _304;
    float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _310 = float(_298);
    int _312 = abs(_298);
    bool _314 = _298 == 0;
    float _316 = _308 * _310;
    float _318 = float(uint(_312));
    float _320 = trunc(_316);
    int _322 = int(_320);
    float _324 = 1.0 / _318;
    int _326 = abs(_322);
    uint _329 = uint(int(uint(_322) >> uint(31)));
    float _331 = float(uint(_326));
    int _333 = ~int(_329);
    int _335 = _333 + 1;
    int _337 = as_type<int>(_324) + (-2);
    float _339 = as_type<float>(_337) * _331;
    float _341 = trunc(_339);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = ~int(_345);
    int _349 = _347 + 1;
    int _351 = _349 * _312;
    int _353 = _351 + _326;
    float _355 = float(uint(_353));
    float _357 = as_type<float>(_337) * _355;
    float _359 = in.m_48.z;
    float _361 = trunc(_357);
    float _363 = precise::max(_361, 0.0);
    uint _365 = uint(_363);
    int _367 = int(_345) + int(_365);
    int _369 = ~_367;
    int _371 = _369 + 1;
    float _373 = trunc(_359);
    int _375 = int(_373);
    int _377 = _371 * _312;
    int _379 = _377 + _326;
    bool _381 = uint(_379) >= uint(_312);
    bool _383 = !_381;
    int _385 = _383 ? 0 : (-1);
    int _387 = ~_367;
    int _389 = _387 + _385;
    int _391 = _389 + 1;
    int _393 = _391 * _312;
    int _395 = _393 + _326;
    int _397 = _395 ^ _335;
    int _399 = ~_335;
    int _401 = _399 + _397;
    int _403 = _401 + 1;
    bool _405 = !_314;
    int _407 = _405 ? _403 : (-1);
    int _409 = _407;
    int _411 = 0;
    int _413 = _76(_409, _411, (*spvDescriptorSet0.support_buffer));
    int _415 = _375;
    int _417 = 0;
    int _419 = _76(_415, _417, (*spvDescriptorSet0.support_buffer));
    float4 _422 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_413, _419)), 0).xyzw;
    float _424 = _422.x;
    float _426 = _422.y;
    float _428 = _422.z;
    float _430 = _422.w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _434 = _290 + _432;
    float _436 = in.m_48.y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _440 = _438 != 0;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _454;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _460 = _458 != 0;
    float _462 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[79].z, _452);
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _472;
    float _476 = 0.0;
    float _478 = _436;
    if (_440)
    {
        float _480 = in.m_46.x;
        _476 = _480;
    }
    float _482 = _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = _302 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _488 = 1.0 / _456;
    float _490 = _300 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _302 > 0.5;
    bool _494 = _492 && _460;
    float _496 = in.m_48.x;
    float _498 = -_470;
    float _500 = fma(_490, 2.0, _498);
    float _502 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[79].x, _462);
    float _504 = 1.0 / _450;
    float _506 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _508 = _502 * (-0.15915493667125701904296875);
    float _510 = 1.0 / _468;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _512;
    bool _516 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _518 = isnan(_290);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _528;
    bool _532 = _482 > 0.5;
    bool _534 = _532 && _440;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _538 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _540 = 1.0 / _474;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _544 = _290 + _542;
    float _546 = fma(_486, -2.0, _536);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _290 + _550;
    float _554 = _544 * _488;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _290 + _556;
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[78].w, _548);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _290 + _562;
    float _566 = _552 * _464;
    float _568 = _558 * _504;
    float _570 = _564 * _510;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _580;
    float _584 = _434 * _540;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = fma(_574, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = fma(_578, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_582, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _616 = fma(_602, _554, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _618 = fma(_606, _554, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _620 = fma(_610, _554, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _634 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _636 = isnan(_290);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = fma(_614, _568, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_598, _568, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _652 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _654 = isnan(_290);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = fma(_624, _570, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _666 = fma(_628, _570, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _668 = fma(_632, _570, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _670 = -_644;
    float _672 = _670 + 1.0;
    float _674 = -_662;
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _678;
    bool _682 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_290);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _662 * _672;
    float _696 = fma(_514, _584, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _698 = _526 * _676;
    float _700 = -_526;
    float _702 = _700 + 1.0;
    float _704 = fma(_530, _584, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _706 = fma(_680, _584, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _708 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_290);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _692 * _702;
    bool _722 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_290);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_692;
    float _736 = _734 + 1.0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _740 = _496;
    float _742 = _668;
    if (_494)
    {
        float _744 = -_436;
        float _746 = _744 + 1.0;
        _478 = _746;
    }
    float _748 = _478;
    float _750 = _732 * _736;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = fma(_506, _748, -0.5);
    float _758 = _748;
    if (_440)
    {
        _758 = _496;
    }
    float _760 = _758;
    float _762 = _718 * _754;
    float _764 = _508 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_718;
    float _770 = _768 + 1.0;
    float _772 = _760;
    if (_534)
    {
        float _774 = -_760;
        float _776 = _774 + 1.0;
        _772 = _776;
    }
    float _778 = _772;
    float _780 = _590 * _762;
    float _782 = _592 * _762;
    float _784 = _594 * _762;
    float _786 = -_118;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = _508 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _782);
    float _798 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _784);
    if (_440)
    {
        _740 = _778;
    }
    float _800 = _740;
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _804 = _407 + 1;
    float _806 = fma(_650, _750, _798);
    float _808 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _810 = fma(_802, _800, -0.5);
    float _812 = fma(_646, _750, _790);
    float _814 = fma(_620, _720, _806);
    float _816 = _766 * _756;
    float _818 = fma(_648, _750, _796);
    float _820 = fma(_616, _720, _812);
    float _822 = fma(_668, _698, _814);
    float _824 = _794 * _756;
    float _826 = -_816;
    float _828 = fma(_794, _810, _826);
    float _830 = fma(_618, _720, _818);
    float _832 = fma(_664, _698, _820);
    float _834 = fma(_766, _810, _824);
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _538);
    float _838 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _840 = fma(_666, _698, _830);
    float _842 = fma(_696, _694, _832);
    float _844 = fma(_836, _828, _788);
    int _846 = abs(_804);
    float _848 = -_838;
    float _850 = fma(_808, _834, _848);
    float _852 = fma(_704, _694, _840);
    float _854 = fma(_706, _694, _822);
    float _856 = float(uint(_846));
    float _858 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].x, _842);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].y, _852);
    float _862 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].z, _854);
    float _864 = as_type<float>(_337) * _856;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _886 = uint(int(uint(_804) >> uint(31)));
    out.m_50.x = _874;
    out.m_50.y = _882;
    out.m_50.z = _884;
    out.m_50.w = _868;
    int _888 = ~int(_886);
    int _890 = _888 + 1;
    int _892 = ~int(_880);
    int _894 = _892 + 1;
    int _896 = _894 * _312;
    int _898 = _896 + _846;
    float _900 = float(uint(_898));
    float _902 = as_type<float>(_337) * _900;
    float _904 = trunc(_902);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    int _910 = int(_880) + int(_908);
    int _912 = ~_910;
    int _914 = _912 + 1;
    int _916 = _914 * _312;
    int _918 = _916 + _846;
    bool _920 = uint(_918) >= uint(_312);
    bool _922 = !_920;
    int _924 = _922 ? 0 : (-1);
    int _926 = ~_910;
    int _928 = _926 + _924;
    int _930 = _928 + 1;
    int _932 = _930 * _312;
    int _934 = _932 + _846;
    int _936 = _934 ^ _890;
    int _938 = ~_890;
    int _940 = _938 + _936;
    int _942 = _940 + 1;
    float _944 = _844 + 0.5;
    float _946 = _850 + 0.5;
    bool _948 = !_314;
    int _950 = _948 ? _942 : (-1);
    uint _952 = as_type<uint>(half2(float2(_430, 0.0)));
    uint _954 = extract_bits(_952, 0u, 8u);
    int _956 = int(_954) & 255;
    uint _958 = extract_bits(_952, 8u, 8u);
    int _960 = int(_958) & 255;
    int _962 = _960 << 8;
    int _964 = _956 | _962;
    bool _966 = _964 >= 32768;
    int _968 = _964 + (-1024);
    int _970 = _968;
    if (_966)
    {
        int _972 = ~_964;
        int _974 = _972 + 33792;
        int _976 = _974 + 1;
        _970 = _976;
    }
    int _978 = _970;
    int _980 = _978 + 30719;
    float _982 = float(_980);
    float _984 = fma(_982, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _986 = abs(_984);
    float _988 = -_986;
    float _990 = _988 + 1.0;
    int _992 = as_type<int>(_990) + (-218103808);
    bool _994 = uint(_992) >= 1920991232u;
    bool _996 = !_994;
    if (!_996)
    {
        int _998;
        _73(_998, out.gl_Position, out.gl_PointSize);
    }
    int _1000 = _950;
    int _1002 = 0;
    int _1004 = _76(_1000, _1002, (*spvDescriptorSet0.support_buffer));
    int _1006 = _375;
    int _1008 = 0;
    int _1010 = _76(_1006, _1008, (*spvDescriptorSet0.support_buffer));
    float4 _1012 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1004, _1010)), 0).xyzw;
    float _1014 = _1012.x;
    float _1016 = _1012.y;
    float _1018 = _1012.z;
    float _1020 = _1012.w;
    float _1022 = floor(_316);
    float _1024 = -_1022;
    float _1026 = _316 + _1024;
    uint _1028 = as_type<uint>(half2(float2(_1020, 0.0)));
    float _1030 = -_424;
    float _1032 = _1030 + _1014;
    uint _1034 = extract_bits(_1028, 0u, 8u);
    int _1036 = int(_1034) & 255;
    uint _1038 = extract_bits(_1028, 8u, 8u);
    int _1040 = int(_1038) & 255;
    int _1042 = _1040 << 8;
    int _1044 = _1036 | _1042;
    bool _1046 = _1044 >= 32768;
    int _1048 = _1044 + (-1024);
    int _1050 = _1048;
    if (_1046)
    {
        int _1052 = ~_1044;
        int _1054 = _1052 + 33792;
        int _1056 = _1054 + 1;
        _1050 = _1056;
    }
    int _1058 = _1050;
    int _1060 = _1058 + 30719;
    float _1062 = float(_1060);
    float _1064 = fma(_1062, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1066 = -_428;
    float _1068 = _1066 + _1018;
    float _1070 = abs(_1064);
    float _1072 = -_1070;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1026, _1068, _428);
    int _1078 = as_type<int>(_1074) + (-218103808);
    bool _1080 = uint(_1078) >= 1920991232u;
    float _1082 = -_426;
    float _1084 = _1082 + _1016;
    float _1086 = fma(_1026, _1032, _424);
    float _1088 = fma(_1026, _1084, _426);
    bool _1090 = !_1080;
    if (!_1090)
    {
        int _1092;
        _73(_1092, out.gl_Position, out.gl_PointSize);
    }
    float _1094 = in.m_46.x;
    float _1096 = in.m_46.y;
    float _1098 = in.m_46.z;
    float _1100 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1102 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1104 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1106 = in.m_52.w;
    float _1108 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1100);
    float _1110 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1102);
    float _1112 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1104);
    out.m_54.x = _944;
    out.m_54.y = _946;
    float _1114 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1108);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1126 = _1124 != 0;
    float _1128 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1130 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1132 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1098 * 2.0;
    float _1136 = _1096 * 2.0;
    float _1138 = _1094 * 2.0;
    float _1140 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1142 = floor(_1134);
    out.m_56.w = _1106;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1132);
    float _1146 = _1096 + _1094;
    float _1148 = floor(_1136);
    float _1150 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1110);
    float _1152 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1154 = _1146 + (-1.0);
    float _1156 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1162 = log2(_1160);
    bool _1164 = _1142 > 0.0;
    float _1166 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1168 = _1142 >= 0.0;
    bool _1170 = isnan(_1142);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1096 + _1098;
    float _1180 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1166);
    int _1184 = _1176 ? 0 : 1;
    float _1186 = floor(_1138);
    float _1188 = _1178 + (-1.0);
    bool _1190 = _1148 >= 0.0;
    bool _1192 = isnan(_1148);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    int _1204 = ~_1184;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1212 = _1208;
    if (!_1164)
    {
        int _1214 = ~_1184;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1156 + _1220;
    float _1224 = _1162 * _118;
    bool _1226 = _1148 > 0.0;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1128 + _1228;
    float _1232 = 1.0 / _1202;
    float _1234 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    bool _1236 = !_1118;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1242 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1182);
    bool _1244 = _1186 > 0.0;
    float _1246 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1240);
    float _1248 = exp2(_1224);
    bool _1250 = _1186 >= 0.0;
    bool _1252 = isnan(_1186);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1158 + _1260;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1230 * _1230;
    int _1276 = _1258 ? 0 : 1;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1246);
    float _1280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1144);
    int _1282 = abs(_1238);
    float _1284 = fma(_1222, _1222, _1274);
    float _1286 = in.m_58.x;
    float _1288 = in.m_58.y;
    float _1290 = in.m_58.z;
    bool _1292 = _1278 >= 0.0;
    float _1294 = rsqrt(_1242);
    bool _1296 = !_1122;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_1262, _1262, _1284);
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = -_1248;
    float _1314 = _1312 + 1.0;
    float _1316 = float(_1282);
    float _1318 = float(_1218);
    float _1320 = rsqrt(_1280);
    float _1322 = _1310 ? _1314 : 0.0;
    int _1324 = abs(_1298);
    if (_1292)
    {
        out.m_40.x = 0.0;
    }
    if (_1292)
    {
        _742 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1326 = _742;
    if (_1272)
    {
        float _1328 = _1322 * _1232;
        _120 = _1328;
    }
    float _1330 = _120;
    float _1332 = _1316 * _1318;
    int _1334 = ~_1276;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = rsqrt(_1300);
    int _1342 = _1338;
    int _1344 = as_type<int>(_1332);
    if (!_1244)
    {
        int _1346 = ~_1276;
        int _1348 = _1346 + 1;
        _1342 = _1348;
    }
    int _1350 = _1342;
    float _1352 = _1332 * (-2.0);
    if (_1292)
    {
        float _1354 = _1326 * 5.0;
        _1344 = as_type<int>(_1354);
    }
    int _1356 = _1344;
    int _1358 = _1198 ? 0 : 1;
    float _1360 = fma(_1352, _1286, _1286);
    float _1362 = float(_1324);
    float _1364 = fma(_1180, _1352, _1180);
    float _1366 = float(_1350);
    if (_1292)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_1356);
        out.gl_Position.z = _4025;
    }
    int _1368 = ~_1358;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = _1372;
    if (!_1226)
    {
        int _1376 = ~_1358;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1362 * _1366;
    float _1384 = _1094 + (-0.5);
    bool _1386 = !_1126;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1230 * _1340;
    float _1392 = _1222 * _1340;
    if (_1292)
    {
        return out;
    }
    float _1394 = -_1390;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1398 = _1382 * (-2.0);
    float _1400 = -_1392;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    int _1404 = abs(_1388);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1396 + _1406;
    float _1410 = _1262 * _1340;
    float _1412 = fma(_1210, _1398, _1210);
    float _1414 = fma(_1398, _1288, _1288);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1402 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1422 = -_1410;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1426 = _1096 + (-0.5);
    float _1428 = float(_1380);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1420);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1424 + _1432;
    float _1436 = _1098 + _1094;
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1440 = rsqrt(_1234);
    float _1442 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = float(_1404);
    float _1446 = _1436 + (-1.0);
    float _1448 = fma(_1412, _1330, _1438);
    float _1450 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    bool _1452 = _1442 >= 0.0;
    float _1454 = _1444 * _1428;
    float _1456 = sqrt(_1234);
    float _1458 = _1098 + (-0.5);
    float _1460 = fma(_1364, _1330, _1450);
    float _1462 = _1454 * (-2.0);
    float _1464 = _1448 * 0.15915493667125701904296875;
    float _1466 = -_1390;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1470 = _1460 * 0.15915493667125701904296875;
    float _1472 = _1470 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1428;
    int _1478 = as_type<int>(_1458);
    if (_1452)
    {
        _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1476;
    if (_1452)
    {
        out.m_40.x = 0.0;
    }
    float _1482 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1484 = fma(_1462, _1290, _1290);
    float _1486 = fma(_1482, _1462, _1482);
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1484);
    float _1490 = _1470 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1452)
    {
        float _1494 = _1480 * 5.0;
        _1478 = as_type<int>(_1494);
    }
    int _1496 = _1478;
    float _1498 = fma(_1486, _1330, _1488);
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1496);
        out.gl_Position.z = _4244;
    }
    float _1500 = _1464 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1464 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    if (_1452)
    {
        return out;
    }
    float _1508 = -_1128;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = -_1392;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1516 = _1498 * 0.15915493667125701904296875;
    float _1518 = -_1156;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 * _1510;
    float _1524 = -_1158;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1468 * _1468;
    float _1530 = -_1410;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1534 = fma(_1520, _1520, _1522);
    float _1536 = _1516 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = fma(_1514, _1514, _1528);
    float _1542 = _1088 * _1320;
    float _1544 = fma(_1526, _1526, _1534);
    float _1546 = _1086 * _1440;
    float _1548 = fma(_1532, _1532, _1540);
    float _1550 = _1076 * _1294;
    float _1552 = in.m_44.x;
    float _1554 = in.m_44.y;
    float _1556 = in.m_44.z;
    float _1558 = rsqrt(_1544);
    float _1560 = _1456 * _1546;
    float _1562 = _1456 * _1542;
    float _1564 = _1456 * _1550;
    float _1566 = _1474 * _1502;
    float _1568 = _1492 * _1506;
    float _1570 = sqrt(_1548);
    float _1572 = fma(_1538, _1568, _1566);
    float _1574 = fma(_1538, _1566, _1568);
    float _1576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1560);
    float _1578 = _1520 * _1558;
    float _1580 = _1526 * _1558;
    float _1582 = _1510 * _1558;
    float _1584 = _1516 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1590 = _1578 * _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1580 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1598 = -_1590;
    float _1600 = fma(_1580, _1596, _1598);
    float _1602 = _1340 * _1570;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1562);
    float _1606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1564);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1610 = _1582 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1614 = -_1594;
    float _1616 = fma(_1582, _1612, _1614);
    float _1618 = _1600 * _1600;
    float _1620 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = -_1610;
    float _1626 = fma(_1578, _1622, _1624);
    float _1628 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1630 = fma(_1616, _1616, _1618);
    float _1632 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1634 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1636 = _1492 * _1502;
    float _1638 = fma(_1626, _1626, _1630);
    float _1640 = _1602 * _1632;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1646 = rsqrt(_1638);
    float _1648 = _1604 * _1640;
    float _1650 = _1602 * _1642;
    float _1652 = _1474 * _1506;
    float _1654 = _1506 * _1586;
    float _1656 = -_1648;
    float _1658 = _1538 * _1656;
    float _1660 = _1586 * _1648;
    float _1662 = _1502 * _1586;
    float _1664 = _1602 * _1644;
    float _1666 = _1576 * _1650;
    float _1668 = _1492 * _1660;
    float _1670 = -_1636;
    float _1672 = fma(_1538, _1652, _1670);
    float _1674 = -_1652;
    float _1676 = fma(_1538, _1636, _1674);
    float _1678 = _1606 * _1664;
    float _1680 = fma(_1572, _1666, _1668);
    float _1682 = fma(_1654, _1666, _1658);
    float _1684 = _1600 * _1646;
    float _1686 = _1616 * _1646;
    float _1688 = _1626 * _1646;
    float _1690 = fma(_1676, _1678, _1680);
    float _1692 = _1580 * _1684;
    float _1694 = _1582 * _1686;
    float _1696 = _1474 * _1660;
    float _1698 = fma(_1662, _1678, _1682);
    float _1700 = -_1692;
    float _1702 = fma(_1582, _1688, _1700);
    float _1704 = -_1694;
    float _1706 = fma(_1578, _1684, _1704);
    float _1708 = fma(_1672, _1666, _1696);
    float _1710 = _1702 * _1690;
    float _1712 = _1706 * _1690;
    float _1714 = fma(_1574, _1678, _1708);
    float _1716 = fma(_1686, _1698, _1710);
    float _1718 = fma(_1688, _1698, _1712);
    float _1720 = _1578 * _1688;
    float _1722 = fma(_1578, _1714, _1716);
    float _1724 = fma(_1580, _1714, _1718);
    float _1726 = -_1720;
    float _1728 = fma(_1580, _1686, _1726);
    float _1730 = _1156 + _1722;
    float _1732 = _1158 + _1724;
    float _1734 = _1728 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1738 = _1730 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1742 = _1732 + _1740;
    float _1744 = fma(_1684, _1698, _1734);
    float _1746 = _1738 * _1738;
    float _1748 = _1742 * _1742;
    float _1750 = fma(_1582, _1714, _1744);
    float _1752 = _1746 + _1748;
    float _1754 = _1128 + _1750;
    float _1756 = sqrt(_1752);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = _1750;
    float _1762 = _1730;
    float _1764 = _1714;
    float _1766 = _1746;
    float _1768 = _1748;
    if (!_1758)
    {
        _1760 = _1730;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (!_1758)
    {
        _1762 = _1732;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1758)
    {
        _1764 = _1754;
    }
    float _1778 = _1764;
    bool _1780 = !_1758;
    float _1782 = _1778;
    if (!_1780)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1788 = _1756 + _1786;
        float _1790 = rsqrt(_1752);
        float _1792 = _1788 * _1784;
        float _1794 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1796 = _1792 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1796 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = fma(_1800, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1808 = _1790 * _1806;
        float _1810 = _1804 + (-1.0);
        float _1812 = _1742 * _1808;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = _1738 * _1808;
        float _1818 = fma(_1754, _1804, _1814);
        float _1820 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1822 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1824 = _1816 * _1816;
        float _1826 = _1812 * _1812;
        _1782 = _1818;
        _1766 = _1824;
        _1768 = _1826;
        _1772 = _1820;
        _1776 = _1822;
    }
    float _1828 = _1782;
    float _1830 = _1766;
    float _1832 = _1768;
    float _1834 = _1772;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1840 = _1828 + _1838;
    float _1842 = fma(_1840, _1840, _1830);
    float _1844 = _1842 + _1832;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1850 = isnan(_1846);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1856 = _1852 || _1854;
    float _1858 = _1842;
    if (!_1856)
    {
        _1858 = 1.0;
    }
    float _1860 = _1858;
    bool _1862 = !_1856;
    float _1864 = _1860;
    if (!_1862)
    {
        bool _1866 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1868 = isnan(_1846);
        bool _1870 = _1866 || _1868;
        bool _1872 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1874 = _1870 || _1872;
        if (!_1874)
        {
            float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1878 = _1846 + _1876;
            float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1882 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1880;
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1888 = 1.0 / _1882;
            float _1890 = _1878 * _1888;
            float _1892 = fma(_1890, _1886, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1864 = _1892;
            _1894 = true;
        }
        else
        {
            bool _1896 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1898 = isnan(_1846);
            bool _1900 = _1896 || _1898;
            bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1904 = _1900 || _1902;
            if (!_1904)
            {
                float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1908 = _1846 + _1906;
                float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1912 = _1910 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1918 = 1.0 / _1912;
                float _1920 = _1908 * _1918;
                float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1864 = _1922;
                _1894 = true;
            }
            else
            {
                _1864 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1894 = false;
    float _1924 = _1864;
    float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1928 = _1828 + _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1932 = _1834 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1936 = _1836 + _1934;
    float _1938 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1940 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = fma(_1936, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1944 = -_1390;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _1948 = -_1392;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1940);
    float _1952 = -_1410;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1942);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1960);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1964);
    float _1974 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1978 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1970);
    float _1980 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1988);
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    float _2006 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1998);
    float _2008 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2004);
    float _2014 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2016 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
    float _2018 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_60.w = _2014;
    out.gl_Position.x = _2016;
    out.gl_Position.y = _2018;
    out.gl_Position.z = _2012;
    out.gl_Position.w = _2020;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_40 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1894 = false;
    bool _282 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_37.w;
    float _82 = trunc(_80);
    int _84 = int(_82);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _92 = _90;
    float _94 = _92;
    if (!_88)
    {
        out.m_40.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _92 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_100);
        out.gl_Position.z = _2077;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_42.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _120 = _118;
    if (_114)
    {
        float _122 = float(_84);
        _94 = _122;
    }
    float _124 = _94;
    bool _126 = _118 >= _124;
    bool _128 = !_114;
    bool _130 = _126 || _128;
    float _132 = _124;
    if (_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    if (_130)
    {
        out.m_40.x = 0.0;
    }
    if (_130)
    {
        float _136 = _134 * 5.0;
        _102 = as_type<int>(_136);
    }
    int _138 = _102;
    if (_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2147 = as_type<float>(_138);
        out.gl_Position.z = _2147;
    }
    if (_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_44.w;
    float _142 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _246 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _250 = fma(_240, _154, _244);
    float _252 = fma(_240, _156, _246);
    float _254 = fma(_240, _158, _248);
    float _256 = fma(_250, _140, _160);
    float _258 = fma(_252, _140, _162);
    float _260 = fma(_254, _140, _164);
    bool _262 = !_242;
    float _280;
    if (!_262)
    {
        float _264 = in.m_46.x;
        float _266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _268 = _264 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _270 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[11].x, _118);
        float _272 = _270 * _266;
        float _274 = floor(_272);
        float _276 = -_274;
        float _278 = _272 + _276;
        _280 = _278;
        _282 = true;
    }
    else
    {
        float _284 = float(_84);
        float _286 = 1.0 / _284;
        float _288 = _118 * _286;
        _280 = _288;
    }
    _282 = false;
    float _290 = _280;
    int _292 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _294 = _292;
    int _296 = 0;
    int _298 = _75(_294, _296, (*spvDescriptorSet0.support_buffer));
    float _300 = in.m_46.x;
    float _302 = in.m_46.y;
    float _304 = in.m_46.z;
    float _306 = _118 + _304;
    float _308 = _306 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _310 = float(_298);
    int _312 = abs(_298);
    bool _314 = _298 == 0;
    float _316 = _308 * _310;
    float _318 = float(uint(_312));
    float _320 = trunc(_316);
    int _322 = int(_320);
    float _324 = 1.0 / _318;
    int _326 = abs(_322);
    uint _329 = uint(int(uint(_322) >> uint(31)));
    float _331 = float(uint(_326));
    int _333 = ~int(_329);
    int _335 = _333 + 1;
    int _337 = as_type<int>(_324) + (-2);
    float _339 = as_type<float>(_337) * _331;
    float _341 = trunc(_339);
    float _343 = precise::max(_341, 0.0);
    uint _345 = uint(_343);
    int _347 = ~int(_345);
    int _349 = _347 + 1;
    int _351 = _349 * _312;
    int _353 = _351 + _326;
    float _355 = float(uint(_353));
    float _357 = as_type<float>(_337) * _355;
    float _359 = in.m_48.z;
    float _361 = trunc(_357);
    float _363 = precise::max(_361, 0.0);
    uint _365 = uint(_363);
    int _367 = int(_345) + int(_365);
    int _369 = ~_367;
    int _371 = _369 + 1;
    float _373 = trunc(_359);
    int _375 = int(_373);
    int _377 = _371 * _312;
    int _379 = _377 + _326;
    bool _381 = uint(_379) >= uint(_312);
    bool _383 = !_381;
    int _385 = _383 ? 0 : (-1);
    int _387 = ~_367;
    int _389 = _387 + _385;
    int _391 = _389 + 1;
    int _393 = _391 * _312;
    int _395 = _393 + _326;
    int _397 = _395 ^ _335;
    int _399 = ~_335;
    int _401 = _399 + _397;
    int _403 = _401 + 1;
    bool _405 = !_314;
    int _407 = _405 ? _403 : (-1);
    int _409 = _407;
    int _411 = 0;
    int _413 = _76(_409, _411, (*spvDescriptorSet0.support_buffer));
    int _415 = _375;
    int _417 = 0;
    int _419 = _76(_415, _417, (*spvDescriptorSet0.support_buffer));
    float4 _422 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_413, _419)), 0).xyzw;
    float _424 = _422.x;
    float _426 = _422.y;
    float _428 = _422.z;
    float _430 = _422.w;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _434 = _290 + _432;
    float _436 = in.m_48.y;
    int _438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _440 = _438 != 0;
    float _442 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _454;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _460 = _458 != 0;
    float _462 = fma(_304, (*spvDescriptorSet0.vp_c9)._m0[79].z, _452);
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _472;
    float _476 = 0.0;
    float _478 = _436;
    if (_440)
    {
        float _480 = in.m_46.x;
        _476 = _480;
    }
    float _482 = _476;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _486 = _302 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _488 = 1.0 / _456;
    float _490 = _300 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _492 = _302 > 0.5;
    bool _494 = _492 && _460;
    float _496 = in.m_48.x;
    float _498 = -_470;
    float _500 = fma(_490, 2.0, _498);
    float _502 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[79].x, _462);
    float _504 = 1.0 / _450;
    float _506 = _442 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _508 = _502 * (-0.15915493667125701904296875);
    float _510 = 1.0 / _468;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _512;
    bool _516 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _518 = isnan(_290);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _528;
    bool _532 = _482 > 0.5;
    bool _534 = _532 && _440;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _538 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[78].z, _484);
    float _540 = 1.0 / _474;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _544 = _290 + _542;
    float _546 = fma(_486, -2.0, _536);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _552 = _290 + _550;
    float _554 = _544 * _488;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _558 = _290 + _556;
    float _560 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[78].w, _548);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _564 = _290 + _562;
    float _566 = _552 * _464;
    float _568 = _558 * _504;
    float _570 = _564 * _510;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _572;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _580;
    float _584 = _434 * _540;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _588 = _586 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _590 = fma(_574, _566, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _592 = fma(_578, _566, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_582, _566, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _616 = fma(_602, _554, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _618 = fma(_606, _554, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _620 = fma(_610, _554, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _628 = _626 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    bool _634 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _636 = isnan(_290);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = fma(_614, _568, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_588, _568, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_598, _568, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _652 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _654 = isnan(_290);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = fma(_624, _570, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _666 = fma(_628, _570, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _668 = fma(_632, _570, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _670 = -_644;
    float _672 = _670 + 1.0;
    float _674 = -_662;
    float _676 = _674 + 1.0;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _678;
    bool _682 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_290);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = _662 * _672;
    float _696 = fma(_514, _584, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _698 = _526 * _676;
    float _700 = -_526;
    float _702 = _700 + 1.0;
    float _704 = fma(_530, _584, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _706 = fma(_680, _584, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    bool _708 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_290);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _692 * _702;
    bool _722 = _290 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _724 = isnan(_290);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -_692;
    float _736 = _734 + 1.0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _740 = _496;
    float _742 = _668;
    if (_494)
    {
        float _744 = -_436;
        float _746 = _744 + 1.0;
        _478 = _746;
    }
    float _748 = _478;
    float _750 = _732 * _736;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = fma(_506, _748, -0.5);
    float _758 = _748;
    if (_440)
    {
        _758 = _496;
    }
    float _760 = _758;
    float _762 = _718 * _754;
    float _764 = _508 * 6.283185482025146484375;
    float _766 = sin(_764);
    float _768 = -_718;
    float _770 = _768 + 1.0;
    float _772 = _760;
    if (_534)
    {
        float _774 = -_760;
        float _776 = _774 + 1.0;
        _772 = _776;
    }
    float _778 = _772;
    float _780 = _590 * _762;
    float _782 = _592 * _762;
    float _784 = _594 * _762;
    float _786 = -_118;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _790 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].x, _780);
    float _792 = _508 * 6.283185482025146484375;
    float _794 = cos(_792);
    float _796 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].y, _782);
    float _798 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[107].z, _784);
    if (_440)
    {
        _740 = _778;
    }
    float _800 = _740;
    float _802 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _804 = _407 + 1;
    float _806 = fma(_650, _750, _798);
    float _808 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _560);
    float _810 = fma(_802, _800, -0.5);
    float _812 = fma(_646, _750, _790);
    float _814 = fma(_620, _720, _806);
    float _816 = _766 * _756;
    float _818 = fma(_648, _750, _796);
    float _820 = fma(_616, _720, _812);
    float _822 = fma(_668, _698, _814);
    float _824 = _794 * _756;
    float _826 = -_816;
    float _828 = fma(_794, _810, _826);
    float _830 = fma(_618, _720, _818);
    float _832 = fma(_664, _698, _820);
    float _834 = fma(_766, _810, _824);
    float _836 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _538);
    float _838 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _546);
    float _840 = fma(_666, _698, _830);
    float _842 = fma(_696, _694, _832);
    float _844 = fma(_836, _828, _788);
    int _846 = abs(_804);
    float _848 = -_838;
    float _850 = fma(_808, _834, _848);
    float _852 = fma(_704, _694, _840);
    float _854 = fma(_706, _694, _822);
    float _856 = float(uint(_846));
    float _858 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].x, _842);
    float _860 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].y, _852);
    float _862 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[112].z, _854);
    float _864 = as_type<float>(_337) * _856;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _872 = _862 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = trunc(_864);
    float _878 = precise::max(_876, 0.0);
    uint _880 = uint(_878);
    float _882 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _884 = _872 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    uint _886 = uint(int(uint(_804) >> uint(31)));
    out.m_50.x = _874;
    out.m_50.y = _882;
    out.m_50.z = _884;
    out.m_50.w = _868;
    int _888 = ~int(_886);
    int _890 = _888 + 1;
    int _892 = ~int(_880);
    int _894 = _892 + 1;
    int _896 = _894 * _312;
    int _898 = _896 + _846;
    float _900 = float(uint(_898));
    float _902 = as_type<float>(_337) * _900;
    float _904 = trunc(_902);
    float _906 = precise::max(_904, 0.0);
    uint _908 = uint(_906);
    int _910 = int(_880) + int(_908);
    int _912 = ~_910;
    int _914 = _912 + 1;
    int _916 = _914 * _312;
    int _918 = _916 + _846;
    bool _920 = uint(_918) >= uint(_312);
    bool _922 = !_920;
    int _924 = _922 ? 0 : (-1);
    int _926 = ~_910;
    int _928 = _926 + _924;
    int _930 = _928 + 1;
    int _932 = _930 * _312;
    int _934 = _932 + _846;
    int _936 = _934 ^ _890;
    int _938 = ~_890;
    int _940 = _938 + _936;
    int _942 = _940 + 1;
    float _944 = _844 + 0.5;
    float _946 = _850 + 0.5;
    bool _948 = !_314;
    int _950 = _948 ? _942 : (-1);
    uint _952 = as_type<uint>(half2(float2(_430, 0.0)));
    uint _954 = extract_bits(_952, 0u, 8u);
    int _956 = int(_954) & 255;
    uint _958 = extract_bits(_952, 8u, 8u);
    int _960 = int(_958) & 255;
    int _962 = _960 << 8;
    int _964 = _956 | _962;
    bool _966 = _964 >= 32768;
    int _968 = _964 + (-1024);
    int _970 = _968;
    if (_966)
    {
        int _972 = ~_964;
        int _974 = _972 + 33792;
        int _976 = _974 + 1;
        _970 = _976;
    }
    int _978 = _970;
    int _980 = _978 + 30719;
    float _982 = float(_980);
    float _984 = fma(_982, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _986 = abs(_984);
    float _988 = -_986;
    float _990 = _988 + 1.0;
    int _992 = as_type<int>(_990) + (-218103808);
    bool _994 = uint(_992) >= 1920991232u;
    bool _996 = !_994;
    if (!_996)
    {
        int _998;
        _73(_998, out.gl_Position, out.gl_PointSize);
    }
    int _1000 = _950;
    int _1002 = 0;
    int _1004 = _76(_1000, _1002, (*spvDescriptorSet0.support_buffer));
    int _1006 = _375;
    int _1008 = 0;
    int _1010 = _76(_1006, _1008, (*spvDescriptorSet0.support_buffer));
    float4 _1012 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1004, _1010)), 0).xyzw;
    float _1014 = _1012.x;
    float _1016 = _1012.y;
    float _1018 = _1012.z;
    float _1020 = _1012.w;
    float _1022 = floor(_316);
    float _1024 = -_1022;
    float _1026 = _316 + _1024;
    uint _1028 = as_type<uint>(half2(float2(_1020, 0.0)));
    float _1030 = -_424;
    float _1032 = _1030 + _1014;
    uint _1034 = extract_bits(_1028, 0u, 8u);
    int _1036 = int(_1034) & 255;
    uint _1038 = extract_bits(_1028, 8u, 8u);
    int _1040 = int(_1038) & 255;
    int _1042 = _1040 << 8;
    int _1044 = _1036 | _1042;
    bool _1046 = _1044 >= 32768;
    int _1048 = _1044 + (-1024);
    int _1050 = _1048;
    if (_1046)
    {
        int _1052 = ~_1044;
        int _1054 = _1052 + 33792;
        int _1056 = _1054 + 1;
        _1050 = _1056;
    }
    int _1058 = _1050;
    int _1060 = _1058 + 30719;
    float _1062 = float(_1060);
    float _1064 = fma(_1062, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1066 = -_428;
    float _1068 = _1066 + _1018;
    float _1070 = abs(_1064);
    float _1072 = -_1070;
    float _1074 = _1072 + 1.0;
    float _1076 = fma(_1026, _1068, _428);
    int _1078 = as_type<int>(_1074) + (-218103808);
    bool _1080 = uint(_1078) >= 1920991232u;
    float _1082 = -_426;
    float _1084 = _1082 + _1016;
    float _1086 = fma(_1026, _1032, _424);
    float _1088 = fma(_1026, _1084, _426);
    bool _1090 = !_1080;
    if (!_1090)
    {
        int _1092;
        _73(_1092, out.gl_Position, out.gl_PointSize);
    }
    float _1094 = in.m_46.x;
    float _1096 = in.m_46.y;
    float _1098 = in.m_46.z;
    float _1100 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1102 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1104 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1106 = in.m_52.w;
    float _1108 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1100);
    float _1110 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1102);
    float _1112 = fma(_256, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1104);
    out.m_54.x = _944;
    out.m_54.y = _946;
    float _1114 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1108);
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1118 = _1116 != 0;
    int _1120 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1122 = _1120 != 0;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1126 = _1124 != 0;
    float _1128 = _1114 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1130 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1132 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1098 * 2.0;
    float _1136 = _1096 * 2.0;
    float _1138 = _1094 * 2.0;
    float _1140 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1142 = floor(_1134);
    out.m_56.w = _1106;
    float _1144 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1132);
    float _1146 = _1096 + _1094;
    float _1148 = floor(_1136);
    float _1150 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1110);
    float _1152 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1154 = _1146 + (-1.0);
    float _1156 = _1150 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1158 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1160 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1162 = log2(_1160);
    bool _1164 = _1142 > 0.0;
    float _1166 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    bool _1168 = _1142 >= 0.0;
    bool _1170 = isnan(_1142);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    float _1178 = _1096 + _1098;
    float _1180 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1166);
    int _1184 = _1176 ? 0 : 1;
    float _1186 = floor(_1138);
    float _1188 = _1178 + (-1.0);
    bool _1190 = _1148 >= 0.0;
    bool _1192 = isnan(_1148);
    bool _1194 = _1190 || _1192;
    bool _1196 = isnan(0.0);
    bool _1198 = _1194 || _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1202 = 1.0 + _1200;
    int _1204 = ~_1184;
    int _1206 = _1204 + 1;
    int _1208 = _1206 + 1;
    float _1210 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1212 = _1208;
    if (!_1164)
    {
        int _1214 = ~_1184;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1222 = _1156 + _1220;
    float _1224 = _1162 * _118;
    bool _1226 = _1148 > 0.0;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1128 + _1228;
    float _1232 = 1.0 / _1202;
    float _1234 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1140);
    bool _1236 = !_1118;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1242 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1182);
    bool _1244 = _1186 > 0.0;
    float _1246 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1240);
    float _1248 = exp2(_1224);
    bool _1250 = _1186 >= 0.0;
    bool _1252 = isnan(_1186);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1158 + _1260;
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1230 * _1230;
    int _1276 = _1258 ? 0 : 1;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1246);
    float _1280 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1144);
    int _1282 = abs(_1238);
    float _1284 = fma(_1222, _1222, _1274);
    float _1286 = in.m_58.x;
    float _1288 = in.m_58.y;
    float _1290 = in.m_58.z;
    bool _1292 = _1278 >= 0.0;
    float _1294 = rsqrt(_1242);
    bool _1296 = !_1122;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_1262, _1262, _1284);
    bool _1302 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1310 = _1306 || _1308;
    float _1312 = -_1248;
    float _1314 = _1312 + 1.0;
    float _1316 = float(_1282);
    float _1318 = float(_1218);
    float _1320 = rsqrt(_1280);
    float _1322 = _1310 ? _1314 : 0.0;
    int _1324 = abs(_1298);
    if (_1292)
    {
        out.m_40.x = 0.0;
    }
    if (_1292)
    {
        _742 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1326 = _742;
    if (_1272)
    {
        float _1328 = _1322 * _1232;
        _120 = _1328;
    }
    float _1330 = _120;
    float _1332 = _1316 * _1318;
    int _1334 = ~_1276;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = rsqrt(_1300);
    int _1342 = _1338;
    int _1344 = as_type<int>(_1332);
    if (!_1244)
    {
        int _1346 = ~_1276;
        int _1348 = _1346 + 1;
        _1342 = _1348;
    }
    int _1350 = _1342;
    float _1352 = _1332 * (-2.0);
    if (_1292)
    {
        float _1354 = _1326 * 5.0;
        _1344 = as_type<int>(_1354);
    }
    int _1356 = _1344;
    int _1358 = _1198 ? 0 : 1;
    float _1360 = fma(_1352, _1286, _1286);
    float _1362 = float(_1324);
    float _1364 = fma(_1180, _1352, _1180);
    float _1366 = float(_1350);
    if (_1292)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4025 = as_type<float>(_1356);
        out.gl_Position.z = _4025;
    }
    int _1368 = ~_1358;
    int _1370 = _1368 + 1;
    int _1372 = _1370 + 1;
    int _1374 = _1372;
    if (!_1226)
    {
        int _1376 = ~_1358;
        int _1378 = _1376 + 1;
        _1374 = _1378;
    }
    int _1380 = _1374;
    float _1382 = _1362 * _1366;
    float _1384 = _1094 + (-0.5);
    bool _1386 = !_1126;
    int _1388 = _1386 ? 0 : 1;
    float _1390 = _1230 * _1340;
    float _1392 = _1222 * _1340;
    if (_1292)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1394 = -_1390;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1128);
    float _1398 = _1382 * (-2.0);
    float _1400 = -_1392;
    float _1402 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1156);
    int _1404 = abs(_1388);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1396 + _1406;
    float _1410 = _1262 * _1340;
    float _1412 = fma(_1210, _1398, _1210);
    float _1414 = fma(_1398, _1288, _1288);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1418 = _1402 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1422 = -_1410;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    float _1426 = _1096 + (-0.5);
    float _1428 = float(_1380);
    float _1430 = fma(_1418, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1420);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1434 = _1424 + _1432;
    float _1436 = _1098 + _1094;
    float _1438 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1414);
    float _1440 = rsqrt(_1234);
    float _1442 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = float(_1404);
    float _1446 = _1436 + (-1.0);
    float _1448 = fma(_1412, _1330, _1438);
    float _1450 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    bool _1452 = _1442 >= 0.0;
    float _1454 = _1444 * _1428;
    float _1456 = sqrt(_1234);
    float _1458 = _1098 + (-0.5);
    float _1460 = fma(_1364, _1330, _1450);
    float _1462 = _1454 * (-2.0);
    float _1464 = _1448 * 0.15915493667125701904296875;
    float _1466 = -_1390;
    float _1468 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1470 = _1460 * 0.15915493667125701904296875;
    float _1472 = _1470 * 6.283185482025146484375;
    float _1474 = sin(_1472);
    float _1476 = _1428;
    int _1478 = as_type<int>(_1458);
    if (_1452)
    {
        _1476 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1480 = _1476;
    if (_1452)
    {
        out.m_40.x = 0.0;
    }
    float _1482 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1484 = fma(_1462, _1290, _1290);
    float _1486 = fma(_1482, _1462, _1482);
    float _1488 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1484);
    float _1490 = _1470 * 6.283185482025146484375;
    float _1492 = cos(_1490);
    if (_1452)
    {
        float _1494 = _1480 * 5.0;
        _1478 = as_type<int>(_1494);
    }
    int _1496 = _1478;
    float _1498 = fma(_1486, _1330, _1488);
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4244 = as_type<float>(_1496);
        out.gl_Position.z = _4244;
    }
    float _1500 = _1464 * 6.283185482025146484375;
    float _1502 = sin(_1500);
    float _1504 = _1464 * 6.283185482025146484375;
    float _1506 = cos(_1504);
    if (_1452)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1508 = -_1128;
    float _1510 = _1508 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = -_1392;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1516 = _1498 * 0.15915493667125701904296875;
    float _1518 = -_1156;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1522 = _1510 * _1510;
    float _1524 = -_1158;
    float _1526 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1528 = _1468 * _1468;
    float _1530 = -_1410;
    float _1532 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1534 = fma(_1520, _1520, _1522);
    float _1536 = _1516 * 6.283185482025146484375;
    float _1538 = sin(_1536);
    float _1540 = fma(_1514, _1514, _1528);
    float _1542 = _1088 * _1320;
    float _1544 = fma(_1526, _1526, _1534);
    float _1546 = _1086 * _1440;
    float _1548 = fma(_1532, _1532, _1540);
    float _1550 = _1076 * _1294;
    float _1552 = in.m_44.x;
    float _1554 = in.m_44.y;
    float _1556 = in.m_44.z;
    float _1558 = rsqrt(_1544);
    float _1560 = _1456 * _1546;
    float _1562 = _1456 * _1542;
    float _1564 = _1456 * _1550;
    float _1566 = _1474 * _1502;
    float _1568 = _1492 * _1506;
    float _1570 = sqrt(_1548);
    float _1572 = fma(_1538, _1568, _1566);
    float _1574 = fma(_1538, _1566, _1568);
    float _1576 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1560);
    float _1578 = _1520 * _1558;
    float _1580 = _1526 * _1558;
    float _1582 = _1510 * _1558;
    float _1584 = _1516 * 6.283185482025146484375;
    float _1586 = cos(_1584);
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1590 = _1578 * _1588;
    float _1592 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1594 = _1580 * _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1598 = -_1590;
    float _1600 = fma(_1580, _1596, _1598);
    float _1602 = _1340 * _1570;
    float _1604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1562);
    float _1606 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1564);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1610 = _1582 * _1608;
    float _1612 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1614 = -_1594;
    float _1616 = fma(_1582, _1612, _1614);
    float _1618 = _1600 * _1600;
    float _1620 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = -_1610;
    float _1626 = fma(_1578, _1622, _1624);
    float _1628 = _1556 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1630 = fma(_1616, _1616, _1618);
    float _1632 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1634 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1636 = _1492 * _1502;
    float _1638 = fma(_1626, _1626, _1630);
    float _1640 = _1602 * _1632;
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1646 = rsqrt(_1638);
    float _1648 = _1604 * _1640;
    float _1650 = _1602 * _1642;
    float _1652 = _1474 * _1506;
    float _1654 = _1506 * _1586;
    float _1656 = -_1648;
    float _1658 = _1538 * _1656;
    float _1660 = _1586 * _1648;
    float _1662 = _1502 * _1586;
    float _1664 = _1602 * _1644;
    float _1666 = _1576 * _1650;
    float _1668 = _1492 * _1660;
    float _1670 = -_1636;
    float _1672 = fma(_1538, _1652, _1670);
    float _1674 = -_1652;
    float _1676 = fma(_1538, _1636, _1674);
    float _1678 = _1606 * _1664;
    float _1680 = fma(_1572, _1666, _1668);
    float _1682 = fma(_1654, _1666, _1658);
    float _1684 = _1600 * _1646;
    float _1686 = _1616 * _1646;
    float _1688 = _1626 * _1646;
    float _1690 = fma(_1676, _1678, _1680);
    float _1692 = _1580 * _1684;
    float _1694 = _1582 * _1686;
    float _1696 = _1474 * _1660;
    float _1698 = fma(_1662, _1678, _1682);
    float _1700 = -_1692;
    float _1702 = fma(_1582, _1688, _1700);
    float _1704 = -_1694;
    float _1706 = fma(_1578, _1684, _1704);
    float _1708 = fma(_1672, _1666, _1696);
    float _1710 = _1702 * _1690;
    float _1712 = _1706 * _1690;
    float _1714 = fma(_1574, _1678, _1708);
    float _1716 = fma(_1686, _1698, _1710);
    float _1718 = fma(_1688, _1698, _1712);
    float _1720 = _1578 * _1688;
    float _1722 = fma(_1578, _1714, _1716);
    float _1724 = fma(_1580, _1714, _1718);
    float _1726 = -_1720;
    float _1728 = fma(_1580, _1686, _1726);
    float _1730 = _1156 + _1722;
    float _1732 = _1158 + _1724;
    float _1734 = _1728 * _1690;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1738 = _1730 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1742 = _1732 + _1740;
    float _1744 = fma(_1684, _1698, _1734);
    float _1746 = _1738 * _1738;
    float _1748 = _1742 * _1742;
    float _1750 = fma(_1582, _1714, _1744);
    float _1752 = _1746 + _1748;
    float _1754 = _1128 + _1750;
    float _1756 = sqrt(_1752);
    bool _1758 = _1756 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1760 = _1750;
    float _1762 = _1730;
    float _1764 = _1714;
    float _1766 = _1746;
    float _1768 = _1748;
    if (!_1758)
    {
        _1760 = _1730;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (!_1758)
    {
        _1762 = _1732;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1758)
    {
        _1764 = _1754;
    }
    float _1778 = _1764;
    bool _1780 = !_1758;
    float _1782 = _1778;
    if (!_1780)
    {
        float _1784 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1786 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1788 = _1756 + _1786;
        float _1790 = rsqrt(_1752);
        float _1792 = _1788 * _1784;
        float _1794 = _1754 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1796 = _1792 * 0.15915493667125701904296875;
        float _1798 = _1796 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1796 * 6.283185482025146484375;
        float _1804 = cos(_1802);
        float _1806 = fma(_1800, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1808 = _1790 * _1806;
        float _1810 = _1804 + (-1.0);
        float _1812 = _1742 * _1808;
        float _1814 = _1810 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1816 = _1738 * _1808;
        float _1818 = fma(_1754, _1804, _1814);
        float _1820 = _1816 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1822 = _1812 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1824 = _1816 * _1816;
        float _1826 = _1812 * _1812;
        _1782 = _1818;
        _1766 = _1824;
        _1768 = _1826;
        _1772 = _1820;
        _1776 = _1822;
    }
    float _1828 = _1782;
    float _1830 = _1766;
    float _1832 = _1768;
    float _1834 = _1772;
    float _1836 = _1776;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1840 = _1828 + _1838;
    float _1842 = fma(_1840, _1840, _1830);
    float _1844 = _1842 + _1832;
    float _1846 = sqrt(_1844);
    bool _1848 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1850 = isnan(_1846);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1856 = _1852 || _1854;
    float _1858 = _1842;
    if (!_1856)
    {
        _1858 = 1.0;
    }
    float _1860 = _1858;
    bool _1862 = !_1856;
    float _1864 = _1860;
    if (!_1862)
    {
        bool _1866 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1868 = isnan(_1846);
        bool _1870 = _1866 || _1868;
        bool _1872 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1874 = _1870 || _1872;
        if (!_1874)
        {
            float _1876 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1878 = _1846 + _1876;
            float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1882 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1880;
            float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1888 = 1.0 / _1882;
            float _1890 = _1878 * _1888;
            float _1892 = fma(_1890, _1886, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1864 = _1892;
            _1894 = true;
        }
        else
        {
            bool _1896 = _1846 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1898 = isnan(_1846);
            bool _1900 = _1896 || _1898;
            bool _1902 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1904 = _1900 || _1902;
            if (!_1904)
            {
                float _1906 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1908 = _1846 + _1906;
                float _1910 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1912 = _1910 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1914 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1916 = _1914 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1918 = 1.0 / _1912;
                float _1920 = _1908 * _1918;
                float _1922 = fma(_1920, _1916, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1864 = _1922;
                _1894 = true;
            }
            else
            {
                _1864 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1894 = false;
    float _1924 = _1864;
    float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1928 = _1828 + _1926;
    float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1932 = _1834 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1936 = _1836 + _1934;
    float _1938 = fma(_1928, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1940 = fma(_1932, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1942 = fma(_1936, _1924, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    out.m_40.x = 1.0;
    float _1944 = -_1390;
    float _1946 = fma(_1944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1938);
    float _1948 = -_1392;
    float _1950 = fma(_1948, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1940);
    float _1952 = -_1410;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1942);
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1958 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1960 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1956);
    float _1966 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1958);
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1960);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1962);
    float _1972 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1964);
    float _1974 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1966);
    float _1976 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1978 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1970);
    float _1980 = _1972 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1982 = _1974 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1984 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1988 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1990 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1992 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1994 = _1980 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1996 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1988);
    float _1998 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1990);
    float _2000 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1992);
    float _2002 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1994);
    float _2004 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1996);
    float _2006 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1998);
    float _2008 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2010 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2002);
    float _2012 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2004);
    float _2014 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2016 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2006);
    float _2018 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2008);
    float _2020 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2010);
    out.m_60.w = _2014;
    out.gl_Position.x = _2016;
    out.gl_Position.y = _2018;
    out.gl_Position.z = _2012;
    out.gl_Position.w = _2020;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_50.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_50.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_50.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_50.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_40.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_40.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_40.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_40.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

