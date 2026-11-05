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
int _51(thread const int& _4240, thread const int& _4241, constant _10& support_buffer)
{
    int _4244 = 1 + _4241;
    float _4246 = support_buffer._m5[_4244].x;
    float _4248 = abs(_4246);
    bool _4250 = _4248 == 1.0;
    if (_4250)
    {
        return _4240;
    }
    float _4252 = float(_4240);
    float _4254 = _4252 / _4248;
    int _4256 = int(_4254);
    return _4256;
}

static inline __attribute__((always_inline))
int _53(thread const int& _4278, thread const int& _4279, thread const int& _4280, constant _10& support_buffer, thread float4& gl_FragCoord)
{
    int _4283 = 1 + _4279;
    float _4285 = support_buffer._m5[_4283].x;
    bool _4287 = _4285 == 1.0;
    if (_4287)
    {
        return _4278;
    }
    bool _4289 = _4285 < 0.0;
    if (_4289)
    {
        float _4291 = -_4285;
        float _4293 = float(_4278);
        float _4295 = _4293 * _4291;
        float _4297 = gl_FragCoord.x;
        float _4299 = gl_FragCoord.y;
        float _4301 = (_4280 != 0) ? _4299 : _4297;
        float _4303 = mod(_4301, _4291);
        float _4305 = _4295 + _4303;
        int _4307 = int(_4305);
        return _4307;
    }
    float _4309 = float(_4278);
    float _4311 = _4309 * _4285;
    int _4313 = int(_4311);
    return _4313;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _1579 = false;
    bool _1209 = false;
    bool _857 = false;
    bool _507 = false;
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
    float _310 = _304 * _300;
    float _312 = _300 * _308;
    bool _316 = _127 >= 1.0;
    bool _318 = isnan(_127);
    bool _320 = _316 || _318;
    bool _322 = isnan(1.0);
    bool _324 = _320 || _322;
    float _326 = _296 * _304;
    float _328 = _296 * _308;
    float _330 = _304;
    float _332 = _97;
    float _334 = _99;
    float _336 = _152;
    float _338 = _148;
    float _340 = _150;
    float _342 = as_type<float>(_109);
    float _344 = _172;
    float _346 = _230;
    float _348 = _312;
    float _350 = _236;
    float _352 = _192;
    float _354 = _260;
    float _356 = _256;
    float _358 = _262;
    float _360 = _210;
    float _362 = _282;
    if (_324)
    {
        _330 = _148;
    }
    float _364 = _330;
    float _366 = _364;
    float _368 = _364;
    if (_324)
    {
        _332 = _150;
    }
    float _370 = _332;
    float _372 = _370;
    float _374 = _370;
    if (_324)
    {
        _334 = _152;
    }
    float _376 = _334;
    float _378 = _376;
    float _380 = _376;
    if (!_324)
    {
        bool _382 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _384 = isnan(0.0);
        bool _386 = _382 || _384;
        bool _388 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _390 = _386 || _388;
        if (!_390)
        {
            float _392 = _148 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _366 = _392;
        }
        float _394 = _366;
        _368 = _394;
        if (!_390)
        {
            float _396 = _150 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _372 = _396;
        }
        float _398 = _372;
        _374 = _398;
        if (!_390)
        {
            float _400 = _152 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _378 = _400;
        }
        float _402 = _378;
        bool _404 = !_390;
        _380 = _402;
        if (!_404)
        {
            float _406 = _150 * 0.715200006961822509765625;
            float _408 = fma(_148, 0.2125999927520751953125, _406);
            float _410 = fma(_152, 0.072200000286102294921875, _408);
            float _412 = 1.0 / _410;
            float _414 = _412 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _416 = precise::clamp(_414, 0.0, 1.0);
            float _418 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _420 = _148 * _418;
            float _422 = _150 * _418;
            float _424 = _152 * _418;
            _380 = _424;
            _368 = _420;
            _374 = _422;
        }
    }
    float _426 = _380;
    float _428 = _368;
    float _430 = _374;
    float _432 = _426;
    if (_324)
    {
        _336 = _426;
    }
    float _434 = _336;
    float _436 = _434;
    if (_324)
    {
        _338 = _428;
    }
    float _438 = _338;
    float _440 = _438;
    if (_324)
    {
        _340 = _430;
    }
    float _442 = _340;
    float _444 = _442;
    if (!_324)
    {
        float _446 = _428 * 4.0;
        float _448 = _430 * 4.0;
        float _450 = _426 * 4.0;
        uint _453 = as_type<uint>(half2(float2(_446, _448)));
        uint _455 = as_type<uint>(half2(float2(_450, 0.0)));
        uint _457 = extract_bits(_453, 16u, 16u);
        float _459 = float(_457);
        bool _461 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _463 = extract_bits(_455, 0u, 8u);
        int _465 = int(_463) & 255;
        uint _467 = extract_bits(_455, 8u, 8u);
        int _469 = int(_467) & 255;
        int _471 = _469 << 8;
        int _473 = _465 | _471;
        int _475 = int(_453) & 32767;
        float _477 = float(uint(_473));
        float _479 = float(uint(_475));
        float _481 = fma(_477, 6.103515625e-05, -0.3125);
        float _483 = fma(_479, 6.103515625e-05, -0.3125);
        float _485 = fma(_459, 6.103515625e-05, -0.3125);
        float _487 = fma(_481, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _489 = fma(_483, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _491 = fma(_485, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _493 = !_461;
        float _495 = _481;
        _432 = _481;
        _342 = _487;
        if (!_493)
        {
            float3 _2258 = float3(_489, _491, _487);
            float3 _499 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2258, float3(0.0), isnan(_2258))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2258, float3(0.0), isnan(_2258))).xyz;
            float _501 = _499.x;
            float _503 = _499.y;
            float _505 = _499.z;
            _440 = _501;
            _436 = _505;
            _444 = _503;
            _507 = true;
        }
        else
        {
            bool _509 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _511 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _513 = _509 || _511;
            bool _515 = isnan(0.001000000047497451305389404296875);
            bool _517 = _513 || _515;
            float3 _2294 = float3(_489, _491, _487);
            float3 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2294, float3(0.0), isnan(_2294))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2294, float3(0.0), isnan(_2294))).xyz;
            float _521 = _519.x;
            float _523 = _519.y;
            float _525 = _519.z;
            float _527 = as_type<float>(_453);
            float _529 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
            float _531 = _308;
            float _533 = _521;
            float _535 = _523;
            _436 = _525;
            if (_517)
            {
                float3 _2319 = float3(_489, _491, _487);
                float3 _537 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2319, float3(0.0), isnan(_2319))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2319, float3(0.0), isnan(_2319))).xyz;
                float _539 = _537.x;
                float _541 = _537.y;
                float _543 = _537.z;
                _527 = _539;
                _529 = _541;
                _531 = _543;
            }
            float _545 = _527;
            float _547 = _529;
            float _549 = _531;
            float _551 = _545;
            float _553 = _547;
            if (_517)
            {
                float _555 = -_521;
                float _557 = _555 + _545;
                _495 = _557;
            }
            float _559 = _495;
            _432 = _559;
            if (_517)
            {
                float _561 = -_523;
                float _563 = _561 + _547;
                _551 = _563;
            }
            float _565 = _551;
            if (_517)
            {
                float _567 = -_525;
                float _569 = _567 + _549;
                _553 = _569;
            }
            float _571 = _553;
            if (_517)
            {
                float _573 = fma(_559, (*spvDescriptorSet0.fp_c4)._m0[5].z, _521);
                _533 = _573;
            }
            float _575 = _533;
            _440 = _575;
            if (_517)
            {
                float _577 = fma(_565, (*spvDescriptorSet0.fp_c4)._m0[5].z, _523);
                _535 = _577;
            }
            float _579 = _535;
            _444 = _579;
            if (_517)
            {
                float _581 = fma(_571, (*spvDescriptorSet0.fp_c4)._m0[5].z, _525);
                _436 = _581;
            }
        }
    }
    _507 = false;
    float _583 = _440;
    float _585 = _436;
    float _587 = _444;
    float _589 = _432;
    float _591 = _342;
    bool _593 = _172 >= 1.0;
    bool _595 = isnan(_172);
    bool _597 = _593 || _595;
    bool _599 = isnan(1.0);
    bool _601 = _597 || _599;
    float _603 = _587;
    float _605 = _585;
    float _607 = _589;
    float _609 = _583;
    float _611 = _585;
    float _613 = _587;
    if (_324)
    {
        _603 = _583;
    }
    float _615 = _603;
    float _617 = _615;
    if (_324)
    {
        _344 = _585;
    }
    float _619 = _344;
    float _621 = _619;
    if (_601)
    {
        _605 = _230;
    }
    float _623 = _605;
    float _625 = _623;
    float _627 = _623;
    if (_601)
    {
        _607 = _232;
    }
    float _629 = _607;
    float _631 = _629;
    float _633 = _629;
    if (!_324)
    {
        bool _635 = _583 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _637 = isnan(_583);
        bool _639 = _635 || _637;
        bool _641 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _643 = _639 || _641;
        bool _645 = _585 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _647 = isnan(_585);
        bool _649 = _645 || _647;
        bool _651 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _653 = _649 || _651;
        float _655 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _583, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _657 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _587, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _659 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _585, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _661 = _587 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _663 = isnan(_587);
        bool _665 = _661 || _663;
        bool _667 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _669 = _665 || _667;
        float _671 = exp2(_655);
        float _673 = exp2(_659);
        float _675 = exp2(_657);
        if (_643)
        {
            float _677 = -_671;
            float _679 = _677 + 1.0;
            _609 = _679;
        }
        float _681 = _609;
        _617 = _681;
        if (_653)
        {
            float _683 = -_673;
            float _685 = _683 + 1.0;
            _611 = _685;
        }
        float _687 = _611;
        _621 = _687;
        if (_669)
        {
            float _689 = -_675;
            float _691 = _689 + 1.0;
            _613 = _691;
        }
    }
    float _693 = _617;
    float _695 = _621;
    float _697 = _613;
    float _699 = _693;
    float _701 = _693;
    float _703 = _697;
    float _705 = _695;
    if (_601)
    {
        _699 = _234;
    }
    float _707 = _699;
    float _709 = _707;
    float _711 = _707;
    if (!_601)
    {
        bool _713 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _715 = isnan(0.0);
        bool _717 = _713 || _715;
        bool _719 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _721 = _717 || _719;
        if (!_721)
        {
            float _723 = _230 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _625 = _723;
        }
        float _725 = _625;
        _627 = _725;
        if (!_721)
        {
            float _727 = _232 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _631 = _727;
        }
        float _729 = _631;
        _633 = _729;
        if (!_721)
        {
            float _731 = _234 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _709 = _731;
        }
        float _733 = _709;
        bool _735 = !_721;
        _711 = _733;
        if (!_735)
        {
            float _737 = _232 * 0.715200006961822509765625;
            float _739 = fma(_230, 0.2125999927520751953125, _737);
            float _741 = fma(_234, 0.072200000286102294921875, _739);
            float _743 = 1.0 / _741;
            float _745 = _743 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _747 = precise::clamp(_745, 0.0, 1.0);
            float _749 = fma(_747, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _751 = _230 * _749;
            float _753 = _232 * _749;
            float _755 = _234 * _749;
            _711 = _755;
            _627 = _751;
            _633 = _753;
        }
    }
    float _757 = _711;
    float _759 = _627;
    float _761 = _633;
    float _763 = _761;
    float _765 = _757;
    if (!_324)
    {
        float _767 = _693 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _701 = _767;
    }
    float _769 = _701;
    if (!_324)
    {
        float _771 = _697 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _703 = _771;
    }
    float _773 = _703;
    if (!_324)
    {
        float _775 = _695 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _705 = _775;
    }
    float _777 = _705;
    float _779 = _154 * _312;
    float _781 = _312 * _769;
    float _783 = _312 * _773;
    float _785 = _312 * _777;
    float _787 = _785;
    if (_601)
    {
        _346 = _757;
    }
    float _789 = _346;
    float _791 = _789;
    if (_601)
    {
        _348 = _759;
    }
    float _793 = _348;
    float _795 = _793;
    if (!_601)
    {
        float _797 = _759 * 4.0;
        float _799 = _761 * 4.0;
        float _801 = _757 * 4.0;
        uint _803 = as_type<uint>(half2(float2(_797, _799)));
        uint _805 = as_type<uint>(half2(float2(_801, 0.0)));
        uint _807 = extract_bits(_803, 16u, 16u);
        float _809 = float(_807);
        bool _811 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _813 = extract_bits(_805, 0u, 8u);
        int _815 = int(_813) & 255;
        uint _817 = extract_bits(_805, 8u, 8u);
        int _819 = int(_817) & 255;
        int _821 = _819 << 8;
        int _823 = _815 | _821;
        int _825 = int(_803) & 32767;
        float _827 = float(uint(_823));
        float _829 = float(uint(_825));
        float _831 = fma(_827, 6.103515625e-05, -0.3125);
        float _833 = fma(_829, 6.103515625e-05, -0.3125);
        float _835 = fma(_809, 6.103515625e-05, -0.3125);
        float _837 = fma(_831, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _839 = fma(_833, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _841 = fma(_835, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _843 = !_811;
        float _845 = as_type<float>(_803);
        float _847 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        _765 = 6.103515625e-05;
        if (!_843)
        {
            float3 _2800 = float3(_839, _841, _837);
            float3 _849 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2800, float3(0.0), isnan(_2800))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2800, float3(0.0), isnan(_2800))).xyz;
            float _851 = _849.x;
            float _853 = _849.y;
            float _855 = _849.z;
            _795 = _851;
            _791 = _855;
            _763 = _853;
            _857 = true;
        }
        else
        {
            bool _859 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _861 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _863 = _859 || _861;
            bool _865 = isnan(0.001000000047497451305389404296875);
            bool _867 = _863 || _865;
            float3 _2832 = float3(_839, _841, _837);
            float3 _869 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2832, float3(0.0), isnan(_2832))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2832, float3(0.0), isnan(_2832))).xyz;
            float _871 = _869.x;
            float _873 = _869.y;
            float _875 = _869.z;
            float _877 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
            float _879 = 6.103515625e-05;
            float _881 = _591;
            float _883 = _873;
            float _885 = _871;
            _791 = _875;
            if (_867)
            {
                float3 _2855 = float3(_839, _841, _837);
                float3 _887 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2855, float3(0.0), isnan(_2855))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2855, float3(0.0), isnan(_2855))).xyz;
                float _889 = _887.x;
                float _891 = _887.y;
                float _893 = _887.z;
                _877 = _889;
                _879 = _891;
                _881 = _893;
            }
            float _895 = _877;
            float _897 = _879;
            float _899 = _881;
            float _901 = _897;
            if (_867)
            {
                float _903 = -_873;
                float _905 = _903 + _897;
                _845 = _905;
            }
            float _907 = _845;
            if (_867)
            {
                float _909 = -_871;
                float _911 = _909 + _895;
                _847 = _911;
            }
            float _913 = _847;
            if (_867)
            {
                float _915 = -_875;
                float _917 = _915 + _899;
                _901 = _917;
            }
            float _919 = _901;
            _765 = _919;
            if (_867)
            {
                float _921 = fma(_907, (*spvDescriptorSet0.fp_c4)._m0[5].z, _873);
                _883 = _921;
            }
            float _923 = _883;
            _763 = _923;
            if (_867)
            {
                float _925 = fma(_913, (*spvDescriptorSet0.fp_c4)._m0[5].z, _871);
                _885 = _925;
            }
            float _927 = _885;
            _795 = _927;
            if (_867)
            {
                float _929 = fma(_919, (*spvDescriptorSet0.fp_c4)._m0[5].z, _875);
                _791 = _929;
            }
        }
    }
    _857 = false;
    float _931 = _795;
    float _933 = _791;
    float _935 = _763;
    float _937 = _765;
    float _939 = fma(_236, _310, _779);
    bool _941 = _192 >= 1.0;
    bool _943 = isnan(_192);
    bool _945 = _941 || _943;
    bool _947 = isnan(1.0);
    bool _949 = _945 || _947;
    float _951 = _931;
    float _953 = _933;
    float _955 = _935;
    float _957 = _935;
    float _959 = _933;
    float _961 = _939;
    if (_601)
    {
        _350 = _931;
    }
    float _963 = _350;
    float _965 = _963;
    if (_601)
    {
        _352 = _933;
    }
    float _967 = _352;
    float _969 = _967;
    if (!_601)
    {
        bool _971 = _931 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _973 = isnan(_931);
        bool _975 = _971 || _973;
        bool _977 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _979 = _975 || _977;
        bool _981 = _933 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _983 = isnan(_933);
        bool _985 = _981 || _983;
        bool _987 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _989 = _985 || _987;
        float _991 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _931, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _993 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _933, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _995 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _935, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _997 = _935 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _999 = isnan(_935);
        bool _1001 = _997 || _999;
        bool _1003 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1005 = _1001 || _1003;
        float _1007 = exp2(_991);
        float _1009 = exp2(_993);
        float _1011 = exp2(_995);
        if (_979)
        {
            float _1013 = -_1007;
            float _1015 = _1013 + 1.0;
            _951 = _1015;
        }
        float _1017 = _951;
        _965 = _1017;
        _959 = _1009;
        if (_989)
        {
            float _1019 = -_1009;
            float _1021 = _1019 + 1.0;
            _953 = _1021;
        }
        float _1023 = _953;
        if (_1005)
        {
            float _1025 = -_1011;
            float _1027 = _1025 + 1.0;
            _955 = _1027;
        }
        float _1029 = _955;
        _957 = _1029;
        _969 = _1023;
    }
    float _1031 = _965;
    float _1033 = _957;
    float _1035 = _969;
    float _1037 = _959;
    float _1039 = _1031;
    float _1041 = _1037;
    float _1043 = _1033;
    float _1045 = _1033;
    float _1047 = _1035;
    float _1049 = _1035;
    if (!_601)
    {
        float _1051 = _1031 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1039 = _1051;
    }
    float _1053 = _1039;
    if (_949)
    {
        _1041 = _256;
    }
    float _1055 = _1041;
    float _1057 = _1055;
    float _1059 = _1055;
    if (!_601)
    {
        float _1061 = _1033 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1043 = _1061;
    }
    float _1063 = _1043;
    if (_949)
    {
        _1045 = _258;
    }
    float _1065 = _1045;
    float _1067 = _1065;
    float _1069 = _1065;
    if (!_601)
    {
        float _1071 = _1035 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1047 = _1071;
    }
    float _1073 = _1047;
    if (_949)
    {
        _1049 = _260;
    }
    float _1075 = _1049;
    float _1077 = _1075;
    float _1079 = _1075;
    if (!_949)
    {
        bool _1081 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1083 = isnan(0.0);
        bool _1085 = _1081 || _1083;
        bool _1087 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1089 = _1085 || _1087;
        if (!_1089)
        {
            float _1091 = _256 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1057 = _1091;
        }
        float _1093 = _1057;
        _1059 = _1093;
        if (!_1089)
        {
            float _1095 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1067 = _1095;
        }
        float _1097 = _1067;
        _1069 = _1097;
        if (!_1089)
        {
            float _1099 = _260 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1077 = _1099;
        }
        float _1101 = _1077;
        bool _1103 = !_1089;
        _1079 = _1101;
        if (!_1103)
        {
            float _1105 = _258 * 0.715200006961822509765625;
            float _1107 = fma(_256, 0.2125999927520751953125, _1105);
            float _1109 = fma(_260, 0.072200000286102294921875, _1107);
            float _1111 = 1.0 / _1109;
            float _1113 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1115 = precise::clamp(_1113, 0.0, 1.0);
            float _1117 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1119 = _256 * _1117;
            float _1121 = _258 * _1117;
            float _1123 = _260 * _1117;
            _1079 = _1123;
            _1069 = _1121;
            _1059 = _1119;
        }
    }
    float _1125 = _1079;
    float _1127 = _1069;
    float _1129 = _1059;
    float _1131 = fma(_310, _1073, _785);
    float _1133 = fma(_310, _1053, _781);
    float _1135 = fma(_310, _1063, _783);
    float _1137 = _1129;
    float _1139 = _1135;
    if (_949)
    {
        _354 = _1125;
    }
    float _1141 = _354;
    float _1143 = _1141;
    if (_949)
    {
        _787 = _1127;
    }
    float _1145 = _787;
    float _1147 = _1145;
    if (!_949)
    {
        float _1149 = _1129 * 4.0;
        float _1151 = _1127 * 4.0;
        float _1153 = _1125 * 4.0;
        uint _1155 = as_type<uint>(half2(float2(_1149, _1151)));
        uint _1157 = as_type<uint>(half2(float2(_1153, 0.0)));
        uint _1159 = extract_bits(_1155, 16u, 16u);
        float _1161 = float(_1159);
        bool _1163 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _1165 = extract_bits(_1157, 0u, 8u);
        int _1167 = int(_1165) & 255;
        uint _1169 = extract_bits(_1157, 8u, 8u);
        int _1171 = int(_1169) & 255;
        int _1173 = _1171 << 8;
        int _1175 = _1167 | _1173;
        int _1177 = int(_1155) & 32767;
        float _1179 = float(uint(_1175));
        float _1181 = float(uint(_1177));
        float _1183 = fma(_1179, 6.103515625e-05, -0.3125);
        float _1185 = fma(_1181, 6.103515625e-05, -0.3125);
        float _1187 = fma(_1161, 6.103515625e-05, -0.3125);
        float _1189 = fma(_1183, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1191 = fma(_1187, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1193 = fma(_1185, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1195 = !_1163;
        float _1197 = _1185;
        float _1199 = _1183;
        _356 = _1183;
        if (!_1195)
        {
            float3 _3342 = float3(_1193, _1191, _1189);
            float3 _1201 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3342, float3(0.0), isnan(_3342))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3342, float3(0.0), isnan(_3342))).xyz;
            float _1203 = _1201.x;
            float _1205 = _1201.y;
            float _1207 = _1201.z;
            _1143 = _1207;
            _1137 = _1203;
            _1147 = _1205;
            _1209 = true;
        }
        else
        {
            bool _1211 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _1213 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _1215 = _1211 || _1213;
            bool _1217 = isnan(0.001000000047497451305389404296875);
            bool _1219 = _1215 || _1217;
            float3 _3374 = float3(_1193, _1191, _1189);
            float3 _1221 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3374, float3(0.0), isnan(_3374))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3374, float3(0.0), isnan(_3374))).xyz;
            float _1223 = _1221.x;
            float _1225 = _1221.y;
            float _1227 = _1221.z;
            float _1229 = _1063;
            float _1231 = _937;
            float _1233 = _1187;
            float _1235 = _1223;
            float _1237 = _1225;
            _1143 = _1227;
            if (_1219)
            {
                float3 _3397 = float3(_1193, _1191, _1189);
                float3 _1239 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3397, float3(0.0), isnan(_3397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3397, float3(0.0), isnan(_3397))).xyz;
                float _1241 = _1239.x;
                float _1243 = _1239.y;
                float _1245 = _1239.z;
                _1229 = _1241;
                _1231 = _1243;
                _1233 = _1245;
            }
            float _1247 = _1229;
            float _1249 = _1231;
            float _1251 = _1233;
            float _1253 = _1251;
            if (_1219)
            {
                float _1255 = -_1223;
                float _1257 = _1255 + _1247;
                _1197 = _1257;
            }
            float _1259 = _1197;
            if (_1219)
            {
                float _1261 = -_1225;
                float _1263 = _1261 + _1249;
                _1199 = _1263;
            }
            float _1265 = _1199;
            _356 = _1265;
            if (_1219)
            {
                float _1267 = -_1227;
                float _1269 = _1267 + _1251;
                _1253 = _1269;
            }
            float _1271 = _1253;
            if (_1219)
            {
                float _1273 = fma(_1259, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1223);
                _1235 = _1273;
            }
            float _1275 = _1235;
            _1137 = _1275;
            if (_1219)
            {
                float _1277 = fma(_1265, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1225);
                _1237 = _1277;
            }
            float _1279 = _1237;
            _1147 = _1279;
            if (_1219)
            {
                float _1281 = fma(_1271, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1227);
                _1143 = _1281;
            }
        }
    }
    _1209 = false;
    float _1283 = _1143;
    float _1285 = _1137;
    float _1287 = _1147;
    float _1289 = _356;
    bool _1291 = _210 >= 1.0;
    bool _1293 = isnan(_210);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan(1.0);
    bool _1299 = _1295 || _1297;
    float _1301 = fma(_262, _326, _939);
    float _1303 = _1285;
    float _1305 = _1287;
    float _1307 = _1283;
    float _1309 = _1283;
    float _1311 = _1289;
    if (_949)
    {
        _358 = _1285;
    }
    float _1313 = _358;
    float _1315 = _1313;
    if (_949)
    {
        _961 = _1287;
    }
    float _1317 = _961;
    float _1319 = _1317;
    if (_949)
    {
        _360 = _1283;
    }
    float _1321 = _360;
    float _1323 = _1321;
    if (!_949)
    {
        bool _1325 = _1285 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1327 = isnan(_1285);
        bool _1329 = _1325 || _1327;
        bool _1331 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1333 = _1329 || _1331;
        bool _1335 = _1287 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1337 = isnan(_1287);
        bool _1339 = _1335 || _1337;
        bool _1341 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1343 = _1339 || _1341;
        float _1345 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1285, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1347 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1287, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1349 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1283, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1351 = _1283 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1353 = isnan(_1283);
        bool _1355 = _1351 || _1353;
        bool _1357 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1359 = _1355 || _1357;
        float _1361 = exp2(_1345);
        float _1363 = exp2(_1347);
        float _1365 = exp2(_1349);
        if (_1333)
        {
            float _1367 = -_1361;
            float _1369 = _1367 + 1.0;
            _1303 = _1369;
        }
        float _1371 = _1303;
        _1315 = _1371;
        if (_1343)
        {
            float _1373 = -_1363;
            float _1375 = _1373 + 1.0;
            _1305 = _1375;
        }
        float _1377 = _1305;
        _1319 = _1377;
        _1311 = _1365;
        if (_1359)
        {
            float _1379 = -_1365;
            float _1381 = _1379 + 1.0;
            _1307 = _1381;
        }
        float _1383 = _1307;
        _1323 = _1383;
        _1309 = _1383;
    }
    float _1385 = _1315;
    float _1387 = _1319;
    float _1389 = _1323;
    float _1391 = _1309;
    float _1393 = _1311;
    float _1395 = _1385;
    float _1397 = _1393;
    float _1399 = _1387;
    float _1401 = _1387;
    float _1403 = _1389;
    float _1405 = _1391;
    float _1407 = _1389;
    if (!_949)
    {
        float _1409 = _1385 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1395 = _1409;
    }
    float _1411 = _1395;
    if (_1299)
    {
        _1397 = _282;
    }
    float _1413 = _1397;
    float _1415 = _1413;
    float _1417 = _1413;
    if (!_949)
    {
        float _1419 = _1387 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1399 = _1419;
    }
    float _1421 = _1399;
    if (_1299)
    {
        _1401 = _284;
    }
    float _1423 = _1401;
    float _1425 = _1423;
    float _1427 = _1423;
    if (!_949)
    {
        float _1429 = _1389 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1403 = _1429;
    }
    float _1431 = _1403;
    float _1433 = _1431;
    if (_1299)
    {
        _1405 = _286;
    }
    float _1435 = _1405;
    float _1437 = _1435;
    float _1439 = _1435;
    if (!_1299)
    {
        bool _1441 = 0.0 != (*spvDescriptorSet0.fp_c3)._m0[0].w;
        bool _1443 = isnan(0.0);
        bool _1445 = _1441 || _1443;
        bool _1447 = isnan((*spvDescriptorSet0.fp_c3)._m0[0].w);
        bool _1449 = _1445 || _1447;
        if (!_1449)
        {
            float _1451 = _282 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1415 = _1451;
        }
        float _1453 = _1415;
        _1417 = _1453;
        if (!_1449)
        {
            float _1455 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1425 = _1455;
        }
        float _1457 = _1425;
        _1427 = _1457;
        if (!_1449)
        {
            float _1459 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
            _1437 = _1459;
        }
        float _1461 = _1437;
        bool _1463 = !_1449;
        _1439 = _1461;
        if (!_1463)
        {
            float _1465 = _284 * 0.715200006961822509765625;
            float _1467 = fma(_282, 0.2125999927520751953125, _1465);
            float _1469 = fma(_286, 0.072200000286102294921875, _1467);
            float _1471 = 1.0 / _1469;
            float _1473 = _1471 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            float _1475 = precise::clamp(_1473, 0.0, 1.0);
            float _1477 = fma(_1475, (*spvDescriptorSet0.fp_c3)._m0[0].y, (*spvDescriptorSet0.fp_c3)._m0[0].x);
            float _1479 = _282 * _1477;
            float _1481 = _284 * _1477;
            float _1483 = _286 * _1477;
            _1439 = _1483;
            _1417 = _1479;
            _1427 = _1481;
            _1407 = _1477;
        }
    }
    float _1485 = _1439;
    float _1487 = _1417;
    float _1489 = _1427;
    float _1491 = _1407;
    float _1493 = fma(_326, _1421, _1135);
    float _1495 = fma(_326, _1431, _1131);
    float _1497 = fma(_326, _1411, _1133);
    float _1499 = _1491;
    float _1501 = _1487;
    if (_1299)
    {
        _1499 = _1485;
    }
    float _1503 = _1499;
    float _1505 = _1503;
    if (_1299)
    {
        _1433 = _1487;
    }
    float _1507 = _1433;
    float _1509 = _1507;
    float _1511 = _1507;
    if (_1299)
    {
        _1139 = _1489;
    }
    float _1513 = _1139;
    float _1515 = _1513;
    float _1517 = _1513;
    if (!_1299)
    {
        float _1519 = _1487 * 4.0;
        float _1521 = _1489 * 4.0;
        uint _1523 = as_type<uint>(half2(float2(_1519, _1521)));
        float _1525 = _1485 * 4.0;
        bool _1527 = (*spvDescriptorSet0.fp_c4)._m0[5].z > 0.999000012874603271484375;
        uint _1529 = extract_bits(_1523, 16u, 16u);
        float _1531 = float(_1529);
        int _1533 = int(_1523) & 32767;
        uint _1535 = as_type<uint>(half2(float2(_1525, 0.0)));
        uint _1537 = extract_bits(_1535, 0u, 8u);
        int _1539 = int(_1537) & 255;
        uint _1541 = extract_bits(_1535, 8u, 8u);
        int _1543 = int(_1541) & 255;
        int _1545 = _1543 << 8;
        int _1547 = _1539 | _1545;
        float _1549 = float(uint(_1533));
        float _1551 = float(uint(_1547));
        float _1553 = fma(_1549, 6.103515625e-05, -0.3125);
        float _1555 = fma(_1531, 6.103515625e-05, -0.3125);
        float _1557 = fma(_1551, 6.103515625e-05, -0.3125);
        float _1559 = fma(_1553, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1561 = fma(_1555, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        float _1563 = fma(_1557, (*spvDescriptorSet0.fp_c5)._m0[0].z, (*spvDescriptorSet0.fp_c5)._m0[0].w);
        bool _1565 = !_1527;
        float _1567 = (*spvDescriptorSet0.fp_c5)._m0[0].z;
        float _1569 = _1557;
        _1501 = _1553;
        _362 = _1557;
        if (!_1565)
        {
            float3 _3905 = float3(_1559, _1561, _1563);
            float3 _1571 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3905, float3(0.0), isnan(_3905))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3905, float3(0.0), isnan(_3905))).xyz;
            float _1573 = _1571.x;
            float _1575 = _1571.y;
            float _1577 = _1571.z;
            _1505 = _1577;
            _1511 = _1573;
            _1517 = _1575;
            _1579 = true;
        }
        else
        {
            bool _1581 = (*spvDescriptorSet0.fp_c4)._m0[5].z >= 0.001000000047497451305389404296875;
            bool _1583 = isnan((*spvDescriptorSet0.fp_c4)._m0[5].z);
            bool _1585 = _1581 || _1583;
            bool _1587 = isnan(0.001000000047497451305389404296875);
            bool _1589 = _1585 || _1587;
            float3 _3937 = float3(_1559, _1561, _1563);
            float3 _1591 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_3937, float3(0.0), isnan(_3937))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_3937, float3(0.0), isnan(_3937))).xyz;
            float _1593 = _1591.x;
            float _1595 = _1591.y;
            float _1597 = _1591.z;
            float _1599 = _1127;
            float _1601 = _1133;
            float _1603 = _1553;
            if (_1589)
            {
                float3 _3957 = float3(_1559, _1561, _1563);
                float3 _1605 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_3957, float3(0.0), isnan(_3957))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_3957, float3(0.0), isnan(_3957))).xyz;
                float _1607 = _1605.x;
                float _1609 = _1605.y;
                float _1611 = _1605.z;
                _1599 = _1607;
                _1601 = _1609;
                _1603 = _1611;
            }
            float _1613 = _1599;
            float _1615 = _1601;
            float _1617 = _1603;
            float _1619 = _1617;
            _1505 = _1597;
            if (!_1589)
            {
                _1509 = _1593;
            }
            float _1621 = _1509;
            float _1623 = _1621;
            if (!_1589)
            {
                _1515 = _1595;
            }
            float _1625 = _1515;
            float _1627 = _1625;
            if (_1589)
            {
                float _1629 = -_1593;
                float _1631 = _1629 + _1613;
                _1567 = _1631;
            }
            float _1633 = _1567;
            if (_1589)
            {
                float _1635 = -_1595;
                float _1637 = _1635 + _1615;
                _1569 = _1637;
            }
            float _1639 = _1569;
            _362 = _1639;
            if (_1589)
            {
                float _1641 = -_1597;
                float _1643 = _1641 + _1617;
                _1619 = _1643;
            }
            float _1645 = _1619;
            _1501 = _1645;
            if (_1589)
            {
                float _1647 = fma(_1633, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1593);
                _1623 = _1647;
            }
            float _1649 = _1623;
            _1511 = _1649;
            if (_1589)
            {
                float _1651 = fma(_1639, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1595);
                _1627 = _1651;
            }
            float _1653 = _1627;
            _1517 = _1653;
            if (_1589)
            {
                float _1655 = fma(_1645, (*spvDescriptorSet0.fp_c4)._m0[5].z, _1597);
                _1505 = _1655;
            }
        }
    }
    _1579 = false;
    float _1657 = _1505;
    float _1659 = _1511;
    float _1661 = _1517;
    float _1663 = _1501;
    float _1665 = _362;
    float _1667 = _1663;
    float _1669 = _1665;
    float _1671 = _1661;
    float _1673 = _1657;
    float _1675 = _1659;
    if (_1299)
    {
        _1667 = _1661;
    }
    float _1677 = _1667;
    float _1679 = _1677;
    if (_1299)
    {
        _1669 = _1657;
    }
    float _1681 = _1669;
    float _1683 = _1681;
    if (!_1299)
    {
        bool _1685 = _1661 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1687 = isnan(_1661);
        bool _1689 = _1685 || _1687;
        bool _1691 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1693 = _1689 || _1691;
        bool _1695 = _1657 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1697 = isnan(_1657);
        bool _1699 = _1695 || _1697;
        bool _1701 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1703 = _1699 || _1701;
        float _1705 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1661, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1707 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1657, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        float _1709 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, _1659, (*spvDescriptorSet0.fp_c3)._m0[1].z);
        bool _1711 = _1659 >= (*spvDescriptorSet0.fp_c3)._m0[1].x;
        bool _1713 = isnan(_1659);
        bool _1715 = _1711 || _1713;
        bool _1717 = isnan((*spvDescriptorSet0.fp_c3)._m0[1].x);
        bool _1719 = _1715 || _1717;
        float _1721 = exp2(_1705);
        float _1723 = exp2(_1707);
        float _1725 = exp2(_1709);
        if (_1693)
        {
            float _1727 = -_1721;
            float _1729 = _1727 + 1.0;
            _1671 = _1729;
        }
        float _1731 = _1671;
        if (_1703)
        {
            float _1733 = -_1723;
            float _1735 = _1733 + 1.0;
            _1673 = _1735;
        }
        float _1737 = _1673;
        _1679 = _1731;
        _1683 = _1737;
        if (_1719)
        {
            float _1739 = -_1725;
            float _1741 = _1739 + 1.0;
            _1675 = _1741;
        }
    }
    float _1743 = _1675;
    float _1745 = _1679;
    float _1747 = _1683;
    float _1749 = _1743;
    float _1751 = _1745;
    float _1753 = _1747;
    if (!_1299)
    {
        float _1755 = _1743 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1749 = _1755;
    }
    float _1757 = _1749;
    if (!_1299)
    {
        float _1759 = _1745 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1751 = _1759;
    }
    float _1761 = _1751;
    if (!_1299)
    {
        float _1763 = _1747 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
        _1753 = _1763;
    }
    float _1765 = _1753;
    float _1767 = fma(_288, _328, _1301);
    float _1769 = fma(_328, _1757, _1497);
    float _1771 = fma(_328, _1761, _1493);
    float _1773 = fma(_328, _1765, _1495);
    out.m_45.x = _1769;
    out.m_45.y = _1771;
    out.m_45.z = _1773;
    out.m_45.w = _1767;
    return out;
}

