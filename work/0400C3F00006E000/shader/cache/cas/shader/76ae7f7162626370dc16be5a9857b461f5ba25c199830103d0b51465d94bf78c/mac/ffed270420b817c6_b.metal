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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texturecube<float> fp_t_tcb_1E [[id(12)]];
    sampler fp_t_tcb_1ESmplr [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_1ESmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_78 [[color(0)]];
};

struct main0_in
{
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_53 [[user(locn4), flat]];
    float4 m_61 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_59 [[user(locn8), flat]];
    float4 m_51 [[user(locn9)]];
    float4 m_55 [[user(locn10), flat]];
    float4 m_71 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
    float4 m_49 [[user(locn13)]];
    float4 m_75 [[user(locn14)]];
    float4 m_84 [[user(locn15)]];
    float4 m_80 [[user(locn16)]];
    float4 m_86 [[user(locn17)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _93 = gl_FragCoord.w;
    float _95 = in.m_49.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = (*spvDescriptorSet0.fp_c10)._m0[9].w + 20.0;
    float _103 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _105 = -_101;
    float _107 = _105 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _109 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _111 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _103);
    float _113 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _115 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _113;
    float _117 = _107 * _107;
    float _119 = -_109;
    float _121 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _119);
    float _123 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _125 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _111);
    float _127 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _129 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _127;
    float _131 = fma(_115, _115, _117);
    float _133 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _135 = -_123;
    float _137 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _135);
    float _139 = _121 * _121;
    float _141 = fma(_129, _129, _131);
    float _143 = -_133;
    float _145 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _143);
    float _147 = rsqrt(_125);
    float _149 = fma(_137, _137, _139);
    float _151 = in.m_49.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = fma(_145, _145, _149);
    float _159 = rsqrt(_141);
    float _161 = in.m_49.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = rsqrt(_157);
    float _169 = _147 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _171 = 1.0 / _93;
    float _173 = _129 * _159;
    float _175 = _115 * _159;
    float _177 = _107 * _159;
    float _179 = _147 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _181 = _169 * _173;
    float _183 = _147 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _185 = _145 * _167;
    float _187 = _137 * _167;
    float _189 = _121 * _167;
    float _191 = -_181;
    float _193 = fma(_179, _175, _191);
    float _195 = _179 * _177;
    float _197 = _177 * _185;
    float _199 = _175 * _189;
    float _201 = _171 * _99;
    float _203 = -_195;
    float _205 = fma(_183, _173, _203);
    float _207 = -_197;
    float _209 = fma(_173, _189, _207);
    float _211 = _173 * _187;
    float _213 = _171 * _155;
    float _215 = -_101;
    float _217 = _215 + _201;
    float _219 = _183 * _175;
    float _221 = -_211;
    float _223 = fma(_175, _185, _221);
    float _225 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _227 = _213 + _225;
    float _229 = _193 * _217;
    float _231 = _171 * _165;
    float _233 = _217 * _223;
    float _235 = -_219;
    float _237 = fma(_169, _177, _235);
    float _239 = fma(_205, _227, _229);
    float _241 = -_199;
    float _243 = fma(_177, _187, _241);
    float _245 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _247 = _231 + _245;
    float _249 = fma(_227, _209, _233);
    float _251 = in.m_51.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_51.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_237, _247, _239);
    float _265 = fma(_247, _243, _249);
    float _267 = _265 * _265;
    float _269 = abs(_263);
    float _271 = abs(_265);
    float _273 = precise::max(_269, _271);
    float _275 = fma(_263, _263, _267);
    bool _279 = _273 >= 16.0;
    float _281 = in.m_53.y;
    float _283 = sqrt(_275);
    float _285 = _265;
    float _287 = _263;
    int _290 = as_type<int>(_169);
    float _292 = _267;
    float _294 = _171;
    if (_279)
    {
        float _296 = _265 * 0.0625;
        _285 = _296;
    }
    float _298 = _285;
    if (_279)
    {
        float _300 = _263 * 0.0625;
        _287 = _300;
    }
    float _302 = _287;
    float _304 = abs(_298);
    bool _306 = _304 != 0.0;
    bool _308 = isnan(_304);
    bool _310 = _306 || _308;
    bool _312 = isnan(0.0);
    bool _314 = _310 || _312;
    float _316 = abs(_302);
    bool _318 = _316 == 0.0;
    float _320 = _171 * _261;
    float _322 = abs(_302);
    bool _324 = _322 == 0.0;
    bool _326 = !_314;
    bool _328 = _324 && _326;
    float _330 = _171 * _255;
    float _332 = _281 * (-0.0199999995529651641845703125);
    bool _334 = false;
    if (_328)
    {
        bool _336 = as_type<int>(_302) >= 0;
        _334 = _336;
    }
    bool _338 = _334;
    int _340 = _338 ? (-1) : 0;
    if (_328)
    {
        int _342 = _338 ? 0 : 1078530011;
        _290 = _342;
    }
    int _344 = _290;
    int _346 = _344;
    if (_328)
    {
        int _348 = int(0x80000000) & as_type<int>(_298);
        int _350 = _344 | _348;
        _292 = as_type<float>(_350);
    }
    float _352 = _292;
    bool _354 = !_314;
    bool _356 = _354 && _318;
    float _358 = _352;
    float _360 = _352;
    if (!_356)
    {
        float _362 = abs(_298);
        bool _364 = _362 != as_type<float>(0x7f800000u /* inf */);
        bool _366 = isnan(_362);
        bool _368 = _364 || _366;
        bool _370 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _372 = _368 || _370;
        float _374 = abs(_302);
        bool _376 = _374 == as_type<float>(0x7f800000u /* inf */);
        float _378 = abs(_302);
        bool _380 = _378 == as_type<float>(0x7f800000u /* inf */);
        bool _382 = !_372;
        bool _384 = _380 && _382;
        if (_384)
        {
            bool _386 = as_type<int>(_302) >= 0;
            _340 = _386 ? (-1) : 0;
        }
        int _388 = _340;
        if (_384)
        {
            _346 = 1075235812;
        }
        int _390 = _346;
        int _392 = _390;
        if (_384)
        {
            int _394 = ~_388;
            int _396 = (_394 != 0) ? _390 : 1061752795;
            _392 = _396;
        }
        int _398 = _392;
        if (_384)
        {
            int _400 = int(0x80000000) & as_type<int>(_298);
            int _402 = _398 | _400;
            _358 = as_type<float>(_402);
        }
        float _404 = _358;
        bool _406 = !_372;
        bool _408 = _406 && _376;
        _360 = _404;
        if (!_408)
        {
            float _410 = abs(_302);
            float _412 = abs(_298);
            float _414 = precise::max(_410, _412);
            float _416 = abs(_302);
            float _418 = abs(_298);
            float _420 = precise::min(_416, _418);
            float _422 = 1.0 / _414;
            float _424 = abs(_298);
            float _426 = abs(_302);
            bool _428 = _424 > _426;
            bool _430 = as_type<int>(_302) >= 0;
            float _432 = _420 * _422;
            float _434 = _432 * _432;
            float _436 = _434 + 11.33538818359375;
            float _438 = fma(_434, _436, 28.84246826171875);
            float _440 = fma(_434, _438, 19.6966705322265625);
            float _442 = fma(_434, -0.82336294651031494140625, -5.674867153167724609375);
            float _444 = fma(_434, _442, -6.565555095672607421875);
            float _446 = 1.0 / _440;
            float _448 = _434 * _444;
            float _450 = abs(_302);
            float _452 = abs(_298);
            float _454 = _450 + _452;
            int _456 = as_type<int>(_298) & int(0x80000000);
            float _458 = _432 * _448;
            bool _460 = _454 > as_type<float>(0x7f800000u /* inf */);
            bool _462 = isnan(_454);
            bool _464 = _460 || _462;
            bool _466 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _468 = _464 || _466;
            float _470 = fma(_458, _446, _432);
            float _472 = _470;
            _360 = _454;
            if (_428)
            {
                float _474 = -_470;
                float _476 = _474 + 1.57079637050628662109375;
                _472 = _476;
            }
            float _478 = _472;
            int _480 = as_type<int>(_478);
            if (!_430)
            {
                float _482 = -_478;
                float _484 = _482 + 3.1415927410125732421875;
                _480 = as_type<int>(_484);
            }
            int _486 = _480;
            if (!_468)
            {
                int _488 = _456 | _486;
                _360 = as_type<float>(_488);
            }
        }
    }
    float _490 = _360;
    float2 _1950 = float2(_320, _330);
    float _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1950, float2(0.0), isnan(_1950))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1950, float2(0.0), isnan(_1950))).x;
    float _494 = fma(_283, 0.100000001490116119384765625, _332);
    float _496 = _490 * 4.7746486663818359375;
    float2 _1967 = float2(_494, _496);
    float _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1967, float2(0.0), isnan(_1967))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1967, float2(0.0), isnan(_1967))).w;
    float _500 = in.m_55.x;
    float _502 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _504 = in.m_57.w;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = in.m_59.x;
    float _512 = in.m_61.w;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_63.w;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_65.z;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_65.x;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_61.x;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_61.y;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_65.y;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_65.w;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = _283 * 0.20000000298023223876953125;
    float _562 = _500 + 1.0;
    float _564 = _171 * _508;
    float _566 = rint(_500);
    float _568 = precise::max(_566, 0.0);
    uint _571 = uint(_568);
    uint _573 = clamp(_571, 0u, 65535u);
    float _575 = _562 * _502;
    float _577 = floor(_575);
    float _579 = _171 * _552;
    float _581 = _171 * _558;
    float _583 = -_577;
    float _585 = fma(_583, (*spvDescriptorSet0.fp_c9)._m0[22].x, _562);
    float _587 = _171 * _516;
    float _589 = fma(_492, 2.0, -1.0);
    float _591 = _589 * _564;
    float _593 = _510 * (-0.004999999888241291046142578125);
    float _595 = _498 * _560;
    float _597 = _171 * _522;
    float _599 = _591 * 0.1500000059604644775390625;
    float _601 = _171 * _546;
    float _603 = -_593;
    float _605 = _595 * _603;
    float _607 = 1.0 / _587;
    float _609 = _597 * _599;
    float _611 = _171 * _528;
    float _613 = fma(_494, _605, _609);
    float _615 = _171 * _534;
    float _617 = fma(_496, _605, _609);
    float _619 = _611 + _613;
    float _621 = _615 + _613;
    float _623 = _171 * _540;
    float _625 = _579 + _617;
    float _627 = _581 + _617;
    float _629 = rint(_585);
    float _631 = precise::max(_629, 0.0);
    uint _633 = uint(_631);
    uint _635 = clamp(_633, 0u, 65535u);
    float _637 = _623 * _607;
    float _639 = _601 * _607;
    float2 _2160 = float2(_637, _639);
    float _641 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2160, float2(0.0), isnan(_2160))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2160, float2(0.0), isnan(_2160))).x;
    float3 _2171 = float3(_621, _625, float(int(_573)));
    float3 _2175 = select(_2171, float3(0.0), isnan(_2171));
    float4 _644 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2175.xy, uint(rint(_2175.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2175.xy, uint(rint(_2175.z))).xyzw;
    float _646 = _644.x;
    float _648 = _644.y;
    float _650 = _644.z;
    float _652 = _644.w;
    float3 _2192 = float3(_621, _625, float(int(_635)));
    float3 _2194 = select(_2192, float3(0.0), isnan(_2192));
    float4 _654 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2194.xy, uint(rint(_2194.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2194.xy, uint(rint(_2194.z))).xyzw;
    float _656 = _654.x;
    float _658 = _654.y;
    float _660 = _654.z;
    float _662 = _654.w;
    float2 _2208 = float2(_619, _627);
    float _664 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2208, float2(0.0), isnan(_2208))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2208, float2(0.0), isnan(_2208))).w;
    float _666 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _668 = in.m_61.z;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = in.m_67.w;
    float _676 = gl_FragCoord.w;
    float _678 = _674 * _676;
    float _680 = _281 * _666;
    float _682 = _680 * _666;
    float _684 = floor(_682);
    float _686 = _171 * _672;
    float _688 = _686 * _607;
    float _690 = -_684;
    float _692 = fma(_690, (*spvDescriptorSet0.fp_c9)._m0[22].y, _680);
    float _694 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _696 = fma(_688, (*spvDescriptorSet0.fp_c8)._m0[30].w, _694);
    float _698 = _692 + 9.9999997473787516355514526367188e-05;
    float _700 = 1.0 / _696;
    float _702 = floor(_698);
    float _704 = -_702;
    float _706 = _698 + _704;
    float _708 = _171 * _678;
    float _710 = fma(_708, 2.0, -1.0);
    float _712 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _714 = _700 * _712;
    float _716 = in.m_59.z;
    float _718 = in.m_69.z;
    float _720 = gl_FragCoord.w;
    float _722 = _718 * _720;
    float _724 = in.m_71.y;
    float _726 = gl_FragCoord.w;
    float _728 = _724 * _726;
    float _730 = in.m_71.x;
    float _732 = gl_FragCoord.w;
    float _734 = _730 * _732;
    float _736 = in.m_71.z;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _744 = fma(_641, (*spvDescriptorSet0.fp_c8)._m0[30].w, _742);
    float _746 = in.m_73.x;
    float _748 = gl_FragCoord.w;
    float _750 = _746 * _748;
    float _752 = 1.0 / _744;
    float _754 = -_650;
    float _756 = _754 + _660;
    float _758 = fma(_706, _756, _650);
    float _760 = _664 + _710;
    float _762 = precise::max(_760, 0.20000000298023223876953125);
    float _764 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _766 = -_714;
    float _768 = fma(_752, _764, _766);
    float _770 = precise::min(_762, 0.60000002384185791015625);
    float _772 = _758 + _768;
    float _774 = fma(_770, 2.4999997615814208984375, -0.4999999701976776123046875);
    float _776 = precise::max(_772, 1.0);
    float _778 = -_652;
    float _780 = _778 + _662;
    float _782 = precise::min(_776, 2.5);
    float _784 = fma(_706, _780, _652);
    float _786 = fma(_782, 0.666666686534881591796875, -0.666666686534881591796875);
    float _788 = _784 * _786;
    float _790 = 1.0 / _716;
    float _792 = _788 * _774;
    float _794 = precise::max(0.0, _792);
    float _796 = precise::min(_716, _794);
    float _798 = _796 * _790;
    float _800 = _171 * _750;
    float _802 = 0.0 + _798;
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = _804 * _800;
    bool _808 = _806 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _810 = isnan(_806);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _816 = _812 || _814;
    float _818 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _820 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _822 = _201 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _824 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _818);
    float _826 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _820);
    if (!_816)
    {
        discard_fragment();
    }
    float _828 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[0].x, _822);
    float _830 = _201 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _832 = in.m_75.z;
    float _834 = gl_FragCoord.w;
    float _836 = _832 * _834;
    float _838 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[0].z, _828);
    float _840 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _824);
    float _842 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _826);
    float _844 = fma(_213, (*spvDescriptorSet0.fp_c8)._m0[1].x, _830);
    float _846 = in.m_75.y;
    float _848 = gl_FragCoord.w;
    float _850 = _846 * _848;
    float _852 = -_840;
    float _854 = _838 + _852;
    float _856 = _842 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _858 = in.m_75.x;
    float _860 = gl_FragCoord.w;
    float _862 = _858 * _860;
    float _864 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[1].z, _844);
    float _866 = fma(_854, 0.0240000002086162567138671875, -0.300000011920928955078125);
    float _868 = -_646;
    float _870 = _868 + _656;
    float _872 = in.m_59.y;
    float _874 = _864 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _876 = _171 * _722;
    float _878 = fma(_706, _870, _646);
    float _880 = in.m_67.x;
    float _882 = gl_FragCoord.w;
    float _884 = _880 * _882;
    float _886 = _874 + (-18.0);
    float _888 = -_856;
    float _890 = _886 + _888;
    float _892 = -_648;
    float _894 = _892 + _658;
    float _896 = abs(_878);
    float _898 = log2(_896);
    float _900 = fma(_890, 0.0240000002086162567138671875, -0.300000011920928955078125);
    float _902 = fma(_706, _894, _648);
    float _904 = abs(_902);
    float _906 = log2(_904);
    float _908 = _171 * _850;
    float _910 = in.m_69.x;
    float _912 = gl_FragCoord.w;
    float _914 = _910 * _912;
    float _916 = _171 * _862;
    float _918 = _908 * _908;
    float _920 = _898 * 0.5;
    float _922 = fma(_916, _916, _918);
    float _924 = _171 * _836;
    float _926 = in.m_69.y;
    float _928 = gl_FragCoord.w;
    float _930 = _926 * _928;
    float _932 = _906 * 0.5;
    float _934 = fma(_924, _924, _922);
    float _936 = exp2(_920);
    float _938 = _171 * _740;
    float _940 = rsqrt(_934);
    float _942 = exp2(_932);
    float _944 = _936 + _866;
    float _946 = _872 * _944;
    float _948 = _908 * _940;
    float _950 = _924 * _940;
    float _952 = _171 * _914;
    float _954 = _171 * _930;
    float _956 = _942 + _900;
    float _958 = _954 * _954;
    float _960 = _872 * _956;
    float _962 = fma(_952, _952, _958);
    float _964 = _171 * _734;
    float _966 = _960 * _960;
    float _968 = fma(_876, _876, _962);
    float _970 = _171 * _728;
    float _972 = fma(_946, _946, _966);
    float _974 = precise::clamp(_972, 0.0, 1.0);
    float _976 = rsqrt(_968);
    float _978 = _970 * _970;
    float _980 = -_974;
    float _982 = _980 + 1.0;
    float _984 = fma(_964, _964, _978);
    float _986 = fma(_938, _938, _984);
    float _988 = sqrt(_982);
    float _990 = in.m_63.y;
    float _992 = gl_FragCoord.w;
    float _994 = _990 * _992;
    float _996 = _954 * _976;
    float _998 = _876 * _976;
    float _1000 = _952 * _976;
    float _1002 = rsqrt(_986);
    float _1004 = _996 * _996;
    float _1006 = fma(_1000, _1000, _1004);
    float _1008 = fma(_998, _998, _1006);
    float _1010 = in.m_63.x;
    float _1012 = gl_FragCoord.w;
    float _1014 = _1010 * _1012;
    float _1016 = rsqrt(_1008);
    float _1018 = _960 * _1002;
    float _1020 = _938 * _1018;
    float _1022 = _970 * _1018;
    float _1024 = fma(_946, _950, _1020);
    float _1026 = fma(_946, _948, _1022);
    float _1028 = in.m_53.x;
    float _1030 = _171 * _994;
    float _1032 = _1016 * _988;
    float _1034 = in.m_63.z;
    float _1036 = gl_FragCoord.w;
    float _1038 = _1034 * _1036;
    float _1040 = fma(_998, _1032, _1024);
    float _1042 = fma(_996, _1032, _1026);
    float _1044 = in.m_67.y;
    float _1046 = gl_FragCoord.w;
    float _1048 = _1044 * _1046;
    float _1050 = _1040 * 0.577381789684295654296875;
    float _1052 = _171 * _1014;
    float _1054 = fma(_1042, 0.816474258899688720703125, _1050);
    float _1056 = in.m_67.z;
    float _1058 = gl_FragCoord.w;
    float _1060 = _1056 * _1058;
    float _1062 = precise::max(_1054, 0.800000011920928955078125);
    float _1064 = precise::max(_1054, 1.0);
    float _1066 = precise::min(_1062, 1.0);
    float _1068 = precise::min(_1064, 1.2000000476837158203125);
    float _1070 = precise::max(_1054, -1.0);
    float _1072 = fma(_1066, 5.000000476837158203125, -4.000000476837158203125);
    float _1074 = precise::max(_768, 10.0);
    float _1076 = _171 * _884;
    float _1078 = precise::min(0.0, _1070);
    float _1080 = fma(_1068, -4.99999904632568359375, 5.99999904632568359375);
    float _1082 = -_1052;
    float _1084 = _1082 + _1076;
    float _1086 = precise::min(_1074, 50.0);
    float _1088 = _1078 + 1.0;
    float _1090 = _1072 * _1080;
    float _1092 = _171 * _1038;
    float _1094 = fma(_1086, 0.012500000186264514923095703125, 0.375);
    float _1096 = _171 * _1048;
    float _1098 = fma(_664, -0.60000002384185791015625, 1.0);
    float _1100 = -_1028;
    float _1102 = _1100 + 1.0;
    float _1104 = _1090 * 0.100000001490116119384765625;
    float _1106 = -_1030;
    float _1108 = _1106 + _1096;
    float _1110 = fma(_1088, _1084, _1052);
    float _1112 = _171 * _1060;
    float _1114 = _1098 * _1094;
    float _1116 = fma(_1088, _1108, _1030);
    float _1118 = _1104 * _1102;
    float _1120 = -_1092;
    float _1122 = _1120 + _1112;
    float _1124 = fma(_1110, _1114, _1118);
    float _1126 = fma(_1088, _1122, _1092);
    float _1128 = fma(_1116, _1114, _1118);
    float _1130 = fma(_1126, _1114, _1118);
    if (!_816)
    {
        out.m_78.x = _1124;
        out.m_78.y = _1128;
        out.m_78.z = _1130;
        out.m_78.w = _798;
        return out;
    }
    float _1132 = in.m_80.x;
    float _1134 = gl_FragCoord.w;
    float _1136 = _1132 * _1134;
    float _1138 = _1040 * (-0.577381789684295654296875);
    float _1140 = abs(_1000);
    float _1142 = abs(_996);
    float _1144 = precise::max(_1140, _1142);
    float _1146 = fma(_1042, -0.816474258899688720703125, _1138);
    float _1148 = abs(_998);
    float _1150 = precise::max(_1148, _1144);
    float _1152 = fma(_1146, 0.833333313465118408203125, 0.833333313465118408203125);
    float _1154 = precise::clamp(_1152, 0.0, 1.0);
    float _1156 = 1.0 / _1150;
    float _1158 = fma(_1154, -2.0, 3.0);
    float _1160 = _1154 * _1154;
    float _1162 = _1158 * _1160;
    float _1164 = _1162 * 0.60000002384185791015625;
    float _1166 = precise::clamp(_1164, 0.0, 1.0);
    float _1168 = _1000 * _1156;
    float _1170 = _996 * _1156;
    float _1172 = -_1156;
    float _1174 = _998 * _1172;
    float _1176 = _171 * _1136;
    float _1178 = _1166 + _1176;
    float _1180 = precise::min(_1178, 1.0);
    float3 _2980 = float3(_1168, _1170, _1174);
    float3 _1184 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2980, float3(0.0), isnan(_2980)), level(_1180)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2980, float3(0.0), isnan(_2980)), level(_1180)).xyz;
    float _1186 = _1184.x;
    float _1188 = _1184.y;
    float _1190 = _1184.z;
    float _1192 = in.m_82.x;
    float _1194 = gl_FragCoord.w;
    float _1196 = _1192 * _1194;
    float _1198 = in.m_82.z;
    float _1200 = gl_FragCoord.w;
    float _1202 = _1198 * _1200;
    float _1204 = in.m_82.y;
    float _1206 = gl_FragCoord.w;
    float _1208 = _1204 * _1206;
    float _1210 = in.m_84.x;
    float _1212 = gl_FragCoord.w;
    float _1214 = _1210 * _1212;
    float _1216 = in.m_84.y;
    float _1218 = gl_FragCoord.w;
    float _1220 = _1216 * _1218;
    float _1222 = in.m_84.z;
    float _1224 = gl_FragCoord.w;
    float _1226 = _1222 * _1224;
    float _1228 = in.m_86.x;
    float _1230 = gl_FragCoord.w;
    float _1232 = _1228 * _1230;
    float _1234 = in.m_86.y;
    float _1236 = gl_FragCoord.w;
    float _1238 = _1234 * _1236;
    float _1240 = in.m_86.z;
    float _1242 = gl_FragCoord.w;
    float _1244 = _1240 * _1242;
    float _1246 = in.m_86.w;
    float _1248 = gl_FragCoord.w;
    float _1250 = _1246 * _1248;
    float _1252 = _758 * _1102;
    float _1254 = fma(_1252, -0.4000000059604644775390625, 1.0);
    bool _1256 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1258 = _171 * _1196;
    float _1260 = _171 * _1202;
    float _1262 = _171 * _1208;
    float _1264 = _1258 * _1254;
    float _1266 = _1260 * _1254;
    float _1268 = _1262 * _1254;
    float _1270 = _171 * _1220;
    float _1272 = _171 * _1226;
    float _1274 = _171 * _1232;
    float _1276 = _171 * _1238;
    float _1278 = _171 * _1244;
    float _1280 = _171 * _1250;
    float _1282 = fma(_1186, 0.20999999344348907470703125, _1264);
    float _1284 = _171 * _1214;
    float _1286 = fma(_1190, 0.20999999344348907470703125, _1266);
    float _1288 = fma(_1188, 0.20999999344348907470703125, _1268);
    if (_1256)
    {
        float _1290 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1292 = _714 + _1290;
        _294 = _1292;
    }
    float _1294 = _294;
    float _1296 = _1282 + _1284;
    float _1298 = _1286 + _1272;
    float _1300 = _1288 + _1270;
    float _1302 = 0.0 + _806;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1294;
    float _1308 = _1304;
    if (_1256)
    {
        float _1310 = _1294 * 8.0;
        float _1312 = precise::clamp(_1310, 0.0, 1.0);
        _1306 = _1312;
    }
    float _1314 = _1306;
    float _1316 = _1124 * _1296;
    float _1318 = _1128 * _1300;
    float _1320 = _1130 * _1298;
    if (_1256)
    {
        float _1322 = _1304 * _1314;
        _1308 = _1322;
    }
    float _1324 = _1308;
    float _1326 = fma(_1316, _1280, _1274);
    float _1328 = fma(_1318, _1280, _1276);
    float _1330 = fma(_1320, _1280, _1278);
    float _1332 = 0.0 + _1324;
    float _1334 = precise::clamp(_1332, 0.0, 1.0);
    out.m_78.x = _1326;
    out.m_78.y = _1328;
    out.m_78.z = _1330;
    out.m_78.w = _1334;
    return out;
}

