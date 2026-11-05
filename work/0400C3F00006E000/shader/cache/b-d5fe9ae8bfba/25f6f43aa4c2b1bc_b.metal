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
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d<float> cp_t_tcb_C [[id(6)]];
    sampler cp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> cp_i_tcb_4A_ [[id(8)]];
    texture2d<float> cp_i_tcb_4C_ [[id(9)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(10)]];
    sampler cp_t_tcb_8Smplr_w [[id(11)]];
    sampler cp_t_tcb_ASmplr_w [[id(12)]];
    sampler cp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

static inline __attribute__((always_inline))
int _48(thread const int& _11982, thread const int& _11983, constant _10& support_buffer)
{
    int _11986 = 1 + _11983;
    float _11988 = support_buffer._m5[_11986].x;
    bool _11990 = _11988 == 1.0;
    if (_11990)
    {
        return _11982;
    }
    float _11992 = float(_11982);
    float _11994 = _11992 * _11988;
    int _11996 = int(_11994);
    return _11996;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _5078 = false;
    bool _958 = false;
    bool _768 = false;
    bool _460 = false;
    bool _302 = false;
    int _51 = 0;
    int _53 = 3;
    int _55 = _48(_51, _53, (*spvDescriptorSet0.support_buffer));
    int _57 = 0;
    int _59 = 3;
    int _61 = _48(_57, _59, (*spvDescriptorSet0.support_buffer));
    float _64 = spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_55, _61))).x;
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    int _70 = as_type<int>(_66) * 64;
    int _72 = _70 + as_type<int>(_68);
    bool _76 = uint(_72) > as_type<uint>(_64);
    if (_76)
    {
        return;
    }
    int _78 = _72 >> 31;
    int _80 = _72 & 1023;
    int _82 = _78 & 1023;
    int _84 = _72 + _82;
    int _86 = _84 >> 10;
    int _88 = _80;
    int _90 = 4;
    int _92 = _48(_88, _90, (*spvDescriptorSet0.support_buffer));
    int _94 = _86;
    int _96 = 4;
    int _98 = _48(_94, _96, (*spvDescriptorSet0.support_buffer));
    float2 _102 = (spvDescriptorSet0.cp_i_tcb_4C_.read(uint2(int2(_92, _98))).xy);
    float _104 = _102.x;
    float _106 = _102.y;
    float _108 = float(as_type<int>(_104));
    float _110 = float(as_type<int>(_106));
    float _112 = _108 + 0.5;
    float _114 = _110 + 0.5;
    float _116 = _112 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _118 = _114 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float2 _5172 = float2(_116, _118);
    float2 _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5172, float2(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5172, float2(0.0), isnan(_5172)), level(0.0)).xy;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = fma(-0.25, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
    float _128 = fma(-0.25, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
    bool _130 = _124 > 0.0;
    bool _132 = _122 > 0.0;
    bool _134 = !_132;
    int _136 = _134 ? 0 : 1;
    float _138 = _122;
    float _140 = _124;
    float _142 = _128;
    if (!_130)
    {
        _138 = 0.0;
        _140 = 0.0;
    }
    float _144 = _138;
    float _146 = _140;
    int _148 = 0;
    float _150 = _144;
    float _152 = _146;
    if (!_130)
    {
        _148 = _136;
    }
    int _154 = _148;
    bool _156 = !_130;
    int _158 = _154;
    int _160 = 0;
    int _162 = 0;
    if (!_156)
    {
        float _164 = 0.0;
        if (!_132)
        {
            _164 = 0.0;
        }
        float _166 = _164;
        float _168 = 0.0;
        float _170 = _166;
        if (!_132)
        {
            _168 = 0.0;
        }
        float _172 = _168;
        bool _174 = !_132;
        float _176 = _172;
        float _178 = 0.0;
        if (!_174)
        {
            float _180 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _182 = _116 + _180;
            float _184 = _118 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _5256 = float2(_182, _184);
            float2 _186 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5256, float2(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5256, float2(0.0), isnan(_5256)), level(0.0)).xy;
            float _188 = _186.x;
            float _190 = _186.y;
            float _192 = _188 + _190;
            float _194 = _192 * 0.5;
            bool _196 = _194 >= 0.89999997615814208984375;
            bool _198 = isnan(_194);
            bool _200 = _196 || _198;
            bool _202 = isnan(0.89999997615814208984375);
            bool _204 = _200 || _202;
            bool _206 = !_204;
            float _208 = _190;
            float _210 = 0.0;
            float _212 = _194;
            float _214 = 0.0;
            float _272;
            float _284;
            float _300;
            if (!_206)
            {
                float _216 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _218 = _182 + _216;
                float _220 = _184 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _5302 = float2(_218, _220);
                float2 _222 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5302, float2(0.0), isnan(_5302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5302, float2(0.0), isnan(_5302)), level(0.0)).xy;
                float _224 = _222.x;
                float _226 = _222.y;
                float _228 = _226 + _224;
                float _230 = _228 * 0.5;
                bool _232 = _230 >= 0.89999997615814208984375;
                bool _234 = isnan(_230);
                bool _236 = _232 || _234;
                bool _238 = isnan(0.89999997615814208984375);
                bool _240 = _236 || _238;
                bool _242 = !_240;
                _208 = _226;
                _210 = 1.0;
                _212 = _230;
                _214 = _226;
                if (!_242)
                {
                    float _244 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _246 = _218 + _244;
                    float _248 = _220 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _5349 = float2(_246, _248);
                    float2 _250 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5349, float2(0.0), isnan(_5349)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5349, float2(0.0), isnan(_5349)), level(0.0)).xy;
                    float _252 = _250.x;
                    float _254 = _250.y;
                    float _256 = _254 + _252;
                    float _258 = _256 * 0.5;
                    bool _260 = _258 >= 0.89999997615814208984375;
                    bool _262 = isnan(_258);
                    bool _264 = _260 || _262;
                    bool _266 = isnan(0.89999997615814208984375);
                    bool _268 = _264 || _266;
                    bool _270 = !_268;
                    _208 = _254;
                    _210 = 2.0;
                    _212 = _258;
                    _214 = _254;
                    _272 = _254;
                    if (!_270)
                    {
                        float _274 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _276 = _246 + _274;
                        float _278 = _248 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _5397 = float2(_276, _278);
                        float2 _280 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5397, float2(0.0), isnan(_5397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5397, float2(0.0), isnan(_5397)), level(0.0)).xy;
                        float _282 = _280.x;
                        _284 = _280.y;
                        float _286 = _284 + _282;
                        float _288 = _286 * 0.5;
                        bool _290 = _288 >= 0.89999997615814208984375;
                        bool _292 = isnan(_288);
                        bool _294 = _290 || _292;
                        bool _296 = isnan(0.89999997615814208984375);
                        bool _298 = _294 || _296;
                        _208 = _284;
                        _212 = _288;
                        _300 = _288;
                        _302 = _298;
                        if (!_302)
                        {
                            _210 = 3.0;
                        }
                    }
                }
            }
            float _312;
            float _314;
            if (!_302)
            {
                float _304 = _208;
                float _306 = _210;
                float _308 = _212;
                float _310 = _214;
                _312 = _304;
                _314 = _306;
                _300 = _308;
                _272 = _310;
            }
            if (false || _302)
            {
                _302 = false;
                _312 = _284;
                _314 = 3.0;
            }
            float _316 = _312;
            float _318 = _314;
            float _320 = _300;
            float _322 = _272;
            bool _324 = _316 >= 0.89999997615814208984375;
            bool _326 = isnan(_316);
            bool _328 = _324 || _326;
            bool _330 = isnan(0.89999997615814208984375);
            bool _332 = _328 || _330;
            float _334 = float(_332);
            float _336 = _334 + _318;
            _170 = _336;
            _176 = _320;
            _178 = _322;
        }
        float _338 = _170;
        float _340 = _176;
        float _342 = _178;
        float _344 = _116 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _346 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _348 = _118 + _346;
        float2 _5491 = float2(_344, _348);
        float2 _350 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5491, float2(0.0), isnan(_5491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5491, float2(0.0), isnan(_5491)), level(0.0)).xy;
        float _352 = _350.x;
        float _354 = _350.y;
        float _356 = _352 + _354;
        float _358 = _356 * 0.5;
        bool _360 = _358 >= 0.89999997615814208984375;
        bool _362 = isnan(_358);
        bool _364 = _360 || _362;
        bool _366 = isnan(0.89999997615814208984375);
        bool _368 = _364 || _366;
        bool _370 = !_368;
        float _372 = 0.0;
        float _374 = _358;
        float _376 = _342;
        if (!_370)
        {
            float _378 = _344 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _380 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _382 = _348 + _380;
            float2 _5536 = float2(_378, _382);
            float2 _384 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xy;
            float _386 = _384.x;
            float _388 = _384.y;
            float _390 = _388 + _386;
            float _392 = _390 * 0.5;
            bool _394 = _392 >= 0.89999997615814208984375;
            bool _396 = isnan(_392);
            bool _398 = _394 || _396;
            bool _400 = isnan(0.89999997615814208984375);
            bool _402 = _398 || _400;
            bool _404 = !_402;
            _372 = 1.0;
            _374 = _392;
            if (!_404)
            {
                float _406 = _378 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _408 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _410 = _382 + _408;
                float2 _5580 = float2(_406, _410);
                float2 _412 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5580, float2(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5580, float2(0.0), isnan(_5580)), level(0.0)).xy;
                float _414 = _412.x;
                float _416 = _412.y;
                float _418 = _416 + _414;
                float _420 = _418 * 0.5;
                bool _422 = _420 >= 0.89999997615814208984375;
                bool _424 = isnan(_420);
                bool _426 = _422 || _424;
                bool _428 = isnan(0.89999997615814208984375);
                bool _430 = _426 || _428;
                bool _432 = !_430;
                _372 = 2.0;
                _374 = _420;
                if (!_432)
                {
                    float _434 = _406 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _436 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _438 = _410 + _436;
                    float2 _5624 = float2(_434, _438);
                    float2 _440 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5624, float2(0.0), isnan(_5624)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5624, float2(0.0), isnan(_5624)), level(0.0)).xy;
                    float _442 = _440.x;
                    float _444 = _440.y;
                    float _446 = _444 + _442;
                    float _448 = _446 * 0.5;
                    bool _450 = _448 >= 0.89999997615814208984375;
                    bool _452 = isnan(_448);
                    bool _454 = _450 || _452;
                    bool _456 = isnan(0.89999997615814208984375);
                    bool _458 = _454 || _456;
                    _374 = _448;
                    if (!_458)
                    {
                        _372 = 3.0;
                        _460 = true;
                    }
                    else
                    {
                        _372 = 3.0;
                    }
                }
            }
        }
        _460 = false;
        float _462 = _372;
        float _464 = _374;
        float _466 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 0.25, _116);
        float _468 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _470 = _466 + _468;
        float2 _5675 = float2(_470, _348);
        float2 _472 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5675, float2(0.0), isnan(_5675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5675, float2(0.0), isnan(_5675)), level(0.0)).xy;
        float _474 = _472.x;
        float _476 = _472.y;
        float _478 = _338 + _462;
        bool _480 = _478 > 2.0;
        float _482 = _478;
        float _484 = _464;
        float _486 = _470;
        int _488 = 1084227584;
        int _490 = 1084227584;
        _160 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z);
        if (!_480)
        {
            _482 = 0.0;
            _376 = 0.0;
        }
        float _492 = _482;
        float _494 = _376;
        bool _496 = !_480;
        float _498 = _492;
        float _500 = _494;
        int _502 = 0;
        if (!_496)
        {
            float _504 = -_338;
            float _506 = _504 + 0.25;
            float _508 = -_462;
            float _510 = _508 + (-0.25);
            float _512 = fma(_338, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float _514 = fma(_462, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _516 = fma(_506, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _518 = fma(_510, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float2 _5740 = float2(_516, _512);
            float2 _520 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5740, float2(0.0), isnan(_5740)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5740, float2(0.0), isnan(_5740)), level(0.0), int2(-1, 0)).xy;
            float _522 = _520.x;
            float _524 = _520.y;
            float2 _5754 = float2(_514, _518);
            float2 _526 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5754, float2(0.0), isnan(_5754)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5754, float2(0.0), isnan(_5754)), level(0.0), int2(1, 0)).xy;
            float _528 = _526.x;
            float _530 = _526.y;
            bool _532 = _464 <= 0.89999997615814208984375;
            bool _534 = isnan(_464);
            bool _536 = _532 || _534;
            bool _538 = isnan(0.89999997615814208984375);
            bool _540 = _536 || _538;
            float _542 = float(_540);
            float _544 = fma(_528, 5.0, -3.75);
            float _546 = rint(_524);
            float _548 = abs(_544);
            float _550 = _528 * _548;
            float _552 = fma(_522, 5.0, -3.75);
            float _554 = abs(_552);
            float _556 = _522 * _554;
            float _558 = rint(_530);
            bool _560 = _340 <= 0.89999997615814208984375;
            bool _562 = isnan(_340);
            bool _564 = _560 || _562;
            bool _566 = isnan(0.89999997615814208984375);
            bool _568 = _564 || _566;
            float _570 = float(_568);
            float _572 = rint(_550);
            float _574 = rint(_556);
            float _576 = fma(_558, 2.0, _572);
            float _578 = _576 * _542;
            float _580 = fma(_546, 2.0, _574);
            float _582 = fma(_578, 20.0, _462);
            float _584 = _580 * _570;
            float _586 = fma(_582, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _588 = fma(_584, 20.0, _338);
            float _590 = fma((*spvDescriptorSet0.cp_c3)._m0[3].z, 0.14285714924335479736328125, _586);
            float _592 = fma(_588, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _594 = _592 + 0.5;
            float2 _5851 = float2(_594, _590);
            float2 _596 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_5851, float2(0.0), isnan(_5851)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_5851, float2(0.0), isnan(_5851)), level(0.0)).xy;
            float _598 = _596.x;
            float _600 = _596.y;
            _484 = _590;
            _498 = _598;
            _500 = _600;
            _502 = as_type<int>(_522);
        }
        float _602 = _484;
        float _604 = _498;
        float _606 = _500;
        int _608 = _502;
        float _610 = fma(_474, 5.0, -3.75);
        float _612 = rint(_476);
        float _614 = abs(_610);
        float _616 = _474 * _614;
        float _618 = rint(_616);
        float _620 = _618 + _612;
        float _622 = _620 * 0.5;
        bool _624 = _622 >= 0.89999997615814208984375;
        bool _626 = isnan(_622);
        bool _628 = _624 || _626;
        bool _630 = isnan(0.89999997615814208984375);
        bool _632 = _628 || _630;
        bool _634 = !_632;
        float _636 = _602;
        float _638 = _618;
        float _640 = 0.0;
        float _642 = _622;
        float _644 = _606;
        float _646 = _604;
        int _648 = _608;
        if (!_634)
        {
            float _650 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _652 = _470 + _650;
            float _654 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _656 = _348 + _654;
            float2 _5923 = float2(_652, _656);
            float2 _658 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5923, float2(0.0), isnan(_5923)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5923, float2(0.0), isnan(_5923)), level(0.0)).xy;
            float _660 = _658.x;
            float _662 = _658.y;
            float _664 = fma(_660, 5.0, -3.75);
            float _666 = rint(_662);
            float _668 = abs(_664);
            float _670 = _660 * _668;
            float _672 = rint(_670);
            float _674 = _672 + _666;
            float _676 = _674 * 0.5;
            bool _678 = _676 >= 0.89999997615814208984375;
            bool _680 = isnan(_676);
            bool _682 = _678 || _680;
            bool _684 = isnan(0.89999997615814208984375);
            bool _686 = _682 || _684;
            bool _688 = !_686;
            _636 = _672;
            _638 = _666;
            _640 = 1.0;
            _486 = _652;
            _642 = _676;
            if (!_688)
            {
                float _690 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _692 = _652 + _690;
                float _694 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _696 = _656 + _694;
                float2 _5983 = float2(_692, _696);
                float2 _698 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).xy;
                float _700 = _698.x;
                float _702 = _698.y;
                float _704 = fma(_700, 5.0, -3.75);
                float _706 = rint(_702);
                float _708 = abs(_704);
                float _710 = _700 * _708;
                float _712 = rint(_710);
                float _714 = _712 + _706;
                float _716 = _714 * 0.5;
                bool _718 = _716 >= 0.89999997615814208984375;
                bool _720 = isnan(_716);
                bool _722 = _718 || _720;
                bool _724 = isnan(0.89999997615814208984375);
                bool _726 = _722 || _724;
                bool _728 = !_726;
                _636 = _712;
                _638 = _706;
                _640 = 2.0;
                _486 = _692;
                _642 = _716;
                if (!_728)
                {
                    float _730 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _732 = _692 + _730;
                    float _734 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _736 = _696 + _734;
                    float2 _6043 = float2(_732, _736);
                    float2 _738 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6043, float2(0.0), isnan(_6043)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6043, float2(0.0), isnan(_6043)), level(0.0)).xy;
                    float _740 = _738.x;
                    float _742 = _738.y;
                    float _744 = fma(_740, 5.0, -3.75);
                    float _746 = rint(_742);
                    float _748 = abs(_744);
                    float _750 = _740 * _748;
                    float _752 = rint(_750);
                    float _754 = _752 + _746;
                    float _756 = _754 * 0.5;
                    bool _758 = _756 >= 0.89999997615814208984375;
                    bool _760 = isnan(_756);
                    bool _762 = _758 || _760;
                    bool _764 = isnan(0.89999997615814208984375);
                    bool _766 = _762 || _764;
                    _486 = _742;
                    _642 = _756;
                    if (!_766)
                    {
                        _640 = 3.0;
                        _768 = true;
                    }
                    else
                    {
                        _640 = 3.0;
                    }
                }
            }
        }
        _768 = false;
        float _770 = _636;
        float _772 = _638;
        float _774 = _640;
        float _776 = _486;
        float _778 = _642;
        float2 _6097 = float2(_116, _118);
        float _780 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6097, float2(0.0), isnan(_6097)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6097, float2(0.0), isnan(_6097)), level(0.0), int2(1, 0)).x;
        bool _782 = _780 > 0.0;
        float _784 = _776;
        float _786 = _780;
        float _788 = _770;
        float _790 = _772;
        float _792 = _774;
        float _794 = _778;
        if (!_782)
        {
            _784 = 0.0;
        }
        float _796 = _784;
        float _798 = _796;
        if (!_782)
        {
            _786 = 0.0;
        }
        float _800 = _786;
        bool _802 = !_782;
        float _804 = _800;
        if (!_802)
        {
            float _806 = _466 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _808 = _118 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _6138 = float2(_806, _808);
            float2 _810 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6138, float2(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6138, float2(0.0), isnan(_6138)), level(0.0)).xy;
            float _812 = _810.x;
            float _814 = _810.y;
            float _816 = fma(_812, 5.0, -3.75);
            float _818 = rint(_814);
            float _820 = abs(_816);
            float _822 = _812 * _820;
            float _824 = rint(_822);
            float _826 = _824 + _818;
            float _828 = _826 * 0.5;
            bool _830 = _828 >= 0.89999997615814208984375;
            bool _832 = isnan(_828);
            bool _834 = _830 || _832;
            bool _836 = isnan(0.89999997615814208984375);
            bool _838 = _834 || _836;
            bool _840 = !_838;
            float _842 = _818;
            float _844 = _828;
            float _846 = 0.0;
            float _848 = _824;
            float _850 = _814;
            if (!_840)
            {
                float _852 = _806 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _854 = _808 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _6194 = float2(_852, _854);
                float2 _856 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6194, float2(0.0), isnan(_6194)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6194, float2(0.0), isnan(_6194)), level(0.0)).xy;
                float _858 = _856.x;
                float _860 = _856.y;
                float _862 = fma(_858, 5.0, -3.75);
                float _864 = rint(_860);
                float _866 = abs(_862);
                float _868 = _858 * _866;
                float _870 = rint(_868);
                float _872 = _870 + _864;
                float _874 = _872 * 0.5;
                bool _876 = _874 >= 0.89999997615814208984375;
                bool _878 = isnan(_874);
                bool _880 = _876 || _878;
                bool _882 = isnan(0.89999997615814208984375);
                bool _884 = _880 || _882;
                bool _886 = !_884;
                _842 = _864;
                _844 = _874;
                _846 = 1.0;
                _848 = _868;
                _850 = _860;
                if (!_886)
                {
                    float _888 = _852 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _890 = _854 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _6250 = float2(_888, _890);
                    float2 _892 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6250, float2(0.0), isnan(_6250)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6250, float2(0.0), isnan(_6250)), level(0.0)).xy;
                    float _894 = _892.x;
                    float _896 = _892.y;
                    float _898 = fma(_894, 5.0, -3.75);
                    float _900 = rint(_896);
                    float _902 = abs(_898);
                    float _904 = _894 * _902;
                    float _906 = rint(_904);
                    float _908 = _906 + _900;
                    float _910 = _908 * 0.5;
                    bool _912 = _910 >= 0.89999997615814208984375;
                    bool _914 = isnan(_910);
                    bool _916 = _912 || _914;
                    bool _918 = isnan(0.89999997615814208984375);
                    bool _920 = _916 || _918;
                    bool _922 = !_920;
                    _842 = _900;
                    _844 = _910;
                    _846 = 2.0;
                    _848 = _904;
                    _850 = _896;
                    if (!_922)
                    {
                        float _924 = _888 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _926 = _890 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _6306 = float2(_924, _926);
                        float2 _928 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6306, float2(0.0), isnan(_6306)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6306, float2(0.0), isnan(_6306)), level(0.0)).xy;
                        float _930 = _928.x;
                        float _932 = _928.y;
                        float _934 = fma(_930, 5.0, -3.75);
                        float _936 = rint(_932);
                        float _938 = abs(_934);
                        float _940 = _930 * _938;
                        float _942 = rint(_940);
                        float _944 = _942 + _936;
                        float _946 = _944 * 0.5;
                        bool _948 = _946 >= 0.89999997615814208984375;
                        bool _950 = isnan(_946);
                        bool _952 = _948 || _950;
                        bool _954 = isnan(0.89999997615814208984375);
                        bool _956 = _952 || _954;
                        _842 = _936;
                        _844 = _946;
                        _488 = as_type<int>(_942);
                        if (!_956)
                        {
                            _846 = 3.0;
                            _958 = true;
                        }
                        else
                        {
                            _846 = 3.0;
                        }
                    }
                }
            }
            _958 = false;
            float _960 = _842;
            float _962 = _844;
            float _964 = _846;
            float _966 = _848;
            float _968 = _850;
            int _970 = _488;
            bool _972 = _960 >= 0.89999997615814208984375;
            bool _974 = isnan(_960);
            bool _976 = _972 || _974;
            bool _978 = isnan(0.89999997615814208984375);
            bool _980 = _976 || _978;
            float _982 = float(_980);
            float _984 = _982 + _964;
            _798 = _984;
            _804 = _962;
            _788 = _966;
            _790 = _968;
            _490 = _970;
        }
        float _986 = _798;
        float _988 = _804;
        float _990 = _788;
        float _992 = _790;
        int _994 = _490;
        float _996 = _774 + _986;
        bool _998 = _996 > 2.0;
        bool _1000 = !_998;
        float _1002 = _990;
        float _1004 = _992;
        int _1006 = _994;
        int _1008 = as_type<int>(_988);
        if (!_1000)
        {
            float _1010 = fma(_986, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _1012 = fma(_986, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float _1014 = -_774;
            float _1016 = fma(_1014, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _1018 = -_774;
            float _1020 = fma(_1018, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float2 _6429 = float2(_1010, _1012);
            float2 _1022 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6429, float2(0.0), isnan(_6429)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6429, float2(0.0), isnan(_6429)), level(0.0), int2(1, 0)).xy;
            float _1024 = _1022.x;
            float _1026 = _1022.y;
            float2 _6441 = float2(_1016, _1020);
            float _1028 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6441, float2(0.0), isnan(_6441)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6441, float2(0.0), isnan(_6441)), level(0.0), int2(-1, 0)).y;
            float2 _6449 = float2(_1016, _1020);
            float _1030 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6449, float2(0.0), isnan(_6449)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6449, float2(0.0), isnan(_6449)), level(0.0), int2(0, -1)).x;
            bool _1032 = _988 >= 0.89999997615814208984375;
            bool _1034 = isnan(_988);
            bool _1036 = _1032 || _1034;
            bool _1038 = isnan(0.89999997615814208984375);
            bool _1040 = _1036 || _1038;
            float _1042 = float(_1040);
            bool _1044 = _778 >= 0.89999997615814208984375;
            bool _1046 = isnan(_778);
            bool _1048 = _1044 || _1046;
            bool _1050 = isnan(0.89999997615814208984375);
            bool _1052 = _1048 || _1050;
            float _1054 = float(_1052);
            float _1056 = fma(_1026, 2.0, _1024);
            float _1058 = fma(_1028, 2.0, _1030);
            float _1060 = _1056 * _1042;
            float _1062 = _1058 * _1054;
            float _1064 = fma(_1060, 20.0, _986);
            float _1066 = fma(_1062, 20.0, _774);
            float _1068 = fma(_1064, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1070 = fma(_1066, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1072 = fma((*spvDescriptorSet0.cp_c3)._m0[3].w, 0.14285714924335479736328125, _1068);
            float _1074 = _1070 + 0.5;
            float2 _6512 = float2(_1074, _1072);
            float2 _1076 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_6512, float2(0.0), isnan(_6512)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_6512, float2(0.0), isnan(_6512)), level(0.0)).xy;
            float _1078 = _1076.x;
            float _1080 = _1076.y;
            float _1082 = _1080 + _604;
            float _1084 = _1078 + _606;
            _644 = _1084;
            _646 = _1082;
            _792 = _1080;
            _1002 = _1016;
            _1004 = _1020;
            _1006 = as_type<int>(_1030);
            _648 = as_type<int>(_1024);
            _1008 = as_type<int>(_1068);
            _794 = _1078;
        }
        float _1086 = _644;
        float _1088 = _646;
        float _1090 = _792;
        float _1092 = _1002;
        float _1094 = _1004;
        int _1096 = _1006;
        int _1098 = _648;
        int _1100 = _1008;
        float _1102 = _794;
        float _1104 = -_1086;
        bool _1106 = _1088 != _1104;
        bool _1108 = isnan(_1088);
        bool _1110 = _1106 || _1108;
        bool _1112 = isnan(_1104);
        bool _1114 = _1110 || _1112;
        int _1116 = _1100;
        float _1118 = _1102;
        float _1120 = _1090;
        float _1122 = _1092;
        float _1124 = _1094;
        int _1126 = _1096;
        int _1128 = _1098;
        _162 = as_type<int>(_1086);
        if (_1114)
        {
            _1116 = 0;
        }
        int _1130 = _1116;
        _158 = _1130;
        if (_1114)
        {
            _1118 = _1088;
        }
        float _1132 = _1118;
        _150 = _1132;
        if (_1114)
        {
            _1120 = _1086;
        }
        float _1134 = _1120;
        _152 = _1134;
        if (!_1114)
        {
            float _1136 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _116);
            float _1138 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.125, _118);
            float2 _6606 = float2(_126, _1138);
            float2 _1140 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6606, float2(0.0), isnan(_6606)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6606, float2(0.0), isnan(_6606)), level(0.0)).xy;
            float _1142 = _1140.x;
            float _1144 = _1140.y;
            float2 _6618 = float2(_1136, _1138);
            float2 _1146 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6618, float2(0.0), isnan(_6618)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6618, float2(0.0), isnan(_6618)), level(0.0)).xy;
            float _1148 = _1146.x;
            float _1150 = _1146.y;
            float _1152 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _126);
            float _1154 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1136);
            bool _1156 = _1144 >= 0.800000011920928955078125;
            bool _1158 = isnan(_1144);
            bool _1160 = _1156 || _1158;
            bool _1162 = isnan(0.800000011920928955078125);
            bool _1164 = _1160 || _1162;
            bool _1166 = _1150 > 0.800000011920928955078125;
            bool _1168 = isnan(_1150);
            bool _1170 = _1166 || _1168;
            bool _1172 = isnan(0.800000011920928955078125);
            bool _1174 = _1170 || _1172;
            bool _1176 = _1142 != 0.0;
            bool _1178 = isnan(_1142);
            bool _1180 = _1176 || _1178;
            bool _1182 = isnan(0.0);
            bool _1184 = _1180 || _1182;
            bool _1186 = !_1164;
            bool _1188 = _1184 || _1186;
            bool _1190 = _1148 != 0.0;
            bool _1192 = isnan(_1148);
            bool _1194 = _1190 || _1192;
            bool _1196 = isnan(0.0);
            bool _1198 = _1194 || _1196;
            bool _1200 = !_1174;
            bool _1202 = _1198 || _1200;
            float _1204 = _1142;
            float _1206 = _1144;
            float _1208 = _1136;
            int _1210 = as_type<int>(_1148);
            int _1212 = as_type<int>(_1152);
            float _1214 = _1150;
            float _1216 = _1154;
            if (_1188)
            {
                _1122 = _1142;
            }
            float _1218 = _1122;
            if (_1188)
            {
                _1124 = _1144;
            }
            float _1220 = _1124;
            if (_1202)
            {
                _1204 = _1148;
            }
            float _1222 = _1204;
            if (_1202)
            {
                _1206 = _1150;
            }
            float _1224 = _1206;
            float _1226 = _1218;
            float _1228 = _1220;
            if (!_1188)
            {
                float2 _6728 = float2(_1152, _1138);
                float2 _1230 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6728, float2(0.0), isnan(_6728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6728, float2(0.0), isnan(_6728)), level(0.0)).xy;
                float _1232 = _1230.x;
                float _1234 = _1230.y;
                _1226 = _1232;
                _1228 = _1234;
            }
            float _1236 = _1226;
            float _1238 = _1228;
            float _1240 = _1222;
            float _1242 = _1224;
            if (!_1202)
            {
                float2 _6750 = float2(_1154, _1138);
                float2 _1244 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6750, float2(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6750, float2(0.0), isnan(_6750)), level(0.0)).xy;
                float _1246 = _1244.x;
                float _1248 = _1244.y;
                _1240 = _1246;
                _1242 = _1248;
            }
            float _1250 = _1240;
            float _1252 = _1242;
            if (_1188)
            {
                _1126 = 1;
            }
            int _1254 = _1126;
            int _1256 = _1254;
            if (!_1188)
            {
                _1256 = 0;
            }
            int _1258 = _1256;
            int _1260 = _1258;
            if (_1188)
            {
                _1208 = _1152;
            }
            float _1262 = _1208;
            float _1264 = _1262;
            if (!_1188)
            {
                float _1266 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1152);
                _1264 = _1266;
            }
            float _1268 = _1264;
            int _1270 = _1258 & 1;
            bool _1272 = _1270 != 0;
            float _1274 = _1268;
            if (_1272)
            {
                _1210 = _1258;
            }
            int _1276 = _1210;
            int _1278 = _1276;
            int _1280 = _1276;
            float _1282 = _1238;
            float _1284 = _1236;
            float _1286 = _1252;
            float _1288 = _1250;
            if (!_1272)
            {
                bool _1290 = _1238 >= 0.800000011920928955078125;
                bool _1292 = isnan(_1238);
                bool _1294 = _1290 || _1292;
                bool _1296 = isnan(0.800000011920928955078125);
                bool _1298 = _1294 || _1296;
                bool _1300 = _1236 != 0.0;
                bool _1302 = isnan(_1236);
                bool _1304 = _1300 || _1302;
                bool _1306 = isnan(0.0);
                bool _1308 = _1304 || _1306;
                bool _1310 = !_1298;
                bool _1312 = _1308 || _1310;
                if (_1312)
                {
                    _1278 = 1;
                }
                int _1314 = _1278;
                _1280 = _1314;
                if (!_1312)
                {
                    float2 _6848 = float2(_1268, _1138);
                    float2 _1316 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6848, float2(0.0), isnan(_6848)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6848, float2(0.0), isnan(_6848)), level(0.0)).xy;
                    float _1318 = _1316.x;
                    float _1320 = _1316.y;
                    float _1322 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1268);
                    _1280 = _1258;
                    _1282 = _1320;
                    _1284 = _1318;
                    _1274 = _1322;
                }
            }
            int _1324 = _1280;
            float _1326 = _1282;
            float _1328 = _1284;
            float _1330 = _1274;
            int _1332 = _1324 & 1;
            bool _1334 = _1332 != 0;
            float _1336 = _1326;
            float _1338 = _1328;
            float _1340 = _1330;
            float _1342 = as_type<float>(_1324);
            if (_1334)
            {
                _1212 = _1324;
            }
            int _1344 = _1212;
            int _1346 = _1344;
            int _1348 = _1344;
            if (!_1334)
            {
                bool _1350 = _1326 >= 0.800000011920928955078125;
                bool _1352 = isnan(_1326);
                bool _1354 = _1350 || _1352;
                bool _1356 = isnan(0.800000011920928955078125);
                bool _1358 = _1354 || _1356;
                bool _1360 = _1328 != 0.0;
                bool _1362 = isnan(_1328);
                bool _1364 = _1360 || _1362;
                bool _1366 = isnan(0.0);
                bool _1368 = _1364 || _1366;
                bool _1370 = !_1358;
                bool _1372 = _1368 || _1370;
                if (_1372)
                {
                    _1346 = 1;
                }
                int _1374 = _1346;
                _1348 = _1374;
                if (!_1372)
                {
                    float2 _6928 = float2(_1330, _1138);
                    float2 _1376 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6928, float2(0.0), isnan(_6928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6928, float2(0.0), isnan(_6928)), level(0.0)).xy;
                    float _1378 = _1376.x;
                    float _1380 = _1376.y;
                    float _1382 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1330);
                    _1348 = _1324;
                    _1336 = _1380;
                    _1338 = _1378;
                    _1340 = _1382;
                }
            }
            int _1384 = _1348;
            float _1386 = _1336;
            float _1388 = _1338;
            float _1390 = _1340;
            int _1392 = _1384 & 1;
            bool _1394 = _1392 != 0;
            float _1396 = _1386;
            float _1398 = _1388;
            float _1400 = _1390;
            int _1402 = _1384;
            if (_1394)
            {
                _1260 = _1384;
            }
            int _1404 = _1260;
            int _1406 = _1404;
            int _1408 = _1404;
            if (!_1394)
            {
                bool _1410 = _1386 >= 0.800000011920928955078125;
                bool _1412 = isnan(_1386);
                bool _1414 = _1410 || _1412;
                bool _1416 = isnan(0.800000011920928955078125);
                bool _1418 = _1414 || _1416;
                bool _1420 = _1388 != 0.0;
                bool _1422 = isnan(_1388);
                bool _1424 = _1420 || _1422;
                bool _1426 = isnan(0.0);
                bool _1428 = _1424 || _1426;
                bool _1430 = !_1418;
                bool _1432 = _1428 || _1430;
                if (_1432)
                {
                    _1406 = 1;
                }
                int _1434 = _1406;
                _1408 = _1434;
                if (!_1432)
                {
                    float2 _7007 = float2(_1390, _1138);
                    float2 _1436 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7007, float2(0.0), isnan(_7007)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7007, float2(0.0), isnan(_7007)), level(0.0)).xy;
                    float _1438 = _1436.x;
                    float _1440 = _1436.y;
                    float _1442 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1390);
                    _1408 = _1384;
                    _1396 = _1440;
                    _1398 = _1438;
                    _1400 = _1442;
                }
            }
            int _1444 = _1408;
            float _1446 = _1396;
            float _1448 = _1398;
            float _1450 = _1400;
            int _1452 = _1444 & 1;
            bool _1454 = _1452 != 0;
            float _1456 = _1446;
            float _1458 = _1448;
            float _1460 = _1450;
            int _1462 = _1444;
            if (_1454)
            {
                _1402 = _1444;
            }
            int _1464 = _1402;
            int _1466 = _1464;
            int _1468 = _1464;
            if (!_1454)
            {
                bool _1470 = _1446 >= 0.800000011920928955078125;
                bool _1472 = isnan(_1446);
                bool _1474 = _1470 || _1472;
                bool _1476 = isnan(0.800000011920928955078125);
                bool _1478 = _1474 || _1476;
                bool _1480 = _1448 != 0.0;
                bool _1482 = isnan(_1448);
                bool _1484 = _1480 || _1482;
                bool _1486 = isnan(0.0);
                bool _1488 = _1484 || _1486;
                bool _1490 = !_1478;
                bool _1492 = _1488 || _1490;
                if (_1492)
                {
                    _1466 = 1;
                }
                int _1494 = _1466;
                _1468 = _1494;
                if (!_1492)
                {
                    float2 _7086 = float2(_1450, _1138);
                    float2 _1496 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7086, float2(0.0), isnan(_7086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7086, float2(0.0), isnan(_7086)), level(0.0)).xy;
                    float _1498 = _1496.x;
                    float _1500 = _1496.y;
                    float _1502 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1450);
                    _1468 = _1444;
                    _1456 = _1500;
                    _1458 = _1498;
                    _1460 = _1502;
                }
            }
            int _1504 = _1468;
            float _1506 = _1456;
            float _1508 = _1458;
            float _1510 = _1460;
            int _1512 = _1504 & 1;
            bool _1514 = _1512 != 0;
            float _1516 = _1506;
            float _1518 = _1508;
            float _1520 = _1510;
            int _1522 = _1504;
            if (_1514)
            {
                _1462 = _1504;
            }
            int _1524 = _1462;
            int _1526 = _1524;
            int _1528 = _1524;
            if (!_1514)
            {
                bool _1530 = _1506 >= 0.800000011920928955078125;
                bool _1532 = isnan(_1506);
                bool _1534 = _1530 || _1532;
                bool _1536 = isnan(0.800000011920928955078125);
                bool _1538 = _1534 || _1536;
                bool _1540 = _1508 != 0.0;
                bool _1542 = isnan(_1508);
                bool _1544 = _1540 || _1542;
                bool _1546 = isnan(0.0);
                bool _1548 = _1544 || _1546;
                bool _1550 = !_1538;
                bool _1552 = _1548 || _1550;
                if (_1552)
                {
                    _1526 = 1;
                }
                int _1554 = _1526;
                _1528 = _1554;
                if (!_1552)
                {
                    float2 _7165 = float2(_1510, _1138);
                    float2 _1556 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7165, float2(0.0), isnan(_7165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7165, float2(0.0), isnan(_7165)), level(0.0)).xy;
                    float _1558 = _1556.x;
                    float _1560 = _1556.y;
                    float _1562 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1510);
                    _1528 = _1504;
                    _1516 = _1560;
                    _1518 = _1558;
                    _1520 = _1562;
                }
            }
            int _1564 = _1528;
            float _1566 = _1516;
            float _1568 = _1518;
            float _1570 = _1520;
            int _1572 = _1564 & 1;
            bool _1574 = _1572 != 0;
            float _1576 = _1566;
            float _1578 = _1568;
            float _1580 = _1570;
            int _1582 = _1564;
            if (_1574)
            {
                _1522 = _1564;
            }
            int _1584 = _1522;
            int _1586 = _1584;
            int _1588 = _1584;
            if (!_1574)
            {
                bool _1590 = _1566 >= 0.800000011920928955078125;
                bool _1592 = isnan(_1566);
                bool _1594 = _1590 || _1592;
                bool _1596 = isnan(0.800000011920928955078125);
                bool _1598 = _1594 || _1596;
                bool _1600 = _1568 != 0.0;
                bool _1602 = isnan(_1568);
                bool _1604 = _1600 || _1602;
                bool _1606 = isnan(0.0);
                bool _1608 = _1604 || _1606;
                bool _1610 = !_1598;
                bool _1612 = _1608 || _1610;
                if (_1612)
                {
                    _1586 = 1;
                }
                int _1614 = _1586;
                _1588 = _1614;
                if (!_1612)
                {
                    float2 _7244 = float2(_1570, _1138);
                    float2 _1616 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7244, float2(0.0), isnan(_7244)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7244, float2(0.0), isnan(_7244)), level(0.0)).xy;
                    float _1618 = _1616.x;
                    float _1620 = _1616.y;
                    float _1622 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1570);
                    _1588 = _1564;
                    _1576 = _1620;
                    _1578 = _1618;
                    _1580 = _1622;
                }
            }
            int _1624 = _1588;
            float _1626 = _1576;
            float _1628 = _1578;
            float _1630 = _1580;
            int _1632 = _1624 & 1;
            bool _1634 = _1632 != 0;
            float _1636 = _1626;
            float _1638 = _1628;
            float _1640 = _1630;
            int _1642 = _1624;
            if (_1634)
            {
                _1582 = _1624;
            }
            int _1644 = _1582;
            int _1646 = _1644;
            int _1648 = _1644;
            if (!_1634)
            {
                bool _1650 = _1626 >= 0.800000011920928955078125;
                bool _1652 = isnan(_1626);
                bool _1654 = _1650 || _1652;
                bool _1656 = isnan(0.800000011920928955078125);
                bool _1658 = _1654 || _1656;
                bool _1660 = _1628 != 0.0;
                bool _1662 = isnan(_1628);
                bool _1664 = _1660 || _1662;
                bool _1666 = isnan(0.0);
                bool _1668 = _1664 || _1666;
                bool _1670 = !_1658;
                bool _1672 = _1668 || _1670;
                if (_1672)
                {
                    _1646 = 1;
                }
                int _1674 = _1646;
                _1648 = _1674;
                if (!_1672)
                {
                    float2 _7323 = float2(_1630, _1138);
                    float2 _1676 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7323, float2(0.0), isnan(_7323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7323, float2(0.0), isnan(_7323)), level(0.0)).xy;
                    float _1678 = _1676.x;
                    float _1680 = _1676.y;
                    float _1682 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1630);
                    _1648 = _1624;
                    _1636 = _1680;
                    _1638 = _1678;
                    _1640 = _1682;
                }
            }
            int _1684 = _1648;
            float _1686 = _1636;
            float _1688 = _1638;
            float _1690 = _1640;
            int _1692 = _1684 & 1;
            bool _1694 = _1692 != 0;
            float _1696 = _1686;
            float _1698 = _1688;
            float _1700 = _1690;
            int _1702 = _1684;
            if (_1694)
            {
                _1642 = _1684;
            }
            int _1704 = _1642;
            int _1706 = _1704;
            int _1708 = _1704;
            if (!_1694)
            {
                bool _1710 = _1686 >= 0.800000011920928955078125;
                bool _1712 = isnan(_1686);
                bool _1714 = _1710 || _1712;
                bool _1716 = isnan(0.800000011920928955078125);
                bool _1718 = _1714 || _1716;
                bool _1720 = _1688 != 0.0;
                bool _1722 = isnan(_1688);
                bool _1724 = _1720 || _1722;
                bool _1726 = isnan(0.0);
                bool _1728 = _1724 || _1726;
                bool _1730 = !_1718;
                bool _1732 = _1728 || _1730;
                if (_1732)
                {
                    _1706 = 1;
                }
                int _1734 = _1706;
                _1708 = _1734;
                if (!_1732)
                {
                    float2 _7402 = float2(_1690, _1138);
                    float2 _1736 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7402, float2(0.0), isnan(_7402)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7402, float2(0.0), isnan(_7402)), level(0.0)).xy;
                    float _1738 = _1736.x;
                    float _1740 = _1736.y;
                    float _1742 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1690);
                    _1708 = _1684;
                    _1696 = _1740;
                    _1698 = _1738;
                    _1700 = _1742;
                }
            }
            int _1744 = _1708;
            float _1746 = _1696;
            float _1748 = _1698;
            float _1750 = _1700;
            int _1752 = _1744 & 1;
            bool _1754 = _1752 != 0;
            float _1756 = _1746;
            float _1758 = _1748;
            float _1760 = _1750;
            int _1762 = _1744;
            if (_1754)
            {
                _1702 = _1744;
            }
            int _1764 = _1702;
            int _1766 = _1764;
            int _1768 = _1764;
            if (!_1754)
            {
                bool _1770 = _1746 >= 0.800000011920928955078125;
                bool _1772 = isnan(_1746);
                bool _1774 = _1770 || _1772;
                bool _1776 = isnan(0.800000011920928955078125);
                bool _1778 = _1774 || _1776;
                bool _1780 = _1748 != 0.0;
                bool _1782 = isnan(_1748);
                bool _1784 = _1780 || _1782;
                bool _1786 = isnan(0.0);
                bool _1788 = _1784 || _1786;
                bool _1790 = !_1778;
                bool _1792 = _1788 || _1790;
                if (_1792)
                {
                    _1766 = 1;
                }
                int _1794 = _1766;
                _1768 = _1794;
                if (!_1792)
                {
                    float2 _7481 = float2(_1750, _1138);
                    float2 _1796 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7481, float2(0.0), isnan(_7481)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7481, float2(0.0), isnan(_7481)), level(0.0)).xy;
                    float _1798 = _1796.x;
                    float _1800 = _1796.y;
                    float _1802 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1750);
                    _1768 = _1744;
                    _1756 = _1800;
                    _1758 = _1798;
                    _1760 = _1802;
                }
            }
            int _1804 = _1768;
            float _1806 = _1756;
            float _1808 = _1758;
            float _1810 = _1760;
            int _1812 = _1804 & 1;
            bool _1814 = _1812 != 0;
            float _1816 = _1806;
            float _1818 = _1808;
            float _1820 = _1810;
            int _1822 = _1804;
            if (_1814)
            {
                _1762 = _1804;
            }
            int _1824 = _1762;
            int _1826 = _1824;
            int _1828 = _1824;
            if (!_1814)
            {
                bool _1830 = _1806 >= 0.800000011920928955078125;
                bool _1832 = isnan(_1806);
                bool _1834 = _1830 || _1832;
                bool _1836 = isnan(0.800000011920928955078125);
                bool _1838 = _1834 || _1836;
                bool _1840 = _1808 != 0.0;
                bool _1842 = isnan(_1808);
                bool _1844 = _1840 || _1842;
                bool _1846 = isnan(0.0);
                bool _1848 = _1844 || _1846;
                bool _1850 = !_1838;
                bool _1852 = _1848 || _1850;
                if (_1852)
                {
                    _1826 = 1;
                }
                int _1854 = _1826;
                _1828 = _1854;
                if (!_1852)
                {
                    float2 _7560 = float2(_1810, _1138);
                    float2 _1856 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7560, float2(0.0), isnan(_7560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7560, float2(0.0), isnan(_7560)), level(0.0)).xy;
                    float _1858 = _1856.x;
                    float _1860 = _1856.y;
                    float _1862 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1810);
                    _1828 = _1804;
                    _1816 = _1860;
                    _1818 = _1858;
                    _1820 = _1862;
                }
            }
            int _1864 = _1828;
            float _1866 = _1816;
            float _1868 = _1818;
            float _1870 = _1820;
            int _1872 = _1864 & 1;
            bool _1874 = _1872 != 0;
            float _1876 = _1866;
            float _1878 = _1868;
            float _1880 = _1870;
            int _1882 = _1864;
            if (_1874)
            {
                _1822 = _1864;
            }
            int _1884 = _1822;
            int _1886 = _1884;
            int _1888 = _1884;
            if (!_1874)
            {
                bool _1890 = _1866 >= 0.800000011920928955078125;
                bool _1892 = isnan(_1866);
                bool _1894 = _1890 || _1892;
                bool _1896 = isnan(0.800000011920928955078125);
                bool _1898 = _1894 || _1896;
                bool _1900 = _1868 != 0.0;
                bool _1902 = isnan(_1868);
                bool _1904 = _1900 || _1902;
                bool _1906 = isnan(0.0);
                bool _1908 = _1904 || _1906;
                bool _1910 = !_1898;
                bool _1912 = _1908 || _1910;
                if (_1912)
                {
                    _1886 = 1;
                }
                int _1914 = _1886;
                _1888 = _1914;
                if (!_1912)
                {
                    float2 _7639 = float2(_1870, _1138);
                    float2 _1916 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7639, float2(0.0), isnan(_7639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7639, float2(0.0), isnan(_7639)), level(0.0)).xy;
                    float _1918 = _1916.x;
                    float _1920 = _1916.y;
                    float _1922 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1870);
                    _1888 = _1864;
                    _1876 = _1920;
                    _1878 = _1918;
                    _1880 = _1922;
                }
            }
            int _1924 = _1888;
            float _1926 = _1876;
            float _1928 = _1878;
            float _1930 = _1880;
            int _1932 = _1924 & 1;
            bool _1934 = _1932 != 0;
            float _1936 = _1928;
            float _1938 = _1926;
            float _1940 = _1930;
            int _1942 = _1924;
            if (_1934)
            {
                _1882 = _1924;
            }
            int _1944 = _1882;
            int _1946 = _1944;
            int _1948 = _1944;
            if (!_1934)
            {
                bool _1950 = _1926 >= 0.800000011920928955078125;
                bool _1952 = isnan(_1926);
                bool _1954 = _1950 || _1952;
                bool _1956 = isnan(0.800000011920928955078125);
                bool _1958 = _1954 || _1956;
                bool _1960 = _1928 != 0.0;
                bool _1962 = isnan(_1928);
                bool _1964 = _1960 || _1962;
                bool _1966 = isnan(0.0);
                bool _1968 = _1964 || _1966;
                bool _1970 = !_1958;
                bool _1972 = _1968 || _1970;
                if (_1972)
                {
                    _1946 = 1;
                }
                int _1974 = _1946;
                _1948 = _1974;
                if (!_1972)
                {
                    float2 _7718 = float2(_1930, _1138);
                    float2 _1976 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7718, float2(0.0), isnan(_7718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7718, float2(0.0), isnan(_7718)), level(0.0)).xy;
                    float _1978 = _1976.x;
                    float _1980 = _1976.y;
                    float _1982 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1930);
                    _1948 = _1924;
                    _1936 = _1978;
                    _1938 = _1980;
                    _1940 = _1982;
                }
            }
            int _1984 = _1948;
            float _1986 = _1936;
            float _1988 = _1938;
            float _1990 = _1940;
            int _1992 = _1984 & 1;
            bool _1994 = _1992 != 0;
            float _1996 = _1990;
            float _1998 = as_type<float>(_1984);
            if (_1202)
            {
                _1128 = 1;
            }
            int _2000 = _1128;
            int _2002 = _2000;
            if (!_1202)
            {
                _2002 = 0;
            }
            int _2004 = _2002;
            int _2006 = _2004 & 1;
            bool _2008 = _2006 != 0;
            if (_1994)
            {
                _1942 = _1984;
            }
            int _2010 = _1942;
            int _2012 = _2010;
            int _2014 = _2010;
            if (_1994)
            {
                _1342 = _1986;
            }
            float _2016 = _1342;
            float _2018 = _2016;
            float _2020 = _2016;
            if (_1994)
            {
                _1214 = _1988;
            }
            float _2022 = _1214;
            float _2024 = _2022;
            float _2026 = _2022;
            if (!_1994)
            {
                bool _2028 = _1988 >= 0.800000011920928955078125;
                bool _2030 = isnan(_1988);
                bool _2032 = _2028 || _2030;
                bool _2034 = isnan(0.800000011920928955078125);
                bool _2036 = _2032 || _2034;
                bool _2038 = _1986 != 0.0;
                bool _2040 = isnan(_1986);
                bool _2042 = _2038 || _2040;
                bool _2044 = isnan(0.0);
                bool _2046 = _2042 || _2044;
                bool _2048 = !_2036;
                bool _2050 = _2046 || _2048;
                if (_2050)
                {
                    _2018 = _1986;
                }
                float _2052 = _2018;
                _2020 = _2052;
                if (_2050)
                {
                    _2024 = _1988;
                }
                float _2054 = _2024;
                _2026 = _2054;
                if (_2050)
                {
                    _2012 = 1;
                }
                int _2056 = _2012;
                _2014 = _2056;
                if (!_2050)
                {
                    float2 _7836 = float2(_1990, _1138);
                    float2 _2058 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7836, float2(0.0), isnan(_7836)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7836, float2(0.0), isnan(_7836)), level(0.0)).xy;
                    float _2060 = _2058.x;
                    float _2062 = _2058.y;
                    float _2064 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1990);
                    _2014 = _1984;
                    _1996 = _2064;
                    _2026 = _2062;
                    _2020 = _2060;
                }
            }
            int _2066 = _2014;
            float _2068 = _1996;
            float _2070 = _2026;
            float _2072 = _2020;
            int _2074 = _2066 & 1;
            bool _2076 = _2074 != 0;
            float _2078 = _2072;
            float _2080 = _2070;
            int _2082 = as_type<int>(_2068);
            int _2084 = _2066;
            if (!_1202)
            {
                float _2086 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1154);
                _1216 = _2086;
            }
            float _2088 = _1216;
            float _2090 = _2088;
            if (_2076)
            {
                _1998 = _2068;
            }
            float _2092 = _1998;
            float _2094 = _2092;
            float _2096 = _2092;
            if (!_2076)
            {
                bool _2098 = _2070 >= 0.800000011920928955078125;
                bool _2100 = isnan(_2070);
                bool _2102 = _2098 || _2100;
                bool _2104 = isnan(0.800000011920928955078125);
                bool _2106 = _2102 || _2104;
                bool _2108 = _2072 != 0.0;
                bool _2110 = isnan(_2072);
                bool _2112 = _2108 || _2110;
                bool _2114 = isnan(0.0);
                bool _2116 = _2112 || _2114;
                bool _2118 = !_2106;
                bool _2120 = _2116 || _2118;
                if (_2120)
                {
                    _2094 = _2068;
                }
                float _2122 = _2094;
                _2096 = _2122;
                if (!_2120)
                {
                    float2 _7928 = float2(_2068, _1138);
                    float2 _2124 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7928, float2(0.0), isnan(_7928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7928, float2(0.0), isnan(_7928)), level(0.0)).xy;
                    float _2126 = _2124.x;
                    float _2128 = _2124.y;
                    float _2130 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2068);
                    _2078 = _2126;
                    _2080 = _2128;
                    _2096 = _2130;
                }
            }
            float _2132 = _2078;
            float _2134 = _2080;
            float _2136 = _2096;
            if (_2008)
            {
                _2082 = _2004;
            }
            int _2138 = _2082;
            int _2140 = _2138;
            int _2142 = _2138;
            if (!_2008)
            {
                bool _2144 = _1252 > 0.800000011920928955078125;
                bool _2146 = isnan(_1252);
                bool _2148 = _2144 || _2146;
                bool _2150 = isnan(0.800000011920928955078125);
                bool _2152 = _2148 || _2150;
                bool _2154 = _1250 != 0.0;
                bool _2156 = isnan(_1250);
                bool _2158 = _2154 || _2156;
                bool _2160 = isnan(0.0);
                bool _2162 = _2158 || _2160;
                bool _2164 = !_2152;
                bool _2166 = _2162 || _2164;
                if (_2166)
                {
                    _2140 = 1;
                }
                int _2168 = _2140;
                _2142 = _2168;
                if (!_2166)
                {
                    float2 _7997 = float2(_2088, _1138);
                    float2 _2170 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7997, float2(0.0), isnan(_7997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7997, float2(0.0), isnan(_7997)), level(0.0)).xy;
                    float _2172 = _2170.x;
                    float _2174 = _2170.y;
                    float _2176 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2088);
                    _2142 = _2004;
                    _1286 = _2174;
                    _1288 = _2172;
                    _2090 = _2176;
                }
            }
            int _2178 = _2142;
            float _2180 = _1286;
            float _2182 = _1288;
            float _2184 = _2090;
            int _2186 = _2178 & 1;
            bool _2188 = _2186 != 0;
            float _2190 = _2180;
            float _2192 = _2182;
            float _2194 = _2184;
            int _2196 = _2178;
            if (_2188)
            {
                _2084 = _2178;
            }
            int _2198 = _2084;
            int _2200 = _2198;
            int _2202 = _2198;
            if (!_2188)
            {
                bool _2204 = _2180 > 0.800000011920928955078125;
                bool _2206 = isnan(_2180);
                bool _2208 = _2204 || _2206;
                bool _2210 = isnan(0.800000011920928955078125);
                bool _2212 = _2208 || _2210;
                bool _2214 = _2182 != 0.0;
                bool _2216 = isnan(_2182);
                bool _2218 = _2214 || _2216;
                bool _2220 = isnan(0.0);
                bool _2222 = _2218 || _2220;
                bool _2224 = !_2212;
                bool _2226 = _2222 || _2224;
                if (_2226)
                {
                    _2200 = 1;
                }
                int _2228 = _2200;
                _2202 = _2228;
                if (!_2226)
                {
                    float2 _8076 = float2(_2184, _1138);
                    float2 _2230 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8076, float2(0.0), isnan(_8076)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8076, float2(0.0), isnan(_8076)), level(0.0)).xy;
                    float _2232 = _2230.x;
                    float _2234 = _2230.y;
                    float _2236 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2184);
                    _2202 = _2178;
                    _2190 = _2234;
                    _2192 = _2232;
                    _2194 = _2236;
                }
            }
            int _2238 = _2202;
            float _2240 = _2190;
            float _2242 = _2192;
            float _2244 = _2194;
            int _2246 = _2238 & 1;
            bool _2248 = _2246 != 0;
            float _2250 = _2240;
            float _2252 = _2242;
            float _2254 = _2244;
            int _2256 = _2238;
            if (_2248)
            {
                _2196 = _2238;
            }
            int _2258 = _2196;
            int _2260 = _2258;
            int _2262 = _2258;
            if (!_2248)
            {
                bool _2264 = _2240 > 0.800000011920928955078125;
                bool _2266 = isnan(_2240);
                bool _2268 = _2264 || _2266;
                bool _2270 = isnan(0.800000011920928955078125);
                bool _2272 = _2268 || _2270;
                bool _2274 = _2242 != 0.0;
                bool _2276 = isnan(_2242);
                bool _2278 = _2274 || _2276;
                bool _2280 = isnan(0.0);
                bool _2282 = _2278 || _2280;
                bool _2284 = !_2272;
                bool _2286 = _2282 || _2284;
                if (_2286)
                {
                    _2260 = 1;
                }
                int _2288 = _2260;
                _2262 = _2288;
                if (!_2286)
                {
                    float2 _8155 = float2(_2244, _1138);
                    float2 _2290 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8155, float2(0.0), isnan(_8155)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8155, float2(0.0), isnan(_8155)), level(0.0)).xy;
                    float _2292 = _2290.x;
                    float _2294 = _2290.y;
                    float _2296 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2244);
                    _2262 = _2238;
                    _2250 = _2294;
                    _2252 = _2292;
                    _2254 = _2296;
                }
            }
            int _2298 = _2262;
            float _2300 = _2250;
            float _2302 = _2252;
            float _2304 = _2254;
            int _2306 = _2298 & 1;
            bool _2308 = _2306 != 0;
            float _2310 = _2300;
            float _2312 = _2302;
            float _2314 = _2304;
            int _2316 = _2298;
            if (_2308)
            {
                _2256 = _2298;
            }
            int _2318 = _2256;
            int _2320 = _2318;
            int _2322 = _2318;
            if (!_2308)
            {
                bool _2324 = _2300 > 0.800000011920928955078125;
                bool _2326 = isnan(_2300);
                bool _2328 = _2324 || _2326;
                bool _2330 = isnan(0.800000011920928955078125);
                bool _2332 = _2328 || _2330;
                bool _2334 = _2302 != 0.0;
                bool _2336 = isnan(_2302);
                bool _2338 = _2334 || _2336;
                bool _2340 = isnan(0.0);
                bool _2342 = _2338 || _2340;
                bool _2344 = !_2332;
                bool _2346 = _2342 || _2344;
                if (_2346)
                {
                    _2320 = 1;
                }
                int _2348 = _2320;
                _2322 = _2348;
                if (!_2346)
                {
                    float2 _8234 = float2(_2304, _1138);
                    float2 _2350 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8234, float2(0.0), isnan(_8234)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8234, float2(0.0), isnan(_8234)), level(0.0)).xy;
                    float _2352 = _2350.x;
                    float _2354 = _2350.y;
                    float _2356 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2304);
                    _2322 = _2298;
                    _2310 = _2354;
                    _2312 = _2352;
                    _2314 = _2356;
                }
            }
            int _2358 = _2322;
            float _2360 = _2310;
            float _2362 = _2312;
            float _2364 = _2314;
            int _2366 = _2358 & 1;
            bool _2368 = _2366 != 0;
            float _2370 = _2360;
            float _2372 = _2362;
            float _2374 = _2364;
            int _2376 = _2358;
            if (_2368)
            {
                _2316 = _2358;
            }
            int _2378 = _2316;
            int _2380 = _2378;
            int _2382 = _2378;
            if (!_2368)
            {
                bool _2384 = _2360 > 0.800000011920928955078125;
                bool _2386 = isnan(_2360);
                bool _2388 = _2384 || _2386;
                bool _2390 = isnan(0.800000011920928955078125);
                bool _2392 = _2388 || _2390;
                bool _2394 = _2362 != 0.0;
                bool _2396 = isnan(_2362);
                bool _2398 = _2394 || _2396;
                bool _2400 = isnan(0.0);
                bool _2402 = _2398 || _2400;
                bool _2404 = !_2392;
                bool _2406 = _2402 || _2404;
                if (_2406)
                {
                    _2380 = 1;
                }
                int _2408 = _2380;
                _2382 = _2408;
                if (!_2406)
                {
                    float2 _8313 = float2(_2364, _1138);
                    float2 _2410 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8313, float2(0.0), isnan(_8313)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8313, float2(0.0), isnan(_8313)), level(0.0)).xy;
                    float _2412 = _2410.x;
                    float _2414 = _2410.y;
                    float _2416 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2364);
                    _2382 = _2358;
                    _2370 = _2414;
                    _2372 = _2412;
                    _2374 = _2416;
                }
            }
            int _2418 = _2382;
            float _2420 = _2370;
            float _2422 = _2372;
            float _2424 = _2374;
            int _2426 = _2418 & 1;
            bool _2428 = _2426 != 0;
            float _2430 = _2420;
            float _2432 = _2422;
            float _2434 = _2424;
            int _2436 = _2418;
            if (_2428)
            {
                _2376 = _2418;
            }
            int _2438 = _2376;
            int _2440 = _2438;
            int _2442 = _2438;
            if (!_2428)
            {
                bool _2444 = _2420 > 0.800000011920928955078125;
                bool _2446 = isnan(_2420);
                bool _2448 = _2444 || _2446;
                bool _2450 = isnan(0.800000011920928955078125);
                bool _2452 = _2448 || _2450;
                bool _2454 = _2422 != 0.0;
                bool _2456 = isnan(_2422);
                bool _2458 = _2454 || _2456;
                bool _2460 = isnan(0.0);
                bool _2462 = _2458 || _2460;
                bool _2464 = !_2452;
                bool _2466 = _2462 || _2464;
                if (_2466)
                {
                    _2440 = 1;
                }
                int _2468 = _2440;
                _2442 = _2468;
                if (!_2466)
                {
                    float2 _8392 = float2(_2424, _1138);
                    float2 _2470 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8392, float2(0.0), isnan(_8392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8392, float2(0.0), isnan(_8392)), level(0.0)).xy;
                    float _2472 = _2470.x;
                    float _2474 = _2470.y;
                    float _2476 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2424);
                    _2442 = _2418;
                    _2430 = _2474;
                    _2432 = _2472;
                    _2434 = _2476;
                }
            }
            int _2478 = _2442;
            float _2480 = _2430;
            float _2482 = _2432;
            float _2484 = _2434;
            int _2486 = _2478 & 1;
            bool _2488 = _2486 != 0;
            float _2490 = _2480;
            float _2492 = _2482;
            float _2494 = _2484;
            int _2496 = _2478;
            if (_2488)
            {
                _2436 = _2478;
            }
            int _2498 = _2436;
            int _2500 = _2498;
            int _2502 = _2498;
            if (!_2488)
            {
                bool _2504 = _2480 > 0.800000011920928955078125;
                bool _2506 = isnan(_2480);
                bool _2508 = _2504 || _2506;
                bool _2510 = isnan(0.800000011920928955078125);
                bool _2512 = _2508 || _2510;
                bool _2514 = _2482 != 0.0;
                bool _2516 = isnan(_2482);
                bool _2518 = _2514 || _2516;
                bool _2520 = isnan(0.0);
                bool _2522 = _2518 || _2520;
                bool _2524 = !_2512;
                bool _2526 = _2522 || _2524;
                if (_2526)
                {
                    _2500 = 1;
                }
                int _2528 = _2500;
                _2502 = _2528;
                if (!_2526)
                {
                    float2 _8471 = float2(_2484, _1138);
                    float2 _2530 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8471, float2(0.0), isnan(_8471)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8471, float2(0.0), isnan(_8471)), level(0.0)).xy;
                    float _2532 = _2530.x;
                    float _2534 = _2530.y;
                    float _2536 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2484);
                    _2502 = _2478;
                    _2490 = _2534;
                    _2492 = _2532;
                    _2494 = _2536;
                }
            }
            int _2538 = _2502;
            float _2540 = _2490;
            float _2542 = _2492;
            float _2544 = _2494;
            int _2546 = _2538 & 1;
            bool _2548 = _2546 != 0;
            float _2550 = _2540;
            float _2552 = _2542;
            float _2554 = _2544;
            int _2556 = _2538;
            if (_2548)
            {
                _2496 = _2538;
            }
            int _2558 = _2496;
            int _2560 = _2558;
            int _2562 = _2558;
            if (!_2548)
            {
                bool _2564 = _2540 > 0.800000011920928955078125;
                bool _2566 = isnan(_2540);
                bool _2568 = _2564 || _2566;
                bool _2570 = isnan(0.800000011920928955078125);
                bool _2572 = _2568 || _2570;
                bool _2574 = _2542 != 0.0;
                bool _2576 = isnan(_2542);
                bool _2578 = _2574 || _2576;
                bool _2580 = isnan(0.0);
                bool _2582 = _2578 || _2580;
                bool _2584 = !_2572;
                bool _2586 = _2582 || _2584;
                if (_2586)
                {
                    _2560 = 1;
                }
                int _2588 = _2560;
                _2562 = _2588;
                if (!_2586)
                {
                    float2 _8550 = float2(_2544, _1138);
                    float2 _2590 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8550, float2(0.0), isnan(_8550)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8550, float2(0.0), isnan(_8550)), level(0.0)).xy;
                    float _2592 = _2590.x;
                    float _2594 = _2590.y;
                    float _2596 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2544);
                    _2562 = _2538;
                    _2550 = _2594;
                    _2552 = _2592;
                    _2554 = _2596;
                }
            }
            int _2598 = _2562;
            float _2600 = _2550;
            float _2602 = _2552;
            float _2604 = _2554;
            int _2606 = _2598 & 1;
            bool _2608 = _2606 != 0;
            float _2610 = _2600;
            float _2612 = _2602;
            float _2614 = _2604;
            int _2616 = _2598;
            if (_2608)
            {
                _2556 = _2598;
            }
            int _2618 = _2556;
            int _2620 = _2618;
            int _2622 = _2618;
            if (!_2608)
            {
                bool _2624 = _2600 > 0.800000011920928955078125;
                bool _2626 = isnan(_2600);
                bool _2628 = _2624 || _2626;
                bool _2630 = isnan(0.800000011920928955078125);
                bool _2632 = _2628 || _2630;
                bool _2634 = _2602 != 0.0;
                bool _2636 = isnan(_2602);
                bool _2638 = _2634 || _2636;
                bool _2640 = isnan(0.0);
                bool _2642 = _2638 || _2640;
                bool _2644 = !_2632;
                bool _2646 = _2642 || _2644;
                if (_2646)
                {
                    _2620 = 1;
                }
                int _2648 = _2620;
                _2622 = _2648;
                if (!_2646)
                {
                    float2 _8629 = float2(_2604, _1138);
                    float2 _2650 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8629, float2(0.0), isnan(_8629)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8629, float2(0.0), isnan(_8629)), level(0.0)).xy;
                    float _2652 = _2650.x;
                    float _2654 = _2650.y;
                    float _2656 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2604);
                    _2622 = _2598;
                    _2610 = _2654;
                    _2612 = _2652;
                    _2614 = _2656;
                }
            }
            int _2658 = _2622;
            float _2660 = _2610;
            float _2662 = _2612;
            float _2664 = _2614;
            int _2666 = _2658 & 1;
            bool _2668 = _2666 != 0;
            float _2670 = _2660;
            float _2672 = _2662;
            float _2674 = _2664;
            int _2676 = _2658;
            if (_2668)
            {
                _2616 = _2658;
            }
            int _2678 = _2616;
            int _2680 = _2678;
            int _2682 = _2678;
            if (!_2668)
            {
                bool _2684 = _2660 > 0.800000011920928955078125;
                bool _2686 = isnan(_2660);
                bool _2688 = _2684 || _2686;
                bool _2690 = isnan(0.800000011920928955078125);
                bool _2692 = _2688 || _2690;
                bool _2694 = _2662 != 0.0;
                bool _2696 = isnan(_2662);
                bool _2698 = _2694 || _2696;
                bool _2700 = isnan(0.0);
                bool _2702 = _2698 || _2700;
                bool _2704 = !_2692;
                bool _2706 = _2702 || _2704;
                if (_2706)
                {
                    _2680 = 1;
                }
                int _2708 = _2680;
                _2682 = _2708;
                if (!_2706)
                {
                    float2 _8708 = float2(_2664, _1138);
                    float2 _2710 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8708, float2(0.0), isnan(_8708)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8708, float2(0.0), isnan(_8708)), level(0.0)).xy;
                    float _2712 = _2710.x;
                    float _2714 = _2710.y;
                    float _2716 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2664);
                    _2682 = _2658;
                    _2670 = _2714;
                    _2672 = _2712;
                    _2674 = _2716;
                }
            }
            int _2718 = _2682;
            float _2720 = _2670;
            float _2722 = _2672;
            float _2724 = _2674;
            int _2726 = _2718 & 1;
            bool _2728 = _2726 != 0;
            float _2730 = _2720;
            float _2732 = _2722;
            float _2734 = _2724;
            int _2736 = _2718;
            if (_2728)
            {
                _2676 = _2718;
            }
            int _2738 = _2676;
            int _2740 = _2738;
            int _2742 = _2738;
            if (!_2728)
            {
                bool _2744 = _2720 > 0.800000011920928955078125;
                bool _2746 = isnan(_2720);
                bool _2748 = _2744 || _2746;
                bool _2750 = isnan(0.800000011920928955078125);
                bool _2752 = _2748 || _2750;
                bool _2754 = _2722 != 0.0;
                bool _2756 = isnan(_2722);
                bool _2758 = _2754 || _2756;
                bool _2760 = isnan(0.0);
                bool _2762 = _2758 || _2760;
                bool _2764 = !_2752;
                bool _2766 = _2762 || _2764;
                if (_2766)
                {
                    _2740 = 1;
                }
                int _2768 = _2740;
                _2742 = _2768;
                if (!_2766)
                {
                    float2 _8787 = float2(_2724, _1138);
                    float2 _2770 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8787, float2(0.0), isnan(_8787)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8787, float2(0.0), isnan(_8787)), level(0.0)).xy;
                    float _2772 = _2770.x;
                    float _2774 = _2770.y;
                    float _2776 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2724);
                    _2742 = _2718;
                    _2730 = _2774;
                    _2732 = _2772;
                    _2734 = _2776;
                }
            }
            int _2778 = _2742;
            float _2780 = _2730;
            float _2782 = _2732;
            float _2784 = _2734;
            int _2786 = _2778 & 1;
            bool _2788 = _2786 != 0;
            float _2790 = _2780;
            float _2792 = _2782;
            float _2794 = _2784;
            int _2796 = _2778;
            if (_2788)
            {
                _2736 = _2778;
            }
            int _2798 = _2736;
            int _2800 = _2798;
            int _2802 = _2798;
            if (!_2788)
            {
                bool _2804 = _2780 > 0.800000011920928955078125;
                bool _2806 = isnan(_2780);
                bool _2808 = _2804 || _2806;
                bool _2810 = isnan(0.800000011920928955078125);
                bool _2812 = _2808 || _2810;
                bool _2814 = _2782 != 0.0;
                bool _2816 = isnan(_2782);
                bool _2818 = _2814 || _2816;
                bool _2820 = isnan(0.0);
                bool _2822 = _2818 || _2820;
                bool _2824 = !_2812;
                bool _2826 = _2822 || _2824;
                if (_2826)
                {
                    _2800 = 1;
                }
                int _2828 = _2800;
                _2802 = _2828;
                if (!_2826)
                {
                    float2 _8866 = float2(_2784, _1138);
                    float2 _2830 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8866, float2(0.0), isnan(_8866)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8866, float2(0.0), isnan(_8866)), level(0.0)).xy;
                    float _2832 = _2830.x;
                    float _2834 = _2830.y;
                    float _2836 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2784);
                    _2802 = _2778;
                    _2790 = _2834;
                    _2792 = _2832;
                    _2794 = _2836;
                }
            }
            int _2838 = _2802;
            float _2840 = _2790;
            float _2842 = _2792;
            float _2844 = _2794;
            int _2846 = _2838 & 1;
            bool _2848 = _2846 != 0;
            float _2850 = _2844;
            float _2852 = _2840;
            float _2854 = _2842;
            float _2856 = as_type<float>(_2838);
            if (_2848)
            {
                _2796 = _2838;
            }
            int _2858 = _2796;
            int _2860 = _2858;
            int _2862 = _2858;
            if (!_2848)
            {
                bool _2864 = _2840 > 0.800000011920928955078125;
                bool _2866 = isnan(_2840);
                bool _2868 = _2864 || _2866;
                bool _2870 = isnan(0.800000011920928955078125);
                bool _2872 = _2868 || _2870;
                bool _2874 = _2842 != 0.0;
                bool _2876 = isnan(_2842);
                bool _2878 = _2874 || _2876;
                bool _2880 = isnan(0.0);
                bool _2882 = _2878 || _2880;
                bool _2884 = !_2872;
                bool _2886 = _2882 || _2884;
                if (_2886)
                {
                    _2860 = 1;
                }
                int _2888 = _2860;
                _2862 = _2888;
                if (!_2886)
                {
                    float2 _8946 = float2(_2844, _1138);
                    float2 _2890 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8946, float2(0.0), isnan(_8946)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8946, float2(0.0), isnan(_8946)), level(0.0)).xy;
                    float _2892 = _2890.x;
                    float _2894 = _2890.y;
                    float _2896 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2844);
                    _2862 = _2838;
                    _2850 = _2896;
                    _2852 = _2894;
                    _2854 = _2892;
                }
            }
            int _2898 = _2862;
            float _2900 = _2850;
            float _2902 = _2852;
            float _2904 = _2854;
            int _2906 = _2898 & 1;
            bool _2908 = _2906 != 0;
            float _2910 = _2904;
            float _2912 = _2902;
            if (_2908)
            {
                _2856 = _2900;
            }
            float _2914 = _2856;
            float _2916 = _2914;
            float _2918 = _2914;
            if (!_2908)
            {
                bool _2920 = _2902 > 0.800000011920928955078125;
                bool _2922 = isnan(_2902);
                bool _2924 = _2920 || _2922;
                bool _2926 = isnan(0.800000011920928955078125);
                bool _2928 = _2924 || _2926;
                bool _2930 = _2904 != 0.0;
                bool _2932 = isnan(_2904);
                bool _2934 = _2930 || _2932;
                bool _2936 = isnan(0.0);
                bool _2938 = _2934 || _2936;
                bool _2940 = !_2928;
                bool _2942 = _2938 || _2940;
                if (_2942)
                {
                    _2916 = _2900;
                }
                float _2944 = _2916;
                _2918 = _2944;
                if (!_2942)
                {
                    float2 _9024 = float2(_2900, _1138);
                    float2 _2946 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9024, float2(0.0), isnan(_9024)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9024, float2(0.0), isnan(_9024)), level(0.0)).xy;
                    float _2948 = _2946.x;
                    float _2950 = _2946.y;
                    float _2952 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2900);
                    _2910 = _2948;
                    _2912 = _2950;
                    _2918 = _2952;
                }
            }
            float _2954 = _2910;
            float _2956 = _2912;
            float _2958 = _2918;
            float _2960 = fma(_2954, 0.5, 0.5234375);
            float _2962 = fma(_2956, 2.0, 0.03125);
            float _2964 = fma(_2132, 0.5, 0.0078125);
            float _2966 = fma(_2134, 2.0, 0.03125);
            float2 _9059 = float2(_2960, _2962);
            float _2968 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_9059, float2(0.0), isnan(_9059)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_9059, float2(0.0), isnan(_9059)), level(0.0)).x;
            float2 _9067 = float2(_2964, _2966);
            float _2970 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_9067, float2(0.0), isnan(_9067)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_9067, float2(0.0), isnan(_9067)), level(0.0)).x;
            float _2972 = fma(_2968, -2.007874011993408203125, 3.25);
            float _2974 = fma(_2970, -2.007874011993408203125, 3.25);
            float _2976 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _2978 = fma(_2972, _2976, _2958);
            float _2980 = fma(_2974, (*spvDescriptorSet0.cp_c3)._m0[0].z, _2136);
            float2 _9093 = float2(_2978, _128);
            float _2982 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9093, float2(0.0), isnan(_9093)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9093, float2(0.0), isnan(_9093)), level(0.0), int2(1, 0)).x;
            float2 _9101 = float2(_2980, _128);
            float _2984 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9101, float2(0.0), isnan(_9101)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9101, float2(0.0), isnan(_9101)), level(0.0)).x;
            float _2986 = -_112;
            float _2988 = fma(_2980, (*spvDescriptorSet0.cp_c3)._m0[0].x, _2986);
            float _2990 = -_112;
            float _2992 = fma(_2978, (*spvDescriptorSet0.cp_c3)._m0[0].x, _2990);
            float _2994 = rint(_2992);
            float _2996 = rint(_2988);
            float _2998 = abs(_2994);
            float _3000 = sqrt(_2998);
            float _3002 = abs(_2996);
            float _3004 = sqrt(_3002);
            float _3006 = _2982 * 4.0;
            float _3008 = _2984 * 4.0;
            float _3010 = rint(_3006);
            float _3012 = rint(_3008);
            float _3014 = fma(_3010, 16.0, _3000);
            float _3016 = fma(_3014, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _3018 = fma(_3012, 16.0, _3004);
            float _3020 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _3016);
            float _3022 = fma(_3018, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _9159 = float2(_2980, _118);
            float _3024 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9159, float2(0.0), isnan(_9159)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9159, float2(0.0), isnan(_9159)), level(0.0), int2(0, 1)).x;
            float2 _9168 = float2(_2980, _118);
            float _3026 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9168, float2(0.0), isnan(_9168)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9168, float2(0.0), isnan(_9168)), level(0.0), int2(0, -2)).x;
            float2 _9178 = float2(_2978, _118);
            float _3028 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9178, float2(0.0), isnan(_9178)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9178, float2(0.0), isnan(_9178)), level(0.0), int2(1)).x;
            float2 _9187 = float2(_2978, _118);
            float _3030 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9187, float2(0.0), isnan(_9187)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9187, float2(0.0), isnan(_9187)), level(0.0), int2(1, -2)).x;
            float2 _9196 = float2(_3022, _3020);
            float2 _3032 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_9196, float2(0.0), isnan(_9196)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_9196, float2(0.0), isnan(_9196)), level(0.0)).xy;
            float _3034 = _3032.x;
            float _3036 = _3032.y;
            float _3038 = abs(_2994);
            float _3040 = abs(_2996);
            bool _3042 = _3038 >= _3040;
            bool _3044 = isnan(_3038);
            bool _3046 = _3042 || _3044;
            bool _3048 = isnan(_3040);
            bool _3050 = _3046 || _3048;
            float _3052 = float(_3050);
            float _3054 = abs(_2996);
            float _3056 = abs(_2994);
            bool _3058 = _3054 >= _3056;
            bool _3060 = isnan(_3054);
            bool _3062 = _3058 || _3060;
            bool _3064 = isnan(_3056);
            bool _3066 = _3062 || _3064;
            float _3068 = float(_3066);
            float _3070 = _3052 + _3068;
            float _3072 = 1.0 / _3070;
            float _3074 = _3072 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
            float _3076 = _3052 * _3074;
            float _3078 = _3068 * _3074;
            float _3080 = -_3076;
            float _3082 = fma(_3080, _3024, 1.0);
            float _3084 = -_3076;
            float _3086 = fma(_3084, _3026, 1.0);
            float _3088 = -_3078;
            float _3090 = fma(_3088, _3028, _3082);
            float _3092 = precise::clamp(_3090, 0.0, 1.0);
            float _3094 = -_3078;
            float _3096 = fma(_3094, _3030, _3086);
            float _3098 = precise::clamp(_3096, 0.0, 1.0);
            float _3100 = _3034 * _3092;
            float _3102 = _3036 * _3098;
            _158 = _136;
            _160 = as_type<int>(_3024);
            _162 = as_type<int>(_3036);
            _150 = _3100;
            _152 = _3102;
        }
    }
    int _3104 = _158;
    int _3106 = _160;
    int _3108 = _162;
    float _3110 = _150;
    float _3112 = _152;
    int _3114 = _3104 & 1;
    bool _3116 = _3114 != 0;
    bool _3118 = !_3116;
    float _3120 = as_type<float>(_3104);
    int _3122 = _3106;
    int _3124 = _3108;
    float _5074;
    float _5076;
    if (!_3118)
    {
        float _3126 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _116);
        float _3128 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _118);
        float2 _9328 = float2(_3126, _128);
        float2 _3130 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9328, float2(0.0), isnan(_9328)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9328, float2(0.0), isnan(_9328)), level(0.0)).xy;
        float _3132 = _3130.x;
        float _3134 = _3130.y;
        float2 _9340 = float2(_3126, _3128);
        float2 _3136 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9340, float2(0.0), isnan(_9340)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9340, float2(0.0), isnan(_9340)), level(0.0)).xy;
        float _3138 = _3136.x;
        float _3140 = _3136.y;
        float _3142 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _128);
        float _3144 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3128);
        bool _3146 = _3138 > 0.800000011920928955078125;
        bool _3148 = isnan(_3138);
        bool _3150 = _3146 || _3148;
        bool _3152 = isnan(0.800000011920928955078125);
        bool _3154 = _3150 || _3152;
        bool _3156 = _3132 > 0.800000011920928955078125;
        bool _3158 = isnan(_3132);
        bool _3160 = _3156 || _3158;
        bool _3162 = isnan(0.800000011920928955078125);
        bool _3164 = _3160 || _3162;
        bool _3166 = _3140 != 0.0;
        bool _3168 = isnan(_3140);
        bool _3170 = _3166 || _3168;
        bool _3172 = isnan(0.0);
        bool _3174 = _3170 || _3172;
        bool _3176 = !_3154;
        bool _3178 = _3174 || _3176;
        bool _3180 = _3134 != 0.0;
        bool _3182 = isnan(_3134);
        bool _3184 = _3180 || _3182;
        bool _3186 = isnan(0.0);
        bool _3188 = _3184 || _3186;
        bool _3190 = !_3164;
        bool _3192 = _3188 || _3190;
        float _3194 = _3128;
        int _3196 = as_type<int>(_3142);
        float _3198 = _3144;
        float _3200 = _3138;
        if (_3178)
        {
            _3120 = _3138;
        }
        float _3202 = _3120;
        if (_3178)
        {
            _142 = _3140;
        }
        float _3204 = _142;
        float _3206 = _3132;
        float _3208 = _3134;
        if (!_3192)
        {
            float2 _9434 = float2(_3126, _3142);
            float2 _3210 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9434, float2(0.0), isnan(_9434)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9434, float2(0.0), isnan(_9434)), level(0.0)).xy;
            float _3212 = _3210.x;
            float _3214 = _3210.y;
            _3206 = _3212;
            _3208 = _3214;
        }
        float _3216 = _3206;
        float _3218 = _3208;
        float _3220 = _3202;
        float _3222 = _3204;
        if (!_3178)
        {
            float2 _9456 = float2(_3126, _3144);
            float2 _3224 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9456, float2(0.0), isnan(_9456)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9456, float2(0.0), isnan(_9456)), level(0.0)).xy;
            float _3226 = _3224.x;
            float _3228 = _3224.y;
            _3220 = _3226;
            _3222 = _3228;
        }
        float _3230 = _3220;
        float _3232 = _3222;
        if (_3192)
        {
            _3122 = 1;
        }
        int _3234 = _3122;
        int _3236 = _3234;
        if (!_3192)
        {
            _3236 = 0;
        }
        int _3238 = _3236;
        int _3240 = _3238;
        if (_3192)
        {
            _3194 = _3142;
        }
        float _3242 = _3194;
        float _3244 = _3242;
        if (!_3192)
        {
            float _3246 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3142);
            _3244 = _3246;
        }
        float _3248 = _3244;
        int _3250 = _3238 & 1;
        bool _3252 = _3250 != 0;
        float _3254 = _3248;
        if (_3252)
        {
            _3124 = _3238;
        }
        int _3256 = _3124;
        int _3258 = _3256;
        int _3260 = _3256;
        float _3262 = _3216;
        float _3264 = _3218;
        float _3266 = _3230;
        float _3268 = _3232;
        if (!_3252)
        {
            bool _3270 = _3216 > 0.800000011920928955078125;
            bool _3272 = isnan(_3216);
            bool _3274 = _3270 || _3272;
            bool _3276 = isnan(0.800000011920928955078125);
            bool _3278 = _3274 || _3276;
            bool _3280 = _3218 != 0.0;
            bool _3282 = isnan(_3218);
            bool _3284 = _3280 || _3282;
            bool _3286 = isnan(0.0);
            bool _3288 = _3284 || _3286;
            bool _3290 = !_3278;
            bool _3292 = _3288 || _3290;
            if (_3292)
            {
                _3258 = 1;
            }
            int _3294 = _3258;
            _3260 = _3294;
            if (!_3292)
            {
                float2 _9554 = float2(_3126, _3248);
                float2 _3296 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9554, float2(0.0), isnan(_9554)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9554, float2(0.0), isnan(_9554)), level(0.0)).xy;
                float _3298 = _3296.x;
                float _3300 = _3296.y;
                float _3302 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3248);
                _3260 = _3238;
                _3262 = _3298;
                _3264 = _3300;
                _3254 = _3302;
            }
        }
        int _3304 = _3260;
        float _3306 = _3262;
        float _3308 = _3264;
        float _3310 = _3254;
        int _3312 = _3304 & 1;
        bool _3314 = _3312 != 0;
        float _3316 = _3306;
        float _3318 = _3308;
        float _3320 = _3310;
        int _3322 = _3304;
        if (_3314)
        {
            _3196 = _3304;
        }
        int _3324 = _3196;
        int _3326 = _3324;
        int _3328 = _3324;
        if (!_3314)
        {
            bool _3330 = _3306 > 0.800000011920928955078125;
            bool _3332 = isnan(_3306);
            bool _3334 = _3330 || _3332;
            bool _3336 = isnan(0.800000011920928955078125);
            bool _3338 = _3334 || _3336;
            bool _3340 = _3308 != 0.0;
            bool _3342 = isnan(_3308);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan(0.0);
            bool _3348 = _3344 || _3346;
            bool _3350 = !_3338;
            bool _3352 = _3348 || _3350;
            if (_3352)
            {
                _3326 = 1;
            }
            int _3354 = _3326;
            _3328 = _3354;
            if (!_3352)
            {
                float2 _9633 = float2(_3126, _3310);
                float2 _3356 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9633, float2(0.0), isnan(_9633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9633, float2(0.0), isnan(_9633)), level(0.0)).xy;
                float _3358 = _3356.x;
                float _3360 = _3356.y;
                float _3362 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3310);
                _3328 = _3304;
                _3316 = _3358;
                _3318 = _3360;
                _3320 = _3362;
            }
        }
        int _3364 = _3328;
        float _3366 = _3316;
        float _3368 = _3318;
        float _3370 = _3320;
        int _3372 = _3364 & 1;
        bool _3374 = _3372 != 0;
        float _3376 = _3366;
        float _3378 = _3368;
        float _3380 = _3370;
        int _3382 = _3364;
        if (_3374)
        {
            _3240 = _3364;
        }
        int _3384 = _3240;
        int _3386 = _3384;
        int _3388 = _3384;
        if (!_3374)
        {
            bool _3390 = _3366 > 0.800000011920928955078125;
            bool _3392 = isnan(_3366);
            bool _3394 = _3390 || _3392;
            bool _3396 = isnan(0.800000011920928955078125);
            bool _3398 = _3394 || _3396;
            bool _3400 = _3368 != 0.0;
            bool _3402 = isnan(_3368);
            bool _3404 = _3400 || _3402;
            bool _3406 = isnan(0.0);
            bool _3408 = _3404 || _3406;
            bool _3410 = !_3398;
            bool _3412 = _3408 || _3410;
            if (_3412)
            {
                _3386 = 1;
            }
            int _3414 = _3386;
            _3388 = _3414;
            if (!_3412)
            {
                float2 _9712 = float2(_3126, _3370);
                float2 _3416 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9712, float2(0.0), isnan(_9712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9712, float2(0.0), isnan(_9712)), level(0.0)).xy;
                float _3418 = _3416.x;
                float _3420 = _3416.y;
                float _3422 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3370);
                _3388 = _3364;
                _3376 = _3418;
                _3378 = _3420;
                _3380 = _3422;
            }
        }
        int _3424 = _3388;
        float _3426 = _3376;
        float _3428 = _3378;
        float _3430 = _3380;
        int _3432 = _3424 & 1;
        bool _3434 = _3432 != 0;
        float _3436 = _3426;
        float _3438 = _3428;
        float _3440 = _3430;
        int _3442 = _3424;
        if (_3434)
        {
            _3382 = _3424;
        }
        int _3444 = _3382;
        int _3446 = _3444;
        int _3448 = _3444;
        if (!_3434)
        {
            bool _3450 = _3426 > 0.800000011920928955078125;
            bool _3452 = isnan(_3426);
            bool _3454 = _3450 || _3452;
            bool _3456 = isnan(0.800000011920928955078125);
            bool _3458 = _3454 || _3456;
            bool _3460 = _3428 != 0.0;
            bool _3462 = isnan(_3428);
            bool _3464 = _3460 || _3462;
            bool _3466 = isnan(0.0);
            bool _3468 = _3464 || _3466;
            bool _3470 = !_3458;
            bool _3472 = _3468 || _3470;
            if (_3472)
            {
                _3446 = 1;
            }
            int _3474 = _3446;
            _3448 = _3474;
            if (!_3472)
            {
                float2 _9791 = float2(_3126, _3430);
                float2 _3476 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9791, float2(0.0), isnan(_9791)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9791, float2(0.0), isnan(_9791)), level(0.0)).xy;
                float _3478 = _3476.x;
                float _3480 = _3476.y;
                float _3482 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3430);
                _3448 = _3424;
                _3436 = _3478;
                _3438 = _3480;
                _3440 = _3482;
            }
        }
        int _3484 = _3448;
        float _3486 = _3436;
        float _3488 = _3438;
        float _3490 = _3440;
        int _3492 = _3484 & 1;
        bool _3494 = _3492 != 0;
        float _3496 = _3486;
        float _3498 = _3488;
        float _3500 = _3490;
        int _3502 = _3484;
        if (_3494)
        {
            _3442 = _3484;
        }
        int _3504 = _3442;
        int _3506 = _3504;
        int _3508 = _3504;
        if (!_3494)
        {
            bool _3510 = _3486 > 0.800000011920928955078125;
            bool _3512 = isnan(_3486);
            bool _3514 = _3510 || _3512;
            bool _3516 = isnan(0.800000011920928955078125);
            bool _3518 = _3514 || _3516;
            bool _3520 = _3488 != 0.0;
            bool _3522 = isnan(_3488);
            bool _3524 = _3520 || _3522;
            bool _3526 = isnan(0.0);
            bool _3528 = _3524 || _3526;
            bool _3530 = !_3518;
            bool _3532 = _3528 || _3530;
            if (_3532)
            {
                _3506 = 1;
            }
            int _3534 = _3506;
            _3508 = _3534;
            if (!_3532)
            {
                float2 _9870 = float2(_3126, _3490);
                float2 _3536 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9870, float2(0.0), isnan(_9870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9870, float2(0.0), isnan(_9870)), level(0.0)).xy;
                float _3538 = _3536.x;
                float _3540 = _3536.y;
                float _3542 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3490);
                _3508 = _3484;
                _3496 = _3538;
                _3498 = _3540;
                _3500 = _3542;
            }
        }
        int _3544 = _3508;
        float _3546 = _3496;
        float _3548 = _3498;
        float _3550 = _3500;
        int _3552 = _3544 & 1;
        bool _3554 = _3552 != 0;
        float _3556 = _3546;
        float _3558 = _3548;
        float _3560 = _3550;
        int _3562 = _3544;
        if (_3554)
        {
            _3502 = _3544;
        }
        int _3564 = _3502;
        int _3566 = _3564;
        int _3568 = _3564;
        if (!_3554)
        {
            bool _3570 = _3546 > 0.800000011920928955078125;
            bool _3572 = isnan(_3546);
            bool _3574 = _3570 || _3572;
            bool _3576 = isnan(0.800000011920928955078125);
            bool _3578 = _3574 || _3576;
            bool _3580 = _3548 != 0.0;
            bool _3582 = isnan(_3548);
            bool _3584 = _3580 || _3582;
            bool _3586 = isnan(0.0);
            bool _3588 = _3584 || _3586;
            bool _3590 = !_3578;
            bool _3592 = _3588 || _3590;
            if (_3592)
            {
                _3566 = 1;
            }
            int _3594 = _3566;
            _3568 = _3594;
            if (!_3592)
            {
                float2 _9949 = float2(_3126, _3550);
                float2 _3596 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9949, float2(0.0), isnan(_9949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9949, float2(0.0), isnan(_9949)), level(0.0)).xy;
                float _3598 = _3596.x;
                float _3600 = _3596.y;
                float _3602 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3550);
                _3568 = _3544;
                _3556 = _3598;
                _3558 = _3600;
                _3560 = _3602;
            }
        }
        int _3604 = _3568;
        float _3606 = _3556;
        float _3608 = _3558;
        float _3610 = _3560;
        int _3612 = _3604 & 1;
        bool _3614 = _3612 != 0;
        float _3616 = _3606;
        float _3618 = _3608;
        float _3620 = _3610;
        int _3622 = _3604;
        if (_3614)
        {
            _3562 = _3604;
        }
        int _3624 = _3562;
        int _3626 = _3624;
        int _3628 = _3624;
        if (!_3614)
        {
            bool _3630 = _3606 > 0.800000011920928955078125;
            bool _3632 = isnan(_3606);
            bool _3634 = _3630 || _3632;
            bool _3636 = isnan(0.800000011920928955078125);
            bool _3638 = _3634 || _3636;
            bool _3640 = _3608 != 0.0;
            bool _3642 = isnan(_3608);
            bool _3644 = _3640 || _3642;
            bool _3646 = isnan(0.0);
            bool _3648 = _3644 || _3646;
            bool _3650 = !_3638;
            bool _3652 = _3648 || _3650;
            if (_3652)
            {
                _3626 = 1;
            }
            int _3654 = _3626;
            _3628 = _3654;
            if (!_3652)
            {
                float2 _10028 = float2(_3126, _3610);
                float2 _3656 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10028, float2(0.0), isnan(_10028)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10028, float2(0.0), isnan(_10028)), level(0.0)).xy;
                float _3658 = _3656.x;
                float _3660 = _3656.y;
                float _3662 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3610);
                _3628 = _3604;
                _3616 = _3658;
                _3618 = _3660;
                _3620 = _3662;
            }
        }
        int _3664 = _3628;
        float _3666 = _3616;
        float _3668 = _3618;
        float _3670 = _3620;
        int _3672 = _3664 & 1;
        bool _3674 = _3672 != 0;
        float _3676 = _3666;
        float _3678 = _3668;
        float _3680 = _3670;
        int _3682 = _3664;
        if (_3674)
        {
            _3622 = _3664;
        }
        int _3684 = _3622;
        int _3686 = _3684;
        int _3688 = _3684;
        if (!_3674)
        {
            bool _3690 = _3666 > 0.800000011920928955078125;
            bool _3692 = isnan(_3666);
            bool _3694 = _3690 || _3692;
            bool _3696 = isnan(0.800000011920928955078125);
            bool _3698 = _3694 || _3696;
            bool _3700 = _3668 != 0.0;
            bool _3702 = isnan(_3668);
            bool _3704 = _3700 || _3702;
            bool _3706 = isnan(0.0);
            bool _3708 = _3704 || _3706;
            bool _3710 = !_3698;
            bool _3712 = _3708 || _3710;
            if (_3712)
            {
                _3686 = 1;
            }
            int _3714 = _3686;
            _3688 = _3714;
            if (!_3712)
            {
                float2 _10107 = float2(_3126, _3670);
                float2 _3716 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10107, float2(0.0), isnan(_10107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10107, float2(0.0), isnan(_10107)), level(0.0)).xy;
                float _3718 = _3716.x;
                float _3720 = _3716.y;
                float _3722 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3670);
                _3688 = _3664;
                _3676 = _3718;
                _3678 = _3720;
                _3680 = _3722;
            }
        }
        int _3724 = _3688;
        float _3726 = _3676;
        float _3728 = _3678;
        float _3730 = _3680;
        int _3732 = _3724 & 1;
        bool _3734 = _3732 != 0;
        float _3736 = _3726;
        float _3738 = _3728;
        float _3740 = _3730;
        int _3742 = _3724;
        if (_3734)
        {
            _3682 = _3724;
        }
        int _3744 = _3682;
        int _3746 = _3744;
        int _3748 = _3744;
        if (!_3734)
        {
            bool _3750 = _3726 > 0.800000011920928955078125;
            bool _3752 = isnan(_3726);
            bool _3754 = _3750 || _3752;
            bool _3756 = isnan(0.800000011920928955078125);
            bool _3758 = _3754 || _3756;
            bool _3760 = _3728 != 0.0;
            bool _3762 = isnan(_3728);
            bool _3764 = _3760 || _3762;
            bool _3766 = isnan(0.0);
            bool _3768 = _3764 || _3766;
            bool _3770 = !_3758;
            bool _3772 = _3768 || _3770;
            if (_3772)
            {
                _3746 = 1;
            }
            int _3774 = _3746;
            _3748 = _3774;
            if (!_3772)
            {
                float2 _10186 = float2(_3126, _3730);
                float2 _3776 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10186, float2(0.0), isnan(_10186)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10186, float2(0.0), isnan(_10186)), level(0.0)).xy;
                float _3778 = _3776.x;
                float _3780 = _3776.y;
                float _3782 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3730);
                _3748 = _3724;
                _3736 = _3778;
                _3738 = _3780;
                _3740 = _3782;
            }
        }
        int _3784 = _3748;
        float _3786 = _3736;
        float _3788 = _3738;
        float _3790 = _3740;
        int _3792 = _3784 & 1;
        bool _3794 = _3792 != 0;
        float _3796 = _3786;
        float _3798 = _3788;
        float _3800 = _3790;
        int _3802 = _3784;
        if (_3794)
        {
            _3742 = _3784;
        }
        int _3804 = _3742;
        int _3806 = _3804;
        int _3808 = _3804;
        if (!_3794)
        {
            bool _3810 = _3786 > 0.800000011920928955078125;
            bool _3812 = isnan(_3786);
            bool _3814 = _3810 || _3812;
            bool _3816 = isnan(0.800000011920928955078125);
            bool _3818 = _3814 || _3816;
            bool _3820 = _3788 != 0.0;
            bool _3822 = isnan(_3788);
            bool _3824 = _3820 || _3822;
            bool _3826 = isnan(0.0);
            bool _3828 = _3824 || _3826;
            bool _3830 = !_3818;
            bool _3832 = _3828 || _3830;
            if (_3832)
            {
                _3806 = 1;
            }
            int _3834 = _3806;
            _3808 = _3834;
            if (!_3832)
            {
                float2 _10265 = float2(_3126, _3790);
                float2 _3836 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10265, float2(0.0), isnan(_10265)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10265, float2(0.0), isnan(_10265)), level(0.0)).xy;
                float _3838 = _3836.x;
                float _3840 = _3836.y;
                float _3842 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3790);
                _3808 = _3784;
                _3796 = _3838;
                _3798 = _3840;
                _3800 = _3842;
            }
        }
        int _3844 = _3808;
        float _3846 = _3796;
        float _3848 = _3798;
        float _3850 = _3800;
        int _3852 = _3844 & 1;
        bool _3854 = _3852 != 0;
        float _3856 = _3846;
        float _3858 = _3848;
        float _3860 = _3850;
        int _3862 = _3844;
        if (_3854)
        {
            _3802 = _3844;
        }
        int _3864 = _3802;
        int _3866 = _3864;
        int _3868 = _3864;
        if (!_3854)
        {
            bool _3870 = _3846 > 0.800000011920928955078125;
            bool _3872 = isnan(_3846);
            bool _3874 = _3870 || _3872;
            bool _3876 = isnan(0.800000011920928955078125);
            bool _3878 = _3874 || _3876;
            bool _3880 = _3848 != 0.0;
            bool _3882 = isnan(_3848);
            bool _3884 = _3880 || _3882;
            bool _3886 = isnan(0.0);
            bool _3888 = _3884 || _3886;
            bool _3890 = !_3878;
            bool _3892 = _3888 || _3890;
            if (_3892)
            {
                _3866 = 1;
            }
            int _3894 = _3866;
            _3868 = _3894;
            if (!_3892)
            {
                float2 _10344 = float2(_3126, _3850);
                float2 _3896 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10344, float2(0.0), isnan(_10344)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10344, float2(0.0), isnan(_10344)), level(0.0)).xy;
                float _3898 = _3896.x;
                float _3900 = _3896.y;
                float _3902 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3850);
                _3868 = _3844;
                _3856 = _3898;
                _3858 = _3900;
                _3860 = _3902;
            }
        }
        int _3904 = _3868;
        float _3906 = _3856;
        float _3908 = _3858;
        float _3910 = _3860;
        int _3912 = _3904 & 1;
        bool _3914 = _3912 != 0;
        float _3916 = _3906;
        float _3918 = _3908;
        float _3920 = _3910;
        int _3922 = _3904;
        if (_3914)
        {
            _3862 = _3904;
        }
        int _3924 = _3862;
        int _3926 = _3924;
        int _3928 = _3924;
        if (!_3914)
        {
            bool _3930 = _3906 > 0.800000011920928955078125;
            bool _3932 = isnan(_3906);
            bool _3934 = _3930 || _3932;
            bool _3936 = isnan(0.800000011920928955078125);
            bool _3938 = _3934 || _3936;
            bool _3940 = _3908 != 0.0;
            bool _3942 = isnan(_3908);
            bool _3944 = _3940 || _3942;
            bool _3946 = isnan(0.0);
            bool _3948 = _3944 || _3946;
            bool _3950 = !_3938;
            bool _3952 = _3948 || _3950;
            if (_3952)
            {
                _3926 = 1;
            }
            int _3954 = _3926;
            _3928 = _3954;
            if (!_3952)
            {
                float2 _10423 = float2(_3126, _3910);
                float2 _3956 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10423, float2(0.0), isnan(_10423)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10423, float2(0.0), isnan(_10423)), level(0.0)).xy;
                float _3958 = _3956.x;
                float _3960 = _3956.y;
                float _3962 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3910);
                _3928 = _3904;
                _3916 = _3958;
                _3918 = _3960;
                _3920 = _3962;
            }
        }
        int _3964 = _3928;
        float _3966 = _3916;
        float _3968 = _3918;
        float _3970 = _3920;
        int _3972 = _3964 & 1;
        bool _3974 = _3972 != 0;
        float _3976 = _3970;
        float _3978 = _3966;
        float _3980 = _3968;
        float _3982 = as_type<float>(_3964);
        if (_3178)
        {
            _3322 = 1;
        }
        int _3984 = _3322;
        int _3986 = _3984;
        if (!_3178)
        {
            _3986 = 0;
        }
        int _3988 = _3986;
        int _3990 = _3988 & 1;
        bool _3992 = _3990 != 0;
        if (_3974)
        {
            _3922 = _3964;
        }
        int _3994 = _3922;
        int _3996 = _3994;
        int _3998 = _3994;
        if (!_3974)
        {
            bool _4000 = _3966 > 0.800000011920928955078125;
            bool _4002 = isnan(_3966);
            bool _4004 = _4000 || _4002;
            bool _4006 = isnan(0.800000011920928955078125);
            bool _4008 = _4004 || _4006;
            bool _4010 = _3968 != 0.0;
            bool _4012 = isnan(_3968);
            bool _4014 = _4010 || _4012;
            bool _4016 = isnan(0.0);
            bool _4018 = _4014 || _4016;
            bool _4020 = !_4008;
            bool _4022 = _4018 || _4020;
            if (_4022)
            {
                _3996 = 1;
            }
            int _4024 = _3996;
            _3998 = _4024;
            if (!_4022)
            {
                float2 _10517 = float2(_3126, _3970);
                float2 _4026 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10517, float2(0.0), isnan(_10517)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10517, float2(0.0), isnan(_10517)), level(0.0)).xy;
                float _4028 = _4026.x;
                float _4030 = _4026.y;
                float _4032 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3970);
                _3998 = _3964;
                _3976 = _4032;
                _3978 = _4028;
                _3980 = _4030;
            }
        }
        int _4034 = _3998;
        float _4036 = _3976;
        float _4038 = _3978;
        float _4040 = _3980;
        int _4042 = _4034 & 1;
        bool _4044 = _4042 != 0;
        float _4046 = _4038;
        float _4048 = _4040;
        int _4050 = as_type<int>(_4036);
        int _4052 = _4034;
        if (_3178)
        {
            _3982 = _3144;
        }
        float _4054 = _3982;
        float _4056 = _4054;
        if (!_3178)
        {
            float _4058 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3144);
            _4056 = _4058;
        }
        float _4060 = _4056;
        float _4062 = _4060;
        if (_4044)
        {
            _3198 = _4036;
        }
        float _4064 = _3198;
        float _4066 = _4064;
        float _4068 = _4064;
        if (!_4044)
        {
            bool _4070 = _4038 > 0.800000011920928955078125;
            bool _4072 = isnan(_4038);
            bool _4074 = _4070 || _4072;
            bool _4076 = isnan(0.800000011920928955078125);
            bool _4078 = _4074 || _4076;
            bool _4080 = _4040 != 0.0;
            bool _4082 = isnan(_4040);
            bool _4084 = _4080 || _4082;
            bool _4086 = isnan(0.0);
            bool _4088 = _4084 || _4086;
            bool _4090 = !_4078;
            bool _4092 = _4088 || _4090;
            if (_4092)
            {
                _4066 = _4036;
            }
            float _4094 = _4066;
            _4068 = _4094;
            if (!_4092)
            {
                float2 _10615 = float2(_3126, _4036);
                float2 _4096 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10615, float2(0.0), isnan(_10615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10615, float2(0.0), isnan(_10615)), level(0.0)).xy;
                float _4098 = _4096.x;
                float _4100 = _4096.y;
                float _4102 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4036);
                _4046 = _4098;
                _4048 = _4100;
                _4068 = _4102;
            }
        }
        float _4104 = _4046;
        float _4106 = _4048;
        float _4108 = _4068;
        if (_3992)
        {
            _4050 = _3988;
        }
        int _4110 = _4050;
        int _4112 = _4110;
        int _4114 = _4110;
        if (!_3992)
        {
            bool _4116 = _3230 > 0.800000011920928955078125;
            bool _4118 = isnan(_3230);
            bool _4120 = _4116 || _4118;
            bool _4122 = isnan(0.800000011920928955078125);
            bool _4124 = _4120 || _4122;
            bool _4126 = _3232 != 0.0;
            bool _4128 = isnan(_3232);
            bool _4130 = _4126 || _4128;
            bool _4132 = isnan(0.0);
            bool _4134 = _4130 || _4132;
            bool _4136 = !_4124;
            bool _4138 = _4134 || _4136;
            if (_4138)
            {
                _4112 = 1;
            }
            int _4140 = _4112;
            _4114 = _4140;
            if (!_4138)
            {
                float2 _10684 = float2(_3126, _4060);
                float2 _4142 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10684, float2(0.0), isnan(_10684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10684, float2(0.0), isnan(_10684)), level(0.0)).xy;
                float _4144 = _4142.x;
                float _4146 = _4142.y;
                float _4148 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4060);
                _4114 = _3988;
                _3266 = _4144;
                _3268 = _4146;
                _4062 = _4148;
            }
        }
        int _4150 = _4114;
        float _4152 = _3266;
        float _4154 = _3268;
        float _4156 = _4062;
        int _4158 = _4150 & 1;
        bool _4160 = _4158 != 0;
        float _4162 = _4152;
        float _4164 = _4154;
        float _4166 = _4156;
        int _4168 = _4150;
        if (_4160)
        {
            _4052 = _4150;
        }
        int _4170 = _4052;
        int _4172 = _4170;
        int _4174 = _4170;
        if (!_4160)
        {
            bool _4176 = _4152 > 0.800000011920928955078125;
            bool _4178 = isnan(_4152);
            bool _4180 = _4176 || _4178;
            bool _4182 = isnan(0.800000011920928955078125);
            bool _4184 = _4180 || _4182;
            bool _4186 = _4154 != 0.0;
            bool _4188 = isnan(_4154);
            bool _4190 = _4186 || _4188;
            bool _4192 = isnan(0.0);
            bool _4194 = _4190 || _4192;
            bool _4196 = !_4184;
            bool _4198 = _4194 || _4196;
            if (_4198)
            {
                _4172 = 1;
            }
            int _4200 = _4172;
            _4174 = _4200;
            if (!_4198)
            {
                float2 _10763 = float2(_3126, _4156);
                float2 _4202 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10763, float2(0.0), isnan(_10763)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10763, float2(0.0), isnan(_10763)), level(0.0)).xy;
                float _4204 = _4202.x;
                float _4206 = _4202.y;
                float _4208 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4156);
                _4174 = _4150;
                _4162 = _4204;
                _4164 = _4206;
                _4166 = _4208;
            }
        }
        int _4210 = _4174;
        float _4212 = _4162;
        float _4214 = _4164;
        float _4216 = _4166;
        int _4218 = _4210 & 1;
        bool _4220 = _4218 != 0;
        float _4222 = _4212;
        float _4224 = _4214;
        float _4226 = _4216;
        int _4228 = _4210;
        if (_4220)
        {
            _4168 = _4210;
        }
        int _4230 = _4168;
        int _4232 = _4230;
        int _4234 = _4230;
        if (!_4220)
        {
            bool _4236 = _4212 > 0.800000011920928955078125;
            bool _4238 = isnan(_4212);
            bool _4240 = _4236 || _4238;
            bool _4242 = isnan(0.800000011920928955078125);
            bool _4244 = _4240 || _4242;
            bool _4246 = _4214 != 0.0;
            bool _4248 = isnan(_4214);
            bool _4250 = _4246 || _4248;
            bool _4252 = isnan(0.0);
            bool _4254 = _4250 || _4252;
            bool _4256 = !_4244;
            bool _4258 = _4254 || _4256;
            if (_4258)
            {
                _4232 = 1;
            }
            int _4260 = _4232;
            _4234 = _4260;
            if (!_4258)
            {
                float2 _10842 = float2(_3126, _4216);
                float2 _4262 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10842, float2(0.0), isnan(_10842)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10842, float2(0.0), isnan(_10842)), level(0.0)).xy;
                float _4264 = _4262.x;
                float _4266 = _4262.y;
                float _4268 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4216);
                _4234 = _4210;
                _4222 = _4264;
                _4224 = _4266;
                _4226 = _4268;
            }
        }
        int _4270 = _4234;
        float _4272 = _4222;
        float _4274 = _4224;
        float _4276 = _4226;
        int _4278 = _4270 & 1;
        bool _4280 = _4278 != 0;
        float _4282 = _4272;
        float _4284 = _4274;
        float _4286 = _4276;
        int _4288 = _4270;
        if (_4280)
        {
            _4228 = _4270;
        }
        int _4290 = _4228;
        int _4292 = _4290;
        int _4294 = _4290;
        if (!_4280)
        {
            bool _4296 = _4272 > 0.800000011920928955078125;
            bool _4298 = isnan(_4272);
            bool _4300 = _4296 || _4298;
            bool _4302 = isnan(0.800000011920928955078125);
            bool _4304 = _4300 || _4302;
            bool _4306 = _4274 != 0.0;
            bool _4308 = isnan(_4274);
            bool _4310 = _4306 || _4308;
            bool _4312 = isnan(0.0);
            bool _4314 = _4310 || _4312;
            bool _4316 = !_4304;
            bool _4318 = _4314 || _4316;
            if (_4318)
            {
                _4292 = 1;
            }
            int _4320 = _4292;
            _4294 = _4320;
            if (!_4318)
            {
                float2 _10921 = float2(_3126, _4276);
                float2 _4322 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10921, float2(0.0), isnan(_10921)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10921, float2(0.0), isnan(_10921)), level(0.0)).xy;
                float _4324 = _4322.x;
                float _4326 = _4322.y;
                float _4328 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4276);
                _4294 = _4270;
                _4282 = _4324;
                _4284 = _4326;
                _4286 = _4328;
            }
        }
        int _4330 = _4294;
        float _4332 = _4282;
        float _4334 = _4284;
        float _4336 = _4286;
        int _4338 = _4330 & 1;
        bool _4340 = _4338 != 0;
        float _4342 = _4332;
        float _4344 = _4334;
        float _4346 = _4336;
        int _4348 = _4330;
        if (_4340)
        {
            _4288 = _4330;
        }
        int _4350 = _4288;
        int _4352 = _4350;
        int _4354 = _4350;
        if (!_4340)
        {
            bool _4356 = _4332 > 0.800000011920928955078125;
            bool _4358 = isnan(_4332);
            bool _4360 = _4356 || _4358;
            bool _4362 = isnan(0.800000011920928955078125);
            bool _4364 = _4360 || _4362;
            bool _4366 = _4334 != 0.0;
            bool _4368 = isnan(_4334);
            bool _4370 = _4366 || _4368;
            bool _4372 = isnan(0.0);
            bool _4374 = _4370 || _4372;
            bool _4376 = !_4364;
            bool _4378 = _4374 || _4376;
            if (_4378)
            {
                _4352 = 1;
            }
            int _4380 = _4352;
            _4354 = _4380;
            if (!_4378)
            {
                float2 _11000 = float2(_3126, _4336);
                float2 _4382 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11000, float2(0.0), isnan(_11000)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11000, float2(0.0), isnan(_11000)), level(0.0)).xy;
                float _4384 = _4382.x;
                float _4386 = _4382.y;
                float _4388 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4336);
                _4354 = _4330;
                _4342 = _4384;
                _4344 = _4386;
                _4346 = _4388;
            }
        }
        int _4390 = _4354;
        float _4392 = _4342;
        float _4394 = _4344;
        float _4396 = _4346;
        int _4398 = _4390 & 1;
        bool _4400 = _4398 != 0;
        float _4402 = _4392;
        float _4404 = _4394;
        float _4406 = _4396;
        int _4408 = _4390;
        if (_4400)
        {
            _4348 = _4390;
        }
        int _4410 = _4348;
        int _4412 = _4410;
        int _4414 = _4410;
        if (!_4400)
        {
            bool _4416 = _4392 > 0.800000011920928955078125;
            bool _4418 = isnan(_4392);
            bool _4420 = _4416 || _4418;
            bool _4422 = isnan(0.800000011920928955078125);
            bool _4424 = _4420 || _4422;
            bool _4426 = _4394 != 0.0;
            bool _4428 = isnan(_4394);
            bool _4430 = _4426 || _4428;
            bool _4432 = isnan(0.0);
            bool _4434 = _4430 || _4432;
            bool _4436 = !_4424;
            bool _4438 = _4434 || _4436;
            if (_4438)
            {
                _4412 = 1;
            }
            int _4440 = _4412;
            _4414 = _4440;
            if (!_4438)
            {
                float2 _11079 = float2(_3126, _4396);
                float2 _4442 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11079, float2(0.0), isnan(_11079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11079, float2(0.0), isnan(_11079)), level(0.0)).xy;
                float _4444 = _4442.x;
                float _4446 = _4442.y;
                float _4448 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4396);
                _4414 = _4390;
                _4402 = _4444;
                _4404 = _4446;
                _4406 = _4448;
            }
        }
        int _4450 = _4414;
        float _4452 = _4402;
        float _4454 = _4404;
        float _4456 = _4406;
        int _4458 = _4450 & 1;
        bool _4460 = _4458 != 0;
        float _4462 = _4452;
        float _4464 = _4454;
        float _4466 = _4456;
        int _4468 = _4450;
        if (_4460)
        {
            _4408 = _4450;
        }
        int _4470 = _4408;
        int _4472 = _4470;
        int _4474 = _4470;
        if (!_4460)
        {
            bool _4476 = _4452 > 0.800000011920928955078125;
            bool _4478 = isnan(_4452);
            bool _4480 = _4476 || _4478;
            bool _4482 = isnan(0.800000011920928955078125);
            bool _4484 = _4480 || _4482;
            bool _4486 = _4454 != 0.0;
            bool _4488 = isnan(_4454);
            bool _4490 = _4486 || _4488;
            bool _4492 = isnan(0.0);
            bool _4494 = _4490 || _4492;
            bool _4496 = !_4484;
            bool _4498 = _4494 || _4496;
            if (_4498)
            {
                _4472 = 1;
            }
            int _4500 = _4472;
            _4474 = _4500;
            if (!_4498)
            {
                float2 _11158 = float2(_3126, _4456);
                float2 _4502 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11158, float2(0.0), isnan(_11158)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11158, float2(0.0), isnan(_11158)), level(0.0)).xy;
                float _4504 = _4502.x;
                float _4506 = _4502.y;
                float _4508 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4456);
                _4474 = _4450;
                _4462 = _4504;
                _4464 = _4506;
                _4466 = _4508;
            }
        }
        int _4510 = _4474;
        float _4512 = _4462;
        float _4514 = _4464;
        float _4516 = _4466;
        int _4518 = _4510 & 1;
        bool _4520 = _4518 != 0;
        float _4522 = _4512;
        float _4524 = _4514;
        float _4526 = _4516;
        int _4528 = _4510;
        if (_4520)
        {
            _4468 = _4510;
        }
        int _4530 = _4468;
        int _4532 = _4530;
        int _4534 = _4530;
        if (!_4520)
        {
            bool _4536 = _4512 > 0.800000011920928955078125;
            bool _4538 = isnan(_4512);
            bool _4540 = _4536 || _4538;
            bool _4542 = isnan(0.800000011920928955078125);
            bool _4544 = _4540 || _4542;
            bool _4546 = _4514 != 0.0;
            bool _4548 = isnan(_4514);
            bool _4550 = _4546 || _4548;
            bool _4552 = isnan(0.0);
            bool _4554 = _4550 || _4552;
            bool _4556 = !_4544;
            bool _4558 = _4554 || _4556;
            if (_4558)
            {
                _4532 = 1;
            }
            int _4560 = _4532;
            _4534 = _4560;
            if (!_4558)
            {
                float2 _11237 = float2(_3126, _4516);
                float2 _4562 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11237, float2(0.0), isnan(_11237)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11237, float2(0.0), isnan(_11237)), level(0.0)).xy;
                float _4564 = _4562.x;
                float _4566 = _4562.y;
                float _4568 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4516);
                _4534 = _4510;
                _4522 = _4564;
                _4524 = _4566;
                _4526 = _4568;
            }
        }
        int _4570 = _4534;
        float _4572 = _4522;
        float _4574 = _4524;
        float _4576 = _4526;
        int _4578 = _4570 & 1;
        bool _4580 = _4578 != 0;
        float _4582 = _4572;
        float _4584 = _4574;
        float _4586 = _4576;
        int _4588 = _4570;
        if (_4580)
        {
            _4528 = _4570;
        }
        int _4590 = _4528;
        int _4592 = _4590;
        int _4594 = _4590;
        if (!_4580)
        {
            bool _4596 = _4572 > 0.800000011920928955078125;
            bool _4598 = isnan(_4572);
            bool _4600 = _4596 || _4598;
            bool _4602 = isnan(0.800000011920928955078125);
            bool _4604 = _4600 || _4602;
            bool _4606 = _4574 != 0.0;
            bool _4608 = isnan(_4574);
            bool _4610 = _4606 || _4608;
            bool _4612 = isnan(0.0);
            bool _4614 = _4610 || _4612;
            bool _4616 = !_4604;
            bool _4618 = _4614 || _4616;
            if (_4618)
            {
                _4592 = 1;
            }
            int _4620 = _4592;
            _4594 = _4620;
            if (!_4618)
            {
                float2 _11316 = float2(_3126, _4576);
                float2 _4622 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11316, float2(0.0), isnan(_11316)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11316, float2(0.0), isnan(_11316)), level(0.0)).xy;
                float _4624 = _4622.x;
                float _4626 = _4622.y;
                float _4628 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4576);
                _4594 = _4570;
                _4582 = _4624;
                _4584 = _4626;
                _4586 = _4628;
            }
        }
        int _4630 = _4594;
        float _4632 = _4582;
        float _4634 = _4584;
        float _4636 = _4586;
        int _4638 = _4630 & 1;
        bool _4640 = _4638 != 0;
        float _4642 = _4632;
        float _4644 = _4634;
        float _4646 = _4636;
        int _4648 = _4630;
        if (_4640)
        {
            _4588 = _4630;
        }
        int _4650 = _4588;
        int _4652 = _4650;
        int _4654 = _4650;
        if (!_4640)
        {
            bool _4656 = _4632 > 0.800000011920928955078125;
            bool _4658 = isnan(_4632);
            bool _4660 = _4656 || _4658;
            bool _4662 = isnan(0.800000011920928955078125);
            bool _4664 = _4660 || _4662;
            bool _4666 = _4634 != 0.0;
            bool _4668 = isnan(_4634);
            bool _4670 = _4666 || _4668;
            bool _4672 = isnan(0.0);
            bool _4674 = _4670 || _4672;
            bool _4676 = !_4664;
            bool _4678 = _4674 || _4676;
            if (_4678)
            {
                _4652 = 1;
            }
            int _4680 = _4652;
            _4654 = _4680;
            if (!_4678)
            {
                float2 _11395 = float2(_3126, _4636);
                float2 _4682 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11395, float2(0.0), isnan(_11395)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11395, float2(0.0), isnan(_11395)), level(0.0)).xy;
                float _4684 = _4682.x;
                float _4686 = _4682.y;
                float _4688 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4636);
                _4654 = _4630;
                _4642 = _4684;
                _4644 = _4686;
                _4646 = _4688;
            }
        }
        int _4690 = _4654;
        float _4692 = _4642;
        float _4694 = _4644;
        float _4696 = _4646;
        int _4698 = _4690 & 1;
        bool _4700 = _4698 != 0;
        float _4702 = _4692;
        float _4704 = _4694;
        float _4706 = _4696;
        int _4708 = _4690;
        if (_4700)
        {
            _4648 = _4690;
        }
        int _4710 = _4648;
        int _4712 = _4710;
        int _4714 = _4710;
        if (!_4700)
        {
            bool _4716 = _4692 > 0.800000011920928955078125;
            bool _4718 = isnan(_4692);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan(0.800000011920928955078125);
            bool _4724 = _4720 || _4722;
            bool _4726 = _4694 != 0.0;
            bool _4728 = isnan(_4694);
            bool _4730 = _4726 || _4728;
            bool _4732 = isnan(0.0);
            bool _4734 = _4730 || _4732;
            bool _4736 = !_4724;
            bool _4738 = _4734 || _4736;
            if (_4738)
            {
                _4712 = 1;
            }
            int _4740 = _4712;
            _4714 = _4740;
            if (!_4738)
            {
                float2 _11474 = float2(_3126, _4696);
                float2 _4742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11474, float2(0.0), isnan(_11474)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11474, float2(0.0), isnan(_11474)), level(0.0)).xy;
                float _4744 = _4742.x;
                float _4746 = _4742.y;
                float _4748 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4696);
                _4714 = _4690;
                _4702 = _4744;
                _4704 = _4746;
                _4706 = _4748;
            }
        }
        int _4750 = _4714;
        float _4752 = _4702;
        float _4754 = _4704;
        float _4756 = _4706;
        int _4758 = _4750 & 1;
        bool _4760 = _4758 != 0;
        float _4762 = _4752;
        float _4764 = _4754;
        float _4766 = _4756;
        int _4768 = _4750;
        if (_4760)
        {
            _4708 = _4750;
        }
        int _4770 = _4708;
        int _4772 = _4770;
        int _4774 = _4770;
        if (!_4760)
        {
            bool _4776 = _4752 > 0.800000011920928955078125;
            bool _4778 = isnan(_4752);
            bool _4780 = _4776 || _4778;
            bool _4782 = isnan(0.800000011920928955078125);
            bool _4784 = _4780 || _4782;
            bool _4786 = _4754 != 0.0;
            bool _4788 = isnan(_4754);
            bool _4790 = _4786 || _4788;
            bool _4792 = isnan(0.0);
            bool _4794 = _4790 || _4792;
            bool _4796 = !_4784;
            bool _4798 = _4794 || _4796;
            if (_4798)
            {
                _4772 = 1;
            }
            int _4800 = _4772;
            _4774 = _4800;
            if (!_4798)
            {
                float2 _11553 = float2(_3126, _4756);
                float2 _4802 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11553, float2(0.0), isnan(_11553)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11553, float2(0.0), isnan(_11553)), level(0.0)).xy;
                float _4804 = _4802.x;
                float _4806 = _4802.y;
                float _4808 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4756);
                _4774 = _4750;
                _4762 = _4804;
                _4764 = _4806;
                _4766 = _4808;
            }
        }
        int _4810 = _4774;
        float _4812 = _4762;
        float _4814 = _4764;
        float _4816 = _4766;
        int _4818 = _4810 & 1;
        bool _4820 = _4818 != 0;
        float _4822 = _4816;
        float _4824 = _4812;
        float _4826 = _4814;
        if (_4820)
        {
            _4768 = _4810;
        }
        int _4828 = _4768;
        int _4830 = _4828;
        int _4832 = _4828;
        if (!_4820)
        {
            bool _4834 = _4812 > 0.800000011920928955078125;
            bool _4836 = isnan(_4812);
            bool _4838 = _4834 || _4836;
            bool _4840 = isnan(0.800000011920928955078125);
            bool _4842 = _4838 || _4840;
            bool _4844 = _4814 != 0.0;
            bool _4846 = isnan(_4814);
            bool _4848 = _4844 || _4846;
            bool _4850 = isnan(0.0);
            bool _4852 = _4848 || _4850;
            bool _4854 = !_4842;
            bool _4856 = _4852 || _4854;
            if (_4856)
            {
                _4830 = 1;
            }
            int _4858 = _4830;
            _4832 = _4858;
            if (!_4856)
            {
                float2 _11631 = float2(_3126, _4816);
                float2 _4860 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11631, float2(0.0), isnan(_11631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11631, float2(0.0), isnan(_11631)), level(0.0)).xy;
                float _4862 = _4860.x;
                float _4864 = _4860.y;
                float _4866 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4816);
                _4832 = _4810;
                _4822 = _4866;
                _4824 = _4862;
                _4826 = _4864;
            }
        }
        int _4868 = _4832;
        float _4870 = _4822;
        float _4872 = _4824;
        float _4874 = _4826;
        int _4876 = _4868 & 1;
        bool _4878 = _4876 != 0;
        float _4880 = _4874;
        float _4882 = _4872;
        if (_4878)
        {
            _3200 = _4870;
        }
        float _4884 = _3200;
        float _4886 = _4884;
        float _4888 = _4884;
        if (!_4878)
        {
            bool _4890 = _4872 > 0.800000011920928955078125;
            bool _4892 = isnan(_4872);
            bool _4894 = _4890 || _4892;
            bool _4896 = isnan(0.800000011920928955078125);
            bool _4898 = _4894 || _4896;
            bool _4900 = _4874 != 0.0;
            bool _4902 = isnan(_4874);
            bool _4904 = _4900 || _4902;
            bool _4906 = isnan(0.0);
            bool _4908 = _4904 || _4906;
            bool _4910 = !_4898;
            bool _4912 = _4908 || _4910;
            if (_4912)
            {
                _4886 = _4870;
            }
            float _4914 = _4886;
            _4888 = _4914;
            if (!_4912)
            {
                float2 _11709 = float2(_3126, _4870);
                float2 _4916 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11709, float2(0.0), isnan(_11709)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11709, float2(0.0), isnan(_11709)), level(0.0)).xy;
                float _4918 = _4916.x;
                float _4920 = _4916.y;
                float _4922 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4870);
                _4880 = _4920;
                _4882 = _4918;
                _4888 = _4922;
            }
        }
        float _4924 = _4880;
        float _4926 = _4882;
        float _4928 = _4888;
        float _4930 = fma(_4924, 0.5, 0.5234375);
        float _4932 = fma(_4926, 2.0, 0.03125);
        float _4934 = fma(_4104, 2.0, 0.03125);
        float _4936 = fma(_4106, 0.5, 0.0078125);
        float2 _11741 = float2(_4930, _4932);
        float _4938 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_11741, float2(0.0), isnan(_11741)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_11741, float2(0.0), isnan(_11741)), level(0.0)).x;
        float2 _11749 = float2(_4936, _4934);
        float _4940 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_11749, float2(0.0), isnan(_11749)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_11749, float2(0.0), isnan(_11749)), level(0.0)).x;
        float _4942 = fma(_4938, -2.007874011993408203125, 3.25);
        float _4944 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _4946 = fma(_4942, _4944, _4928);
        float2 _11766 = float2(_126, _4946);
        float _4948 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11766, float2(0.0), isnan(_11766)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11766, float2(0.0), isnan(_11766)), level(0.0), int2(0, 1)).y;
        float _4950 = fma(_4940, -2.007874011993408203125, 3.25);
        float _4952 = fma(_4950, (*spvDescriptorSet0.cp_c3)._m0[0].w, _4108);
        float2 _11781 = float2(_126, _4952);
        float _4954 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11781, float2(0.0), isnan(_11781)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11781, float2(0.0), isnan(_11781)), level(0.0)).y;
        float _4956 = -_114;
        float _4958 = fma(_4952, (*spvDescriptorSet0.cp_c3)._m0[0].y, _4956);
        float _4960 = -_114;
        float _4962 = fma(_4946, (*spvDescriptorSet0.cp_c3)._m0[0].y, _4960);
        float _4964 = rint(_4962);
        float _4966 = rint(_4958);
        float _4968 = abs(_4964);
        float _4970 = sqrt(_4968);
        float _4972 = abs(_4966);
        float _4974 = sqrt(_4972);
        float _4976 = _4948 * 4.0;
        float _4978 = rint(_4976);
        float _4980 = _4954 * 4.0;
        float _4982 = rint(_4980);
        float _4984 = fma(_4978, 16.0, _4970);
        float _4986 = fma(_4984, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _4988 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _4986);
        float _4990 = fma(_4982, 16.0, _4974);
        float2 _11835 = float2(_116, _4952);
        float _4992 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11835, float2(0.0), isnan(_11835)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11835, float2(0.0), isnan(_11835)), level(0.0), int2(1, 0)).y;
        float _4994 = fma(_4990, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _11845 = float2(_116, _4952);
        float _4996 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11845, float2(0.0), isnan(_11845)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11845, float2(0.0), isnan(_11845)), level(0.0), int2(-2, 0)).y;
        float2 _11854 = float2(_116, _4946);
        float _4998 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11854, float2(0.0), isnan(_11854)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11854, float2(0.0), isnan(_11854)), level(0.0), int2(1)).y;
        float2 _11862 = float2(_116, _4946);
        float _5000 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11862, float2(0.0), isnan(_11862)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11862, float2(0.0), isnan(_11862)), level(0.0), int2(-2, 1)).y;
        float2 _11871 = float2(_4994, _4988);
        float2 _5002 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_11871, float2(0.0), isnan(_11871)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_11871, float2(0.0), isnan(_11871)), level(0.0)).xy;
        float _5004 = _5002.x;
        float _5006 = _5002.y;
        float _5008 = abs(_4964);
        float _5010 = abs(_4966);
        bool _5012 = _5008 >= _5010;
        bool _5014 = isnan(_5008);
        bool _5016 = _5012 || _5014;
        bool _5018 = isnan(_5010);
        bool _5020 = _5016 || _5018;
        float _5022 = float(_5020);
        float _5024 = abs(_4966);
        float _5026 = abs(_4964);
        bool _5028 = _5024 >= _5026;
        bool _5030 = isnan(_5024);
        bool _5032 = _5028 || _5030;
        bool _5034 = isnan(_5026);
        bool _5036 = _5032 || _5034;
        float _5038 = float(_5036);
        float _5040 = _5022 + _5038;
        float _5042 = 1.0 / _5040;
        float _5044 = _5042 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        float _5046 = _5022 * _5044;
        float _5048 = _5038 * _5044;
        float _5050 = -_5046;
        float _5052 = fma(_5050, _4992, 1.0);
        float _5054 = -_5046;
        float _5056 = fma(_5054, _4996, 1.0);
        float _5058 = -_5048;
        float _5060 = fma(_5058, _4998, _5052);
        float _5062 = precise::clamp(_5060, 0.0, 1.0);
        float _5064 = -_5048;
        float _5066 = fma(_5064, _5000, _5056);
        float _5068 = precise::clamp(_5066, 0.0, 1.0);
        float _5070 = _5004 * _5062;
        float _5072 = _5006 * _5068;
        _5074 = _5070;
        _5076 = _5072;
        _5078 = true;
    }
    else
    {
        _5074 = 0.0;
        _5076 = 0.0;
    }
    _5078 = false;
    float _5080 = _5074;
    float _5082 = _5076;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3110, _3112, _5080, _5082), uint2(int2(as_type<int>(_104), as_type<int>(_106))));
}

