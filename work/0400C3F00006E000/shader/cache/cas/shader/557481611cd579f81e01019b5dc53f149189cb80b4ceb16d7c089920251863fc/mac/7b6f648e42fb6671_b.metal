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
    texture2d<float> fp_t_tcb_34 [[id(4)]];
    sampler fp_t_tcb_34Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_8 [[id(10)]];
    sampler fp_t_tcb_8Smplr [[id(11)]];
    texture2d_array<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    texturecube<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    sampler fp_t_tcb_8Smplr_w [[id(19)]];
    sampler fp_t_tcb_ASmplr_w [[id(20)]];
    sampler fp_t_tcb_1ESmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_84 [[color(0)]];
};

struct main0_in
{
    float4 m_69 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_63 [[user(locn3), flat]];
    float4 m_81 [[user(locn4)]];
    float4 m_88 [[user(locn5), flat]];
    float4 m_77 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_75 [[user(locn12)]];
    float4 m_94 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_90 [[user(locn16)]];
    float4 m_55 [[user(locn17)]];
    float4 m_59 [[user(locn18), flat]];
    float4 m_67 [[user(locn19), flat]];
    float4 m_65 [[user(locn20)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _101 = gl_FragCoord.w;
    float _103 = in.m_51.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _111 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _113 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _115 = (*spvDescriptorSet0.fp_c8)._m0[29].y + _113;
    float _117 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _109);
    float _119 = -_111;
    float _121 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _119);
    float _123 = _115 * _115;
    float _125 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _127 = (*spvDescriptorSet0.fp_c8)._m0[29].x + _125;
    float _129 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _131 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _117);
    float _133 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _135 = (*spvDescriptorSet0.fp_c8)._m0[29].z + _133;
    float _137 = fma(_127, _127, _123);
    float _139 = -_129;
    float _141 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _139);
    float _143 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _145 = _121 * _121;
    float _147 = fma(_135, _135, _137);
    float _149 = in.m_51.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = -_143;
    float _157 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _155);
    float _159 = fma(_141, _141, _145);
    float _161 = rsqrt(_131);
    float _163 = in.m_51.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = fma(_157, _157, _159);
    float _171 = rsqrt(_147);
    float _173 = rsqrt(_169);
    float _175 = 1.0 / _101;
    float _177 = _127 * _171;
    float _179 = _115 * _171;
    float _181 = _161 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _183 = _161 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _185 = _161 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _187 = _135 * _171;
    float _189 = _121 * _173;
    float _191 = _141 * _173;
    float _193 = _157 * _173;
    float _195 = _185 * _179;
    float _197 = _183 * _177;
    float _199 = _181 * _187;
    float _201 = _179 * _193;
    float _203 = -_195;
    float _205 = fma(_183, _187, _203);
    float _207 = -_197;
    float _209 = fma(_181, _179, _207);
    float _211 = _175 * _107;
    float _213 = _187 * _191;
    float _215 = -_201;
    float _217 = fma(_187, _189, _215);
    float _219 = -_199;
    float _221 = fma(_185, _177, _219);
    float _223 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _225 = _211 + _223;
    float _227 = _175 * _153;
    float _229 = -_213;
    float _231 = fma(_177, _193, _229);
    float _233 = _177 * _189;
    float _235 = _221 * _225;
    float _237 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _239 = _227 + _237;
    float _241 = _175 * _167;
    float _243 = _225 * _231;
    float _245 = -_233;
    float _247 = fma(_179, _191, _245);
    float _249 = fma(_205, _239, _235);
    float _251 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _253 = _241 + _251;
    float _255 = fma(_239, _217, _243);
    float _257 = in.m_53.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_53.y;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = fma(_209, _253, _249);
    float _271 = fma(_253, _247, _255);
    float _273 = _271 * 0.0625;
    float _275 = abs(_269);
    float _277 = abs(_271);
    float _279 = precise::max(_275, _277);
    bool _283 = _279 >= 16.0;
    float _285 = _269 * (-0.0625);
    float _287 = _283 ? _273 : _271;
    float _289 = -_269;
    float _291 = _283 ? _285 : _289;
    float _293 = _271 * _271;
    float _295 = abs(_287);
    bool _297 = _295 != 0.0;
    bool _299 = isnan(_295);
    bool _301 = _297 || _299;
    bool _303 = isnan(0.0);
    bool _305 = _301 || _303;
    float _307 = abs(_291);
    bool _309 = _307 == 0.0;
    float _311 = fma(_269, _269, _293);
    float _313 = abs(_291);
    bool _315 = _313 == 0.0;
    bool _317 = !_305;
    bool _319 = _315 && _317;
    float _321 = sqrt(_311);
    float _323 = _175 * _261;
    float _325 = _175 * _267;
    bool _327 = false;
    int _330 = as_type<int>(_273);
    float _332 = _175;
    if (_319)
    {
        bool _334 = as_type<int>(_291) >= 0;
        _327 = _334;
    }
    bool _336 = _327;
    int _338 = _336 ? (-1) : 0;
    if (_319)
    {
        int _340 = _336 ? 0 : 1078530011;
        _330 = _340;
    }
    int _342 = _330;
    int _344 = _342;
    if (_319)
    {
        int _346 = int(0x80000000) & as_type<int>(_287);
        int _348 = _342 | _346;
        _344 = _348;
    }
    int _350 = _344;
    bool _352 = !_305;
    bool _354 = _352 && _309;
    int _356 = _350;
    float _358 = as_type<float>(_350);
    if (!_354)
    {
        float _360 = abs(_287);
        bool _362 = _360 != as_type<float>(0x7f800000u /* inf */);
        bool _364 = isnan(_360);
        bool _366 = _362 || _364;
        bool _368 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _370 = _366 || _368;
        float _372 = abs(_291);
        bool _374 = _372 == as_type<float>(0x7f800000u /* inf */);
        float _376 = abs(_291);
        bool _378 = _376 == as_type<float>(0x7f800000u /* inf */);
        bool _380 = !_370;
        bool _382 = _378 && _380;
        if (_382)
        {
            bool _384 = as_type<int>(_291) >= 0;
            _338 = _384 ? (-1) : 0;
        }
        int _386 = _338;
        if (_382)
        {
            _356 = 1075235812;
        }
        int _388 = _356;
        int _390 = _388;
        if (_382)
        {
            int _392 = ~_386;
            int _394 = (_392 != 0) ? _388 : 1061752795;
            _390 = _394;
        }
        int _396 = _390;
        float _398 = as_type<float>(_396);
        if (_382)
        {
            int _400 = int(0x80000000) & as_type<int>(_287);
            int _402 = _396 | _400;
            _398 = as_type<float>(_402);
        }
        float _404 = _398;
        bool _406 = !_370;
        bool _408 = _406 && _374;
        _358 = _404;
        if (!_408)
        {
            float _410 = abs(_287);
            float _412 = abs(_291);
            float _414 = precise::max(_410, _412);
            float _416 = abs(_287);
            float _418 = abs(_291);
            float _420 = precise::min(_416, _418);
            float _422 = 1.0 / _414;
            float _424 = abs(_287);
            float _426 = abs(_291);
            bool _428 = _424 > _426;
            bool _430 = as_type<int>(_291) >= 0;
            float _432 = _420 * _422;
            float _434 = abs(_287);
            float _436 = abs(_291);
            float _438 = _434 + _436;
            int _440 = as_type<int>(_287) & int(0x80000000);
            float _442 = _432 * _432;
            bool _444 = _438 > as_type<float>(0x7f800000u /* inf */);
            bool _446 = isnan(_438);
            bool _448 = _444 || _446;
            bool _450 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _452 = _448 || _450;
            float _454 = _442 + 11.33538818359375;
            float _456 = fma(_442, _454, 28.84246826171875);
            float _458 = fma(_442, _456, 19.6966705322265625);
            float _460 = fma(_442, -0.82336294651031494140625, -5.674867153167724609375);
            float _462 = fma(_442, _460, -6.565555095672607421875);
            float _464 = 1.0 / _458;
            float _466 = _442 * _462;
            float _468 = _432 * _466;
            float _470 = fma(_468, _464, _432);
            float _472 = _470;
            _358 = _438;
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
            if (!_452)
            {
                int _488 = _440 | _486;
                _358 = as_type<float>(_488);
            }
        }
    }
    float _490 = _358;
    float _492 = _490 * 2.0690143108367919921875;
    float _494 = _321 * 0.60000002384185791015625;
    float2 _1962 = float2(_323, _325);
    float2 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1962, float2(0.0), isnan(_1962))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1962, float2(0.0), isnan(_1962))).xy;
    float _500 = _498.x;
    float _502 = _498.y;
    float2 _1976 = float2(_492, _494);
    float _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1976, float2(0.0), isnan(_1976))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1976, float2(0.0), isnan(_1976))).w;
    float _506 = in.m_55.y;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_55.x;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_57.w;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_59.x;
    float _526 = in.m_59.y;
    float _528 = in.m_61.x;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_61.y;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_57.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_57.y;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = in.m_63.x;
    float _554 = in.m_65.x;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_65.y;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = precise::max(_321, 0.20000000298023223876953125);
    float _568 = precise::min(_566, 0.800000011920928955078125);
    float _570 = fma(_568, 1.66666662693023681640625, -0.3333333432674407958984375);
    float _572 = _175 * _510;
    float _574 = _175 * _516;
    float _576 = _175 * _522;
    float _578 = -_572;
    float _580 = _578 + 0.5;
    float _582 = -_574;
    float _584 = _582 + 0.5;
    float _586 = _526 * (-0.25);
    float _588 = _175 * _544;
    float _590 = _580 * _580;
    float _592 = _175 * _550;
    float _594 = in.m_67.x;
    float _596 = rint(_552);
    float _598 = precise::max(_596, 0.0);
    uint _601 = uint(_598);
    uint _603 = clamp(_601, 0u, 65535u);
    float _605 = fma(_584, _584, _590);
    float _607 = _175 * _564;
    float _609 = fma(_574, 2.0, -1.0);
    float _611 = sqrt(_605);
    float _613 = fma(_572, 2.0, -1.0);
    float _615 = fma(_611, 2.0, -1.0);
    float _617 = _615 * _586;
    float _619 = _500 * _524;
    float _621 = _502 * _524;
    float _623 = 1.0 / _576;
    float _625 = _175 * _532;
    float _627 = _175 * _538;
    float _629 = _504 * _570;
    float _631 = _175 * _558;
    float _633 = _625 + _619;
    float _635 = _627 + _621;
    float _637 = _629 * _594;
    float _639 = _619 + _631;
    float _641 = -_609;
    float _643 = fma(_641, _617, _633);
    float _645 = _621 + _607;
    float _647 = -_613;
    float _649 = fma(_647, _617, _635);
    float _651 = fma(_271, _637, _649);
    float _653 = _588 * _623;
    float _655 = _592 * _623;
    float _657 = -_269;
    float _659 = fma(_657, _637, _643);
    float2 _2188 = float2(_653, _655);
    float _661 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2188, float2(0.0), isnan(_2188))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2188, float2(0.0), isnan(_2188))).x;
    float2 _2196 = float2(_639, _645);
    float _663 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2196, float2(0.0), isnan(_2196))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2196, float2(0.0), isnan(_2196))).w;
    float3 _2207 = float3(_659, _651, float(int(_603)));
    float3 _2211 = select(_2207, float3(0.0), isnan(_2207));
    float4 _666 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2211.xy, uint(rint(_2211.z))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2211.xy, uint(rint(_2211.z))).xyzw;
    float _668 = _666.x;
    float _670 = _666.y;
    float _672 = _666.z;
    float _674 = _666.w;
    float _676 = in.m_57.z;
    float _678 = gl_FragCoord.w;
    float _680 = _676 * _678;
    float _682 = in.m_69.w;
    float _684 = gl_FragCoord.w;
    float _686 = _682 * _684;
    float _688 = in.m_71.w;
    float _690 = gl_FragCoord.w;
    float _692 = _688 * _690;
    float _694 = in.m_73.w;
    float _696 = gl_FragCoord.w;
    float _698 = _694 * _696;
    float _700 = _175 * _680;
    float _702 = _700 * _623;
    float _704 = in.m_59.z;
    float _706 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _708 = fma(_702, (*spvDescriptorSet0.fp_c8)._m0[30].w, _706);
    float _710 = _175 * _692;
    float _712 = 1.0 / _708;
    float _714 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _716 = _712 * _714;
    float _718 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _720 = fma(_661, (*spvDescriptorSet0.fp_c8)._m0[30].w, _718);
    float _722 = _175 * _686;
    float _724 = fma(_668, -2.0, 2.0);
    float _726 = fma(_722, 2.0, -1.0);
    float _728 = 1.0 / _720;
    float _730 = fma(_663, _710, _726);
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = _674 * _732;
    float _736 = in.m_75.x;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = _710 * _734;
    float _744 = _175 * _698;
    float _746 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _748 = -_716;
    float _750 = fma(_728, _746, _748);
    float _752 = _742 * _744;
    float _754 = 1.0 / _704;
    float _756 = _724 + _750;
    float _758 = precise::max(0.0, _752);
    float _760 = precise::max(_756, 2.0);
    float _762 = precise::min(_704, _758);
    float _764 = precise::min(_760, 2.5);
    float _766 = fma(_764, 2.0, -4.0);
    float _768 = _762 * _754;
    float _770 = _768 * _766;
    float _772 = _175 * _740;
    float _774 = 0.0 + _770;
    float _776 = precise::clamp(_774, 0.0, 1.0);
    float _778 = _776 * _772;
    bool _780 = _778 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _782 = isnan(_778);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _788 = _784 || _786;
    float _790 = in.m_63.y;
    float _792 = _716;
    if (!_788)
    {
        discard_fragment();
    }
    float _794 = rint(_790);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    uint _800 = clamp(_798, 0u, 65535u);
    float3 _2401 = float3(_659, _651, float(int(_800)));
    float3 _2403 = select(_2401, float3(0.0), isnan(_2401));
    float2 _802 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _2403.xy, uint(rint(_2403.z))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _2403.xy, uint(rint(_2403.z))).xy;
    float _804 = _802.x;
    float _806 = _802.y;
    float _808 = in.m_77.y;
    float _810 = gl_FragCoord.w;
    float _812 = _808 * _810;
    float _814 = in.m_77.x;
    float _816 = gl_FragCoord.w;
    float _818 = _814 * _816;
    float _820 = in.m_79.y;
    float _822 = gl_FragCoord.w;
    float _824 = _820 * _822;
    float _826 = in.m_77.z;
    float _828 = gl_FragCoord.w;
    float _830 = _826 * _828;
    float _832 = in.m_79.x;
    float _834 = gl_FragCoord.w;
    float _836 = _832 * _834;
    float _838 = in.m_81.y;
    float _840 = gl_FragCoord.w;
    float _842 = _838 * _840;
    float _844 = in.m_81.x;
    float _846 = gl_FragCoord.w;
    float _848 = _844 * _846;
    float _850 = in.m_79.z;
    float _852 = gl_FragCoord.w;
    float _854 = _850 * _852;
    float _856 = in.m_81.z;
    float _858 = gl_FragCoord.w;
    float _860 = _856 * _858;
    float _862 = in.m_69.x;
    float _864 = gl_FragCoord.w;
    float _866 = _862 * _864;
    float _868 = in.m_69.y;
    float _870 = gl_FragCoord.w;
    float _872 = _868 * _870;
    float _874 = in.m_69.z;
    float _876 = gl_FragCoord.w;
    float _878 = _874 * _876;
    float _880 = _175 * _812;
    float _882 = _175 * _818;
    float _884 = _175 * _824;
    float _886 = _175 * _830;
    float _888 = _880 * _880;
    float _890 = _175 * _842;
    float _892 = _884 * _884;
    float _894 = _175 * _854;
    float _896 = fma(_882, _882, _888);
    float _898 = _175 * _836;
    float _900 = _890 * _890;
    float _902 = _175 * _860;
    float _904 = fma(_886, _886, _896);
    float _906 = fma(_898, _898, _892);
    float _908 = _175 * _848;
    float _910 = _175 * _872;
    float _912 = rsqrt(_904);
    float _914 = fma(_894, _894, _906);
    float _916 = fma(_908, _908, _900);
    float _918 = _175 * _866;
    float _920 = _175 * _878;
    float _922 = fma(_902, _902, _916);
    float _924 = _918 * 0.14999997615814208984375;
    float _926 = rsqrt(_914);
    float _928 = _910 * 0.14999997615814208984375;
    float _930 = _920 * 0.14999997615814208984375;
    float _932 = _668 * _924;
    float _934 = _670 * _928;
    float _936 = _672 * _930;
    float _938 = rsqrt(_922);
    float _940 = _882 * _912;
    float _942 = _880 * _912;
    float _944 = _886 * _912;
    float _946 = fma(_910, 0.85000002384185791015625, _934);
    float _948 = fma(_920, 0.85000002384185791015625, _936);
    float _950 = _898 * _926;
    float _952 = _884 * _926;
    float _954 = _894 * _926;
    float _956 = fma(_918, 0.85000002384185791015625, _932);
    float _958 = _908 * _938;
    float _960 = _890 * _938;
    float _962 = _902 * _938;
    if (!_788)
    {
        out.m_84.x = _956;
        out.m_84.y = _946;
        out.m_84.z = _948;
        out.m_84.w = _770;
        return out;
    }
    float _964 = _806 * _806;
    float _966 = _806 * _958;
    float _968 = _942 * _942;
    float _970 = _806 * _962;
    float _972 = fma(_804, _804, _964);
    float _974 = precise::clamp(_972, 0.0, 1.0);
    float _976 = fma(_804, _950, _966);
    float _978 = fma(_940, _940, _968);
    float _980 = _806 * 1.60000002384185791015625;
    float _982 = -_974;
    float _984 = _982 + 1.0;
    float _986 = _806 * _960;
    float _988 = fma(_804, _954, _970);
    float _990 = fma(_944, _944, _978);
    float _992 = sqrt(_984);
    float _994 = fma(_804, _952, _986);
    float _996 = _804 * 1.60000002384185791015625;
    float _998 = _980 * _980;
    float _1000 = _980 * _960;
    float _1002 = fma(_996, _996, _998);
    float _1004 = precise::clamp(_1002, 0.0, 1.0);
    float _1006 = rsqrt(_990);
    float _1008 = fma(_996, _952, _1000);
    float _1010 = -_1004;
    float _1012 = _1010 + 1.0;
    float _1014 = fma(_942, _992, _994);
    float _1016 = fma(_940, _992, _976);
    float _1018 = fma(_944, _992, _988);
    float _1020 = sqrt(_1012);
    float _1022 = _1014 * _1014;
    float _1024 = fma(_1016, _1016, _1022);
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = in.m_86.x;
    float _1030 = gl_FragCoord.w;
    float _1032 = _1028 * _1030;
    float _1034 = rsqrt(_1026);
    float _1036 = _1006 * _1020;
    float _1038 = fma(_942, _1036, _1008);
    float _1040 = fma(_1038, -0.666666686534881591796875, 0.666666686534881591796875);
    float _1042 = precise::clamp(_1040, 0.0, 1.0);
    float _1044 = fma(_1042, -2.0, 3.0);
    float _1046 = _1016 * _1034;
    float _1048 = _1014 * _1034;
    float _1050 = _1018 * _1034;
    float _1052 = _1042 * _1042;
    float _1054 = abs(_1046);
    float _1056 = abs(_1048);
    float _1058 = precise::max(_1054, _1056);
    float _1060 = _1052 * _1044;
    float _1062 = abs(_1050);
    float _1064 = precise::max(_1062, _1058);
    float _1066 = 1.0 / _1064;
    float _1068 = _175 * _1032;
    float _1070 = fma(_1060, 0.800000011920928955078125, _1068);
    float _1072 = precise::min(_1070, 1.0);
    float _1074 = _1046 * _1066;
    float _1076 = _1048 * _1066;
    float _1078 = -_1066;
    float _1080 = _1050 * _1078;
    float3 _2811 = float3(_1074, _1076, _1080);
    float3 _1084 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_2811, float3(0.0), isnan(_2811)), level(_1072)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_2811, float3(0.0), isnan(_2811)), level(_1072)).xyz;
    float _1086 = _1084.x;
    float _1088 = _1084.y;
    float _1090 = _1084.z;
    float _1092 = in.m_88.y;
    float _1094 = in.m_88.x;
    float _1096 = in.m_88.z;
    float _1098 = in.m_90.y;
    float _1100 = gl_FragCoord.w;
    float _1102 = _1098 * _1100;
    float _1104 = in.m_90.z;
    float _1106 = gl_FragCoord.w;
    float _1108 = _1104 * _1106;
    float _1110 = -_1068;
    float _1112 = _1110 + 1.0;
    float _1114 = _668 * _1112;
    float _1116 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _1118 = _1092 + _1116;
    float _1120 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _1122 = _1094 + _1120;
    float _1124 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _1126 = _1096 + _1124;
    float _1128 = _980 * _958;
    float _1130 = _1118 * _1118;
    float _1132 = in.m_73.x;
    float _1134 = gl_FragCoord.w;
    float _1136 = _1132 * _1134;
    float _1138 = _980 * _962;
    float _1140 = fma(_996, _950, _1128);
    float _1142 = fma(_1122, _1122, _1130);
    float _1144 = in.m_73.y;
    float _1146 = gl_FragCoord.w;
    float _1148 = _1144 * _1146;
    float _1150 = in.m_73.z;
    float _1152 = gl_FragCoord.w;
    float _1154 = _1150 * _1152;
    float _1156 = fma(_940, _1036, _1140);
    float _1158 = fma(_1126, _1126, _1142);
    float _1160 = fma(_996, _954, _1138);
    float _1162 = _175 * _1102;
    float _1164 = in.m_92.x;
    float _1166 = gl_FragCoord.w;
    float _1168 = _1164 * _1166;
    float _1170 = in.m_92.w;
    float _1172 = gl_FragCoord.w;
    float _1174 = _1170 * _1172;
    float _1176 = fma(_944, _1036, _1160);
    float _1178 = rsqrt(_1158);
    float _1180 = _175 * _1108;
    float _1182 = _1122 * _1178;
    float _1184 = _1118 * _1178;
    float _1186 = _1126 * _1178;
    float _1188 = _175 * _1136;
    float _1190 = _1156 * _1182;
    float _1192 = in.m_94.x;
    float _1194 = gl_FragCoord.w;
    float _1196 = _1192 * _1194;
    float _1198 = -_1184;
    float _1200 = -_1190;
    float _1202 = fma(_1038, _1198, _1200);
    float _1204 = _175 * _1154;
    float _1206 = in.m_94.y;
    float _1208 = gl_FragCoord.w;
    float _1210 = _1206 * _1208;
    float _1212 = -_1186;
    float _1214 = fma(_1176, _1212, _1202);
    float _1216 = in.m_90.x;
    float _1218 = gl_FragCoord.w;
    float _1220 = _1216 * _1218;
    float _1222 = precise::max(_1214, -0.5);
    bool _1224 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1226 = precise::min(_1222, 1.0);
    float _1228 = fma(_1226, 0.666666686534881591796875, 0.3333333432674407958984375);
    float _1230 = _175 * _1148;
    float _1232 = in.m_92.y;
    float _1234 = gl_FragCoord.w;
    float _1236 = _1232 * _1234;
    float _1238 = in.m_92.z;
    float _1240 = gl_FragCoord.w;
    float _1242 = _1238 * _1240;
    float _1244 = _1188 * _1228;
    float _1246 = _1230 * _1228;
    float _1248 = _1204 * _1228;
    if (_1224)
    {
        float _1250 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1252 = _716 + _1250;
        _792 = _1252;
    }
    float _1254 = _792;
    float _1256 = in.m_94.z;
    float _1258 = gl_FragCoord.w;
    float _1260 = _1256 * _1258;
    float _1262 = _1246 * 0.715200006961822509765625;
    float _1264 = fma(_1244, 0.2125999927520751953125, _1262);
    float _1266 = _175 * _1210;
    float _1268 = fma(_1248, 0.072200000286102294921875, _1264);
    float _1270 = _175 * _1220;
    float _1272 = 1.0 / _1268;
    float _1274 = _1272 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1276 = precise::clamp(_1274, 0.0, 1.0);
    float _1278 = fma(_1276, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _1280 = _1244 * _1278;
    float _1282 = _1246 * _1278;
    float _1284 = _1248 * _1278;
    float _1286 = _175 * _1196;
    float _1288 = _175 * _1260;
    float _1290 = _175 * _1168;
    float _1292 = fma(_1086, 0.20999999344348907470703125, _1270);
    float _1294 = _1114 * 0.02624999918043613433837890625;
    float _1296 = fma(_1088, 0.20999999344348907470703125, _1162);
    float _1298 = fma(_1090, 0.20999999344348907470703125, _1180);
    float _1300 = _175 * _1236;
    float _1302 = fma(_1294, (*spvDescriptorSet0.fp_c15)._m0[17].x, _1292);
    float _1304 = fma(_1294, (*spvDescriptorSet0.fp_c15)._m0[17].y, _1296);
    float _1306 = fma(_1294, (*spvDescriptorSet0.fp_c15)._m0[17].z, _1298);
    float _1308 = _175 * _1242;
    float _1310 = _175 * _1174;
    float _1312 = _1302 + _1286;
    float _1314 = _1304 + _1266;
    float _1316 = _1306 + _1288;
    float _1318 = 0.0 + _778;
    float _1320 = precise::clamp(_1318, 0.0, 1.0);
    float _1322 = _1320;
    if (_1224)
    {
        float _1324 = _1254 * 8.0;
        float _1326 = precise::clamp(_1324, 0.0, 1.0);
        _332 = _1326;
    }
    float _1328 = _332;
    float _1330 = fma(_956, _1312, _1280);
    float _1332 = fma(_946, _1314, _1282);
    float _1334 = fma(_948, _1316, _1284);
    if (_1224)
    {
        float _1336 = _1320 * _1328;
        _1322 = _1336;
    }
    float _1338 = _1322;
    float _1340 = fma(_1330, _1310, _1290);
    float _1342 = fma(_1332, _1310, _1300);
    float _1344 = fma(_1334, _1310, _1308);
    float _1346 = 0.0 + _1338;
    float _1348 = precise::clamp(_1346, 0.0, 1.0);
    out.m_84.x = _1340;
    out.m_84.y = _1342;
    out.m_84.z = _1344;
    out.m_84.w = _1348;
    return out;
}

