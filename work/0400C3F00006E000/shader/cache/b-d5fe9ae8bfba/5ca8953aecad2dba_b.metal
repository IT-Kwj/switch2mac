#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

// Implementation of the GLSL mod() function, which is slightly different than Metal fmod()
template<typename Tx, typename Ty>
inline Tx mod(Tx x, Ty y)
{
    return x - y * floor(x / y);
}

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
    constant _16* fp_c3 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c5 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture3d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _51(thread const int& _4297, thread const int& _4298, constant _10& support_buffer)
{
    int _4301 = 1 + _4298;
    float _4303 = support_buffer._m5[_4301].x;
    float _4305 = abs(_4303);
    bool _4307 = _4305 == 1.0;
    if (_4307)
    {
        return _4297;
    }
    float _4309 = float(_4297);
    float _4311 = _4309 / _4305;
    int _4313 = int(_4311);
    return _4313;
}

static inline __attribute__((always_inline))
int _53(thread const int& _4335, thread const int& _4336, thread const int& _4337, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _4340 = 1 + _4336;
    float _4342 = support_buffer._m5[_4340].x;
    bool _4344 = _4342 == 1.0;
    if (_4344)
    {
        return _4335;
    }
    bool _4346 = _4342 < 0.0;
    if (_4346)
    {
        float _4348 = -_4342;
        float _4350 = float(_4335);
        float _4352 = _4350 * _4348;
        float _4354 = gl_FragCoord.x;
        float _4356 = gl_FragCoord.y;
        float _4358 = (_4337 != 0) ? _4356 : _4354;
        float _4360 = mod(_4358, _4348);
        float _4362 = _4352 + _4360;
        int _4364 = int(_4362);
        return _4364;
    }
    float _4366 = float(_4335);
    float _4368 = _4366 * _4342;
    int _4370 = int(_4368);
    return _4370;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1607 = false;
    bool _1237 = false;
    bool _879 = false;
    bool _527 = false;
    int _56 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _58 = _56;
    int _60 = 0;
    int _62 = _51(_58, _60, (*spvDescriptorSet0.support_buffer));
    int _64 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _66 = _64;
    int _68 = 0;
    int _70 = _51(_66, _68, (*spvDescriptorSet0.support_buffer));
    float _73 = gl_FragCoord.w;
    float _75 = in.m_42.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_42.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = float(_70);
    float _95 = float(_62);
    float _97 = fma(_89, _93, -0.4999000132083892822265625);
    float _99 = fma(_91, _95, -0.4999000132083892822265625);
    float _101 = floor(_97);
    int _103 = int(_101);
    float _105 = floor(_99);
    int _107 = int(_105);
    int _109 = _103 + 1;
    int _111 = _107;
    int _113 = 1;
    int _115 = 0;
    int _117 = _53(_111, _113, _115, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _119 = _103;
    int _121 = 1;
    int _123 = 1;
    int _125 = _53(_119, _121, _123, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _127 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_117, _125)), 0).x;
    int _129 = _107;
    int _131 = 0;
    int _133 = 0;
    int _135 = _53(_129, _131, _133, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _137 = _103;
    int _139 = 0;
    int _141 = 1;
    int _143 = _53(_137, _139, _141, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _146 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_135, _143)), 0).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    int _156 = _107;
    int _158 = 1;
    int _160 = 0;
    int _162 = _53(_156, _158, _160, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _164 = _109;
    int _166 = 1;
    int _168 = 1;
    int _170 = _53(_164, _166, _168, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _172 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_162, _170)), 0).x;
    int _174 = _107 + 1;
    int _176 = _174;
    int _178 = 1;
    int _180 = 0;
    int _182 = _53(_176, _178, _180, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _184 = _109;
    int _186 = 1;
    int _188 = 1;
    int _190 = _53(_184, _186, _188, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _192 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_182, _190)), 0).x;
    int _194 = _174;
    int _196 = 1;
    int _198 = 0;
    int _200 = _53(_194, _196, _198, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _202 = _103;
    int _204 = 1;
    int _206 = 1;
    int _208 = _53(_202, _204, _206, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float _210 = spvDescriptorSet0.fp_t_tcb_A.read(uint2(int2(_200, _208)), 0).x;
    int _212 = _107;
    int _214 = 0;
    int _216 = 0;
    int _218 = _53(_212, _214, _216, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _220 = _109;
    int _222 = 0;
    int _224 = 1;
    int _226 = _53(_220, _222, _224, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _228 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_218, _226)), 0).xyzw;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = _228.w;
    int _238 = _174;
    int _240 = 0;
    int _242 = 0;
    int _244 = _53(_238, _240, _242, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _246 = _109;
    int _248 = 0;
    int _250 = 1;
    int _252 = _53(_246, _248, _250, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _254 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_244, _252)), 0).xyzw;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float _262 = _254.w;
    int _264 = _174;
    int _266 = 0;
    int _268 = 0;
    int _270 = _53(_264, _266, _268, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    int _272 = _103;
    int _274 = 0;
    int _276 = 1;
    int _278 = _53(_272, _274, _276, (*spvDescriptorSet0.support_buffer), gl_FragCoord);
    float4 _280 = spvDescriptorSet0.fp_t_tcb_8.read(uint2(int2(_270, _278)), 0).xyzw;
    float _282 = _280.x;
    float _284 = _280.y;
    float _286 = _280.z;
    float _288 = _280.w;
    float _290 = floor(_99);
    float _292 = floor(_97);
    float _294 = -_290;
    float _296 = _99 + _294;
    float _298 = -_296;
    float _300 = _298 + 1.0;
    float _302 = -_292;
    float _304 = _97 + _302;
    float _306 = -_304;
    float _308 = _306 + 1.0;
    float _310 = _296 * _304;
    float _312 = _304 * _300;
    float _314 = _300 * _308;
    float _316 = _296 * _308;
    bool _320 = _127 >= 1.0;
    bool _322 = isnan(_127);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    float _330 = _99;
    float _332 = _97;
    float _334 = as_type<float>(_174);
    float _336 = _148;
    float _338 = _150;
    float _340 = _152;
    float _342 = _314;
    float _344 = _230;
    float _346 = _232;
    float _348 = _236;
    float _350 = _256;
    float _352 = _262;
    float _354 = _282;
    if (_328)
    {
        _330 = _148;
    }
    float _356 = _330;
    float _358 = _356;
    float _360 = _356;
    if (_328)
    {
        _332 = _150;
    }
    float _362 = _332;
    float _364 = _362;
    float _366 = _362;
    if (_328)
    {
        _334 = _152;
    }
    float _368 = _334;
    float _370 = _368;
    float _372 = _368;
    if (!_328)
    {
        bool _374 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _376 = isnan(0.0);
        bool _378 = _374 || _376;
        bool _380 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _382 = _378 || _380;
        if (!_382)
        {
            float _384 = _148 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _358 = _384;
        }
        float _386 = _358;
        _360 = _386;
        if (!_382)
        {
            float _388 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _364 = _388;
        }
        float _390 = _364;
        _366 = _390;
        if (!_382)
        {
            float _392 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _370 = _392;
        }
        float _394 = _370;
        bool _396 = !_382;
        _372 = _394;
        if (!_396)
        {
            float _398 = _150 * 0.715200006961822509765625;
            float _400 = fma(_148, 0.2125999927520751953125, _398);
            float _402 = fma(_152, 0.072200000286102294921875, _400);
            float _404 = 1.0 / _402;
            float _406 = _404 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _408 = precise::clamp(_406, 0.0, 1.0);
            float _410 = fma(_408, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _412 = _148 * _410;
            float _414 = _150 * _410;
            float _416 = _152 * _410;
            _360 = _412;
            _366 = _414;
            _372 = _416;
        }
    }
    float _418 = _360;
    float _420 = _366;
    float _422 = _372;
    float _424 = _422;
    if (_328)
    {
        _336 = _418;
    }
    float _426 = _336;
    float _428 = _426;
    if (_328)
    {
        _338 = _420;
    }
    float _430 = _338;
    float _432 = _430;
    if (!_328)
    {
        float _434 = _418 * 4.0;
        float _436 = _420 * 4.0;
        float _438 = _422 * 4.0;
        float _440 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _442 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _440;
        float _444 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _447 = as_type<uint>(half2(float2(_434, _436)));
        uint _449 = as_type<uint>(half2(float2(_438, 0.0)));
        float _451 = -_444;
        float _453 = fma(_127, _442, _451);
        float _455 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _457 = extract_bits(_447, 16u, 16u);
        float _459 = float(_457);
        uint _461 = extract_bits(_449, 0u, 8u);
        int _463 = int(_461) & 255;
        uint _465 = extract_bits(_449, 8u, 8u);
        int _467 = int(_465) & 255;
        int _469 = _467 << 8;
        int _471 = _463 | _469;
        float _473 = _455 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _475 = float(uint(_471));
        float _477 = 1.0 / _453;
        float _479 = fma(_475, 6.103515625e-05, -0.3125);
        float _481 = fma(_459, 6.103515625e-05, -0.3125);
        float _483 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _485 = fma(_473, _477, _483);
        float _487 = precise::max(0.0, _485);
        float _489 = _487 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _491 = _489 * (-1.44269502162933349609375);
        float _493 = exp2(_491);
        float _495 = _493 + (-0.5);
        float _497 = fma(_495, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        int _499 = int(_447) & 32767;
        float _501 = precise::max(_497, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _503 = float(uint(_499));
        float _505 = fma(_481, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _507 = _501 > 0.999000012874603271484375;
        float _509 = fma(_503, 6.103515625e-05, -0.3125);
        float _511 = fma(_479, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _513 = fma(_509, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _515 = !_507;
        _340 = _501;
        if (!_515)
        {
            float3 _2308 = float3(_513, _505, _511);
            float3 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2308, float3(0.0), isnan(_2308))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2308, float3(0.0), isnan(_2308))).xyz;
            float _521 = _519.x;
            float _523 = _519.y;
            float _525 = _519.z;
            _424 = _525;
            _428 = _521;
            _432 = _523;
            _527 = true;
        }
        else
        {
            bool _529 = _501 >= 0.001000000047497451305389404296875;
            bool _531 = isnan(_501);
            bool _533 = _529 || _531;
            bool _535 = isnan(0.001000000047497451305389404296875);
            bool _537 = _533 || _535;
            if (!_537)
            {
                float3 _2345 = float3(_513, _505, _511);
                float3 _539 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2345, float3(0.0), isnan(_2345))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2345, float3(0.0), isnan(_2345))).xyz;
                float _541 = _539.x;
                float _543 = _539.y;
                float _545 = _539.z;
                _424 = _545;
                _428 = _541;
                _432 = _543;
                _527 = true;
            }
            else
            {
                float3 _2364 = float3(_513, _505, _511);
                float3 _547 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2364, float3(0.0), isnan(_2364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2364, float3(0.0), isnan(_2364))).xyz;
                float _549 = _547.x;
                float _551 = _547.y;
                float _553 = _547.z;
                float3 _2379 = float3(_513, _505, _511);
                float3 _555 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2379, float3(0.0), isnan(_2379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2379, float3(0.0), isnan(_2379))).xyz;
                float _557 = _555.x;
                float _559 = _555.y;
                float _561 = _555.z;
                float _563 = -_549;
                float _565 = _557 + _563;
                float _567 = -_551;
                float _569 = _559 + _567;
                float _571 = -_553;
                float _573 = _561 + _571;
                float _575 = fma(_565, _501, _549);
                float _577 = fma(_569, _501, _551);
                float _579 = fma(_573, _501, _553);
                _424 = _579;
                _428 = _575;
                _432 = _577;
            }
        }
    }
    _527 = false;
    float _581 = _424;
    float _583 = _428;
    float _585 = _432;
    float _587 = _340;
    bool _589 = _172 >= 1.0;
    bool _591 = isnan(_172);
    bool _593 = _589 || _591;
    bool _595 = isnan(1.0);
    bool _597 = _593 || _595;
    float _599 = _585;
    float _601 = _587;
    float _603 = _583;
    float _605 = _583;
    float _607 = _581;
    float _609 = _583;
    float _611 = _585;
    if (_328)
    {
        _599 = _581;
    }
    float _613 = _599;
    float _615 = _613;
    if (_597)
    {
        _601 = _230;
    }
    float _617 = _601;
    float _619 = _617;
    float _621 = _617;
    if (_597)
    {
        _603 = _232;
    }
    float _623 = _603;
    float _625 = _623;
    float _627 = _623;
    if (!_328)
    {
        bool _629 = _581 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _631 = isnan(_581);
        bool _633 = _629 || _631;
        bool _635 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _637 = _633 || _635;
        bool _639 = _583 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _641 = isnan(_583);
        bool _643 = _639 || _641;
        bool _645 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _647 = _643 || _645;
        float _649 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _583, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _651 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _585, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _653 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _581, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _655 = _585 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _657 = isnan(_585);
        bool _659 = _655 || _657;
        bool _661 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _663 = _659 || _661;
        float _665 = exp2(_649);
        float _667 = exp2(_653);
        float _669 = exp2(_651);
        if (_647)
        {
            float _671 = -_665;
            float _673 = _671 + 1.0;
            _605 = _673;
        }
        float _675 = _605;
        _609 = _675;
        if (_637)
        {
            float _677 = -_667;
            float _679 = _677 + 1.0;
            _607 = _679;
        }
        float _681 = _607;
        _615 = _681;
        if (_663)
        {
            float _683 = -_669;
            float _685 = _683 + 1.0;
            _611 = _685;
        }
    }
    float _687 = _609;
    float _689 = _615;
    float _691 = _611;
    float _693 = _687;
    float _695 = _687;
    float _697 = _691;
    float _699 = _689;
    if (_597)
    {
        _693 = _234;
    }
    float _701 = _693;
    float _703 = _701;
    float _705 = _701;
    if (!_597)
    {
        bool _707 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _709 = isnan(0.0);
        bool _711 = _707 || _709;
        bool _713 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _715 = _711 || _713;
        if (!_715)
        {
            float _717 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _619 = _717;
        }
        float _719 = _619;
        _621 = _719;
        if (!_715)
        {
            float _721 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _625 = _721;
        }
        float _723 = _625;
        _627 = _723;
        if (!_715)
        {
            float _725 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _703 = _725;
        }
        float _727 = _703;
        bool _729 = !_715;
        _705 = _727;
        if (!_729)
        {
            float _731 = _232 * 0.715200006961822509765625;
            float _733 = fma(_230, 0.2125999927520751953125, _731);
            float _735 = fma(_234, 0.072200000286102294921875, _733);
            float _737 = 1.0 / _735;
            float _739 = _737 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _741 = precise::clamp(_739, 0.0, 1.0);
            float _743 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _745 = _230 * _743;
            float _747 = _232 * _743;
            float _749 = _234 * _743;
            _705 = _749;
            _621 = _745;
            _627 = _747;
        }
    }
    float _751 = _705;
    float _753 = _621;
    float _755 = _627;
    if (!_328)
    {
        float _757 = _687 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _695 = _757;
    }
    float _759 = _695;
    if (!_328)
    {
        float _761 = _691 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _697 = _761;
    }
    float _763 = _697;
    if (!_328)
    {
        float _765 = _689 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _699 = _765;
    }
    float _767 = _699;
    float _769 = _154 * _314;
    float _771 = _314 * _759;
    float _773 = _314 * _763;
    float _775 = _314 * _767;
    if (_597)
    {
        _342 = _751;
    }
    float _777 = _342;
    float _779 = _777;
    if (_597)
    {
        _344 = _753;
    }
    float _781 = _344;
    float _783 = _781;
    if (_597)
    {
        _346 = _755;
    }
    float _785 = _346;
    float _787 = _785;
    if (!_597)
    {
        float _789 = _753 * 4.0;
        float _791 = _755 * 4.0;
        float _793 = _751 * 4.0;
        float _795 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _797 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _795;
        float _799 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _801 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _803 = as_type<uint>(half2(float2(_789, _791)));
        float _805 = -_799;
        float _807 = fma(_172, _797, _805);
        float _809 = _801 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _811 = extract_bits(_803, 16u, 16u);
        float _813 = float(_811);
        uint _815 = as_type<uint>(half2(float2(_793, 0.0)));
        uint _817 = extract_bits(_815, 0u, 8u);
        int _819 = int(_817) & 255;
        uint _821 = extract_bits(_815, 8u, 8u);
        int _823 = int(_821) & 255;
        int _825 = _823 << 8;
        int _827 = _819 | _825;
        float _829 = 1.0 / _807;
        float _831 = float(uint(_827));
        float _833 = fma(_831, 6.103515625e-05, -0.3125);
        float _835 = fma(_813, 6.103515625e-05, -0.3125);
        float _837 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _839 = fma(_809, _829, _837);
        float _841 = precise::max(0.0, _839);
        float _843 = _841 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _845 = _843 * (-1.44269502162933349609375);
        float _847 = exp2(_845);
        float _849 = _847 + (-0.5);
        int _851 = int(_803) & 32767;
        float _853 = fma(_849, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _855 = float(uint(_851));
        float _857 = precise::max(_853, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _859 = fma(_855, 6.103515625e-05, -0.3125);
        bool _861 = _857 > 0.999000012874603271484375;
        float _863 = fma(_833, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _865 = fma(_835, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _867 = fma(_859, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _869 = !_861;
        if (!_869)
        {
            float3 _2866 = float3(_867, _865, _863);
            float3 _871 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2866, float3(0.0), isnan(_2866))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2866, float3(0.0), isnan(_2866))).xyz;
            float _873 = _871.x;
            float _875 = _871.y;
            float _877 = _871.z;
            _783 = _873;
            _787 = _875;
            _779 = _877;
            _879 = true;
        }
        else
        {
            bool _881 = _857 >= 0.001000000047497451305389404296875;
            bool _883 = isnan(_857);
            bool _885 = _881 || _883;
            bool _887 = isnan(0.001000000047497451305389404296875);
            bool _889 = _885 || _887;
            if (!_889)
            {
                float3 _2899 = float3(_867, _865, _863);
                float3 _891 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2899, float3(0.0), isnan(_2899))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2899, float3(0.0), isnan(_2899))).xyz;
                float _893 = _891.x;
                float _895 = _891.y;
                float _897 = _891.z;
                _783 = _893;
                _787 = _895;
                _779 = _897;
                _879 = true;
            }
            else
            {
                float3 _2918 = float3(_867, _865, _863);
                float3 _899 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2918, float3(0.0), isnan(_2918))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2918, float3(0.0), isnan(_2918))).xyz;
                float _901 = _899.x;
                float _903 = _899.y;
                float _905 = _899.z;
                float3 _2933 = float3(_867, _865, _863);
                float3 _907 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2933, float3(0.0), isnan(_2933))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2933, float3(0.0), isnan(_2933))).xyz;
                float _909 = _907.x;
                float _911 = _907.y;
                float _913 = _907.z;
                float _915 = -_901;
                float _917 = _909 + _915;
                float _919 = -_903;
                float _921 = _911 + _919;
                float _923 = -_905;
                float _925 = _913 + _923;
                float _927 = fma(_857, _917, _901);
                float _929 = fma(_857, _921, _903);
                float _931 = fma(_857, _925, _905);
                _783 = _927;
                _787 = _929;
                _779 = _931;
            }
        }
    }
    _879 = false;
    float _933 = _783;
    float _935 = _787;
    float _937 = _779;
    float _939 = fma(_236, _312, _769);
    bool _941 = _192 >= 1.0;
    bool _943 = isnan(_192);
    bool _945 = _941 || _943;
    bool _947 = isnan(1.0);
    bool _949 = _945 || _947;
    float _951 = _933;
    float _953 = _933;
    float _955 = _937;
    float _957 = _935;
    float _959 = _935;
    float _961 = _935;
    float _963 = _939;
    if (_597)
    {
        _348 = _933;
    }
    float _965 = _348;
    float _967 = _965;
    if (_597)
    {
        _951 = _937;
    }
    float _969 = _951;
    float _971 = _969;
    if (!_597)
    {
        bool _973 = _933 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _975 = isnan(_933);
        bool _977 = _973 || _975;
        bool _979 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _981 = _977 || _979;
        bool _983 = _937 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _985 = isnan(_937);
        bool _987 = _983 || _985;
        bool _989 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _991 = _987 || _989;
        float _993 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _933, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _995 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _935, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _997 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _937, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _999 = _935 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1001 = isnan(_935);
        bool _1003 = _999 || _1001;
        bool _1005 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1007 = _1003 || _1005;
        float _1009 = exp2(_993);
        float _1011 = exp2(_997);
        float _1013 = exp2(_995);
        if (_981)
        {
            float _1015 = -_1009;
            float _1017 = _1015 + 1.0;
            _953 = _1017;
        }
        float _1019 = _953;
        _967 = _1019;
        _961 = _1011;
        if (_991)
        {
            float _1021 = -_1011;
            float _1023 = _1021 + 1.0;
            _955 = _1023;
        }
        float _1025 = _955;
        if (_1007)
        {
            float _1027 = -_1013;
            float _1029 = _1027 + 1.0;
            _957 = _1029;
        }
        float _1031 = _957;
        _959 = _1031;
        _971 = _1025;
    }
    float _1033 = _967;
    float _1035 = _959;
    float _1037 = _971;
    float _1039 = _961;
    float _1041 = _1033;
    float _1043 = _1037;
    float _1045 = _1035;
    float _1047 = _1039;
    float _1049 = _1037;
    float _1051 = _1033;
    if (!_597)
    {
        float _1053 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1041 = _1053;
    }
    float _1055 = _1041;
    if (_949)
    {
        _1043 = _256;
    }
    float _1057 = _1043;
    float _1059 = _1057;
    float _1061 = _1057;
    if (!_597)
    {
        float _1063 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1045 = _1063;
    }
    float _1065 = _1045;
    if (_949)
    {
        _1047 = _258;
    }
    float _1067 = _1047;
    float _1069 = _1067;
    float _1071 = _1067;
    if (!_597)
    {
        float _1073 = _1037 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1049 = _1073;
    }
    float _1075 = _1049;
    if (_949)
    {
        _1051 = _260;
    }
    float _1077 = _1051;
    float _1079 = _1077;
    float _1081 = _1077;
    if (!_949)
    {
        bool _1083 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1085 = isnan(0.0);
        bool _1087 = _1083 || _1085;
        bool _1089 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1091 = _1087 || _1089;
        if (!_1091)
        {
            float _1093 = _256 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1059 = _1093;
        }
        float _1095 = _1059;
        _1061 = _1095;
        if (!_1091)
        {
            float _1097 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1069 = _1097;
        }
        float _1099 = _1069;
        _1071 = _1099;
        if (!_1091)
        {
            float _1101 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1079 = _1101;
        }
        float _1103 = _1079;
        bool _1105 = !_1091;
        _1081 = _1103;
        if (!_1105)
        {
            float _1107 = _258 * 0.715200006961822509765625;
            float _1109 = fma(_256, 0.2125999927520751953125, _1107);
            float _1111 = fma(_260, 0.072200000286102294921875, _1109);
            float _1113 = 1.0 / _1111;
            float _1115 = _1113 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1117 = precise::clamp(_1115, 0.0, 1.0);
            float _1119 = fma(_1117, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1121 = _256 * _1119;
            float _1123 = _258 * _1119;
            float _1125 = _260 * _1119;
            _1081 = _1125;
            _1061 = _1121;
            _1071 = _1123;
        }
    }
    float _1127 = _1081;
    float _1129 = _1061;
    float _1131 = _1071;
    float _1133 = fma(_312, _1055, _771);
    float _1135 = fma(_312, _1065, _773);
    float _1137 = fma(_312, _1075, _775);
    float _1139 = _1129;
    float _1141 = _1127;
    float _1143 = _1131;
    float _1145 = _1135;
    if (!_949)
    {
        float _1147 = _1127 * 4.0;
        float _1149 = _1129 * 4.0;
        float _1151 = _1131 * 4.0;
        float _1153 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1155 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _1153;
        float _1157 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1159 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _1161 = as_type<uint>(half2(float2(_1147, 0.0)));
        float _1163 = -_1157;
        float _1165 = fma(_192, _1155, _1163);
        float _1167 = _1159 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _1169 = as_type<uint>(half2(float2(_1149, _1151)));
        uint _1171 = extract_bits(_1161, 0u, 8u);
        int _1173 = int(_1171) & 255;
        uint _1175 = extract_bits(_1161, 8u, 8u);
        int _1177 = int(_1175) & 255;
        int _1179 = _1177 << 8;
        int _1181 = _1173 | _1179;
        float _1183 = 1.0 / _1165;
        float _1185 = float(uint(_1181));
        uint _1187 = extract_bits(_1169, 16u, 16u);
        float _1189 = float(_1187);
        float _1191 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _1193 = fma(_1167, _1183, _1191);
        float _1195 = precise::max(0.0, _1193);
        float _1197 = _1195 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        float _1199 = _1197 * (-1.44269502162933349609375);
        float _1201 = exp2(_1199);
        float _1203 = _1201 + (-0.5);
        int _1205 = int(_1169) & 32767;
        float _1207 = fma(_1203, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _1209 = float(uint(_1205));
        float _1211 = precise::max(_1207, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1213 = fma(_1189, 6.103515625e-05, -0.3125);
        float _1215 = fma(_1185, 6.103515625e-05, -0.3125);
        float _1217 = fma(_1209, 6.103515625e-05, -0.3125);
        bool _1219 = _1211 > 0.999000012874603271484375;
        float _1221 = fma(_1213, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1223 = fma(_1215, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1225 = fma(_1217, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1227 = !_1219;
        _350 = _1207;
        if (!_1227)
        {
            float3 _3422 = float3(_1225, _1221, _1223);
            float3 _1229 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3422, float3(0.0), isnan(_3422))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3422, float3(0.0), isnan(_3422))).xyz;
            float _1231 = _1229.x;
            float _1233 = _1229.y;
            float _1235 = _1229.z;
            _1139 = _1231;
            _1141 = _1235;
            _1143 = _1233;
            _1237 = true;
        }
        else
        {
            bool _1239 = _1211 >= 0.001000000047497451305389404296875;
            bool _1241 = isnan(_1211);
            bool _1243 = _1239 || _1241;
            bool _1245 = isnan(0.001000000047497451305389404296875);
            bool _1247 = _1243 || _1245;
            if (!_1247)
            {
                float3 _3455 = float3(_1225, _1221, _1223);
                float3 _1249 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3455, float3(0.0), isnan(_3455))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3455, float3(0.0), isnan(_3455))).xyz;
                float _1251 = _1249.x;
                float _1253 = _1249.y;
                float _1255 = _1249.z;
                _1139 = _1251;
                _1141 = _1255;
                _1143 = _1253;
                _1237 = true;
            }
            else
            {
                float3 _3474 = float3(_1225, _1221, _1223);
                float3 _1257 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3474, float3(0.0), isnan(_3474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3474, float3(0.0), isnan(_3474))).xyz;
                float _1259 = _1257.x;
                float _1261 = _1257.y;
                float _1263 = _1257.z;
                float3 _3489 = float3(_1225, _1221, _1223);
                float3 _1265 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3489, float3(0.0), isnan(_3489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3489, float3(0.0), isnan(_3489))).xyz;
                float _1267 = _1265.x;
                float _1269 = _1265.y;
                float _1271 = _1265.z;
                float _1273 = -_1259;
                float _1275 = _1267 + _1273;
                float _1277 = -_1261;
                float _1279 = _1269 + _1277;
                float _1281 = -_1263;
                float _1283 = _1271 + _1281;
                float _1285 = fma(_1211, _1275, _1259);
                float _1287 = fma(_1211, _1279, _1261);
                float _1289 = fma(_1211, _1283, _1263);
                _1139 = _1285;
                _1141 = _1289;
                _1143 = _1287;
                _350 = _1279;
            }
        }
    }
    _1237 = false;
    float _1291 = _1139;
    float _1293 = _1141;
    float _1295 = _1143;
    float _1297 = _350;
    float _1299 = fma(_262, _310, _939);
    bool _1301 = _210 >= 1.0;
    bool _1303 = isnan(_210);
    bool _1305 = _1301 || _1303;
    bool _1307 = isnan(1.0);
    bool _1309 = _1305 || _1307;
    float _1311 = _1293;
    float _1313 = _1297;
    float _1315 = _1291;
    float _1317 = _1295;
    float _1319 = _1293;
    float _1321 = _1293;
    if (_949)
    {
        _352 = _1291;
    }
    float _1323 = _352;
    float _1325 = _1323;
    if (_949)
    {
        _1311 = _1295;
    }
    float _1327 = _1311;
    float _1329 = _1327;
    if (_949)
    {
        _1313 = _1293;
    }
    float _1331 = _1313;
    float _1333 = _1331;
    if (!_949)
    {
        bool _1335 = _1291 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1337 = isnan(_1291);
        bool _1339 = _1335 || _1337;
        bool _1341 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1343 = _1339 || _1341;
        bool _1345 = _1295 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1347 = isnan(_1295);
        bool _1349 = _1345 || _1347;
        bool _1351 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1353 = _1349 || _1351;
        float _1355 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1291, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1357 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1295, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1359 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1293, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1361 = _1293 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1363 = isnan(_1293);
        bool _1365 = _1361 || _1363;
        bool _1367 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1369 = _1365 || _1367;
        float _1371 = exp2(_1355);
        float _1373 = exp2(_1357);
        float _1375 = exp2(_1359);
        if (_1343)
        {
            float _1377 = -_1371;
            float _1379 = _1377 + 1.0;
            _1315 = _1379;
        }
        float _1381 = _1315;
        _1325 = _1381;
        if (_1353)
        {
            float _1383 = -_1373;
            float _1385 = _1383 + 1.0;
            _1317 = _1385;
        }
        float _1387 = _1317;
        _1329 = _1387;
        _963 = _1375;
        if (_1369)
        {
            float _1389 = -_1375;
            float _1391 = _1389 + 1.0;
            _1319 = _1391;
        }
        float _1393 = _1319;
        _1333 = _1393;
        _1321 = _1393;
    }
    float _1395 = _1325;
    float _1397 = _1329;
    float _1399 = _1333;
    float _1401 = _963;
    float _1403 = _1321;
    float _1405 = _1395;
    float _1407 = _1399;
    float _1409 = _1397;
    float _1411 = _1401;
    float _1413 = _1399;
    float _1415 = _1403;
    if (!_949)
    {
        float _1417 = _1395 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1405 = _1417;
    }
    float _1419 = _1405;
    if (_1309)
    {
        _1407 = _282;
    }
    float _1421 = _1407;
    float _1423 = _1421;
    float _1425 = _1421;
    if (!_949)
    {
        float _1427 = _1397 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1409 = _1427;
    }
    float _1429 = _1409;
    if (_1309)
    {
        _1411 = _284;
    }
    float _1431 = _1411;
    float _1433 = _1431;
    float _1435 = _1431;
    if (!_949)
    {
        float _1437 = _1399 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1413 = _1437;
    }
    float _1439 = _1413;
    float _1441 = _1439;
    if (_1309)
    {
        _1415 = _286;
    }
    float _1443 = _1415;
    float _1445 = _1443;
    float _1447 = _1443;
    if (!_1309)
    {
        bool _1449 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1451 = isnan(0.0);
        bool _1453 = _1449 || _1451;
        bool _1455 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1457 = _1453 || _1455;
        if (!_1457)
        {
            float _1459 = _282 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1423 = _1459;
        }
        float _1461 = _1423;
        _1425 = _1461;
        if (!_1457)
        {
            float _1463 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1433 = _1463;
        }
        float _1465 = _1433;
        _1435 = _1465;
        if (!_1457)
        {
            float _1467 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1445 = _1467;
        }
        float _1469 = _1445;
        bool _1471 = !_1457;
        _1447 = _1469;
        if (!_1471)
        {
            float _1473 = _284 * 0.715200006961822509765625;
            float _1475 = fma(_282, 0.2125999927520751953125, _1473);
            float _1477 = fma(_286, 0.072200000286102294921875, _1475);
            float _1479 = 1.0 / _1477;
            float _1481 = _1479 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1483 = precise::clamp(_1481, 0.0, 1.0);
            float _1485 = fma(_1483, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1487 = _282 * _1485;
            float _1489 = _284 * _1485;
            float _1491 = _286 * _1485;
            _1425 = _1487;
            _1435 = _1489;
            _1447 = _1491;
        }
    }
    float _1493 = _1425;
    float _1495 = _1435;
    float _1497 = _1447;
    float _1499 = fma(_310, _1429, _1135);
    float _1501 = fma(_310, _1439, _1137);
    float _1503 = fma(_310, _1419, _1133);
    float _1505 = _1497;
    float _1507 = _1493;
    if (_1309)
    {
        _1441 = _1493;
    }
    float _1509 = _1441;
    float _1511 = _1509;
    if (_1309)
    {
        _1145 = _1495;
    }
    float _1513 = _1145;
    float _1515 = _1513;
    if (!_1309)
    {
        float _1517 = _1493 * 4.0;
        float _1519 = _1495 * 4.0;
        float _1521 = -(*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1523 = (*spvDescriptorSet0.fp_c4)._m0[0].w + _1521;
        float _1525 = (*spvDescriptorSet0.fp_c4)._m0[0].w + (*spvDescriptorSet0.fp_c4)._m0[0].z;
        float _1527 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (-2.0);
        uint _1529 = as_type<uint>(half2(float2(_1517, _1519)));
        float _1531 = -_1525;
        float _1533 = fma(_210, _1523, _1531);
        float _1535 = _1527 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
        uint _1537 = extract_bits(_1529, 16u, 16u);
        float _1539 = float(_1537);
        float _1541 = 1.0 / _1533;
        float _1543 = fma(_1539, 6.103515625e-05, -0.3125);
        float _1545 = -(*spvDescriptorSet0.fp_c4)._m0[9].y;
        float _1547 = fma(_1535, _1541, _1545);
        float _1549 = _1497 * 4.0;
        float _1551 = precise::max(0.0, _1547);
        uint _1553 = as_type<uint>(half2(float2(_1549, 0.0)));
        float _1555 = _1551 * (*spvDescriptorSet0.fp_c4)._m0[9].x;
        uint _1557 = extract_bits(_1553, 0u, 8u);
        int _1559 = int(_1557) & 255;
        uint _1561 = extract_bits(_1553, 8u, 8u);
        int _1563 = int(_1561) & 255;
        int _1565 = _1563 << 8;
        int _1567 = _1559 | _1565;
        float _1569 = _1555 * (-1.44269502162933349609375);
        float _1571 = float(uint(_1567));
        float _1573 = exp2(_1569);
        float _1575 = fma(_1571, 6.103515625e-05, -0.3125);
        float _1577 = fma(_1575, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1579 = _1573 + (-0.5);
        int _1581 = int(_1529) & 32767;
        float _1583 = fma(_1579, (*spvDescriptorSet0.fp_c4)._m0[9].z, 0.5);
        float _1585 = float(uint(_1581));
        float _1587 = precise::max(_1583, (*spvDescriptorSet0.fp_c4)._m0[5].w);
        float _1589 = fma(_1585, 6.103515625e-05, -0.3125);
        float _1591 = fma(_1543, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1593 = _1587 > 0.999000012874603271484375;
        float _1595 = fma(_1589, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1597 = !_1593;
        _1507 = as_type<float>(_1529);
        _354 = _1589;
        if (!_1597)
        {
            float3 _4000 = float3(_1595, _1591, _1577);
            float3 _1599 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4000, float3(0.0), isnan(_4000))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4000, float3(0.0), isnan(_4000))).xyz;
            float _1601 = _1599.x;
            float _1603 = _1599.y;
            float _1605 = _1599.z;
            _1511 = _1601;
            _1515 = _1603;
            _1505 = _1605;
            _1607 = true;
        }
        else
        {
            bool _1609 = _1587 >= 0.001000000047497451305389404296875;
            bool _1611 = isnan(_1587);
            bool _1613 = _1609 || _1611;
            bool _1615 = isnan(0.001000000047497451305389404296875);
            bool _1617 = _1613 || _1615;
            if (!_1617)
            {
                float3 _4033 = float3(_1595, _1591, _1577);
                float3 _1619 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4033, float3(0.0), isnan(_4033))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4033, float3(0.0), isnan(_4033))).xyz;
                float _1621 = _1619.x;
                float _1623 = _1619.y;
                float _1625 = _1619.z;
                _1511 = _1621;
                _1515 = _1623;
                _1505 = _1625;
                _1607 = true;
            }
            else
            {
                float3 _4052 = float3(_1595, _1591, _1577);
                float3 _1627 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_4052, float3(0.0), isnan(_4052))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_4052, float3(0.0), isnan(_4052))).xyz;
                float _1629 = _1627.x;
                float _1631 = _1627.y;
                float _1633 = _1627.z;
                float3 _4067 = float3(_1595, _1591, _1577);
                float3 _1635 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_4067, float3(0.0), isnan(_4067))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_4067, float3(0.0), isnan(_4067))).xyz;
                float _1637 = _1635.x;
                float _1639 = _1635.y;
                float _1641 = _1635.z;
                float _1643 = -_1629;
                float _1645 = _1637 + _1643;
                float _1647 = -_1631;
                float _1649 = _1639 + _1647;
                float _1651 = -_1633;
                float _1653 = _1641 + _1651;
                float _1655 = fma(_1587, _1645, _1629);
                float _1657 = fma(_1587, _1649, _1631);
                float _1659 = fma(_1587, _1653, _1633);
                _1511 = _1655;
                _1515 = _1657;
                _1505 = _1659;
                _1507 = _1649;
                _354 = _1645;
            }
        }
    }
    _1607 = false;
    float _1661 = _1511;
    float _1663 = _1515;
    float _1665 = _1505;
    float _1667 = _1507;
    float _1669 = _354;
    float _1671 = _1667;
    float _1673 = _1669;
    float _1675 = _1663;
    float _1677 = _1665;
    float _1679 = _1661;
    if (_1309)
    {
        _1671 = _1663;
    }
    float _1681 = _1671;
    float _1683 = _1681;
    if (_1309)
    {
        _1673 = _1665;
    }
    float _1685 = _1673;
    float _1687 = _1685;
    if (!_1309)
    {
        bool _1689 = _1663 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1691 = isnan(_1663);
        bool _1693 = _1689 || _1691;
        bool _1695 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1697 = _1693 || _1695;
        bool _1699 = _1665 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1701 = isnan(_1665);
        bool _1703 = _1699 || _1701;
        bool _1705 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1707 = _1703 || _1705;
        float _1709 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1663, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1711 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1665, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1713 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1661, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1715 = _1661 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1717 = isnan(_1661);
        bool _1719 = _1715 || _1717;
        bool _1721 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1723 = _1719 || _1721;
        float _1725 = exp2(_1709);
        float _1727 = exp2(_1711);
        float _1729 = exp2(_1713);
        if (_1697)
        {
            float _1731 = -_1725;
            float _1733 = _1731 + 1.0;
            _1675 = _1733;
        }
        float _1735 = _1675;
        if (_1707)
        {
            float _1737 = -_1727;
            float _1739 = _1737 + 1.0;
            _1677 = _1739;
        }
        float _1741 = _1677;
        _1683 = _1735;
        _1687 = _1741;
        if (_1723)
        {
            float _1743 = -_1729;
            float _1745 = _1743 + 1.0;
            _1679 = _1745;
        }
    }
    float _1747 = _1679;
    float _1749 = _1683;
    float _1751 = _1687;
    float _1753 = _1747;
    float _1755 = _1749;
    float _1757 = _1751;
    if (!_1309)
    {
        float _1759 = _1747 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1753 = _1759;
    }
    float _1761 = _1753;
    if (!_1309)
    {
        float _1763 = _1749 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1755 = _1763;
    }
    float _1765 = _1755;
    if (!_1309)
    {
        float _1767 = _1751 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1757 = _1767;
    }
    float _1769 = _1757;
    float _1771 = fma(_288, _316, _1299);
    float _1773 = fma(_316, _1761, _1503);
    float _1775 = fma(_316, _1765, _1499);
    float _1777 = fma(_316, _1769, _1501);
    out.m_45.x = _1773;
    out.m_45.y = _1775;
    out.m_45.z = _1777;
    out.m_45.w = _1771;
    return out;
}

