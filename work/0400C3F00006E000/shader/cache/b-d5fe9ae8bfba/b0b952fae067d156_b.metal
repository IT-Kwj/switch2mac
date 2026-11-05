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
int _48(thread const int& _13317, thread const int& _13318, constant _10& support_buffer)
{
    int _13321 = 1 + _13318;
    float _13323 = support_buffer._m5[_13321].x;
    bool _13325 = _13323 == 1.0;
    if (_13325)
    {
        return _13317;
    }
    float _13327 = float(_13317);
    float _13329 = _13327 * _13323;
    int _13331 = int(_13329);
    return _13331;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    bool _5590 = false;
    bool _1470 = false;
    bool _1136 = false;
    bool _668 = false;
    bool _410 = false;
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
    float _108 = float(as_type<int>(_104));
    float _110 = float(as_type<int>(_106));
    float _112 = _108 + 0.5;
    float _114 = _110 + 0.5;
    float _116 = _112 * (*spvDescriptorSet0.cp_c3)._m0[0].z;
    float _118 = _114 * (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float2 _5684 = float2(_116, _118);
    float2 _120 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5684, float2(0.0), isnan(_5684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5684, float2(0.0), isnan(_5684)), level(0.0)).xy;
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
            float2 _5768 = float2(_182, _184);
            float2 _186 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5768, float2(0.0), isnan(_5768)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5768, float2(0.0), isnan(_5768)), level(0.0)).xy;
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
            if (!_206)
            {
                float _216 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _218 = _182 + _216;
                float _220 = _184 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _5814 = float2(_218, _220);
                float2 _222 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5814, float2(0.0), isnan(_5814)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5814, float2(0.0), isnan(_5814)), level(0.0)).xy;
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
                    float2 _5861 = float2(_246, _248);
                    float2 _250 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5861, float2(0.0), isnan(_5861)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5861, float2(0.0), isnan(_5861)), level(0.0)).xy;
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
                    if (!_270)
                    {
                        float _272 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _274 = _246 + _272;
                        float _276 = _248 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _5908 = float2(_274, _276);
                        float2 _278 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xy;
                        float _280 = _278.x;
                        float _282 = _278.y;
                        float _284 = _282 + _280;
                        float _286 = _284 * 0.5;
                        bool _288 = _286 >= 0.89999997615814208984375;
                        bool _290 = isnan(_286);
                        bool _292 = _288 || _290;
                        bool _294 = isnan(0.89999997615814208984375);
                        bool _296 = _292 || _294;
                        bool _298 = !_296;
                        _208 = _282;
                        _210 = 3.0;
                        _212 = _286;
                        _214 = _282;
                        if (!_298)
                        {
                            float _300 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _302 = _274 + _300;
                            float _304 = _276 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float2 _5955 = float2(_302, _304);
                            float2 _306 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).xy;
                            float _308 = _306.x;
                            float _310 = _306.y;
                            float _312 = _310 + _308;
                            float _314 = _312 * 0.5;
                            bool _316 = _314 >= 0.89999997615814208984375;
                            bool _318 = isnan(_314);
                            bool _320 = _316 || _318;
                            bool _322 = isnan(0.89999997615814208984375);
                            bool _324 = _320 || _322;
                            bool _326 = !_324;
                            _208 = _310;
                            _210 = 4.0;
                            _212 = _314;
                            _214 = _310;
                            if (!_326)
                            {
                                float _328 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _330 = _302 + _328;
                                float _332 = _304 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float2 _6002 = float2(_330, _332);
                                float2 _334 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6002, float2(0.0), isnan(_6002)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6002, float2(0.0), isnan(_6002)), level(0.0)).xy;
                                float _336 = _334.x;
                                float _338 = _334.y;
                                float _340 = _338 + _336;
                                float _342 = _340 * 0.5;
                                bool _344 = _342 >= 0.89999997615814208984375;
                                bool _346 = isnan(_342);
                                bool _348 = _344 || _346;
                                bool _350 = isnan(0.89999997615814208984375);
                                bool _352 = _348 || _350;
                                bool _354 = !_352;
                                _208 = _338;
                                _210 = 5.0;
                                _212 = _342;
                                _214 = _338;
                                if (!_354)
                                {
                                    float _356 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _358 = _330 + _356;
                                    float _360 = _332 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float2 _6049 = float2(_358, _360);
                                    float2 _362 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6049, float2(0.0), isnan(_6049)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6049, float2(0.0), isnan(_6049)), level(0.0)).xy;
                                    float _364 = _362.x;
                                    float _366 = _362.y;
                                    float _368 = _366 + _364;
                                    float _370 = _368 * 0.5;
                                    bool _372 = _370 >= 0.89999997615814208984375;
                                    bool _374 = isnan(_370);
                                    bool _376 = _372 || _374;
                                    bool _378 = isnan(0.89999997615814208984375);
                                    bool _380 = _376 || _378;
                                    bool _382 = !_380;
                                    _208 = _366;
                                    _210 = 6.0;
                                    _212 = _370;
                                    _214 = _366;
                                    if (!_382)
                                    {
                                        float _384 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                        float _386 = _358 + _384;
                                        float _388 = _360 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                        float2 _6096 = float2(_386, _388);
                                        float2 _390 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6096, float2(0.0), isnan(_6096)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6096, float2(0.0), isnan(_6096)), level(0.0)).xy;
                                        float _392 = _390.x;
                                        float _394 = _390.y;
                                        float _396 = _394 + _392;
                                        float _398 = _396 * 0.5;
                                        bool _400 = _398 >= 0.89999997615814208984375;
                                        bool _402 = isnan(_398);
                                        bool _404 = _400 || _402;
                                        bool _406 = isnan(0.89999997615814208984375);
                                        bool _408 = _404 || _406;
                                        _208 = _394;
                                        _212 = _398;
                                        if (!_408)
                                        {
                                            _210 = 7.0;
                                            _410 = true;
                                        }
                                        else
                                        {
                                            _210 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _410 = false;
            float _412 = _208;
            float _414 = _210;
            float _416 = _212;
            float _418 = _214;
            bool _420 = _412 >= 0.89999997615814208984375;
            bool _422 = isnan(_412);
            bool _424 = _420 || _422;
            bool _426 = isnan(0.89999997615814208984375);
            bool _428 = _424 || _426;
            float _430 = float(_428);
            float _432 = _430 + _414;
            _170 = _432;
            _176 = _416;
            _178 = _418;
        }
        float _434 = _170;
        float _436 = _176;
        float _438 = _178;
        float _440 = _116 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _442 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _444 = _118 + _442;
        float2 _6177 = float2(_440, _444);
        float2 _446 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6177, float2(0.0), isnan(_6177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6177, float2(0.0), isnan(_6177)), level(0.0)).xy;
        float _448 = _446.x;
        float _450 = _446.y;
        float _452 = _448 + _450;
        float _454 = _452 * 0.5;
        bool _456 = _454 >= 0.89999997615814208984375;
        bool _458 = isnan(_454);
        bool _460 = _456 || _458;
        bool _462 = isnan(0.89999997615814208984375);
        bool _464 = _460 || _462;
        bool _466 = !_464;
        float _468 = 0.0;
        float _470 = _454;
        float _472 = _438;
        if (!_466)
        {
            float _474 = _440 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _476 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _478 = _444 + _476;
            float2 _6222 = float2(_474, _478);
            float2 _480 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6222, float2(0.0), isnan(_6222)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6222, float2(0.0), isnan(_6222)), level(0.0)).xy;
            float _482 = _480.x;
            float _484 = _480.y;
            float _486 = _484 + _482;
            float _488 = _486 * 0.5;
            bool _490 = _488 >= 0.89999997615814208984375;
            bool _492 = isnan(_488);
            bool _494 = _490 || _492;
            bool _496 = isnan(0.89999997615814208984375);
            bool _498 = _494 || _496;
            bool _500 = !_498;
            _468 = 1.0;
            _470 = _488;
            if (!_500)
            {
                float _502 = _474 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _504 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _506 = _478 + _504;
                float2 _6266 = float2(_502, _506);
                float2 _508 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6266, float2(0.0), isnan(_6266)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6266, float2(0.0), isnan(_6266)), level(0.0)).xy;
                float _510 = _508.x;
                float _512 = _508.y;
                float _514 = _512 + _510;
                float _516 = _514 * 0.5;
                bool _518 = _516 >= 0.89999997615814208984375;
                bool _520 = isnan(_516);
                bool _522 = _518 || _520;
                bool _524 = isnan(0.89999997615814208984375);
                bool _526 = _522 || _524;
                bool _528 = !_526;
                _468 = 2.0;
                _470 = _516;
                if (!_528)
                {
                    float _530 = _502 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _532 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _534 = _506 + _532;
                    float2 _6310 = float2(_530, _534);
                    float2 _536 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xy;
                    float _538 = _536.x;
                    float _540 = _536.y;
                    float _542 = _540 + _538;
                    float _544 = _542 * 0.5;
                    bool _546 = _544 >= 0.89999997615814208984375;
                    bool _548 = isnan(_544);
                    bool _550 = _546 || _548;
                    bool _552 = isnan(0.89999997615814208984375);
                    bool _554 = _550 || _552;
                    bool _556 = !_554;
                    _468 = 3.0;
                    _470 = _544;
                    if (!_556)
                    {
                        float _558 = _530 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _560 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float _562 = _534 + _560;
                        float2 _6354 = float2(_558, _562);
                        float2 _564 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6354, float2(0.0), isnan(_6354)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6354, float2(0.0), isnan(_6354)), level(0.0)).xy;
                        float _566 = _564.x;
                        float _568 = _564.y;
                        float _570 = _568 + _566;
                        float _572 = _570 * 0.5;
                        bool _574 = _572 >= 0.89999997615814208984375;
                        bool _576 = isnan(_572);
                        bool _578 = _574 || _576;
                        bool _580 = isnan(0.89999997615814208984375);
                        bool _582 = _578 || _580;
                        bool _584 = !_582;
                        _468 = 4.0;
                        _470 = _572;
                        if (!_584)
                        {
                            float _586 = _558 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _588 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float _590 = _562 + _588;
                            float2 _6398 = float2(_586, _590);
                            float2 _592 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6398, float2(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6398, float2(0.0), isnan(_6398)), level(0.0)).xy;
                            float _594 = _592.x;
                            float _596 = _592.y;
                            float _598 = _596 + _594;
                            float _600 = _598 * 0.5;
                            bool _602 = _600 >= 0.89999997615814208984375;
                            bool _604 = isnan(_600);
                            bool _606 = _602 || _604;
                            bool _608 = isnan(0.89999997615814208984375);
                            bool _610 = _606 || _608;
                            bool _612 = !_610;
                            _468 = 5.0;
                            _470 = _600;
                            if (!_612)
                            {
                                float _614 = _586 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _616 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float _618 = _590 + _616;
                                float2 _6442 = float2(_614, _618);
                                float2 _620 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6442, float2(0.0), isnan(_6442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6442, float2(0.0), isnan(_6442)), level(0.0)).xy;
                                float _622 = _620.x;
                                float _624 = _620.y;
                                float _626 = _624 + _622;
                                float _628 = _626 * 0.5;
                                bool _630 = _628 >= 0.89999997615814208984375;
                                bool _632 = isnan(_628);
                                bool _634 = _630 || _632;
                                bool _636 = isnan(0.89999997615814208984375);
                                bool _638 = _634 || _636;
                                bool _640 = !_638;
                                _468 = 6.0;
                                _470 = _628;
                                if (!_640)
                                {
                                    float _642 = _614 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _644 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float _646 = _618 + _644;
                                    float2 _6486 = float2(_642, _646);
                                    float2 _648 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6486, float2(0.0), isnan(_6486)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6486, float2(0.0), isnan(_6486)), level(0.0)).xy;
                                    float _650 = _648.x;
                                    float _652 = _648.y;
                                    float _654 = _652 + _650;
                                    float _656 = _654 * 0.5;
                                    bool _658 = _656 >= 0.89999997615814208984375;
                                    bool _660 = isnan(_656);
                                    bool _662 = _658 || _660;
                                    bool _664 = isnan(0.89999997615814208984375);
                                    bool _666 = _662 || _664;
                                    _470 = _656;
                                    if (!_666)
                                    {
                                        _468 = 7.0;
                                        _668 = true;
                                    }
                                    else
                                    {
                                        _468 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _668 = false;
        float _670 = _468;
        float _672 = _470;
        float _674 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 0.25, _116);
        float _676 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
        float _678 = _674 + _676;
        float2 _6540 = float2(_678, _444);
        float2 _680 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6540, float2(0.0), isnan(_6540)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6540, float2(0.0), isnan(_6540)), level(0.0)).xy;
        float _682 = _680.x;
        float _684 = _680.y;
        float _686 = _434 + _670;
        bool _688 = _686 > 2.0;
        float _690 = _686;
        float _692 = _672;
        float _694 = _678;
        int _696 = 1084227584;
        int _698 = 1084227584;
        _160 = as_type<int>((*spvDescriptorSet0.cp_c3)._m0[0].z);
        if (!_688)
        {
            _690 = 0.0;
            _472 = 0.0;
        }
        float _700 = _690;
        float _702 = _472;
        bool _704 = !_688;
        float _706 = _700;
        float _708 = _702;
        int _710 = 0;
        if (!_704)
        {
            float _712 = -_434;
            float _714 = _712 + 0.25;
            float _716 = -_670;
            float _718 = _716 + (-0.25);
            float _720 = fma(_434, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float _722 = fma(_670, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _724 = fma(_714, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _726 = fma(_718, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float2 _6605 = float2(_724, _720);
            float2 _728 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6605, float2(0.0), isnan(_6605)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6605, float2(0.0), isnan(_6605)), level(0.0), int2(-1, 0)).xy;
            float _730 = _728.x;
            float _732 = _728.y;
            float2 _6619 = float2(_722, _726);
            float2 _734 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6619, float2(0.0), isnan(_6619)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6619, float2(0.0), isnan(_6619)), level(0.0), int2(1, 0)).xy;
            float _736 = _734.x;
            float _738 = _734.y;
            bool _740 = _672 <= 0.89999997615814208984375;
            bool _742 = isnan(_672);
            bool _744 = _740 || _742;
            bool _746 = isnan(0.89999997615814208984375);
            bool _748 = _744 || _746;
            float _750 = float(_748);
            float _752 = fma(_736, 5.0, -3.75);
            float _754 = rint(_732);
            float _756 = abs(_752);
            float _758 = _736 * _756;
            float _760 = fma(_730, 5.0, -3.75);
            float _762 = abs(_760);
            float _764 = _730 * _762;
            float _766 = rint(_738);
            bool _768 = _436 <= 0.89999997615814208984375;
            bool _770 = isnan(_436);
            bool _772 = _768 || _770;
            bool _774 = isnan(0.89999997615814208984375);
            bool _776 = _772 || _774;
            float _778 = float(_776);
            float _780 = rint(_758);
            float _782 = rint(_764);
            float _784 = fma(_766, 2.0, _780);
            float _786 = _784 * _750;
            float _788 = fma(_754, 2.0, _782);
            float _790 = fma(_786, 20.0, _670);
            float _792 = _788 * _778;
            float _794 = fma(_790, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _796 = fma(_792, 20.0, _434);
            float _798 = fma((*spvDescriptorSet0.cp_c3)._m0[3].z, 0.14285714924335479736328125, _794);
            float _800 = fma(_796, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _802 = _800 + 0.5;
            float2 _6715 = float2(_802, _798);
            float2 _804 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).xy;
            float _806 = _804.x;
            float _808 = _804.y;
            _692 = _798;
            _706 = _806;
            _708 = _808;
            _710 = as_type<int>(_730);
        }
        float _810 = _692;
        float _812 = _706;
        float _814 = _708;
        int _816 = _710;
        float _818 = fma(_682, 5.0, -3.75);
        float _820 = rint(_684);
        float _822 = abs(_818);
        float _824 = _682 * _822;
        float _826 = rint(_824);
        float _828 = _826 + _820;
        float _830 = _828 * 0.5;
        bool _832 = _830 >= 0.89999997615814208984375;
        bool _834 = isnan(_830);
        bool _836 = _832 || _834;
        bool _838 = isnan(0.89999997615814208984375);
        bool _840 = _836 || _838;
        bool _842 = !_840;
        float _844 = _810;
        float _846 = _826;
        float _848 = 0.0;
        float _850 = _830;
        float _852 = _814;
        float _854 = _812;
        int _856 = _816;
        if (!_842)
        {
            float _858 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _860 = _678 + _858;
            float _862 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
            float _864 = _444 + _862;
            float2 _6787 = float2(_860, _864);
            float2 _866 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6787, float2(0.0), isnan(_6787)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6787, float2(0.0), isnan(_6787)), level(0.0)).xy;
            float _868 = _866.x;
            float _870 = _866.y;
            float _872 = fma(_868, 5.0, -3.75);
            float _874 = rint(_870);
            float _876 = abs(_872);
            float _878 = _868 * _876;
            float _880 = rint(_878);
            float _882 = _880 + _874;
            float _884 = _882 * 0.5;
            bool _886 = _884 >= 0.89999997615814208984375;
            bool _888 = isnan(_884);
            bool _890 = _886 || _888;
            bool _892 = isnan(0.89999997615814208984375);
            bool _894 = _890 || _892;
            bool _896 = !_894;
            _844 = _880;
            _846 = _874;
            _848 = 1.0;
            _694 = _860;
            _850 = _884;
            if (!_896)
            {
                float _898 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _900 = _860 + _898;
                float _902 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                float _904 = _864 + _902;
                float2 _6847 = float2(_900, _904);
                float2 _906 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6847, float2(0.0), isnan(_6847)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6847, float2(0.0), isnan(_6847)), level(0.0)).xy;
                float _908 = _906.x;
                float _910 = _906.y;
                float _912 = fma(_908, 5.0, -3.75);
                float _914 = rint(_910);
                float _916 = abs(_912);
                float _918 = _908 * _916;
                float _920 = rint(_918);
                float _922 = _920 + _914;
                float _924 = _922 * 0.5;
                bool _926 = _924 >= 0.89999997615814208984375;
                bool _928 = isnan(_924);
                bool _930 = _926 || _928;
                bool _932 = isnan(0.89999997615814208984375);
                bool _934 = _930 || _932;
                bool _936 = !_934;
                _844 = _920;
                _846 = _914;
                _848 = 2.0;
                _694 = _900;
                _850 = _924;
                if (!_936)
                {
                    float _938 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _940 = _900 + _938;
                    float _942 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float _944 = _904 + _942;
                    float2 _6907 = float2(_940, _944);
                    float2 _946 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6907, float2(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6907, float2(0.0), isnan(_6907)), level(0.0)).xy;
                    float _948 = _946.x;
                    float _950 = _946.y;
                    float _952 = fma(_948, 5.0, -3.75);
                    float _954 = rint(_950);
                    float _956 = abs(_952);
                    float _958 = _948 * _956;
                    float _960 = rint(_958);
                    float _962 = _960 + _954;
                    float _964 = _962 * 0.5;
                    bool _966 = _964 >= 0.89999997615814208984375;
                    bool _968 = isnan(_964);
                    bool _970 = _966 || _968;
                    bool _972 = isnan(0.89999997615814208984375);
                    bool _974 = _970 || _972;
                    bool _976 = !_974;
                    _844 = _960;
                    _846 = _954;
                    _848 = 3.0;
                    _694 = _940;
                    _850 = _964;
                    if (!_976)
                    {
                        float _978 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _980 = _940 + _978;
                        float _982 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float _984 = _944 + _982;
                        float2 _6967 = float2(_980, _984);
                        float2 _986 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_6967, float2(0.0), isnan(_6967)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_6967, float2(0.0), isnan(_6967)), level(0.0)).xy;
                        float _988 = _986.x;
                        float _990 = _986.y;
                        float _992 = fma(_988, 5.0, -3.75);
                        float _994 = rint(_990);
                        float _996 = abs(_992);
                        float _998 = _988 * _996;
                        float _1000 = rint(_998);
                        float _1002 = _1000 + _994;
                        float _1004 = _1002 * 0.5;
                        bool _1006 = _1004 >= 0.89999997615814208984375;
                        bool _1008 = isnan(_1004);
                        bool _1010 = _1006 || _1008;
                        bool _1012 = isnan(0.89999997615814208984375);
                        bool _1014 = _1010 || _1012;
                        bool _1016 = !_1014;
                        _844 = _1000;
                        _846 = _994;
                        _848 = 4.0;
                        _694 = _980;
                        _850 = _1004;
                        if (!_1016)
                        {
                            float _1018 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _1020 = _980 + _1018;
                            float _1022 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float _1024 = _984 + _1022;
                            float2 _7027 = float2(_1020, _1024);
                            float2 _1026 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7027, float2(0.0), isnan(_7027)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7027, float2(0.0), isnan(_7027)), level(0.0)).xy;
                            float _1028 = _1026.x;
                            float _1030 = _1026.y;
                            float _1032 = fma(_1028, 5.0, -3.75);
                            float _1034 = rint(_1030);
                            float _1036 = abs(_1032);
                            float _1038 = _1028 * _1036;
                            float _1040 = rint(_1038);
                            float _1042 = _1040 + _1034;
                            float _1044 = _1042 * 0.5;
                            bool _1046 = _1044 >= 0.89999997615814208984375;
                            bool _1048 = isnan(_1044);
                            bool _1050 = _1046 || _1048;
                            bool _1052 = isnan(0.89999997615814208984375);
                            bool _1054 = _1050 || _1052;
                            bool _1056 = !_1054;
                            _844 = _1040;
                            _846 = _1034;
                            _848 = 5.0;
                            _694 = _1020;
                            _850 = _1044;
                            if (!_1056)
                            {
                                float _1058 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _1060 = _1020 + _1058;
                                float _1062 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float _1064 = _1024 + _1062;
                                float2 _7087 = float2(_1060, _1064);
                                float2 _1066 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7087, float2(0.0), isnan(_7087)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7087, float2(0.0), isnan(_7087)), level(0.0)).xy;
                                float _1068 = _1066.x;
                                float _1070 = _1066.y;
                                float _1072 = fma(_1068, 5.0, -3.75);
                                float _1074 = rint(_1070);
                                float _1076 = abs(_1072);
                                float _1078 = _1068 * _1076;
                                float _1080 = rint(_1078);
                                float _1082 = _1080 + _1074;
                                float _1084 = _1082 * 0.5;
                                bool _1086 = _1084 >= 0.89999997615814208984375;
                                bool _1088 = isnan(_1084);
                                bool _1090 = _1086 || _1088;
                                bool _1092 = isnan(0.89999997615814208984375);
                                bool _1094 = _1090 || _1092;
                                bool _1096 = !_1094;
                                _844 = _1080;
                                _846 = _1074;
                                _848 = 6.0;
                                _694 = _1060;
                                _850 = _1084;
                                if (!_1096)
                                {
                                    float _1098 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _1100 = _1060 + _1098;
                                    float _1102 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float _1104 = _1064 + _1102;
                                    float2 _7147 = float2(_1100, _1104);
                                    float2 _1106 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7147, float2(0.0), isnan(_7147)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7147, float2(0.0), isnan(_7147)), level(0.0)).xy;
                                    float _1108 = _1106.x;
                                    float _1110 = _1106.y;
                                    float _1112 = fma(_1108, 5.0, -3.75);
                                    float _1114 = rint(_1110);
                                    float _1116 = abs(_1112);
                                    float _1118 = _1108 * _1116;
                                    float _1120 = rint(_1118);
                                    float _1122 = _1120 + _1114;
                                    float _1124 = _1122 * 0.5;
                                    bool _1126 = _1124 >= 0.89999997615814208984375;
                                    bool _1128 = isnan(_1124);
                                    bool _1130 = _1126 || _1128;
                                    bool _1132 = isnan(0.89999997615814208984375);
                                    bool _1134 = _1130 || _1132;
                                    _694 = _1110;
                                    _850 = _1124;
                                    if (!_1134)
                                    {
                                        _848 = 7.0;
                                        _1136 = true;
                                    }
                                    else
                                    {
                                        _848 = 7.0;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        _1136 = false;
        float _1138 = _844;
        float _1140 = _846;
        float _1142 = _848;
        float _1144 = _694;
        float _1146 = _850;
        float2 _7205 = float2(_116, _118);
        float _1148 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7205, float2(0.0), isnan(_7205)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7205, float2(0.0), isnan(_7205)), level(0.0), int2(1, 0)).x;
        bool _1150 = _1148 > 0.0;
        float _1152 = _1144;
        float _1154 = _1148;
        float _1156 = _1138;
        float _1158 = _1140;
        float _1160 = _1142;
        float _1162 = _1146;
        if (!_1150)
        {
            _1152 = 0.0;
        }
        float _1164 = _1152;
        float _1166 = _1164;
        if (!_1150)
        {
            _1154 = 0.0;
        }
        float _1168 = _1154;
        bool _1170 = !_1150;
        float _1172 = _1168;
        if (!_1170)
        {
            float _1174 = _674 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _1176 = _118 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
            float2 _7246 = float2(_1174, _1176);
            float2 _1178 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7246, float2(0.0), isnan(_7246)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7246, float2(0.0), isnan(_7246)), level(0.0)).xy;
            float _1180 = _1178.x;
            float _1182 = _1178.y;
            float _1184 = fma(_1180, 5.0, -3.75);
            float _1186 = rint(_1182);
            float _1188 = abs(_1184);
            float _1190 = _1180 * _1188;
            float _1192 = rint(_1190);
            float _1194 = _1192 + _1186;
            float _1196 = _1194 * 0.5;
            bool _1198 = _1196 >= 0.89999997615814208984375;
            bool _1200 = isnan(_1196);
            bool _1202 = _1198 || _1200;
            bool _1204 = isnan(0.89999997615814208984375);
            bool _1206 = _1202 || _1204;
            bool _1208 = !_1206;
            float _1210 = _1186;
            float _1212 = _1196;
            float _1214 = 0.0;
            float _1216 = _1190;
            float _1218 = _1182;
            if (!_1208)
            {
                float _1220 = _1174 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                float _1222 = _1176 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                float2 _7302 = float2(_1220, _1222);
                float2 _1224 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7302, float2(0.0), isnan(_7302)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7302, float2(0.0), isnan(_7302)), level(0.0)).xy;
                float _1226 = _1224.x;
                float _1228 = _1224.y;
                float _1230 = fma(_1226, 5.0, -3.75);
                float _1232 = rint(_1228);
                float _1234 = abs(_1230);
                float _1236 = _1226 * _1234;
                float _1238 = rint(_1236);
                float _1240 = _1238 + _1232;
                float _1242 = _1240 * 0.5;
                bool _1244 = _1242 >= 0.89999997615814208984375;
                bool _1246 = isnan(_1242);
                bool _1248 = _1244 || _1246;
                bool _1250 = isnan(0.89999997615814208984375);
                bool _1252 = _1248 || _1250;
                bool _1254 = !_1252;
                _1210 = _1232;
                _1212 = _1242;
                _1214 = 1.0;
                _1216 = _1236;
                _1218 = _1228;
                if (!_1254)
                {
                    float _1256 = _1220 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                    float _1258 = _1222 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                    float2 _7358 = float2(_1256, _1258);
                    float2 _1260 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7358, float2(0.0), isnan(_7358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7358, float2(0.0), isnan(_7358)), level(0.0)).xy;
                    float _1262 = _1260.x;
                    float _1264 = _1260.y;
                    float _1266 = fma(_1262, 5.0, -3.75);
                    float _1268 = rint(_1264);
                    float _1270 = abs(_1266);
                    float _1272 = _1262 * _1270;
                    float _1274 = rint(_1272);
                    float _1276 = _1274 + _1268;
                    float _1278 = _1276 * 0.5;
                    bool _1280 = _1278 >= 0.89999997615814208984375;
                    bool _1282 = isnan(_1278);
                    bool _1284 = _1280 || _1282;
                    bool _1286 = isnan(0.89999997615814208984375);
                    bool _1288 = _1284 || _1286;
                    bool _1290 = !_1288;
                    _1210 = _1268;
                    _1212 = _1278;
                    _1214 = 2.0;
                    _1216 = _1272;
                    _1218 = _1264;
                    if (!_1290)
                    {
                        float _1292 = _1256 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                        float _1294 = _1258 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                        float2 _7414 = float2(_1292, _1294);
                        float2 _1296 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7414, float2(0.0), isnan(_7414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7414, float2(0.0), isnan(_7414)), level(0.0)).xy;
                        float _1298 = _1296.x;
                        float _1300 = _1296.y;
                        float _1302 = fma(_1298, 5.0, -3.75);
                        float _1304 = rint(_1300);
                        float _1306 = abs(_1302);
                        float _1308 = _1298 * _1306;
                        float _1310 = rint(_1308);
                        float _1312 = _1310 + _1304;
                        float _1314 = _1312 * 0.5;
                        bool _1316 = _1314 >= 0.89999997615814208984375;
                        bool _1318 = isnan(_1314);
                        bool _1320 = _1316 || _1318;
                        bool _1322 = isnan(0.89999997615814208984375);
                        bool _1324 = _1320 || _1322;
                        bool _1326 = !_1324;
                        _1210 = _1304;
                        _1212 = _1314;
                        _1214 = 3.0;
                        _1216 = _1308;
                        _1218 = _1300;
                        if (!_1326)
                        {
                            float _1328 = _1292 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                            float _1330 = _1294 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                            float2 _7470 = float2(_1328, _1330);
                            float2 _1332 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7470, float2(0.0), isnan(_7470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7470, float2(0.0), isnan(_7470)), level(0.0)).xy;
                            float _1334 = _1332.x;
                            float _1336 = _1332.y;
                            float _1338 = fma(_1334, 5.0, -3.75);
                            float _1340 = rint(_1336);
                            float _1342 = abs(_1338);
                            float _1344 = _1334 * _1342;
                            float _1346 = rint(_1344);
                            float _1348 = _1346 + _1340;
                            float _1350 = _1348 * 0.5;
                            bool _1352 = _1350 >= 0.89999997615814208984375;
                            bool _1354 = isnan(_1350);
                            bool _1356 = _1352 || _1354;
                            bool _1358 = isnan(0.89999997615814208984375);
                            bool _1360 = _1356 || _1358;
                            bool _1362 = !_1360;
                            _1210 = _1340;
                            _1212 = _1350;
                            _1214 = 4.0;
                            _1216 = _1344;
                            _1218 = _1336;
                            if (!_1362)
                            {
                                float _1364 = _1328 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                float _1366 = _1330 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                float2 _7526 = float2(_1364, _1366);
                                float2 _1368 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7526, float2(0.0), isnan(_7526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7526, float2(0.0), isnan(_7526)), level(0.0)).xy;
                                float _1370 = _1368.x;
                                float _1372 = _1368.y;
                                float _1374 = fma(_1370, 5.0, -3.75);
                                float _1376 = rint(_1372);
                                float _1378 = abs(_1374);
                                float _1380 = _1370 * _1378;
                                float _1382 = rint(_1380);
                                float _1384 = _1382 + _1376;
                                float _1386 = _1384 * 0.5;
                                bool _1388 = _1386 >= 0.89999997615814208984375;
                                bool _1390 = isnan(_1386);
                                bool _1392 = _1388 || _1390;
                                bool _1394 = isnan(0.89999997615814208984375);
                                bool _1396 = _1392 || _1394;
                                bool _1398 = !_1396;
                                _1210 = _1376;
                                _1212 = _1386;
                                _1214 = 5.0;
                                _1216 = _1380;
                                _1218 = _1372;
                                if (!_1398)
                                {
                                    float _1400 = _1364 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                    float _1402 = _1366 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                    float2 _7582 = float2(_1400, _1402);
                                    float2 _1404 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7582, float2(0.0), isnan(_7582)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7582, float2(0.0), isnan(_7582)), level(0.0)).xy;
                                    float _1406 = _1404.x;
                                    float _1408 = _1404.y;
                                    float _1410 = fma(_1406, 5.0, -3.75);
                                    float _1412 = rint(_1408);
                                    float _1414 = abs(_1410);
                                    float _1416 = _1406 * _1414;
                                    float _1418 = rint(_1416);
                                    float _1420 = _1418 + _1412;
                                    float _1422 = _1420 * 0.5;
                                    bool _1424 = _1422 >= 0.89999997615814208984375;
                                    bool _1426 = isnan(_1422);
                                    bool _1428 = _1424 || _1426;
                                    bool _1430 = isnan(0.89999997615814208984375);
                                    bool _1432 = _1428 || _1430;
                                    bool _1434 = !_1432;
                                    _1210 = _1412;
                                    _1212 = _1422;
                                    _1214 = 6.0;
                                    _1216 = _1416;
                                    _1218 = _1408;
                                    if (!_1434)
                                    {
                                        float _1436 = _1400 + (*spvDescriptorSet0.cp_c3)._m0[0].z;
                                        float _1438 = _1402 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
                                        float2 _7638 = float2(_1436, _1438);
                                        float2 _1440 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7638, float2(0.0), isnan(_7638)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7638, float2(0.0), isnan(_7638)), level(0.0)).xy;
                                        float _1442 = _1440.x;
                                        float _1444 = _1440.y;
                                        float _1446 = fma(_1442, 5.0, -3.75);
                                        float _1448 = rint(_1444);
                                        float _1450 = abs(_1446);
                                        float _1452 = _1442 * _1450;
                                        float _1454 = rint(_1452);
                                        float _1456 = _1454 + _1448;
                                        float _1458 = _1456 * 0.5;
                                        bool _1460 = _1458 >= 0.89999997615814208984375;
                                        bool _1462 = isnan(_1458);
                                        bool _1464 = _1460 || _1462;
                                        bool _1466 = isnan(0.89999997615814208984375);
                                        bool _1468 = _1464 || _1466;
                                        _1210 = _1448;
                                        _1212 = _1458;
                                        _696 = as_type<int>(_1454);
                                        if (!_1468)
                                        {
                                            _1214 = 7.0;
                                            _1470 = true;
                                        }
                                        else
                                        {
                                            _1214 = 7.0;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            _1470 = false;
            float _1472 = _1210;
            float _1474 = _1212;
            float _1476 = _1214;
            float _1478 = _1216;
            float _1480 = _1218;
            int _1482 = _696;
            bool _1484 = _1472 >= 0.89999997615814208984375;
            bool _1486 = isnan(_1472);
            bool _1488 = _1484 || _1486;
            bool _1490 = isnan(0.89999997615814208984375);
            bool _1492 = _1488 || _1490;
            float _1494 = float(_1492);
            float _1496 = _1494 + _1476;
            _1166 = _1496;
            _1172 = _1474;
            _1156 = _1478;
            _1158 = _1480;
            _698 = _1482;
        }
        float _1498 = _1166;
        float _1500 = _1172;
        float _1502 = _1156;
        float _1504 = _1158;
        int _1506 = _698;
        float _1508 = _1142 + _1498;
        bool _1510 = _1508 > 2.0;
        bool _1512 = !_1510;
        float _1514 = _1502;
        float _1516 = _1504;
        int _1518 = _1506;
        int _1520 = as_type<int>(_1500);
        if (!_1512)
        {
            float _1522 = fma(_1498, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _1524 = fma(_1498, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float _1526 = -_1142;
            float _1528 = fma(_1526, (*spvDescriptorSet0.cp_c3)._m0[0].z, _116);
            float _1530 = -_1142;
            float _1532 = fma(_1530, (*spvDescriptorSet0.cp_c3)._m0[0].w, _118);
            float2 _7765 = float2(_1522, _1524);
            float2 _1534 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7765, float2(0.0), isnan(_7765)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7765, float2(0.0), isnan(_7765)), level(0.0), int2(1, 0)).xy;
            float _1536 = _1534.x;
            float _1538 = _1534.y;
            float2 _7777 = float2(_1528, _1532);
            float _1540 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7777, float2(0.0), isnan(_7777)), level(0.0), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7777, float2(0.0), isnan(_7777)), level(0.0), int2(-1, 0)).y;
            float2 _7785 = float2(_1528, _1532);
            float _1542 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7785, float2(0.0), isnan(_7785)), level(0.0), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7785, float2(0.0), isnan(_7785)), level(0.0), int2(0, -1)).x;
            bool _1544 = _1500 >= 0.89999997615814208984375;
            bool _1546 = isnan(_1500);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan(0.89999997615814208984375);
            bool _1552 = _1548 || _1550;
            float _1554 = float(_1552);
            bool _1556 = _1146 >= 0.89999997615814208984375;
            bool _1558 = isnan(_1146);
            bool _1560 = _1556 || _1558;
            bool _1562 = isnan(0.89999997615814208984375);
            bool _1564 = _1560 || _1562;
            float _1566 = float(_1564);
            float _1568 = fma(_1538, 2.0, _1536);
            float _1570 = fma(_1540, 2.0, _1542);
            float _1572 = _1568 * _1554;
            float _1574 = _1570 * _1566;
            float _1576 = fma(_1572, 20.0, _1498);
            float _1578 = fma(_1574, 20.0, _1142);
            float _1580 = fma(_1576, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _1582 = fma(_1578, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float _1584 = fma((*spvDescriptorSet0.cp_c3)._m0[3].w, 0.14285714924335479736328125, _1580);
            float _1586 = _1582 + 0.5;
            float2 _7848 = float2(_1586, _1584);
            float2 _1588 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_7848, float2(0.0), isnan(_7848)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_7848, float2(0.0), isnan(_7848)), level(0.0)).xy;
            float _1590 = _1588.x;
            float _1592 = _1588.y;
            float _1594 = _1592 + _812;
            float _1596 = _1590 + _814;
            _852 = _1596;
            _854 = _1594;
            _1160 = _1592;
            _1514 = _1528;
            _1516 = _1532;
            _1518 = as_type<int>(_1542);
            _856 = as_type<int>(_1536);
            _1520 = as_type<int>(_1580);
            _1162 = _1590;
        }
        float _1598 = _852;
        float _1600 = _854;
        float _1602 = _1160;
        float _1604 = _1514;
        float _1606 = _1516;
        int _1608 = _1518;
        int _1610 = _856;
        int _1612 = _1520;
        float _1614 = _1162;
        float _1616 = -_1598;
        bool _1618 = _1600 != _1616;
        bool _1620 = isnan(_1600);
        bool _1622 = _1618 || _1620;
        bool _1624 = isnan(_1616);
        bool _1626 = _1622 || _1624;
        int _1628 = _1612;
        float _1630 = _1614;
        float _1632 = _1602;
        float _1634 = _1604;
        float _1636 = _1606;
        int _1638 = _1608;
        int _1640 = _1610;
        _162 = as_type<int>(_1598);
        if (_1626)
        {
            _1628 = 0;
        }
        int _1642 = _1628;
        _158 = _1642;
        if (_1626)
        {
            _1630 = _1600;
        }
        float _1644 = _1630;
        _150 = _1644;
        if (_1626)
        {
            _1632 = _1598;
        }
        float _1646 = _1632;
        _152 = _1646;
        if (!_1626)
        {
            float _1648 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 1.25, _116);
            float _1650 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -0.125, _118);
            float2 _7942 = float2(_126, _1650);
            float2 _1652 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7942, float2(0.0), isnan(_7942)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7942, float2(0.0), isnan(_7942)), level(0.0)).xy;
            float _1654 = _1652.x;
            float _1656 = _1652.y;
            float2 _7954 = float2(_1648, _1650);
            float2 _1658 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_7954, float2(0.0), isnan(_7954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_7954, float2(0.0), isnan(_7954)), level(0.0)).xy;
            float _1660 = _1658.x;
            float _1662 = _1658.y;
            float _1664 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _126);
            float _1666 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1648);
            bool _1668 = _1656 >= 0.800000011920928955078125;
            bool _1670 = isnan(_1656);
            bool _1672 = _1668 || _1670;
            bool _1674 = isnan(0.800000011920928955078125);
            bool _1676 = _1672 || _1674;
            bool _1678 = _1662 > 0.800000011920928955078125;
            bool _1680 = isnan(_1662);
            bool _1682 = _1678 || _1680;
            bool _1684 = isnan(0.800000011920928955078125);
            bool _1686 = _1682 || _1684;
            bool _1688 = _1654 != 0.0;
            bool _1690 = isnan(_1654);
            bool _1692 = _1688 || _1690;
            bool _1694 = isnan(0.0);
            bool _1696 = _1692 || _1694;
            bool _1698 = !_1676;
            bool _1700 = _1696 || _1698;
            bool _1702 = _1660 != 0.0;
            bool _1704 = isnan(_1660);
            bool _1706 = _1702 || _1704;
            bool _1708 = isnan(0.0);
            bool _1710 = _1706 || _1708;
            bool _1712 = !_1686;
            bool _1714 = _1710 || _1712;
            float _1716 = _1656;
            float _1718 = _1654;
            float _1720 = _1648;
            int _1722 = as_type<int>(_1660);
            int _1724 = as_type<int>(_1664);
            float _1726 = _1662;
            float _1728 = _1666;
            if (_1700)
            {
                _1634 = _1654;
            }
            float _1730 = _1634;
            if (_1700)
            {
                _1636 = _1656;
            }
            float _1732 = _1636;
            if (_1714)
            {
                _1716 = _1662;
            }
            float _1734 = _1716;
            if (_1714)
            {
                _1718 = _1660;
            }
            float _1736 = _1718;
            float _1738 = _1730;
            float _1740 = _1732;
            if (!_1700)
            {
                float2 _8064 = float2(_1664, _1650);
                float2 _1742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8064, float2(0.0), isnan(_8064)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8064, float2(0.0), isnan(_8064)), level(0.0)).xy;
                float _1744 = _1742.x;
                float _1746 = _1742.y;
                _1738 = _1744;
                _1740 = _1746;
            }
            float _1748 = _1738;
            float _1750 = _1740;
            float _1752 = _1736;
            float _1754 = _1734;
            if (!_1714)
            {
                float2 _8086 = float2(_1666, _1650);
                float2 _1756 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8086, float2(0.0), isnan(_8086)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8086, float2(0.0), isnan(_8086)), level(0.0)).xy;
                float _1758 = _1756.x;
                float _1760 = _1756.y;
                _1752 = _1758;
                _1754 = _1760;
            }
            float _1762 = _1752;
            float _1764 = _1754;
            if (_1700)
            {
                _1638 = 1;
            }
            int _1766 = _1638;
            int _1768 = _1766;
            if (!_1700)
            {
                _1768 = 0;
            }
            int _1770 = _1768;
            int _1772 = _1770;
            if (_1700)
            {
                _1720 = _1664;
            }
            float _1774 = _1720;
            float _1776 = _1774;
            if (!_1700)
            {
                float _1778 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1664);
                _1776 = _1778;
            }
            float _1780 = _1776;
            int _1782 = _1770 & 1;
            bool _1784 = _1782 != 0;
            float _1786 = _1780;
            if (_1784)
            {
                _1722 = _1770;
            }
            int _1788 = _1722;
            int _1790 = _1788;
            int _1792 = _1788;
            float _1794 = _1750;
            float _1796 = _1748;
            float _1798 = _1764;
            float _1800 = _1762;
            if (!_1784)
            {
                bool _1802 = _1750 >= 0.800000011920928955078125;
                bool _1804 = isnan(_1750);
                bool _1806 = _1802 || _1804;
                bool _1808 = isnan(0.800000011920928955078125);
                bool _1810 = _1806 || _1808;
                bool _1812 = _1748 != 0.0;
                bool _1814 = isnan(_1748);
                bool _1816 = _1812 || _1814;
                bool _1818 = isnan(0.0);
                bool _1820 = _1816 || _1818;
                bool _1822 = !_1810;
                bool _1824 = _1820 || _1822;
                if (_1824)
                {
                    _1790 = 1;
                }
                int _1826 = _1790;
                _1792 = _1826;
                if (!_1824)
                {
                    float2 _8184 = float2(_1780, _1650);
                    float2 _1828 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8184, float2(0.0), isnan(_8184)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8184, float2(0.0), isnan(_8184)), level(0.0)).xy;
                    float _1830 = _1828.x;
                    float _1832 = _1828.y;
                    float _1834 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1780);
                    _1792 = _1770;
                    _1794 = _1832;
                    _1796 = _1830;
                    _1786 = _1834;
                }
            }
            int _1836 = _1792;
            float _1838 = _1794;
            float _1840 = _1796;
            float _1842 = _1786;
            int _1844 = _1836 & 1;
            bool _1846 = _1844 != 0;
            float _1848 = _1838;
            float _1850 = _1840;
            float _1852 = _1842;
            float _1854 = as_type<float>(_1836);
            if (_1846)
            {
                _1724 = _1836;
            }
            int _1856 = _1724;
            int _1858 = _1856;
            int _1860 = _1856;
            if (!_1846)
            {
                bool _1862 = _1838 >= 0.800000011920928955078125;
                bool _1864 = isnan(_1838);
                bool _1866 = _1862 || _1864;
                bool _1868 = isnan(0.800000011920928955078125);
                bool _1870 = _1866 || _1868;
                bool _1872 = _1840 != 0.0;
                bool _1874 = isnan(_1840);
                bool _1876 = _1872 || _1874;
                bool _1878 = isnan(0.0);
                bool _1880 = _1876 || _1878;
                bool _1882 = !_1870;
                bool _1884 = _1880 || _1882;
                if (_1884)
                {
                    _1858 = 1;
                }
                int _1886 = _1858;
                _1860 = _1886;
                if (!_1884)
                {
                    float2 _8264 = float2(_1842, _1650);
                    float2 _1888 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8264, float2(0.0), isnan(_8264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8264, float2(0.0), isnan(_8264)), level(0.0)).xy;
                    float _1890 = _1888.x;
                    float _1892 = _1888.y;
                    float _1894 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1842);
                    _1860 = _1836;
                    _1848 = _1892;
                    _1850 = _1890;
                    _1852 = _1894;
                }
            }
            int _1896 = _1860;
            float _1898 = _1848;
            float _1900 = _1850;
            float _1902 = _1852;
            int _1904 = _1896 & 1;
            bool _1906 = _1904 != 0;
            float _1908 = _1898;
            float _1910 = _1900;
            float _1912 = _1902;
            int _1914 = _1896;
            if (_1906)
            {
                _1772 = _1896;
            }
            int _1916 = _1772;
            int _1918 = _1916;
            int _1920 = _1916;
            if (!_1906)
            {
                bool _1922 = _1898 >= 0.800000011920928955078125;
                bool _1924 = isnan(_1898);
                bool _1926 = _1922 || _1924;
                bool _1928 = isnan(0.800000011920928955078125);
                bool _1930 = _1926 || _1928;
                bool _1932 = _1900 != 0.0;
                bool _1934 = isnan(_1900);
                bool _1936 = _1932 || _1934;
                bool _1938 = isnan(0.0);
                bool _1940 = _1936 || _1938;
                bool _1942 = !_1930;
                bool _1944 = _1940 || _1942;
                if (_1944)
                {
                    _1918 = 1;
                }
                int _1946 = _1918;
                _1920 = _1946;
                if (!_1944)
                {
                    float2 _8343 = float2(_1902, _1650);
                    float2 _1948 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8343, float2(0.0), isnan(_8343)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8343, float2(0.0), isnan(_8343)), level(0.0)).xy;
                    float _1950 = _1948.x;
                    float _1952 = _1948.y;
                    float _1954 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1902);
                    _1920 = _1896;
                    _1908 = _1952;
                    _1910 = _1950;
                    _1912 = _1954;
                }
            }
            int _1956 = _1920;
            float _1958 = _1908;
            float _1960 = _1910;
            float _1962 = _1912;
            int _1964 = _1956 & 1;
            bool _1966 = _1964 != 0;
            float _1968 = _1958;
            float _1970 = _1960;
            float _1972 = _1962;
            int _1974 = _1956;
            if (_1966)
            {
                _1914 = _1956;
            }
            int _1976 = _1914;
            int _1978 = _1976;
            int _1980 = _1976;
            if (!_1966)
            {
                bool _1982 = _1958 >= 0.800000011920928955078125;
                bool _1984 = isnan(_1958);
                bool _1986 = _1982 || _1984;
                bool _1988 = isnan(0.800000011920928955078125);
                bool _1990 = _1986 || _1988;
                bool _1992 = _1960 != 0.0;
                bool _1994 = isnan(_1960);
                bool _1996 = _1992 || _1994;
                bool _1998 = isnan(0.0);
                bool _2000 = _1996 || _1998;
                bool _2002 = !_1990;
                bool _2004 = _2000 || _2002;
                if (_2004)
                {
                    _1978 = 1;
                }
                int _2006 = _1978;
                _1980 = _2006;
                if (!_2004)
                {
                    float2 _8422 = float2(_1962, _1650);
                    float2 _2008 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8422, float2(0.0), isnan(_8422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8422, float2(0.0), isnan(_8422)), level(0.0)).xy;
                    float _2010 = _2008.x;
                    float _2012 = _2008.y;
                    float _2014 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _1962);
                    _1980 = _1956;
                    _1968 = _2012;
                    _1970 = _2010;
                    _1972 = _2014;
                }
            }
            int _2016 = _1980;
            float _2018 = _1968;
            float _2020 = _1970;
            float _2022 = _1972;
            int _2024 = _2016 & 1;
            bool _2026 = _2024 != 0;
            float _2028 = _2018;
            float _2030 = _2020;
            float _2032 = _2022;
            int _2034 = _2016;
            if (_2026)
            {
                _1974 = _2016;
            }
            int _2036 = _1974;
            int _2038 = _2036;
            int _2040 = _2036;
            if (!_2026)
            {
                bool _2042 = _2018 >= 0.800000011920928955078125;
                bool _2044 = isnan(_2018);
                bool _2046 = _2042 || _2044;
                bool _2048 = isnan(0.800000011920928955078125);
                bool _2050 = _2046 || _2048;
                bool _2052 = _2020 != 0.0;
                bool _2054 = isnan(_2020);
                bool _2056 = _2052 || _2054;
                bool _2058 = isnan(0.0);
                bool _2060 = _2056 || _2058;
                bool _2062 = !_2050;
                bool _2064 = _2060 || _2062;
                if (_2064)
                {
                    _2038 = 1;
                }
                int _2066 = _2038;
                _2040 = _2066;
                if (!_2064)
                {
                    float2 _8501 = float2(_2022, _1650);
                    float2 _2068 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8501, float2(0.0), isnan(_8501)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8501, float2(0.0), isnan(_8501)), level(0.0)).xy;
                    float _2070 = _2068.x;
                    float _2072 = _2068.y;
                    float _2074 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2022);
                    _2040 = _2016;
                    _2028 = _2072;
                    _2030 = _2070;
                    _2032 = _2074;
                }
            }
            int _2076 = _2040;
            float _2078 = _2028;
            float _2080 = _2030;
            float _2082 = _2032;
            int _2084 = _2076 & 1;
            bool _2086 = _2084 != 0;
            float _2088 = _2078;
            float _2090 = _2080;
            float _2092 = _2082;
            int _2094 = _2076;
            if (_2086)
            {
                _2034 = _2076;
            }
            int _2096 = _2034;
            int _2098 = _2096;
            int _2100 = _2096;
            if (!_2086)
            {
                bool _2102 = _2078 >= 0.800000011920928955078125;
                bool _2104 = isnan(_2078);
                bool _2106 = _2102 || _2104;
                bool _2108 = isnan(0.800000011920928955078125);
                bool _2110 = _2106 || _2108;
                bool _2112 = _2080 != 0.0;
                bool _2114 = isnan(_2080);
                bool _2116 = _2112 || _2114;
                bool _2118 = isnan(0.0);
                bool _2120 = _2116 || _2118;
                bool _2122 = !_2110;
                bool _2124 = _2120 || _2122;
                if (_2124)
                {
                    _2098 = 1;
                }
                int _2126 = _2098;
                _2100 = _2126;
                if (!_2124)
                {
                    float2 _8580 = float2(_2082, _1650);
                    float2 _2128 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8580, float2(0.0), isnan(_8580)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8580, float2(0.0), isnan(_8580)), level(0.0)).xy;
                    float _2130 = _2128.x;
                    float _2132 = _2128.y;
                    float _2134 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2082);
                    _2100 = _2076;
                    _2088 = _2132;
                    _2090 = _2130;
                    _2092 = _2134;
                }
            }
            int _2136 = _2100;
            float _2138 = _2088;
            float _2140 = _2090;
            float _2142 = _2092;
            int _2144 = _2136 & 1;
            bool _2146 = _2144 != 0;
            float _2148 = _2138;
            float _2150 = _2140;
            float _2152 = _2142;
            int _2154 = _2136;
            if (_2146)
            {
                _2094 = _2136;
            }
            int _2156 = _2094;
            int _2158 = _2156;
            int _2160 = _2156;
            if (!_2146)
            {
                bool _2162 = _2138 >= 0.800000011920928955078125;
                bool _2164 = isnan(_2138);
                bool _2166 = _2162 || _2164;
                bool _2168 = isnan(0.800000011920928955078125);
                bool _2170 = _2166 || _2168;
                bool _2172 = _2140 != 0.0;
                bool _2174 = isnan(_2140);
                bool _2176 = _2172 || _2174;
                bool _2178 = isnan(0.0);
                bool _2180 = _2176 || _2178;
                bool _2182 = !_2170;
                bool _2184 = _2180 || _2182;
                if (_2184)
                {
                    _2158 = 1;
                }
                int _2186 = _2158;
                _2160 = _2186;
                if (!_2184)
                {
                    float2 _8659 = float2(_2142, _1650);
                    float2 _2188 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8659, float2(0.0), isnan(_8659)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8659, float2(0.0), isnan(_8659)), level(0.0)).xy;
                    float _2190 = _2188.x;
                    float _2192 = _2188.y;
                    float _2194 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2142);
                    _2160 = _2136;
                    _2148 = _2192;
                    _2150 = _2190;
                    _2152 = _2194;
                }
            }
            int _2196 = _2160;
            float _2198 = _2148;
            float _2200 = _2150;
            float _2202 = _2152;
            int _2204 = _2196 & 1;
            bool _2206 = _2204 != 0;
            float _2208 = _2198;
            float _2210 = _2200;
            float _2212 = _2202;
            int _2214 = _2196;
            if (_2206)
            {
                _2154 = _2196;
            }
            int _2216 = _2154;
            int _2218 = _2216;
            int _2220 = _2216;
            if (!_2206)
            {
                bool _2222 = _2198 >= 0.800000011920928955078125;
                bool _2224 = isnan(_2198);
                bool _2226 = _2222 || _2224;
                bool _2228 = isnan(0.800000011920928955078125);
                bool _2230 = _2226 || _2228;
                bool _2232 = _2200 != 0.0;
                bool _2234 = isnan(_2200);
                bool _2236 = _2232 || _2234;
                bool _2238 = isnan(0.0);
                bool _2240 = _2236 || _2238;
                bool _2242 = !_2230;
                bool _2244 = _2240 || _2242;
                if (_2244)
                {
                    _2218 = 1;
                }
                int _2246 = _2218;
                _2220 = _2246;
                if (!_2244)
                {
                    float2 _8738 = float2(_2202, _1650);
                    float2 _2248 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8738, float2(0.0), isnan(_8738)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8738, float2(0.0), isnan(_8738)), level(0.0)).xy;
                    float _2250 = _2248.x;
                    float _2252 = _2248.y;
                    float _2254 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2202);
                    _2220 = _2196;
                    _2208 = _2252;
                    _2210 = _2250;
                    _2212 = _2254;
                }
            }
            int _2256 = _2220;
            float _2258 = _2208;
            float _2260 = _2210;
            float _2262 = _2212;
            int _2264 = _2256 & 1;
            bool _2266 = _2264 != 0;
            float _2268 = _2258;
            float _2270 = _2260;
            float _2272 = _2262;
            int _2274 = _2256;
            if (_2266)
            {
                _2214 = _2256;
            }
            int _2276 = _2214;
            int _2278 = _2276;
            int _2280 = _2276;
            if (!_2266)
            {
                bool _2282 = _2258 >= 0.800000011920928955078125;
                bool _2284 = isnan(_2258);
                bool _2286 = _2282 || _2284;
                bool _2288 = isnan(0.800000011920928955078125);
                bool _2290 = _2286 || _2288;
                bool _2292 = _2260 != 0.0;
                bool _2294 = isnan(_2260);
                bool _2296 = _2292 || _2294;
                bool _2298 = isnan(0.0);
                bool _2300 = _2296 || _2298;
                bool _2302 = !_2290;
                bool _2304 = _2300 || _2302;
                if (_2304)
                {
                    _2278 = 1;
                }
                int _2306 = _2278;
                _2280 = _2306;
                if (!_2304)
                {
                    float2 _8817 = float2(_2262, _1650);
                    float2 _2308 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8817, float2(0.0), isnan(_8817)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8817, float2(0.0), isnan(_8817)), level(0.0)).xy;
                    float _2310 = _2308.x;
                    float _2312 = _2308.y;
                    float _2314 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2262);
                    _2280 = _2256;
                    _2268 = _2312;
                    _2270 = _2310;
                    _2272 = _2314;
                }
            }
            int _2316 = _2280;
            float _2318 = _2268;
            float _2320 = _2270;
            float _2322 = _2272;
            int _2324 = _2316 & 1;
            bool _2326 = _2324 != 0;
            float _2328 = _2318;
            float _2330 = _2320;
            float _2332 = _2322;
            int _2334 = _2316;
            if (_2326)
            {
                _2274 = _2316;
            }
            int _2336 = _2274;
            int _2338 = _2336;
            int _2340 = _2336;
            if (!_2326)
            {
                bool _2342 = _2318 >= 0.800000011920928955078125;
                bool _2344 = isnan(_2318);
                bool _2346 = _2342 || _2344;
                bool _2348 = isnan(0.800000011920928955078125);
                bool _2350 = _2346 || _2348;
                bool _2352 = _2320 != 0.0;
                bool _2354 = isnan(_2320);
                bool _2356 = _2352 || _2354;
                bool _2358 = isnan(0.0);
                bool _2360 = _2356 || _2358;
                bool _2362 = !_2350;
                bool _2364 = _2360 || _2362;
                if (_2364)
                {
                    _2338 = 1;
                }
                int _2366 = _2338;
                _2340 = _2366;
                if (!_2364)
                {
                    float2 _8896 = float2(_2322, _1650);
                    float2 _2368 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8896, float2(0.0), isnan(_8896)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8896, float2(0.0), isnan(_8896)), level(0.0)).xy;
                    float _2370 = _2368.x;
                    float _2372 = _2368.y;
                    float _2374 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2322);
                    _2340 = _2316;
                    _2328 = _2372;
                    _2330 = _2370;
                    _2332 = _2374;
                }
            }
            int _2376 = _2340;
            float _2378 = _2328;
            float _2380 = _2330;
            float _2382 = _2332;
            int _2384 = _2376 & 1;
            bool _2386 = _2384 != 0;
            float _2388 = _2378;
            float _2390 = _2380;
            float _2392 = _2382;
            int _2394 = _2376;
            if (_2386)
            {
                _2334 = _2376;
            }
            int _2396 = _2334;
            int _2398 = _2396;
            int _2400 = _2396;
            if (!_2386)
            {
                bool _2402 = _2378 >= 0.800000011920928955078125;
                bool _2404 = isnan(_2378);
                bool _2406 = _2402 || _2404;
                bool _2408 = isnan(0.800000011920928955078125);
                bool _2410 = _2406 || _2408;
                bool _2412 = _2380 != 0.0;
                bool _2414 = isnan(_2380);
                bool _2416 = _2412 || _2414;
                bool _2418 = isnan(0.0);
                bool _2420 = _2416 || _2418;
                bool _2422 = !_2410;
                bool _2424 = _2420 || _2422;
                if (_2424)
                {
                    _2398 = 1;
                }
                int _2426 = _2398;
                _2400 = _2426;
                if (!_2424)
                {
                    float2 _8975 = float2(_2382, _1650);
                    float2 _2428 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_8975, float2(0.0), isnan(_8975)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_8975, float2(0.0), isnan(_8975)), level(0.0)).xy;
                    float _2430 = _2428.x;
                    float _2432 = _2428.y;
                    float _2434 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2382);
                    _2400 = _2376;
                    _2388 = _2432;
                    _2390 = _2430;
                    _2392 = _2434;
                }
            }
            int _2436 = _2400;
            float _2438 = _2388;
            float _2440 = _2390;
            float _2442 = _2392;
            int _2444 = _2436 & 1;
            bool _2446 = _2444 != 0;
            float _2448 = _2440;
            float _2450 = _2438;
            float _2452 = _2442;
            int _2454 = _2436;
            if (_2446)
            {
                _2394 = _2436;
            }
            int _2456 = _2394;
            int _2458 = _2456;
            int _2460 = _2456;
            if (!_2446)
            {
                bool _2462 = _2438 >= 0.800000011920928955078125;
                bool _2464 = isnan(_2438);
                bool _2466 = _2462 || _2464;
                bool _2468 = isnan(0.800000011920928955078125);
                bool _2470 = _2466 || _2468;
                bool _2472 = _2440 != 0.0;
                bool _2474 = isnan(_2440);
                bool _2476 = _2472 || _2474;
                bool _2478 = isnan(0.0);
                bool _2480 = _2476 || _2478;
                bool _2482 = !_2470;
                bool _2484 = _2480 || _2482;
                if (_2484)
                {
                    _2458 = 1;
                }
                int _2486 = _2458;
                _2460 = _2486;
                if (!_2484)
                {
                    float2 _9054 = float2(_2442, _1650);
                    float2 _2488 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9054, float2(0.0), isnan(_9054)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9054, float2(0.0), isnan(_9054)), level(0.0)).xy;
                    float _2490 = _2488.x;
                    float _2492 = _2488.y;
                    float _2494 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2442);
                    _2460 = _2436;
                    _2448 = _2490;
                    _2450 = _2492;
                    _2452 = _2494;
                }
            }
            int _2496 = _2460;
            float _2498 = _2448;
            float _2500 = _2450;
            float _2502 = _2452;
            int _2504 = _2496 & 1;
            bool _2506 = _2504 != 0;
            float _2508 = _2502;
            float _2510 = as_type<float>(_2496);
            if (_1714)
            {
                _1640 = 1;
            }
            int _2512 = _1640;
            int _2514 = _2512;
            if (!_1714)
            {
                _2514 = 0;
            }
            int _2516 = _2514;
            int _2518 = _2516 & 1;
            bool _2520 = _2518 != 0;
            if (_2506)
            {
                _2454 = _2496;
            }
            int _2522 = _2454;
            int _2524 = _2522;
            int _2526 = _2522;
            if (_2506)
            {
                _1854 = _2498;
            }
            float _2528 = _1854;
            float _2530 = _2528;
            float _2532 = _2528;
            if (_2506)
            {
                _1726 = _2500;
            }
            float _2534 = _1726;
            float _2536 = _2534;
            float _2538 = _2534;
            if (!_2506)
            {
                bool _2540 = _2500 >= 0.800000011920928955078125;
                bool _2542 = isnan(_2500);
                bool _2544 = _2540 || _2542;
                bool _2546 = isnan(0.800000011920928955078125);
                bool _2548 = _2544 || _2546;
                bool _2550 = _2498 != 0.0;
                bool _2552 = isnan(_2498);
                bool _2554 = _2550 || _2552;
                bool _2556 = isnan(0.0);
                bool _2558 = _2554 || _2556;
                bool _2560 = !_2548;
                bool _2562 = _2558 || _2560;
                if (_2562)
                {
                    _2530 = _2498;
                }
                float _2564 = _2530;
                _2532 = _2564;
                if (_2562)
                {
                    _2536 = _2500;
                }
                float _2566 = _2536;
                _2538 = _2566;
                if (_2562)
                {
                    _2524 = 1;
                }
                int _2568 = _2524;
                _2526 = _2568;
                if (!_2562)
                {
                    float2 _9172 = float2(_2502, _1650);
                    float2 _2570 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9172, float2(0.0), isnan(_9172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9172, float2(0.0), isnan(_9172)), level(0.0)).xy;
                    float _2572 = _2570.x;
                    float _2574 = _2570.y;
                    float _2576 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2502);
                    _2526 = _2496;
                    _2508 = _2576;
                    _2538 = _2574;
                    _2532 = _2572;
                }
            }
            int _2578 = _2526;
            float _2580 = _2508;
            float _2582 = _2538;
            float _2584 = _2532;
            int _2586 = _2578 & 1;
            bool _2588 = _2586 != 0;
            float _2590 = _2584;
            float _2592 = _2582;
            int _2594 = as_type<int>(_2580);
            int _2596 = _2578;
            if (!_1714)
            {
                float _2598 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _1666);
                _1728 = _2598;
            }
            float _2600 = _1728;
            float _2602 = _2600;
            if (_2588)
            {
                _2510 = _2580;
            }
            float _2604 = _2510;
            float _2606 = _2604;
            float _2608 = _2604;
            if (!_2588)
            {
                bool _2610 = _2582 >= 0.800000011920928955078125;
                bool _2612 = isnan(_2582);
                bool _2614 = _2610 || _2612;
                bool _2616 = isnan(0.800000011920928955078125);
                bool _2618 = _2614 || _2616;
                bool _2620 = _2584 != 0.0;
                bool _2622 = isnan(_2584);
                bool _2624 = _2620 || _2622;
                bool _2626 = isnan(0.0);
                bool _2628 = _2624 || _2626;
                bool _2630 = !_2618;
                bool _2632 = _2628 || _2630;
                if (_2632)
                {
                    _2606 = _2580;
                }
                float _2634 = _2606;
                _2608 = _2634;
                if (!_2632)
                {
                    float2 _9264 = float2(_2580, _1650);
                    float2 _2636 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9264, float2(0.0), isnan(_9264)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9264, float2(0.0), isnan(_9264)), level(0.0)).xy;
                    float _2638 = _2636.x;
                    float _2640 = _2636.y;
                    float _2642 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -2.0, _2580);
                    _2590 = _2638;
                    _2592 = _2640;
                    _2608 = _2642;
                }
            }
            float _2644 = _2590;
            float _2646 = _2592;
            float _2648 = _2608;
            if (_2520)
            {
                _2594 = _2516;
            }
            int _2650 = _2594;
            int _2652 = _2650;
            int _2654 = _2650;
            if (!_2520)
            {
                bool _2656 = _1764 > 0.800000011920928955078125;
                bool _2658 = isnan(_1764);
                bool _2660 = _2656 || _2658;
                bool _2662 = isnan(0.800000011920928955078125);
                bool _2664 = _2660 || _2662;
                bool _2666 = _1762 != 0.0;
                bool _2668 = isnan(_1762);
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
                    float2 _9333 = float2(_2600, _1650);
                    float2 _2682 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9333, float2(0.0), isnan(_9333)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9333, float2(0.0), isnan(_9333)), level(0.0)).xy;
                    float _2684 = _2682.x;
                    float _2686 = _2682.y;
                    float _2688 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _2600);
                    _2654 = _2516;
                    _1798 = _2686;
                    _1800 = _2684;
                    _2602 = _2688;
                }
            }
            int _2690 = _2654;
            float _2692 = _1798;
            float _2694 = _1800;
            float _2696 = _2602;
            int _2698 = _2690 & 1;
            bool _2700 = _2698 != 0;
            float _2702 = _2692;
            float _2704 = _2694;
            float _2706 = _2696;
            int _2708 = _2690;
            if (_2700)
            {
                _2596 = _2690;
            }
            int _2710 = _2596;
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
                    float2 _9412 = float2(_2696, _1650);
                    float2 _2742 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9412, float2(0.0), isnan(_9412)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9412, float2(0.0), isnan(_9412)), level(0.0)).xy;
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
                    float2 _9491 = float2(_2756, _1650);
                    float2 _2802 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9491, float2(0.0), isnan(_9491)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9491, float2(0.0), isnan(_9491)), level(0.0)).xy;
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
                    float2 _9570 = float2(_2816, _1650);
                    float2 _2862 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9570, float2(0.0), isnan(_9570)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9570, float2(0.0), isnan(_9570)), level(0.0)).xy;
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
                    float2 _9649 = float2(_2876, _1650);
                    float2 _2922 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9649, float2(0.0), isnan(_9649)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9649, float2(0.0), isnan(_9649)), level(0.0)).xy;
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
                    float2 _9728 = float2(_2936, _1650);
                    float2 _2982 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9728, float2(0.0), isnan(_9728)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9728, float2(0.0), isnan(_9728)), level(0.0)).xy;
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
                    float2 _9807 = float2(_2996, _1650);
                    float2 _3042 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9807, float2(0.0), isnan(_9807)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9807, float2(0.0), isnan(_9807)), level(0.0)).xy;
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
                    float2 _9886 = float2(_3056, _1650);
                    float2 _3102 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9886, float2(0.0), isnan(_9886)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9886, float2(0.0), isnan(_9886)), level(0.0)).xy;
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
                    float2 _9965 = float2(_3116, _1650);
                    float2 _3162 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_9965, float2(0.0), isnan(_9965)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_9965, float2(0.0), isnan(_9965)), level(0.0)).xy;
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
                    float2 _10044 = float2(_3176, _1650);
                    float2 _3222 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10044, float2(0.0), isnan(_10044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10044, float2(0.0), isnan(_10044)), level(0.0)).xy;
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
                    float2 _10123 = float2(_3236, _1650);
                    float2 _3282 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10123, float2(0.0), isnan(_10123)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10123, float2(0.0), isnan(_10123)), level(0.0)).xy;
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
                    float2 _10202 = float2(_3296, _1650);
                    float2 _3342 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10202, float2(0.0), isnan(_10202)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10202, float2(0.0), isnan(_10202)), level(0.0)).xy;
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
            float _3362 = _3356;
            float _3364 = _3352;
            float _3366 = _3354;
            float _3368 = as_type<float>(_3350);
            if (_3360)
            {
                _3308 = _3350;
            }
            int _3370 = _3308;
            int _3372 = _3370;
            int _3374 = _3370;
            if (!_3360)
            {
                bool _3376 = _3352 > 0.800000011920928955078125;
                bool _3378 = isnan(_3352);
                bool _3380 = _3376 || _3378;
                bool _3382 = isnan(0.800000011920928955078125);
                bool _3384 = _3380 || _3382;
                bool _3386 = _3354 != 0.0;
                bool _3388 = isnan(_3354);
                bool _3390 = _3386 || _3388;
                bool _3392 = isnan(0.0);
                bool _3394 = _3390 || _3392;
                bool _3396 = !_3384;
                bool _3398 = _3394 || _3396;
                if (_3398)
                {
                    _3372 = 1;
                }
                int _3400 = _3372;
                _3374 = _3400;
                if (!_3398)
                {
                    float2 _10282 = float2(_3356, _1650);
                    float2 _3402 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10282, float2(0.0), isnan(_10282)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10282, float2(0.0), isnan(_10282)), level(0.0)).xy;
                    float _3404 = _3402.x;
                    float _3406 = _3402.y;
                    float _3408 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3356);
                    _3374 = _3350;
                    _3362 = _3408;
                    _3364 = _3406;
                    _3366 = _3404;
                }
            }
            int _3410 = _3374;
            float _3412 = _3362;
            float _3414 = _3364;
            float _3416 = _3366;
            int _3418 = _3410 & 1;
            bool _3420 = _3418 != 0;
            float _3422 = _3416;
            float _3424 = _3414;
            if (_3420)
            {
                _3368 = _3412;
            }
            float _3426 = _3368;
            float _3428 = _3426;
            float _3430 = _3426;
            if (!_3420)
            {
                bool _3432 = _3414 > 0.800000011920928955078125;
                bool _3434 = isnan(_3414);
                bool _3436 = _3432 || _3434;
                bool _3438 = isnan(0.800000011920928955078125);
                bool _3440 = _3436 || _3438;
                bool _3442 = _3416 != 0.0;
                bool _3444 = isnan(_3416);
                bool _3446 = _3442 || _3444;
                bool _3448 = isnan(0.0);
                bool _3450 = _3446 || _3448;
                bool _3452 = !_3440;
                bool _3454 = _3450 || _3452;
                if (_3454)
                {
                    _3428 = _3412;
                }
                float _3456 = _3428;
                _3430 = _3456;
                if (!_3454)
                {
                    float2 _10360 = float2(_3412, _1650);
                    float2 _3458 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10360, float2(0.0), isnan(_10360)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10360, float2(0.0), isnan(_10360)), level(0.0)).xy;
                    float _3460 = _3458.x;
                    float _3462 = _3458.y;
                    float _3464 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, 2.0, _3412);
                    _3422 = _3460;
                    _3424 = _3462;
                    _3430 = _3464;
                }
            }
            float _3466 = _3422;
            float _3468 = _3424;
            float _3470 = _3430;
            float _3472 = fma(_3466, 0.5, 0.5234375);
            float _3474 = fma(_3468, 2.0, 0.03125);
            float _3476 = fma(_2644, 0.5, 0.0078125);
            float _3478 = fma(_2646, 2.0, 0.03125);
            float2 _10395 = float2(_3472, _3474);
            float _3480 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_10395, float2(0.0), isnan(_10395)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_10395, float2(0.0), isnan(_10395)), level(0.0)).x;
            float2 _10403 = float2(_3476, _3478);
            float _3482 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_10403, float2(0.0), isnan(_10403)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_10403, float2(0.0), isnan(_10403)), level(0.0)).x;
            float _3484 = fma(_3480, -2.007874011993408203125, 3.25);
            float _3486 = fma(_3482, -2.007874011993408203125, 3.25);
            float _3488 = -(*spvDescriptorSet0.cp_c3)._m0[0].z;
            float _3490 = fma(_3484, _3488, _3470);
            float _3492 = fma(_3486, (*spvDescriptorSet0.cp_c3)._m0[0].z, _2648);
            float2 _10429 = float2(_3490, _128);
            float _3494 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10429, float2(0.0), isnan(_10429)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10429, float2(0.0), isnan(_10429)), level(0.0), int2(1, 0)).x;
            float2 _10437 = float2(_3492, _128);
            float _3496 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10437, float2(0.0), isnan(_10437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10437, float2(0.0), isnan(_10437)), level(0.0)).x;
            float _3498 = -_112;
            float _3500 = fma(_3492, (*spvDescriptorSet0.cp_c3)._m0[0].x, _3498);
            float _3502 = -_112;
            float _3504 = fma(_3490, (*spvDescriptorSet0.cp_c3)._m0[0].x, _3502);
            float _3506 = rint(_3504);
            float _3508 = rint(_3500);
            float _3510 = abs(_3506);
            float _3512 = sqrt(_3510);
            float _3514 = abs(_3508);
            float _3516 = sqrt(_3514);
            float _3518 = _3494 * 4.0;
            float _3520 = _3496 * 4.0;
            float _3522 = rint(_3518);
            float _3524 = rint(_3520);
            float _3526 = fma(_3522, 16.0, _3512);
            float _3528 = fma(_3526, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
            float _3530 = fma(_3524, 16.0, _3516);
            float _3532 = fma((*spvDescriptorSet0.cp_c3)._m0[3].y, 0.14285714924335479736328125, _3528);
            float _3534 = fma(_3530, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
            float2 _10494 = float2(_3492, _118);
            float _3536 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10494, float2(0.0), isnan(_10494)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10494, float2(0.0), isnan(_10494)), level(0.0), int2(0, 1)).x;
            float2 _10503 = float2(_3492, _118);
            float _3538 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10503, float2(0.0), isnan(_10503)), level(0.0), int2(0, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10503, float2(0.0), isnan(_10503)), level(0.0), int2(0, -2)).x;
            float2 _10513 = float2(_3490, _118);
            float _3540 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10513, float2(0.0), isnan(_10513)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10513, float2(0.0), isnan(_10513)), level(0.0), int2(1)).x;
            float2 _10522 = float2(_3490, _118);
            float _3542 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10522, float2(0.0), isnan(_10522)), level(0.0), int2(1, -2)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10522, float2(0.0), isnan(_10522)), level(0.0), int2(1, -2)).x;
            float2 _10531 = float2(_3534, _3532);
            float2 _3544 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_10531, float2(0.0), isnan(_10531)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_10531, float2(0.0), isnan(_10531)), level(0.0)).xy;
            float _3546 = _3544.x;
            float _3548 = _3544.y;
            float _3550 = abs(_3506);
            float _3552 = abs(_3508);
            bool _3554 = _3550 >= _3552;
            bool _3556 = isnan(_3550);
            bool _3558 = _3554 || _3556;
            bool _3560 = isnan(_3552);
            bool _3562 = _3558 || _3560;
            float _3564 = float(_3562);
            float _3566 = abs(_3508);
            float _3568 = abs(_3506);
            bool _3570 = _3566 >= _3568;
            bool _3572 = isnan(_3566);
            bool _3574 = _3570 || _3572;
            bool _3576 = isnan(_3568);
            bool _3578 = _3574 || _3576;
            float _3580 = float(_3578);
            float _3582 = _3564 + _3580;
            float _3584 = 1.0 / _3582;
            float _3586 = _3584 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
            float _3588 = _3564 * _3586;
            float _3590 = _3580 * _3586;
            float _3592 = -_3588;
            float _3594 = fma(_3592, _3536, 1.0);
            float _3596 = -_3588;
            float _3598 = fma(_3596, _3538, 1.0);
            float _3600 = -_3590;
            float _3602 = fma(_3600, _3540, _3594);
            float _3604 = precise::clamp(_3602, 0.0, 1.0);
            float _3606 = -_3590;
            float _3608 = fma(_3606, _3542, _3598);
            float _3610 = precise::clamp(_3608, 0.0, 1.0);
            float _3612 = _3546 * _3604;
            float _3614 = _3548 * _3610;
            _158 = _136;
            _160 = as_type<int>(_3536);
            _162 = as_type<int>(_3548);
            _150 = _3612;
            _152 = _3614;
        }
    }
    int _3616 = _158;
    int _3618 = _160;
    int _3620 = _162;
    float _3622 = _150;
    float _3624 = _152;
    int _3626 = _3616 & 1;
    bool _3628 = _3626 != 0;
    bool _3630 = !_3628;
    float _3632 = as_type<float>(_3616);
    int _3634 = _3618;
    int _3636 = _3620;
    float _5586;
    float _5588;
    if (!_3630)
    {
        float _3638 = fma((*spvDescriptorSet0.cp_c3)._m0[0].z, -0.125, _116);
        float _3640 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 1.25, _118);
        float2 _10663 = float2(_3638, _128);
        float2 _3642 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10663, float2(0.0), isnan(_10663)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10663, float2(0.0), isnan(_10663)), level(0.0)).xy;
        float _3644 = _3642.x;
        float _3646 = _3642.y;
        float2 _10675 = float2(_3638, _3640);
        float2 _3648 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10675, float2(0.0), isnan(_10675)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10675, float2(0.0), isnan(_10675)), level(0.0)).xy;
        float _3650 = _3648.x;
        float _3652 = _3648.y;
        float _3654 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _128);
        float _3656 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3640);
        bool _3658 = _3650 > 0.800000011920928955078125;
        bool _3660 = isnan(_3650);
        bool _3662 = _3658 || _3660;
        bool _3664 = isnan(0.800000011920928955078125);
        bool _3666 = _3662 || _3664;
        bool _3668 = _3644 > 0.800000011920928955078125;
        bool _3670 = isnan(_3644);
        bool _3672 = _3668 || _3670;
        bool _3674 = isnan(0.800000011920928955078125);
        bool _3676 = _3672 || _3674;
        bool _3678 = _3652 != 0.0;
        bool _3680 = isnan(_3652);
        bool _3682 = _3678 || _3680;
        bool _3684 = isnan(0.0);
        bool _3686 = _3682 || _3684;
        bool _3688 = !_3666;
        bool _3690 = _3686 || _3688;
        bool _3692 = _3646 != 0.0;
        bool _3694 = isnan(_3646);
        bool _3696 = _3692 || _3694;
        bool _3698 = isnan(0.0);
        bool _3700 = _3696 || _3698;
        bool _3702 = !_3676;
        bool _3704 = _3700 || _3702;
        float _3706 = _3640;
        int _3708 = as_type<int>(_3654);
        float _3710 = _3656;
        float _3712 = _3650;
        if (_3690)
        {
            _3632 = _3650;
        }
        float _3714 = _3632;
        if (_3690)
        {
            _142 = _3652;
        }
        float _3716 = _142;
        float _3718 = _3644;
        float _3720 = _3646;
        if (!_3704)
        {
            float2 _10769 = float2(_3638, _3654);
            float2 _3722 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10769, float2(0.0), isnan(_10769)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10769, float2(0.0), isnan(_10769)), level(0.0)).xy;
            float _3724 = _3722.x;
            float _3726 = _3722.y;
            _3718 = _3724;
            _3720 = _3726;
        }
        float _3728 = _3718;
        float _3730 = _3720;
        float _3732 = _3714;
        float _3734 = _3716;
        if (!_3690)
        {
            float2 _10791 = float2(_3638, _3656);
            float2 _3736 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10791, float2(0.0), isnan(_10791)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10791, float2(0.0), isnan(_10791)), level(0.0)).xy;
            float _3738 = _3736.x;
            float _3740 = _3736.y;
            _3732 = _3738;
            _3734 = _3740;
        }
        float _3742 = _3732;
        float _3744 = _3734;
        if (_3704)
        {
            _3634 = 1;
        }
        int _3746 = _3634;
        int _3748 = _3746;
        if (!_3704)
        {
            _3748 = 0;
        }
        int _3750 = _3748;
        int _3752 = _3750;
        if (_3704)
        {
            _3706 = _3654;
        }
        float _3754 = _3706;
        float _3756 = _3754;
        if (!_3704)
        {
            float _3758 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3654);
            _3756 = _3758;
        }
        float _3760 = _3756;
        int _3762 = _3750 & 1;
        bool _3764 = _3762 != 0;
        float _3766 = _3760;
        if (_3764)
        {
            _3636 = _3750;
        }
        int _3768 = _3636;
        int _3770 = _3768;
        int _3772 = _3768;
        float _3774 = _3728;
        float _3776 = _3730;
        float _3778 = _3742;
        float _3780 = _3744;
        if (!_3764)
        {
            bool _3782 = _3728 > 0.800000011920928955078125;
            bool _3784 = isnan(_3728);
            bool _3786 = _3782 || _3784;
            bool _3788 = isnan(0.800000011920928955078125);
            bool _3790 = _3786 || _3788;
            bool _3792 = _3730 != 0.0;
            bool _3794 = isnan(_3730);
            bool _3796 = _3792 || _3794;
            bool _3798 = isnan(0.0);
            bool _3800 = _3796 || _3798;
            bool _3802 = !_3790;
            bool _3804 = _3800 || _3802;
            if (_3804)
            {
                _3770 = 1;
            }
            int _3806 = _3770;
            _3772 = _3806;
            if (!_3804)
            {
                float2 _10889 = float2(_3638, _3760);
                float2 _3808 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10889, float2(0.0), isnan(_10889)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10889, float2(0.0), isnan(_10889)), level(0.0)).xy;
                float _3810 = _3808.x;
                float _3812 = _3808.y;
                float _3814 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3760);
                _3772 = _3750;
                _3774 = _3810;
                _3776 = _3812;
                _3766 = _3814;
            }
        }
        int _3816 = _3772;
        float _3818 = _3774;
        float _3820 = _3776;
        float _3822 = _3766;
        int _3824 = _3816 & 1;
        bool _3826 = _3824 != 0;
        float _3828 = _3818;
        float _3830 = _3820;
        float _3832 = _3822;
        int _3834 = _3816;
        if (_3826)
        {
            _3708 = _3816;
        }
        int _3836 = _3708;
        int _3838 = _3836;
        int _3840 = _3836;
        if (!_3826)
        {
            bool _3842 = _3818 > 0.800000011920928955078125;
            bool _3844 = isnan(_3818);
            bool _3846 = _3842 || _3844;
            bool _3848 = isnan(0.800000011920928955078125);
            bool _3850 = _3846 || _3848;
            bool _3852 = _3820 != 0.0;
            bool _3854 = isnan(_3820);
            bool _3856 = _3852 || _3854;
            bool _3858 = isnan(0.0);
            bool _3860 = _3856 || _3858;
            bool _3862 = !_3850;
            bool _3864 = _3860 || _3862;
            if (_3864)
            {
                _3838 = 1;
            }
            int _3866 = _3838;
            _3840 = _3866;
            if (!_3864)
            {
                float2 _10968 = float2(_3638, _3822);
                float2 _3868 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_10968, float2(0.0), isnan(_10968)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_10968, float2(0.0), isnan(_10968)), level(0.0)).xy;
                float _3870 = _3868.x;
                float _3872 = _3868.y;
                float _3874 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3822);
                _3840 = _3816;
                _3828 = _3870;
                _3830 = _3872;
                _3832 = _3874;
            }
        }
        int _3876 = _3840;
        float _3878 = _3828;
        float _3880 = _3830;
        float _3882 = _3832;
        int _3884 = _3876 & 1;
        bool _3886 = _3884 != 0;
        float _3888 = _3878;
        float _3890 = _3880;
        float _3892 = _3882;
        int _3894 = _3876;
        if (_3886)
        {
            _3752 = _3876;
        }
        int _3896 = _3752;
        int _3898 = _3896;
        int _3900 = _3896;
        if (!_3886)
        {
            bool _3902 = _3878 > 0.800000011920928955078125;
            bool _3904 = isnan(_3878);
            bool _3906 = _3902 || _3904;
            bool _3908 = isnan(0.800000011920928955078125);
            bool _3910 = _3906 || _3908;
            bool _3912 = _3880 != 0.0;
            bool _3914 = isnan(_3880);
            bool _3916 = _3912 || _3914;
            bool _3918 = isnan(0.0);
            bool _3920 = _3916 || _3918;
            bool _3922 = !_3910;
            bool _3924 = _3920 || _3922;
            if (_3924)
            {
                _3898 = 1;
            }
            int _3926 = _3898;
            _3900 = _3926;
            if (!_3924)
            {
                float2 _11047 = float2(_3638, _3882);
                float2 _3928 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11047, float2(0.0), isnan(_11047)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11047, float2(0.0), isnan(_11047)), level(0.0)).xy;
                float _3930 = _3928.x;
                float _3932 = _3928.y;
                float _3934 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3882);
                _3900 = _3876;
                _3888 = _3930;
                _3890 = _3932;
                _3892 = _3934;
            }
        }
        int _3936 = _3900;
        float _3938 = _3888;
        float _3940 = _3890;
        float _3942 = _3892;
        int _3944 = _3936 & 1;
        bool _3946 = _3944 != 0;
        float _3948 = _3938;
        float _3950 = _3940;
        float _3952 = _3942;
        int _3954 = _3936;
        if (_3946)
        {
            _3894 = _3936;
        }
        int _3956 = _3894;
        int _3958 = _3956;
        int _3960 = _3956;
        if (!_3946)
        {
            bool _3962 = _3938 > 0.800000011920928955078125;
            bool _3964 = isnan(_3938);
            bool _3966 = _3962 || _3964;
            bool _3968 = isnan(0.800000011920928955078125);
            bool _3970 = _3966 || _3968;
            bool _3972 = _3940 != 0.0;
            bool _3974 = isnan(_3940);
            bool _3976 = _3972 || _3974;
            bool _3978 = isnan(0.0);
            bool _3980 = _3976 || _3978;
            bool _3982 = !_3970;
            bool _3984 = _3980 || _3982;
            if (_3984)
            {
                _3958 = 1;
            }
            int _3986 = _3958;
            _3960 = _3986;
            if (!_3984)
            {
                float2 _11126 = float2(_3638, _3942);
                float2 _3988 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11126, float2(0.0), isnan(_11126)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11126, float2(0.0), isnan(_11126)), level(0.0)).xy;
                float _3990 = _3988.x;
                float _3992 = _3988.y;
                float _3994 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _3942);
                _3960 = _3936;
                _3948 = _3990;
                _3950 = _3992;
                _3952 = _3994;
            }
        }
        int _3996 = _3960;
        float _3998 = _3948;
        float _4000 = _3950;
        float _4002 = _3952;
        int _4004 = _3996 & 1;
        bool _4006 = _4004 != 0;
        float _4008 = _3998;
        float _4010 = _4000;
        float _4012 = _4002;
        int _4014 = _3996;
        if (_4006)
        {
            _3954 = _3996;
        }
        int _4016 = _3954;
        int _4018 = _4016;
        int _4020 = _4016;
        if (!_4006)
        {
            bool _4022 = _3998 > 0.800000011920928955078125;
            bool _4024 = isnan(_3998);
            bool _4026 = _4022 || _4024;
            bool _4028 = isnan(0.800000011920928955078125);
            bool _4030 = _4026 || _4028;
            bool _4032 = _4000 != 0.0;
            bool _4034 = isnan(_4000);
            bool _4036 = _4032 || _4034;
            bool _4038 = isnan(0.0);
            bool _4040 = _4036 || _4038;
            bool _4042 = !_4030;
            bool _4044 = _4040 || _4042;
            if (_4044)
            {
                _4018 = 1;
            }
            int _4046 = _4018;
            _4020 = _4046;
            if (!_4044)
            {
                float2 _11205 = float2(_3638, _4002);
                float2 _4048 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11205, float2(0.0), isnan(_11205)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11205, float2(0.0), isnan(_11205)), level(0.0)).xy;
                float _4050 = _4048.x;
                float _4052 = _4048.y;
                float _4054 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4002);
                _4020 = _3996;
                _4008 = _4050;
                _4010 = _4052;
                _4012 = _4054;
            }
        }
        int _4056 = _4020;
        float _4058 = _4008;
        float _4060 = _4010;
        float _4062 = _4012;
        int _4064 = _4056 & 1;
        bool _4066 = _4064 != 0;
        float _4068 = _4058;
        float _4070 = _4060;
        float _4072 = _4062;
        int _4074 = _4056;
        if (_4066)
        {
            _4014 = _4056;
        }
        int _4076 = _4014;
        int _4078 = _4076;
        int _4080 = _4076;
        if (!_4066)
        {
            bool _4082 = _4058 > 0.800000011920928955078125;
            bool _4084 = isnan(_4058);
            bool _4086 = _4082 || _4084;
            bool _4088 = isnan(0.800000011920928955078125);
            bool _4090 = _4086 || _4088;
            bool _4092 = _4060 != 0.0;
            bool _4094 = isnan(_4060);
            bool _4096 = _4092 || _4094;
            bool _4098 = isnan(0.0);
            bool _4100 = _4096 || _4098;
            bool _4102 = !_4090;
            bool _4104 = _4100 || _4102;
            if (_4104)
            {
                _4078 = 1;
            }
            int _4106 = _4078;
            _4080 = _4106;
            if (!_4104)
            {
                float2 _11284 = float2(_3638, _4062);
                float2 _4108 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11284, float2(0.0), isnan(_11284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11284, float2(0.0), isnan(_11284)), level(0.0)).xy;
                float _4110 = _4108.x;
                float _4112 = _4108.y;
                float _4114 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4062);
                _4080 = _4056;
                _4068 = _4110;
                _4070 = _4112;
                _4072 = _4114;
            }
        }
        int _4116 = _4080;
        float _4118 = _4068;
        float _4120 = _4070;
        float _4122 = _4072;
        int _4124 = _4116 & 1;
        bool _4126 = _4124 != 0;
        float _4128 = _4118;
        float _4130 = _4120;
        float _4132 = _4122;
        int _4134 = _4116;
        if (_4126)
        {
            _4074 = _4116;
        }
        int _4136 = _4074;
        int _4138 = _4136;
        int _4140 = _4136;
        if (!_4126)
        {
            bool _4142 = _4118 > 0.800000011920928955078125;
            bool _4144 = isnan(_4118);
            bool _4146 = _4142 || _4144;
            bool _4148 = isnan(0.800000011920928955078125);
            bool _4150 = _4146 || _4148;
            bool _4152 = _4120 != 0.0;
            bool _4154 = isnan(_4120);
            bool _4156 = _4152 || _4154;
            bool _4158 = isnan(0.0);
            bool _4160 = _4156 || _4158;
            bool _4162 = !_4150;
            bool _4164 = _4160 || _4162;
            if (_4164)
            {
                _4138 = 1;
            }
            int _4166 = _4138;
            _4140 = _4166;
            if (!_4164)
            {
                float2 _11363 = float2(_3638, _4122);
                float2 _4168 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11363, float2(0.0), isnan(_11363)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11363, float2(0.0), isnan(_11363)), level(0.0)).xy;
                float _4170 = _4168.x;
                float _4172 = _4168.y;
                float _4174 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4122);
                _4140 = _4116;
                _4128 = _4170;
                _4130 = _4172;
                _4132 = _4174;
            }
        }
        int _4176 = _4140;
        float _4178 = _4128;
        float _4180 = _4130;
        float _4182 = _4132;
        int _4184 = _4176 & 1;
        bool _4186 = _4184 != 0;
        float _4188 = _4178;
        float _4190 = _4180;
        float _4192 = _4182;
        int _4194 = _4176;
        if (_4186)
        {
            _4134 = _4176;
        }
        int _4196 = _4134;
        int _4198 = _4196;
        int _4200 = _4196;
        if (!_4186)
        {
            bool _4202 = _4178 > 0.800000011920928955078125;
            bool _4204 = isnan(_4178);
            bool _4206 = _4202 || _4204;
            bool _4208 = isnan(0.800000011920928955078125);
            bool _4210 = _4206 || _4208;
            bool _4212 = _4180 != 0.0;
            bool _4214 = isnan(_4180);
            bool _4216 = _4212 || _4214;
            bool _4218 = isnan(0.0);
            bool _4220 = _4216 || _4218;
            bool _4222 = !_4210;
            bool _4224 = _4220 || _4222;
            if (_4224)
            {
                _4198 = 1;
            }
            int _4226 = _4198;
            _4200 = _4226;
            if (!_4224)
            {
                float2 _11442 = float2(_3638, _4182);
                float2 _4228 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11442, float2(0.0), isnan(_11442)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11442, float2(0.0), isnan(_11442)), level(0.0)).xy;
                float _4230 = _4228.x;
                float _4232 = _4228.y;
                float _4234 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4182);
                _4200 = _4176;
                _4188 = _4230;
                _4190 = _4232;
                _4192 = _4234;
            }
        }
        int _4236 = _4200;
        float _4238 = _4188;
        float _4240 = _4190;
        float _4242 = _4192;
        int _4244 = _4236 & 1;
        bool _4246 = _4244 != 0;
        float _4248 = _4238;
        float _4250 = _4240;
        float _4252 = _4242;
        int _4254 = _4236;
        if (_4246)
        {
            _4194 = _4236;
        }
        int _4256 = _4194;
        int _4258 = _4256;
        int _4260 = _4256;
        if (!_4246)
        {
            bool _4262 = _4238 > 0.800000011920928955078125;
            bool _4264 = isnan(_4238);
            bool _4266 = _4262 || _4264;
            bool _4268 = isnan(0.800000011920928955078125);
            bool _4270 = _4266 || _4268;
            bool _4272 = _4240 != 0.0;
            bool _4274 = isnan(_4240);
            bool _4276 = _4272 || _4274;
            bool _4278 = isnan(0.0);
            bool _4280 = _4276 || _4278;
            bool _4282 = !_4270;
            bool _4284 = _4280 || _4282;
            if (_4284)
            {
                _4258 = 1;
            }
            int _4286 = _4258;
            _4260 = _4286;
            if (!_4284)
            {
                float2 _11521 = float2(_3638, _4242);
                float2 _4288 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11521, float2(0.0), isnan(_11521)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11521, float2(0.0), isnan(_11521)), level(0.0)).xy;
                float _4290 = _4288.x;
                float _4292 = _4288.y;
                float _4294 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4242);
                _4260 = _4236;
                _4248 = _4290;
                _4250 = _4292;
                _4252 = _4294;
            }
        }
        int _4296 = _4260;
        float _4298 = _4248;
        float _4300 = _4250;
        float _4302 = _4252;
        int _4304 = _4296 & 1;
        bool _4306 = _4304 != 0;
        float _4308 = _4298;
        float _4310 = _4300;
        float _4312 = _4302;
        int _4314 = _4296;
        if (_4306)
        {
            _4254 = _4296;
        }
        int _4316 = _4254;
        int _4318 = _4316;
        int _4320 = _4316;
        if (!_4306)
        {
            bool _4322 = _4298 > 0.800000011920928955078125;
            bool _4324 = isnan(_4298);
            bool _4326 = _4322 || _4324;
            bool _4328 = isnan(0.800000011920928955078125);
            bool _4330 = _4326 || _4328;
            bool _4332 = _4300 != 0.0;
            bool _4334 = isnan(_4300);
            bool _4336 = _4332 || _4334;
            bool _4338 = isnan(0.0);
            bool _4340 = _4336 || _4338;
            bool _4342 = !_4330;
            bool _4344 = _4340 || _4342;
            if (_4344)
            {
                _4318 = 1;
            }
            int _4346 = _4318;
            _4320 = _4346;
            if (!_4344)
            {
                float2 _11600 = float2(_3638, _4302);
                float2 _4348 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11600, float2(0.0), isnan(_11600)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11600, float2(0.0), isnan(_11600)), level(0.0)).xy;
                float _4350 = _4348.x;
                float _4352 = _4348.y;
                float _4354 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4302);
                _4320 = _4296;
                _4308 = _4350;
                _4310 = _4352;
                _4312 = _4354;
            }
        }
        int _4356 = _4320;
        float _4358 = _4308;
        float _4360 = _4310;
        float _4362 = _4312;
        int _4364 = _4356 & 1;
        bool _4366 = _4364 != 0;
        float _4368 = _4358;
        float _4370 = _4360;
        float _4372 = _4362;
        int _4374 = _4356;
        if (_4366)
        {
            _4314 = _4356;
        }
        int _4376 = _4314;
        int _4378 = _4376;
        int _4380 = _4376;
        if (!_4366)
        {
            bool _4382 = _4358 > 0.800000011920928955078125;
            bool _4384 = isnan(_4358);
            bool _4386 = _4382 || _4384;
            bool _4388 = isnan(0.800000011920928955078125);
            bool _4390 = _4386 || _4388;
            bool _4392 = _4360 != 0.0;
            bool _4394 = isnan(_4360);
            bool _4396 = _4392 || _4394;
            bool _4398 = isnan(0.0);
            bool _4400 = _4396 || _4398;
            bool _4402 = !_4390;
            bool _4404 = _4400 || _4402;
            if (_4404)
            {
                _4378 = 1;
            }
            int _4406 = _4378;
            _4380 = _4406;
            if (!_4404)
            {
                float2 _11679 = float2(_3638, _4362);
                float2 _4408 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11679, float2(0.0), isnan(_11679)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11679, float2(0.0), isnan(_11679)), level(0.0)).xy;
                float _4410 = _4408.x;
                float _4412 = _4408.y;
                float _4414 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4362);
                _4380 = _4356;
                _4368 = _4410;
                _4370 = _4412;
                _4372 = _4414;
            }
        }
        int _4416 = _4380;
        float _4418 = _4368;
        float _4420 = _4370;
        float _4422 = _4372;
        int _4424 = _4416 & 1;
        bool _4426 = _4424 != 0;
        float _4428 = _4418;
        float _4430 = _4420;
        float _4432 = _4422;
        int _4434 = _4416;
        if (_4426)
        {
            _4374 = _4416;
        }
        int _4436 = _4374;
        int _4438 = _4436;
        int _4440 = _4436;
        if (!_4426)
        {
            bool _4442 = _4418 > 0.800000011920928955078125;
            bool _4444 = isnan(_4418);
            bool _4446 = _4442 || _4444;
            bool _4448 = isnan(0.800000011920928955078125);
            bool _4450 = _4446 || _4448;
            bool _4452 = _4420 != 0.0;
            bool _4454 = isnan(_4420);
            bool _4456 = _4452 || _4454;
            bool _4458 = isnan(0.0);
            bool _4460 = _4456 || _4458;
            bool _4462 = !_4450;
            bool _4464 = _4460 || _4462;
            if (_4464)
            {
                _4438 = 1;
            }
            int _4466 = _4438;
            _4440 = _4466;
            if (!_4464)
            {
                float2 _11758 = float2(_3638, _4422);
                float2 _4468 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11758, float2(0.0), isnan(_11758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11758, float2(0.0), isnan(_11758)), level(0.0)).xy;
                float _4470 = _4468.x;
                float _4472 = _4468.y;
                float _4474 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4422);
                _4440 = _4416;
                _4428 = _4470;
                _4430 = _4472;
                _4432 = _4474;
            }
        }
        int _4476 = _4440;
        float _4478 = _4428;
        float _4480 = _4430;
        float _4482 = _4432;
        int _4484 = _4476 & 1;
        bool _4486 = _4484 != 0;
        float _4488 = _4482;
        float _4490 = _4478;
        float _4492 = _4480;
        float _4494 = as_type<float>(_4476);
        if (_3690)
        {
            _3834 = 1;
        }
        int _4496 = _3834;
        int _4498 = _4496;
        if (!_3690)
        {
            _4498 = 0;
        }
        int _4500 = _4498;
        int _4502 = _4500 & 1;
        bool _4504 = _4502 != 0;
        if (_4486)
        {
            _4434 = _4476;
        }
        int _4506 = _4434;
        int _4508 = _4506;
        int _4510 = _4506;
        if (!_4486)
        {
            bool _4512 = _4478 > 0.800000011920928955078125;
            bool _4514 = isnan(_4478);
            bool _4516 = _4512 || _4514;
            bool _4518 = isnan(0.800000011920928955078125);
            bool _4520 = _4516 || _4518;
            bool _4522 = _4480 != 0.0;
            bool _4524 = isnan(_4480);
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
                float2 _11852 = float2(_3638, _4482);
                float2 _4538 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11852, float2(0.0), isnan(_11852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11852, float2(0.0), isnan(_11852)), level(0.0)).xy;
                float _4540 = _4538.x;
                float _4542 = _4538.y;
                float _4544 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4482);
                _4510 = _4476;
                _4488 = _4544;
                _4490 = _4540;
                _4492 = _4542;
            }
        }
        int _4546 = _4510;
        float _4548 = _4488;
        float _4550 = _4490;
        float _4552 = _4492;
        int _4554 = _4546 & 1;
        bool _4556 = _4554 != 0;
        float _4558 = _4550;
        float _4560 = _4552;
        int _4562 = as_type<int>(_4548);
        int _4564 = _4546;
        if (_3690)
        {
            _4494 = _3656;
        }
        float _4566 = _4494;
        float _4568 = _4566;
        if (!_3690)
        {
            float _4570 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _3656);
            _4568 = _4570;
        }
        float _4572 = _4568;
        float _4574 = _4572;
        if (_4556)
        {
            _3710 = _4548;
        }
        float _4576 = _3710;
        float _4578 = _4576;
        float _4580 = _4576;
        if (!_4556)
        {
            bool _4582 = _4550 > 0.800000011920928955078125;
            bool _4584 = isnan(_4550);
            bool _4586 = _4582 || _4584;
            bool _4588 = isnan(0.800000011920928955078125);
            bool _4590 = _4586 || _4588;
            bool _4592 = _4552 != 0.0;
            bool _4594 = isnan(_4552);
            bool _4596 = _4592 || _4594;
            bool _4598 = isnan(0.0);
            bool _4600 = _4596 || _4598;
            bool _4602 = !_4590;
            bool _4604 = _4600 || _4602;
            if (_4604)
            {
                _4578 = _4548;
            }
            float _4606 = _4578;
            _4580 = _4606;
            if (!_4604)
            {
                float2 _11950 = float2(_3638, _4548);
                float2 _4608 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_11950, float2(0.0), isnan(_11950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_11950, float2(0.0), isnan(_11950)), level(0.0)).xy;
                float _4610 = _4608.x;
                float _4612 = _4608.y;
                float _4614 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, -2.0, _4548);
                _4558 = _4610;
                _4560 = _4612;
                _4580 = _4614;
            }
        }
        float _4616 = _4558;
        float _4618 = _4560;
        float _4620 = _4580;
        if (_4504)
        {
            _4562 = _4500;
        }
        int _4622 = _4562;
        int _4624 = _4622;
        int _4626 = _4622;
        if (!_4504)
        {
            bool _4628 = _3742 > 0.800000011920928955078125;
            bool _4630 = isnan(_3742);
            bool _4632 = _4628 || _4630;
            bool _4634 = isnan(0.800000011920928955078125);
            bool _4636 = _4632 || _4634;
            bool _4638 = _3744 != 0.0;
            bool _4640 = isnan(_3744);
            bool _4642 = _4638 || _4640;
            bool _4644 = isnan(0.0);
            bool _4646 = _4642 || _4644;
            bool _4648 = !_4636;
            bool _4650 = _4646 || _4648;
            if (_4650)
            {
                _4624 = 1;
            }
            int _4652 = _4624;
            _4626 = _4652;
            if (!_4650)
            {
                float2 _12019 = float2(_3638, _4572);
                float2 _4654 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12019, float2(0.0), isnan(_12019)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12019, float2(0.0), isnan(_12019)), level(0.0)).xy;
                float _4656 = _4654.x;
                float _4658 = _4654.y;
                float _4660 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4572);
                _4626 = _4500;
                _3778 = _4656;
                _3780 = _4658;
                _4574 = _4660;
            }
        }
        int _4662 = _4626;
        float _4664 = _3778;
        float _4666 = _3780;
        float _4668 = _4574;
        int _4670 = _4662 & 1;
        bool _4672 = _4670 != 0;
        float _4674 = _4664;
        float _4676 = _4666;
        float _4678 = _4668;
        int _4680 = _4662;
        if (_4672)
        {
            _4564 = _4662;
        }
        int _4682 = _4564;
        int _4684 = _4682;
        int _4686 = _4682;
        if (!_4672)
        {
            bool _4688 = _4664 > 0.800000011920928955078125;
            bool _4690 = isnan(_4664);
            bool _4692 = _4688 || _4690;
            bool _4694 = isnan(0.800000011920928955078125);
            bool _4696 = _4692 || _4694;
            bool _4698 = _4666 != 0.0;
            bool _4700 = isnan(_4666);
            bool _4702 = _4698 || _4700;
            bool _4704 = isnan(0.0);
            bool _4706 = _4702 || _4704;
            bool _4708 = !_4696;
            bool _4710 = _4706 || _4708;
            if (_4710)
            {
                _4684 = 1;
            }
            int _4712 = _4684;
            _4686 = _4712;
            if (!_4710)
            {
                float2 _12098 = float2(_3638, _4668);
                float2 _4714 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12098, float2(0.0), isnan(_12098)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12098, float2(0.0), isnan(_12098)), level(0.0)).xy;
                float _4716 = _4714.x;
                float _4718 = _4714.y;
                float _4720 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4668);
                _4686 = _4662;
                _4674 = _4716;
                _4676 = _4718;
                _4678 = _4720;
            }
        }
        int _4722 = _4686;
        float _4724 = _4674;
        float _4726 = _4676;
        float _4728 = _4678;
        int _4730 = _4722 & 1;
        bool _4732 = _4730 != 0;
        float _4734 = _4724;
        float _4736 = _4726;
        float _4738 = _4728;
        int _4740 = _4722;
        if (_4732)
        {
            _4680 = _4722;
        }
        int _4742 = _4680;
        int _4744 = _4742;
        int _4746 = _4742;
        if (!_4732)
        {
            bool _4748 = _4724 > 0.800000011920928955078125;
            bool _4750 = isnan(_4724);
            bool _4752 = _4748 || _4750;
            bool _4754 = isnan(0.800000011920928955078125);
            bool _4756 = _4752 || _4754;
            bool _4758 = _4726 != 0.0;
            bool _4760 = isnan(_4726);
            bool _4762 = _4758 || _4760;
            bool _4764 = isnan(0.0);
            bool _4766 = _4762 || _4764;
            bool _4768 = !_4756;
            bool _4770 = _4766 || _4768;
            if (_4770)
            {
                _4744 = 1;
            }
            int _4772 = _4744;
            _4746 = _4772;
            if (!_4770)
            {
                float2 _12177 = float2(_3638, _4728);
                float2 _4774 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12177, float2(0.0), isnan(_12177)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12177, float2(0.0), isnan(_12177)), level(0.0)).xy;
                float _4776 = _4774.x;
                float _4778 = _4774.y;
                float _4780 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4728);
                _4746 = _4722;
                _4734 = _4776;
                _4736 = _4778;
                _4738 = _4780;
            }
        }
        int _4782 = _4746;
        float _4784 = _4734;
        float _4786 = _4736;
        float _4788 = _4738;
        int _4790 = _4782 & 1;
        bool _4792 = _4790 != 0;
        float _4794 = _4784;
        float _4796 = _4786;
        float _4798 = _4788;
        int _4800 = _4782;
        if (_4792)
        {
            _4740 = _4782;
        }
        int _4802 = _4740;
        int _4804 = _4802;
        int _4806 = _4802;
        if (!_4792)
        {
            bool _4808 = _4784 > 0.800000011920928955078125;
            bool _4810 = isnan(_4784);
            bool _4812 = _4808 || _4810;
            bool _4814 = isnan(0.800000011920928955078125);
            bool _4816 = _4812 || _4814;
            bool _4818 = _4786 != 0.0;
            bool _4820 = isnan(_4786);
            bool _4822 = _4818 || _4820;
            bool _4824 = isnan(0.0);
            bool _4826 = _4822 || _4824;
            bool _4828 = !_4816;
            bool _4830 = _4826 || _4828;
            if (_4830)
            {
                _4804 = 1;
            }
            int _4832 = _4804;
            _4806 = _4832;
            if (!_4830)
            {
                float2 _12256 = float2(_3638, _4788);
                float2 _4834 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12256, float2(0.0), isnan(_12256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12256, float2(0.0), isnan(_12256)), level(0.0)).xy;
                float _4836 = _4834.x;
                float _4838 = _4834.y;
                float _4840 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4788);
                _4806 = _4782;
                _4794 = _4836;
                _4796 = _4838;
                _4798 = _4840;
            }
        }
        int _4842 = _4806;
        float _4844 = _4794;
        float _4846 = _4796;
        float _4848 = _4798;
        int _4850 = _4842 & 1;
        bool _4852 = _4850 != 0;
        float _4854 = _4844;
        float _4856 = _4846;
        float _4858 = _4848;
        int _4860 = _4842;
        if (_4852)
        {
            _4800 = _4842;
        }
        int _4862 = _4800;
        int _4864 = _4862;
        int _4866 = _4862;
        if (!_4852)
        {
            bool _4868 = _4844 > 0.800000011920928955078125;
            bool _4870 = isnan(_4844);
            bool _4872 = _4868 || _4870;
            bool _4874 = isnan(0.800000011920928955078125);
            bool _4876 = _4872 || _4874;
            bool _4878 = _4846 != 0.0;
            bool _4880 = isnan(_4846);
            bool _4882 = _4878 || _4880;
            bool _4884 = isnan(0.0);
            bool _4886 = _4882 || _4884;
            bool _4888 = !_4876;
            bool _4890 = _4886 || _4888;
            if (_4890)
            {
                _4864 = 1;
            }
            int _4892 = _4864;
            _4866 = _4892;
            if (!_4890)
            {
                float2 _12335 = float2(_3638, _4848);
                float2 _4894 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12335, float2(0.0), isnan(_12335)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12335, float2(0.0), isnan(_12335)), level(0.0)).xy;
                float _4896 = _4894.x;
                float _4898 = _4894.y;
                float _4900 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4848);
                _4866 = _4842;
                _4854 = _4896;
                _4856 = _4898;
                _4858 = _4900;
            }
        }
        int _4902 = _4866;
        float _4904 = _4854;
        float _4906 = _4856;
        float _4908 = _4858;
        int _4910 = _4902 & 1;
        bool _4912 = _4910 != 0;
        float _4914 = _4904;
        float _4916 = _4906;
        float _4918 = _4908;
        int _4920 = _4902;
        if (_4912)
        {
            _4860 = _4902;
        }
        int _4922 = _4860;
        int _4924 = _4922;
        int _4926 = _4922;
        if (!_4912)
        {
            bool _4928 = _4904 > 0.800000011920928955078125;
            bool _4930 = isnan(_4904);
            bool _4932 = _4928 || _4930;
            bool _4934 = isnan(0.800000011920928955078125);
            bool _4936 = _4932 || _4934;
            bool _4938 = _4906 != 0.0;
            bool _4940 = isnan(_4906);
            bool _4942 = _4938 || _4940;
            bool _4944 = isnan(0.0);
            bool _4946 = _4942 || _4944;
            bool _4948 = !_4936;
            bool _4950 = _4946 || _4948;
            if (_4950)
            {
                _4924 = 1;
            }
            int _4952 = _4924;
            _4926 = _4952;
            if (!_4950)
            {
                float2 _12414 = float2(_3638, _4908);
                float2 _4954 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12414, float2(0.0), isnan(_12414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12414, float2(0.0), isnan(_12414)), level(0.0)).xy;
                float _4956 = _4954.x;
                float _4958 = _4954.y;
                float _4960 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4908);
                _4926 = _4902;
                _4914 = _4956;
                _4916 = _4958;
                _4918 = _4960;
            }
        }
        int _4962 = _4926;
        float _4964 = _4914;
        float _4966 = _4916;
        float _4968 = _4918;
        int _4970 = _4962 & 1;
        bool _4972 = _4970 != 0;
        float _4974 = _4964;
        float _4976 = _4966;
        float _4978 = _4968;
        int _4980 = _4962;
        if (_4972)
        {
            _4920 = _4962;
        }
        int _4982 = _4920;
        int _4984 = _4982;
        int _4986 = _4982;
        if (!_4972)
        {
            bool _4988 = _4964 > 0.800000011920928955078125;
            bool _4990 = isnan(_4964);
            bool _4992 = _4988 || _4990;
            bool _4994 = isnan(0.800000011920928955078125);
            bool _4996 = _4992 || _4994;
            bool _4998 = _4966 != 0.0;
            bool _5000 = isnan(_4966);
            bool _5002 = _4998 || _5000;
            bool _5004 = isnan(0.0);
            bool _5006 = _5002 || _5004;
            bool _5008 = !_4996;
            bool _5010 = _5006 || _5008;
            if (_5010)
            {
                _4984 = 1;
            }
            int _5012 = _4984;
            _4986 = _5012;
            if (!_5010)
            {
                float2 _12493 = float2(_3638, _4968);
                float2 _5014 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12493, float2(0.0), isnan(_12493)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12493, float2(0.0), isnan(_12493)), level(0.0)).xy;
                float _5016 = _5014.x;
                float _5018 = _5014.y;
                float _5020 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _4968);
                _4986 = _4962;
                _4974 = _5016;
                _4976 = _5018;
                _4978 = _5020;
            }
        }
        int _5022 = _4986;
        float _5024 = _4974;
        float _5026 = _4976;
        float _5028 = _4978;
        int _5030 = _5022 & 1;
        bool _5032 = _5030 != 0;
        float _5034 = _5024;
        float _5036 = _5026;
        float _5038 = _5028;
        int _5040 = _5022;
        if (_5032)
        {
            _4980 = _5022;
        }
        int _5042 = _4980;
        int _5044 = _5042;
        int _5046 = _5042;
        if (!_5032)
        {
            bool _5048 = _5024 > 0.800000011920928955078125;
            bool _5050 = isnan(_5024);
            bool _5052 = _5048 || _5050;
            bool _5054 = isnan(0.800000011920928955078125);
            bool _5056 = _5052 || _5054;
            bool _5058 = _5026 != 0.0;
            bool _5060 = isnan(_5026);
            bool _5062 = _5058 || _5060;
            bool _5064 = isnan(0.0);
            bool _5066 = _5062 || _5064;
            bool _5068 = !_5056;
            bool _5070 = _5066 || _5068;
            if (_5070)
            {
                _5044 = 1;
            }
            int _5072 = _5044;
            _5046 = _5072;
            if (!_5070)
            {
                float2 _12572 = float2(_3638, _5028);
                float2 _5074 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12572, float2(0.0), isnan(_12572)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12572, float2(0.0), isnan(_12572)), level(0.0)).xy;
                float _5076 = _5074.x;
                float _5078 = _5074.y;
                float _5080 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5028);
                _5046 = _5022;
                _5034 = _5076;
                _5036 = _5078;
                _5038 = _5080;
            }
        }
        int _5082 = _5046;
        float _5084 = _5034;
        float _5086 = _5036;
        float _5088 = _5038;
        int _5090 = _5082 & 1;
        bool _5092 = _5090 != 0;
        float _5094 = _5084;
        float _5096 = _5086;
        float _5098 = _5088;
        int _5100 = _5082;
        if (_5092)
        {
            _5040 = _5082;
        }
        int _5102 = _5040;
        int _5104 = _5102;
        int _5106 = _5102;
        if (!_5092)
        {
            bool _5108 = _5084 > 0.800000011920928955078125;
            bool _5110 = isnan(_5084);
            bool _5112 = _5108 || _5110;
            bool _5114 = isnan(0.800000011920928955078125);
            bool _5116 = _5112 || _5114;
            bool _5118 = _5086 != 0.0;
            bool _5120 = isnan(_5086);
            bool _5122 = _5118 || _5120;
            bool _5124 = isnan(0.0);
            bool _5126 = _5122 || _5124;
            bool _5128 = !_5116;
            bool _5130 = _5126 || _5128;
            if (_5130)
            {
                _5104 = 1;
            }
            int _5132 = _5104;
            _5106 = _5132;
            if (!_5130)
            {
                float2 _12651 = float2(_3638, _5088);
                float2 _5134 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12651, float2(0.0), isnan(_12651)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12651, float2(0.0), isnan(_12651)), level(0.0)).xy;
                float _5136 = _5134.x;
                float _5138 = _5134.y;
                float _5140 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5088);
                _5106 = _5082;
                _5094 = _5136;
                _5096 = _5138;
                _5098 = _5140;
            }
        }
        int _5142 = _5106;
        float _5144 = _5094;
        float _5146 = _5096;
        float _5148 = _5098;
        int _5150 = _5142 & 1;
        bool _5152 = _5150 != 0;
        float _5154 = _5144;
        float _5156 = _5146;
        float _5158 = _5148;
        int _5160 = _5142;
        if (_5152)
        {
            _5100 = _5142;
        }
        int _5162 = _5100;
        int _5164 = _5162;
        int _5166 = _5162;
        if (!_5152)
        {
            bool _5168 = _5144 > 0.800000011920928955078125;
            bool _5170 = isnan(_5144);
            bool _5172 = _5168 || _5170;
            bool _5174 = isnan(0.800000011920928955078125);
            bool _5176 = _5172 || _5174;
            bool _5178 = _5146 != 0.0;
            bool _5180 = isnan(_5146);
            bool _5182 = _5178 || _5180;
            bool _5184 = isnan(0.0);
            bool _5186 = _5182 || _5184;
            bool _5188 = !_5176;
            bool _5190 = _5186 || _5188;
            if (_5190)
            {
                _5164 = 1;
            }
            int _5192 = _5164;
            _5166 = _5192;
            if (!_5190)
            {
                float2 _12730 = float2(_3638, _5148);
                float2 _5194 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12730, float2(0.0), isnan(_12730)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12730, float2(0.0), isnan(_12730)), level(0.0)).xy;
                float _5196 = _5194.x;
                float _5198 = _5194.y;
                float _5200 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5148);
                _5166 = _5142;
                _5154 = _5196;
                _5156 = _5198;
                _5158 = _5200;
            }
        }
        int _5202 = _5166;
        float _5204 = _5154;
        float _5206 = _5156;
        float _5208 = _5158;
        int _5210 = _5202 & 1;
        bool _5212 = _5210 != 0;
        float _5214 = _5204;
        float _5216 = _5206;
        float _5218 = _5208;
        int _5220 = _5202;
        if (_5212)
        {
            _5160 = _5202;
        }
        int _5222 = _5160;
        int _5224 = _5222;
        int _5226 = _5222;
        if (!_5212)
        {
            bool _5228 = _5204 > 0.800000011920928955078125;
            bool _5230 = isnan(_5204);
            bool _5232 = _5228 || _5230;
            bool _5234 = isnan(0.800000011920928955078125);
            bool _5236 = _5232 || _5234;
            bool _5238 = _5206 != 0.0;
            bool _5240 = isnan(_5206);
            bool _5242 = _5238 || _5240;
            bool _5244 = isnan(0.0);
            bool _5246 = _5242 || _5244;
            bool _5248 = !_5236;
            bool _5250 = _5246 || _5248;
            if (_5250)
            {
                _5224 = 1;
            }
            int _5252 = _5224;
            _5226 = _5252;
            if (!_5250)
            {
                float2 _12809 = float2(_3638, _5208);
                float2 _5254 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12809, float2(0.0), isnan(_12809)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12809, float2(0.0), isnan(_12809)), level(0.0)).xy;
                float _5256 = _5254.x;
                float _5258 = _5254.y;
                float _5260 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5208);
                _5226 = _5202;
                _5214 = _5256;
                _5216 = _5258;
                _5218 = _5260;
            }
        }
        int _5262 = _5226;
        float _5264 = _5214;
        float _5266 = _5216;
        float _5268 = _5218;
        int _5270 = _5262 & 1;
        bool _5272 = _5270 != 0;
        float _5274 = _5264;
        float _5276 = _5266;
        float _5278 = _5268;
        int _5280 = _5262;
        if (_5272)
        {
            _5220 = _5262;
        }
        int _5282 = _5220;
        int _5284 = _5282;
        int _5286 = _5282;
        if (!_5272)
        {
            bool _5288 = _5264 > 0.800000011920928955078125;
            bool _5290 = isnan(_5264);
            bool _5292 = _5288 || _5290;
            bool _5294 = isnan(0.800000011920928955078125);
            bool _5296 = _5292 || _5294;
            bool _5298 = _5266 != 0.0;
            bool _5300 = isnan(_5266);
            bool _5302 = _5298 || _5300;
            bool _5304 = isnan(0.0);
            bool _5306 = _5302 || _5304;
            bool _5308 = !_5296;
            bool _5310 = _5306 || _5308;
            if (_5310)
            {
                _5284 = 1;
            }
            int _5312 = _5284;
            _5286 = _5312;
            if (!_5310)
            {
                float2 _12888 = float2(_3638, _5268);
                float2 _5314 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12888, float2(0.0), isnan(_12888)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12888, float2(0.0), isnan(_12888)), level(0.0)).xy;
                float _5316 = _5314.x;
                float _5318 = _5314.y;
                float _5320 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5268);
                _5286 = _5262;
                _5274 = _5316;
                _5276 = _5318;
                _5278 = _5320;
            }
        }
        int _5322 = _5286;
        float _5324 = _5274;
        float _5326 = _5276;
        float _5328 = _5278;
        int _5330 = _5322 & 1;
        bool _5332 = _5330 != 0;
        float _5334 = _5328;
        float _5336 = _5324;
        float _5338 = _5326;
        if (_5332)
        {
            _5280 = _5322;
        }
        int _5340 = _5280;
        int _5342 = _5340;
        int _5344 = _5340;
        if (!_5332)
        {
            bool _5346 = _5324 > 0.800000011920928955078125;
            bool _5348 = isnan(_5324);
            bool _5350 = _5346 || _5348;
            bool _5352 = isnan(0.800000011920928955078125);
            bool _5354 = _5350 || _5352;
            bool _5356 = _5326 != 0.0;
            bool _5358 = isnan(_5326);
            bool _5360 = _5356 || _5358;
            bool _5362 = isnan(0.0);
            bool _5364 = _5360 || _5362;
            bool _5366 = !_5354;
            bool _5368 = _5364 || _5366;
            if (_5368)
            {
                _5342 = 1;
            }
            int _5370 = _5342;
            _5344 = _5370;
            if (!_5368)
            {
                float2 _12966 = float2(_3638, _5328);
                float2 _5372 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_12966, float2(0.0), isnan(_12966)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_12966, float2(0.0), isnan(_12966)), level(0.0)).xy;
                float _5374 = _5372.x;
                float _5376 = _5372.y;
                float _5378 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5328);
                _5344 = _5322;
                _5334 = _5378;
                _5336 = _5374;
                _5338 = _5376;
            }
        }
        int _5380 = _5344;
        float _5382 = _5334;
        float _5384 = _5336;
        float _5386 = _5338;
        int _5388 = _5380 & 1;
        bool _5390 = _5388 != 0;
        float _5392 = _5386;
        float _5394 = _5384;
        if (_5390)
        {
            _3712 = _5382;
        }
        float _5396 = _3712;
        float _5398 = _5396;
        float _5400 = _5396;
        if (!_5390)
        {
            bool _5402 = _5384 > 0.800000011920928955078125;
            bool _5404 = isnan(_5384);
            bool _5406 = _5402 || _5404;
            bool _5408 = isnan(0.800000011920928955078125);
            bool _5410 = _5406 || _5408;
            bool _5412 = _5386 != 0.0;
            bool _5414 = isnan(_5386);
            bool _5416 = _5412 || _5414;
            bool _5418 = isnan(0.0);
            bool _5420 = _5416 || _5418;
            bool _5422 = !_5410;
            bool _5424 = _5420 || _5422;
            if (_5424)
            {
                _5398 = _5382;
            }
            float _5426 = _5398;
            _5400 = _5426;
            if (!_5424)
            {
                float2 _13044 = float2(_3638, _5382);
                float2 _5428 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13044, float2(0.0), isnan(_13044)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13044, float2(0.0), isnan(_13044)), level(0.0)).xy;
                float _5430 = _5428.x;
                float _5432 = _5428.y;
                float _5434 = fma((*spvDescriptorSet0.cp_c3)._m0[0].w, 2.0, _5382);
                _5392 = _5432;
                _5394 = _5430;
                _5400 = _5434;
            }
        }
        float _5436 = _5392;
        float _5438 = _5394;
        float _5440 = _5400;
        float _5442 = fma(_5436, 0.5, 0.5234375);
        float _5444 = fma(_5438, 2.0, 0.03125);
        float _5446 = fma(_4616, 2.0, 0.03125);
        float _5448 = fma(_4618, 0.5, 0.0078125);
        float2 _13076 = float2(_5442, _5444);
        float _5450 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_13076, float2(0.0), isnan(_13076)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_13076, float2(0.0), isnan(_13076)), level(0.0)).x;
        float2 _13084 = float2(_5448, _5446);
        float _5452 = dm_bs(spvDescriptorSet0.cp_t_tcb_C.sample(spvDescriptorSet0.cp_t_tcb_CSmplr, select(_13084, float2(0.0), isnan(_13084)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.cp_t_tcb_C, spvDescriptorSet0.cp_t_tcb_CSmplr_w, select(_13084, float2(0.0), isnan(_13084)), level(0.0)).x;
        float _5454 = fma(_5450, -2.007874011993408203125, 3.25);
        float _5456 = -(*spvDescriptorSet0.cp_c3)._m0[0].w;
        float _5458 = fma(_5454, _5456, _5440);
        float _5460 = fma(_5452, -2.007874011993408203125, 3.25);
        float2 _13103 = float2(_126, _5458);
        float _5462 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13103, float2(0.0), isnan(_13103)), level(0.0), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13103, float2(0.0), isnan(_13103)), level(0.0), int2(0, 1)).y;
        float _5464 = fma(_5460, (*spvDescriptorSet0.cp_c3)._m0[0].w, _4620);
        float2 _13116 = float2(_126, _5464);
        float _5466 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13116, float2(0.0), isnan(_13116)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13116, float2(0.0), isnan(_13116)), level(0.0)).y;
        float _5468 = -_114;
        float _5470 = fma(_5464, (*spvDescriptorSet0.cp_c3)._m0[0].y, _5468);
        float _5472 = -_114;
        float _5474 = fma(_5458, (*spvDescriptorSet0.cp_c3)._m0[0].y, _5472);
        float _5476 = rint(_5474);
        float _5478 = rint(_5470);
        float _5480 = abs(_5476);
        float _5482 = sqrt(_5480);
        float _5484 = abs(_5478);
        float _5486 = sqrt(_5484);
        float _5488 = _5462 * 4.0;
        float _5490 = rint(_5488);
        float _5492 = _5466 * 4.0;
        float _5494 = rint(_5492);
        float _5496 = fma(_5490, 16.0, _5482);
        float _5498 = fma(_5496, 0.00357142859138548374176025390625, 0.001785714295692741870880126953125);
        float _5500 = fma((*spvDescriptorSet0.cp_c3)._m0[3].x, 0.14285714924335479736328125, _5498);
        float _5502 = fma(_5494, 16.0, _5486);
        float _5504 = fma(_5502, 0.012500000186264514923095703125, 0.0062500000931322574615478515625);
        float2 _13172 = float2(_116, _5464);
        float _5506 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13172, float2(0.0), isnan(_13172)), level(0.0), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13172, float2(0.0), isnan(_13172)), level(0.0), int2(1, 0)).y;
        float2 _13180 = float2(_116, _5464);
        float _5508 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13180, float2(0.0), isnan(_13180)), level(0.0), int2(-2, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13180, float2(0.0), isnan(_13180)), level(0.0), int2(-2, 0)).y;
        float2 _13189 = float2(_116, _5458);
        float _5510 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13189, float2(0.0), isnan(_13189)), level(0.0), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13189, float2(0.0), isnan(_13189)), level(0.0), int2(1)).y;
        float2 _13197 = float2(_116, _5458);
        float _5512 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_13197, float2(0.0), isnan(_13197)), level(0.0), int2(-2, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_13197, float2(0.0), isnan(_13197)), level(0.0), int2(-2, 1)).y;
        float2 _13206 = float2(_5504, _5500);
        float2 _5514 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_13206, float2(0.0), isnan(_13206)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_13206, float2(0.0), isnan(_13206)), level(0.0)).xy;
        float _5516 = _5514.x;
        float _5518 = _5514.y;
        float _5520 = abs(_5476);
        float _5522 = abs(_5478);
        bool _5524 = _5520 >= _5522;
        bool _5526 = isnan(_5520);
        bool _5528 = _5524 || _5526;
        bool _5530 = isnan(_5522);
        bool _5532 = _5528 || _5530;
        float _5534 = float(_5532);
        float _5536 = abs(_5478);
        float _5538 = abs(_5476);
        bool _5540 = _5536 >= _5538;
        bool _5542 = isnan(_5536);
        bool _5544 = _5540 || _5542;
        bool _5546 = isnan(_5538);
        bool _5548 = _5544 || _5546;
        float _5550 = float(_5548);
        float _5552 = _5534 + _5550;
        float _5554 = 1.0 / _5552;
        float _5556 = _5554 * (*spvDescriptorSet0.cp_c3)._m0[2].x;
        float _5558 = _5534 * _5556;
        float _5560 = _5550 * _5556;
        float _5562 = -_5558;
        float _5564 = fma(_5562, _5506, 1.0);
        float _5566 = -_5558;
        float _5568 = fma(_5566, _5508, 1.0);
        float _5570 = -_5560;
        float _5572 = fma(_5570, _5510, _5564);
        float _5574 = precise::clamp(_5572, 0.0, 1.0);
        float _5576 = -_5560;
        float _5578 = fma(_5576, _5512, _5568);
        float _5580 = precise::clamp(_5578, 0.0, 1.0);
        float _5582 = _5516 * _5574;
        float _5584 = _5518 * _5580;
        _5586 = _5582;
        _5588 = _5584;
        _5590 = true;
    }
    else
    {
        _5586 = 0.0;
        _5588 = 0.0;
    }
    _5590 = false;
    float _5592 = _5586;
    float _5594 = _5588;
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(_3622, _3624, _5592, _5594), uint2(int2(as_type<int>(_104), as_type<int>(_106))));
}

