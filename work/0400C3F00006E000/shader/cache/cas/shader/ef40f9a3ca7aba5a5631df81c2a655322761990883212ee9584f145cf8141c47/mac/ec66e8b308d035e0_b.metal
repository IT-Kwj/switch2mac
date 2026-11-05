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
int _48(thread const int& _13265, thread const int& _13266, constant _10& support_buffer)
{
    int _13269 = 1 + _13266;
    float _13271 = support_buffer._m5[_13269].x;
    bool _13273 = _13271 == 1.0;
    if (_13273)
    {
        return _13265;
    }
    float _13275 = float(_13265);
    float _13277 = _13275 * _13271;
    int _13279 = int(_13277);
    return _13279;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _5570 = false;
    bool _1486 = false;
    bool _1152 = false;
    bool _688 = false;
    bool _432 = false;
    int _51 = 0;
    int _53 = 3;
    int _55 = _48(_51, _53, (*spvDescriptorSet0.support_buffer));
    int _57 = 0;
    int _59 = 3;
    int _61 = _48(_57, _59, (*spvDescriptorSet0.support_buffer));
    float _64 = spvDescriptorSet0.cp_i_tcb_4A_.read(uint2(int2(_55, _61))).x;
    float _66 = as_type<float>(gl_WorkGroupID.x);
    float _68 = as_type<float>(gl_LocalInvocationID.x);
    int _70 = as_type<int>(_66) << 6;
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
    float _108 = _104 * 8192.0;
    float _110 = _106 * 8192.0;
    float _112 = trunc(_108);
    int _114 = int(_112);
    float _116 = trunc(_110);
    int _118 = int(_116);
    float _120 = float(_114);
    float _122 = _120 + 0.5;
    float _124 = float(_118);
    float _126 = _122 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _128 = _124 + 0.5;
    float _130 = _128 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float2 _5676 = float2(_126, _130);
    float2 _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5676, float2(0.0), isnan(_5676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5676, float2(0.0), isnan(_5676)), level(0.0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _126);
    float _140 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.25, _126);
    float _142 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _130);
    float _144 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.25, _130);
    bool _146 = _136 > 0.0;
    bool _148 = _134 > 0.0;
    bool _150 = !_148;
    int _152 = _150 ? 0 : 1;
    float _154 = _136;
    float _156 = _134;
    int _158 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z);
    float _160 = _144;
    int _162 = _152;
    float _164 = _142;
    if (!_146)
    {
        _154 = 0.0;
        _156 = 0.0;
    }
    float _166 = _154;
    float _168 = _156;
    int _170 = 0;
    float _172 = _168;
    float _174 = _166;
    if (!_146)
    {
        _170 = _152;
    }
    int _176 = _170;
    bool _178 = !_146;
    int _180 = _176;
    float _182 = 0.0;
    if (!_178)
    {
        float _184 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _126);
        float _186 = 0.0;
        float _188 = _184;
        _182 = _184;
        if (!_148)
        {
            _186 = 0.0;
        }
        float _190 = _186;
        float _192 = 0.0;
        float _194 = _190;
        if (!_148)
        {
            _192 = 0.0;
        }
        float _196 = _192;
        float _198 = fma(-0.125, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
        bool _200 = !_148;
        float _202 = _196;
        if (!_200)
        {
            float _204 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _206 = _126 + _204;
            float _208 = _130 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _5784 = float2(_206, _208);
            float2 _210 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5784, float2(0.0), isnan(_5784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5784, float2(0.0), isnan(_5784)), level(0.0)).xy;
            float _212 = _210.x;
            float _214 = _210.y;
            float _216 = _212 + _214;
            float _218 = _216 * 0.5;
            bool _220 = _218 >= 0.89999997615814208984375;
            bool _222 = isnan(_218);
            bool _224 = _220 || _222;
            bool _226 = isnan(0.89999997615814208984375);
            bool _228 = _224 || _226;
            bool _230 = !_228;
            float _232 = _214;
            float _234 = 0.0;
            float _236 = _218;
            if (!_230)
            {
                float _238 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _240 = _206 + _238;
                float _242 = _208 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _5830 = float2(_240, _242);
                float2 _244 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5830, float2(0.0), isnan(_5830)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5830, float2(0.0), isnan(_5830)), level(0.0)).xy;
                float _246 = _244.x;
                float _248 = _244.y;
                float _250 = _248 + _246;
                float _252 = _250 * 0.5;
                bool _254 = _252 >= 0.89999997615814208984375;
                bool _256 = isnan(_252);
                bool _258 = _254 || _256;
                bool _260 = isnan(0.89999997615814208984375);
                bool _262 = _258 || _260;
                bool _264 = !_262;
                _232 = _248;
                _234 = 1.0;
                _236 = _252;
                if (!_264)
                {
                    float _266 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _268 = _240 + _266;
                    float _270 = _242 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _5876 = float2(_268, _270);
                    float2 _272 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5876, float2(0.0), isnan(_5876)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5876, float2(0.0), isnan(_5876)), level(0.0)).xy;
                    float _274 = _272.x;
                    float _276 = _272.y;
                    float _278 = _276 + _274;
                    float _280 = _278 * 0.5;
                    bool _282 = _280 >= 0.89999997615814208984375;
                    bool _284 = isnan(_280);
                    bool _286 = _282 || _284;
                    bool _288 = isnan(0.89999997615814208984375);
                    bool _290 = _286 || _288;
                    bool _292 = !_290;
                    _232 = _276;
                    _234 = 2.0;
                    _236 = _280;
                    if (!_292)
                    {
                        float _294 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _296 = _268 + _294;
                        float _298 = _270 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _5922 = float2(_296, _298);
                        float2 _300 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5922, float2(0.0), isnan(_5922)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5922, float2(0.0), isnan(_5922)), level(0.0)).xy;
                        float _302 = _300.x;
                        float _304 = _300.y;
                        float _306 = _304 + _302;
                        float _308 = _306 * 0.5;
                        bool _310 = _308 >= 0.89999997615814208984375;
                        bool _312 = isnan(_308);
                        bool _314 = _310 || _312;
                        bool _316 = isnan(0.89999997615814208984375);
                        bool _318 = _314 || _316;
                        bool _320 = !_318;
                        _232 = _304;
                        _234 = 3.0;
                        _236 = _308;
                        if (!_320)
                        {
                            float _322 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _324 = _296 + _322;
                            float _326 = _298 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float2 _5968 = float2(_324, _326);
                            float2 _328 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5968, float2(0.0), isnan(_5968)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5968, float2(0.0), isnan(_5968)), level(0.0)).xy;
                            float _330 = _328.x;
                            float _332 = _328.y;
                            float _334 = _332 + _330;
                            float _336 = _334 * 0.5;
                            bool _338 = _336 >= 0.89999997615814208984375;
                            bool _340 = isnan(_336);
                            bool _342 = _338 || _340;
                            bool _344 = isnan(0.89999997615814208984375);
                            bool _346 = _342 || _344;
                            bool _348 = !_346;
                            _232 = _332;
                            _234 = 4.0;
                            _236 = _336;
                            if (!_348)
                            {
                                float _350 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _352 = _324 + _350;
                                float _354 = _326 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float2 _6014 = float2(_352, _354);
                                float2 _356 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6014, float2(0.0), isnan(_6014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6014, float2(0.0), isnan(_6014)), level(0.0)).xy;
                                float _358 = _356.x;
                                float _360 = _356.y;
                                float _362 = _360 + _358;
                                float _364 = _362 * 0.5;
                                bool _366 = _364 >= 0.89999997615814208984375;
                                bool _368 = isnan(_364);
                                bool _370 = _366 || _368;
                                bool _372 = isnan(0.89999997615814208984375);
                                bool _374 = _370 || _372;
                                bool _376 = !_374;
                                _232 = _360;
                                _234 = 5.0;
                                _236 = _364;
                                if (!_376)
                                {
                                    float _378 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _380 = _352 + _378;
                                    float _382 = _354 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float2 _6060 = float2(_380, _382);
                                    float2 _384 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6060, float2(0.0), isnan(_6060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6060, float2(0.0), isnan(_6060)), level(0.0)).xy;
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
                                    _232 = _388;
                                    _234 = 6.0;
                                    _236 = _392;
                                    if (!_404)
                                    {
                                        float _406 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                        float _408 = _380 + _406;
                                        float _410 = _382 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                        float2 _6106 = float2(_408, _410);
                                        float2 _412 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6106, float2(0.0), isnan(_6106)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6106, float2(0.0), isnan(_6106)), level(0.0)).xy;
                                        float _414 = _412.x;
                                        float _416 = _412.y;
                                        float _418 = _416 + _414;
                                        float _420 = _418 * 0.5;
                                        bool _422 = _420 >= 0.89999997615814208984375;
                                        bool _424 = isnan(_420);
                                        bool _426 = _422 || _424;
                                        bool _428 = isnan(0.89999997615814208984375);
                                        bool _430 = _426 || _428;
                                        _232 = _416;
                                        _236 = _420;
                                        if (!_430)
                                        {
                                            _234 = 7.0;
                                            _432 = true;
                                        }
                                        else
                                        {
                                            _234 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _432 = false;
            float _434 = _232;
            float _436 = _234;
            float _438 = _236;
            bool _440 = _434 >= 0.89999997615814208984375;
            bool _442 = isnan(_434);
            bool _444 = _440 || _442;
            bool _446 = isnan(0.89999997615814208984375);
            bool _448 = _444 || _446;
            float _450 = float(_448);
            float _452 = _450 + _436;
            _194 = _452;
            _202 = _438;
        }
        float _454 = _194;
        float _456 = _202;
        float _458 = _126 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _460 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _462 = _130 + _460;
        float2 _6184 = float2(_458, _462);
        float2 _464 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6184, float2(0.0), isnan(_6184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6184, float2(0.0), isnan(_6184)), level(0.0)).xy;
        float _466 = _464.x;
        float _468 = _464.y;
        float _470 = _466 + _468;
        float _472 = _470 * 0.5;
        bool _474 = _472 >= 0.89999997615814208984375;
        bool _476 = isnan(_472);
        bool _478 = _474 || _476;
        bool _480 = isnan(0.89999997615814208984375);
        bool _482 = _478 || _480;
        bool _484 = !_482;
        float _486 = 0.0;
        float _488 = _472;
        float _490 = _468;
        float _492 = _456;
        if (!_484)
        {
            float _494 = _458 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _496 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _498 = _462 + _496;
            float2 _6230 = float2(_494, _498);
            float2 _500 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6230, float2(0.0), isnan(_6230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6230, float2(0.0), isnan(_6230)), level(0.0)).xy;
            float _502 = _500.x;
            float _504 = _500.y;
            float _506 = _504 + _502;
            float _508 = _506 * 0.5;
            bool _510 = _508 >= 0.89999997615814208984375;
            bool _512 = isnan(_508);
            bool _514 = _510 || _512;
            bool _516 = isnan(0.89999997615814208984375);
            bool _518 = _514 || _516;
            bool _520 = !_518;
            _486 = 1.0;
            _488 = _508;
            _490 = _498;
            if (!_520)
            {
                float _522 = _494 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _524 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _526 = _498 + _524;
                float2 _6275 = float2(_522, _526);
                float2 _528 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6275, float2(0.0), isnan(_6275)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6275, float2(0.0), isnan(_6275)), level(0.0)).xy;
                float _530 = _528.x;
                float _532 = _528.y;
                float _534 = _532 + _530;
                float _536 = _534 * 0.5;
                bool _538 = _536 >= 0.89999997615814208984375;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(0.89999997615814208984375);
                bool _546 = _542 || _544;
                bool _548 = !_546;
                _486 = 2.0;
                _488 = _536;
                _490 = _526;
                if (!_548)
                {
                    float _550 = _522 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _552 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _554 = _526 + _552;
                    float2 _6320 = float2(_550, _554);
                    float2 _556 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6320, float2(0.0), isnan(_6320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6320, float2(0.0), isnan(_6320)), level(0.0)).xy;
                    float _558 = _556.x;
                    float _560 = _556.y;
                    float _562 = _560 + _558;
                    float _564 = _562 * 0.5;
                    bool _566 = _564 >= 0.89999997615814208984375;
                    bool _568 = isnan(_564);
                    bool _570 = _566 || _568;
                    bool _572 = isnan(0.89999997615814208984375);
                    bool _574 = _570 || _572;
                    bool _576 = !_574;
                    _486 = 3.0;
                    _488 = _564;
                    _490 = _554;
                    if (!_576)
                    {
                        float _578 = _550 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _580 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float _582 = _554 + _580;
                        float2 _6365 = float2(_578, _582);
                        float2 _584 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6365, float2(0.0), isnan(_6365)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6365, float2(0.0), isnan(_6365)), level(0.0)).xy;
                        float _586 = _584.x;
                        float _588 = _584.y;
                        float _590 = _588 + _586;
                        float _592 = _590 * 0.5;
                        bool _594 = _592 >= 0.89999997615814208984375;
                        bool _596 = isnan(_592);
                        bool _598 = _594 || _596;
                        bool _600 = isnan(0.89999997615814208984375);
                        bool _602 = _598 || _600;
                        bool _604 = !_602;
                        _486 = 4.0;
                        _488 = _592;
                        _490 = _582;
                        if (!_604)
                        {
                            float _606 = _578 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _608 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float _610 = _582 + _608;
                            float2 _6410 = float2(_606, _610);
                            float2 _612 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6410, float2(0.0), isnan(_6410)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6410, float2(0.0), isnan(_6410)), level(0.0)).xy;
                            float _614 = _612.x;
                            float _616 = _612.y;
                            float _618 = _616 + _614;
                            float _620 = _618 * 0.5;
                            bool _622 = _620 >= 0.89999997615814208984375;
                            bool _624 = isnan(_620);
                            bool _626 = _622 || _624;
                            bool _628 = isnan(0.89999997615814208984375);
                            bool _630 = _626 || _628;
                            bool _632 = !_630;
                            _486 = 5.0;
                            _488 = _620;
                            _490 = _610;
                            if (!_632)
                            {
                                float _634 = _606 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _636 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float _638 = _610 + _636;
                                float2 _6455 = float2(_634, _638);
                                float2 _640 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6455, float2(0.0), isnan(_6455)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6455, float2(0.0), isnan(_6455)), level(0.0)).xy;
                                float _642 = _640.x;
                                float _644 = _640.y;
                                float _646 = _644 + _642;
                                float _648 = _646 * 0.5;
                                bool _650 = _648 >= 0.89999997615814208984375;
                                bool _652 = isnan(_648);
                                bool _654 = _650 || _652;
                                bool _656 = isnan(0.89999997615814208984375);
                                bool _658 = _654 || _656;
                                bool _660 = !_658;
                                _486 = 6.0;
                                _488 = _648;
                                _490 = _638;
                                if (!_660)
                                {
                                    float _662 = _634 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _664 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float _666 = _638 + _664;
                                    float2 _6500 = float2(_662, _666);
                                    float2 _668 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6500, float2(0.0), isnan(_6500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6500, float2(0.0), isnan(_6500)), level(0.0)).xy;
                                    float _670 = _668.x;
                                    float _672 = _668.y;
                                    float _674 = _672 + _670;
                                    float _676 = _674 * 0.5;
                                    bool _678 = _676 >= 0.89999997615814208984375;
                                    bool _680 = isnan(_676);
                                    bool _682 = _678 || _680;
                                    bool _684 = isnan(0.89999997615814208984375);
                                    bool _686 = _682 || _684;
                                    _488 = _676;
                                    _490 = _672;
                                    if (!_686)
                                    {
                                        _486 = 7.0;
                                        _688 = true;
                                    }
                                    else
                                    {
                                        _486 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _688 = false;
        float _690 = _486;
        float _692 = _488;
        float _694 = _490;
        float _696 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 0.25, _126);
        float _698 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _700 = _696 + _698;
        float2 _6556 = float2(_700, _462);
        float2 _702 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6556, float2(0.0), isnan(_6556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6556, float2(0.0), isnan(_6556)), level(0.0)).xy;
        float _704 = _702.x;
        float _706 = _702.y;
        float _708 = _454 + _690;
        bool _710 = _708 > 2.0;
        float _712 = _708;
        float _714 = _694;
        float _716 = _700;
        int _718 = 1084227584;
        int _720 = 1084227584;
        if (!_710)
        {
            _712 = 0.0;
            _714 = 0.0;
        }
        float _722 = _712;
        float _724 = _714;
        bool _726 = !_710;
        float _728 = _722;
        float _730 = _724;
        if (!_726)
        {
            float _732 = -_690;
            float _734 = _732 + (-0.25);
            float _736 = -_454;
            float _738 = _736 + 0.25;
            float _740 = fma(_690, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _742 = fma(_734, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _744 = fma(_454, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _746 = fma(_738, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float2 _6618 = float2(_746, _744);
            float2 _748 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6618, float2(0.0), isnan(_6618)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6618, float2(0.0), isnan(_6618)), level(0.0), int2(-1, 0)).xy;
            float _750 = _748.x;
            float _752 = _748.y;
            float2 _6632 = float2(_740, _742);
            float2 _754 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6632, float2(0.0), isnan(_6632)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6632, float2(0.0), isnan(_6632)), level(0.0), int2(1, 0)).xy;
            float _756 = _754.x;
            float _758 = _754.y;
            float _760 = fma(_756, 5.0, -3.75);
            float _762 = rint(_752);
            float _764 = abs(_760);
            float _766 = _756 * _764;
            float _768 = fma(_750, 5.0, -3.75);
            float _770 = abs(_768);
            float _772 = _750 * _770;
            float _774 = rint(_758);
            bool _776 = _692 <= 0.89999997615814208984375;
            bool _778 = isnan(_692);
            bool _780 = _776 || _778;
            bool _782 = isnan(0.89999997615814208984375);
            bool _784 = _780 || _782;
            float _786 = float(_784);
            bool _788 = _456 <= 0.89999997615814208984375;
            bool _790 = isnan(_456);
            bool _792 = _788 || _790;
            bool _794 = isnan(0.89999997615814208984375);
            bool _796 = _792 || _794;
            float _798 = float(_796);
            float _800 = rint(_766);
            float _802 = rint(_772);
            float _804 = fma(_774, 2.0, _800);
            float _806 = _804 * _786;
            float _808 = fma(_762, 2.0, _802);
            float _810 = fma(_806, 20.0, _690);
            float _812 = _808 * _798;
            float _814 = fma(_810, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _816 = fma(_812, 20.0, _454);
            float _818 = fma((*spvDescriptorSet0.cp_c3)._m0[3].z, 0.14285714924335479736328125, _814);
            float _820 = fma(_816, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _822 = _820 + 0.5;
            float2 _6728 = float2(_822, _818);
            float2 _824 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_6728, float2(0.0), isnan(_6728)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_6728, float2(0.0), isnan(_6728)), level(0.0)).xy;
            float _826 = _824.x;
            float _828 = _824.y;
            _492 = 0.0062500000931322574615478515625;
            _728 = _826;
            _730 = _828;
        }
        float _830 = _492;
        float _832 = _728;
        float _834 = _730;
        float _836 = fma(_704, 5.0, -3.75);
        float _838 = rint(_706);
        float _840 = abs(_836);
        float _842 = _704 * _840;
        float _844 = rint(_842);
        float _846 = _844 + _838;
        float _848 = _846 * 0.5;
        bool _850 = _848 >= 0.89999997615814208984375;
        bool _852 = isnan(_848);
        bool _854 = _850 || _852;
        bool _856 = isnan(0.89999997615814208984375);
        bool _858 = _854 || _856;
        bool _860 = !_858;
        float _862 = _830;
        float _864 = _844;
        float _866 = 0.0;
        float _868 = _848;
        float _870 = _834;
        float _872 = _832;
        if (!_860)
        {
            float _874 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _876 = _700 + _874;
            float _878 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _880 = _462 + _878;
            float2 _6795 = float2(_876, _880);
            float2 _882 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6795, float2(0.0), isnan(_6795)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6795, float2(0.0), isnan(_6795)), level(0.0)).xy;
            float _884 = _882.x;
            float _886 = _882.y;
            float _888 = fma(_884, 5.0, -3.75);
            float _890 = rint(_886);
            float _892 = abs(_888);
            float _894 = _884 * _892;
            float _896 = rint(_894);
            float _898 = _896 + _890;
            float _900 = _898 * 0.5;
            bool _902 = _900 >= 0.89999997615814208984375;
            bool _904 = isnan(_900);
            bool _906 = _902 || _904;
            bool _908 = isnan(0.89999997615814208984375);
            bool _910 = _906 || _908;
            bool _912 = !_910;
            _862 = _896;
            _864 = _890;
            _866 = 1.0;
            _716 = _876;
            _868 = _900;
            if (!_912)
            {
                float _914 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _916 = _876 + _914;
                float _918 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _920 = _880 + _918;
                float2 _6855 = float2(_916, _920);
                float2 _922 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6855, float2(0.0), isnan(_6855)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6855, float2(0.0), isnan(_6855)), level(0.0)).xy;
                float _924 = _922.x;
                float _926 = _922.y;
                float _928 = fma(_924, 5.0, -3.75);
                float _930 = rint(_926);
                float _932 = abs(_928);
                float _934 = _924 * _932;
                float _936 = rint(_934);
                float _938 = _936 + _930;
                float _940 = _938 * 0.5;
                bool _942 = _940 >= 0.89999997615814208984375;
                bool _944 = isnan(_940);
                bool _946 = _942 || _944;
                bool _948 = isnan(0.89999997615814208984375);
                bool _950 = _946 || _948;
                bool _952 = !_950;
                _862 = _936;
                _864 = _930;
                _866 = 2.0;
                _716 = _916;
                _868 = _940;
                if (!_952)
                {
                    float _954 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _956 = _916 + _954;
                    float _958 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _960 = _920 + _958;
                    float2 _6915 = float2(_956, _960);
                    float2 _962 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6915, float2(0.0), isnan(_6915)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6915, float2(0.0), isnan(_6915)), level(0.0)).xy;
                    float _964 = _962.x;
                    float _966 = _962.y;
                    float _968 = fma(_964, 5.0, -3.75);
                    float _970 = rint(_966);
                    float _972 = abs(_968);
                    float _974 = _964 * _972;
                    float _976 = rint(_974);
                    float _978 = _976 + _970;
                    float _980 = _978 * 0.5;
                    bool _982 = _980 >= 0.89999997615814208984375;
                    bool _984 = isnan(_980);
                    bool _986 = _982 || _984;
                    bool _988 = isnan(0.89999997615814208984375);
                    bool _990 = _986 || _988;
                    bool _992 = !_990;
                    _862 = _976;
                    _864 = _970;
                    _866 = 3.0;
                    _716 = _956;
                    _868 = _980;
                    if (!_992)
                    {
                        float _994 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _996 = _956 + _994;
                        float _998 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float _1000 = _960 + _998;
                        float2 _6975 = float2(_996, _1000);
                        float2 _1002 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6975, float2(0.0), isnan(_6975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6975, float2(0.0), isnan(_6975)), level(0.0)).xy;
                        float _1004 = _1002.x;
                        float _1006 = _1002.y;
                        float _1008 = fma(_1004, 5.0, -3.75);
                        float _1010 = rint(_1006);
                        float _1012 = abs(_1008);
                        float _1014 = _1004 * _1012;
                        float _1016 = rint(_1014);
                        float _1018 = _1016 + _1010;
                        float _1020 = _1018 * 0.5;
                        bool _1022 = _1020 >= 0.89999997615814208984375;
                        bool _1024 = isnan(_1020);
                        bool _1026 = _1022 || _1024;
                        bool _1028 = isnan(0.89999997615814208984375);
                        bool _1030 = _1026 || _1028;
                        bool _1032 = !_1030;
                        _862 = _1016;
                        _864 = _1010;
                        _866 = 4.0;
                        _716 = _996;
                        _868 = _1020;
                        if (!_1032)
                        {
                            float _1034 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _1036 = _996 + _1034;
                            float _1038 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float _1040 = _1000 + _1038;
                            float2 _7035 = float2(_1036, _1040);
                            float2 _1042 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7035, float2(0.0), isnan(_7035)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7035, float2(0.0), isnan(_7035)), level(0.0)).xy;
                            float _1044 = _1042.x;
                            float _1046 = _1042.y;
                            float _1048 = fma(_1044, 5.0, -3.75);
                            float _1050 = rint(_1046);
                            float _1052 = abs(_1048);
                            float _1054 = _1044 * _1052;
                            float _1056 = rint(_1054);
                            float _1058 = _1056 + _1050;
                            float _1060 = _1058 * 0.5;
                            bool _1062 = _1060 >= 0.89999997615814208984375;
                            bool _1064 = isnan(_1060);
                            bool _1066 = _1062 || _1064;
                            bool _1068 = isnan(0.89999997615814208984375);
                            bool _1070 = _1066 || _1068;
                            bool _1072 = !_1070;
                            _862 = _1056;
                            _864 = _1050;
                            _866 = 5.0;
                            _716 = _1036;
                            _868 = _1060;
                            if (!_1072)
                            {
                                float _1074 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _1076 = _1036 + _1074;
                                float _1078 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float _1080 = _1040 + _1078;
                                float2 _7095 = float2(_1076, _1080);
                                float2 _1082 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7095, float2(0.0), isnan(_7095)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7095, float2(0.0), isnan(_7095)), level(0.0)).xy;
                                float _1084 = _1082.x;
                                float _1086 = _1082.y;
                                float _1088 = fma(_1084, 5.0, -3.75);
                                float _1090 = rint(_1086);
                                float _1092 = abs(_1088);
                                float _1094 = _1084 * _1092;
                                float _1096 = rint(_1094);
                                float _1098 = _1096 + _1090;
                                float _1100 = _1098 * 0.5;
                                bool _1102 = _1100 >= 0.89999997615814208984375;
                                bool _1104 = isnan(_1100);
                                bool _1106 = _1102 || _1104;
                                bool _1108 = isnan(0.89999997615814208984375);
                                bool _1110 = _1106 || _1108;
                                bool _1112 = !_1110;
                                _862 = _1096;
                                _864 = _1090;
                                _866 = 6.0;
                                _716 = _1076;
                                _868 = _1100;
                                if (!_1112)
                                {
                                    float _1114 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _1116 = _1076 + _1114;
                                    float _1118 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float _1120 = _1080 + _1118;
                                    float2 _7155 = float2(_1116, _1120);
                                    float2 _1122 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7155, float2(0.0), isnan(_7155)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7155, float2(0.0), isnan(_7155)), level(0.0)).xy;
                                    float _1124 = _1122.x;
                                    float _1126 = _1122.y;
                                    float _1128 = fma(_1124, 5.0, -3.75);
                                    float _1130 = rint(_1126);
                                    float _1132 = abs(_1128);
                                    float _1134 = _1124 * _1132;
                                    float _1136 = rint(_1134);
                                    float _1138 = _1136 + _1130;
                                    float _1140 = _1138 * 0.5;
                                    bool _1142 = _1140 >= 0.89999997615814208984375;
                                    bool _1144 = isnan(_1140);
                                    bool _1146 = _1142 || _1144;
                                    bool _1148 = isnan(0.89999997615814208984375);
                                    bool _1150 = _1146 || _1148;
                                    _716 = _1126;
                                    _868 = _1140;
                                    if (!_1150)
                                    {
                                        _866 = 7.0;
                                        _1152 = true;
                                    }
                                    else
                                    {
                                        _866 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _1152 = false;
        float _1154 = _862;
        float _1156 = _864;
        float _1158 = _866;
        float _1160 = _716;
        float _1162 = _868;
        float2 _7213 = float2(_126, _130);
        float _1164 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7213, float2(0.0), isnan(_7213)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7213, float2(0.0), isnan(_7213)), level(0.0), int2(1, 0)).x;
        bool _1166 = _1164 > 0.0;
        float _1168 = _1160;
        float _1170 = _1164;
        float _1172 = _1154;
        float _1174 = _1156;
        int _1176 = as_type<int>(_1158);
        int _1178 = as_type<int>(_1162);
        if (!_1166)
        {
            _1168 = 0.0;
            _1170 = 0.0;
        }
        float _1180 = _1168;
        float _1182 = _1170;
        bool _1184 = !_1166;
        float _1186 = _1180;
        float _1188 = _1182;
        if (!_1184)
        {
            float _1190 = _696 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _1192 = _130 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _7252 = float2(_1190, _1192);
            float2 _1194 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7252, float2(0.0), isnan(_7252)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7252, float2(0.0), isnan(_7252)), level(0.0)).xy;
            float _1196 = _1194.x;
            float _1198 = _1194.y;
            float _1200 = fma(_1196, 5.0, -3.75);
            float _1202 = rint(_1198);
            float _1204 = abs(_1200);
            float _1206 = _1196 * _1204;
            float _1208 = rint(_1206);
            float _1210 = _1208 + _1202;
            float _1212 = _1210 * 0.5;
            bool _1214 = _1212 >= 0.89999997615814208984375;
            bool _1216 = isnan(_1212);
            bool _1218 = _1214 || _1216;
            bool _1220 = isnan(0.89999997615814208984375);
            bool _1222 = _1218 || _1220;
            bool _1224 = !_1222;
            float _1226 = _1202;
            float _1228 = 0.0;
            float _1230 = _1212;
            float _1232 = _1206;
            float _1234 = _1198;
            if (!_1224)
            {
                float _1236 = _1190 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _1238 = _1192 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _7308 = float2(_1236, _1238);
                float2 _1240 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7308, float2(0.0), isnan(_7308)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7308, float2(0.0), isnan(_7308)), level(0.0)).xy;
                float _1242 = _1240.x;
                float _1244 = _1240.y;
                float _1246 = fma(_1242, 5.0, -3.75);
                float _1248 = rint(_1244);
                float _1250 = abs(_1246);
                float _1252 = _1242 * _1250;
                float _1254 = rint(_1252);
                float _1256 = _1254 + _1248;
                float _1258 = _1256 * 0.5;
                bool _1260 = _1258 >= 0.89999997615814208984375;
                bool _1262 = isnan(_1258);
                bool _1264 = _1260 || _1262;
                bool _1266 = isnan(0.89999997615814208984375);
                bool _1268 = _1264 || _1266;
                bool _1270 = !_1268;
                _1226 = _1248;
                _1228 = 1.0;
                _1230 = _1258;
                _1232 = _1236;
                _1234 = _1238;
                if (!_1270)
                {
                    float _1272 = _1236 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _1274 = _1238 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _7364 = float2(_1272, _1274);
                    float2 _1276 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7364, float2(0.0), isnan(_7364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7364, float2(0.0), isnan(_7364)), level(0.0)).xy;
                    float _1278 = _1276.x;
                    float _1280 = _1276.y;
                    float _1282 = fma(_1278, 5.0, -3.75);
                    float _1284 = rint(_1280);
                    float _1286 = abs(_1282);
                    float _1288 = _1278 * _1286;
                    float _1290 = rint(_1288);
                    float _1292 = _1290 + _1284;
                    float _1294 = _1292 * 0.5;
                    bool _1296 = _1294 >= 0.89999997615814208984375;
                    bool _1298 = isnan(_1294);
                    bool _1300 = _1296 || _1298;
                    bool _1302 = isnan(0.89999997615814208984375);
                    bool _1304 = _1300 || _1302;
                    bool _1306 = !_1304;
                    _1226 = _1284;
                    _1228 = 2.0;
                    _1230 = _1294;
                    _1232 = _1272;
                    _1234 = _1274;
                    if (!_1306)
                    {
                        float _1308 = _1272 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _1310 = _1274 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _7420 = float2(_1308, _1310);
                        float2 _1312 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7420, float2(0.0), isnan(_7420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7420, float2(0.0), isnan(_7420)), level(0.0)).xy;
                        float _1314 = _1312.x;
                        float _1316 = _1312.y;
                        float _1318 = fma(_1314, 5.0, -3.75);
                        float _1320 = rint(_1316);
                        float _1322 = abs(_1318);
                        float _1324 = _1314 * _1322;
                        float _1326 = rint(_1324);
                        float _1328 = _1326 + _1320;
                        float _1330 = _1328 * 0.5;
                        bool _1332 = _1330 >= 0.89999997615814208984375;
                        bool _1334 = isnan(_1330);
                        bool _1336 = _1332 || _1334;
                        bool _1338 = isnan(0.89999997615814208984375);
                        bool _1340 = _1336 || _1338;
                        bool _1342 = !_1340;
                        _1226 = _1320;
                        _1228 = 3.0;
                        _1230 = _1330;
                        _1232 = _1308;
                        _1234 = _1310;
                        if (!_1342)
                        {
                            float _1344 = _1308 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _1346 = _1310 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float2 _7476 = float2(_1344, _1346);
                            float2 _1348 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7476, float2(0.0), isnan(_7476)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7476, float2(0.0), isnan(_7476)), level(0.0)).xy;
                            float _1350 = _1348.x;
                            float _1352 = _1348.y;
                            float _1354 = fma(_1350, 5.0, -3.75);
                            float _1356 = rint(_1352);
                            float _1358 = abs(_1354);
                            float _1360 = _1350 * _1358;
                            float _1362 = rint(_1360);
                            float _1364 = _1362 + _1356;
                            float _1366 = _1364 * 0.5;
                            bool _1368 = _1366 >= 0.89999997615814208984375;
                            bool _1370 = isnan(_1366);
                            bool _1372 = _1368 || _1370;
                            bool _1374 = isnan(0.89999997615814208984375);
                            bool _1376 = _1372 || _1374;
                            bool _1378 = !_1376;
                            _1226 = _1356;
                            _1228 = 4.0;
                            _1230 = _1366;
                            _1232 = _1344;
                            _1234 = _1346;
                            if (!_1378)
                            {
                                float _1380 = _1344 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _1382 = _1346 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float2 _7532 = float2(_1380, _1382);
                                float2 _1384 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7532, float2(0.0), isnan(_7532)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7532, float2(0.0), isnan(_7532)), level(0.0)).xy;
                                float _1386 = _1384.x;
                                float _1388 = _1384.y;
                                float _1390 = fma(_1386, 5.0, -3.75);
                                float _1392 = rint(_1388);
                                float _1394 = abs(_1390);
                                float _1396 = _1386 * _1394;
                                float _1398 = rint(_1396);
                                float _1400 = _1398 + _1392;
                                float _1402 = _1400 * 0.5;
                                bool _1404 = _1402 >= 0.89999997615814208984375;
                                bool _1406 = isnan(_1402);
                                bool _1408 = _1404 || _1406;
                                bool _1410 = isnan(0.89999997615814208984375);
                                bool _1412 = _1408 || _1410;
                                bool _1414 = !_1412;
                                _1226 = _1392;
                                _1228 = 5.0;
                                _1230 = _1402;
                                _1232 = _1380;
                                _1234 = _1382;
                                if (!_1414)
                                {
                                    float _1416 = _1380 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _1418 = _1382 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float2 _7588 = float2(_1416, _1418);
                                    float2 _1420 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7588, float2(0.0), isnan(_7588)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7588, float2(0.0), isnan(_7588)), level(0.0)).xy;
                                    float _1422 = _1420.x;
                                    float _1424 = _1420.y;
                                    float _1426 = fma(_1422, 5.0, -3.75);
                                    float _1428 = rint(_1424);
                                    float _1430 = abs(_1426);
                                    float _1432 = _1422 * _1430;
                                    float _1434 = rint(_1432);
                                    float _1436 = _1434 + _1428;
                                    float _1438 = _1436 * 0.5;
                                    bool _1440 = _1438 >= 0.89999997615814208984375;
                                    bool _1442 = isnan(_1438);
                                    bool _1444 = _1440 || _1442;
                                    bool _1446 = isnan(0.89999997615814208984375);
                                    bool _1448 = _1444 || _1446;
                                    bool _1450 = !_1448;
                                    _1226 = _1428;
                                    _1228 = 6.0;
                                    _1230 = _1438;
                                    _1232 = _1416;
                                    _1234 = _1418;
                                    if (!_1450)
                                    {
                                        float _1452 = _1416 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                        float _1454 = _1418 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                        float2 _7644 = float2(_1452, _1454);
                                        float2 _1456 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7644, float2(0.0), isnan(_7644)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7644, float2(0.0), isnan(_7644)), level(0.0)).xy;
                                        float _1458 = _1456.x;
                                        float _1460 = _1456.y;
                                        float _1462 = fma(_1458, 5.0, -3.75);
                                        float _1464 = rint(_1460);
                                        float _1466 = abs(_1462);
                                        float _1468 = _1458 * _1466;
                                        float _1470 = rint(_1468);
                                        float _1472 = _1470 + _1464;
                                        float _1474 = _1472 * 0.5;
                                        bool _1476 = _1474 >= 0.89999997615814208984375;
                                        bool _1478 = isnan(_1474);
                                        bool _1480 = _1476 || _1478;
                                        bool _1482 = isnan(0.89999997615814208984375);
                                        bool _1484 = _1480 || _1482;
                                        _1226 = _1464;
                                        _1230 = _1474;
                                        _1232 = _1458;
                                        _1234 = _1460;
                                        _718 = as_type<int>(_1470);
                                        if (!_1484)
                                        {
                                            _1228 = 7.0;
                                            _1486 = true;
                                        }
                                        else
                                        {
                                            _1228 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1486 = false;
            float _1488 = _1226;
            float _1490 = _1228;
            float _1492 = _1230;
            float _1494 = _1232;
            float _1496 = _1234;
            int _1498 = _718;
            bool _1500 = _1488 >= 0.89999997615814208984375;
            bool _1502 = isnan(_1488);
            bool _1504 = _1500 || _1502;
            bool _1506 = isnan(0.89999997615814208984375);
            bool _1508 = _1504 || _1506;
            float _1510 = float(_1508);
            float _1512 = _1510 + _1490;
            _1186 = _1512;
            _1188 = _1492;
            _1172 = _1494;
            _1174 = _1496;
            _720 = _1498;
        }
        float _1514 = _1186;
        float _1516 = _1188;
        float _1518 = _1172;
        float _1520 = _1174;
        int _1522 = _720;
        float _1524 = _1158 + _1514;
        bool _1526 = _1524 > 2.0;
        bool _1528 = !_1526;
        float _1530 = _1518;
        float _1532 = _1520;
        int _1534 = _1522;
        if (!_1528)
        {
            float _1536 = fma(_1514, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _1538 = fma(_1514, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _1540 = -_1158;
            float _1542 = fma(_1540, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _1544 = -_1158;
            float _1546 = fma(_1544, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float2 _7771 = float2(_1536, _1538);
            float2 _1548 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7771, float2(0.0), isnan(_7771)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7771, float2(0.0), isnan(_7771)), level(0.0), int2(1, 0)).xy;
            float _1550 = _1548.x;
            float _1552 = _1548.y;
            float2 _7783 = float2(_1542, _1546);
            float _1554 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7783, float2(0.0), isnan(_7783)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7783, float2(0.0), isnan(_7783)), level(0.0), int2(-1, 0)).y;
            float2 _7791 = float2(_1542, _1546);
            float _1556 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7791, float2(0.0), isnan(_7791)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7791, float2(0.0), isnan(_7791)), level(0.0), int2(0, -1)).x;
            bool _1558 = _1516 >= 0.89999997615814208984375;
            bool _1560 = isnan(_1516);
            bool _1562 = _1558 || _1560;
            bool _1564 = isnan(0.89999997615814208984375);
            bool _1566 = _1562 || _1564;
            float _1568 = float(_1566);
            bool _1570 = _1162 >= 0.89999997615814208984375;
            bool _1572 = isnan(_1162);
            bool _1574 = _1570 || _1572;
            bool _1576 = isnan(0.89999997615814208984375);
            bool _1578 = _1574 || _1576;
            float _1580 = float(_1578);
            float _1582 = fma(_1552, 2.0, _1550);
            float _1584 = fma(_1554, 2.0, _1556);
            float _1586 = _1582 * _1568;
            float _1588 = _1584 * _1580;
            float _1590 = fma(_1586, 20.0, _1514);
            float _1592 = fma(_1588, 20.0, _1158);
            float _1594 = fma(_1590, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _1596 = fma(_1592, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _1598 = fma((*spvDescriptorSet0.cp_c3)._m0[3].w, 0.14285714924335479736328125, _1594);
            float _1600 = _1596 + 0.5;
            float2 _7854 = float2(_1600, _1598);
            float2 _1602 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_7854, float2(0.0), isnan(_7854)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_7854, float2(0.0), isnan(_7854)), level(0.0)).xy;
            float _1604 = _1602.x;
            float _1606 = _1602.y;
            float _1608 = _1606 + _832;
            float _1610 = _1604 + _834;
            _870 = _1610;
            _872 = _1608;
            _1530 = _1550;
            _1532 = _1552;
            _1176 = as_type<int>(_1606);
            _1534 = as_type<int>(_1546);
            _1178 = as_type<int>(_1604);
        }
        float _1612 = _870;
        float _1614 = _872;
        float _1616 = _1530;
        float _1618 = _1532;
        int _1620 = _1176;
        int _1622 = _1534;
        int _1624 = _1178;
        float _1626 = -_1612;
        bool _1628 = _1614 != _1626;
        bool _1630 = isnan(_1614);
        bool _1632 = _1628 || _1630;
        bool _1634 = isnan(_1626);
        bool _1636 = _1632 || _1634;
        int _1638 = _1624;
        float _1640 = _1616;
        float _1642 = _1618;
        int _1644 = _1620;
        int _1646 = _1622;
        _172 = _1614;
        _174 = _1612;
        if (_1636)
        {
            _1638 = 0;
        }
        int _1648 = _1638;
        _180 = _1648;
        if (!_1636)
        {
            float2 _7920 = float2(_140, _198);
            float2 _1650 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7920, float2(0.0), isnan(_7920)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7920, float2(0.0), isnan(_7920)), level(0.0)).xy;
            float _1652 = _1650.x;
            float _1654 = _1650.y;
            float2 _7932 = float2(_184, _198);
            float2 _1656 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7932, float2(0.0), isnan(_7932)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7932, float2(0.0), isnan(_7932)), level(0.0)).xy;
            float _1658 = _1656.x;
            float _1660 = _1656.y;
            float _1662 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _140);
            float _1664 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _184);
            bool _1666 = _1654 >= 0.800000011920928955078125;
            bool _1668 = isnan(_1654);
            bool _1670 = _1666 || _1668;
            bool _1672 = isnan(0.800000011920928955078125);
            bool _1674 = _1670 || _1672;
            bool _1676 = _1660 > 0.800000011920928955078125;
            bool _1678 = isnan(_1660);
            bool _1680 = _1676 || _1678;
            bool _1682 = isnan(0.800000011920928955078125);
            bool _1684 = _1680 || _1682;
            bool _1686 = _1652 != 0.0;
            bool _1688 = isnan(_1652);
            bool _1690 = _1686 || _1688;
            bool _1692 = isnan(0.0);
            bool _1694 = _1690 || _1692;
            bool _1696 = !_1674;
            bool _1698 = _1694 || _1696;
            bool _1700 = _1658 != 0.0;
            bool _1702 = isnan(_1658);
            bool _1704 = _1700 || _1702;
            bool _1706 = isnan(0.0);
            bool _1708 = _1704 || _1706;
            bool _1710 = !_1684;
            bool _1712 = _1708 || _1710;
            float _1714 = _1654;
            float _1716 = _1652;
            int _1718 = as_type<int>(_1662);
            float _1720 = _1658;
            float _1722 = _1664;
            if (_1698)
            {
                _1640 = _1652;
            }
            float _1724 = _1640;
            if (_1698)
            {
                _1642 = _1654;
            }
            float _1726 = _1642;
            if (_1712)
            {
                _1714 = _1660;
            }
            float _1728 = _1714;
            if (_1712)
            {
                _1716 = _1658;
            }
            float _1730 = _1716;
            float _1732 = _1724;
            float _1734 = _1726;
            if (!_1698)
            {
                float2 _8039 = float2(_1662, _198);
                float2 _1736 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8039, float2(0.0), isnan(_8039)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8039, float2(0.0), isnan(_8039)), level(0.0)).xy;
                float _1738 = _1736.x;
                float _1740 = _1736.y;
                _1732 = _1738;
                _1734 = _1740;
            }
            float _1742 = _1732;
            float _1744 = _1734;
            float _1746 = _1730;
            float _1748 = _1728;
            if (!_1712)
            {
                float2 _8061 = float2(_1664, _198);
                float2 _1750 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8061, float2(0.0), isnan(_8061)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8061, float2(0.0), isnan(_8061)), level(0.0)).xy;
                float _1752 = _1750.x;
                float _1754 = _1750.y;
                _1746 = _1752;
                _1748 = _1754;
            }
            float _1756 = _1746;
            float _1758 = _1748;
            if (_1698)
            {
                _1644 = 1;
            }
            int _1760 = _1644;
            int _1762 = _1760;
            if (!_1698)
            {
                _1762 = 0;
            }
            int _1764 = _1762;
            int _1766 = _1764;
            if (_1698)
            {
                _188 = _1662;
            }
            float _1768 = _188;
            float _1770 = _1768;
            if (!_1698)
            {
                float _1772 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1662);
                _1770 = _1772;
            }
            float _1774 = _1770;
            int _1776 = _1764 & 1;
            bool _1778 = _1776 != 0;
            float _1780 = _1774;
            if (_1778)
            {
                _1646 = _1764;
            }
            int _1782 = _1646;
            int _1784 = _1782;
            int _1786 = _1782;
            float _1788 = _1744;
            float _1790 = _1742;
            float _1792 = _1758;
            float _1794 = _1756;
            if (!_1778)
            {
                bool _1796 = _1744 >= 0.800000011920928955078125;
                bool _1798 = isnan(_1744);
                bool _1800 = _1796 || _1798;
                bool _1802 = isnan(0.800000011920928955078125);
                bool _1804 = _1800 || _1802;
                bool _1806 = _1742 != 0.0;
                bool _1808 = isnan(_1742);
                bool _1810 = _1806 || _1808;
                bool _1812 = isnan(0.0);
                bool _1814 = _1810 || _1812;
                bool _1816 = !_1804;
                bool _1818 = _1814 || _1816;
                if (_1818)
                {
                    _1784 = 1;
                }
                int _1820 = _1784;
                _1786 = _1820;
                if (!_1818)
                {
                    float2 _8159 = float2(_1774, _198);
                    float2 _1822 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8159, float2(0.0), isnan(_8159)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8159, float2(0.0), isnan(_8159)), level(0.0)).xy;
                    float _1824 = _1822.x;
                    float _1826 = _1822.y;
                    float _1828 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1774);
                    _1786 = _1764;
                    _1788 = _1826;
                    _1790 = _1824;
                    _1780 = _1828;
                }
            }
            int _1830 = _1786;
            float _1832 = _1788;
            float _1834 = _1790;
            float _1836 = _1780;
            int _1838 = _1830 & 1;
            bool _1840 = _1838 != 0;
            float _1842 = _1832;
            float _1844 = _1834;
            float _1846 = _1836;
            int _1848 = _1830;
            if (_1840)
            {
                _1766 = _1830;
            }
            int _1850 = _1766;
            int _1852 = _1850;
            int _1854 = _1850;
            if (!_1840)
            {
                bool _1856 = _1832 >= 0.800000011920928955078125;
                bool _1858 = isnan(_1832);
                bool _1860 = _1856 || _1858;
                bool _1862 = isnan(0.800000011920928955078125);
                bool _1864 = _1860 || _1862;
                bool _1866 = _1834 != 0.0;
                bool _1868 = isnan(_1834);
                bool _1870 = _1866 || _1868;
                bool _1872 = isnan(0.0);
                bool _1874 = _1870 || _1872;
                bool _1876 = !_1864;
                bool _1878 = _1874 || _1876;
                if (_1878)
                {
                    _1852 = 1;
                }
                int _1880 = _1852;
                _1854 = _1880;
                if (!_1878)
                {
                    float2 _8238 = float2(_1836, _198);
                    float2 _1882 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8238, float2(0.0), isnan(_8238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8238, float2(0.0), isnan(_8238)), level(0.0)).xy;
                    float _1884 = _1882.x;
                    float _1886 = _1882.y;
                    float _1888 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1836);
                    _1854 = _1830;
                    _1842 = _1886;
                    _1844 = _1884;
                    _1846 = _1888;
                }
            }
            int _1890 = _1854;
            float _1892 = _1842;
            float _1894 = _1844;
            float _1896 = _1846;
            int _1898 = _1890 & 1;
            bool _1900 = _1898 != 0;
            float _1902 = _1892;
            float _1904 = _1894;
            float _1906 = _1896;
            int _1908 = _1890;
            if (_1900)
            {
                _1718 = _1890;
            }
            int _1910 = _1718;
            int _1912 = _1910;
            int _1914 = _1910;
            if (!_1900)
            {
                bool _1916 = _1892 >= 0.800000011920928955078125;
                bool _1918 = isnan(_1892);
                bool _1920 = _1916 || _1918;
                bool _1922 = isnan(0.800000011920928955078125);
                bool _1924 = _1920 || _1922;
                bool _1926 = _1894 != 0.0;
                bool _1928 = isnan(_1894);
                bool _1930 = _1926 || _1928;
                bool _1932 = isnan(0.0);
                bool _1934 = _1930 || _1932;
                bool _1936 = !_1924;
                bool _1938 = _1934 || _1936;
                if (_1938)
                {
                    _1912 = 1;
                }
                int _1940 = _1912;
                _1914 = _1940;
                if (!_1938)
                {
                    float2 _8317 = float2(_1896, _198);
                    float2 _1942 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8317, float2(0.0), isnan(_8317)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8317, float2(0.0), isnan(_8317)), level(0.0)).xy;
                    float _1944 = _1942.x;
                    float _1946 = _1942.y;
                    float _1948 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1896);
                    _1914 = _1890;
                    _1902 = _1946;
                    _1904 = _1944;
                    _1906 = _1948;
                }
            }
            int _1950 = _1914;
            float _1952 = _1902;
            float _1954 = _1904;
            float _1956 = _1906;
            int _1958 = _1950 & 1;
            bool _1960 = _1958 != 0;
            float _1962 = _1952;
            float _1964 = _1954;
            float _1966 = _1956;
            int _1968 = _1950;
            if (_1960)
            {
                _1908 = _1950;
            }
            int _1970 = _1908;
            int _1972 = _1970;
            int _1974 = _1970;
            if (!_1960)
            {
                bool _1976 = _1952 >= 0.800000011920928955078125;
                bool _1978 = isnan(_1952);
                bool _1980 = _1976 || _1978;
                bool _1982 = isnan(0.800000011920928955078125);
                bool _1984 = _1980 || _1982;
                bool _1986 = _1954 != 0.0;
                bool _1988 = isnan(_1954);
                bool _1990 = _1986 || _1988;
                bool _1992 = isnan(0.0);
                bool _1994 = _1990 || _1992;
                bool _1996 = !_1984;
                bool _1998 = _1994 || _1996;
                if (_1998)
                {
                    _1972 = 1;
                }
                int _2000 = _1972;
                _1974 = _2000;
                if (!_1998)
                {
                    float2 _8396 = float2(_1956, _198);
                    float2 _2002 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8396, float2(0.0), isnan(_8396)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8396, float2(0.0), isnan(_8396)), level(0.0)).xy;
                    float _2004 = _2002.x;
                    float _2006 = _2002.y;
                    float _2008 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1956);
                    _1974 = _1950;
                    _1962 = _2006;
                    _1964 = _2004;
                    _1966 = _2008;
                }
            }
            int _2010 = _1974;
            float _2012 = _1962;
            float _2014 = _1964;
            float _2016 = _1966;
            int _2018 = _2010 & 1;
            bool _2020 = _2018 != 0;
            float _2022 = _2012;
            float _2024 = _2014;
            float _2026 = _2016;
            int _2028 = _2010;
            if (_2020)
            {
                _1968 = _2010;
            }
            int _2030 = _1968;
            int _2032 = _2030;
            int _2034 = _2030;
            if (!_2020)
            {
                bool _2036 = _2012 >= 0.800000011920928955078125;
                bool _2038 = isnan(_2012);
                bool _2040 = _2036 || _2038;
                bool _2042 = isnan(0.800000011920928955078125);
                bool _2044 = _2040 || _2042;
                bool _2046 = _2014 != 0.0;
                bool _2048 = isnan(_2014);
                bool _2050 = _2046 || _2048;
                bool _2052 = isnan(0.0);
                bool _2054 = _2050 || _2052;
                bool _2056 = !_2044;
                bool _2058 = _2054 || _2056;
                if (_2058)
                {
                    _2032 = 1;
                }
                int _2060 = _2032;
                _2034 = _2060;
                if (!_2058)
                {
                    float2 _8475 = float2(_2016, _198);
                    float2 _2062 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8475, float2(0.0), isnan(_8475)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8475, float2(0.0), isnan(_8475)), level(0.0)).xy;
                    float _2064 = _2062.x;
                    float _2066 = _2062.y;
                    float _2068 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2016);
                    _2034 = _2010;
                    _2022 = _2066;
                    _2024 = _2064;
                    _2026 = _2068;
                }
            }
            int _2070 = _2034;
            float _2072 = _2022;
            float _2074 = _2024;
            float _2076 = _2026;
            int _2078 = _2070 & 1;
            bool _2080 = _2078 != 0;
            float _2082 = _2072;
            float _2084 = _2074;
            float _2086 = _2076;
            int _2088 = _2070;
            if (_2080)
            {
                _2028 = _2070;
            }
            int _2090 = _2028;
            int _2092 = _2090;
            int _2094 = _2090;
            if (!_2080)
            {
                bool _2096 = _2072 >= 0.800000011920928955078125;
                bool _2098 = isnan(_2072);
                bool _2100 = _2096 || _2098;
                bool _2102 = isnan(0.800000011920928955078125);
                bool _2104 = _2100 || _2102;
                bool _2106 = _2074 != 0.0;
                bool _2108 = isnan(_2074);
                bool _2110 = _2106 || _2108;
                bool _2112 = isnan(0.0);
                bool _2114 = _2110 || _2112;
                bool _2116 = !_2104;
                bool _2118 = _2114 || _2116;
                if (_2118)
                {
                    _2092 = 1;
                }
                int _2120 = _2092;
                _2094 = _2120;
                if (!_2118)
                {
                    float2 _8554 = float2(_2076, _198);
                    float2 _2122 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8554, float2(0.0), isnan(_8554)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8554, float2(0.0), isnan(_8554)), level(0.0)).xy;
                    float _2124 = _2122.x;
                    float _2126 = _2122.y;
                    float _2128 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2076);
                    _2094 = _2070;
                    _2082 = _2126;
                    _2084 = _2124;
                    _2086 = _2128;
                }
            }
            int _2130 = _2094;
            float _2132 = _2082;
            float _2134 = _2084;
            float _2136 = _2086;
            int _2138 = _2130 & 1;
            bool _2140 = _2138 != 0;
            float _2142 = _2132;
            float _2144 = _2134;
            float _2146 = _2136;
            int _2148 = _2130;
            if (_2140)
            {
                _2088 = _2130;
            }
            int _2150 = _2088;
            int _2152 = _2150;
            int _2154 = _2150;
            if (!_2140)
            {
                bool _2156 = _2132 >= 0.800000011920928955078125;
                bool _2158 = isnan(_2132);
                bool _2160 = _2156 || _2158;
                bool _2162 = isnan(0.800000011920928955078125);
                bool _2164 = _2160 || _2162;
                bool _2166 = _2134 != 0.0;
                bool _2168 = isnan(_2134);
                bool _2170 = _2166 || _2168;
                bool _2172 = isnan(0.0);
                bool _2174 = _2170 || _2172;
                bool _2176 = !_2164;
                bool _2178 = _2174 || _2176;
                if (_2178)
                {
                    _2152 = 1;
                }
                int _2180 = _2152;
                _2154 = _2180;
                if (!_2178)
                {
                    float2 _8633 = float2(_2136, _198);
                    float2 _2182 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8633, float2(0.0), isnan(_8633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8633, float2(0.0), isnan(_8633)), level(0.0)).xy;
                    float _2184 = _2182.x;
                    float _2186 = _2182.y;
                    float _2188 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2136);
                    _2154 = _2130;
                    _2142 = _2186;
                    _2144 = _2184;
                    _2146 = _2188;
                }
            }
            int _2190 = _2154;
            float _2192 = _2142;
            float _2194 = _2144;
            float _2196 = _2146;
            int _2198 = _2190 & 1;
            bool _2200 = _2198 != 0;
            float _2202 = _2192;
            float _2204 = _2194;
            float _2206 = _2196;
            int _2208 = _2190;
            if (_2200)
            {
                _2148 = _2190;
            }
            int _2210 = _2148;
            int _2212 = _2210;
            int _2214 = _2210;
            if (!_2200)
            {
                bool _2216 = _2192 >= 0.800000011920928955078125;
                bool _2218 = isnan(_2192);
                bool _2220 = _2216 || _2218;
                bool _2222 = isnan(0.800000011920928955078125);
                bool _2224 = _2220 || _2222;
                bool _2226 = _2194 != 0.0;
                bool _2228 = isnan(_2194);
                bool _2230 = _2226 || _2228;
                bool _2232 = isnan(0.0);
                bool _2234 = _2230 || _2232;
                bool _2236 = !_2224;
                bool _2238 = _2234 || _2236;
                if (_2238)
                {
                    _2212 = 1;
                }
                int _2240 = _2212;
                _2214 = _2240;
                if (!_2238)
                {
                    float2 _8712 = float2(_2196, _198);
                    float2 _2242 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8712, float2(0.0), isnan(_8712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8712, float2(0.0), isnan(_8712)), level(0.0)).xy;
                    float _2244 = _2242.x;
                    float _2246 = _2242.y;
                    float _2248 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2196);
                    _2214 = _2190;
                    _2202 = _2246;
                    _2204 = _2244;
                    _2206 = _2248;
                }
            }
            int _2250 = _2214;
            float _2252 = _2202;
            float _2254 = _2204;
            float _2256 = _2206;
            int _2258 = _2250 & 1;
            bool _2260 = _2258 != 0;
            float _2262 = _2252;
            float _2264 = _2254;
            float _2266 = _2256;
            int _2268 = _2250;
            if (_2260)
            {
                _2208 = _2250;
            }
            int _2270 = _2208;
            int _2272 = _2270;
            int _2274 = _2270;
            if (!_2260)
            {
                bool _2276 = _2252 >= 0.800000011920928955078125;
                bool _2278 = isnan(_2252);
                bool _2280 = _2276 || _2278;
                bool _2282 = isnan(0.800000011920928955078125);
                bool _2284 = _2280 || _2282;
                bool _2286 = _2254 != 0.0;
                bool _2288 = isnan(_2254);
                bool _2290 = _2286 || _2288;
                bool _2292 = isnan(0.0);
                bool _2294 = _2290 || _2292;
                bool _2296 = !_2284;
                bool _2298 = _2294 || _2296;
                if (_2298)
                {
                    _2272 = 1;
                }
                int _2300 = _2272;
                _2274 = _2300;
                if (!_2298)
                {
                    float2 _8791 = float2(_2256, _198);
                    float2 _2302 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8791, float2(0.0), isnan(_8791)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8791, float2(0.0), isnan(_8791)), level(0.0)).xy;
                    float _2304 = _2302.x;
                    float _2306 = _2302.y;
                    float _2308 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2256);
                    _2274 = _2250;
                    _2262 = _2306;
                    _2264 = _2304;
                    _2266 = _2308;
                }
            }
            int _2310 = _2274;
            float _2312 = _2262;
            float _2314 = _2264;
            float _2316 = _2266;
            int _2318 = _2310 & 1;
            bool _2320 = _2318 != 0;
            float _2322 = _2312;
            float _2324 = _2314;
            float _2326 = _2316;
            int _2328 = _2310;
            if (_2320)
            {
                _2268 = _2310;
            }
            int _2330 = _2268;
            int _2332 = _2330;
            int _2334 = _2330;
            if (!_2320)
            {
                bool _2336 = _2312 >= 0.800000011920928955078125;
                bool _2338 = isnan(_2312);
                bool _2340 = _2336 || _2338;
                bool _2342 = isnan(0.800000011920928955078125);
                bool _2344 = _2340 || _2342;
                bool _2346 = _2314 != 0.0;
                bool _2348 = isnan(_2314);
                bool _2350 = _2346 || _2348;
                bool _2352 = isnan(0.0);
                bool _2354 = _2350 || _2352;
                bool _2356 = !_2344;
                bool _2358 = _2354 || _2356;
                if (_2358)
                {
                    _2332 = 1;
                }
                int _2360 = _2332;
                _2334 = _2360;
                if (!_2358)
                {
                    float2 _8870 = float2(_2316, _198);
                    float2 _2362 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8870, float2(0.0), isnan(_8870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8870, float2(0.0), isnan(_8870)), level(0.0)).xy;
                    float _2364 = _2362.x;
                    float _2366 = _2362.y;
                    float _2368 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2316);
                    _2334 = _2310;
                    _2322 = _2366;
                    _2324 = _2364;
                    _2326 = _2368;
                }
            }
            int _2370 = _2334;
            float _2372 = _2322;
            float _2374 = _2324;
            float _2376 = _2326;
            int _2378 = _2370 & 1;
            bool _2380 = _2378 != 0;
            float _2382 = _2372;
            float _2384 = _2374;
            float _2386 = _2376;
            int _2388 = _2370;
            if (_2380)
            {
                _2328 = _2370;
            }
            int _2390 = _2328;
            int _2392 = _2390;
            int _2394 = _2390;
            if (!_2380)
            {
                bool _2396 = _2372 >= 0.800000011920928955078125;
                bool _2398 = isnan(_2372);
                bool _2400 = _2396 || _2398;
                bool _2402 = isnan(0.800000011920928955078125);
                bool _2404 = _2400 || _2402;
                bool _2406 = _2374 != 0.0;
                bool _2408 = isnan(_2374);
                bool _2410 = _2406 || _2408;
                bool _2412 = isnan(0.0);
                bool _2414 = _2410 || _2412;
                bool _2416 = !_2404;
                bool _2418 = _2414 || _2416;
                if (_2418)
                {
                    _2392 = 1;
                }
                int _2420 = _2392;
                _2394 = _2420;
                if (!_2418)
                {
                    float2 _8949 = float2(_2376, _198);
                    float2 _2422 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8949, float2(0.0), isnan(_8949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8949, float2(0.0), isnan(_8949)), level(0.0)).xy;
                    float _2424 = _2422.x;
                    float _2426 = _2422.y;
                    float _2428 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2376);
                    _2394 = _2370;
                    _2382 = _2426;
                    _2384 = _2424;
                    _2386 = _2428;
                }
            }
            int _2430 = _2394;
            float _2432 = _2382;
            float _2434 = _2384;
            float _2436 = _2386;
            int _2438 = _2430 & 1;
            bool _2440 = _2438 != 0;
            float _2442 = _2432;
            float _2444 = _2434;
            float _2446 = _2436;
            int _2448 = _2430;
            if (_2440)
            {
                _2388 = _2430;
            }
            int _2450 = _2388;
            int _2452 = _2450;
            int _2454 = _2450;
            if (!_2440)
            {
                bool _2456 = _2432 >= 0.800000011920928955078125;
                bool _2458 = isnan(_2432);
                bool _2460 = _2456 || _2458;
                bool _2462 = isnan(0.800000011920928955078125);
                bool _2464 = _2460 || _2462;
                bool _2466 = _2434 != 0.0;
                bool _2468 = isnan(_2434);
                bool _2470 = _2466 || _2468;
                bool _2472 = isnan(0.0);
                bool _2474 = _2470 || _2472;
                bool _2476 = !_2464;
                bool _2478 = _2474 || _2476;
                if (_2478)
                {
                    _2452 = 1;
                }
                int _2480 = _2452;
                _2454 = _2480;
                if (!_2478)
                {
                    float2 _9028 = float2(_2436, _198);
                    float2 _2482 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9028, float2(0.0), isnan(_9028)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9028, float2(0.0), isnan(_9028)), level(0.0)).xy;
                    float _2484 = _2482.x;
                    float _2486 = _2482.y;
                    float _2488 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2436);
                    _2454 = _2430;
                    _2442 = _2486;
                    _2444 = _2484;
                    _2446 = _2488;
                }
            }
            int _2490 = _2454;
            float _2492 = _2442;
            float _2494 = _2444;
            float _2496 = _2446;
            int _2498 = _2490 & 1;
            bool _2500 = _2498 != 0;
            float _2502 = _2496;
            float _2504 = _2492;
            float _2506 = _2494;
            float _2508 = as_type<float>(_2490);
            if (_1712)
            {
                _1848 = 1;
            }
            int _2510 = _1848;
            int _2512 = _2510;
            if (!_1712)
            {
                _2512 = 0;
            }
            int _2514 = _2512;
            int _2516 = _2514 & 1;
            bool _2518 = _2516 != 0;
            int _2520 = _2514;
            if (_2500)
            {
                _2448 = _2490;
            }
            int _2522 = _2448;
            int _2524 = _2522;
            int _2526 = _2522;
            if (!_2500)
            {
                bool _2528 = _2492 >= 0.800000011920928955078125;
                bool _2530 = isnan(_2492);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan(0.800000011920928955078125);
                bool _2536 = _2532 || _2534;
                bool _2538 = _2494 != 0.0;
                bool _2540 = isnan(_2494);
                bool _2542 = _2538 || _2540;
                bool _2544 = isnan(0.0);
                bool _2546 = _2542 || _2544;
                bool _2548 = !_2536;
                bool _2550 = _2546 || _2548;
                if (_2550)
                {
                    _2524 = 1;
                }
                int _2552 = _2524;
                _2526 = _2552;
                if (!_2550)
                {
                    float2 _9123 = float2(_2496, _198);
                    float2 _2554 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9123, float2(0.0), isnan(_9123)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9123, float2(0.0), isnan(_9123)), level(0.0)).xy;
                    float _2556 = _2554.x;
                    float _2558 = _2554.y;
                    float _2560 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2496);
                    _2526 = _2490;
                    _2502 = _2560;
                    _2504 = _2558;
                    _2506 = _2556;
                }
            }
            int _2562 = _2526;
            float _2564 = _2502;
            float _2566 = _2504;
            float _2568 = _2506;
            int _2570 = _2562 & 1;
            bool _2572 = _2570 != 0;
            float _2574 = as_type<float>(_2562);
            int _2576 = as_type<int>(_2564);
            if (_1712)
            {
                _1720 = _1664;
            }
            float _2578 = _1720;
            float _2580 = _2578;
            if (!_1712)
            {
                float _2582 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1664);
                _2580 = _2582;
            }
            float _2584 = _2580;
            float _2586 = _2584;
            if (_2572)
            {
                _2574 = _2564;
            }
            float _2588 = _2574;
            float _2590 = _2588;
            float _2592 = _2588;
            if (_2572)
            {
                _2508 = _2566;
            }
            float _2594 = _2508;
            float _2596 = _2594;
            float _2598 = _2594;
            if (_2572)
            {
                _1722 = _2568;
            }
            float _2600 = _1722;
            float _2602 = _2600;
            float _2604 = _2600;
            if (!_2572)
            {
                bool _2606 = _2566 >= 0.800000011920928955078125;
                bool _2608 = isnan(_2566);
                bool _2610 = _2606 || _2608;
                bool _2612 = isnan(0.800000011920928955078125);
                bool _2614 = _2610 || _2612;
                bool _2616 = _2568 != 0.0;
                bool _2618 = isnan(_2568);
                bool _2620 = _2616 || _2618;
                bool _2622 = isnan(0.0);
                bool _2624 = _2620 || _2622;
                bool _2626 = !_2614;
                bool _2628 = _2624 || _2626;
                if (_2628)
                {
                    _2602 = _2568;
                }
                float _2630 = _2602;
                _2604 = _2630;
                if (_2628)
                {
                    _2590 = _2564;
                }
                float _2632 = _2590;
                _2592 = _2632;
                if (_2628)
                {
                    _2596 = _2566;
                }
                float _2634 = _2596;
                _2598 = _2634;
                if (!_2628)
                {
                    float2 _9246 = float2(_2564, _198);
                    float2 _2636 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9246, float2(0.0), isnan(_9246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9246, float2(0.0), isnan(_9246)), level(0.0)).xy;
                    float _2638 = _2636.x;
                    float _2640 = _2636.y;
                    float _2642 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2564);
                    _2604 = _2638;
                    _2598 = _2640;
                    _2592 = _2642;
                }
            }
            float _2644 = _2604;
            float _2646 = _2598;
            float _2648 = _2592;
            if (_2518)
            {
                _2576 = _2514;
            }
            int _2650 = _2576;
            int _2652 = _2650;
            int _2654 = _2650;
            if (!_2518)
            {
                bool _2656 = _1758 > 0.800000011920928955078125;
                bool _2658 = isnan(_1758);
                bool _2660 = _2656 || _2658;
                bool _2662 = isnan(0.800000011920928955078125);
                bool _2664 = _2660 || _2662;
                bool _2666 = _1756 != 0.0;
                bool _2668 = isnan(_1756);
                bool _2670 = _2666 || _2668;
                bool _2672 = isnan(0.0);
                bool _2674 = _2670 || _2672;
                bool _2676 = !_2664;
                bool _2678 = _2674 || _2676;
                if (_2678)
                {
                    _2652 = 1;
                }
                int _2680 = _2652;
                _2654 = _2680;
                if (!_2678)
                {
                    float2 _9315 = float2(_2584, _198);
                    float2 _2682 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9315, float2(0.0), isnan(_9315)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9315, float2(0.0), isnan(_9315)), level(0.0)).xy;
                    float _2684 = _2682.x;
                    float _2686 = _2682.y;
                    float _2688 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2584);
                    _2654 = _2514;
                    _1792 = _2686;
                    _1794 = _2684;
                    _2586 = _2688;
                }
            }
            int _2690 = _2654;
            float _2692 = _1792;
            float _2694 = _1794;
            float _2696 = _2586;
            int _2698 = _2690 & 1;
            bool _2700 = _2698 != 0;
            float _2702 = _2692;
            float _2704 = _2694;
            float _2706 = _2696;
            int _2708 = _2690;
            if (_2700)
            {
                _2520 = _2690;
            }
            int _2710 = _2520;
            int _2712 = _2710;
            int _2714 = _2710;
            if (!_2700)
            {
                bool _2716 = _2692 > 0.800000011920928955078125;
                bool _2718 = isnan(_2692);
                bool _2720 = _2716 || _2718;
                bool _2722 = isnan(0.800000011920928955078125);
                bool _2724 = _2720 || _2722;
                bool _2726 = _2694 != 0.0;
                bool _2728 = isnan(_2694);
                bool _2730 = _2726 || _2728;
                bool _2732 = isnan(0.0);
                bool _2734 = _2730 || _2732;
                bool _2736 = !_2724;
                bool _2738 = _2734 || _2736;
                if (_2738)
                {
                    _2712 = 1;
                }
                int _2740 = _2712;
                _2714 = _2740;
                if (!_2738)
                {
                    float2 _9394 = float2(_2696, _198);
                    float2 _2742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9394, float2(0.0), isnan(_9394)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9394, float2(0.0), isnan(_9394)), level(0.0)).xy;
                    float _2744 = _2742.x;
                    float _2746 = _2742.y;
                    float _2748 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2696);
                    _2714 = _2690;
                    _2702 = _2746;
                    _2704 = _2744;
                    _2706 = _2748;
                }
            }
            int _2750 = _2714;
            float _2752 = _2702;
            float _2754 = _2704;
            float _2756 = _2706;
            int _2758 = _2750 & 1;
            bool _2760 = _2758 != 0;
            float _2762 = _2752;
            float _2764 = _2754;
            float _2766 = _2756;
            int _2768 = _2750;
            if (_2760)
            {
                _2708 = _2750;
            }
            int _2770 = _2708;
            int _2772 = _2770;
            int _2774 = _2770;
            if (!_2760)
            {
                bool _2776 = _2752 > 0.800000011920928955078125;
                bool _2778 = isnan(_2752);
                bool _2780 = _2776 || _2778;
                bool _2782 = isnan(0.800000011920928955078125);
                bool _2784 = _2780 || _2782;
                bool _2786 = _2754 != 0.0;
                bool _2788 = isnan(_2754);
                bool _2790 = _2786 || _2788;
                bool _2792 = isnan(0.0);
                bool _2794 = _2790 || _2792;
                bool _2796 = !_2784;
                bool _2798 = _2794 || _2796;
                if (_2798)
                {
                    _2772 = 1;
                }
                int _2800 = _2772;
                _2774 = _2800;
                if (!_2798)
                {
                    float2 _9473 = float2(_2756, _198);
                    float2 _2802 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9473, float2(0.0), isnan(_9473)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9473, float2(0.0), isnan(_9473)), level(0.0)).xy;
                    float _2804 = _2802.x;
                    float _2806 = _2802.y;
                    float _2808 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2756);
                    _2774 = _2750;
                    _2762 = _2806;
                    _2764 = _2804;
                    _2766 = _2808;
                }
            }
            int _2810 = _2774;
            float _2812 = _2762;
            float _2814 = _2764;
            float _2816 = _2766;
            int _2818 = _2810 & 1;
            bool _2820 = _2818 != 0;
            float _2822 = _2812;
            float _2824 = _2814;
            float _2826 = _2816;
            int _2828 = _2810;
            if (_2820)
            {
                _2768 = _2810;
            }
            int _2830 = _2768;
            int _2832 = _2830;
            int _2834 = _2830;
            if (!_2820)
            {
                bool _2836 = _2812 > 0.800000011920928955078125;
                bool _2838 = isnan(_2812);
                bool _2840 = _2836 || _2838;
                bool _2842 = isnan(0.800000011920928955078125);
                bool _2844 = _2840 || _2842;
                bool _2846 = _2814 != 0.0;
                bool _2848 = isnan(_2814);
                bool _2850 = _2846 || _2848;
                bool _2852 = isnan(0.0);
                bool _2854 = _2850 || _2852;
                bool _2856 = !_2844;
                bool _2858 = _2854 || _2856;
                if (_2858)
                {
                    _2832 = 1;
                }
                int _2860 = _2832;
                _2834 = _2860;
                if (!_2858)
                {
                    float2 _9552 = float2(_2816, _198);
                    float2 _2862 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9552, float2(0.0), isnan(_9552)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9552, float2(0.0), isnan(_9552)), level(0.0)).xy;
                    float _2864 = _2862.x;
                    float _2866 = _2862.y;
                    float _2868 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2816);
                    _2834 = _2810;
                    _2822 = _2866;
                    _2824 = _2864;
                    _2826 = _2868;
                }
            }
            int _2870 = _2834;
            float _2872 = _2822;
            float _2874 = _2824;
            float _2876 = _2826;
            int _2878 = _2870 & 1;
            bool _2880 = _2878 != 0;
            float _2882 = _2872;
            float _2884 = _2874;
            float _2886 = _2876;
            int _2888 = _2870;
            if (_2880)
            {
                _2828 = _2870;
            }
            int _2890 = _2828;
            int _2892 = _2890;
            int _2894 = _2890;
            if (!_2880)
            {
                bool _2896 = _2872 > 0.800000011920928955078125;
                bool _2898 = isnan(_2872);
                bool _2900 = _2896 || _2898;
                bool _2902 = isnan(0.800000011920928955078125);
                bool _2904 = _2900 || _2902;
                bool _2906 = _2874 != 0.0;
                bool _2908 = isnan(_2874);
                bool _2910 = _2906 || _2908;
                bool _2912 = isnan(0.0);
                bool _2914 = _2910 || _2912;
                bool _2916 = !_2904;
                bool _2918 = _2914 || _2916;
                if (_2918)
                {
                    _2892 = 1;
                }
                int _2920 = _2892;
                _2894 = _2920;
                if (!_2918)
                {
                    float2 _9631 = float2(_2876, _198);
                    float2 _2922 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9631, float2(0.0), isnan(_9631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9631, float2(0.0), isnan(_9631)), level(0.0)).xy;
                    float _2924 = _2922.x;
                    float _2926 = _2922.y;
                    float _2928 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2876);
                    _2894 = _2870;
                    _2882 = _2926;
                    _2884 = _2924;
                    _2886 = _2928;
                }
            }
            int _2930 = _2894;
            float _2932 = _2882;
            float _2934 = _2884;
            float _2936 = _2886;
            int _2938 = _2930 & 1;
            bool _2940 = _2938 != 0;
            float _2942 = _2932;
            float _2944 = _2934;
            float _2946 = _2936;
            int _2948 = _2930;
            if (_2940)
            {
                _2888 = _2930;
            }
            int _2950 = _2888;
            int _2952 = _2950;
            int _2954 = _2950;
            if (!_2940)
            {
                bool _2956 = _2932 > 0.800000011920928955078125;
                bool _2958 = isnan(_2932);
                bool _2960 = _2956 || _2958;
                bool _2962 = isnan(0.800000011920928955078125);
                bool _2964 = _2960 || _2962;
                bool _2966 = _2934 != 0.0;
                bool _2968 = isnan(_2934);
                bool _2970 = _2966 || _2968;
                bool _2972 = isnan(0.0);
                bool _2974 = _2970 || _2972;
                bool _2976 = !_2964;
                bool _2978 = _2974 || _2976;
                if (_2978)
                {
                    _2952 = 1;
                }
                int _2980 = _2952;
                _2954 = _2980;
                if (!_2978)
                {
                    float2 _9710 = float2(_2936, _198);
                    float2 _2982 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9710, float2(0.0), isnan(_9710)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9710, float2(0.0), isnan(_9710)), level(0.0)).xy;
                    float _2984 = _2982.x;
                    float _2986 = _2982.y;
                    float _2988 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2936);
                    _2954 = _2930;
                    _2942 = _2986;
                    _2944 = _2984;
                    _2946 = _2988;
                }
            }
            int _2990 = _2954;
            float _2992 = _2942;
            float _2994 = _2944;
            float _2996 = _2946;
            int _2998 = _2990 & 1;
            bool _3000 = _2998 != 0;
            float _3002 = _2992;
            float _3004 = _2994;
            float _3006 = _2996;
            int _3008 = _2990;
            if (_3000)
            {
                _2948 = _2990;
            }
            int _3010 = _2948;
            int _3012 = _3010;
            int _3014 = _3010;
            if (!_3000)
            {
                bool _3016 = _2992 > 0.800000011920928955078125;
                bool _3018 = isnan(_2992);
                bool _3020 = _3016 || _3018;
                bool _3022 = isnan(0.800000011920928955078125);
                bool _3024 = _3020 || _3022;
                bool _3026 = _2994 != 0.0;
                bool _3028 = isnan(_2994);
                bool _3030 = _3026 || _3028;
                bool _3032 = isnan(0.0);
                bool _3034 = _3030 || _3032;
                bool _3036 = !_3024;
                bool _3038 = _3034 || _3036;
                if (_3038)
                {
                    _3012 = 1;
                }
                int _3040 = _3012;
                _3014 = _3040;
                if (!_3038)
                {
                    float2 _9789 = float2(_2996, _198);
                    float2 _3042 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9789, float2(0.0), isnan(_9789)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9789, float2(0.0), isnan(_9789)), level(0.0)).xy;
                    float _3044 = _3042.x;
                    float _3046 = _3042.y;
                    float _3048 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2996);
                    _3014 = _2990;
                    _3002 = _3046;
                    _3004 = _3044;
                    _3006 = _3048;
                }
            }
            int _3050 = _3014;
            float _3052 = _3002;
            float _3054 = _3004;
            float _3056 = _3006;
            int _3058 = _3050 & 1;
            bool _3060 = _3058 != 0;
            float _3062 = _3052;
            float _3064 = _3054;
            float _3066 = _3056;
            int _3068 = _3050;
            if (_3060)
            {
                _3008 = _3050;
            }
            int _3070 = _3008;
            int _3072 = _3070;
            int _3074 = _3070;
            if (!_3060)
            {
                bool _3076 = _3052 > 0.800000011920928955078125;
                bool _3078 = isnan(_3052);
                bool _3080 = _3076 || _3078;
                bool _3082 = isnan(0.800000011920928955078125);
                bool _3084 = _3080 || _3082;
                bool _3086 = _3054 != 0.0;
                bool _3088 = isnan(_3054);
                bool _3090 = _3086 || _3088;
                bool _3092 = isnan(0.0);
                bool _3094 = _3090 || _3092;
                bool _3096 = !_3084;
                bool _3098 = _3094 || _3096;
                if (_3098)
                {
                    _3072 = 1;
                }
                int _3100 = _3072;
                _3074 = _3100;
                if (!_3098)
                {
                    float2 _9868 = float2(_3056, _198);
                    float2 _3102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9868, float2(0.0), isnan(_9868)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9868, float2(0.0), isnan(_9868)), level(0.0)).xy;
                    float _3104 = _3102.x;
                    float _3106 = _3102.y;
                    float _3108 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3056);
                    _3074 = _3050;
                    _3062 = _3106;
                    _3064 = _3104;
                    _3066 = _3108;
                }
            }
            int _3110 = _3074;
            float _3112 = _3062;
            float _3114 = _3064;
            float _3116 = _3066;
            int _3118 = _3110 & 1;
            bool _3120 = _3118 != 0;
            float _3122 = _3112;
            float _3124 = _3114;
            float _3126 = _3116;
            int _3128 = _3110;
            if (_3120)
            {
                _3068 = _3110;
            }
            int _3130 = _3068;
            int _3132 = _3130;
            int _3134 = _3130;
            if (!_3120)
            {
                bool _3136 = _3112 > 0.800000011920928955078125;
                bool _3138 = isnan(_3112);
                bool _3140 = _3136 || _3138;
                bool _3142 = isnan(0.800000011920928955078125);
                bool _3144 = _3140 || _3142;
                bool _3146 = _3114 != 0.0;
                bool _3148 = isnan(_3114);
                bool _3150 = _3146 || _3148;
                bool _3152 = isnan(0.0);
                bool _3154 = _3150 || _3152;
                bool _3156 = !_3144;
                bool _3158 = _3154 || _3156;
                if (_3158)
                {
                    _3132 = 1;
                }
                int _3160 = _3132;
                _3134 = _3160;
                if (!_3158)
                {
                    float2 _9947 = float2(_3116, _198);
                    float2 _3162 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9947, float2(0.0), isnan(_9947)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9947, float2(0.0), isnan(_9947)), level(0.0)).xy;
                    float _3164 = _3162.x;
                    float _3166 = _3162.y;
                    float _3168 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3116);
                    _3134 = _3110;
                    _3122 = _3166;
                    _3124 = _3164;
                    _3126 = _3168;
                }
            }
            int _3170 = _3134;
            float _3172 = _3122;
            float _3174 = _3124;
            float _3176 = _3126;
            int _3178 = _3170 & 1;
            bool _3180 = _3178 != 0;
            float _3182 = _3172;
            float _3184 = _3174;
            float _3186 = _3176;
            int _3188 = _3170;
            if (_3180)
            {
                _3128 = _3170;
            }
            int _3190 = _3128;
            int _3192 = _3190;
            int _3194 = _3190;
            if (!_3180)
            {
                bool _3196 = _3172 > 0.800000011920928955078125;
                bool _3198 = isnan(_3172);
                bool _3200 = _3196 || _3198;
                bool _3202 = isnan(0.800000011920928955078125);
                bool _3204 = _3200 || _3202;
                bool _3206 = _3174 != 0.0;
                bool _3208 = isnan(_3174);
                bool _3210 = _3206 || _3208;
                bool _3212 = isnan(0.0);
                bool _3214 = _3210 || _3212;
                bool _3216 = !_3204;
                bool _3218 = _3214 || _3216;
                if (_3218)
                {
                    _3192 = 1;
                }
                int _3220 = _3192;
                _3194 = _3220;
                if (!_3218)
                {
                    float2 _10026 = float2(_3176, _198);
                    float2 _3222 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10026, float2(0.0), isnan(_10026)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10026, float2(0.0), isnan(_10026)), level(0.0)).xy;
                    float _3224 = _3222.x;
                    float _3226 = _3222.y;
                    float _3228 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3176);
                    _3194 = _3170;
                    _3182 = _3226;
                    _3184 = _3224;
                    _3186 = _3228;
                }
            }
            int _3230 = _3194;
            float _3232 = _3182;
            float _3234 = _3184;
            float _3236 = _3186;
            int _3238 = _3230 & 1;
            bool _3240 = _3238 != 0;
            float _3242 = _3232;
            float _3244 = _3234;
            float _3246 = _3236;
            int _3248 = _3230;
            if (_3240)
            {
                _3188 = _3230;
            }
            int _3250 = _3188;
            int _3252 = _3250;
            int _3254 = _3250;
            if (!_3240)
            {
                bool _3256 = _3232 > 0.800000011920928955078125;
                bool _3258 = isnan(_3232);
                bool _3260 = _3256 || _3258;
                bool _3262 = isnan(0.800000011920928955078125);
                bool _3264 = _3260 || _3262;
                bool _3266 = _3234 != 0.0;
                bool _3268 = isnan(_3234);
                bool _3270 = _3266 || _3268;
                bool _3272 = isnan(0.0);
                bool _3274 = _3270 || _3272;
                bool _3276 = !_3264;
                bool _3278 = _3274 || _3276;
                if (_3278)
                {
                    _3252 = 1;
                }
                int _3280 = _3252;
                _3254 = _3280;
                if (!_3278)
                {
                    float2 _10105 = float2(_3236, _198);
                    float2 _3282 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10105, float2(0.0), isnan(_10105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10105, float2(0.0), isnan(_10105)), level(0.0)).xy;
                    float _3284 = _3282.x;
                    float _3286 = _3282.y;
                    float _3288 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3236);
                    _3254 = _3230;
                    _3242 = _3286;
                    _3244 = _3284;
                    _3246 = _3288;
                }
            }
            int _3290 = _3254;
            float _3292 = _3242;
            float _3294 = _3244;
            float _3296 = _3246;
            int _3298 = _3290 & 1;
            bool _3300 = _3298 != 0;
            float _3302 = _3292;
            float _3304 = _3294;
            float _3306 = _3296;
            int _3308 = _3290;
            if (_3300)
            {
                _3248 = _3290;
            }
            int _3310 = _3248;
            int _3312 = _3310;
            int _3314 = _3310;
            if (!_3300)
            {
                bool _3316 = _3292 > 0.800000011920928955078125;
                bool _3318 = isnan(_3292);
                bool _3320 = _3316 || _3318;
                bool _3322 = isnan(0.800000011920928955078125);
                bool _3324 = _3320 || _3322;
                bool _3326 = _3294 != 0.0;
                bool _3328 = isnan(_3294);
                bool _3330 = _3326 || _3328;
                bool _3332 = isnan(0.0);
                bool _3334 = _3330 || _3332;
                bool _3336 = !_3324;
                bool _3338 = _3334 || _3336;
                if (_3338)
                {
                    _3312 = 1;
                }
                int _3340 = _3312;
                _3314 = _3340;
                if (!_3338)
                {
                    float2 _10184 = float2(_3296, _198);
                    float2 _3342 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10184, float2(0.0), isnan(_10184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10184, float2(0.0), isnan(_10184)), level(0.0)).xy;
                    float _3344 = _3342.x;
                    float _3346 = _3342.y;
                    float _3348 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3296);
                    _3314 = _3290;
                    _3302 = _3346;
                    _3304 = _3344;
                    _3306 = _3348;
                }
            }
            int _3350 = _3314;
            float _3352 = _3302;
            float _3354 = _3304;
            float _3356 = _3306;
            int _3358 = _3350 & 1;
            bool _3360 = _3358 != 0;
            float _3362 = _3352;
            float _3364 = _3354;
            float _3366 = _3356;
            if (_3360)
            {
                _3308 = _3350;
            }
            int _3368 = _3308;
            int _3370 = _3368;
            int _3372 = _3368;
            if (!_3360)
            {
                bool _3374 = _3352 > 0.800000011920928955078125;
                bool _3376 = isnan(_3352);
                bool _3378 = _3374 || _3376;
                bool _3380 = isnan(0.800000011920928955078125);
                bool _3382 = _3378 || _3380;
                bool _3384 = _3354 != 0.0;
                bool _3386 = isnan(_3354);
                bool _3388 = _3384 || _3386;
                bool _3390 = isnan(0.0);
                bool _3392 = _3388 || _3390;
                bool _3394 = !_3382;
                bool _3396 = _3392 || _3394;
                if (_3396)
                {
                    _3370 = 1;
                }
                int _3398 = _3370;
                _3372 = _3398;
                if (!_3396)
                {
                    float2 _10262 = float2(_3356, _198);
                    float2 _3400 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10262, float2(0.0), isnan(_10262)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10262, float2(0.0), isnan(_10262)), level(0.0)).xy;
                    float _3402 = _3400.x;
                    float _3404 = _3400.y;
                    float _3406 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3356);
                    _3372 = _3350;
                    _3362 = _3404;
                    _3364 = _3402;
                    _3366 = _3406;
                }
            }
            int _3408 = _3372;
            float _3410 = _3362;
            float _3412 = _3364;
            float _3414 = _3366;
            int _3416 = _3408 & 1;
            bool _3418 = _3416 != 0;
            float _3420 = _3412;
            float _3422 = _3410;
            float _3424 = _3414;
            if (!_3418)
            {
                bool _3426 = _3410 > 0.800000011920928955078125;
                bool _3428 = isnan(_3410);
                bool _3430 = _3426 || _3428;
                bool _3432 = isnan(0.800000011920928955078125);
                bool _3434 = _3430 || _3432;
                bool _3436 = _3412 != 0.0;
                bool _3438 = isnan(_3412);
                bool _3440 = _3436 || _3438;
                bool _3442 = isnan(0.0);
                bool _3444 = _3440 || _3442;
                bool _3446 = !_3434;
                bool _3448 = _3444 || _3446;
                if (!_3448)
                {
                    float2 _10328 = float2(_3414, _198);
                    float2 _3450 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10328, float2(0.0), isnan(_10328)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10328, float2(0.0), isnan(_10328)), level(0.0)).xy;
                    float _3452 = _3450.x;
                    float _3454 = _3450.y;
                    float _3456 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3414);
                    _3420 = _3452;
                    _3422 = _3454;
                    _3424 = _3456;
                }
            }
            float _3458 = _3420;
            float _3460 = _3422;
            float _3462 = _3424;
            float _3464 = fma(_3458, 0.5, 0.5234375);
            float _3466 = fma(_2644, 0.5, 0.0078125);
            float _3468 = fma(_3460, 2.0, 0.03125);
            float _3470 = fma(_2646, 2.0, 0.03125);
            float2 _10363 = float2(_3464, _3468);
            float _3472 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_10363, float2(0.0), isnan(_10363)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_10363, float2(0.0), isnan(_10363)), level(0.0)).x;
            float2 _10371 = float2(_3466, _3470);
            float _3474 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_10371, float2(0.0), isnan(_10371)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_10371, float2(0.0), isnan(_10371)), level(0.0)).x;
            float _3476 = fma(_3472, -2.007874011993408203125, 3.25);
            float _3478 = fma(_3474, -2.007874011993408203125, 3.25);
            float _3480 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _3482 = fma(_3476, _3480, _3462);
            float _3484 = fma(_3478, (*spvDescriptorSet0.cp_c3)._m0[0].z, _2648);
            float2 _10397 = float2(_3482, _144);
            float _3486 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10397, float2(0.0), isnan(_10397)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10397, float2(0.0), isnan(_10397)), level(0.0), int2(1, 0)).x;
            float2 _10405 = float2(_3484, _144);
            float _3488 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10405, float2(0.0), isnan(_10405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10405, float2(0.0), isnan(_10405)), level(0.0)).x;
            float _3490 = -_122;
            float _3492 = fma(_3484, (*spvDescriptorSet0.cp_c3)._m0[0].x, _3490);
            float _3494 = -_122;
            float _3496 = fma(_3482, (*spvDescriptorSet0.cp_c3)._m0[0].x, _3494);
            float _3498 = rint(_3496);
            float _3500 = rint(_3492);
            float _3502 = abs(_3498);
            float _3504 = sqrt(_3502);
            float _3506 = abs(_3500);
            float _3508 = sqrt(_3506);
            float _3510 = _3486 * 4.0;
            float _3512 = _3488 * 4.0;
            float _3514 = rint(_3510);
            float _3516 = rint(_3512);
            float _3518 = fma(_3514, 16.0, _3504);
            float2 _10451 = float2(_3484, _130);
            float _3520 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10451, float2(0.0), isnan(_10451)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10451, float2(0.0), isnan(_10451)), level(0.0), int2(0, 1)).x;
            float _3522 = fma(_3518, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _3524 = fma(_3516, 16.0, _3508);
            float _3526 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _3522);
            float _3528 = fma(_3524, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float2 _10471 = float2(_3484, _130);
            float _3530 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10471, float2(0.0), isnan(_10471)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10471, float2(0.0), isnan(_10471)), level(0.0), int2(0, -2)).x;
            float2 _10481 = float2(_3482, _130);
            float _3532 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10481, float2(0.0), isnan(_10481)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10481, float2(0.0), isnan(_10481)), level(0.0), int2(1)).x;
            float2 _10490 = float2(_3482, _130);
            float _3534 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10490, float2(0.0), isnan(_10490)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10490, float2(0.0), isnan(_10490)), level(0.0), int2(1, -2)).x;
            float2 _10499 = float2(_3528, _3526);
            float2 _3536 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_10499, float2(0.0), isnan(_10499)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_10499, float2(0.0), isnan(_10499)), level(0.0)).xy;
            float _3538 = _3536.x;
            float _3540 = _3536.y;
            float _3542 = abs(_3498);
            float _3544 = abs(_3500);
            bool _3546 = _3542 >= _3544;
            bool _3548 = isnan(_3542);
            bool _3550 = _3546 || _3548;
            bool _3552 = isnan(_3544);
            bool _3554 = _3550 || _3552;
            float _3556 = float(_3554);
            float _3558 = abs(_3500);
            float _3560 = abs(_3498);
            bool _3562 = _3558 >= _3560;
            bool _3564 = isnan(_3558);
            bool _3566 = _3562 || _3564;
            bool _3568 = isnan(_3560);
            bool _3570 = _3566 || _3568;
            float _3572 = float(_3570);
            float _3574 = _3556 + _3572;
            float _3576 = 1.0 / _3574;
            float _3578 = _3576 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
            float _3580 = _3556 * _3578;
            float _3582 = _3572 * _3578;
            float _3584 = -_3580;
            float _3586 = fma(_3584, _3520, 1.0);
            float _3588 = -_3580;
            float _3590 = fma(_3588, _3530, 1.0);
            float _3592 = -_3582;
            float _3594 = fma(_3592, _3532, _3586);
            float _3596 = precise::clamp(_3594, 0.0, 1.0);
            float _3598 = -_3582;
            float _3600 = fma(_3598, _3534, _3590);
            float _3602 = precise::clamp(_3600, 0.0, 1.0);
            float _3604 = _3538 * _3596;
            float _3606 = _3540 * _3602;
            _180 = _152;
            _182 = _3520;
            _158 = as_type<int>(_3528);
            _172 = _3604;
            _174 = _3606;
        }
    }
    int _3608 = _180;
    float _3610 = _182;
    int _3612 = _158;
    float _3614 = _172;
    float _3616 = _174;
    int _3618 = _3608 & 1;
    bool _3620 = _3618 != 0;
    bool _3622 = !_3620;
    float _3624 = _3610;
    int _3626 = _3612;
    float _5566;
    float _5568;
    if (!_3622)
    {
        float2 _10620 = float2(_138, _144);
        float2 _3628 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10620, float2(0.0), isnan(_10620)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10620, float2(0.0), isnan(_10620)), level(0.0)).xy;
        float _3630 = _3628.x;
        float _3632 = _3628.y;
        float2 _10632 = float2(_138, _142);
        float2 _3634 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10632, float2(0.0), isnan(_10632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10632, float2(0.0), isnan(_10632)), level(0.0)).xy;
        float _3636 = _3634.x;
        float _3638 = _3634.y;
        float _3640 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _144);
        float _3642 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _142);
        bool _3644 = _3636 > 0.800000011920928955078125;
        bool _3646 = isnan(_3636);
        bool _3648 = _3644 || _3646;
        bool _3650 = isnan(0.800000011920928955078125);
        bool _3652 = _3648 || _3650;
        bool _3654 = _3630 > 0.800000011920928955078125;
        bool _3656 = isnan(_3630);
        bool _3658 = _3654 || _3656;
        bool _3660 = isnan(0.800000011920928955078125);
        bool _3662 = _3658 || _3660;
        bool _3664 = _3638 != 0.0;
        bool _3666 = isnan(_3638);
        bool _3668 = _3664 || _3666;
        bool _3670 = isnan(0.0);
        bool _3672 = _3668 || _3670;
        bool _3674 = !_3652;
        bool _3676 = _3672 || _3674;
        bool _3678 = _3632 != 0.0;
        bool _3680 = isnan(_3632);
        bool _3682 = _3678 || _3680;
        bool _3684 = isnan(0.0);
        bool _3686 = _3682 || _3684;
        bool _3688 = !_3662;
        bool _3690 = _3686 || _3688;
        int _3692 = as_type<int>(_3640);
        float _3694 = _3642;
        float _3696 = _3636;
        if (_3676)
        {
            _3624 = _3636;
        }
        float _3698 = _3624;
        if (_3676)
        {
            _160 = _3638;
        }
        float _3700 = _160;
        float _3702 = _3630;
        float _3704 = _3632;
        if (!_3690)
        {
            float2 _10725 = float2(_138, _3640);
            float2 _3706 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10725, float2(0.0), isnan(_10725)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10725, float2(0.0), isnan(_10725)), level(0.0)).xy;
            float _3708 = _3706.x;
            float _3710 = _3706.y;
            _3702 = _3708;
            _3704 = _3710;
        }
        float _3712 = _3702;
        float _3714 = _3704;
        float _3716 = _3698;
        float _3718 = _3700;
        if (!_3676)
        {
            float2 _10747 = float2(_138, _3642);
            float2 _3720 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10747, float2(0.0), isnan(_10747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10747, float2(0.0), isnan(_10747)), level(0.0)).xy;
            float _3722 = _3720.x;
            float _3724 = _3720.y;
            _3716 = _3722;
            _3718 = _3724;
        }
        float _3726 = _3716;
        float _3728 = _3718;
        if (_3690)
        {
            _162 = 1;
        }
        int _3730 = _162;
        int _3732 = _3730;
        if (!_3690)
        {
            _3732 = 0;
        }
        int _3734 = _3732;
        int _3736 = _3734;
        if (_3690)
        {
            _164 = _3640;
        }
        float _3738 = _164;
        float _3740 = _3738;
        if (!_3690)
        {
            float _3742 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3640);
            _3740 = _3742;
        }
        float _3744 = _3740;
        int _3746 = _3734 & 1;
        bool _3748 = _3746 != 0;
        float _3750 = _3744;
        if (_3748)
        {
            _3626 = _3734;
        }
        int _3752 = _3626;
        int _3754 = _3752;
        int _3756 = _3752;
        float _3758 = _3712;
        float _3760 = _3714;
        float _3762 = _3726;
        float _3764 = _3728;
        if (!_3748)
        {
            bool _3766 = _3712 > 0.800000011920928955078125;
            bool _3768 = isnan(_3712);
            bool _3770 = _3766 || _3768;
            bool _3772 = isnan(0.800000011920928955078125);
            bool _3774 = _3770 || _3772;
            bool _3776 = _3714 != 0.0;
            bool _3778 = isnan(_3714);
            bool _3780 = _3776 || _3778;
            bool _3782 = isnan(0.0);
            bool _3784 = _3780 || _3782;
            bool _3786 = !_3774;
            bool _3788 = _3784 || _3786;
            if (_3788)
            {
                _3754 = 1;
            }
            int _3790 = _3754;
            _3756 = _3790;
            if (!_3788)
            {
                float2 _10845 = float2(_138, _3744);
                float2 _3792 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10845, float2(0.0), isnan(_10845)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10845, float2(0.0), isnan(_10845)), level(0.0)).xy;
                float _3794 = _3792.x;
                float _3796 = _3792.y;
                float _3798 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3744);
                _3756 = _3734;
                _3758 = _3794;
                _3760 = _3796;
                _3750 = _3798;
            }
        }
        int _3800 = _3756;
        float _3802 = _3758;
        float _3804 = _3760;
        float _3806 = _3750;
        int _3808 = _3800 & 1;
        bool _3810 = _3808 != 0;
        float _3812 = _3802;
        float _3814 = _3804;
        float _3816 = _3806;
        int _3818 = _3800;
        if (_3810)
        {
            _3692 = _3800;
        }
        int _3820 = _3692;
        int _3822 = _3820;
        int _3824 = _3820;
        if (!_3810)
        {
            bool _3826 = _3802 > 0.800000011920928955078125;
            bool _3828 = isnan(_3802);
            bool _3830 = _3826 || _3828;
            bool _3832 = isnan(0.800000011920928955078125);
            bool _3834 = _3830 || _3832;
            bool _3836 = _3804 != 0.0;
            bool _3838 = isnan(_3804);
            bool _3840 = _3836 || _3838;
            bool _3842 = isnan(0.0);
            bool _3844 = _3840 || _3842;
            bool _3846 = !_3834;
            bool _3848 = _3844 || _3846;
            if (_3848)
            {
                _3822 = 1;
            }
            int _3850 = _3822;
            _3824 = _3850;
            if (!_3848)
            {
                float2 _10924 = float2(_138, _3806);
                float2 _3852 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10924, float2(0.0), isnan(_10924)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10924, float2(0.0), isnan(_10924)), level(0.0)).xy;
                float _3854 = _3852.x;
                float _3856 = _3852.y;
                float _3858 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3806);
                _3824 = _3800;
                _3812 = _3854;
                _3814 = _3856;
                _3816 = _3858;
            }
        }
        int _3860 = _3824;
        float _3862 = _3812;
        float _3864 = _3814;
        float _3866 = _3816;
        int _3868 = _3860 & 1;
        bool _3870 = _3868 != 0;
        float _3872 = _3862;
        float _3874 = _3864;
        float _3876 = _3866;
        int _3878 = _3860;
        if (_3870)
        {
            _3736 = _3860;
        }
        int _3880 = _3736;
        int _3882 = _3880;
        int _3884 = _3880;
        if (!_3870)
        {
            bool _3886 = _3862 > 0.800000011920928955078125;
            bool _3888 = isnan(_3862);
            bool _3890 = _3886 || _3888;
            bool _3892 = isnan(0.800000011920928955078125);
            bool _3894 = _3890 || _3892;
            bool _3896 = _3864 != 0.0;
            bool _3898 = isnan(_3864);
            bool _3900 = _3896 || _3898;
            bool _3902 = isnan(0.0);
            bool _3904 = _3900 || _3902;
            bool _3906 = !_3894;
            bool _3908 = _3904 || _3906;
            if (_3908)
            {
                _3882 = 1;
            }
            int _3910 = _3882;
            _3884 = _3910;
            if (!_3908)
            {
                float2 _11003 = float2(_138, _3866);
                float2 _3912 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11003, float2(0.0), isnan(_11003)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11003, float2(0.0), isnan(_11003)), level(0.0)).xy;
                float _3914 = _3912.x;
                float _3916 = _3912.y;
                float _3918 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3866);
                _3884 = _3860;
                _3872 = _3914;
                _3874 = _3916;
                _3876 = _3918;
            }
        }
        int _3920 = _3884;
        float _3922 = _3872;
        float _3924 = _3874;
        float _3926 = _3876;
        int _3928 = _3920 & 1;
        bool _3930 = _3928 != 0;
        float _3932 = _3922;
        float _3934 = _3924;
        float _3936 = _3926;
        int _3938 = _3920;
        if (_3930)
        {
            _3878 = _3920;
        }
        int _3940 = _3878;
        int _3942 = _3940;
        int _3944 = _3940;
        if (!_3930)
        {
            bool _3946 = _3922 > 0.800000011920928955078125;
            bool _3948 = isnan(_3922);
            bool _3950 = _3946 || _3948;
            bool _3952 = isnan(0.800000011920928955078125);
            bool _3954 = _3950 || _3952;
            bool _3956 = _3924 != 0.0;
            bool _3958 = isnan(_3924);
            bool _3960 = _3956 || _3958;
            bool _3962 = isnan(0.0);
            bool _3964 = _3960 || _3962;
            bool _3966 = !_3954;
            bool _3968 = _3964 || _3966;
            if (_3968)
            {
                _3942 = 1;
            }
            int _3970 = _3942;
            _3944 = _3970;
            if (!_3968)
            {
                float2 _11082 = float2(_138, _3926);
                float2 _3972 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11082, float2(0.0), isnan(_11082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11082, float2(0.0), isnan(_11082)), level(0.0)).xy;
                float _3974 = _3972.x;
                float _3976 = _3972.y;
                float _3978 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3926);
                _3944 = _3920;
                _3932 = _3974;
                _3934 = _3976;
                _3936 = _3978;
            }
        }
        int _3980 = _3944;
        float _3982 = _3932;
        float _3984 = _3934;
        float _3986 = _3936;
        int _3988 = _3980 & 1;
        bool _3990 = _3988 != 0;
        float _3992 = _3982;
        float _3994 = _3984;
        float _3996 = _3986;
        int _3998 = _3980;
        if (_3990)
        {
            _3938 = _3980;
        }
        int _4000 = _3938;
        int _4002 = _4000;
        int _4004 = _4000;
        if (!_3990)
        {
            bool _4006 = _3982 > 0.800000011920928955078125;
            bool _4008 = isnan(_3982);
            bool _4010 = _4006 || _4008;
            bool _4012 = isnan(0.800000011920928955078125);
            bool _4014 = _4010 || _4012;
            bool _4016 = _3984 != 0.0;
            bool _4018 = isnan(_3984);
            bool _4020 = _4016 || _4018;
            bool _4022 = isnan(0.0);
            bool _4024 = _4020 || _4022;
            bool _4026 = !_4014;
            bool _4028 = _4024 || _4026;
            if (_4028)
            {
                _4002 = 1;
            }
            int _4030 = _4002;
            _4004 = _4030;
            if (!_4028)
            {
                float2 _11161 = float2(_138, _3986);
                float2 _4032 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11161, float2(0.0), isnan(_11161)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11161, float2(0.0), isnan(_11161)), level(0.0)).xy;
                float _4034 = _4032.x;
                float _4036 = _4032.y;
                float _4038 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3986);
                _4004 = _3980;
                _3992 = _4034;
                _3994 = _4036;
                _3996 = _4038;
            }
        }
        int _4040 = _4004;
        float _4042 = _3992;
        float _4044 = _3994;
        float _4046 = _3996;
        int _4048 = _4040 & 1;
        bool _4050 = _4048 != 0;
        float _4052 = _4042;
        float _4054 = _4044;
        float _4056 = _4046;
        int _4058 = _4040;
        if (_4050)
        {
            _3998 = _4040;
        }
        int _4060 = _3998;
        int _4062 = _4060;
        int _4064 = _4060;
        if (!_4050)
        {
            bool _4066 = _4042 > 0.800000011920928955078125;
            bool _4068 = isnan(_4042);
            bool _4070 = _4066 || _4068;
            bool _4072 = isnan(0.800000011920928955078125);
            bool _4074 = _4070 || _4072;
            bool _4076 = _4044 != 0.0;
            bool _4078 = isnan(_4044);
            bool _4080 = _4076 || _4078;
            bool _4082 = isnan(0.0);
            bool _4084 = _4080 || _4082;
            bool _4086 = !_4074;
            bool _4088 = _4084 || _4086;
            if (_4088)
            {
                _4062 = 1;
            }
            int _4090 = _4062;
            _4064 = _4090;
            if (!_4088)
            {
                float2 _11240 = float2(_138, _4046);
                float2 _4092 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11240, float2(0.0), isnan(_11240)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11240, float2(0.0), isnan(_11240)), level(0.0)).xy;
                float _4094 = _4092.x;
                float _4096 = _4092.y;
                float _4098 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4046);
                _4064 = _4040;
                _4052 = _4094;
                _4054 = _4096;
                _4056 = _4098;
            }
        }
        int _4100 = _4064;
        float _4102 = _4052;
        float _4104 = _4054;
        float _4106 = _4056;
        int _4108 = _4100 & 1;
        bool _4110 = _4108 != 0;
        float _4112 = _4102;
        float _4114 = _4104;
        float _4116 = _4106;
        int _4118 = _4100;
        if (_4110)
        {
            _4058 = _4100;
        }
        int _4120 = _4058;
        int _4122 = _4120;
        int _4124 = _4120;
        if (!_4110)
        {
            bool _4126 = _4102 > 0.800000011920928955078125;
            bool _4128 = isnan(_4102);
            bool _4130 = _4126 || _4128;
            bool _4132 = isnan(0.800000011920928955078125);
            bool _4134 = _4130 || _4132;
            bool _4136 = _4104 != 0.0;
            bool _4138 = isnan(_4104);
            bool _4140 = _4136 || _4138;
            bool _4142 = isnan(0.0);
            bool _4144 = _4140 || _4142;
            bool _4146 = !_4134;
            bool _4148 = _4144 || _4146;
            if (_4148)
            {
                _4122 = 1;
            }
            int _4150 = _4122;
            _4124 = _4150;
            if (!_4148)
            {
                float2 _11319 = float2(_138, _4106);
                float2 _4152 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11319, float2(0.0), isnan(_11319)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11319, float2(0.0), isnan(_11319)), level(0.0)).xy;
                float _4154 = _4152.x;
                float _4156 = _4152.y;
                float _4158 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4106);
                _4124 = _4100;
                _4112 = _4154;
                _4114 = _4156;
                _4116 = _4158;
            }
        }
        int _4160 = _4124;
        float _4162 = _4112;
        float _4164 = _4114;
        float _4166 = _4116;
        int _4168 = _4160 & 1;
        bool _4170 = _4168 != 0;
        float _4172 = _4162;
        float _4174 = _4164;
        float _4176 = _4166;
        int _4178 = _4160;
        if (_4170)
        {
            _4118 = _4160;
        }
        int _4180 = _4118;
        int _4182 = _4180;
        int _4184 = _4180;
        if (!_4170)
        {
            bool _4186 = _4162 > 0.800000011920928955078125;
            bool _4188 = isnan(_4162);
            bool _4190 = _4186 || _4188;
            bool _4192 = isnan(0.800000011920928955078125);
            bool _4194 = _4190 || _4192;
            bool _4196 = _4164 != 0.0;
            bool _4198 = isnan(_4164);
            bool _4200 = _4196 || _4198;
            bool _4202 = isnan(0.0);
            bool _4204 = _4200 || _4202;
            bool _4206 = !_4194;
            bool _4208 = _4204 || _4206;
            if (_4208)
            {
                _4182 = 1;
            }
            int _4210 = _4182;
            _4184 = _4210;
            if (!_4208)
            {
                float2 _11398 = float2(_138, _4166);
                float2 _4212 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11398, float2(0.0), isnan(_11398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11398, float2(0.0), isnan(_11398)), level(0.0)).xy;
                float _4214 = _4212.x;
                float _4216 = _4212.y;
                float _4218 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4166);
                _4184 = _4160;
                _4172 = _4214;
                _4174 = _4216;
                _4176 = _4218;
            }
        }
        int _4220 = _4184;
        float _4222 = _4172;
        float _4224 = _4174;
        float _4226 = _4176;
        int _4228 = _4220 & 1;
        bool _4230 = _4228 != 0;
        float _4232 = _4222;
        float _4234 = _4224;
        float _4236 = _4226;
        int _4238 = _4220;
        if (_4230)
        {
            _4178 = _4220;
        }
        int _4240 = _4178;
        int _4242 = _4240;
        int _4244 = _4240;
        if (!_4230)
        {
            bool _4246 = _4222 > 0.800000011920928955078125;
            bool _4248 = isnan(_4222);
            bool _4250 = _4246 || _4248;
            bool _4252 = isnan(0.800000011920928955078125);
            bool _4254 = _4250 || _4252;
            bool _4256 = _4224 != 0.0;
            bool _4258 = isnan(_4224);
            bool _4260 = _4256 || _4258;
            bool _4262 = isnan(0.0);
            bool _4264 = _4260 || _4262;
            bool _4266 = !_4254;
            bool _4268 = _4264 || _4266;
            if (_4268)
            {
                _4242 = 1;
            }
            int _4270 = _4242;
            _4244 = _4270;
            if (!_4268)
            {
                float2 _11477 = float2(_138, _4226);
                float2 _4272 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11477, float2(0.0), isnan(_11477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11477, float2(0.0), isnan(_11477)), level(0.0)).xy;
                float _4274 = _4272.x;
                float _4276 = _4272.y;
                float _4278 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4226);
                _4244 = _4220;
                _4232 = _4274;
                _4234 = _4276;
                _4236 = _4278;
            }
        }
        int _4280 = _4244;
        float _4282 = _4232;
        float _4284 = _4234;
        float _4286 = _4236;
        int _4288 = _4280 & 1;
        bool _4290 = _4288 != 0;
        float _4292 = _4282;
        float _4294 = _4284;
        float _4296 = _4286;
        int _4298 = _4280;
        if (_4290)
        {
            _4238 = _4280;
        }
        int _4300 = _4238;
        int _4302 = _4300;
        int _4304 = _4300;
        if (!_4290)
        {
            bool _4306 = _4282 > 0.800000011920928955078125;
            bool _4308 = isnan(_4282);
            bool _4310 = _4306 || _4308;
            bool _4312 = isnan(0.800000011920928955078125);
            bool _4314 = _4310 || _4312;
            bool _4316 = _4284 != 0.0;
            bool _4318 = isnan(_4284);
            bool _4320 = _4316 || _4318;
            bool _4322 = isnan(0.0);
            bool _4324 = _4320 || _4322;
            bool _4326 = !_4314;
            bool _4328 = _4324 || _4326;
            if (_4328)
            {
                _4302 = 1;
            }
            int _4330 = _4302;
            _4304 = _4330;
            if (!_4328)
            {
                float2 _11556 = float2(_138, _4286);
                float2 _4332 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11556, float2(0.0), isnan(_11556)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11556, float2(0.0), isnan(_11556)), level(0.0)).xy;
                float _4334 = _4332.x;
                float _4336 = _4332.y;
                float _4338 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4286);
                _4304 = _4280;
                _4292 = _4334;
                _4294 = _4336;
                _4296 = _4338;
            }
        }
        int _4340 = _4304;
        float _4342 = _4292;
        float _4344 = _4294;
        float _4346 = _4296;
        int _4348 = _4340 & 1;
        bool _4350 = _4348 != 0;
        float _4352 = _4342;
        float _4354 = _4344;
        float _4356 = _4346;
        int _4358 = _4340;
        if (_4350)
        {
            _4298 = _4340;
        }
        int _4360 = _4298;
        int _4362 = _4360;
        int _4364 = _4360;
        if (!_4350)
        {
            bool _4366 = _4342 > 0.800000011920928955078125;
            bool _4368 = isnan(_4342);
            bool _4370 = _4366 || _4368;
            bool _4372 = isnan(0.800000011920928955078125);
            bool _4374 = _4370 || _4372;
            bool _4376 = _4344 != 0.0;
            bool _4378 = isnan(_4344);
            bool _4380 = _4376 || _4378;
            bool _4382 = isnan(0.0);
            bool _4384 = _4380 || _4382;
            bool _4386 = !_4374;
            bool _4388 = _4384 || _4386;
            if (_4388)
            {
                _4362 = 1;
            }
            int _4390 = _4362;
            _4364 = _4390;
            if (!_4388)
            {
                float2 _11635 = float2(_138, _4346);
                float2 _4392 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11635, float2(0.0), isnan(_11635)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11635, float2(0.0), isnan(_11635)), level(0.0)).xy;
                float _4394 = _4392.x;
                float _4396 = _4392.y;
                float _4398 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4346);
                _4364 = _4340;
                _4352 = _4394;
                _4354 = _4396;
                _4356 = _4398;
            }
        }
        int _4400 = _4364;
        float _4402 = _4352;
        float _4404 = _4354;
        float _4406 = _4356;
        int _4408 = _4400 & 1;
        bool _4410 = _4408 != 0;
        float _4412 = _4402;
        float _4414 = _4404;
        float _4416 = _4406;
        int _4418 = _4400;
        if (_4410)
        {
            _4358 = _4400;
        }
        int _4420 = _4358;
        int _4422 = _4420;
        int _4424 = _4420;
        if (!_4410)
        {
            bool _4426 = _4402 > 0.800000011920928955078125;
            bool _4428 = isnan(_4402);
            bool _4430 = _4426 || _4428;
            bool _4432 = isnan(0.800000011920928955078125);
            bool _4434 = _4430 || _4432;
            bool _4436 = _4404 != 0.0;
            bool _4438 = isnan(_4404);
            bool _4440 = _4436 || _4438;
            bool _4442 = isnan(0.0);
            bool _4444 = _4440 || _4442;
            bool _4446 = !_4434;
            bool _4448 = _4444 || _4446;
            if (_4448)
            {
                _4422 = 1;
            }
            int _4450 = _4422;
            _4424 = _4450;
            if (!_4448)
            {
                float2 _11714 = float2(_138, _4406);
                float2 _4452 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11714, float2(0.0), isnan(_11714)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11714, float2(0.0), isnan(_11714)), level(0.0)).xy;
                float _4454 = _4452.x;
                float _4456 = _4452.y;
                float _4458 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4406);
                _4424 = _4400;
                _4412 = _4454;
                _4414 = _4456;
                _4416 = _4458;
            }
        }
        int _4460 = _4424;
        float _4462 = _4412;
        float _4464 = _4414;
        float _4466 = _4416;
        int _4468 = _4460 & 1;
        bool _4470 = _4468 != 0;
        float _4472 = _4466;
        float _4474 = _4462;
        float _4476 = _4464;
        float _4478 = as_type<float>(_4460);
        if (_3676)
        {
            _3818 = 1;
        }
        int _4480 = _3818;
        int _4482 = _4480;
        if (!_3676)
        {
            _4482 = 0;
        }
        int _4484 = _4482;
        int _4486 = _4484 & 1;
        bool _4488 = _4486 != 0;
        if (_4470)
        {
            _4418 = _4460;
        }
        int _4490 = _4418;
        int _4492 = _4490;
        int _4494 = _4490;
        if (!_4470)
        {
            bool _4496 = _4462 > 0.800000011920928955078125;
            bool _4498 = isnan(_4462);
            bool _4500 = _4496 || _4498;
            bool _4502 = isnan(0.800000011920928955078125);
            bool _4504 = _4500 || _4502;
            bool _4506 = _4464 != 0.0;
            bool _4508 = isnan(_4464);
            bool _4510 = _4506 || _4508;
            bool _4512 = isnan(0.0);
            bool _4514 = _4510 || _4512;
            bool _4516 = !_4504;
            bool _4518 = _4514 || _4516;
            if (_4518)
            {
                _4492 = 1;
            }
            int _4520 = _4492;
            _4494 = _4520;
            if (!_4518)
            {
                float2 _11808 = float2(_138, _4466);
                float2 _4522 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11808, float2(0.0), isnan(_11808)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11808, float2(0.0), isnan(_11808)), level(0.0)).xy;
                float _4524 = _4522.x;
                float _4526 = _4522.y;
                float _4528 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4466);
                _4494 = _4460;
                _4472 = _4528;
                _4474 = _4524;
                _4476 = _4526;
            }
        }
        int _4530 = _4494;
        float _4532 = _4472;
        float _4534 = _4474;
        float _4536 = _4476;
        int _4538 = _4530 & 1;
        bool _4540 = _4538 != 0;
        float _4542 = _4534;
        float _4544 = _4536;
        int _4546 = as_type<int>(_4532);
        int _4548 = _4530;
        if (!_3676)
        {
            float _4550 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3642);
            _3694 = _4550;
        }
        float _4552 = _3694;
        float _4554 = _4552;
        if (_4540)
        {
            _4478 = _4532;
        }
        float _4556 = _4478;
        float _4558 = _4556;
        float _4560 = _4556;
        if (!_4540)
        {
            bool _4562 = _4534 > 0.800000011920928955078125;
            bool _4564 = isnan(_4534);
            bool _4566 = _4562 || _4564;
            bool _4568 = isnan(0.800000011920928955078125);
            bool _4570 = _4566 || _4568;
            bool _4572 = _4536 != 0.0;
            bool _4574 = isnan(_4536);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan(0.0);
            bool _4580 = _4576 || _4578;
            bool _4582 = !_4570;
            bool _4584 = _4580 || _4582;
            if (_4584)
            {
                _4558 = _4532;
            }
            float _4586 = _4558;
            _4560 = _4586;
            if (!_4584)
            {
                float2 _11900 = float2(_138, _4532);
                float2 _4588 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11900, float2(0.0), isnan(_11900)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11900, float2(0.0), isnan(_11900)), level(0.0)).xy;
                float _4590 = _4588.x;
                float _4592 = _4588.y;
                float _4594 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4532);
                _4542 = _4590;
                _4544 = _4592;
                _4560 = _4594;
            }
        }
        float _4596 = _4542;
        float _4598 = _4544;
        float _4600 = _4560;
        if (_4488)
        {
            _4546 = _4484;
        }
        int _4602 = _4546;
        int _4604 = _4602;
        int _4606 = _4602;
        if (!_4488)
        {
            bool _4608 = _3726 > 0.800000011920928955078125;
            bool _4610 = isnan(_3726);
            bool _4612 = _4608 || _4610;
            bool _4614 = isnan(0.800000011920928955078125);
            bool _4616 = _4612 || _4614;
            bool _4618 = _3728 != 0.0;
            bool _4620 = isnan(_3728);
            bool _4622 = _4618 || _4620;
            bool _4624 = isnan(0.0);
            bool _4626 = _4622 || _4624;
            bool _4628 = !_4616;
            bool _4630 = _4626 || _4628;
            if (_4630)
            {
                _4604 = 1;
            }
            int _4632 = _4604;
            _4606 = _4632;
            if (!_4630)
            {
                float2 _11969 = float2(_138, _4552);
                float2 _4634 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11969, float2(0.0), isnan(_11969)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11969, float2(0.0), isnan(_11969)), level(0.0)).xy;
                float _4636 = _4634.x;
                float _4638 = _4634.y;
                float _4640 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4552);
                _4606 = _4484;
                _3762 = _4636;
                _3764 = _4638;
                _4554 = _4640;
            }
        }
        int _4642 = _4606;
        float _4644 = _3762;
        float _4646 = _3764;
        float _4648 = _4554;
        int _4650 = _4642 & 1;
        bool _4652 = _4650 != 0;
        float _4654 = _4644;
        float _4656 = _4646;
        float _4658 = _4648;
        int _4660 = _4642;
        if (_4652)
        {
            _4548 = _4642;
        }
        int _4662 = _4548;
        int _4664 = _4662;
        int _4666 = _4662;
        if (!_4652)
        {
            bool _4668 = _4644 > 0.800000011920928955078125;
            bool _4670 = isnan(_4644);
            bool _4672 = _4668 || _4670;
            bool _4674 = isnan(0.800000011920928955078125);
            bool _4676 = _4672 || _4674;
            bool _4678 = _4646 != 0.0;
            bool _4680 = isnan(_4646);
            bool _4682 = _4678 || _4680;
            bool _4684 = isnan(0.0);
            bool _4686 = _4682 || _4684;
            bool _4688 = !_4676;
            bool _4690 = _4686 || _4688;
            if (_4690)
            {
                _4664 = 1;
            }
            int _4692 = _4664;
            _4666 = _4692;
            if (!_4690)
            {
                float2 _12048 = float2(_138, _4648);
                float2 _4694 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12048, float2(0.0), isnan(_12048)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12048, float2(0.0), isnan(_12048)), level(0.0)).xy;
                float _4696 = _4694.x;
                float _4698 = _4694.y;
                float _4700 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4648);
                _4666 = _4642;
                _4654 = _4696;
                _4656 = _4698;
                _4658 = _4700;
            }
        }
        int _4702 = _4666;
        float _4704 = _4654;
        float _4706 = _4656;
        float _4708 = _4658;
        int _4710 = _4702 & 1;
        bool _4712 = _4710 != 0;
        float _4714 = _4704;
        float _4716 = _4706;
        float _4718 = _4708;
        int _4720 = _4702;
        if (_4712)
        {
            _4660 = _4702;
        }
        int _4722 = _4660;
        int _4724 = _4722;
        int _4726 = _4722;
        if (!_4712)
        {
            bool _4728 = _4704 > 0.800000011920928955078125;
            bool _4730 = isnan(_4704);
            bool _4732 = _4728 || _4730;
            bool _4734 = isnan(0.800000011920928955078125);
            bool _4736 = _4732 || _4734;
            bool _4738 = _4706 != 0.0;
            bool _4740 = isnan(_4706);
            bool _4742 = _4738 || _4740;
            bool _4744 = isnan(0.0);
            bool _4746 = _4742 || _4744;
            bool _4748 = !_4736;
            bool _4750 = _4746 || _4748;
            if (_4750)
            {
                _4724 = 1;
            }
            int _4752 = _4724;
            _4726 = _4752;
            if (!_4750)
            {
                float2 _12127 = float2(_138, _4708);
                float2 _4754 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12127, float2(0.0), isnan(_12127)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12127, float2(0.0), isnan(_12127)), level(0.0)).xy;
                float _4756 = _4754.x;
                float _4758 = _4754.y;
                float _4760 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4708);
                _4726 = _4702;
                _4714 = _4756;
                _4716 = _4758;
                _4718 = _4760;
            }
        }
        int _4762 = _4726;
        float _4764 = _4714;
        float _4766 = _4716;
        float _4768 = _4718;
        int _4770 = _4762 & 1;
        bool _4772 = _4770 != 0;
        float _4774 = _4764;
        float _4776 = _4766;
        float _4778 = _4768;
        int _4780 = _4762;
        if (_4772)
        {
            _4720 = _4762;
        }
        int _4782 = _4720;
        int _4784 = _4782;
        int _4786 = _4782;
        if (!_4772)
        {
            bool _4788 = _4764 > 0.800000011920928955078125;
            bool _4790 = isnan(_4764);
            bool _4792 = _4788 || _4790;
            bool _4794 = isnan(0.800000011920928955078125);
            bool _4796 = _4792 || _4794;
            bool _4798 = _4766 != 0.0;
            bool _4800 = isnan(_4766);
            bool _4802 = _4798 || _4800;
            bool _4804 = isnan(0.0);
            bool _4806 = _4802 || _4804;
            bool _4808 = !_4796;
            bool _4810 = _4806 || _4808;
            if (_4810)
            {
                _4784 = 1;
            }
            int _4812 = _4784;
            _4786 = _4812;
            if (!_4810)
            {
                float2 _12206 = float2(_138, _4768);
                float2 _4814 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12206, float2(0.0), isnan(_12206)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12206, float2(0.0), isnan(_12206)), level(0.0)).xy;
                float _4816 = _4814.x;
                float _4818 = _4814.y;
                float _4820 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4768);
                _4786 = _4762;
                _4774 = _4816;
                _4776 = _4818;
                _4778 = _4820;
            }
        }
        int _4822 = _4786;
        float _4824 = _4774;
        float _4826 = _4776;
        float _4828 = _4778;
        int _4830 = _4822 & 1;
        bool _4832 = _4830 != 0;
        float _4834 = _4824;
        float _4836 = _4826;
        float _4838 = _4828;
        int _4840 = _4822;
        if (_4832)
        {
            _4780 = _4822;
        }
        int _4842 = _4780;
        int _4844 = _4842;
        int _4846 = _4842;
        if (!_4832)
        {
            bool _4848 = _4824 > 0.800000011920928955078125;
            bool _4850 = isnan(_4824);
            bool _4852 = _4848 || _4850;
            bool _4854 = isnan(0.800000011920928955078125);
            bool _4856 = _4852 || _4854;
            bool _4858 = _4826 != 0.0;
            bool _4860 = isnan(_4826);
            bool _4862 = _4858 || _4860;
            bool _4864 = isnan(0.0);
            bool _4866 = _4862 || _4864;
            bool _4868 = !_4856;
            bool _4870 = _4866 || _4868;
            if (_4870)
            {
                _4844 = 1;
            }
            int _4872 = _4844;
            _4846 = _4872;
            if (!_4870)
            {
                float2 _12285 = float2(_138, _4828);
                float2 _4874 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12285, float2(0.0), isnan(_12285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12285, float2(0.0), isnan(_12285)), level(0.0)).xy;
                float _4876 = _4874.x;
                float _4878 = _4874.y;
                float _4880 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4828);
                _4846 = _4822;
                _4834 = _4876;
                _4836 = _4878;
                _4838 = _4880;
            }
        }
        int _4882 = _4846;
        float _4884 = _4834;
        float _4886 = _4836;
        float _4888 = _4838;
        int _4890 = _4882 & 1;
        bool _4892 = _4890 != 0;
        float _4894 = _4884;
        float _4896 = _4886;
        float _4898 = _4888;
        int _4900 = _4882;
        if (_4892)
        {
            _4840 = _4882;
        }
        int _4902 = _4840;
        int _4904 = _4902;
        int _4906 = _4902;
        if (!_4892)
        {
            bool _4908 = _4884 > 0.800000011920928955078125;
            bool _4910 = isnan(_4884);
            bool _4912 = _4908 || _4910;
            bool _4914 = isnan(0.800000011920928955078125);
            bool _4916 = _4912 || _4914;
            bool _4918 = _4886 != 0.0;
            bool _4920 = isnan(_4886);
            bool _4922 = _4918 || _4920;
            bool _4924 = isnan(0.0);
            bool _4926 = _4922 || _4924;
            bool _4928 = !_4916;
            bool _4930 = _4926 || _4928;
            if (_4930)
            {
                _4904 = 1;
            }
            int _4932 = _4904;
            _4906 = _4932;
            if (!_4930)
            {
                float2 _12364 = float2(_138, _4888);
                float2 _4934 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12364, float2(0.0), isnan(_12364)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12364, float2(0.0), isnan(_12364)), level(0.0)).xy;
                float _4936 = _4934.x;
                float _4938 = _4934.y;
                float _4940 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4888);
                _4906 = _4882;
                _4894 = _4936;
                _4896 = _4938;
                _4898 = _4940;
            }
        }
        int _4942 = _4906;
        float _4944 = _4894;
        float _4946 = _4896;
        float _4948 = _4898;
        int _4950 = _4942 & 1;
        bool _4952 = _4950 != 0;
        float _4954 = _4944;
        float _4956 = _4946;
        float _4958 = _4948;
        int _4960 = _4942;
        if (_4952)
        {
            _4900 = _4942;
        }
        int _4962 = _4900;
        int _4964 = _4962;
        int _4966 = _4962;
        if (!_4952)
        {
            bool _4968 = _4944 > 0.800000011920928955078125;
            bool _4970 = isnan(_4944);
            bool _4972 = _4968 || _4970;
            bool _4974 = isnan(0.800000011920928955078125);
            bool _4976 = _4972 || _4974;
            bool _4978 = _4946 != 0.0;
            bool _4980 = isnan(_4946);
            bool _4982 = _4978 || _4980;
            bool _4984 = isnan(0.0);
            bool _4986 = _4982 || _4984;
            bool _4988 = !_4976;
            bool _4990 = _4986 || _4988;
            if (_4990)
            {
                _4964 = 1;
            }
            int _4992 = _4964;
            _4966 = _4992;
            if (!_4990)
            {
                float2 _12443 = float2(_138, _4948);
                float2 _4994 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12443, float2(0.0), isnan(_12443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12443, float2(0.0), isnan(_12443)), level(0.0)).xy;
                float _4996 = _4994.x;
                float _4998 = _4994.y;
                float _5000 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4948);
                _4966 = _4942;
                _4954 = _4996;
                _4956 = _4998;
                _4958 = _5000;
            }
        }
        int _5002 = _4966;
        float _5004 = _4954;
        float _5006 = _4956;
        float _5008 = _4958;
        int _5010 = _5002 & 1;
        bool _5012 = _5010 != 0;
        float _5014 = _5004;
        float _5016 = _5006;
        float _5018 = _5008;
        int _5020 = _5002;
        if (_5012)
        {
            _4960 = _5002;
        }
        int _5022 = _4960;
        int _5024 = _5022;
        int _5026 = _5022;
        if (!_5012)
        {
            bool _5028 = _5004 > 0.800000011920928955078125;
            bool _5030 = isnan(_5004);
            bool _5032 = _5028 || _5030;
            bool _5034 = isnan(0.800000011920928955078125);
            bool _5036 = _5032 || _5034;
            bool _5038 = _5006 != 0.0;
            bool _5040 = isnan(_5006);
            bool _5042 = _5038 || _5040;
            bool _5044 = isnan(0.0);
            bool _5046 = _5042 || _5044;
            bool _5048 = !_5036;
            bool _5050 = _5046 || _5048;
            if (_5050)
            {
                _5024 = 1;
            }
            int _5052 = _5024;
            _5026 = _5052;
            if (!_5050)
            {
                float2 _12522 = float2(_138, _5008);
                float2 _5054 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12522, float2(0.0), isnan(_12522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12522, float2(0.0), isnan(_12522)), level(0.0)).xy;
                float _5056 = _5054.x;
                float _5058 = _5054.y;
                float _5060 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5008);
                _5026 = _5002;
                _5014 = _5056;
                _5016 = _5058;
                _5018 = _5060;
            }
        }
        int _5062 = _5026;
        float _5064 = _5014;
        float _5066 = _5016;
        float _5068 = _5018;
        int _5070 = _5062 & 1;
        bool _5072 = _5070 != 0;
        float _5074 = _5064;
        float _5076 = _5066;
        float _5078 = _5068;
        int _5080 = _5062;
        if (_5072)
        {
            _5020 = _5062;
        }
        int _5082 = _5020;
        int _5084 = _5082;
        int _5086 = _5082;
        if (!_5072)
        {
            bool _5088 = _5064 > 0.800000011920928955078125;
            bool _5090 = isnan(_5064);
            bool _5092 = _5088 || _5090;
            bool _5094 = isnan(0.800000011920928955078125);
            bool _5096 = _5092 || _5094;
            bool _5098 = _5066 != 0.0;
            bool _5100 = isnan(_5066);
            bool _5102 = _5098 || _5100;
            bool _5104 = isnan(0.0);
            bool _5106 = _5102 || _5104;
            bool _5108 = !_5096;
            bool _5110 = _5106 || _5108;
            if (_5110)
            {
                _5084 = 1;
            }
            int _5112 = _5084;
            _5086 = _5112;
            if (!_5110)
            {
                float2 _12601 = float2(_138, _5068);
                float2 _5114 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12601, float2(0.0), isnan(_12601)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12601, float2(0.0), isnan(_12601)), level(0.0)).xy;
                float _5116 = _5114.x;
                float _5118 = _5114.y;
                float _5120 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5068);
                _5086 = _5062;
                _5074 = _5116;
                _5076 = _5118;
                _5078 = _5120;
            }
        }
        int _5122 = _5086;
        float _5124 = _5074;
        float _5126 = _5076;
        float _5128 = _5078;
        int _5130 = _5122 & 1;
        bool _5132 = _5130 != 0;
        float _5134 = _5124;
        float _5136 = _5126;
        float _5138 = _5128;
        int _5140 = _5122;
        if (_5132)
        {
            _5080 = _5122;
        }
        int _5142 = _5080;
        int _5144 = _5142;
        int _5146 = _5142;
        if (!_5132)
        {
            bool _5148 = _5124 > 0.800000011920928955078125;
            bool _5150 = isnan(_5124);
            bool _5152 = _5148 || _5150;
            bool _5154 = isnan(0.800000011920928955078125);
            bool _5156 = _5152 || _5154;
            bool _5158 = _5126 != 0.0;
            bool _5160 = isnan(_5126);
            bool _5162 = _5158 || _5160;
            bool _5164 = isnan(0.0);
            bool _5166 = _5162 || _5164;
            bool _5168 = !_5156;
            bool _5170 = _5166 || _5168;
            if (_5170)
            {
                _5144 = 1;
            }
            int _5172 = _5144;
            _5146 = _5172;
            if (!_5170)
            {
                float2 _12680 = float2(_138, _5128);
                float2 _5174 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12680, float2(0.0), isnan(_12680)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12680, float2(0.0), isnan(_12680)), level(0.0)).xy;
                float _5176 = _5174.x;
                float _5178 = _5174.y;
                float _5180 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5128);
                _5146 = _5122;
                _5134 = _5176;
                _5136 = _5178;
                _5138 = _5180;
            }
        }
        int _5182 = _5146;
        float _5184 = _5134;
        float _5186 = _5136;
        float _5188 = _5138;
        int _5190 = _5182 & 1;
        bool _5192 = _5190 != 0;
        float _5194 = _5184;
        float _5196 = _5186;
        float _5198 = _5188;
        int _5200 = _5182;
        if (_5192)
        {
            _5140 = _5182;
        }
        int _5202 = _5140;
        int _5204 = _5202;
        int _5206 = _5202;
        if (!_5192)
        {
            bool _5208 = _5184 > 0.800000011920928955078125;
            bool _5210 = isnan(_5184);
            bool _5212 = _5208 || _5210;
            bool _5214 = isnan(0.800000011920928955078125);
            bool _5216 = _5212 || _5214;
            bool _5218 = _5186 != 0.0;
            bool _5220 = isnan(_5186);
            bool _5222 = _5218 || _5220;
            bool _5224 = isnan(0.0);
            bool _5226 = _5222 || _5224;
            bool _5228 = !_5216;
            bool _5230 = _5226 || _5228;
            if (_5230)
            {
                _5204 = 1;
            }
            int _5232 = _5204;
            _5206 = _5232;
            if (!_5230)
            {
                float2 _12759 = float2(_138, _5188);
                float2 _5234 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12759, float2(0.0), isnan(_12759)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12759, float2(0.0), isnan(_12759)), level(0.0)).xy;
                float _5236 = _5234.x;
                float _5238 = _5234.y;
                float _5240 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5188);
                _5206 = _5182;
                _5194 = _5236;
                _5196 = _5238;
                _5198 = _5240;
            }
        }
        int _5242 = _5206;
        float _5244 = _5194;
        float _5246 = _5196;
        float _5248 = _5198;
        int _5250 = _5242 & 1;
        bool _5252 = _5250 != 0;
        float _5254 = _5244;
        float _5256 = _5246;
        float _5258 = _5248;
        int _5260 = _5242;
        if (_5252)
        {
            _5200 = _5242;
        }
        int _5262 = _5200;
        int _5264 = _5262;
        int _5266 = _5262;
        if (!_5252)
        {
            bool _5268 = _5244 > 0.800000011920928955078125;
            bool _5270 = isnan(_5244);
            bool _5272 = _5268 || _5270;
            bool _5274 = isnan(0.800000011920928955078125);
            bool _5276 = _5272 || _5274;
            bool _5278 = _5246 != 0.0;
            bool _5280 = isnan(_5246);
            bool _5282 = _5278 || _5280;
            bool _5284 = isnan(0.0);
            bool _5286 = _5282 || _5284;
            bool _5288 = !_5276;
            bool _5290 = _5286 || _5288;
            if (_5290)
            {
                _5264 = 1;
            }
            int _5292 = _5264;
            _5266 = _5292;
            if (!_5290)
            {
                float2 _12838 = float2(_138, _5248);
                float2 _5294 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12838, float2(0.0), isnan(_12838)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12838, float2(0.0), isnan(_12838)), level(0.0)).xy;
                float _5296 = _5294.x;
                float _5298 = _5294.y;
                float _5300 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5248);
                _5266 = _5242;
                _5254 = _5296;
                _5256 = _5298;
                _5258 = _5300;
            }
        }
        int _5302 = _5266;
        float _5304 = _5254;
        float _5306 = _5256;
        float _5308 = _5258;
        int _5310 = _5302 & 1;
        bool _5312 = _5310 != 0;
        float _5314 = _5308;
        float _5316 = _5304;
        float _5318 = _5306;
        if (_5312)
        {
            _5260 = _5302;
        }
        int _5320 = _5260;
        int _5322 = _5320;
        int _5324 = _5320;
        if (!_5312)
        {
            bool _5326 = _5304 > 0.800000011920928955078125;
            bool _5328 = isnan(_5304);
            bool _5330 = _5326 || _5328;
            bool _5332 = isnan(0.800000011920928955078125);
            bool _5334 = _5330 || _5332;
            bool _5336 = _5306 != 0.0;
            bool _5338 = isnan(_5306);
            bool _5340 = _5336 || _5338;
            bool _5342 = isnan(0.0);
            bool _5344 = _5340 || _5342;
            bool _5346 = !_5334;
            bool _5348 = _5344 || _5346;
            if (_5348)
            {
                _5322 = 1;
            }
            int _5350 = _5322;
            _5324 = _5350;
            if (!_5348)
            {
                float2 _12916 = float2(_138, _5308);
                float2 _5352 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12916, float2(0.0), isnan(_12916)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12916, float2(0.0), isnan(_12916)), level(0.0)).xy;
                float _5354 = _5352.x;
                float _5356 = _5352.y;
                float _5358 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5308);
                _5324 = _5302;
                _5314 = _5358;
                _5316 = _5354;
                _5318 = _5356;
            }
        }
        int _5360 = _5324;
        float _5362 = _5314;
        float _5364 = _5316;
        float _5366 = _5318;
        int _5368 = _5360 & 1;
        bool _5370 = _5368 != 0;
        float _5372 = _5366;
        float _5374 = _5364;
        if (_5370)
        {
            _3696 = _5362;
        }
        float _5376 = _3696;
        float _5378 = _5376;
        float _5380 = _5376;
        if (!_5370)
        {
            bool _5382 = _5364 > 0.800000011920928955078125;
            bool _5384 = isnan(_5364);
            bool _5386 = _5382 || _5384;
            bool _5388 = isnan(0.800000011920928955078125);
            bool _5390 = _5386 || _5388;
            bool _5392 = _5366 != 0.0;
            bool _5394 = isnan(_5366);
            bool _5396 = _5392 || _5394;
            bool _5398 = isnan(0.0);
            bool _5400 = _5396 || _5398;
            bool _5402 = !_5390;
            bool _5404 = _5400 || _5402;
            if (_5404)
            {
                _5378 = _5362;
            }
            float _5406 = _5378;
            _5380 = _5406;
            if (!_5404)
            {
                float2 _12994 = float2(_138, _5362);
                float2 _5408 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12994, float2(0.0), isnan(_12994)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12994, float2(0.0), isnan(_12994)), level(0.0)).xy;
                float _5410 = _5408.x;
                float _5412 = _5408.y;
                float _5414 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5362);
                _5372 = _5412;
                _5374 = _5410;
                _5380 = _5414;
            }
        }
        float _5416 = _5372;
        float _5418 = _5374;
        float _5420 = _5380;
        float _5422 = fma(_5416, 0.5, 0.5234375);
        float _5424 = fma(_5418, 2.0, 0.03125);
        float _5426 = fma(_4596, 2.0, 0.03125);
        float _5428 = fma(_4598, 0.5, 0.0078125);
        float2 _13026 = float2(_5422, _5424);
        float _5430 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_13026, float2(0.0), isnan(_13026)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_13026, float2(0.0), isnan(_13026)), level(0.0)).x;
        float2 _13034 = float2(_5428, _5426);
        float _5432 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_13034, float2(0.0), isnan(_13034)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_13034, float2(0.0), isnan(_13034)), level(0.0)).x;
        float _5434 = fma(_5430, -2.007874011993408203125, 3.25);
        float _5436 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _5438 = fma(_5434, _5436, _5420);
        float2 _13051 = float2(_140, _5438);
        float _5440 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13051, float2(0.0), isnan(_13051)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13051, float2(0.0), isnan(_13051)), level(0.0), int2(0, 1)).y;
        float _5442 = fma(_5432, -2.007874011993408203125, 3.25);
        float _5444 = fma(_5442, (*spvDescriptorSet0.cp_c3)._m0[0].w, _4600);
        float2 _13066 = float2(_140, _5444);
        float _5446 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13066, float2(0.0), isnan(_13066)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13066, float2(0.0), isnan(_13066)), level(0.0)).y;
        float _5448 = -_128;
        float _5450 = fma(_5444, (*spvDescriptorSet0.cp_c3)._m0[0].y, _5448);
        float _5452 = -_128;
        float _5454 = fma(_5438, (*spvDescriptorSet0.cp_c3)._m0[0].y, _5452);
        float _5456 = rint(_5454);
        float _5458 = rint(_5450);
        float _5460 = abs(_5456);
        float _5462 = sqrt(_5460);
        float _5464 = abs(_5458);
        float _5466 = sqrt(_5464);
        float _5468 = _5440 * 4.0;
        float _5470 = rint(_5468);
        float _5472 = _5446 * 4.0;
        float _5474 = rint(_5472);
        float _5476 = fma(_5470, 16.0, _5462);
        float _5478 = fma(_5476, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _5480 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _5478);
        float _5482 = fma(_5474, 16.0, _5466);
        float2 _13120 = float2(_126, _5444);
        float _5484 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13120, float2(0.0), isnan(_13120)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13120, float2(0.0), isnan(_13120)), level(0.0), int2(1, 0)).y;
        float _5486 = fma(_5482, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _13130 = float2(_126, _5444);
        float _5488 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13130, float2(0.0), isnan(_13130)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13130, float2(0.0), isnan(_13130)), level(0.0), int2(-2, 0)).y;
        float2 _13139 = float2(_126, _5438);
        float _5490 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13139, float2(0.0), isnan(_13139)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13139, float2(0.0), isnan(_13139)), level(0.0), int2(1)).y;
        float2 _13147 = float2(_126, _5438);
        float _5492 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13147, float2(0.0), isnan(_13147)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13147, float2(0.0), isnan(_13147)), level(0.0), int2(-2, 1)).y;
        float2 _13156 = float2(_5486, _5480);
        float2 _5494 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_13156, float2(0.0), isnan(_13156)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_13156, float2(0.0), isnan(_13156)), level(0.0)).xy;
        float _5496 = _5494.x;
        float _5498 = _5494.y;
        float _5500 = abs(_5456);
        float _5502 = abs(_5458);
        bool _5504 = _5500 >= _5502;
        bool _5506 = isnan(_5500);
        bool _5508 = _5504 || _5506;
        bool _5510 = isnan(_5502);
        bool _5512 = _5508 || _5510;
        float _5514 = float(_5512);
        float _5516 = abs(_5458);
        float _5518 = abs(_5456);
        bool _5520 = _5516 >= _5518;
        bool _5522 = isnan(_5516);
        bool _5524 = _5520 || _5522;
        bool _5526 = isnan(_5518);
        bool _5528 = _5524 || _5526;
        float _5530 = float(_5528);
        float _5532 = _5514 + _5530;
        float _5534 = 1.0 / _5532;
        float _5536 = _5534 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        float _5538 = _5514 * _5536;
        float _5540 = _5530 * _5536;
        float _5542 = -_5538;
        float _5544 = fma(_5542, _5484, 1.0);
        float _5546 = -_5538;
        float _5548 = fma(_5546, _5488, 1.0);
        float _5550 = -_5540;
        float _5552 = fma(_5550, _5490, _5544);
        float _5554 = precise::clamp(_5552, 0.0, 1.0);
        float _5556 = -_5540;
        float _5558 = fma(_5556, _5492, _5548);
        float _5560 = precise::clamp(_5558, 0.0, 1.0);
        float _5562 = _5496 * _5554;
        float _5564 = _5498 * _5560;
        _5566 = _5562;
        _5568 = _5564;
        _5570 = true;
    }
    else
    {
        _5566 = 0.0;
        _5568 = 0.0;
    }
    _5570 = false;
    float _5572 = _5566;
    float _5574 = _5568;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3614, _3616, _5572, _5574), uint2(int2(_114, _118)));
}

