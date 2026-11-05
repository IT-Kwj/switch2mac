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
    constant _16* fp_c13 [[id(4)]];
    texture2d<float> fp_t_tcb_36 [[id(5)]];
    sampler fp_t_tcb_36Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_8 [[id(13)]];
    sampler fp_t_tcb_8Smplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_34 [[id(15)]];
    sampler fp_t_tcb_34Smplr [[id(16)]];
    texturecube<float> fp_t_tcb_1E [[id(17)]];
    sampler fp_t_tcb_1ESmplr [[id(18)]];
    sampler fp_t_tcb_36Smplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_10Smplr_w [[id(21)]];
    sampler fp_t_tcb_ASmplr_w [[id(22)]];
    sampler fp_t_tcb_8Smplr_w [[id(23)]];
    sampler fp_t_tcb_34Smplr_w [[id(24)]];
    sampler fp_t_tcb_1ESmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_86 [[color(0)]];
};

struct main0_in
{
    float4 m_73 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_61 [[user(locn4), flat]];
    float4 m_63 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_69 [[user(locn7), flat]];
    float4 m_67 [[user(locn8), flat]];
    float4 m_59 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_65 [[user(locn11), flat]];
    float4 m_83 [[user(locn12)]];
    float4 m_79 [[user(locn13)]];
    float4 m_55 [[user(locn14)]];
    float4 m_81 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 m_90 [[user(locn17)]];
    float4 m_88 [[user(locn18)]];
    float4 m_96 [[user(locn19)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _103 = gl_FragCoord.w;
    float _105 = in.m_55.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _113 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _115 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _117 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _115;
    float _119 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _121 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _111);
    float _123 = -_113;
    float _125 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _123);
    float _127 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _129 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _127;
    float _131 = _117 * _117;
    float _133 = -_119;
    float _135 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _133);
    float _137 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _121);
    float _139 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _141 = _125 * _125;
    float _143 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _145 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _143;
    float _147 = fma(_129, _129, _131);
    float _149 = -_139;
    float _151 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _149);
    float _153 = fma(_135, _135, _141);
    float _155 = in.m_55.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma(_145, _145, _147);
    float _163 = rsqrt(_137);
    float _165 = fma(_151, _151, _153);
    float _167 = rsqrt(_161);
    float _169 = in.m_55.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = rsqrt(_165);
    float _177 = 1.0 / _103;
    float _179 = _129 * _167;
    float _181 = _117 * _167;
    float _183 = _145 * _167;
    float _185 = _163 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _187 = _163 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _189 = _163 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _191 = _135 * _175;
    float _193 = _125 * _175;
    float _195 = _151 * _175;
    float _197 = _189 * _181;
    float _199 = _187 * _179;
    float _201 = _185 * _183;
    float _203 = _181 * _195;
    float _205 = -_197;
    float _207 = fma(_187, _183, _205);
    float _209 = _177 * _109;
    float _211 = -_199;
    float _213 = fma(_185, _181, _211);
    float _215 = -_203;
    float _217 = fma(_183, _193, _215);
    float _219 = _183 * _191;
    float _221 = -_201;
    float _223 = fma(_189, _179, _221);
    float _225 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _227 = _209 + _225;
    float _229 = _179 * _193;
    float _231 = _177 * _159;
    float _233 = -_219;
    float _235 = fma(_179, _195, _233);
    float _237 = _223 * _227;
    float _239 = _177 * _173;
    float _241 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _243 = _231 + _241;
    float _245 = _227 * _235;
    float _247 = -_229;
    float _249 = fma(_181, _191, _247);
    float _251 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _253 = _239 + _251;
    float _255 = fma(_207, _243, _237);
    float _257 = fma(_243, _217, _245);
    float _259 = in.m_57.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = in.m_59.x;
    float _267 = gl_FragCoord.w;
    float _269 = _265 * _267;
    float _271 = fma(_213, _253, _255);
    float _273 = fma(_253, _249, _257);
    float _275 = in.m_59.y;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_61.y;
    float _283 = in.m_63.z;
    float _285 = gl_FragCoord.w;
    float _287 = _283 * _285;
    float _289 = in.m_63.w;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = abs(_271);
    float _297 = abs(_273);
    float _299 = precise::max(_295, _297);
    float _301 = in.m_57.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_57.y;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    bool _315 = _299 >= 16.0;
    float _317 = _273 * _273;
    float _319 = fma(_271, _271, _317);
    float _321 = _273;
    float _323 = _271;
    int _326 = as_type<int>(_213);
    if (_315)
    {
        float _328 = _273 * 0.0625;
        _321 = _328;
    }
    float _330 = _321;
    if (_315)
    {
        float _332 = _271 * 0.0625;
        _323 = _332;
    }
    float _334 = _323;
    float _336 = abs(_330);
    bool _338 = _336 != 0.0;
    bool _340 = isnan(_336);
    bool _342 = _338 || _340;
    bool _344 = isnan(0.0);
    bool _346 = _342 || _344;
    float _348 = _177 * _263;
    float _350 = abs(_334);
    bool _352 = _350 == 0.0;
    float _354 = sqrt(_319);
    float _356 = abs(_334);
    bool _358 = _356 == 0.0;
    bool _360 = !_346;
    bool _362 = _358 && _360;
    float _364 = 1.0 / _348;
    bool _366 = false;
    if (_362)
    {
        bool _368 = as_type<int>(_334) >= 0;
        _366 = _368;
    }
    bool _370 = _366;
    int _372 = _370 ? (-1) : 0;
    if (_362)
    {
        int _374 = _370 ? 0 : 1078530011;
        _326 = _374;
    }
    int _376 = _326;
    int _378 = _376;
    if (_362)
    {
        int _380 = int(0x80000000) & as_type<int>(_330);
        int _382 = _376 | _380;
        _378 = _382;
    }
    int _384 = _378;
    bool _386 = !_346;
    bool _388 = _386 && _352;
    int _390 = _384;
    float _392 = as_type<float>(_384);
    if (!_388)
    {
        float _394 = abs(_330);
        bool _396 = _394 != as_type<float>(0x7f800000u /* inf */);
        bool _398 = isnan(_394);
        bool _400 = _396 || _398;
        bool _402 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _404 = _400 || _402;
        float _406 = abs(_334);
        bool _408 = _406 == as_type<float>(0x7f800000u /* inf */);
        float _410 = abs(_334);
        bool _412 = _410 == as_type<float>(0x7f800000u /* inf */);
        bool _414 = !_404;
        bool _416 = _412 && _414;
        if (_416)
        {
            bool _418 = as_type<int>(_334) >= 0;
            _372 = _418 ? (-1) : 0;
        }
        int _420 = _372;
        if (_416)
        {
            _390 = 1075235812;
        }
        int _422 = _390;
        int _424 = _422;
        if (_416)
        {
            int _426 = ~_420;
            int _428 = (_426 != 0) ? _422 : 1061752795;
            _424 = _428;
        }
        int _430 = _424;
        float _432 = as_type<float>(_430);
        if (_416)
        {
            int _434 = int(0x80000000) & as_type<int>(_330);
            int _436 = _430 | _434;
            _432 = as_type<float>(_436);
        }
        float _438 = _432;
        bool _440 = !_404;
        bool _442 = _440 && _408;
        _392 = _438;
        if (!_442)
        {
            float _444 = abs(_334);
            float _446 = abs(_330);
            float _448 = precise::max(_444, _446);
            float _450 = abs(_334);
            float _452 = abs(_330);
            float _454 = precise::min(_450, _452);
            float _456 = 1.0 / _448;
            float _458 = abs(_330);
            float _460 = abs(_334);
            bool _462 = _458 > _460;
            bool _464 = as_type<int>(_334) >= 0;
            float _466 = abs(_334);
            float _468 = abs(_330);
            float _470 = _466 + _468;
            int _472 = as_type<int>(_330) & int(0x80000000);
            bool _474 = _470 > as_type<float>(0x7f800000u /* inf */);
            bool _476 = isnan(_470);
            bool _478 = _474 || _476;
            bool _480 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _482 = _478 || _480;
            float _484 = _454 * _456;
            float _486 = _484 * _484;
            float _488 = _486 + 11.33538818359375;
            float _490 = fma(_486, _488, 28.84246826171875);
            float _492 = fma(_486, _490, 19.6966705322265625);
            float _494 = fma(_486, -0.82336294651031494140625, -5.674867153167724609375);
            float _496 = fma(_486, _494, -6.565555095672607421875);
            float _498 = 1.0 / _492;
            float _500 = _486 * _496;
            float _502 = _484 * _500;
            float _504 = fma(_502, _498, _484);
            float _506 = _504;
            _392 = _470;
            if (_462)
            {
                float _508 = -_504;
                float _510 = _508 + 1.57079637050628662109375;
                _506 = _510;
            }
            float _512 = _506;
            int _514 = as_type<int>(_512);
            if (!_464)
            {
                float _516 = -_512;
                float _518 = _516 + 3.1415927410125732421875;
                _514 = as_type<int>(_518);
            }
            int _520 = _514;
            if (!_482)
            {
                int _522 = _472 | _520;
                _392 = as_type<float>(_522);
            }
        }
    }
    float _524 = _392;
    float _526 = _281 * (-0.0199999995529651641845703125);
    float _528 = _177 * _287;
    float _530 = _524 * 4.7746486663818359375;
    float _532 = _177 * _269;
    float _534 = fma(_354, 0.100000001490116119384765625, _526);
    float _536 = _177 * _279;
    float _538 = _177 * _305;
    float _540 = _177 * _311;
    float2 _2044 = float2(_534, _530);
    float _542 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_2044, float2(0.0), isnan(_2044))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_2044, float2(0.0), isnan(_2044))).w;
    float2 _2054 = float2(_532, _536);
    float2 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2054, float2(0.0), isnan(_2054))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2054, float2(0.0), isnan(_2054))).xy;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = _538 * _364;
    float _554 = _177 * _293;
    float _556 = _540 * _364;
    float2 _2075 = float2(_552, _556);
    float _558 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2075, float2(0.0), isnan(_2075))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2075, float2(0.0), isnan(_2075))).x;
    float2 _2083 = float2(_528, _554);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2083, float2(0.0), isnan(_2083))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2083, float2(0.0), isnan(_2083))).w;
    float _562 = in.m_65.x;
    float _564 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _566 = in.m_67.x;
    float _568 = in.m_69.x;
    float _570 = in.m_63.x;
    float _572 = gl_FragCoord.w;
    float _574 = _570 * _572;
    float _576 = in.m_63.y;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = _354 * 0.20000000298023223876953125;
    float _584 = _562 + 1.0;
    float _586 = _566 * 0.02999999932944774627685546875;
    float _588 = _568 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _590 = _584 * _564;
    float _592 = floor(_590);
    float _594 = -_592;
    float _596 = fma(_594, (*spvDescriptorSet0.fp_c9)._m0[22].x, _584);
    float _598 = _542 * _582;
    float _600 = _550 * _588;
    float _602 = rint(_562);
    float _604 = precise::max(_602, 0.0);
    uint _607 = uint(_604);
    uint _609 = clamp(_607, 0u, 65535u);
    float _611 = _598 * _586;
    float _613 = _548 * _588;
    float _615 = fma(_530, _611, _600);
    float _617 = fma(_534, _611, _613);
    float _619 = rint(_596);
    float _621 = precise::max(_619, 0.0);
    uint _623 = uint(_621);
    uint _625 = clamp(_623, 0u, 65535u);
    float _627 = _177 * _574;
    float _629 = _177 * _580;
    float _631 = _617 + _627;
    float _633 = _615 + _629;
    float3 _2193 = float3(_631, _633, float(int(_609)));
    float3 _2197 = select(_2193, float3(0.0), isnan(_2193));
    float _635 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2197.xy, uint(rint(_2197.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2197.xy, uint(rint(_2197.z))).w;
    float3 _2206 = float3(_631, _633, float(int(_625)));
    float3 _2208 = select(_2206, float3(0.0), isnan(_2206));
    float _637 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2208.xy, uint(rint(_2208.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2208.xy, uint(rint(_2208.z))).w;
    float _639 = in.m_57.z;
    float _641 = gl_FragCoord.w;
    float _643 = _639 * _641;
    float _645 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _647 = in.m_71.x;
    float _649 = gl_FragCoord.w;
    float _651 = _647 * _649;
    float _653 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _655 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _653);
    float _657 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _655);
    float _659 = _281 * _645;
    float _661 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _663 = fma(_558, (*spvDescriptorSet0.fp_c8)._m0[30].w, _661);
    float _665 = fma(_560, 0.300000011920928955078125, -0.1500000059604644775390625);
    float _667 = _659 * _645;
    float _669 = rsqrt(_657);
    float _671 = floor(_667);
    float _673 = _177 * _643;
    float _675 = in.m_73.w;
    float _677 = gl_FragCoord.w;
    float _679 = _675 * _677;
    float _681 = _673 * _364;
    float _683 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _685 = fma(_681, (*spvDescriptorSet0.fp_c8)._m0[30].w, _683);
    float _687 = _669 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _689 = 1.0 / _663;
    float _691 = in.m_75.w;
    float _693 = gl_FragCoord.w;
    float _695 = _691 * _693;
    float _697 = fma(_687, -5.5, 7.0);
    float _699 = -_671;
    float _701 = fma(_699, (*spvDescriptorSet0.fp_c9)._m0[22].y, _659);
    float _703 = 1.0 / _685;
    float _705 = _701 + 9.9999997473787516355514526367188e-05;
    float _707 = 1.0 / _697;
    float _709 = floor(_705);
    float _711 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _713 = _703 * _711;
    float _715 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _717 = -_713;
    float _719 = fma(_689, _715, _717);
    float _721 = _719 * _707;
    float _723 = precise::clamp(_721, 0.0, 1.0);
    float _725 = _177 * _695;
    float _727 = _665 + _723;
    float _729 = -_709;
    float _731 = _705 + _729;
    float _733 = _177 * _679;
    float _735 = precise::max(_727, 0.1500000059604644775390625);
    float _737 = precise::min(_735, 0.3499999940395355224609375);
    float _739 = in.m_77.y;
    float _741 = gl_FragCoord.w;
    float _743 = _739 * _741;
    float _745 = -_635;
    float _747 = _745 + _637;
    float _749 = fma(_731, _747, _635);
    float _751 = -_733;
    float _753 = _751 + _749;
    float _755 = fma(_737, 5.000000476837158203125, -0.75000011920928955078125);
    float _757 = _725 * _753;
    float _759 = _757 * _755;
    float _761 = _177 * _651;
    float _763 = 0.0 + _759;
    float _765 = precise::clamp(_763, 0.0, 1.0);
    float _767 = _765 * _761;
    bool _769 = _767 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _771 = isnan(_767);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _777 = _773 || _775;
    float _779 = in.m_77.x;
    float _781 = gl_FragCoord.w;
    float _783 = _779 * _781;
    float _785 = _713;
    if (!_777)
    {
        discard_fragment();
    }
    float _787 = in.m_65.w;
    float _789 = _177 * _783;
    float _791 = _177 * _743;
    float _793 = _789 + _617;
    float _795 = _791 + _615;
    float _797 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[49].x;
    float _799 = _787 + 1.0;
    float _801 = rint(_787);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    uint _807 = clamp(_805, 0u, 65535u);
    float _809 = _799 * _797;
    float _811 = floor(_809);
    float _813 = -_811;
    float _815 = fma(_813, (*spvDescriptorSet0.fp_c9)._m0[49].x, _799);
    float _817 = rint(_815);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    uint _823 = clamp(_821, 0u, 65535u);
    float3 _2485 = float3(_793, _795, float(int(_807)));
    float3 _2487 = select(_2485, float3(0.0), isnan(_2485));
    float2 _825 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, _2487.xy, uint(rint(_2487.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, _2487.xy, uint(rint(_2487.z))).xy;
    float _827 = _825.x;
    float _829 = _825.y;
    float3 _2500 = float3(_793, _795, float(int(_823)));
    float3 _2502 = select(_2500, float3(0.0), isnan(_2500));
    float2 _831 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, _2502.xy, uint(rint(_2502.z))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, _2502.xy, uint(rint(_2502.z))).xy;
    float _833 = _831.x;
    float _835 = _831.y;
    float _837 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[49].y;
    float _839 = in.m_79.y;
    float _841 = gl_FragCoord.w;
    float _843 = _839 * _841;
    float _845 = in.m_79.x;
    float _847 = gl_FragCoord.w;
    float _849 = _845 * _847;
    float _851 = in.m_79.z;
    float _853 = gl_FragCoord.w;
    float _855 = _851 * _853;
    float _857 = in.m_81.y;
    float _859 = gl_FragCoord.w;
    float _861 = _857 * _859;
    float _863 = in.m_83.y;
    float _865 = gl_FragCoord.w;
    float _867 = _863 * _865;
    float _869 = in.m_81.z;
    float _871 = gl_FragCoord.w;
    float _873 = _869 * _871;
    float _875 = in.m_83.x;
    float _877 = gl_FragCoord.w;
    float _879 = _875 * _877;
    float _881 = in.m_83.z;
    float _883 = gl_FragCoord.w;
    float _885 = _881 * _883;
    float _887 = _281 * _837;
    float _889 = _887 * _837;
    float _891 = in.m_81.x;
    float _893 = gl_FragCoord.w;
    float _895 = _891 * _893;
    float _897 = floor(_889);
    float _899 = _177 * _843;
    float _901 = _177 * _849;
    float _903 = _177 * _861;
    float _905 = _899 * _899;
    float _907 = _177 * _867;
    float _909 = -_897;
    float _911 = fma(_909, (*spvDescriptorSet0.fp_c9)._m0[49].y, _887);
    float _913 = _177 * _855;
    float _915 = _903 * _903;
    float _917 = _907 * _907;
    float _919 = _911 + 9.9999997473787516355514526367188e-05;
    float _921 = fma(_901, _901, _905);
    float _923 = _177 * _885;
    float _925 = floor(_919);
    float _927 = fma(_913, _913, _921);
    float _929 = _177 * _873;
    float _931 = _177 * _895;
    float _933 = _177 * _879;
    float _935 = rsqrt(_927);
    float _937 = fma(_931, _931, _915);
    float _939 = in.m_61.x;
    float _941 = fma(_929, _929, _937);
    float _943 = fma(_933, _933, _917);
    float _945 = -_925;
    float _947 = _919 + _945;
    float _949 = rsqrt(_941);
    float _951 = fma(_923, _923, _943);
    float _953 = _899 * _935;
    float _955 = _901 * _935;
    float _957 = _913 * _935;
    float _959 = _953 * _953;
    float _961 = rsqrt(_951);
    float _963 = in.m_73.z;
    float _965 = gl_FragCoord.w;
    float _967 = _963 * _965;
    float _969 = -_939;
    float _971 = fma(_969, _939, 1.0);
    float _973 = -_829;
    float _975 = _973 + _835;
    float _977 = -_827;
    float _979 = _977 + _833;
    float _981 = fma(_955, _955, _959);
    float _983 = fma(_947, _975, _829);
    float _985 = fma(_947, _979, _827);
    float _987 = fma(_957, _957, _981);
    float _989 = _983 * _983;
    float _991 = _983 * _961;
    float _993 = _985 * _949;
    float _995 = fma(_985, _985, _989);
    float _997 = precise::clamp(_995, 0.0, 1.0);
    float _999 = rsqrt(_987);
    float _1001 = _907 * _991;
    float _1003 = _933 * _991;
    float _1005 = -_997;
    float _1007 = _1005 + 1.0;
    float _1009 = 0.0 + _749;
    float _1011 = precise::clamp(_1009, 0.0, 1.0);
    float _1013 = fma(_903, _993, _1001);
    float _1015 = _923 * _991;
    float _1017 = fma(_931, _993, _1003);
    float _1019 = -_1011;
    float _1021 = _1019 + 1.0;
    float _1023 = sqrt(_1007);
    float _1025 = fma(_929, _993, _1015);
    float _1027 = in.m_75.y;
    float _1029 = gl_FragCoord.w;
    float _1031 = _1027 * _1029;
    float _1033 = _971 * _1021;
    float _1035 = in.m_73.x;
    float _1037 = gl_FragCoord.w;
    float _1039 = _1035 * _1037;
    float _1041 = _953 * _999;
    float _1043 = fma(_1041, -0.5, 0.5);
    float _1045 = _999 * _1023;
    float _1047 = fma(_1041, _1023, _1013);
    float _1049 = _1043 * _1033;
    float _1051 = in.m_75.x;
    float _1053 = gl_FragCoord.w;
    float _1055 = _1051 * _1053;
    float _1057 = fma(_955, _1045, _1017);
    float _1059 = _1047 * _1047;
    float _1061 = fma(_957, _1045, _1025);
    float _1063 = in.m_75.z;
    float _1065 = gl_FragCoord.w;
    float _1067 = _1063 * _1065;
    float _1069 = fma(_1057, _1057, _1059);
    float _1071 = fma(_1061, _1061, _1069);
    float _1073 = in.m_73.y;
    float _1075 = gl_FragCoord.w;
    float _1077 = _1073 * _1075;
    float _1079 = rsqrt(_1071);
    float _1081 = _1047 * _1079;
    float _1083 = _1061 * _1079;
    float _1085 = _177 * _1055;
    float _1087 = _177 * _1039;
    float _1089 = _1081 * (-0.816474258899688720703125);
    float _1091 = _177 * _1067;
    float _1093 = -_1085;
    float _1095 = _1093 + _1087;
    float _1097 = -_1089;
    float _1099 = fma(_1083, 0.577381789684295654296875, _1097);
    float _1101 = _177 * _1031;
    float _1103 = fma(_1099, 0.5, 0.5);
    float _1105 = _177 * _1077;
    float _1107 = _177 * _967;
    float _1109 = fma(_1103, _1095, _1085);
    float _1111 = -_1101;
    float _1113 = _1111 + _1105;
    float _1115 = -_1091;
    float _1117 = _1115 + _1107;
    float _1119 = fma(_1103, _1113, _1101);
    float _1121 = fma(_1103, _1117, _1091);
    if (!_777)
    {
        out.m_86.x = _1109;
        out.m_86.y = _1119;
        out.m_86.z = _1121;
        out.m_86.w = _759;
        return out;
    }
    float _1123 = in.m_88.x;
    float _1125 = gl_FragCoord.w;
    float _1127 = _1123 * _1125;
    float _1129 = abs(_955);
    float _1131 = abs(_953);
    float _1133 = precise::max(_1129, _1131);
    float _1135 = fma(_1103, _1103, _1049);
    float _1137 = abs(_957);
    float _1139 = precise::max(_1137, _1133);
    float _1141 = -_1135;
    float _1143 = _1141 + 1.0;
    float _1145 = precise::clamp(_1143, 0.0, 1.0);
    float _1147 = 1.0 / _1139;
    float _1149 = _955 * _1147;
    float _1151 = -_1147;
    float _1153 = _957 * _1151;
    float _1155 = _177 * _1127;
    float _1157 = _953 * _1147;
    float _1159 = _1145 + _1155;
    float _1161 = precise::min(_1159, 1.0);
    float3 _2974 = float3(_1149, _1157, _1153);
    float3 _1165 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2974, float3(0.0), isnan(_2974)), level(_1161)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2974, float3(0.0), isnan(_2974)), level(_1161)).xyz;
    float _1167 = _1165.x;
    float _1169 = _1165.y;
    float _1171 = _1165.z;
    float _1173 = in.m_90.x;
    float _1175 = gl_FragCoord.w;
    float _1177 = _1173 * _1175;
    float _1179 = in.m_90.y;
    float _1181 = gl_FragCoord.w;
    float _1183 = _1179 * _1181;
    float _1185 = in.m_92.x;
    float _1187 = gl_FragCoord.w;
    float _1189 = _1185 * _1187;
    float _1191 = in.m_92.y;
    float _1193 = gl_FragCoord.w;
    float _1195 = _1191 * _1193;
    float _1197 = in.m_92.z;
    float _1199 = gl_FragCoord.w;
    float _1201 = _1197 * _1199;
    float _1203 = in.m_90.z;
    float _1205 = gl_FragCoord.w;
    float _1207 = _1203 * _1205;
    float _1209 = in.m_94.x;
    float _1211 = gl_FragCoord.w;
    float _1213 = _1209 * _1211;
    float _1215 = in.m_94.y;
    float _1217 = gl_FragCoord.w;
    float _1219 = _1215 * _1217;
    float _1221 = in.m_94.z;
    float _1223 = gl_FragCoord.w;
    float _1225 = _1221 * _1223;
    float _1227 = in.m_96.x;
    float _1229 = gl_FragCoord.w;
    float _1231 = _1227 * _1229;
    float _1233 = in.m_96.z;
    float _1235 = gl_FragCoord.w;
    float _1237 = _1233 * _1235;
    float _1239 = in.m_96.w;
    float _1241 = gl_FragCoord.w;
    float _1243 = _1239 * _1241;
    float _1245 = -_749;
    float _1247 = _1245 + 1.0;
    float _1249 = in.m_96.y;
    float _1251 = gl_FragCoord.w;
    float _1253 = _1249 * _1251;
    bool _1255 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _1257 = _1247 * _1247;
    float _1259 = precise::clamp(_1257, 0.0, 1.0);
    float _1261 = -_1155;
    float _1263 = _1261 + 1.0;
    float _1265 = _1259 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _1267 = _1263 * _1265;
    if (_1255)
    {
        float _1269 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1271 = _713 + _1269;
        _785 = _1271;
    }
    float _1273 = _785;
    float _1275 = _177 * _1177;
    float _1277 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _1279 = _1277 + 1.0;
    float _1281 = _177 * _1183;
    float _1283 = _177 * _1189;
    float _1285 = _177 * _1201;
    float _1287 = fma(_1275, (*spvDescriptorSet0.fp_c13)._m0[0].y, _1279);
    float _1289 = fma(_1281, (*spvDescriptorSet0.fp_c13)._m0[0].y, _1279);
    float _1291 = _177 * _1195;
    float _1293 = _177 * _1207;
    float _1295 = _177 * _1213;
    float _1297 = _1119 * _1289;
    float _1299 = precise::clamp(_1297, 0.0, 1.0);
    float _1301 = _1267 * 0.02624999918043613433837890625;
    float _1303 = fma(_1293, (*spvDescriptorSet0.fp_c13)._m0[0].y, _1279);
    float _1305 = _177 * _1219;
    float _1307 = _177 * _1225;
    float _1309 = _177 * _1237;
    float _1311 = _1109 * _1287;
    float _1313 = precise::clamp(_1311, 0.0, 1.0);
    float _1315 = _1121 * _1303;
    float _1317 = precise::clamp(_1315, 0.0, 1.0);
    float _1319 = _1273;
    if (_1255)
    {
        float _1321 = _1273 * 8.0;
        float _1323 = precise::clamp(_1321, 0.0, 1.0);
        _1319 = _1323;
    }
    float _1325 = _1319;
    float _1327 = fma(_1167, 0.20999999344348907470703125, _1283);
    float _1329 = fma(_1169, 0.20999999344348907470703125, _1291);
    float _1331 = fma(_1171, 0.20999999344348907470703125, _1285);
    float _1333 = _177 * _1231;
    float _1335 = fma(_1301, (*spvDescriptorSet0.fp_c15)._m0[17].x, _1327);
    float _1337 = fma(_1301, (*spvDescriptorSet0.fp_c15)._m0[17].y, _1329);
    float _1339 = fma(_1301, (*spvDescriptorSet0.fp_c15)._m0[17].z, _1331);
    float _1341 = _177 * _1253;
    float _1343 = _177 * _1243;
    float _1345 = _1335 + _1295;
    float _1347 = _1337 + _1305;
    float _1349 = _1339 + _1307;
    float _1351 = 0.0 + _767;
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = _1313 * _1345;
    float _1357 = _1299 * _1347;
    float _1359 = _1317 * _1349;
    float _1361 = _1353;
    if (_1255)
    {
        float _1363 = _1353 * _1325;
        _1361 = _1363;
    }
    float _1365 = _1361;
    float _1367 = fma(_1355, _1343, _1333);
    float _1369 = fma(_1357, _1343, _1341);
    float _1371 = fma(_1359, _1343, _1309);
    float _1373 = 0.0 + _1365;
    float _1375 = precise::clamp(_1373, 0.0, 1.0);
    out.m_86.x = _1367;
    out.m_86.y = _1369;
    out.m_86.z = _1371;
    out.m_86.w = _1375;
    return out;
}

