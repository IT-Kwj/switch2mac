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
int _48(thread const int& _11923, thread const int& _11924, constant _10& support_buffer)
{
    int _11927 = 1 + _11924;
    float _11929 = support_buffer._m5[_11927].x;
    bool _11931 = _11929 == 1.0;
    if (_11931)
    {
        return _11923;
    }
    float _11933 = float(_11923);
    float _11935 = _11933 * _11929;
    int _11937 = int(_11935);
    return _11937;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _5054 = false;
    bool _970 = false;
    bool _780 = false;
    bool _476 = false;
    bool _322 = false;
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
    int _80 = _78 & 1023;
    int _82 = _72 + _80;
    int _84 = _72 & 1023;
    int _86 = _82 >> 10;
    int _88 = _84;
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
    float2 _5160 = float2(_126, _130);
    float2 _132 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5160, float2(0.0), isnan(_5160)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5160, float2(0.0), isnan(_5160)), level(0.0)).xy;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _126);
    float _140 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _130);
    float _142 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.25, _126);
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
    float _164 = _140;
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
            float2 _5268 = float2(_206, _208);
            float2 _210 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5268, float2(0.0), isnan(_5268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5268, float2(0.0), isnan(_5268)), level(0.0)).xy;
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
            float _304;
            float _320;
            if (!_230)
            {
                float _238 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _240 = _206 + _238;
                float _242 = _208 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _5314 = float2(_240, _242);
                float2 _244 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5314, float2(0.0), isnan(_5314)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5314, float2(0.0), isnan(_5314)), level(0.0)).xy;
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
                    float2 _5360 = float2(_268, _270);
                    float2 _272 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5360, float2(0.0), isnan(_5360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5360, float2(0.0), isnan(_5360)), level(0.0)).xy;
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
                        float2 _5406 = float2(_296, _298);
                        float2 _300 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5406, float2(0.0), isnan(_5406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5406, float2(0.0), isnan(_5406)), level(0.0)).xy;
                        float _302 = _300.x;
                        _304 = _300.y;
                        float _306 = _304 + _302;
                        float _308 = _306 * 0.5;
                        bool _310 = _308 >= 0.89999997615814208984375;
                        bool _312 = isnan(_308);
                        bool _314 = _310 || _312;
                        bool _316 = isnan(0.89999997615814208984375);
                        bool _318 = _314 || _316;
                        _232 = _304;
                        _236 = _308;
                        _320 = _308;
                        _322 = _318;
                        if (!_322)
                        {
                            _234 = 3.0;
                        }
                    }
                }
            }
            float _330;
            float _332;
            if (!_322)
            {
                float _324 = _232;
                float _326 = _234;
                float _328 = _236;
                _330 = _324;
                _332 = _326;
                _320 = _328;
            }
            if (false || _322)
            {
                _322 = false;
                _330 = _304;
                _332 = 3.0;
            }
            float _334 = _330;
            float _336 = _332;
            float _338 = _320;
            bool _340 = _334 >= 0.89999997615814208984375;
            bool _342 = isnan(_334);
            bool _344 = _340 || _342;
            bool _346 = isnan(0.89999997615814208984375);
            bool _348 = _344 || _346;
            float _350 = float(_348);
            float _352 = _350 + _336;
            _194 = _352;
            _202 = _338;
        }
        float _354 = _194;
        float _356 = _202;
        float _358 = _126 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _360 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _362 = _130 + _360;
        float2 _5495 = float2(_358, _362);
        float2 _364 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5495, float2(0.0), isnan(_5495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5495, float2(0.0), isnan(_5495)), level(0.0)).xy;
        float _366 = _364.x;
        float _368 = _364.y;
        float _370 = _366 + _368;
        float _372 = _370 * 0.5;
        bool _374 = _372 >= 0.89999997615814208984375;
        bool _376 = isnan(_372);
        bool _378 = _374 || _376;
        bool _380 = isnan(0.89999997615814208984375);
        bool _382 = _378 || _380;
        bool _384 = !_382;
        float _386 = 0.0;
        float _388 = _372;
        float _390 = _368;
        float _392 = _356;
        if (!_384)
        {
            float _394 = _358 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _396 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _398 = _362 + _396;
            float2 _5541 = float2(_394, _398);
            float2 _400 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5541, float2(0.0), isnan(_5541)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5541, float2(0.0), isnan(_5541)), level(0.0)).xy;
            float _402 = _400.x;
            float _404 = _400.y;
            float _406 = _404 + _402;
            float _408 = _406 * 0.5;
            bool _410 = _408 >= 0.89999997615814208984375;
            bool _412 = isnan(_408);
            bool _414 = _410 || _412;
            bool _416 = isnan(0.89999997615814208984375);
            bool _418 = _414 || _416;
            bool _420 = !_418;
            _386 = 1.0;
            _388 = _408;
            _390 = _398;
            if (!_420)
            {
                float _422 = _394 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _424 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _426 = _398 + _424;
                float2 _5586 = float2(_422, _426);
                float2 _428 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5586, float2(0.0), isnan(_5586)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5586, float2(0.0), isnan(_5586)), level(0.0)).xy;
                float _430 = _428.x;
                float _432 = _428.y;
                float _434 = _432 + _430;
                float _436 = _434 * 0.5;
                bool _438 = _436 >= 0.89999997615814208984375;
                bool _440 = isnan(_436);
                bool _442 = _438 || _440;
                bool _444 = isnan(0.89999997615814208984375);
                bool _446 = _442 || _444;
                bool _448 = !_446;
                _386 = 2.0;
                _388 = _436;
                _390 = _426;
                if (!_448)
                {
                    float _450 = _422 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _452 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _454 = _426 + _452;
                    float2 _5631 = float2(_450, _454);
                    float2 _456 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5631, float2(0.0), isnan(_5631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5631, float2(0.0), isnan(_5631)), level(0.0)).xy;
                    float _458 = _456.x;
                    float _460 = _456.y;
                    float _462 = _460 + _458;
                    float _464 = _462 * 0.5;
                    bool _466 = _464 >= 0.89999997615814208984375;
                    bool _468 = isnan(_464);
                    bool _470 = _466 || _468;
                    bool _472 = isnan(0.89999997615814208984375);
                    bool _474 = _470 || _472;
                    _388 = _464;
                    _390 = _460;
                    if (!_474)
                    {
                        _386 = 3.0;
                        _476 = true;
                    }
                    else
                    {
                        _386 = 3.0;
                    }
                }
            }
        }
        _476 = false;
        float _478 = _386;
        float _480 = _388;
        float _482 = _390;
        float _484 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 0.25, _126);
        float _486 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _488 = _484 + _486;
        float2 _5684 = float2(_488, _362);
        float2 _490 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5684, float2(0.0), isnan(_5684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5684, float2(0.0), isnan(_5684)), level(0.0)).xy;
        float _492 = _490.x;
        float _494 = _490.y;
        float _496 = _354 + _478;
        bool _498 = _496 > 2.0;
        float _500 = _496;
        float _502 = _482;
        float _504 = _488;
        int _506 = 1084227584;
        int _508 = 1084227584;
        if (!_498)
        {
            _500 = 0.0;
            _502 = 0.0;
        }
        float _510 = _500;
        float _512 = _502;
        bool _514 = !_498;
        float _516 = _510;
        float _518 = _512;
        if (!_514)
        {
            float _520 = -_478;
            float _522 = _520 + (-0.25);
            float _524 = -_354;
            float _526 = _524 + 0.25;
            float _528 = fma(_478, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _530 = fma(_522, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _532 = fma(_354, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _534 = fma(_526, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float2 _5746 = float2(_534, _532);
            float2 _536 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5746, float2(0.0), isnan(_5746)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5746, float2(0.0), isnan(_5746)), level(0.0), int2(-1, 0)).xy;
            float _538 = _536.x;
            float _540 = _536.y;
            float2 _5760 = float2(_528, _530);
            float2 _542 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5760, float2(0.0), isnan(_5760)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5760, float2(0.0), isnan(_5760)), level(0.0), int2(1, 0)).xy;
            float _544 = _542.x;
            float _546 = _542.y;
            float _548 = fma(_544, 5.0, -3.75);
            float _550 = rint(_540);
            float _552 = abs(_548);
            float _554 = _544 * _552;
            float _556 = fma(_538, 5.0, -3.75);
            float _558 = abs(_556);
            float _560 = _538 * _558;
            float _562 = rint(_546);
            bool _564 = _480 <= 0.89999997615814208984375;
            bool _566 = isnan(_480);
            bool _568 = _564 || _566;
            bool _570 = isnan(0.89999997615814208984375);
            bool _572 = _568 || _570;
            float _574 = float(_572);
            bool _576 = _356 <= 0.89999997615814208984375;
            bool _578 = isnan(_356);
            bool _580 = _576 || _578;
            bool _582 = isnan(0.89999997615814208984375);
            bool _584 = _580 || _582;
            float _586 = float(_584);
            float _588 = rint(_554);
            float _590 = rint(_560);
            float _592 = fma(_562, 2.0, _588);
            float _594 = _592 * _574;
            float _596 = fma(_550, 2.0, _590);
            float _598 = fma(_594, 20.0, _478);
            float _600 = _596 * _586;
            float _602 = fma(_598, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _604 = fma(_600, 20.0, _354);
            float _606 = fma((*spvDescriptorSet0.cp_c3)._m0[3].z, 0.14285714924335479736328125, _602);
            float _608 = fma(_604, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _610 = _608 + 0.5;
            float2 _5857 = float2(_610, _606);
            float2 _612 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_5857, float2(0.0), isnan(_5857)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_5857, float2(0.0), isnan(_5857)), level(0.0)).xy;
            float _614 = _612.x;
            float _616 = _612.y;
            _392 = 0.0062500000931322574615478515625;
            _516 = _614;
            _518 = _616;
        }
        float _618 = _392;
        float _620 = _516;
        float _622 = _518;
        float _624 = fma(_492, 5.0, -3.75);
        float _626 = rint(_494);
        float _628 = abs(_624);
        float _630 = _492 * _628;
        float _632 = rint(_630);
        float _634 = _632 + _626;
        float _636 = _634 * 0.5;
        bool _638 = _636 >= 0.89999997615814208984375;
        bool _640 = isnan(_636);
        bool _642 = _638 || _640;
        bool _644 = isnan(0.89999997615814208984375);
        bool _646 = _642 || _644;
        bool _648 = !_646;
        float _650 = _618;
        float _652 = _632;
        float _654 = 0.0;
        float _656 = _636;
        float _658 = _622;
        float _660 = _620;
        if (!_648)
        {
            float _662 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _664 = _488 + _662;
            float _666 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _668 = _362 + _666;
            float2 _5924 = float2(_664, _668);
            float2 _670 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5924, float2(0.0), isnan(_5924)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5924, float2(0.0), isnan(_5924)), level(0.0)).xy;
            float _672 = _670.x;
            float _674 = _670.y;
            float _676 = fma(_672, 5.0, -3.75);
            float _678 = rint(_674);
            float _680 = abs(_676);
            float _682 = _672 * _680;
            float _684 = rint(_682);
            float _686 = _684 + _678;
            float _688 = _686 * 0.5;
            bool _690 = _688 >= 0.89999997615814208984375;
            bool _692 = isnan(_688);
            bool _694 = _690 || _692;
            bool _696 = isnan(0.89999997615814208984375);
            bool _698 = _694 || _696;
            bool _700 = !_698;
            _650 = _684;
            _652 = _678;
            _654 = 1.0;
            _504 = _664;
            _656 = _688;
            if (!_700)
            {
                float _702 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _704 = _664 + _702;
                float _706 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _708 = _668 + _706;
                float2 _5984 = float2(_704, _708);
                float2 _710 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5984, float2(0.0), isnan(_5984)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5984, float2(0.0), isnan(_5984)), level(0.0)).xy;
                float _712 = _710.x;
                float _714 = _710.y;
                float _716 = fma(_712, 5.0, -3.75);
                float _718 = rint(_714);
                float _720 = abs(_716);
                float _722 = _712 * _720;
                float _724 = rint(_722);
                float _726 = _724 + _718;
                float _728 = _726 * 0.5;
                bool _730 = _728 >= 0.89999997615814208984375;
                bool _732 = isnan(_728);
                bool _734 = _730 || _732;
                bool _736 = isnan(0.89999997615814208984375);
                bool _738 = _734 || _736;
                bool _740 = !_738;
                _650 = _724;
                _652 = _718;
                _654 = 2.0;
                _504 = _704;
                _656 = _728;
                if (!_740)
                {
                    float _742 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _744 = _704 + _742;
                    float _746 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _748 = _708 + _746;
                    float2 _6044 = float2(_744, _748);
                    float2 _750 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6044, float2(0.0), isnan(_6044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6044, float2(0.0), isnan(_6044)), level(0.0)).xy;
                    float _752 = _750.x;
                    float _754 = _750.y;
                    float _756 = fma(_752, 5.0, -3.75);
                    float _758 = rint(_754);
                    float _760 = abs(_756);
                    float _762 = _752 * _760;
                    float _764 = rint(_762);
                    float _766 = _764 + _758;
                    float _768 = _766 * 0.5;
                    bool _770 = _768 >= 0.89999997615814208984375;
                    bool _772 = isnan(_768);
                    bool _774 = _770 || _772;
                    bool _776 = isnan(0.89999997615814208984375);
                    bool _778 = _774 || _776;
                    _504 = _754;
                    _656 = _768;
                    if (!_778)
                    {
                        _654 = 3.0;
                        _780 = true;
                    }
                    else
                    {
                        _654 = 3.0;
                    }
                }
            }
        }
        _780 = false;
        float _782 = _650;
        float _784 = _652;
        float _786 = _654;
        float _788 = _504;
        float _790 = _656;
        float2 _6098 = float2(_126, _130);
        float _792 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6098, float2(0.0), isnan(_6098)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6098, float2(0.0), isnan(_6098)), level(0.0), int2(1, 0)).x;
        bool _794 = _792 > 0.0;
        float _796 = _788;
        float _798 = _792;
        float _800 = _782;
        float _802 = _784;
        int _804 = as_type<int>(_786);
        int _806 = as_type<int>(_790);
        if (!_794)
        {
            _796 = 0.0;
            _798 = 0.0;
        }
        float _808 = _796;
        float _810 = _798;
        bool _812 = !_794;
        float _814 = _808;
        float _816 = _810;
        if (!_812)
        {
            float _818 = _484 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _820 = _130 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _6137 = float2(_818, _820);
            float2 _822 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6137, float2(0.0), isnan(_6137)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6137, float2(0.0), isnan(_6137)), level(0.0)).xy;
            float _824 = _822.x;
            float _826 = _822.y;
            float _828 = fma(_824, 5.0, -3.75);
            float _830 = rint(_826);
            float _832 = abs(_828);
            float _834 = _824 * _832;
            float _836 = rint(_834);
            float _838 = _836 + _830;
            float _840 = _838 * 0.5;
            bool _842 = _840 >= 0.89999997615814208984375;
            bool _844 = isnan(_840);
            bool _846 = _842 || _844;
            bool _848 = isnan(0.89999997615814208984375);
            bool _850 = _846 || _848;
            bool _852 = !_850;
            float _854 = _830;
            float _856 = 0.0;
            float _858 = _840;
            float _860 = _836;
            float _862 = _826;
            if (!_852)
            {
                float _864 = _818 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _866 = _820 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _6193 = float2(_864, _866);
                float2 _868 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6193, float2(0.0), isnan(_6193)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6193, float2(0.0), isnan(_6193)), level(0.0)).xy;
                float _870 = _868.x;
                float _872 = _868.y;
                float _874 = fma(_870, 5.0, -3.75);
                float _876 = rint(_872);
                float _878 = abs(_874);
                float _880 = _870 * _878;
                float _882 = rint(_880);
                float _884 = _882 + _876;
                float _886 = _884 * 0.5;
                bool _888 = _886 >= 0.89999997615814208984375;
                bool _890 = isnan(_886);
                bool _892 = _888 || _890;
                bool _894 = isnan(0.89999997615814208984375);
                bool _896 = _892 || _894;
                bool _898 = !_896;
                _854 = _876;
                _856 = 1.0;
                _858 = _886;
                _860 = _864;
                _862 = _866;
                if (!_898)
                {
                    float _900 = _864 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _902 = _866 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _6249 = float2(_900, _902);
                    float2 _904 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6249, float2(0.0), isnan(_6249)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6249, float2(0.0), isnan(_6249)), level(0.0)).xy;
                    float _906 = _904.x;
                    float _908 = _904.y;
                    float _910 = fma(_906, 5.0, -3.75);
                    float _912 = rint(_908);
                    float _914 = abs(_910);
                    float _916 = _906 * _914;
                    float _918 = rint(_916);
                    float _920 = _918 + _912;
                    float _922 = _920 * 0.5;
                    bool _924 = _922 >= 0.89999997615814208984375;
                    bool _926 = isnan(_922);
                    bool _928 = _924 || _926;
                    bool _930 = isnan(0.89999997615814208984375);
                    bool _932 = _928 || _930;
                    bool _934 = !_932;
                    _854 = _912;
                    _856 = 2.0;
                    _858 = _922;
                    _860 = _900;
                    _862 = _902;
                    if (!_934)
                    {
                        float _936 = _900 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _938 = _902 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _6305 = float2(_936, _938);
                        float2 _940 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6305, float2(0.0), isnan(_6305)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6305, float2(0.0), isnan(_6305)), level(0.0)).xy;
                        float _942 = _940.x;
                        float _944 = _940.y;
                        float _946 = fma(_942, 5.0, -3.75);
                        float _948 = rint(_944);
                        float _950 = abs(_946);
                        float _952 = _942 * _950;
                        float _954 = rint(_952);
                        float _956 = _954 + _948;
                        float _958 = _956 * 0.5;
                        bool _960 = _958 >= 0.89999997615814208984375;
                        bool _962 = isnan(_958);
                        bool _964 = _960 || _962;
                        bool _966 = isnan(0.89999997615814208984375);
                        bool _968 = _964 || _966;
                        _854 = _948;
                        _858 = _958;
                        _860 = _942;
                        _862 = _944;
                        _506 = as_type<int>(_954);
                        if (!_968)
                        {
                            _856 = 3.0;
                            _970 = true;
                        }
                        else
                        {
                            _856 = 3.0;
                        }
                    }
                }
            }
            _970 = false;
            float _972 = _854;
            float _974 = _856;
            float _976 = _858;
            float _978 = _860;
            float _980 = _862;
            int _982 = _506;
            bool _984 = _972 >= 0.89999997615814208984375;
            bool _986 = isnan(_972);
            bool _988 = _984 || _986;
            bool _990 = isnan(0.89999997615814208984375);
            bool _992 = _988 || _990;
            float _994 = float(_992);
            float _996 = _994 + _974;
            _814 = _996;
            _816 = _976;
            _800 = _978;
            _802 = _980;
            _508 = _982;
        }
        float _998 = _814;
        float _1000 = _816;
        float _1002 = _800;
        float _1004 = _802;
        int _1006 = _508;
        float _1008 = _786 + _998;
        bool _1010 = _1008 > 2.0;
        bool _1012 = !_1010;
        float _1014 = _1002;
        float _1016 = _1004;
        int _1018 = _1006;
        if (!_1012)
        {
            float _1020 = fma(_998, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _1022 = fma(_998, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float _1024 = -_786;
            float _1026 = fma(_1024, (*spvDescriptorSet0.cp_c3)._m0[0].z, _126);
            float _1028 = -_786;
            float _1030 = fma(_1028, (*spvDescriptorSet0.cp_c3)._m0[0].w, _130);
            float2 _6428 = float2(_1020, _1022);
            float2 _1032 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0), int2(1, 0)).xy;
            float _1034 = _1032.x;
            float _1036 = _1032.y;
            float2 _6440 = float2(_1026, _1030);
            float _1038 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6440, float2(0.0), isnan(_6440)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6440, float2(0.0), isnan(_6440)), level(0.0), int2(-1, 0)).y;
            float2 _6448 = float2(_1026, _1030);
            float _1040 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6448, float2(0.0), isnan(_6448)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6448, float2(0.0), isnan(_6448)), level(0.0), int2(0, -1)).x;
            bool _1042 = _1000 >= 0.89999997615814208984375;
            bool _1044 = isnan(_1000);
            bool _1046 = _1042 || _1044;
            bool _1048 = isnan(0.89999997615814208984375);
            bool _1050 = _1046 || _1048;
            float _1052 = float(_1050);
            bool _1054 = _790 >= 0.89999997615814208984375;
            bool _1056 = isnan(_790);
            bool _1058 = _1054 || _1056;
            bool _1060 = isnan(0.89999997615814208984375);
            bool _1062 = _1058 || _1060;
            float _1064 = float(_1062);
            float _1066 = fma(_1036, 2.0, _1034);
            float _1068 = fma(_1038, 2.0, _1040);
            float _1070 = _1066 * _1052;
            float _1072 = _1068 * _1064;
            float _1074 = fma(_1070, 20.0, _998);
            float _1076 = fma(_1072, 20.0, _786);
            float _1078 = fma(_1074, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _1080 = fma(_1076, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float _1082 = fma((*spvDescriptorSet0.cp_c3)._m0[3].w, 0.14285714924335479736328125, _1078);
            float _1084 = _1080 + 0.5;
            float2 _6511 = float2(_1084, _1082);
            float2 _1086 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_6511, float2(0.0), isnan(_6511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_6511, float2(0.0), isnan(_6511)), level(0.0)).xy;
            float _1088 = _1086.x;
            float _1090 = _1086.y;
            float _1092 = _1090 + _620;
            float _1094 = _1088 + _622;
            _658 = _1094;
            _660 = _1092;
            _1014 = _1034;
            _1016 = _1036;
            _804 = as_type<int>(_1090);
            _1018 = as_type<int>(_1030);
            _806 = as_type<int>(_1088);
        }
        float _1096 = _658;
        float _1098 = _660;
        float _1100 = _1014;
        float _1102 = _1016;
        int _1104 = _804;
        int _1106 = _1018;
        int _1108 = _806;
        float _1110 = -_1096;
        bool _1112 = _1098 != _1110;
        bool _1114 = isnan(_1098);
        bool _1116 = _1112 || _1114;
        bool _1118 = isnan(_1110);
        bool _1120 = _1116 || _1118;
        int _1122 = _1108;
        float _1124 = _1100;
        float _1126 = _1102;
        int _1128 = _1104;
        int _1130 = _1106;
        _172 = _1098;
        _174 = _1096;
        if (_1120)
        {
            _1122 = 0;
        }
        int _1132 = _1122;
        _180 = _1132;
        if (!_1120)
        {
            float2 _6577 = float2(_142, _198);
            float2 _1134 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6577, float2(0.0), isnan(_6577)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6577, float2(0.0), isnan(_6577)), level(0.0)).xy;
            float _1136 = _1134.x;
            float _1138 = _1134.y;
            float2 _6589 = float2(_184, _198);
            float2 _1140 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6589, float2(0.0), isnan(_6589)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6589, float2(0.0), isnan(_6589)), level(0.0)).xy;
            float _1142 = _1140.x;
            float _1144 = _1140.y;
            float _1146 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _142);
            float _1148 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _184);
            bool _1150 = _1138 >= 0.800000011920928955078125;
            bool _1152 = isnan(_1138);
            bool _1154 = _1150 || _1152;
            bool _1156 = isnan(0.800000011920928955078125);
            bool _1158 = _1154 || _1156;
            bool _1160 = _1144 > 0.800000011920928955078125;
            bool _1162 = isnan(_1144);
            bool _1164 = _1160 || _1162;
            bool _1166 = isnan(0.800000011920928955078125);
            bool _1168 = _1164 || _1166;
            bool _1170 = _1136 != 0.0;
            bool _1172 = isnan(_1136);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan(0.0);
            bool _1178 = _1174 || _1176;
            bool _1180 = !_1158;
            bool _1182 = _1178 || _1180;
            bool _1184 = _1142 != 0.0;
            bool _1186 = isnan(_1142);
            bool _1188 = _1184 || _1186;
            bool _1190 = isnan(0.0);
            bool _1192 = _1188 || _1190;
            bool _1194 = !_1168;
            bool _1196 = _1192 || _1194;
            float _1198 = _1136;
            float _1200 = _1138;
            int _1202 = as_type<int>(_1146);
            float _1204 = _1142;
            float _1206 = _1148;
            if (_1182)
            {
                _1124 = _1136;
            }
            float _1208 = _1124;
            if (_1182)
            {
                _1126 = _1138;
            }
            float _1210 = _1126;
            if (_1196)
            {
                _1198 = _1142;
            }
            float _1212 = _1198;
            if (_1196)
            {
                _1200 = _1144;
            }
            float _1214 = _1200;
            float _1216 = _1208;
            float _1218 = _1210;
            if (!_1182)
            {
                float2 _6696 = float2(_1146, _198);
                float2 _1220 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6696, float2(0.0), isnan(_6696)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6696, float2(0.0), isnan(_6696)), level(0.0)).xy;
                float _1222 = _1220.x;
                float _1224 = _1220.y;
                _1216 = _1222;
                _1218 = _1224;
            }
            float _1226 = _1216;
            float _1228 = _1218;
            float _1230 = _1212;
            float _1232 = _1214;
            if (!_1196)
            {
                float2 _6718 = float2(_1148, _198);
                float2 _1234 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6718, float2(0.0), isnan(_6718)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6718, float2(0.0), isnan(_6718)), level(0.0)).xy;
                float _1236 = _1234.x;
                float _1238 = _1234.y;
                _1230 = _1236;
                _1232 = _1238;
            }
            float _1240 = _1230;
            float _1242 = _1232;
            if (_1182)
            {
                _1128 = 1;
            }
            int _1244 = _1128;
            int _1246 = _1244;
            if (!_1182)
            {
                _1246 = 0;
            }
            int _1248 = _1246;
            int _1250 = _1248;
            if (_1182)
            {
                _188 = _1146;
            }
            float _1252 = _188;
            float _1254 = _1252;
            if (!_1182)
            {
                float _1256 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1146);
                _1254 = _1256;
            }
            float _1258 = _1254;
            int _1260 = _1248 & 1;
            bool _1262 = _1260 != 0;
            float _1264 = _1258;
            if (_1262)
            {
                _1130 = _1248;
            }
            int _1266 = _1130;
            int _1268 = _1266;
            int _1270 = _1266;
            float _1272 = _1228;
            float _1274 = _1226;
            float _1276 = _1242;
            float _1278 = _1240;
            if (!_1262)
            {
                bool _1280 = _1228 >= 0.800000011920928955078125;
                bool _1282 = isnan(_1228);
                bool _1284 = _1280 || _1282;
                bool _1286 = isnan(0.800000011920928955078125);
                bool _1288 = _1284 || _1286;
                bool _1290 = _1226 != 0.0;
                bool _1292 = isnan(_1226);
                bool _1294 = _1290 || _1292;
                bool _1296 = isnan(0.0);
                bool _1298 = _1294 || _1296;
                bool _1300 = !_1288;
                bool _1302 = _1298 || _1300;
                if (_1302)
                {
                    _1268 = 1;
                }
                int _1304 = _1268;
                _1270 = _1304;
                if (!_1302)
                {
                    float2 _6816 = float2(_1258, _198);
                    float2 _1306 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6816, float2(0.0), isnan(_6816)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6816, float2(0.0), isnan(_6816)), level(0.0)).xy;
                    float _1308 = _1306.x;
                    float _1310 = _1306.y;
                    float _1312 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1258);
                    _1270 = _1248;
                    _1272 = _1310;
                    _1274 = _1308;
                    _1264 = _1312;
                }
            }
            int _1314 = _1270;
            float _1316 = _1272;
            float _1318 = _1274;
            float _1320 = _1264;
            int _1322 = _1314 & 1;
            bool _1324 = _1322 != 0;
            float _1326 = _1316;
            float _1328 = _1318;
            float _1330 = _1320;
            int _1332 = _1314;
            if (_1324)
            {
                _1250 = _1314;
            }
            int _1334 = _1250;
            int _1336 = _1334;
            int _1338 = _1334;
            if (!_1324)
            {
                bool _1340 = _1316 >= 0.800000011920928955078125;
                bool _1342 = isnan(_1316);
                bool _1344 = _1340 || _1342;
                bool _1346 = isnan(0.800000011920928955078125);
                bool _1348 = _1344 || _1346;
                bool _1350 = _1318 != 0.0;
                bool _1352 = isnan(_1318);
                bool _1354 = _1350 || _1352;
                bool _1356 = isnan(0.0);
                bool _1358 = _1354 || _1356;
                bool _1360 = !_1348;
                bool _1362 = _1358 || _1360;
                if (_1362)
                {
                    _1336 = 1;
                }
                int _1364 = _1336;
                _1338 = _1364;
                if (!_1362)
                {
                    float2 _6895 = float2(_1320, _198);
                    float2 _1366 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6895, float2(0.0), isnan(_6895)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6895, float2(0.0), isnan(_6895)), level(0.0)).xy;
                    float _1368 = _1366.x;
                    float _1370 = _1366.y;
                    float _1372 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1320);
                    _1338 = _1314;
                    _1326 = _1370;
                    _1328 = _1368;
                    _1330 = _1372;
                }
            }
            int _1374 = _1338;
            float _1376 = _1326;
            float _1378 = _1328;
            float _1380 = _1330;
            int _1382 = _1374 & 1;
            bool _1384 = _1382 != 0;
            float _1386 = _1376;
            float _1388 = _1378;
            float _1390 = _1380;
            int _1392 = _1374;
            if (_1384)
            {
                _1202 = _1374;
            }
            int _1394 = _1202;
            int _1396 = _1394;
            int _1398 = _1394;
            if (!_1384)
            {
                bool _1400 = _1376 >= 0.800000011920928955078125;
                bool _1402 = isnan(_1376);
                bool _1404 = _1400 || _1402;
                bool _1406 = isnan(0.800000011920928955078125);
                bool _1408 = _1404 || _1406;
                bool _1410 = _1378 != 0.0;
                bool _1412 = isnan(_1378);
                bool _1414 = _1410 || _1412;
                bool _1416 = isnan(0.0);
                bool _1418 = _1414 || _1416;
                bool _1420 = !_1408;
                bool _1422 = _1418 || _1420;
                if (_1422)
                {
                    _1396 = 1;
                }
                int _1424 = _1396;
                _1398 = _1424;
                if (!_1422)
                {
                    float2 _6974 = float2(_1380, _198);
                    float2 _1426 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6974, float2(0.0), isnan(_6974)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6974, float2(0.0), isnan(_6974)), level(0.0)).xy;
                    float _1428 = _1426.x;
                    float _1430 = _1426.y;
                    float _1432 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1380);
                    _1398 = _1374;
                    _1386 = _1430;
                    _1388 = _1428;
                    _1390 = _1432;
                }
            }
            int _1434 = _1398;
            float _1436 = _1386;
            float _1438 = _1388;
            float _1440 = _1390;
            int _1442 = _1434 & 1;
            bool _1444 = _1442 != 0;
            float _1446 = _1436;
            float _1448 = _1438;
            float _1450 = _1440;
            int _1452 = _1434;
            if (_1444)
            {
                _1392 = _1434;
            }
            int _1454 = _1392;
            int _1456 = _1454;
            int _1458 = _1454;
            if (!_1444)
            {
                bool _1460 = _1436 >= 0.800000011920928955078125;
                bool _1462 = isnan(_1436);
                bool _1464 = _1460 || _1462;
                bool _1466 = isnan(0.800000011920928955078125);
                bool _1468 = _1464 || _1466;
                bool _1470 = _1438 != 0.0;
                bool _1472 = isnan(_1438);
                bool _1474 = _1470 || _1472;
                bool _1476 = isnan(0.0);
                bool _1478 = _1474 || _1476;
                bool _1480 = !_1468;
                bool _1482 = _1478 || _1480;
                if (_1482)
                {
                    _1456 = 1;
                }
                int _1484 = _1456;
                _1458 = _1484;
                if (!_1482)
                {
                    float2 _7053 = float2(_1440, _198);
                    float2 _1486 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7053, float2(0.0), isnan(_7053)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7053, float2(0.0), isnan(_7053)), level(0.0)).xy;
                    float _1488 = _1486.x;
                    float _1490 = _1486.y;
                    float _1492 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1440);
                    _1458 = _1434;
                    _1446 = _1490;
                    _1448 = _1488;
                    _1450 = _1492;
                }
            }
            int _1494 = _1458;
            float _1496 = _1446;
            float _1498 = _1448;
            float _1500 = _1450;
            int _1502 = _1494 & 1;
            bool _1504 = _1502 != 0;
            float _1506 = _1496;
            float _1508 = _1498;
            float _1510 = _1500;
            int _1512 = _1494;
            if (_1504)
            {
                _1452 = _1494;
            }
            int _1514 = _1452;
            int _1516 = _1514;
            int _1518 = _1514;
            if (!_1504)
            {
                bool _1520 = _1496 >= 0.800000011920928955078125;
                bool _1522 = isnan(_1496);
                bool _1524 = _1520 || _1522;
                bool _1526 = isnan(0.800000011920928955078125);
                bool _1528 = _1524 || _1526;
                bool _1530 = _1498 != 0.0;
                bool _1532 = isnan(_1498);
                bool _1534 = _1530 || _1532;
                bool _1536 = isnan(0.0);
                bool _1538 = _1534 || _1536;
                bool _1540 = !_1528;
                bool _1542 = _1538 || _1540;
                if (_1542)
                {
                    _1516 = 1;
                }
                int _1544 = _1516;
                _1518 = _1544;
                if (!_1542)
                {
                    float2 _7132 = float2(_1500, _198);
                    float2 _1546 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7132, float2(0.0), isnan(_7132)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7132, float2(0.0), isnan(_7132)), level(0.0)).xy;
                    float _1548 = _1546.x;
                    float _1550 = _1546.y;
                    float _1552 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1500);
                    _1518 = _1494;
                    _1506 = _1550;
                    _1508 = _1548;
                    _1510 = _1552;
                }
            }
            int _1554 = _1518;
            float _1556 = _1506;
            float _1558 = _1508;
            float _1560 = _1510;
            int _1562 = _1554 & 1;
            bool _1564 = _1562 != 0;
            float _1566 = _1556;
            float _1568 = _1558;
            float _1570 = _1560;
            int _1572 = _1554;
            if (_1564)
            {
                _1512 = _1554;
            }
            int _1574 = _1512;
            int _1576 = _1574;
            int _1578 = _1574;
            if (!_1564)
            {
                bool _1580 = _1556 >= 0.800000011920928955078125;
                bool _1582 = isnan(_1556);
                bool _1584 = _1580 || _1582;
                bool _1586 = isnan(0.800000011920928955078125);
                bool _1588 = _1584 || _1586;
                bool _1590 = _1558 != 0.0;
                bool _1592 = isnan(_1558);
                bool _1594 = _1590 || _1592;
                bool _1596 = isnan(0.0);
                bool _1598 = _1594 || _1596;
                bool _1600 = !_1588;
                bool _1602 = _1598 || _1600;
                if (_1602)
                {
                    _1576 = 1;
                }
                int _1604 = _1576;
                _1578 = _1604;
                if (!_1602)
                {
                    float2 _7211 = float2(_1560, _198);
                    float2 _1606 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7211, float2(0.0), isnan(_7211)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7211, float2(0.0), isnan(_7211)), level(0.0)).xy;
                    float _1608 = _1606.x;
                    float _1610 = _1606.y;
                    float _1612 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1560);
                    _1578 = _1554;
                    _1566 = _1610;
                    _1568 = _1608;
                    _1570 = _1612;
                }
            }
            int _1614 = _1578;
            float _1616 = _1566;
            float _1618 = _1568;
            float _1620 = _1570;
            int _1622 = _1614 & 1;
            bool _1624 = _1622 != 0;
            float _1626 = _1616;
            float _1628 = _1618;
            float _1630 = _1620;
            int _1632 = _1614;
            if (_1624)
            {
                _1572 = _1614;
            }
            int _1634 = _1572;
            int _1636 = _1634;
            int _1638 = _1634;
            if (!_1624)
            {
                bool _1640 = _1616 >= 0.800000011920928955078125;
                bool _1642 = isnan(_1616);
                bool _1644 = _1640 || _1642;
                bool _1646 = isnan(0.800000011920928955078125);
                bool _1648 = _1644 || _1646;
                bool _1650 = _1618 != 0.0;
                bool _1652 = isnan(_1618);
                bool _1654 = _1650 || _1652;
                bool _1656 = isnan(0.0);
                bool _1658 = _1654 || _1656;
                bool _1660 = !_1648;
                bool _1662 = _1658 || _1660;
                if (_1662)
                {
                    _1636 = 1;
                }
                int _1664 = _1636;
                _1638 = _1664;
                if (!_1662)
                {
                    float2 _7290 = float2(_1620, _198);
                    float2 _1666 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7290, float2(0.0), isnan(_7290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7290, float2(0.0), isnan(_7290)), level(0.0)).xy;
                    float _1668 = _1666.x;
                    float _1670 = _1666.y;
                    float _1672 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1620);
                    _1638 = _1614;
                    _1626 = _1670;
                    _1628 = _1668;
                    _1630 = _1672;
                }
            }
            int _1674 = _1638;
            float _1676 = _1626;
            float _1678 = _1628;
            float _1680 = _1630;
            int _1682 = _1674 & 1;
            bool _1684 = _1682 != 0;
            float _1686 = _1676;
            float _1688 = _1678;
            float _1690 = _1680;
            int _1692 = _1674;
            if (_1684)
            {
                _1632 = _1674;
            }
            int _1694 = _1632;
            int _1696 = _1694;
            int _1698 = _1694;
            if (!_1684)
            {
                bool _1700 = _1676 >= 0.800000011920928955078125;
                bool _1702 = isnan(_1676);
                bool _1704 = _1700 || _1702;
                bool _1706 = isnan(0.800000011920928955078125);
                bool _1708 = _1704 || _1706;
                bool _1710 = _1678 != 0.0;
                bool _1712 = isnan(_1678);
                bool _1714 = _1710 || _1712;
                bool _1716 = isnan(0.0);
                bool _1718 = _1714 || _1716;
                bool _1720 = !_1708;
                bool _1722 = _1718 || _1720;
                if (_1722)
                {
                    _1696 = 1;
                }
                int _1724 = _1696;
                _1698 = _1724;
                if (!_1722)
                {
                    float2 _7369 = float2(_1680, _198);
                    float2 _1726 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7369, float2(0.0), isnan(_7369)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7369, float2(0.0), isnan(_7369)), level(0.0)).xy;
                    float _1728 = _1726.x;
                    float _1730 = _1726.y;
                    float _1732 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1680);
                    _1698 = _1674;
                    _1686 = _1730;
                    _1688 = _1728;
                    _1690 = _1732;
                }
            }
            int _1734 = _1698;
            float _1736 = _1686;
            float _1738 = _1688;
            float _1740 = _1690;
            int _1742 = _1734 & 1;
            bool _1744 = _1742 != 0;
            float _1746 = _1736;
            float _1748 = _1738;
            float _1750 = _1740;
            int _1752 = _1734;
            if (_1744)
            {
                _1692 = _1734;
            }
            int _1754 = _1692;
            int _1756 = _1754;
            int _1758 = _1754;
            if (!_1744)
            {
                bool _1760 = _1736 >= 0.800000011920928955078125;
                bool _1762 = isnan(_1736);
                bool _1764 = _1760 || _1762;
                bool _1766 = isnan(0.800000011920928955078125);
                bool _1768 = _1764 || _1766;
                bool _1770 = _1738 != 0.0;
                bool _1772 = isnan(_1738);
                bool _1774 = _1770 || _1772;
                bool _1776 = isnan(0.0);
                bool _1778 = _1774 || _1776;
                bool _1780 = !_1768;
                bool _1782 = _1778 || _1780;
                if (_1782)
                {
                    _1756 = 1;
                }
                int _1784 = _1756;
                _1758 = _1784;
                if (!_1782)
                {
                    float2 _7448 = float2(_1740, _198);
                    float2 _1786 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7448, float2(0.0), isnan(_7448)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7448, float2(0.0), isnan(_7448)), level(0.0)).xy;
                    float _1788 = _1786.x;
                    float _1790 = _1786.y;
                    float _1792 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1740);
                    _1758 = _1734;
                    _1746 = _1790;
                    _1748 = _1788;
                    _1750 = _1792;
                }
            }
            int _1794 = _1758;
            float _1796 = _1746;
            float _1798 = _1748;
            float _1800 = _1750;
            int _1802 = _1794 & 1;
            bool _1804 = _1802 != 0;
            float _1806 = _1796;
            float _1808 = _1798;
            float _1810 = _1800;
            int _1812 = _1794;
            if (_1804)
            {
                _1752 = _1794;
            }
            int _1814 = _1752;
            int _1816 = _1814;
            int _1818 = _1814;
            if (!_1804)
            {
                bool _1820 = _1796 >= 0.800000011920928955078125;
                bool _1822 = isnan(_1796);
                bool _1824 = _1820 || _1822;
                bool _1826 = isnan(0.800000011920928955078125);
                bool _1828 = _1824 || _1826;
                bool _1830 = _1798 != 0.0;
                bool _1832 = isnan(_1798);
                bool _1834 = _1830 || _1832;
                bool _1836 = isnan(0.0);
                bool _1838 = _1834 || _1836;
                bool _1840 = !_1828;
                bool _1842 = _1838 || _1840;
                if (_1842)
                {
                    _1816 = 1;
                }
                int _1844 = _1816;
                _1818 = _1844;
                if (!_1842)
                {
                    float2 _7527 = float2(_1800, _198);
                    float2 _1846 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7527, float2(0.0), isnan(_7527)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7527, float2(0.0), isnan(_7527)), level(0.0)).xy;
                    float _1848 = _1846.x;
                    float _1850 = _1846.y;
                    float _1852 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1800);
                    _1818 = _1794;
                    _1806 = _1850;
                    _1808 = _1848;
                    _1810 = _1852;
                }
            }
            int _1854 = _1818;
            float _1856 = _1806;
            float _1858 = _1808;
            float _1860 = _1810;
            int _1862 = _1854 & 1;
            bool _1864 = _1862 != 0;
            float _1866 = _1856;
            float _1868 = _1858;
            float _1870 = _1860;
            int _1872 = _1854;
            if (_1864)
            {
                _1812 = _1854;
            }
            int _1874 = _1812;
            int _1876 = _1874;
            int _1878 = _1874;
            if (!_1864)
            {
                bool _1880 = _1856 >= 0.800000011920928955078125;
                bool _1882 = isnan(_1856);
                bool _1884 = _1880 || _1882;
                bool _1886 = isnan(0.800000011920928955078125);
                bool _1888 = _1884 || _1886;
                bool _1890 = _1858 != 0.0;
                bool _1892 = isnan(_1858);
                bool _1894 = _1890 || _1892;
                bool _1896 = isnan(0.0);
                bool _1898 = _1894 || _1896;
                bool _1900 = !_1888;
                bool _1902 = _1898 || _1900;
                if (_1902)
                {
                    _1876 = 1;
                }
                int _1904 = _1876;
                _1878 = _1904;
                if (!_1902)
                {
                    float2 _7606 = float2(_1860, _198);
                    float2 _1906 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7606, float2(0.0), isnan(_7606)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7606, float2(0.0), isnan(_7606)), level(0.0)).xy;
                    float _1908 = _1906.x;
                    float _1910 = _1906.y;
                    float _1912 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1860);
                    _1878 = _1854;
                    _1866 = _1910;
                    _1868 = _1908;
                    _1870 = _1912;
                }
            }
            int _1914 = _1878;
            float _1916 = _1866;
            float _1918 = _1868;
            float _1920 = _1870;
            int _1922 = _1914 & 1;
            bool _1924 = _1922 != 0;
            float _1926 = _1916;
            float _1928 = _1918;
            float _1930 = _1920;
            int _1932 = _1914;
            if (_1924)
            {
                _1872 = _1914;
            }
            int _1934 = _1872;
            int _1936 = _1934;
            int _1938 = _1934;
            if (!_1924)
            {
                bool _1940 = _1916 >= 0.800000011920928955078125;
                bool _1942 = isnan(_1916);
                bool _1944 = _1940 || _1942;
                bool _1946 = isnan(0.800000011920928955078125);
                bool _1948 = _1944 || _1946;
                bool _1950 = _1918 != 0.0;
                bool _1952 = isnan(_1918);
                bool _1954 = _1950 || _1952;
                bool _1956 = isnan(0.0);
                bool _1958 = _1954 || _1956;
                bool _1960 = !_1948;
                bool _1962 = _1958 || _1960;
                if (_1962)
                {
                    _1936 = 1;
                }
                int _1964 = _1936;
                _1938 = _1964;
                if (!_1962)
                {
                    float2 _7685 = float2(_1920, _198);
                    float2 _1966 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7685, float2(0.0), isnan(_7685)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7685, float2(0.0), isnan(_7685)), level(0.0)).xy;
                    float _1968 = _1966.x;
                    float _1970 = _1966.y;
                    float _1972 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1920);
                    _1938 = _1914;
                    _1926 = _1970;
                    _1928 = _1968;
                    _1930 = _1972;
                }
            }
            int _1974 = _1938;
            float _1976 = _1926;
            float _1978 = _1928;
            float _1980 = _1930;
            int _1982 = _1974 & 1;
            bool _1984 = _1982 != 0;
            float _1986 = _1980;
            float _1988 = _1978;
            float _1990 = _1976;
            float _1992 = as_type<float>(_1974);
            if (_1196)
            {
                _1332 = 1;
            }
            int _1994 = _1332;
            int _1996 = _1994;
            if (!_1196)
            {
                _1996 = 0;
            }
            int _1998 = _1996;
            int _2000 = _1998 & 1;
            bool _2002 = _2000 != 0;
            int _2004 = _1998;
            if (_1984)
            {
                _1932 = _1974;
            }
            int _2006 = _1932;
            int _2008 = _2006;
            int _2010 = _2006;
            if (!_1984)
            {
                bool _2012 = _1976 >= 0.800000011920928955078125;
                bool _2014 = isnan(_1976);
                bool _2016 = _2012 || _2014;
                bool _2018 = isnan(0.800000011920928955078125);
                bool _2020 = _2016 || _2018;
                bool _2022 = _1978 != 0.0;
                bool _2024 = isnan(_1978);
                bool _2026 = _2022 || _2024;
                bool _2028 = isnan(0.0);
                bool _2030 = _2026 || _2028;
                bool _2032 = !_2020;
                bool _2034 = _2030 || _2032;
                if (_2034)
                {
                    _2008 = 1;
                }
                int _2036 = _2008;
                _2010 = _2036;
                if (!_2034)
                {
                    float2 _7780 = float2(_1980, _198);
                    float2 _2038 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7780, float2(0.0), isnan(_7780)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7780, float2(0.0), isnan(_7780)), level(0.0)).xy;
                    float _2040 = _2038.x;
                    float _2042 = _2038.y;
                    float _2044 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1980);
                    _2010 = _1974;
                    _1986 = _2044;
                    _1988 = _2040;
                    _1990 = _2042;
                }
            }
            int _2046 = _2010;
            float _2048 = _1986;
            float _2050 = _1988;
            float _2052 = _1990;
            int _2054 = _2046 & 1;
            bool _2056 = _2054 != 0;
            float _2058 = as_type<float>(_2046);
            int _2060 = as_type<int>(_2048);
            if (_1196)
            {
                _1204 = _1148;
            }
            float _2062 = _1204;
            float _2064 = _2062;
            if (!_1196)
            {
                float _2066 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1148);
                _2064 = _2066;
            }
            float _2068 = _2064;
            float _2070 = _2068;
            if (_2056)
            {
                _2058 = _2048;
            }
            float _2072 = _2058;
            float _2074 = _2072;
            float _2076 = _2072;
            if (_2056)
            {
                _1206 = _2050;
            }
            float _2078 = _1206;
            float _2080 = _2078;
            float _2082 = _2078;
            if (_2056)
            {
                _1992 = _2052;
            }
            float _2084 = _1992;
            float _2086 = _2084;
            float _2088 = _2084;
            if (!_2056)
            {
                bool _2090 = _2052 >= 0.800000011920928955078125;
                bool _2092 = isnan(_2052);
                bool _2094 = _2090 || _2092;
                bool _2096 = isnan(0.800000011920928955078125);
                bool _2098 = _2094 || _2096;
                bool _2100 = _2050 != 0.0;
                bool _2102 = isnan(_2050);
                bool _2104 = _2100 || _2102;
                bool _2106 = isnan(0.0);
                bool _2108 = _2104 || _2106;
                bool _2110 = !_2098;
                bool _2112 = _2108 || _2110;
                if (_2112)
                {
                    _2080 = _2050;
                }
                float _2114 = _2080;
                _2082 = _2114;
                if (_2112)
                {
                    _2086 = _2052;
                }
                float _2116 = _2086;
                _2088 = _2116;
                if (_2112)
                {
                    _2074 = _2048;
                }
                float _2118 = _2074;
                _2076 = _2118;
                if (!_2112)
                {
                    float2 _7903 = float2(_2048, _198);
                    float2 _2120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7903, float2(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7903, float2(0.0), isnan(_7903)), level(0.0)).xy;
                    float _2122 = _2120.x;
                    float _2124 = _2120.y;
                    float _2126 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2048);
                    _2082 = _2122;
                    _2088 = _2124;
                    _2076 = _2126;
                }
            }
            float _2128 = _2082;
            float _2130 = _2088;
            float _2132 = _2076;
            if (_2002)
            {
                _2060 = _1998;
            }
            int _2134 = _2060;
            int _2136 = _2134;
            int _2138 = _2134;
            if (!_2002)
            {
                bool _2140 = _1242 > 0.800000011920928955078125;
                bool _2142 = isnan(_1242);
                bool _2144 = _2140 || _2142;
                bool _2146 = isnan(0.800000011920928955078125);
                bool _2148 = _2144 || _2146;
                bool _2150 = _1240 != 0.0;
                bool _2152 = isnan(_1240);
                bool _2154 = _2150 || _2152;
                bool _2156 = isnan(0.0);
                bool _2158 = _2154 || _2156;
                bool _2160 = !_2148;
                bool _2162 = _2158 || _2160;
                if (_2162)
                {
                    _2136 = 1;
                }
                int _2164 = _2136;
                _2138 = _2164;
                if (!_2162)
                {
                    float2 _7972 = float2(_2068, _198);
                    float2 _2166 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7972, float2(0.0), isnan(_7972)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7972, float2(0.0), isnan(_7972)), level(0.0)).xy;
                    float _2168 = _2166.x;
                    float _2170 = _2166.y;
                    float _2172 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2068);
                    _2138 = _1998;
                    _1276 = _2170;
                    _1278 = _2168;
                    _2070 = _2172;
                }
            }
            int _2174 = _2138;
            float _2176 = _1276;
            float _2178 = _1278;
            float _2180 = _2070;
            int _2182 = _2174 & 1;
            bool _2184 = _2182 != 0;
            float _2186 = _2176;
            float _2188 = _2178;
            float _2190 = _2180;
            int _2192 = _2174;
            if (_2184)
            {
                _2004 = _2174;
            }
            int _2194 = _2004;
            int _2196 = _2194;
            int _2198 = _2194;
            if (!_2184)
            {
                bool _2200 = _2176 > 0.800000011920928955078125;
                bool _2202 = isnan(_2176);
                bool _2204 = _2200 || _2202;
                bool _2206 = isnan(0.800000011920928955078125);
                bool _2208 = _2204 || _2206;
                bool _2210 = _2178 != 0.0;
                bool _2212 = isnan(_2178);
                bool _2214 = _2210 || _2212;
                bool _2216 = isnan(0.0);
                bool _2218 = _2214 || _2216;
                bool _2220 = !_2208;
                bool _2222 = _2218 || _2220;
                if (_2222)
                {
                    _2196 = 1;
                }
                int _2224 = _2196;
                _2198 = _2224;
                if (!_2222)
                {
                    float2 _8051 = float2(_2180, _198);
                    float2 _2226 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8051, float2(0.0), isnan(_8051)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8051, float2(0.0), isnan(_8051)), level(0.0)).xy;
                    float _2228 = _2226.x;
                    float _2230 = _2226.y;
                    float _2232 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2180);
                    _2198 = _2174;
                    _2186 = _2230;
                    _2188 = _2228;
                    _2190 = _2232;
                }
            }
            int _2234 = _2198;
            float _2236 = _2186;
            float _2238 = _2188;
            float _2240 = _2190;
            int _2242 = _2234 & 1;
            bool _2244 = _2242 != 0;
            float _2246 = _2236;
            float _2248 = _2238;
            float _2250 = _2240;
            int _2252 = _2234;
            if (_2244)
            {
                _2192 = _2234;
            }
            int _2254 = _2192;
            int _2256 = _2254;
            int _2258 = _2254;
            if (!_2244)
            {
                bool _2260 = _2236 > 0.800000011920928955078125;
                bool _2262 = isnan(_2236);
                bool _2264 = _2260 || _2262;
                bool _2266 = isnan(0.800000011920928955078125);
                bool _2268 = _2264 || _2266;
                bool _2270 = _2238 != 0.0;
                bool _2272 = isnan(_2238);
                bool _2274 = _2270 || _2272;
                bool _2276 = isnan(0.0);
                bool _2278 = _2274 || _2276;
                bool _2280 = !_2268;
                bool _2282 = _2278 || _2280;
                if (_2282)
                {
                    _2256 = 1;
                }
                int _2284 = _2256;
                _2258 = _2284;
                if (!_2282)
                {
                    float2 _8130 = float2(_2240, _198);
                    float2 _2286 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8130, float2(0.0), isnan(_8130)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8130, float2(0.0), isnan(_8130)), level(0.0)).xy;
                    float _2288 = _2286.x;
                    float _2290 = _2286.y;
                    float _2292 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2240);
                    _2258 = _2234;
                    _2246 = _2290;
                    _2248 = _2288;
                    _2250 = _2292;
                }
            }
            int _2294 = _2258;
            float _2296 = _2246;
            float _2298 = _2248;
            float _2300 = _2250;
            int _2302 = _2294 & 1;
            bool _2304 = _2302 != 0;
            float _2306 = _2296;
            float _2308 = _2298;
            float _2310 = _2300;
            int _2312 = _2294;
            if (_2304)
            {
                _2252 = _2294;
            }
            int _2314 = _2252;
            int _2316 = _2314;
            int _2318 = _2314;
            if (!_2304)
            {
                bool _2320 = _2296 > 0.800000011920928955078125;
                bool _2322 = isnan(_2296);
                bool _2324 = _2320 || _2322;
                bool _2326 = isnan(0.800000011920928955078125);
                bool _2328 = _2324 || _2326;
                bool _2330 = _2298 != 0.0;
                bool _2332 = isnan(_2298);
                bool _2334 = _2330 || _2332;
                bool _2336 = isnan(0.0);
                bool _2338 = _2334 || _2336;
                bool _2340 = !_2328;
                bool _2342 = _2338 || _2340;
                if (_2342)
                {
                    _2316 = 1;
                }
                int _2344 = _2316;
                _2318 = _2344;
                if (!_2342)
                {
                    float2 _8209 = float2(_2300, _198);
                    float2 _2346 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8209, float2(0.0), isnan(_8209)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8209, float2(0.0), isnan(_8209)), level(0.0)).xy;
                    float _2348 = _2346.x;
                    float _2350 = _2346.y;
                    float _2352 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2300);
                    _2318 = _2294;
                    _2306 = _2350;
                    _2308 = _2348;
                    _2310 = _2352;
                }
            }
            int _2354 = _2318;
            float _2356 = _2306;
            float _2358 = _2308;
            float _2360 = _2310;
            int _2362 = _2354 & 1;
            bool _2364 = _2362 != 0;
            float _2366 = _2356;
            float _2368 = _2358;
            float _2370 = _2360;
            int _2372 = _2354;
            if (_2364)
            {
                _2312 = _2354;
            }
            int _2374 = _2312;
            int _2376 = _2374;
            int _2378 = _2374;
            if (!_2364)
            {
                bool _2380 = _2356 > 0.800000011920928955078125;
                bool _2382 = isnan(_2356);
                bool _2384 = _2380 || _2382;
                bool _2386 = isnan(0.800000011920928955078125);
                bool _2388 = _2384 || _2386;
                bool _2390 = _2358 != 0.0;
                bool _2392 = isnan(_2358);
                bool _2394 = _2390 || _2392;
                bool _2396 = isnan(0.0);
                bool _2398 = _2394 || _2396;
                bool _2400 = !_2388;
                bool _2402 = _2398 || _2400;
                if (_2402)
                {
                    _2376 = 1;
                }
                int _2404 = _2376;
                _2378 = _2404;
                if (!_2402)
                {
                    float2 _8288 = float2(_2360, _198);
                    float2 _2406 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8288, float2(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8288, float2(0.0), isnan(_8288)), level(0.0)).xy;
                    float _2408 = _2406.x;
                    float _2410 = _2406.y;
                    float _2412 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2360);
                    _2378 = _2354;
                    _2366 = _2410;
                    _2368 = _2408;
                    _2370 = _2412;
                }
            }
            int _2414 = _2378;
            float _2416 = _2366;
            float _2418 = _2368;
            float _2420 = _2370;
            int _2422 = _2414 & 1;
            bool _2424 = _2422 != 0;
            float _2426 = _2416;
            float _2428 = _2418;
            float _2430 = _2420;
            int _2432 = _2414;
            if (_2424)
            {
                _2372 = _2414;
            }
            int _2434 = _2372;
            int _2436 = _2434;
            int _2438 = _2434;
            if (!_2424)
            {
                bool _2440 = _2416 > 0.800000011920928955078125;
                bool _2442 = isnan(_2416);
                bool _2444 = _2440 || _2442;
                bool _2446 = isnan(0.800000011920928955078125);
                bool _2448 = _2444 || _2446;
                bool _2450 = _2418 != 0.0;
                bool _2452 = isnan(_2418);
                bool _2454 = _2450 || _2452;
                bool _2456 = isnan(0.0);
                bool _2458 = _2454 || _2456;
                bool _2460 = !_2448;
                bool _2462 = _2458 || _2460;
                if (_2462)
                {
                    _2436 = 1;
                }
                int _2464 = _2436;
                _2438 = _2464;
                if (!_2462)
                {
                    float2 _8367 = float2(_2420, _198);
                    float2 _2466 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8367, float2(0.0), isnan(_8367)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8367, float2(0.0), isnan(_8367)), level(0.0)).xy;
                    float _2468 = _2466.x;
                    float _2470 = _2466.y;
                    float _2472 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2420);
                    _2438 = _2414;
                    _2426 = _2470;
                    _2428 = _2468;
                    _2430 = _2472;
                }
            }
            int _2474 = _2438;
            float _2476 = _2426;
            float _2478 = _2428;
            float _2480 = _2430;
            int _2482 = _2474 & 1;
            bool _2484 = _2482 != 0;
            float _2486 = _2476;
            float _2488 = _2478;
            float _2490 = _2480;
            int _2492 = _2474;
            if (_2484)
            {
                _2432 = _2474;
            }
            int _2494 = _2432;
            int _2496 = _2494;
            int _2498 = _2494;
            if (!_2484)
            {
                bool _2500 = _2476 > 0.800000011920928955078125;
                bool _2502 = isnan(_2476);
                bool _2504 = _2500 || _2502;
                bool _2506 = isnan(0.800000011920928955078125);
                bool _2508 = _2504 || _2506;
                bool _2510 = _2478 != 0.0;
                bool _2512 = isnan(_2478);
                bool _2514 = _2510 || _2512;
                bool _2516 = isnan(0.0);
                bool _2518 = _2514 || _2516;
                bool _2520 = !_2508;
                bool _2522 = _2518 || _2520;
                if (_2522)
                {
                    _2496 = 1;
                }
                int _2524 = _2496;
                _2498 = _2524;
                if (!_2522)
                {
                    float2 _8446 = float2(_2480, _198);
                    float2 _2526 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8446, float2(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8446, float2(0.0), isnan(_8446)), level(0.0)).xy;
                    float _2528 = _2526.x;
                    float _2530 = _2526.y;
                    float _2532 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2480);
                    _2498 = _2474;
                    _2486 = _2530;
                    _2488 = _2528;
                    _2490 = _2532;
                }
            }
            int _2534 = _2498;
            float _2536 = _2486;
            float _2538 = _2488;
            float _2540 = _2490;
            int _2542 = _2534 & 1;
            bool _2544 = _2542 != 0;
            float _2546 = _2536;
            float _2548 = _2538;
            float _2550 = _2540;
            int _2552 = _2534;
            if (_2544)
            {
                _2492 = _2534;
            }
            int _2554 = _2492;
            int _2556 = _2554;
            int _2558 = _2554;
            if (!_2544)
            {
                bool _2560 = _2536 > 0.800000011920928955078125;
                bool _2562 = isnan(_2536);
                bool _2564 = _2560 || _2562;
                bool _2566 = isnan(0.800000011920928955078125);
                bool _2568 = _2564 || _2566;
                bool _2570 = _2538 != 0.0;
                bool _2572 = isnan(_2538);
                bool _2574 = _2570 || _2572;
                bool _2576 = isnan(0.0);
                bool _2578 = _2574 || _2576;
                bool _2580 = !_2568;
                bool _2582 = _2578 || _2580;
                if (_2582)
                {
                    _2556 = 1;
                }
                int _2584 = _2556;
                _2558 = _2584;
                if (!_2582)
                {
                    float2 _8525 = float2(_2540, _198);
                    float2 _2586 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8525, float2(0.0), isnan(_8525)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8525, float2(0.0), isnan(_8525)), level(0.0)).xy;
                    float _2588 = _2586.x;
                    float _2590 = _2586.y;
                    float _2592 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2540);
                    _2558 = _2534;
                    _2546 = _2590;
                    _2548 = _2588;
                    _2550 = _2592;
                }
            }
            int _2594 = _2558;
            float _2596 = _2546;
            float _2598 = _2548;
            float _2600 = _2550;
            int _2602 = _2594 & 1;
            bool _2604 = _2602 != 0;
            float _2606 = _2596;
            float _2608 = _2598;
            float _2610 = _2600;
            int _2612 = _2594;
            if (_2604)
            {
                _2552 = _2594;
            }
            int _2614 = _2552;
            int _2616 = _2614;
            int _2618 = _2614;
            if (!_2604)
            {
                bool _2620 = _2596 > 0.800000011920928955078125;
                bool _2622 = isnan(_2596);
                bool _2624 = _2620 || _2622;
                bool _2626 = isnan(0.800000011920928955078125);
                bool _2628 = _2624 || _2626;
                bool _2630 = _2598 != 0.0;
                bool _2632 = isnan(_2598);
                bool _2634 = _2630 || _2632;
                bool _2636 = isnan(0.0);
                bool _2638 = _2634 || _2636;
                bool _2640 = !_2628;
                bool _2642 = _2638 || _2640;
                if (_2642)
                {
                    _2616 = 1;
                }
                int _2644 = _2616;
                _2618 = _2644;
                if (!_2642)
                {
                    float2 _8604 = float2(_2600, _198);
                    float2 _2646 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8604, float2(0.0), isnan(_8604)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8604, float2(0.0), isnan(_8604)), level(0.0)).xy;
                    float _2648 = _2646.x;
                    float _2650 = _2646.y;
                    float _2652 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2600);
                    _2618 = _2594;
                    _2606 = _2650;
                    _2608 = _2648;
                    _2610 = _2652;
                }
            }
            int _2654 = _2618;
            float _2656 = _2606;
            float _2658 = _2608;
            float _2660 = _2610;
            int _2662 = _2654 & 1;
            bool _2664 = _2662 != 0;
            float _2666 = _2656;
            float _2668 = _2658;
            float _2670 = _2660;
            int _2672 = _2654;
            if (_2664)
            {
                _2612 = _2654;
            }
            int _2674 = _2612;
            int _2676 = _2674;
            int _2678 = _2674;
            if (!_2664)
            {
                bool _2680 = _2656 > 0.800000011920928955078125;
                bool _2682 = isnan(_2656);
                bool _2684 = _2680 || _2682;
                bool _2686 = isnan(0.800000011920928955078125);
                bool _2688 = _2684 || _2686;
                bool _2690 = _2658 != 0.0;
                bool _2692 = isnan(_2658);
                bool _2694 = _2690 || _2692;
                bool _2696 = isnan(0.0);
                bool _2698 = _2694 || _2696;
                bool _2700 = !_2688;
                bool _2702 = _2698 || _2700;
                if (_2702)
                {
                    _2676 = 1;
                }
                int _2704 = _2676;
                _2678 = _2704;
                if (!_2702)
                {
                    float2 _8683 = float2(_2660, _198);
                    float2 _2706 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8683, float2(0.0), isnan(_8683)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8683, float2(0.0), isnan(_8683)), level(0.0)).xy;
                    float _2708 = _2706.x;
                    float _2710 = _2706.y;
                    float _2712 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2660);
                    _2678 = _2654;
                    _2666 = _2710;
                    _2668 = _2708;
                    _2670 = _2712;
                }
            }
            int _2714 = _2678;
            float _2716 = _2666;
            float _2718 = _2668;
            float _2720 = _2670;
            int _2722 = _2714 & 1;
            bool _2724 = _2722 != 0;
            float _2726 = _2716;
            float _2728 = _2718;
            float _2730 = _2720;
            int _2732 = _2714;
            if (_2724)
            {
                _2672 = _2714;
            }
            int _2734 = _2672;
            int _2736 = _2734;
            int _2738 = _2734;
            if (!_2724)
            {
                bool _2740 = _2716 > 0.800000011920928955078125;
                bool _2742 = isnan(_2716);
                bool _2744 = _2740 || _2742;
                bool _2746 = isnan(0.800000011920928955078125);
                bool _2748 = _2744 || _2746;
                bool _2750 = _2718 != 0.0;
                bool _2752 = isnan(_2718);
                bool _2754 = _2750 || _2752;
                bool _2756 = isnan(0.0);
                bool _2758 = _2754 || _2756;
                bool _2760 = !_2748;
                bool _2762 = _2758 || _2760;
                if (_2762)
                {
                    _2736 = 1;
                }
                int _2764 = _2736;
                _2738 = _2764;
                if (!_2762)
                {
                    float2 _8762 = float2(_2720, _198);
                    float2 _2766 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8762, float2(0.0), isnan(_8762)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8762, float2(0.0), isnan(_8762)), level(0.0)).xy;
                    float _2768 = _2766.x;
                    float _2770 = _2766.y;
                    float _2772 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2720);
                    _2738 = _2714;
                    _2726 = _2770;
                    _2728 = _2768;
                    _2730 = _2772;
                }
            }
            int _2774 = _2738;
            float _2776 = _2726;
            float _2778 = _2728;
            float _2780 = _2730;
            int _2782 = _2774 & 1;
            bool _2784 = _2782 != 0;
            float _2786 = _2776;
            float _2788 = _2778;
            float _2790 = _2780;
            int _2792 = _2774;
            if (_2784)
            {
                _2732 = _2774;
            }
            int _2794 = _2732;
            int _2796 = _2794;
            int _2798 = _2794;
            if (!_2784)
            {
                bool _2800 = _2776 > 0.800000011920928955078125;
                bool _2802 = isnan(_2776);
                bool _2804 = _2800 || _2802;
                bool _2806 = isnan(0.800000011920928955078125);
                bool _2808 = _2804 || _2806;
                bool _2810 = _2778 != 0.0;
                bool _2812 = isnan(_2778);
                bool _2814 = _2810 || _2812;
                bool _2816 = isnan(0.0);
                bool _2818 = _2814 || _2816;
                bool _2820 = !_2808;
                bool _2822 = _2818 || _2820;
                if (_2822)
                {
                    _2796 = 1;
                }
                int _2824 = _2796;
                _2798 = _2824;
                if (!_2822)
                {
                    float2 _8841 = float2(_2780, _198);
                    float2 _2826 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8841, float2(0.0), isnan(_8841)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8841, float2(0.0), isnan(_8841)), level(0.0)).xy;
                    float _2828 = _2826.x;
                    float _2830 = _2826.y;
                    float _2832 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2780);
                    _2798 = _2774;
                    _2786 = _2830;
                    _2788 = _2828;
                    _2790 = _2832;
                }
            }
            int _2834 = _2798;
            float _2836 = _2786;
            float _2838 = _2788;
            float _2840 = _2790;
            int _2842 = _2834 & 1;
            bool _2844 = _2842 != 0;
            float _2846 = _2836;
            float _2848 = _2838;
            float _2850 = _2840;
            if (_2844)
            {
                _2792 = _2834;
            }
            int _2852 = _2792;
            int _2854 = _2852;
            int _2856 = _2852;
            if (!_2844)
            {
                bool _2858 = _2836 > 0.800000011920928955078125;
                bool _2860 = isnan(_2836);
                bool _2862 = _2858 || _2860;
                bool _2864 = isnan(0.800000011920928955078125);
                bool _2866 = _2862 || _2864;
                bool _2868 = _2838 != 0.0;
                bool _2870 = isnan(_2838);
                bool _2872 = _2868 || _2870;
                bool _2874 = isnan(0.0);
                bool _2876 = _2872 || _2874;
                bool _2878 = !_2866;
                bool _2880 = _2876 || _2878;
                if (_2880)
                {
                    _2854 = 1;
                }
                int _2882 = _2854;
                _2856 = _2882;
                if (!_2880)
                {
                    float2 _8919 = float2(_2840, _198);
                    float2 _2884 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8919, float2(0.0), isnan(_8919)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8919, float2(0.0), isnan(_8919)), level(0.0)).xy;
                    float _2886 = _2884.x;
                    float _2888 = _2884.y;
                    float _2890 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2840);
                    _2856 = _2834;
                    _2846 = _2888;
                    _2848 = _2886;
                    _2850 = _2890;
                }
            }
            int _2892 = _2856;
            float _2894 = _2846;
            float _2896 = _2848;
            float _2898 = _2850;
            int _2900 = _2892 & 1;
            bool _2902 = _2900 != 0;
            float _2904 = _2896;
            float _2906 = _2894;
            float _2908 = _2898;
            if (!_2902)
            {
                bool _2910 = _2894 > 0.800000011920928955078125;
                bool _2912 = isnan(_2894);
                bool _2914 = _2910 || _2912;
                bool _2916 = isnan(0.800000011920928955078125);
                bool _2918 = _2914 || _2916;
                bool _2920 = _2896 != 0.0;
                bool _2922 = isnan(_2896);
                bool _2924 = _2920 || _2922;
                bool _2926 = isnan(0.0);
                bool _2928 = _2924 || _2926;
                bool _2930 = !_2918;
                bool _2932 = _2928 || _2930;
                if (!_2932)
                {
                    float2 _8985 = float2(_2898, _198);
                    float2 _2934 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8985, float2(0.0), isnan(_8985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8985, float2(0.0), isnan(_8985)), level(0.0)).xy;
                    float _2936 = _2934.x;
                    float _2938 = _2934.y;
                    float _2940 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2898);
                    _2904 = _2936;
                    _2906 = _2938;
                    _2908 = _2940;
                }
            }
            float _2942 = _2904;
            float _2944 = _2906;
            float _2946 = _2908;
            float _2948 = fma(_2942, 0.5, 0.5234375);
            float _2950 = fma(_2128, 0.5, 0.0078125);
            float _2952 = fma(_2944, 2.0, 0.03125);
            float _2954 = fma(_2130, 2.0, 0.03125);
            float2 _9020 = float2(_2948, _2952);
            float _2956 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_9020, float2(0.0), isnan(_9020)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_9020, float2(0.0), isnan(_9020)), level(0.0)).x;
            float2 _9028 = float2(_2950, _2954);
            float _2958 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_9028, float2(0.0), isnan(_9028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_9028, float2(0.0), isnan(_9028)), level(0.0)).x;
            float _2960 = fma(_2956, -2.007874011993408203125, 3.25);
            float _2962 = fma(_2958, -2.007874011993408203125, 3.25);
            float _2964 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _2966 = fma(_2960, _2964, _2946);
            float _2968 = fma(_2962, (*spvDescriptorSet0.cp_c3)._m0[0].z, _2132);
            float2 _9054 = float2(_2966, _144);
            float _2970 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9054, float2(0.0), isnan(_9054)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9054, float2(0.0), isnan(_9054)), level(0.0), int2(1, 0)).x;
            float2 _9062 = float2(_2968, _144);
            float _2972 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9062, float2(0.0), isnan(_9062)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9062, float2(0.0), isnan(_9062)), level(0.0)).x;
            float _2974 = -_122;
            float _2976 = fma(_2968, (*spvDescriptorSet0.cp_c3)._m0[0].x, _2974);
            float _2978 = -_122;
            float _2980 = fma(_2966, (*spvDescriptorSet0.cp_c3)._m0[0].x, _2978);
            float _2982 = rint(_2980);
            float _2984 = rint(_2976);
            float _2986 = abs(_2982);
            float _2988 = sqrt(_2986);
            float _2990 = abs(_2984);
            float _2992 = sqrt(_2990);
            float _2994 = _2970 * 4.0;
            float _2996 = _2972 * 4.0;
            float _2998 = rint(_2994);
            float _3000 = rint(_2996);
            float _3002 = fma(_2998, 16.0, _2988);
            float2 _9109 = float2(_2968, _130);
            float _3004 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9109, float2(0.0), isnan(_9109)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9109, float2(0.0), isnan(_9109)), level(0.0), int2(0, 1)).x;
            float _3006 = fma(_3002, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
            float _3008 = fma(_3000, 16.0, _2992);
            float _3010 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _3006);
            float _3012 = fma(_3008, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
            float2 _9129 = float2(_2968, _130);
            float _3014 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9129, float2(0.0), isnan(_9129)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9129, float2(0.0), isnan(_9129)), level(0.0), int2(0, -2)).x;
            float2 _9139 = float2(_2966, _130);
            float _3016 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9139, float2(0.0), isnan(_9139)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9139, float2(0.0), isnan(_9139)), level(0.0), int2(1)).x;
            float2 _9148 = float2(_2966, _130);
            float _3018 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9148, float2(0.0), isnan(_9148)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9148, float2(0.0), isnan(_9148)), level(0.0), int2(1, -2)).x;
            float2 _9157 = float2(_3012, _3010);
            float2 _3020 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_9157, float2(0.0), isnan(_9157)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_9157, float2(0.0), isnan(_9157)), level(0.0)).xy;
            float _3022 = _3020.x;
            float _3024 = _3020.y;
            float _3026 = abs(_2982);
            float _3028 = abs(_2984);
            bool _3030 = _3026 >= _3028;
            bool _3032 = isnan(_3026);
            bool _3034 = _3030 || _3032;
            bool _3036 = isnan(_3028);
            bool _3038 = _3034 || _3036;
            float _3040 = float(_3038);
            float _3042 = abs(_2984);
            float _3044 = abs(_2982);
            bool _3046 = _3042 >= _3044;
            bool _3048 = isnan(_3042);
            bool _3050 = _3046 || _3048;
            bool _3052 = isnan(_3044);
            bool _3054 = _3050 || _3052;
            float _3056 = float(_3054);
            float _3058 = _3040 + _3056;
            float _3060 = 1.0 / _3058;
            float _3062 = _3060 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
            float _3064 = _3040 * _3062;
            float _3066 = _3056 * _3062;
            float _3068 = -_3064;
            float _3070 = fma(_3068, _3004, 1.0);
            float _3072 = -_3064;
            float _3074 = fma(_3072, _3014, 1.0);
            float _3076 = -_3066;
            float _3078 = fma(_3076, _3016, _3070);
            float _3080 = precise::clamp(_3078, 0.0, 1.0);
            float _3082 = -_3066;
            float _3084 = fma(_3082, _3018, _3074);
            float _3086 = precise::clamp(_3084, 0.0, 1.0);
            float _3088 = _3022 * _3080;
            float _3090 = _3024 * _3086;
            _180 = _152;
            _182 = _3004;
            _158 = as_type<int>(_3012);
            _172 = _3088;
            _174 = _3090;
        }
    }
    int _3092 = _180;
    float _3094 = _182;
    int _3096 = _158;
    float _3098 = _172;
    float _3100 = _174;
    int _3102 = _3092 & 1;
    bool _3104 = _3102 != 0;
    bool _3106 = !_3104;
    float _3108 = _3094;
    int _3110 = _3096;
    float _5050;
    float _5052;
    if (!_3106)
    {
        float2 _9278 = float2(_138, _144);
        float2 _3112 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9278, float2(0.0), isnan(_9278)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9278, float2(0.0), isnan(_9278)), level(0.0)).xy;
        float _3114 = _3112.x;
        float _3116 = _3112.y;
        float2 _9290 = float2(_138, _140);
        float2 _3118 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9290, float2(0.0), isnan(_9290)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9290, float2(0.0), isnan(_9290)), level(0.0)).xy;
        float _3120 = _3118.x;
        float _3122 = _3118.y;
        float _3124 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _144);
        float _3126 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _140);
        bool _3128 = _3120 > 0.800000011920928955078125;
        bool _3130 = isnan(_3120);
        bool _3132 = _3128 || _3130;
        bool _3134 = isnan(0.800000011920928955078125);
        bool _3136 = _3132 || _3134;
        bool _3138 = _3114 > 0.800000011920928955078125;
        bool _3140 = isnan(_3114);
        bool _3142 = _3138 || _3140;
        bool _3144 = isnan(0.800000011920928955078125);
        bool _3146 = _3142 || _3144;
        bool _3148 = _3122 != 0.0;
        bool _3150 = isnan(_3122);
        bool _3152 = _3148 || _3150;
        bool _3154 = isnan(0.0);
        bool _3156 = _3152 || _3154;
        bool _3158 = !_3136;
        bool _3160 = _3156 || _3158;
        bool _3162 = _3116 != 0.0;
        bool _3164 = isnan(_3116);
        bool _3166 = _3162 || _3164;
        bool _3168 = isnan(0.0);
        bool _3170 = _3166 || _3168;
        bool _3172 = !_3146;
        bool _3174 = _3170 || _3172;
        int _3176 = as_type<int>(_3124);
        float _3178 = _3126;
        float _3180 = _3120;
        if (_3160)
        {
            _3108 = _3120;
        }
        float _3182 = _3108;
        if (_3160)
        {
            _160 = _3122;
        }
        float _3184 = _160;
        float _3186 = _3114;
        float _3188 = _3116;
        if (!_3174)
        {
            float2 _9383 = float2(_138, _3124);
            float2 _3190 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9383, float2(0.0), isnan(_9383)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9383, float2(0.0), isnan(_9383)), level(0.0)).xy;
            float _3192 = _3190.x;
            float _3194 = _3190.y;
            _3186 = _3192;
            _3188 = _3194;
        }
        float _3196 = _3186;
        float _3198 = _3188;
        float _3200 = _3182;
        float _3202 = _3184;
        if (!_3160)
        {
            float2 _9405 = float2(_138, _3126);
            float2 _3204 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9405, float2(0.0), isnan(_9405)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9405, float2(0.0), isnan(_9405)), level(0.0)).xy;
            float _3206 = _3204.x;
            float _3208 = _3204.y;
            _3200 = _3206;
            _3202 = _3208;
        }
        float _3210 = _3200;
        float _3212 = _3202;
        if (_3174)
        {
            _162 = 1;
        }
        int _3214 = _162;
        int _3216 = _3214;
        if (!_3174)
        {
            _3216 = 0;
        }
        int _3218 = _3216;
        int _3220 = _3218;
        if (_3174)
        {
            _164 = _3124;
        }
        float _3222 = _164;
        float _3224 = _3222;
        if (!_3174)
        {
            float _3226 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3124);
            _3224 = _3226;
        }
        float _3228 = _3224;
        int _3230 = _3218 & 1;
        bool _3232 = _3230 != 0;
        float _3234 = _3228;
        if (_3232)
        {
            _3110 = _3218;
        }
        int _3236 = _3110;
        int _3238 = _3236;
        int _3240 = _3236;
        float _3242 = _3196;
        float _3244 = _3198;
        float _3246 = _3210;
        float _3248 = _3212;
        if (!_3232)
        {
            bool _3250 = _3196 > 0.800000011920928955078125;
            bool _3252 = isnan(_3196);
            bool _3254 = _3250 || _3252;
            bool _3256 = isnan(0.800000011920928955078125);
            bool _3258 = _3254 || _3256;
            bool _3260 = _3198 != 0.0;
            bool _3262 = isnan(_3198);
            bool _3264 = _3260 || _3262;
            bool _3266 = isnan(0.0);
            bool _3268 = _3264 || _3266;
            bool _3270 = !_3258;
            bool _3272 = _3268 || _3270;
            if (_3272)
            {
                _3238 = 1;
            }
            int _3274 = _3238;
            _3240 = _3274;
            if (!_3272)
            {
                float2 _9503 = float2(_138, _3228);
                float2 _3276 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9503, float2(0.0), isnan(_9503)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9503, float2(0.0), isnan(_9503)), level(0.0)).xy;
                float _3278 = _3276.x;
                float _3280 = _3276.y;
                float _3282 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3228);
                _3240 = _3218;
                _3242 = _3278;
                _3244 = _3280;
                _3234 = _3282;
            }
        }
        int _3284 = _3240;
        float _3286 = _3242;
        float _3288 = _3244;
        float _3290 = _3234;
        int _3292 = _3284 & 1;
        bool _3294 = _3292 != 0;
        float _3296 = _3286;
        float _3298 = _3288;
        float _3300 = _3290;
        int _3302 = _3284;
        if (_3294)
        {
            _3176 = _3284;
        }
        int _3304 = _3176;
        int _3306 = _3304;
        int _3308 = _3304;
        if (!_3294)
        {
            bool _3310 = _3286 > 0.800000011920928955078125;
            bool _3312 = isnan(_3286);
            bool _3314 = _3310 || _3312;
            bool _3316 = isnan(0.800000011920928955078125);
            bool _3318 = _3314 || _3316;
            bool _3320 = _3288 != 0.0;
            bool _3322 = isnan(_3288);
            bool _3324 = _3320 || _3322;
            bool _3326 = isnan(0.0);
            bool _3328 = _3324 || _3326;
            bool _3330 = !_3318;
            bool _3332 = _3328 || _3330;
            if (_3332)
            {
                _3306 = 1;
            }
            int _3334 = _3306;
            _3308 = _3334;
            if (!_3332)
            {
                float2 _9582 = float2(_138, _3290);
                float2 _3336 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9582, float2(0.0), isnan(_9582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9582, float2(0.0), isnan(_9582)), level(0.0)).xy;
                float _3338 = _3336.x;
                float _3340 = _3336.y;
                float _3342 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3290);
                _3308 = _3284;
                _3296 = _3338;
                _3298 = _3340;
                _3300 = _3342;
            }
        }
        int _3344 = _3308;
        float _3346 = _3296;
        float _3348 = _3298;
        float _3350 = _3300;
        int _3352 = _3344 & 1;
        bool _3354 = _3352 != 0;
        float _3356 = _3346;
        float _3358 = _3348;
        float _3360 = _3350;
        int _3362 = _3344;
        if (_3354)
        {
            _3220 = _3344;
        }
        int _3364 = _3220;
        int _3366 = _3364;
        int _3368 = _3364;
        if (!_3354)
        {
            bool _3370 = _3346 > 0.800000011920928955078125;
            bool _3372 = isnan(_3346);
            bool _3374 = _3370 || _3372;
            bool _3376 = isnan(0.800000011920928955078125);
            bool _3378 = _3374 || _3376;
            bool _3380 = _3348 != 0.0;
            bool _3382 = isnan(_3348);
            bool _3384 = _3380 || _3382;
            bool _3386 = isnan(0.0);
            bool _3388 = _3384 || _3386;
            bool _3390 = !_3378;
            bool _3392 = _3388 || _3390;
            if (_3392)
            {
                _3366 = 1;
            }
            int _3394 = _3366;
            _3368 = _3394;
            if (!_3392)
            {
                float2 _9661 = float2(_138, _3350);
                float2 _3396 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9661, float2(0.0), isnan(_9661)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9661, float2(0.0), isnan(_9661)), level(0.0)).xy;
                float _3398 = _3396.x;
                float _3400 = _3396.y;
                float _3402 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3350);
                _3368 = _3344;
                _3356 = _3398;
                _3358 = _3400;
                _3360 = _3402;
            }
        }
        int _3404 = _3368;
        float _3406 = _3356;
        float _3408 = _3358;
        float _3410 = _3360;
        int _3412 = _3404 & 1;
        bool _3414 = _3412 != 0;
        float _3416 = _3406;
        float _3418 = _3408;
        float _3420 = _3410;
        int _3422 = _3404;
        if (_3414)
        {
            _3362 = _3404;
        }
        int _3424 = _3362;
        int _3426 = _3424;
        int _3428 = _3424;
        if (!_3414)
        {
            bool _3430 = _3406 > 0.800000011920928955078125;
            bool _3432 = isnan(_3406);
            bool _3434 = _3430 || _3432;
            bool _3436 = isnan(0.800000011920928955078125);
            bool _3438 = _3434 || _3436;
            bool _3440 = _3408 != 0.0;
            bool _3442 = isnan(_3408);
            bool _3444 = _3440 || _3442;
            bool _3446 = isnan(0.0);
            bool _3448 = _3444 || _3446;
            bool _3450 = !_3438;
            bool _3452 = _3448 || _3450;
            if (_3452)
            {
                _3426 = 1;
            }
            int _3454 = _3426;
            _3428 = _3454;
            if (!_3452)
            {
                float2 _9740 = float2(_138, _3410);
                float2 _3456 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9740, float2(0.0), isnan(_9740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9740, float2(0.0), isnan(_9740)), level(0.0)).xy;
                float _3458 = _3456.x;
                float _3460 = _3456.y;
                float _3462 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3410);
                _3428 = _3404;
                _3416 = _3458;
                _3418 = _3460;
                _3420 = _3462;
            }
        }
        int _3464 = _3428;
        float _3466 = _3416;
        float _3468 = _3418;
        float _3470 = _3420;
        int _3472 = _3464 & 1;
        bool _3474 = _3472 != 0;
        float _3476 = _3466;
        float _3478 = _3468;
        float _3480 = _3470;
        int _3482 = _3464;
        if (_3474)
        {
            _3422 = _3464;
        }
        int _3484 = _3422;
        int _3486 = _3484;
        int _3488 = _3484;
        if (!_3474)
        {
            bool _3490 = _3466 > 0.800000011920928955078125;
            bool _3492 = isnan(_3466);
            bool _3494 = _3490 || _3492;
            bool _3496 = isnan(0.800000011920928955078125);
            bool _3498 = _3494 || _3496;
            bool _3500 = _3468 != 0.0;
            bool _3502 = isnan(_3468);
            bool _3504 = _3500 || _3502;
            bool _3506 = isnan(0.0);
            bool _3508 = _3504 || _3506;
            bool _3510 = !_3498;
            bool _3512 = _3508 || _3510;
            if (_3512)
            {
                _3486 = 1;
            }
            int _3514 = _3486;
            _3488 = _3514;
            if (!_3512)
            {
                float2 _9819 = float2(_138, _3470);
                float2 _3516 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9819, float2(0.0), isnan(_9819)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9819, float2(0.0), isnan(_9819)), level(0.0)).xy;
                float _3518 = _3516.x;
                float _3520 = _3516.y;
                float _3522 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3470);
                _3488 = _3464;
                _3476 = _3518;
                _3478 = _3520;
                _3480 = _3522;
            }
        }
        int _3524 = _3488;
        float _3526 = _3476;
        float _3528 = _3478;
        float _3530 = _3480;
        int _3532 = _3524 & 1;
        bool _3534 = _3532 != 0;
        float _3536 = _3526;
        float _3538 = _3528;
        float _3540 = _3530;
        int _3542 = _3524;
        if (_3534)
        {
            _3482 = _3524;
        }
        int _3544 = _3482;
        int _3546 = _3544;
        int _3548 = _3544;
        if (!_3534)
        {
            bool _3550 = _3526 > 0.800000011920928955078125;
            bool _3552 = isnan(_3526);
            bool _3554 = _3550 || _3552;
            bool _3556 = isnan(0.800000011920928955078125);
            bool _3558 = _3554 || _3556;
            bool _3560 = _3528 != 0.0;
            bool _3562 = isnan(_3528);
            bool _3564 = _3560 || _3562;
            bool _3566 = isnan(0.0);
            bool _3568 = _3564 || _3566;
            bool _3570 = !_3558;
            bool _3572 = _3568 || _3570;
            if (_3572)
            {
                _3546 = 1;
            }
            int _3574 = _3546;
            _3548 = _3574;
            if (!_3572)
            {
                float2 _9898 = float2(_138, _3530);
                float2 _3576 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9898, float2(0.0), isnan(_9898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9898, float2(0.0), isnan(_9898)), level(0.0)).xy;
                float _3578 = _3576.x;
                float _3580 = _3576.y;
                float _3582 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3530);
                _3548 = _3524;
                _3536 = _3578;
                _3538 = _3580;
                _3540 = _3582;
            }
        }
        int _3584 = _3548;
        float _3586 = _3536;
        float _3588 = _3538;
        float _3590 = _3540;
        int _3592 = _3584 & 1;
        bool _3594 = _3592 != 0;
        float _3596 = _3586;
        float _3598 = _3588;
        float _3600 = _3590;
        int _3602 = _3584;
        if (_3594)
        {
            _3542 = _3584;
        }
        int _3604 = _3542;
        int _3606 = _3604;
        int _3608 = _3604;
        if (!_3594)
        {
            bool _3610 = _3586 > 0.800000011920928955078125;
            bool _3612 = isnan(_3586);
            bool _3614 = _3610 || _3612;
            bool _3616 = isnan(0.800000011920928955078125);
            bool _3618 = _3614 || _3616;
            bool _3620 = _3588 != 0.0;
            bool _3622 = isnan(_3588);
            bool _3624 = _3620 || _3622;
            bool _3626 = isnan(0.0);
            bool _3628 = _3624 || _3626;
            bool _3630 = !_3618;
            bool _3632 = _3628 || _3630;
            if (_3632)
            {
                _3606 = 1;
            }
            int _3634 = _3606;
            _3608 = _3634;
            if (!_3632)
            {
                float2 _9977 = float2(_138, _3590);
                float2 _3636 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9977, float2(0.0), isnan(_9977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9977, float2(0.0), isnan(_9977)), level(0.0)).xy;
                float _3638 = _3636.x;
                float _3640 = _3636.y;
                float _3642 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3590);
                _3608 = _3584;
                _3596 = _3638;
                _3598 = _3640;
                _3600 = _3642;
            }
        }
        int _3644 = _3608;
        float _3646 = _3596;
        float _3648 = _3598;
        float _3650 = _3600;
        int _3652 = _3644 & 1;
        bool _3654 = _3652 != 0;
        float _3656 = _3646;
        float _3658 = _3648;
        float _3660 = _3650;
        int _3662 = _3644;
        if (_3654)
        {
            _3602 = _3644;
        }
        int _3664 = _3602;
        int _3666 = _3664;
        int _3668 = _3664;
        if (!_3654)
        {
            bool _3670 = _3646 > 0.800000011920928955078125;
            bool _3672 = isnan(_3646);
            bool _3674 = _3670 || _3672;
            bool _3676 = isnan(0.800000011920928955078125);
            bool _3678 = _3674 || _3676;
            bool _3680 = _3648 != 0.0;
            bool _3682 = isnan(_3648);
            bool _3684 = _3680 || _3682;
            bool _3686 = isnan(0.0);
            bool _3688 = _3684 || _3686;
            bool _3690 = !_3678;
            bool _3692 = _3688 || _3690;
            if (_3692)
            {
                _3666 = 1;
            }
            int _3694 = _3666;
            _3668 = _3694;
            if (!_3692)
            {
                float2 _10056 = float2(_138, _3650);
                float2 _3696 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10056, float2(0.0), isnan(_10056)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10056, float2(0.0), isnan(_10056)), level(0.0)).xy;
                float _3698 = _3696.x;
                float _3700 = _3696.y;
                float _3702 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3650);
                _3668 = _3644;
                _3656 = _3698;
                _3658 = _3700;
                _3660 = _3702;
            }
        }
        int _3704 = _3668;
        float _3706 = _3656;
        float _3708 = _3658;
        float _3710 = _3660;
        int _3712 = _3704 & 1;
        bool _3714 = _3712 != 0;
        float _3716 = _3706;
        float _3718 = _3708;
        float _3720 = _3710;
        int _3722 = _3704;
        if (_3714)
        {
            _3662 = _3704;
        }
        int _3724 = _3662;
        int _3726 = _3724;
        int _3728 = _3724;
        if (!_3714)
        {
            bool _3730 = _3706 > 0.800000011920928955078125;
            bool _3732 = isnan(_3706);
            bool _3734 = _3730 || _3732;
            bool _3736 = isnan(0.800000011920928955078125);
            bool _3738 = _3734 || _3736;
            bool _3740 = _3708 != 0.0;
            bool _3742 = isnan(_3708);
            bool _3744 = _3740 || _3742;
            bool _3746 = isnan(0.0);
            bool _3748 = _3744 || _3746;
            bool _3750 = !_3738;
            bool _3752 = _3748 || _3750;
            if (_3752)
            {
                _3726 = 1;
            }
            int _3754 = _3726;
            _3728 = _3754;
            if (!_3752)
            {
                float2 _10135 = float2(_138, _3710);
                float2 _3756 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10135, float2(0.0), isnan(_10135)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10135, float2(0.0), isnan(_10135)), level(0.0)).xy;
                float _3758 = _3756.x;
                float _3760 = _3756.y;
                float _3762 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3710);
                _3728 = _3704;
                _3716 = _3758;
                _3718 = _3760;
                _3720 = _3762;
            }
        }
        int _3764 = _3728;
        float _3766 = _3716;
        float _3768 = _3718;
        float _3770 = _3720;
        int _3772 = _3764 & 1;
        bool _3774 = _3772 != 0;
        float _3776 = _3766;
        float _3778 = _3768;
        float _3780 = _3770;
        int _3782 = _3764;
        if (_3774)
        {
            _3722 = _3764;
        }
        int _3784 = _3722;
        int _3786 = _3784;
        int _3788 = _3784;
        if (!_3774)
        {
            bool _3790 = _3766 > 0.800000011920928955078125;
            bool _3792 = isnan(_3766);
            bool _3794 = _3790 || _3792;
            bool _3796 = isnan(0.800000011920928955078125);
            bool _3798 = _3794 || _3796;
            bool _3800 = _3768 != 0.0;
            bool _3802 = isnan(_3768);
            bool _3804 = _3800 || _3802;
            bool _3806 = isnan(0.0);
            bool _3808 = _3804 || _3806;
            bool _3810 = !_3798;
            bool _3812 = _3808 || _3810;
            if (_3812)
            {
                _3786 = 1;
            }
            int _3814 = _3786;
            _3788 = _3814;
            if (!_3812)
            {
                float2 _10214 = float2(_138, _3770);
                float2 _3816 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10214, float2(0.0), isnan(_10214)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10214, float2(0.0), isnan(_10214)), level(0.0)).xy;
                float _3818 = _3816.x;
                float _3820 = _3816.y;
                float _3822 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3770);
                _3788 = _3764;
                _3776 = _3818;
                _3778 = _3820;
                _3780 = _3822;
            }
        }
        int _3824 = _3788;
        float _3826 = _3776;
        float _3828 = _3778;
        float _3830 = _3780;
        int _3832 = _3824 & 1;
        bool _3834 = _3832 != 0;
        float _3836 = _3826;
        float _3838 = _3828;
        float _3840 = _3830;
        int _3842 = _3824;
        if (_3834)
        {
            _3782 = _3824;
        }
        int _3844 = _3782;
        int _3846 = _3844;
        int _3848 = _3844;
        if (!_3834)
        {
            bool _3850 = _3826 > 0.800000011920928955078125;
            bool _3852 = isnan(_3826);
            bool _3854 = _3850 || _3852;
            bool _3856 = isnan(0.800000011920928955078125);
            bool _3858 = _3854 || _3856;
            bool _3860 = _3828 != 0.0;
            bool _3862 = isnan(_3828);
            bool _3864 = _3860 || _3862;
            bool _3866 = isnan(0.0);
            bool _3868 = _3864 || _3866;
            bool _3870 = !_3858;
            bool _3872 = _3868 || _3870;
            if (_3872)
            {
                _3846 = 1;
            }
            int _3874 = _3846;
            _3848 = _3874;
            if (!_3872)
            {
                float2 _10293 = float2(_138, _3830);
                float2 _3876 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10293, float2(0.0), isnan(_10293)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10293, float2(0.0), isnan(_10293)), level(0.0)).xy;
                float _3878 = _3876.x;
                float _3880 = _3876.y;
                float _3882 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3830);
                _3848 = _3824;
                _3836 = _3878;
                _3838 = _3880;
                _3840 = _3882;
            }
        }
        int _3884 = _3848;
        float _3886 = _3836;
        float _3888 = _3838;
        float _3890 = _3840;
        int _3892 = _3884 & 1;
        bool _3894 = _3892 != 0;
        float _3896 = _3886;
        float _3898 = _3888;
        float _3900 = _3890;
        int _3902 = _3884;
        if (_3894)
        {
            _3842 = _3884;
        }
        int _3904 = _3842;
        int _3906 = _3904;
        int _3908 = _3904;
        if (!_3894)
        {
            bool _3910 = _3886 > 0.800000011920928955078125;
            bool _3912 = isnan(_3886);
            bool _3914 = _3910 || _3912;
            bool _3916 = isnan(0.800000011920928955078125);
            bool _3918 = _3914 || _3916;
            bool _3920 = _3888 != 0.0;
            bool _3922 = isnan(_3888);
            bool _3924 = _3920 || _3922;
            bool _3926 = isnan(0.0);
            bool _3928 = _3924 || _3926;
            bool _3930 = !_3918;
            bool _3932 = _3928 || _3930;
            if (_3932)
            {
                _3906 = 1;
            }
            int _3934 = _3906;
            _3908 = _3934;
            if (!_3932)
            {
                float2 _10372 = float2(_138, _3890);
                float2 _3936 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10372, float2(0.0), isnan(_10372)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10372, float2(0.0), isnan(_10372)), level(0.0)).xy;
                float _3938 = _3936.x;
                float _3940 = _3936.y;
                float _3942 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3890);
                _3908 = _3884;
                _3896 = _3938;
                _3898 = _3940;
                _3900 = _3942;
            }
        }
        int _3944 = _3908;
        float _3946 = _3896;
        float _3948 = _3898;
        float _3950 = _3900;
        int _3952 = _3944 & 1;
        bool _3954 = _3952 != 0;
        float _3956 = _3950;
        float _3958 = _3946;
        float _3960 = _3948;
        float _3962 = as_type<float>(_3944);
        if (_3160)
        {
            _3302 = 1;
        }
        int _3964 = _3302;
        int _3966 = _3964;
        if (!_3160)
        {
            _3966 = 0;
        }
        int _3968 = _3966;
        int _3970 = _3968 & 1;
        bool _3972 = _3970 != 0;
        if (_3954)
        {
            _3902 = _3944;
        }
        int _3974 = _3902;
        int _3976 = _3974;
        int _3978 = _3974;
        if (!_3954)
        {
            bool _3980 = _3946 > 0.800000011920928955078125;
            bool _3982 = isnan(_3946);
            bool _3984 = _3980 || _3982;
            bool _3986 = isnan(0.800000011920928955078125);
            bool _3988 = _3984 || _3986;
            bool _3990 = _3948 != 0.0;
            bool _3992 = isnan(_3948);
            bool _3994 = _3990 || _3992;
            bool _3996 = isnan(0.0);
            bool _3998 = _3994 || _3996;
            bool _4000 = !_3988;
            bool _4002 = _3998 || _4000;
            if (_4002)
            {
                _3976 = 1;
            }
            int _4004 = _3976;
            _3978 = _4004;
            if (!_4002)
            {
                float2 _10466 = float2(_138, _3950);
                float2 _4006 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10466, float2(0.0), isnan(_10466)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10466, float2(0.0), isnan(_10466)), level(0.0)).xy;
                float _4008 = _4006.x;
                float _4010 = _4006.y;
                float _4012 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3950);
                _3978 = _3944;
                _3956 = _4012;
                _3958 = _4008;
                _3960 = _4010;
            }
        }
        int _4014 = _3978;
        float _4016 = _3956;
        float _4018 = _3958;
        float _4020 = _3960;
        int _4022 = _4014 & 1;
        bool _4024 = _4022 != 0;
        float _4026 = _4018;
        float _4028 = _4020;
        int _4030 = as_type<int>(_4016);
        int _4032 = _4014;
        if (!_3160)
        {
            float _4034 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3126);
            _3178 = _4034;
        }
        float _4036 = _3178;
        float _4038 = _4036;
        if (_4024)
        {
            _3962 = _4016;
        }
        float _4040 = _3962;
        float _4042 = _4040;
        float _4044 = _4040;
        if (!_4024)
        {
            bool _4046 = _4018 > 0.800000011920928955078125;
            bool _4048 = isnan(_4018);
            bool _4050 = _4046 || _4048;
            bool _4052 = isnan(0.800000011920928955078125);
            bool _4054 = _4050 || _4052;
            bool _4056 = _4020 != 0.0;
            bool _4058 = isnan(_4020);
            bool _4060 = _4056 || _4058;
            bool _4062 = isnan(0.0);
            bool _4064 = _4060 || _4062;
            bool _4066 = !_4054;
            bool _4068 = _4064 || _4066;
            if (_4068)
            {
                _4042 = _4016;
            }
            float _4070 = _4042;
            _4044 = _4070;
            if (!_4068)
            {
                float2 _10558 = float2(_138, _4016);
                float2 _4072 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10558, float2(0.0), isnan(_10558)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10558, float2(0.0), isnan(_10558)), level(0.0)).xy;
                float _4074 = _4072.x;
                float _4076 = _4072.y;
                float _4078 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4016);
                _4026 = _4074;
                _4028 = _4076;
                _4044 = _4078;
            }
        }
        float _4080 = _4026;
        float _4082 = _4028;
        float _4084 = _4044;
        if (_3972)
        {
            _4030 = _3968;
        }
        int _4086 = _4030;
        int _4088 = _4086;
        int _4090 = _4086;
        if (!_3972)
        {
            bool _4092 = _3210 > 0.800000011920928955078125;
            bool _4094 = isnan(_3210);
            bool _4096 = _4092 || _4094;
            bool _4098 = isnan(0.800000011920928955078125);
            bool _4100 = _4096 || _4098;
            bool _4102 = _3212 != 0.0;
            bool _4104 = isnan(_3212);
            bool _4106 = _4102 || _4104;
            bool _4108 = isnan(0.0);
            bool _4110 = _4106 || _4108;
            bool _4112 = !_4100;
            bool _4114 = _4110 || _4112;
            if (_4114)
            {
                _4088 = 1;
            }
            int _4116 = _4088;
            _4090 = _4116;
            if (!_4114)
            {
                float2 _10627 = float2(_138, _4036);
                float2 _4118 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10627, float2(0.0), isnan(_10627)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10627, float2(0.0), isnan(_10627)), level(0.0)).xy;
                float _4120 = _4118.x;
                float _4122 = _4118.y;
                float _4124 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4036);
                _4090 = _3968;
                _3246 = _4120;
                _3248 = _4122;
                _4038 = _4124;
            }
        }
        int _4126 = _4090;
        float _4128 = _3246;
        float _4130 = _3248;
        float _4132 = _4038;
        int _4134 = _4126 & 1;
        bool _4136 = _4134 != 0;
        float _4138 = _4128;
        float _4140 = _4130;
        float _4142 = _4132;
        int _4144 = _4126;
        if (_4136)
        {
            _4032 = _4126;
        }
        int _4146 = _4032;
        int _4148 = _4146;
        int _4150 = _4146;
        if (!_4136)
        {
            bool _4152 = _4128 > 0.800000011920928955078125;
            bool _4154 = isnan(_4128);
            bool _4156 = _4152 || _4154;
            bool _4158 = isnan(0.800000011920928955078125);
            bool _4160 = _4156 || _4158;
            bool _4162 = _4130 != 0.0;
            bool _4164 = isnan(_4130);
            bool _4166 = _4162 || _4164;
            bool _4168 = isnan(0.0);
            bool _4170 = _4166 || _4168;
            bool _4172 = !_4160;
            bool _4174 = _4170 || _4172;
            if (_4174)
            {
                _4148 = 1;
            }
            int _4176 = _4148;
            _4150 = _4176;
            if (!_4174)
            {
                float2 _10706 = float2(_138, _4132);
                float2 _4178 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10706, float2(0.0), isnan(_10706)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10706, float2(0.0), isnan(_10706)), level(0.0)).xy;
                float _4180 = _4178.x;
                float _4182 = _4178.y;
                float _4184 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4132);
                _4150 = _4126;
                _4138 = _4180;
                _4140 = _4182;
                _4142 = _4184;
            }
        }
        int _4186 = _4150;
        float _4188 = _4138;
        float _4190 = _4140;
        float _4192 = _4142;
        int _4194 = _4186 & 1;
        bool _4196 = _4194 != 0;
        float _4198 = _4188;
        float _4200 = _4190;
        float _4202 = _4192;
        int _4204 = _4186;
        if (_4196)
        {
            _4144 = _4186;
        }
        int _4206 = _4144;
        int _4208 = _4206;
        int _4210 = _4206;
        if (!_4196)
        {
            bool _4212 = _4188 > 0.800000011920928955078125;
            bool _4214 = isnan(_4188);
            bool _4216 = _4212 || _4214;
            bool _4218 = isnan(0.800000011920928955078125);
            bool _4220 = _4216 || _4218;
            bool _4222 = _4190 != 0.0;
            bool _4224 = isnan(_4190);
            bool _4226 = _4222 || _4224;
            bool _4228 = isnan(0.0);
            bool _4230 = _4226 || _4228;
            bool _4232 = !_4220;
            bool _4234 = _4230 || _4232;
            if (_4234)
            {
                _4208 = 1;
            }
            int _4236 = _4208;
            _4210 = _4236;
            if (!_4234)
            {
                float2 _10785 = float2(_138, _4192);
                float2 _4238 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10785, float2(0.0), isnan(_10785)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10785, float2(0.0), isnan(_10785)), level(0.0)).xy;
                float _4240 = _4238.x;
                float _4242 = _4238.y;
                float _4244 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4192);
                _4210 = _4186;
                _4198 = _4240;
                _4200 = _4242;
                _4202 = _4244;
            }
        }
        int _4246 = _4210;
        float _4248 = _4198;
        float _4250 = _4200;
        float _4252 = _4202;
        int _4254 = _4246 & 1;
        bool _4256 = _4254 != 0;
        float _4258 = _4248;
        float _4260 = _4250;
        float _4262 = _4252;
        int _4264 = _4246;
        if (_4256)
        {
            _4204 = _4246;
        }
        int _4266 = _4204;
        int _4268 = _4266;
        int _4270 = _4266;
        if (!_4256)
        {
            bool _4272 = _4248 > 0.800000011920928955078125;
            bool _4274 = isnan(_4248);
            bool _4276 = _4272 || _4274;
            bool _4278 = isnan(0.800000011920928955078125);
            bool _4280 = _4276 || _4278;
            bool _4282 = _4250 != 0.0;
            bool _4284 = isnan(_4250);
            bool _4286 = _4282 || _4284;
            bool _4288 = isnan(0.0);
            bool _4290 = _4286 || _4288;
            bool _4292 = !_4280;
            bool _4294 = _4290 || _4292;
            if (_4294)
            {
                _4268 = 1;
            }
            int _4296 = _4268;
            _4270 = _4296;
            if (!_4294)
            {
                float2 _10864 = float2(_138, _4252);
                float2 _4298 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10864, float2(0.0), isnan(_10864)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10864, float2(0.0), isnan(_10864)), level(0.0)).xy;
                float _4300 = _4298.x;
                float _4302 = _4298.y;
                float _4304 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4252);
                _4270 = _4246;
                _4258 = _4300;
                _4260 = _4302;
                _4262 = _4304;
            }
        }
        int _4306 = _4270;
        float _4308 = _4258;
        float _4310 = _4260;
        float _4312 = _4262;
        int _4314 = _4306 & 1;
        bool _4316 = _4314 != 0;
        float _4318 = _4308;
        float _4320 = _4310;
        float _4322 = _4312;
        int _4324 = _4306;
        if (_4316)
        {
            _4264 = _4306;
        }
        int _4326 = _4264;
        int _4328 = _4326;
        int _4330 = _4326;
        if (!_4316)
        {
            bool _4332 = _4308 > 0.800000011920928955078125;
            bool _4334 = isnan(_4308);
            bool _4336 = _4332 || _4334;
            bool _4338 = isnan(0.800000011920928955078125);
            bool _4340 = _4336 || _4338;
            bool _4342 = _4310 != 0.0;
            bool _4344 = isnan(_4310);
            bool _4346 = _4342 || _4344;
            bool _4348 = isnan(0.0);
            bool _4350 = _4346 || _4348;
            bool _4352 = !_4340;
            bool _4354 = _4350 || _4352;
            if (_4354)
            {
                _4328 = 1;
            }
            int _4356 = _4328;
            _4330 = _4356;
            if (!_4354)
            {
                float2 _10943 = float2(_138, _4312);
                float2 _4358 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10943, float2(0.0), isnan(_10943)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10943, float2(0.0), isnan(_10943)), level(0.0)).xy;
                float _4360 = _4358.x;
                float _4362 = _4358.y;
                float _4364 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4312);
                _4330 = _4306;
                _4318 = _4360;
                _4320 = _4362;
                _4322 = _4364;
            }
        }
        int _4366 = _4330;
        float _4368 = _4318;
        float _4370 = _4320;
        float _4372 = _4322;
        int _4374 = _4366 & 1;
        bool _4376 = _4374 != 0;
        float _4378 = _4368;
        float _4380 = _4370;
        float _4382 = _4372;
        int _4384 = _4366;
        if (_4376)
        {
            _4324 = _4366;
        }
        int _4386 = _4324;
        int _4388 = _4386;
        int _4390 = _4386;
        if (!_4376)
        {
            bool _4392 = _4368 > 0.800000011920928955078125;
            bool _4394 = isnan(_4368);
            bool _4396 = _4392 || _4394;
            bool _4398 = isnan(0.800000011920928955078125);
            bool _4400 = _4396 || _4398;
            bool _4402 = _4370 != 0.0;
            bool _4404 = isnan(_4370);
            bool _4406 = _4402 || _4404;
            bool _4408 = isnan(0.0);
            bool _4410 = _4406 || _4408;
            bool _4412 = !_4400;
            bool _4414 = _4410 || _4412;
            if (_4414)
            {
                _4388 = 1;
            }
            int _4416 = _4388;
            _4390 = _4416;
            if (!_4414)
            {
                float2 _11022 = float2(_138, _4372);
                float2 _4418 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11022, float2(0.0), isnan(_11022)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11022, float2(0.0), isnan(_11022)), level(0.0)).xy;
                float _4420 = _4418.x;
                float _4422 = _4418.y;
                float _4424 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4372);
                _4390 = _4366;
                _4378 = _4420;
                _4380 = _4422;
                _4382 = _4424;
            }
        }
        int _4426 = _4390;
        float _4428 = _4378;
        float _4430 = _4380;
        float _4432 = _4382;
        int _4434 = _4426 & 1;
        bool _4436 = _4434 != 0;
        float _4438 = _4428;
        float _4440 = _4430;
        float _4442 = _4432;
        int _4444 = _4426;
        if (_4436)
        {
            _4384 = _4426;
        }
        int _4446 = _4384;
        int _4448 = _4446;
        int _4450 = _4446;
        if (!_4436)
        {
            bool _4452 = _4428 > 0.800000011920928955078125;
            bool _4454 = isnan(_4428);
            bool _4456 = _4452 || _4454;
            bool _4458 = isnan(0.800000011920928955078125);
            bool _4460 = _4456 || _4458;
            bool _4462 = _4430 != 0.0;
            bool _4464 = isnan(_4430);
            bool _4466 = _4462 || _4464;
            bool _4468 = isnan(0.0);
            bool _4470 = _4466 || _4468;
            bool _4472 = !_4460;
            bool _4474 = _4470 || _4472;
            if (_4474)
            {
                _4448 = 1;
            }
            int _4476 = _4448;
            _4450 = _4476;
            if (!_4474)
            {
                float2 _11101 = float2(_138, _4432);
                float2 _4478 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11101, float2(0.0), isnan(_11101)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11101, float2(0.0), isnan(_11101)), level(0.0)).xy;
                float _4480 = _4478.x;
                float _4482 = _4478.y;
                float _4484 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4432);
                _4450 = _4426;
                _4438 = _4480;
                _4440 = _4482;
                _4442 = _4484;
            }
        }
        int _4486 = _4450;
        float _4488 = _4438;
        float _4490 = _4440;
        float _4492 = _4442;
        int _4494 = _4486 & 1;
        bool _4496 = _4494 != 0;
        float _4498 = _4488;
        float _4500 = _4490;
        float _4502 = _4492;
        int _4504 = _4486;
        if (_4496)
        {
            _4444 = _4486;
        }
        int _4506 = _4444;
        int _4508 = _4506;
        int _4510 = _4506;
        if (!_4496)
        {
            bool _4512 = _4488 > 0.800000011920928955078125;
            bool _4514 = isnan(_4488);
            bool _4516 = _4512 || _4514;
            bool _4518 = isnan(0.800000011920928955078125);
            bool _4520 = _4516 || _4518;
            bool _4522 = _4490 != 0.0;
            bool _4524 = isnan(_4490);
            bool _4526 = _4522 || _4524;
            bool _4528 = isnan(0.0);
            bool _4530 = _4526 || _4528;
            bool _4532 = !_4520;
            bool _4534 = _4530 || _4532;
            if (_4534)
            {
                _4508 = 1;
            }
            int _4536 = _4508;
            _4510 = _4536;
            if (!_4534)
            {
                float2 _11180 = float2(_138, _4492);
                float2 _4538 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11180, float2(0.0), isnan(_11180)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11180, float2(0.0), isnan(_11180)), level(0.0)).xy;
                float _4540 = _4538.x;
                float _4542 = _4538.y;
                float _4544 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4492);
                _4510 = _4486;
                _4498 = _4540;
                _4500 = _4542;
                _4502 = _4544;
            }
        }
        int _4546 = _4510;
        float _4548 = _4498;
        float _4550 = _4500;
        float _4552 = _4502;
        int _4554 = _4546 & 1;
        bool _4556 = _4554 != 0;
        float _4558 = _4548;
        float _4560 = _4550;
        float _4562 = _4552;
        int _4564 = _4546;
        if (_4556)
        {
            _4504 = _4546;
        }
        int _4566 = _4504;
        int _4568 = _4566;
        int _4570 = _4566;
        if (!_4556)
        {
            bool _4572 = _4548 > 0.800000011920928955078125;
            bool _4574 = isnan(_4548);
            bool _4576 = _4572 || _4574;
            bool _4578 = isnan(0.800000011920928955078125);
            bool _4580 = _4576 || _4578;
            bool _4582 = _4550 != 0.0;
            bool _4584 = isnan(_4550);
            bool _4586 = _4582 || _4584;
            bool _4588 = isnan(0.0);
            bool _4590 = _4586 || _4588;
            bool _4592 = !_4580;
            bool _4594 = _4590 || _4592;
            if (_4594)
            {
                _4568 = 1;
            }
            int _4596 = _4568;
            _4570 = _4596;
            if (!_4594)
            {
                float2 _11259 = float2(_138, _4552);
                float2 _4598 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11259, float2(0.0), isnan(_11259)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11259, float2(0.0), isnan(_11259)), level(0.0)).xy;
                float _4600 = _4598.x;
                float _4602 = _4598.y;
                float _4604 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4552);
                _4570 = _4546;
                _4558 = _4600;
                _4560 = _4602;
                _4562 = _4604;
            }
        }
        int _4606 = _4570;
        float _4608 = _4558;
        float _4610 = _4560;
        float _4612 = _4562;
        int _4614 = _4606 & 1;
        bool _4616 = _4614 != 0;
        float _4618 = _4608;
        float _4620 = _4610;
        float _4622 = _4612;
        int _4624 = _4606;
        if (_4616)
        {
            _4564 = _4606;
        }
        int _4626 = _4564;
        int _4628 = _4626;
        int _4630 = _4626;
        if (!_4616)
        {
            bool _4632 = _4608 > 0.800000011920928955078125;
            bool _4634 = isnan(_4608);
            bool _4636 = _4632 || _4634;
            bool _4638 = isnan(0.800000011920928955078125);
            bool _4640 = _4636 || _4638;
            bool _4642 = _4610 != 0.0;
            bool _4644 = isnan(_4610);
            bool _4646 = _4642 || _4644;
            bool _4648 = isnan(0.0);
            bool _4650 = _4646 || _4648;
            bool _4652 = !_4640;
            bool _4654 = _4650 || _4652;
            if (_4654)
            {
                _4628 = 1;
            }
            int _4656 = _4628;
            _4630 = _4656;
            if (!_4654)
            {
                float2 _11338 = float2(_138, _4612);
                float2 _4658 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11338, float2(0.0), isnan(_11338)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11338, float2(0.0), isnan(_11338)), level(0.0)).xy;
                float _4660 = _4658.x;
                float _4662 = _4658.y;
                float _4664 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4612);
                _4630 = _4606;
                _4618 = _4660;
                _4620 = _4662;
                _4622 = _4664;
            }
        }
        int _4666 = _4630;
        float _4668 = _4618;
        float _4670 = _4620;
        float _4672 = _4622;
        int _4674 = _4666 & 1;
        bool _4676 = _4674 != 0;
        float _4678 = _4668;
        float _4680 = _4670;
        float _4682 = _4672;
        int _4684 = _4666;
        if (_4676)
        {
            _4624 = _4666;
        }
        int _4686 = _4624;
        int _4688 = _4686;
        int _4690 = _4686;
        if (!_4676)
        {
            bool _4692 = _4668 > 0.800000011920928955078125;
            bool _4694 = isnan(_4668);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan(0.800000011920928955078125);
            bool _4700 = _4696 || _4698;
            bool _4702 = _4670 != 0.0;
            bool _4704 = isnan(_4670);
            bool _4706 = _4702 || _4704;
            bool _4708 = isnan(0.0);
            bool _4710 = _4706 || _4708;
            bool _4712 = !_4700;
            bool _4714 = _4710 || _4712;
            if (_4714)
            {
                _4688 = 1;
            }
            int _4716 = _4688;
            _4690 = _4716;
            if (!_4714)
            {
                float2 _11417 = float2(_138, _4672);
                float2 _4718 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11417, float2(0.0), isnan(_11417)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11417, float2(0.0), isnan(_11417)), level(0.0)).xy;
                float _4720 = _4718.x;
                float _4722 = _4718.y;
                float _4724 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4672);
                _4690 = _4666;
                _4678 = _4720;
                _4680 = _4722;
                _4682 = _4724;
            }
        }
        int _4726 = _4690;
        float _4728 = _4678;
        float _4730 = _4680;
        float _4732 = _4682;
        int _4734 = _4726 & 1;
        bool _4736 = _4734 != 0;
        float _4738 = _4728;
        float _4740 = _4730;
        float _4742 = _4732;
        int _4744 = _4726;
        if (_4736)
        {
            _4684 = _4726;
        }
        int _4746 = _4684;
        int _4748 = _4746;
        int _4750 = _4746;
        if (!_4736)
        {
            bool _4752 = _4728 > 0.800000011920928955078125;
            bool _4754 = isnan(_4728);
            bool _4756 = _4752 || _4754;
            bool _4758 = isnan(0.800000011920928955078125);
            bool _4760 = _4756 || _4758;
            bool _4762 = _4730 != 0.0;
            bool _4764 = isnan(_4730);
            bool _4766 = _4762 || _4764;
            bool _4768 = isnan(0.0);
            bool _4770 = _4766 || _4768;
            bool _4772 = !_4760;
            bool _4774 = _4770 || _4772;
            if (_4774)
            {
                _4748 = 1;
            }
            int _4776 = _4748;
            _4750 = _4776;
            if (!_4774)
            {
                float2 _11496 = float2(_138, _4732);
                float2 _4778 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11496, float2(0.0), isnan(_11496)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11496, float2(0.0), isnan(_11496)), level(0.0)).xy;
                float _4780 = _4778.x;
                float _4782 = _4778.y;
                float _4784 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4732);
                _4750 = _4726;
                _4738 = _4780;
                _4740 = _4782;
                _4742 = _4784;
            }
        }
        int _4786 = _4750;
        float _4788 = _4738;
        float _4790 = _4740;
        float _4792 = _4742;
        int _4794 = _4786 & 1;
        bool _4796 = _4794 != 0;
        float _4798 = _4792;
        float _4800 = _4788;
        float _4802 = _4790;
        if (_4796)
        {
            _4744 = _4786;
        }
        int _4804 = _4744;
        int _4806 = _4804;
        int _4808 = _4804;
        if (!_4796)
        {
            bool _4810 = _4788 > 0.800000011920928955078125;
            bool _4812 = isnan(_4788);
            bool _4814 = _4810 || _4812;
            bool _4816 = isnan(0.800000011920928955078125);
            bool _4818 = _4814 || _4816;
            bool _4820 = _4790 != 0.0;
            bool _4822 = isnan(_4790);
            bool _4824 = _4820 || _4822;
            bool _4826 = isnan(0.0);
            bool _4828 = _4824 || _4826;
            bool _4830 = !_4818;
            bool _4832 = _4828 || _4830;
            if (_4832)
            {
                _4806 = 1;
            }
            int _4834 = _4806;
            _4808 = _4834;
            if (!_4832)
            {
                float2 _11574 = float2(_138, _4792);
                float2 _4836 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11574, float2(0.0), isnan(_11574)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11574, float2(0.0), isnan(_11574)), level(0.0)).xy;
                float _4838 = _4836.x;
                float _4840 = _4836.y;
                float _4842 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4792);
                _4808 = _4786;
                _4798 = _4842;
                _4800 = _4838;
                _4802 = _4840;
            }
        }
        int _4844 = _4808;
        float _4846 = _4798;
        float _4848 = _4800;
        float _4850 = _4802;
        int _4852 = _4844 & 1;
        bool _4854 = _4852 != 0;
        float _4856 = _4850;
        float _4858 = _4848;
        if (_4854)
        {
            _3180 = _4846;
        }
        float _4860 = _3180;
        float _4862 = _4860;
        float _4864 = _4860;
        if (!_4854)
        {
            bool _4866 = _4848 > 0.800000011920928955078125;
            bool _4868 = isnan(_4848);
            bool _4870 = _4866 || _4868;
            bool _4872 = isnan(0.800000011920928955078125);
            bool _4874 = _4870 || _4872;
            bool _4876 = _4850 != 0.0;
            bool _4878 = isnan(_4850);
            bool _4880 = _4876 || _4878;
            bool _4882 = isnan(0.0);
            bool _4884 = _4880 || _4882;
            bool _4886 = !_4874;
            bool _4888 = _4884 || _4886;
            if (_4888)
            {
                _4862 = _4846;
            }
            float _4890 = _4862;
            _4864 = _4890;
            if (!_4888)
            {
                float2 _11652 = float2(_138, _4846);
                float2 _4892 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11652, float2(0.0), isnan(_11652)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11652, float2(0.0), isnan(_11652)), level(0.0)).xy;
                float _4894 = _4892.x;
                float _4896 = _4892.y;
                float _4898 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4846);
                _4856 = _4896;
                _4858 = _4894;
                _4864 = _4898;
            }
        }
        float _4900 = _4856;
        float _4902 = _4858;
        float _4904 = _4864;
        float _4906 = fma(_4900, 0.5, 0.5234375);
        float _4908 = fma(_4902, 2.0, 0.03125);
        float _4910 = fma(_4080, 2.0, 0.03125);
        float _4912 = fma(_4082, 0.5, 0.0078125);
        float2 _11684 = float2(_4906, _4908);
        float _4914 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_11684, float2(0.0), isnan(_11684)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_11684, float2(0.0), isnan(_11684)), level(0.0)).x;
        float2 _11692 = float2(_4912, _4910);
        float _4916 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_11692, float2(0.0), isnan(_11692)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_11692, float2(0.0), isnan(_11692)), level(0.0)).x;
        float _4918 = fma(_4914, -2.007874011993408203125, 3.25);
        float _4920 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _4922 = fma(_4918, _4920, _4904);
        float _4924 = fma(_4916, -2.007874011993408203125, 3.25);
        float2 _11711 = float2(_142, _4922);
        float _4926 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11711, float2(0.0), isnan(_11711)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11711, float2(0.0), isnan(_11711)), level(0.0), int2(0, 1)).y;
        float _4928 = fma(_4924, (*spvDescriptorSet0.cp_c3)._m0[0].w, _4084);
        float2 _11724 = float2(_142, _4928);
        float _4930 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11724, float2(0.0), isnan(_11724)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11724, float2(0.0), isnan(_11724)), level(0.0)).y;
        float _4932 = -_128;
        float _4934 = fma(_4928, (*spvDescriptorSet0.cp_c3)._m0[0].y, _4932);
        float _4936 = -_128;
        float _4938 = fma(_4922, (*spvDescriptorSet0.cp_c3)._m0[0].y, _4936);
        float _4940 = rint(_4938);
        float _4942 = rint(_4934);
        float _4944 = abs(_4940);
        float _4946 = sqrt(_4944);
        float _4948 = abs(_4942);
        float _4950 = sqrt(_4948);
        float _4952 = _4926 * 4.0;
        float _4954 = rint(_4952);
        float _4956 = _4930 * 4.0;
        float _4958 = rint(_4956);
        float _4960 = fma(_4954, 16.0, _4946);
        float _4962 = fma(_4960, 0.001785714295692741870880126953125, 0.0008928571478463709354400634765625);
        float _4964 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _4962);
        float _4966 = fma(_4958, 16.0, _4950);
        float _4968 = fma(_4966, 0.0062500000931322574615478515625, 0.00312500004656612873077392578125);
        float2 _11780 = float2(_126, _4928);
        float _4970 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11780, float2(0.0), isnan(_11780)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11780, float2(0.0), isnan(_11780)), level(0.0), int2(1, 0)).y;
        float2 _11788 = float2(_126, _4928);
        float _4972 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11788, float2(0.0), isnan(_11788)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11788, float2(0.0), isnan(_11788)), level(0.0), int2(-2, 0)).y;
        float2 _11797 = float2(_126, _4922);
        float _4974 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11797, float2(0.0), isnan(_11797)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11797, float2(0.0), isnan(_11797)), level(0.0), int2(1)).y;
        float2 _11805 = float2(_126, _4922);
        float _4976 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11805, float2(0.0), isnan(_11805)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11805, float2(0.0), isnan(_11805)), level(0.0), int2(-2, 1)).y;
        float2 _11814 = float2(_4968, _4964);
        float2 _4978 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_11814, float2(0.0), isnan(_11814)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_11814, float2(0.0), isnan(_11814)), level(0.0)).xy;
        float _4980 = _4978.x;
        float _4982 = _4978.y;
        float _4984 = abs(_4940);
        float _4986 = abs(_4942);
        bool _4988 = _4984 >= _4986;
        bool _4990 = isnan(_4984);
        bool _4992 = _4988 || _4990;
        bool _4994 = isnan(_4986);
        bool _4996 = _4992 || _4994;
        float _4998 = float(_4996);
        float _5000 = abs(_4942);
        float _5002 = abs(_4940);
        bool _5004 = _5000 >= _5002;
        bool _5006 = isnan(_5000);
        bool _5008 = _5004 || _5006;
        bool _5010 = isnan(_5002);
        bool _5012 = _5008 || _5010;
        float _5014 = float(_5012);
        float _5016 = _4998 + _5014;
        float _5018 = 1.0 / _5016;
        float _5020 = _5018 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        float _5022 = _4998 * _5020;
        float _5024 = _5014 * _5020;
        float _5026 = -_5022;
        float _5028 = fma(_5026, _4970, 1.0);
        float _5030 = -_5022;
        float _5032 = fma(_5030, _4972, 1.0);
        float _5034 = -_5024;
        float _5036 = fma(_5034, _4974, _5028);
        float _5038 = precise::clamp(_5036, 0.0, 1.0);
        float _5040 = -_5024;
        float _5042 = fma(_5040, _4976, _5032);
        float _5044 = precise::clamp(_5042, 0.0, 1.0);
        float _5046 = _4980 * _5038;
        float _5048 = _4982 * _5044;
        _5050 = _5046;
        _5052 = _5048;
        _5054 = true;
    }
    else
    {
        _5050 = 0.0;
        _5052 = 0.0;
    }
    _5054 = false;
    float _5056 = _5050;
    float _5058 = _5052;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3098, _3100, _5056, _5058), uint2(int2(_114, _118)));
}

