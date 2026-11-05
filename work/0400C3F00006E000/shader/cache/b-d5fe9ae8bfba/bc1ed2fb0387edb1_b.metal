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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_36 [[id(4)]];
    sampler fp_t_tcb_36Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_8 [[id(12)]];
    sampler fp_t_tcb_8Smplr [[id(13)]];
    texture2d_array<float> fp_t_tcb_34 [[id(14)]];
    sampler fp_t_tcb_34Smplr [[id(15)]];
    texturecube<float> fp_t_tcb_1E [[id(16)]];
    sampler fp_t_tcb_1ESmplr [[id(17)]];
    sampler fp_t_tcb_36Smplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    sampler fp_t_tcb_10Smplr_w [[id(20)]];
    sampler fp_t_tcb_ASmplr_w [[id(21)]];
    sampler fp_t_tcb_8Smplr_w [[id(22)]];
    sampler fp_t_tcb_34Smplr_w [[id(23)]];
    sampler fp_t_tcb_1ESmplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_84 [[color(0)]];
};

struct main0_in
{
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_59 [[user(locn4), flat]];
    float4 m_61 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_67 [[user(locn7), flat]];
    float4 m_65 [[user(locn8), flat]];
    float4 m_57 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_63 [[user(locn11), flat]];
    float4 m_81 [[user(locn12)]];
    float4 m_77 [[user(locn13)]];
    float4 m_53 [[user(locn14)]];
    float4 m_79 [[user(locn15)]];
    float4 m_90 [[user(locn16)]];
    float4 m_86 [[user(locn17)]];
    float4 m_92 [[user(locn18)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _99 = gl_FragCoord.w;
    float _101 = in.m_53.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _109 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _111 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _113 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _111;
    float _115 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _117 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _107);
    float _119 = -_109;
    float _121 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _119);
    float _123 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _125 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _123;
    float _127 = _113 * _113;
    float _129 = -_115;
    float _131 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _129);
    float _133 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _117);
    float _135 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _137 = _121 * _121;
    float _139 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _141 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _139;
    float _143 = fma(_125, _125, _127);
    float _145 = -_135;
    float _147 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _145);
    float _149 = fma(_131, _131, _137);
    float _151 = in.m_53.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = fma(_141, _141, _143);
    float _159 = rsqrt(_133);
    float _161 = fma(_147, _147, _149);
    float _163 = rsqrt(_157);
    float _165 = in.m_53.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = rsqrt(_161);
    float _173 = 1.0 / _99;
    float _175 = _125 * _163;
    float _177 = _113 * _163;
    float _179 = _141 * _163;
    float _181 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _183 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _185 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _187 = _131 * _171;
    float _189 = _121 * _171;
    float _191 = _147 * _171;
    float _193 = _185 * _177;
    float _195 = _183 * _175;
    float _197 = _181 * _179;
    float _199 = _177 * _191;
    float _201 = -_193;
    float _203 = fma(_183, _179, _201);
    float _205 = _173 * _105;
    float _207 = -_195;
    float _209 = fma(_181, _177, _207);
    float _211 = -_199;
    float _213 = fma(_179, _189, _211);
    float _215 = _179 * _187;
    float _217 = -_197;
    float _219 = fma(_185, _175, _217);
    float _221 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _223 = _205 + _221;
    float _225 = _175 * _189;
    float _227 = _173 * _155;
    float _229 = -_215;
    float _231 = fma(_175, _191, _229);
    float _233 = _219 * _223;
    float _235 = _173 * _169;
    float _237 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _239 = _227 + _237;
    float _241 = _223 * _231;
    float _243 = -_225;
    float _245 = fma(_177, _187, _243);
    float _247 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _249 = _235 + _247;
    float _251 = fma(_203, _239, _233);
    float _253 = fma(_239, _213, _241);
    float _255 = in.m_55.w;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_57.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = fma(_209, _249, _251);
    float _269 = fma(_249, _245, _253);
    float _271 = in.m_57.y;
    float _273 = gl_FragCoord.w;
    float _275 = _271 * _273;
    float _277 = in.m_59.y;
    float _279 = in.m_61.z;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = in.m_61.w;
    float _287 = gl_FragCoord.w;
    float _289 = _285 * _287;
    float _291 = abs(_267);
    float _293 = abs(_269);
    float _295 = precise::max(_291, _293);
    float _297 = in.m_55.x;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = in.m_55.y;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    bool _311 = _295 >= 16.0;
    float _313 = _269 * _269;
    float _315 = fma(_267, _267, _313);
    float _317 = _269;
    float _319 = _267;
    int _322 = as_type<int>(_209);
    if (_311)
    {
        float _324 = _269 * 0.0625;
        _317 = _324;
    }
    float _326 = _317;
    if (_311)
    {
        float _328 = _267 * 0.0625;
        _319 = _328;
    }
    float _330 = _319;
    float _332 = abs(_326);
    bool _334 = _332 != 0.0;
    bool _336 = isnan(_332);
    bool _338 = _334 || _336;
    bool _340 = isnan(0.0);
    bool _342 = _338 || _340;
    float _344 = _173 * _259;
    float _346 = abs(_330);
    bool _348 = _346 == 0.0;
    float _350 = sqrt(_315);
    float _352 = abs(_330);
    bool _354 = _352 == 0.0;
    bool _356 = !_342;
    bool _358 = _354 && _356;
    float _360 = 1.0 / _344;
    bool _362 = false;
    if (_358)
    {
        bool _364 = as_type<int>(_330) >= 0;
        _362 = _364;
    }
    bool _366 = _362;
    int _368 = _366 ? (-1) : 0;
    if (_358)
    {
        int _370 = _366 ? 0 : 1078530011;
        _322 = _370;
    }
    int _372 = _322;
    int _374 = _372;
    if (_358)
    {
        int _376 = int(0x80000000) & as_type<int>(_326);
        int _378 = _372 | _376;
        _374 = _378;
    }
    int _380 = _374;
    bool _382 = !_342;
    bool _384 = _382 && _348;
    int _386 = _380;
    float _388 = as_type<float>(_380);
    if (!_384)
    {
        float _390 = abs(_326);
        bool _392 = _390 != as_type<float>(0x7f800000u /* inf */);
        bool _394 = isnan(_390);
        bool _396 = _392 || _394;
        bool _398 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _400 = _396 || _398;
        float _402 = abs(_330);
        bool _404 = _402 == as_type<float>(0x7f800000u /* inf */);
        float _406 = abs(_330);
        bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
        bool _410 = !_400;
        bool _412 = _408 && _410;
        if (_412)
        {
            bool _414 = as_type<int>(_330) >= 0;
            _368 = _414 ? (-1) : 0;
        }
        int _416 = _368;
        if (_412)
        {
            _386 = 1075235812;
        }
        int _418 = _386;
        int _420 = _418;
        if (_412)
        {
            int _422 = ~_416;
            int _424 = (_422 != 0) ? _418 : 1061752795;
            _420 = _424;
        }
        int _426 = _420;
        float _428 = as_type<float>(_426);
        if (_412)
        {
            int _430 = int(0x80000000) & as_type<int>(_326);
            int _432 = _426 | _430;
            _428 = as_type<float>(_432);
        }
        float _434 = _428;
        bool _436 = !_400;
        bool _438 = _436 && _404;
        _388 = _434;
        if (!_438)
        {
            float _440 = abs(_330);
            float _442 = abs(_326);
            float _444 = precise::max(_440, _442);
            float _446 = abs(_330);
            float _448 = abs(_326);
            float _450 = precise::min(_446, _448);
            float _452 = 1.0 / _444;
            float _454 = abs(_326);
            float _456 = abs(_330);
            bool _458 = _454 > _456;
            bool _460 = as_type<int>(_330) >= 0;
            float _462 = abs(_330);
            float _464 = abs(_326);
            float _466 = _462 + _464;
            int _468 = as_type<int>(_326) & int(0x80000000);
            bool _470 = _466 > as_type<float>(0x7f800000u /* inf */);
            bool _472 = isnan(_466);
            bool _474 = _470 || _472;
            bool _476 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _478 = _474 || _476;
            float _480 = _450 * _452;
            float _482 = _480 * _480;
            float _484 = _482 + 11.33538818359375;
            float _486 = fma(_482, _484, 28.84246826171875);
            float _488 = fma(_482, _486, 19.6966705322265625);
            float _490 = fma(_482, -0.82336294651031494140625, -5.674867153167724609375);
            float _492 = fma(_482, _490, -6.565555095672607421875);
            float _494 = 1.0 / _488;
            float _496 = _482 * _492;
            float _498 = _480 * _496;
            float _500 = fma(_498, _494, _480);
            float _502 = _500;
            _388 = _466;
            if (_458)
            {
                float _504 = -_500;
                float _506 = _504 + 1.57079637050628662109375;
                _502 = _506;
            }
            float _508 = _502;
            int _510 = as_type<int>(_508);
            if (!_460)
            {
                float _512 = -_508;
                float _514 = _512 + 3.1415927410125732421875;
                _510 = as_type<int>(_514);
            }
            int _516 = _510;
            if (!_478)
            {
                int _518 = _468 | _516;
                _388 = as_type<float>(_518);
            }
        }
    }
    float _520 = _388;
    float _522 = _277 * (-0.0199999995529651641845703125);
    float _524 = _173 * _283;
    float _526 = _520 * 4.7746486663818359375;
    float _528 = _173 * _265;
    float _530 = fma(_350, 0.100000001490116119384765625, _522);
    float _532 = _173 * _275;
    float _534 = _173 * _301;
    float _536 = _173 * _307;
    float2 _1994 = float2(_530, _526);
    float _538 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_1994, float2(0.0), isnan(_1994))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_1994, float2(0.0), isnan(_1994))).w;
    float2 _2004 = float2(_528, _532);
    float2 _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2004, float2(0.0), isnan(_2004))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2004, float2(0.0), isnan(_2004))).xy;
    float _544 = _542.x;
    float _546 = _542.y;
    float _548 = _534 * _360;
    float _550 = _173 * _289;
    float _552 = _536 * _360;
    float2 _2025 = float2(_548, _552);
    float _554 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2025, float2(0.0), isnan(_2025))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2025, float2(0.0), isnan(_2025))).x;
    float2 _2033 = float2(_524, _550);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2033, float2(0.0), isnan(_2033))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2033, float2(0.0), isnan(_2033))).w;
    float _558 = in.m_63.x;
    float _560 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _562 = in.m_65.x;
    float _564 = in.m_67.x;
    float _566 = in.m_61.x;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_61.y;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = _350 * 0.20000000298023223876953125;
    float _580 = _558 + 1.0;
    float _582 = _562 * 0.02999999932944774627685546875;
    float _584 = _564 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _586 = _580 * _560;
    float _588 = floor(_586);
    float _590 = -_588;
    float _592 = fma(_590, (*spvDescriptorSet0.fp_c9)._m0[22].x, _580);
    float _594 = _538 * _578;
    float _596 = _546 * _584;
    float _598 = rint(_558);
    float _600 = precise::max(_598, 0.0);
    uint _603 = uint(_600);
    uint _605 = clamp(_603, 0u, 65535u);
    float _607 = _594 * _582;
    float _609 = _544 * _584;
    float _611 = fma(_526, _607, _596);
    float _613 = fma(_530, _607, _609);
    float _615 = rint(_592);
    float _617 = precise::max(_615, 0.0);
    uint _619 = uint(_617);
    uint _621 = clamp(_619, 0u, 65535u);
    float _623 = _173 * _570;
    float _625 = _173 * _576;
    float _627 = _613 + _623;
    float _629 = _611 + _625;
    float3 _2143 = float3(_627, _629, float(int(_605)));
    float3 _2147 = select(_2143, float3(0.0), isnan(_2143));
    float _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2147.xy, uint(rint(_2147.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2147.xy, uint(rint(_2147.z))).w;
    float3 _2156 = float3(_627, _629, float(int(_621)));
    float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
    float _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2158.xy, uint(rint(_2158.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2158.xy, uint(rint(_2158.z))).w;
    float _635 = in.m_55.z;
    float _637 = gl_FragCoord.w;
    float _639 = _635 * _637;
    float _641 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _643 = in.m_69.x;
    float _645 = gl_FragCoord.w;
    float _647 = _643 * _645;
    float _649 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _651 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _649);
    float _653 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _651);
    float _655 = _277 * _641;
    float _657 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _659 = fma(_554, (*spvDescriptorSet0.fp_c8)._m0[30].w, _657);
    float _661 = fma(_556, 0.300000011920928955078125, -0.1500000059604644775390625);
    float _663 = _655 * _641;
    float _665 = rsqrt(_653);
    float _667 = floor(_663);
    float _669 = _173 * _639;
    float _671 = in.m_71.w;
    float _673 = gl_FragCoord.w;
    float _675 = _671 * _673;
    float _677 = _669 * _360;
    float _679 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _681 = fma(_677, (*spvDescriptorSet0.fp_c8)._m0[30].w, _679);
    float _683 = _665 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _685 = 1.0 / _659;
    float _687 = in.m_73.w;
    float _689 = gl_FragCoord.w;
    float _691 = _687 * _689;
    float _693 = fma(_683, -5.5, 7.0);
    float _695 = -_667;
    float _697 = fma(_695, (*spvDescriptorSet0.fp_c9)._m0[22].y, _655);
    float _699 = 1.0 / _681;
    float _701 = _697 + 9.9999997473787516355514526367188e-05;
    float _703 = 1.0 / _693;
    float _705 = floor(_701);
    float _707 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _709 = _699 * _707;
    float _711 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _713 = -_709;
    float _715 = fma(_685, _711, _713);
    float _717 = _715 * _703;
    float _719 = precise::clamp(_717, 0.0, 1.0);
    float _721 = _173 * _691;
    float _723 = _661 + _719;
    float _725 = -_705;
    float _727 = _701 + _725;
    float _729 = _173 * _675;
    float _731 = precise::max(_723, 0.1500000059604644775390625);
    float _733 = precise::min(_731, 0.3499999940395355224609375);
    float _735 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[49].x;
    float _737 = in.m_75.y;
    float _739 = gl_FragCoord.w;
    float _741 = _737 * _739;
    float _743 = -_631;
    float _745 = _743 + _633;
    float _747 = fma(_727, _745, _631);
    float _749 = -_729;
    float _751 = _749 + _747;
    float _753 = fma(_733, 5.000000476837158203125, -0.75000011920928955078125);
    float _755 = _721 * _751;
    float _757 = _755 * _753;
    float _759 = _173 * _647;
    float _761 = 0.0 + _757;
    float _763 = precise::clamp(_761, 0.0, 1.0);
    float _765 = _763 * _759;
    bool _767 = _765 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _769 = isnan(_765);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _775 = _771 || _773;
    float _777 = in.m_75.x;
    float _779 = gl_FragCoord.w;
    float _781 = _777 * _779;
    float _783 = in.m_63.w;
    float _785 = _709;
    if (!_775)
    {
        discard_fragment();
    }
    float _787 = _173 * _781;
    float _789 = _173 * _741;
    float _791 = _787 + _613;
    float _793 = _783 + 1.0;
    float _795 = _789 + _611;
    float _797 = rint(_783);
    float _799 = precise::max(_797, 0.0);
    uint _801 = uint(_799);
    uint _803 = clamp(_801, 0u, 65535u);
    float _805 = _793 * _735;
    float _807 = floor(_805);
    float _809 = -_807;
    float _811 = fma(_809, (*spvDescriptorSet0.fp_c9)._m0[49].x, _793);
    float _813 = rint(_811);
    float _815 = precise::max(_813, 0.0);
    uint _817 = uint(_815);
    uint _819 = clamp(_817, 0u, 65535u);
    float3 _2435 = float3(_791, _795, float(int(_803)));
    float3 _2437 = select(_2435, float3(0.0), isnan(_2435));
    float2 _821 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, _2437.xy, uint(rint(_2437.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, _2437.xy, uint(rint(_2437.z))).xy;
    float _823 = _821.x;
    float _825 = _821.y;
    float3 _2450 = float3(_791, _795, float(int(_819)));
    float3 _2452 = select(_2450, float3(0.0), isnan(_2450));
    float2 _827 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, _2452.xy, uint(rint(_2452.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, _2452.xy, uint(rint(_2452.z))).xy;
    float _829 = _827.x;
    float _831 = _827.y;
    float _833 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[49].y;
    float _835 = in.m_77.y;
    float _837 = gl_FragCoord.w;
    float _839 = _835 * _837;
    float _841 = in.m_77.x;
    float _843 = gl_FragCoord.w;
    float _845 = _841 * _843;
    float _847 = in.m_77.z;
    float _849 = gl_FragCoord.w;
    float _851 = _847 * _849;
    float _853 = in.m_79.y;
    float _855 = gl_FragCoord.w;
    float _857 = _853 * _855;
    float _859 = in.m_81.y;
    float _861 = gl_FragCoord.w;
    float _863 = _859 * _861;
    float _865 = in.m_79.z;
    float _867 = gl_FragCoord.w;
    float _869 = _865 * _867;
    float _871 = in.m_81.x;
    float _873 = gl_FragCoord.w;
    float _875 = _871 * _873;
    float _877 = in.m_81.z;
    float _879 = gl_FragCoord.w;
    float _881 = _877 * _879;
    float _883 = _277 * _833;
    float _885 = _883 * _833;
    float _887 = in.m_79.x;
    float _889 = gl_FragCoord.w;
    float _891 = _887 * _889;
    float _893 = floor(_885);
    float _895 = _173 * _839;
    float _897 = _173 * _845;
    float _899 = _895 * _895;
    float _901 = _173 * _851;
    float _903 = _173 * _875;
    float _905 = _173 * _881;
    float _907 = -_893;
    float _909 = fma(_907, (*spvDescriptorSet0.fp_c9)._m0[49].y, _883);
    float _911 = fma(_897, _897, _899);
    float _913 = _909 + 9.9999997473787516355514526367188e-05;
    float _915 = fma(_901, _901, _911);
    float _917 = _173 * _857;
    float _919 = _173 * _869;
    float _921 = floor(_913);
    float _923 = _917 * _917;
    float _925 = _173 * _891;
    float _927 = _173 * _863;
    float _929 = rsqrt(_915);
    float _931 = fma(_925, _925, _923);
    float _933 = _927 * _927;
    float _935 = in.m_59.x;
    float _937 = fma(_919, _919, _931);
    float _939 = fma(_903, _903, _933);
    float _941 = -_921;
    float _943 = _913 + _941;
    float _945 = rsqrt(_937);
    float _947 = fma(_905, _905, _939);
    float _949 = _895 * _929;
    float _951 = _897 * _929;
    float _953 = _901 * _929;
    float _955 = rsqrt(_947);
    float _957 = _949 * _949;
    float _959 = in.m_71.z;
    float _961 = gl_FragCoord.w;
    float _963 = _959 * _961;
    float _965 = fma(_951, _951, _957);
    float _967 = fma(_953, _953, _965);
    float _969 = rsqrt(_967);
    float _971 = -_935;
    float _973 = fma(_971, _935, 1.0);
    float _975 = -_825;
    float _977 = _975 + _831;
    float _979 = -_823;
    float _981 = _979 + _829;
    float _983 = fma(_943, _977, _825);
    float _985 = fma(_943, _981, _823);
    float _987 = _983 * _983;
    float _989 = _983 * _955;
    float _991 = _985 * _945;
    float _993 = fma(_985, _985, _987);
    float _995 = precise::clamp(_993, 0.0, 1.0);
    float _997 = _927 * _989;
    float _999 = _903 * _989;
    float _1001 = -_995;
    float _1003 = _1001 + 1.0;
    float _1005 = 0.0 + _747;
    float _1007 = precise::clamp(_1005, 0.0, 1.0);
    float _1009 = fma(_917, _991, _997);
    float _1011 = fma(_925, _991, _999);
    float _1013 = sqrt(_1003);
    float _1015 = -_1007;
    float _1017 = _1015 + 1.0;
    float _1019 = _949 * _969;
    float _1021 = in.m_73.y;
    float _1023 = gl_FragCoord.w;
    float _1025 = _1021 * _1023;
    float _1027 = _973 * _1017;
    float _1029 = _905 * _989;
    float _1031 = in.m_71.x;
    float _1033 = gl_FragCoord.w;
    float _1035 = _1031 * _1033;
    float _1037 = fma(_1019, -0.5, 0.5);
    float _1039 = fma(_919, _991, _1029);
    float _1041 = in.m_73.z;
    float _1043 = gl_FragCoord.w;
    float _1045 = _1041 * _1043;
    float _1047 = _1037 * _1027;
    float _1049 = _969 * _1013;
    float _1051 = fma(_1019, _1013, _1009);
    float _1053 = fma(_951, _1049, _1011);
    float _1055 = _1051 * _1051;
    float _1057 = fma(_953, _1049, _1039);
    float _1059 = in.m_71.y;
    float _1061 = gl_FragCoord.w;
    float _1063 = _1059 * _1061;
    float _1065 = fma(_1053, _1053, _1055);
    float _1067 = in.m_73.x;
    float _1069 = gl_FragCoord.w;
    float _1071 = _1067 * _1069;
    float _1073 = fma(_1057, _1057, _1065);
    float _1075 = rsqrt(_1073);
    float _1077 = _173 * _1045;
    float _1079 = _1051 * _1075;
    float _1081 = _1057 * _1075;
    float _1083 = _1079 * (-0.816474258899688720703125);
    float _1085 = _173 * _1035;
    float _1087 = _173 * _1063;
    float _1089 = -_1083;
    float _1091 = fma(_1081, 0.577381789684295654296875, _1089);
    float _1093 = _173 * _1071;
    float _1095 = _173 * _1025;
    float _1097 = _173 * _963;
    float _1099 = fma(_1091, 0.5, 0.5);
    float _1101 = -_1093;
    float _1103 = _1101 + _1085;
    float _1105 = -_1095;
    float _1107 = _1105 + _1087;
    float _1109 = -_1077;
    float _1111 = _1109 + _1097;
    float _1113 = fma(_1099, _1103, _1093);
    float _1115 = fma(_1099, _1107, _1095);
    float _1117 = fma(_1099, _1111, _1077);
    if (!_775)
    {
        out.m_84.x = _1113;
        out.m_84.y = _1115;
        out.m_84.z = _1117;
        out.m_84.w = _757;
        return out;
    }
    float _1119 = in.m_86.x;
    float _1121 = gl_FragCoord.w;
    float _1123 = _1119 * _1121;
    float _1125 = abs(_951);
    float _1127 = abs(_949);
    float _1129 = precise::max(_1125, _1127);
    float _1131 = abs(_953);
    float _1133 = precise::max(_1131, _1129);
    float _1135 = fma(_1099, _1099, _1047);
    float _1137 = -_1135;
    float _1139 = _1137 + 1.0;
    float _1141 = precise::clamp(_1139, 0.0, 1.0);
    float _1143 = 1.0 / _1133;
    float _1145 = _951 * _1143;
    float _1147 = _949 * _1143;
    float _1149 = -_1143;
    float _1151 = _953 * _1149;
    float _1153 = _173 * _1123;
    float _1155 = _1141 + _1153;
    float _1157 = precise::min(_1155, 1.0);
    float3 _2924 = float3(_1145, _1147, _1151);
    float3 _1161 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2924, float3(0.0), isnan(_2924)), level(_1157)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2924, float3(0.0), isnan(_2924)), level(_1157)).xyz;
    float _1163 = _1161.x;
    float _1165 = _1161.y;
    float _1167 = _1161.z;
    float _1169 = in.m_88.x;
    float _1171 = gl_FragCoord.w;
    float _1173 = _1169 * _1171;
    float _1175 = in.m_88.y;
    float _1177 = gl_FragCoord.w;
    float _1179 = _1175 * _1177;
    float _1181 = in.m_88.z;
    float _1183 = gl_FragCoord.w;
    float _1185 = _1181 * _1183;
    float _1187 = in.m_90.x;
    float _1189 = gl_FragCoord.w;
    float _1191 = _1187 * _1189;
    float _1193 = in.m_90.y;
    float _1195 = gl_FragCoord.w;
    float _1197 = _1193 * _1195;
    float _1199 = in.m_90.z;
    float _1201 = gl_FragCoord.w;
    float _1203 = _1199 * _1201;
    float _1205 = in.m_92.x;
    float _1207 = gl_FragCoord.w;
    float _1209 = _1205 * _1207;
    float _1211 = in.m_92.y;
    float _1213 = gl_FragCoord.w;
    float _1215 = _1211 * _1213;
    float _1217 = in.m_92.z;
    float _1219 = gl_FragCoord.w;
    float _1221 = _1217 * _1219;
    float _1223 = in.m_92.w;
    float _1225 = gl_FragCoord.w;
    float _1227 = _1223 * _1225;
    float _1229 = -_747;
    float _1231 = _1229 + 1.0;
    bool _1233 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _1235 = -_1153;
    float _1237 = _1235 + 1.0;
    float _1239 = _1231 * _1231;
    float _1241 = precise::clamp(_1239, 0.0, 1.0);
    float _1243 = _1241 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _1245 = _1237 * _1243;
    if (_1233)
    {
        float _1247 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1249 = _709 + _1247;
        _785 = _1249;
    }
    float _1251 = _785;
    float _1253 = _1251;
    if (_1233)
    {
        float _1255 = _1251 * 8.0;
        float _1257 = precise::clamp(_1255, 0.0, 1.0);
        _1253 = _1257;
    }
    float _1259 = _1253;
    float _1261 = _173 * _1173;
    float _1263 = _173 * _1179;
    float _1265 = _173 * _1185;
    float _1267 = _1245 * 0.02624999918043613433837890625;
    float _1269 = _173 * _1197;
    float _1271 = _173 * _1203;
    float _1273 = _173 * _1221;
    float _1275 = fma(_1163, 0.20999999344348907470703125, _1261);
    float _1277 = fma(_1165, 0.20999999344348907470703125, _1263);
    float _1279 = fma(_1167, 0.20999999344348907470703125, _1265);
    float _1281 = _173 * _1191;
    float _1283 = fma(_1267, (*spvDescriptorSet0.fp_c15)._m0[17].x, _1275);
    float _1285 = fma(_1267, (*spvDescriptorSet0.fp_c15)._m0[17].y, _1277);
    float _1287 = fma(_1267, (*spvDescriptorSet0.fp_c15)._m0[17].z, _1279);
    float _1289 = _173 * _1209;
    float _1291 = _173 * _1215;
    float _1293 = _173 * _1227;
    float _1295 = _1283 + _1281;
    float _1297 = _1285 + _1269;
    float _1299 = _1287 + _1271;
    float _1301 = 0.0 + _765;
    float _1303 = precise::clamp(_1301, 0.0, 1.0);
    float _1305 = _1113 * _1295;
    float _1307 = _1115 * _1297;
    float _1309 = _1117 * _1299;
    float _1311 = _1303;
    if (_1233)
    {
        float _1313 = _1303 * _1259;
        _1311 = _1313;
    }
    float _1315 = _1311;
    float _1317 = fma(_1305, _1293, _1289);
    float _1319 = fma(_1307, _1293, _1291);
    float _1321 = fma(_1309, _1293, _1273);
    float _1323 = 0.0 + _1315;
    float _1325 = precise::clamp(_1323, 0.0, 1.0);
    out.m_84.x = _1317;
    out.m_84.y = _1319;
    out.m_84.z = _1321;
    out.m_84.w = _1325;
    return out;
}

