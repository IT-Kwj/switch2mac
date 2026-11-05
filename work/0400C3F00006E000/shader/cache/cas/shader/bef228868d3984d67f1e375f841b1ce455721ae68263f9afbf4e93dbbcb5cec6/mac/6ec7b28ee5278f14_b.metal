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
    texture3d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture3d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

fragment main0_out main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.x;
    float _43 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _45 = _41 / _43;
    float _47 = gl_FragCoord.y;
    float _49 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _51 = _47 / _49;
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _55 = _53 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _57 = _45 * (*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _59 = fma(_57, 1.2000000476837158203125, -0.20000000298023223876953125);
    float _61 = _51 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _63 = -_59;
    float _65 = fma(_63, _59, 1.0);
    float _67 = precise::clamp(_65, 0.0, 1.0);
    float _69 = fma(_61, _55, (*spvDescriptorSet0.fp_c3)._m0[8].x);
    float _71 = sqrt(_67);
    int _74 = 0;
    float _76 = 0.0;
    float _78 = 0.0;
    float _80 = 0.0;
    float _82 = 0.0;
    float _84 = 0.0;
    bool _88;
    bool _158;
    float _602;
    float _604;
    float _606;
    do
    {
        int _90 = _74;
        float _92 = _76;
        float _94 = _78;
        float _96 = _80;
        float _98 = _82;
        float _100 = _84;
        float _102 = float(_90);
        float _104 = _69 * _69;
        float _106 = fma(_102, 0.098174773156642913818359375, 0.0490873865783214569091796875);
        float _108 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
        int _110 = _90 + 1;
        float _112 = _106 * 0.15915493667125701904296875;
        float _114 = -_108;
        float _116 = _114 + _104;
        float _118 = -_108;
        float _120 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _118);
        float _122 = _112 * 6.283185482025146484375;
        float _124 = cos(_122);
        float _126 = -(*spvDescriptorSet0.fp_c4)._m0[1].x;
        float _128 = fma(_126, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _130 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 2.0);
        float _132 = fma((*spvDescriptorSet0.fp_c4)._m0[1].x, (*spvDescriptorSet0.fp_c4)._m0[1].x, 1.0);
        float _134 = (*spvDescriptorSet0.fp_c4)._m0[1].x * 2.0;
        float _136 = _128 * 0.119366206228733062744140625;
        float _138 = sqrt(_116);
        bool _140 = _110 >= 64;
        float _142 = sqrt(_120);
        float _144 = _71 * _124;
        _74 = _110;
        int _146 = 0;
        float _148 = _98;
        float _150 = _100;
        float _152 = _92;
        float _154 = _94;
        float _156 = _96;
        do
        {
            int _160 = _146;
            float _162 = _148;
            float _164 = _150;
            float _166 = _152;
            float _168 = _154;
            float _170 = _156;
            float _172 = precise::max(_59, -0.19750000536441802978515625);
            float _174 = 1.0 / _55;
            float _176 = float(_160);
            float _178 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
            float _180 = _69 + _178;
            float _182 = _172 * 5.34962368011474609375;
            float _184 = fma(_176, 0.098174773156642913818359375, 0.0490873865783214569091796875);
            float _186 = abs(_182);
            bool _188 = _186 > 1.0;
            float _190 = _184 * 0.15915493667125701904296875;
            float _192 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
            float _194 = abs(_182);
            bool _196 = _194 > as_type<float>(0x7f800000u /* inf */);
            bool _198 = isnan(_194);
            bool _200 = _196 || _198;
            bool _202 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _204 = _200 || _202;
            float _206 = _190 * 6.283185482025146484375;
            float _208 = cos(_206);
            float _210 = _180 * _174;
            float _212 = _162;
            float _214 = _164;
            float _216 = _192;
            if (!_188)
            {
                float _218 = abs(_182);
                float _220 = (-0.0) + _218;
                _212 = _220;
            }
            float _222 = _212;
            float _224 = _190 * 6.283185482025146484375;
            float _226 = sin(_224);
            float _228 = _222;
            if (!_188)
            {
                _214 = _222;
            }
            float _230 = _214;
            float _232 = _69 * _208;
            float _234 = _59 * _208;
            float _236 = _230;
            if (_188)
            {
                float _238 = abs(_182);
                float _240 = 1.0 / _238;
                _236 = _240;
            }
            float _242 = _236;
            float _244 = -_104;
            float _246 = fma(_232, _232, _244);
            float _248 = _108 + _246;
            float _250 = -_108;
            bool _252 = _246 > _250;
            bool _254 = _232 < 0.0;
            bool _256 = _254 && _252;
            float _258 = _246;
            float _260 = _242;
            if (_188)
            {
                _228 = _242;
            }
            float _262 = _228;
            float _264 = _242 * _242;
            float _266 = _262 * _262;
            float _268 = _264 + 11.33538818359375;
            float _270 = fma(_264, -0.82336294651031494140625, -5.674867153167724609375);
            if (_256)
            {
                _258 = 0.0;
            }
            float _272 = _258;
            float _274 = _266 + 11.33538818359375;
            float _276 = fma(_264, _268, 28.84246826171875);
            float _278 = fma(_264, _270, -6.565555095672607421875);
            float _280 = _272;
            float _282 = _276;
            if (!_256)
            {
                _280 = _120;
            }
            float _284 = _280;
            float _286 = fma(_266, _274, 28.84246826171875);
            float _288 = fma(_264, _276, 19.6966705322265625);
            if (_256)
            {
                _282 = 0.0;
            }
            float _290 = _282;
            float _292 = fma(_266, -0.82336294651031494140625, -5.674867153167724609375);
            float _294 = fma(_266, _286, 19.6966705322265625);
            float _296 = _290;
            float _298 = _294;
            if (!_256)
            {
                _296 = _120;
            }
            float _300 = _296;
            float _302 = _264 * _278;
            float _304 = fma(_266, _292, -6.565555095672607421875);
            float _306 = 1.0 / _294;
            float _308 = _248 + _284;
            float _310 = _248 + _300;
            float _312 = fma(_226, _144, _234);
            float _314 = _266 * _304;
            float _316 = 1.0 / _288;
            float _318 = _302;
            if (_256)
            {
                _298 = 0.0;
            }
            float _320 = _298;
            float _322 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = _322 + 1.0;
            float _326 = _320;
            if (!_256)
            {
                _326 = _142;
            }
            float _328 = _326;
            float _330 = fma(_312, 0.5, 0.5);
            float _332 = _314 * _262;
            float _334 = _210 * _324;
            float _336 = _138 + _328;
            float _338 = sqrt(_310);
            float _340 = _330 * _192;
            if (_256)
            {
                _216 = 0.0;
            }
            float _342 = _216;
            float _344 = _302 * _242;
            float _346 = _342;
            if (!_256)
            {
                _346 = _142;
            }
            float _348 = _346;
            float _350 = fma(_332, _306, _262);
            int _352 = as_type<int>(_350);
            if (_256)
            {
                _318 = 1.0;
            }
            float _354 = _318;
            float _356 = fma(_344, _316, _242);
            float _358 = sqrt(_308);
            float _360 = _354;
            int _362 = as_type<int>(_356);
            if (!_256)
            {
                _360 = -1.0;
            }
            float _364 = _360;
            float _366 = _138 + _348;
            if (_256)
            {
                _260 = 1.0;
            }
            float _368 = _260;
            float _370 = _368;
            if (_188)
            {
                float _372 = -_356;
                float _374 = _372 + 1.57079637050628662109375;
                _362 = as_type<int>(_374);
            }
            int _376 = _362;
            float _378 = as_type<float>(_376);
            if (!_256)
            {
                _370 = -1.0;
            }
            float _380 = _370;
            if (_188)
            {
                float _382 = -_350;
                float _384 = _382 + 1.57079637050628662109375;
                _352 = as_type<int>(_384);
            }
            int _386 = _352;
            int _388 = as_type<int>(_182) & int(0x80000000);
            float _390 = 1.0 / _336;
            float _392 = fma(_232, _364, _338);
            float _394 = as_type<float>(_386);
            float _396 = as_type<float>(_388);
            float _398 = _392;
            if (!_204)
            {
                int _400 = _388 | _376;
                _378 = as_type<float>(_400);
            }
            float _402 = _378;
            if (!_204)
            {
                int _404 = _388 | _386;
                _394 = as_type<float>(_404);
            }
            float _406 = _394;
            if (_256)
            {
                float _408 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _410 = fma(0.5, _408, 0.5);
                _396 = _410;
            }
            float _412 = _396;
            float _414 = _412;
            if (!_256)
            {
                float _416 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
                _414 = _416;
            }
            float _418 = _414;
            float _420 = 1.0 / _366;
            float _422 = fma(_232, _380, _358);
            float _424 = _392 * _390;
            if (_256)
            {
                float _426 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
                float _428 = fma(_426, 0.5, 0.5);
                _398 = _428;
            }
            float _430 = _398;
            float _432 = floor(_340);
            float _434 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _436 = _434 + 1.0;
            float _438 = _430;
            if (!_256)
            {
                float _440 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
                _438 = _440;
            }
            float _442 = _438;
            float _444 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _446 = fma(0.454545438289642333984375, _402, 0.37000000476837158203125);
            float _448 = fma(0.454545438289642333984375, _406, 0.37000000476837158203125);
            float _450 = _422 * _420;
            float _452 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _454 = _452 + 0.5;
            float _456 = fma(_446, _436, _444);
            float _458 = fma(_436, _448, _444);
            float _460 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _334);
            float _462 = fma(_424, _454, _442);
            float _464 = fma(_454, _450, _418);
            float _466 = _456 + _432;
            float _468 = _432 + _458;
            float _470 = _466 + 1.0;
            float _472 = _466 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _474 = _468 + 1.0;
            float _476 = _468 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _478 = _470 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _480 = _474 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float3 _1225 = float3(_472, _462, _460);
            float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1225, float3(0.0), isnan(_1225))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1225, float3(0.0), isnan(_1225))).xyz;
            float _486 = _484.x;
            float _488 = _484.y;
            float _490 = _484.z;
            float3 _1242 = float3(_478, _462, _460);
            float3 _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1242, float3(0.0), isnan(_1242))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1242, float3(0.0), isnan(_1242))).xyz;
            float _494 = _492.x;
            float _496 = _492.y;
            float _498 = _492.z;
            float3 _1257 = float3(_476, _464, _460);
            float3 _500 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1257, float3(0.0), isnan(_1257))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1257, float3(0.0), isnan(_1257))).xyz;
            float _502 = _500.x;
            float _504 = _500.y;
            float _506 = _500.z;
            float3 _1272 = float3(_480, _464, _460);
            float3 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1272, float3(0.0), isnan(_1272))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1272, float3(0.0), isnan(_1272))).xyz;
            float _510 = _508.x;
            float _512 = _508.y;
            float _514 = _508.z;
            float _516 = -_134;
            float _518 = fma(_312, _516, _132);
            float _520 = _312 * _312;
            float _522 = -_432;
            float _524 = _340 + _522;
            int _526 = _160 + 1;
            float _528 = _226 * 0.00963828526437282562255859375;
            float _530 = _520 + 1.0;
            float _532 = abs(_518);
            float _534 = log2(_532);
            bool _536 = _526 >= 16;
            float _538 = _530 * _136;
            float _540 = _534 * 1.5;
            float _542 = exp2(_540);
            float _544 = _130 * _542;
            float _546 = 1.0 / _544;
            float _548 = _538 * _546;
            float _550 = -_488;
            float _552 = _550 + _496;
            float _554 = -_486;
            float _556 = _554 + _494;
            float _558 = -_502;
            float _560 = _558 + _510;
            float _562 = -_506;
            float _564 = _562 + _514;
            float _566 = fma(_524, _552, _488);
            float _568 = -_504;
            float _570 = _568 + _512;
            float _572 = fma(_524, _560, _502);
            float _574 = -_490;
            float _576 = _574 + _498;
            float _578 = fma(_524, _564, _506);
            float _580 = fma(_524, _570, _504);
            float _582 = _548 * _572;
            float _584 = fma(_520, 0.0596831031143665313720703125, 0.0596831031143665313720703125);
            float _586 = fma(_524, _556, _486);
            float _588 = _548 * _580;
            float _590 = fma(_524, _576, _490);
            float _592 = _548 * _578;
            float _594 = _208 * _528;
            float _596 = fma(_584, _586, _582);
            float _598 = fma(_584, _566, _588);
            float _600 = fma(_584, _590, _592);
            _602 = fma(_596, _594, _166);
            _604 = fma(_598, _594, _168);
            _606 = fma(_600, _594, _170);
            _158 = !_536;
            _82 = _580;
            _84 = _584;
            _146 = _526;
            _148 = _580;
            _150 = _584;
            _152 = _602;
            _154 = _604;
            _156 = _606;
        } while (_158);
        _88 = !_140;
        _76 = _602;
        _78 = _604;
        _80 = _606;
    } while (_88);
    out.m_34.x = _602;
    out.m_34.y = _604;
    out.m_34.z = _606;
    out.m_34.w = 0.0;
    return out;
}

