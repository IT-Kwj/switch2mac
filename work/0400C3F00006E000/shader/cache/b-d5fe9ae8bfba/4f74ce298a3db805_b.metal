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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_18 [[id(3)]];
    sampler fp_t_tcb_18Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_1C [[id(5)]];
    sampler fp_t_tcb_1CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    texture2d<float> fp_t_tcb_16 [[id(17)]];
    sampler fp_t_tcb_16Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_14 [[id(19)]];
    sampler fp_t_tcb_14Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_1A [[id(21)]];
    sampler fp_t_tcb_1ASmplr [[id(22)]];
    texture2d<float> fp_t_tcb_1E [[id(23)]];
    sampler fp_t_tcb_1ESmplr [[id(24)]];
    sampler fp_t_tcb_8Smplr_w [[id(25)]];
    sampler fp_t_tcb_18Smplr_w [[id(26)]];
    sampler fp_t_tcb_1CSmplr_w [[id(27)]];
    sampler fp_t_tcb_ASmplr_w [[id(28)]];
    sampler fp_t_tcb_10Smplr_w [[id(29)]];
    sampler fp_t_tcb_12Smplr_w [[id(30)]];
    sampler fp_t_tcb_CSmplr_w [[id(31)]];
    sampler fp_t_tcb_ESmplr_w [[id(32)]];
    sampler fp_t_tcb_16Smplr_w [[id(33)]];
    sampler fp_t_tcb_14Smplr_w [[id(34)]];
    sampler fp_t_tcb_1ASmplr_w [[id(35)]];
    sampler fp_t_tcb_1ESmplr_w [[id(36)]];
    constant dm_border_t* dm_border [[id(37)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _62(thread const int& _4366, thread const int& _4367, thread const int& _4368, thread const int& _4369, thread int& _4370, thread int& _4371, thread int& _4372, thread int& _4373, thread int& _4374)
{
    float _4377 = as_type<float>(_4368) + 0.0;
    bool _4379 = _4377 != 0.0;
    bool _4381 = isnan(_4377);
    bool _4383 = _4379 || _4381;
    bool _4385 = isnan(0.0);
    bool _4387 = _4383 || _4385;
    int _4389 = as_type<int>(_4377);
    int _4391 = _4367;
    int _4393 = _4387 ? (-1) : 0;
    if (!_4387)
    {
        float _4395 = as_type<float>(_4368) * 1.0;
        _4389 = as_type<int>(_4395);
    }
    int _4397 = _4389;
    bool _4399 = !_4387;
    int _4401 = _4397;
    if (!_4399)
    {
        float _4403 = as_type<float>(_4368) + 0.0;
        bool _4405 = _4403 >= 0.0;
        bool _4407 = isnan(_4403);
        bool _4409 = _4405 || _4407;
        bool _4411 = isnan(0.0);
        bool _4413 = _4409 || _4411;
        int _4415 = as_type<int>(_4403);
        _4393 = _4413 ? (-1) : 0;
        if (!_4413)
        {
            _4415 = 2147483647;
        }
        int _4417 = _4415;
        bool _4419 = !_4413;
        _4401 = _4417;
        if (!_4419)
        {
            float _4421 = abs(as_type<float>(_4368));
            float _4423 = _4421 + 0.0;
            bool _4425 = _4423 > as_type<float>(0x7f800000u /* inf */);
            bool _4427 = isnan(_4423);
            bool _4429 = _4425 || _4427;
            bool _4431 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4433 = _4429 || _4431;
            int _4435 = as_type<int>(_4423);
            _4393 = _4433 ? (-1) : 0;
            if (_4433)
            {
                float _4437 = as_type<float>(_4368) + 1.0;
                _4435 = as_type<int>(_4437);
            }
            int _4439 = _4435;
            _4401 = _4439;
            if (!_4433)
            {
                float _4441 = abs(as_type<float>(_4368));
                float _4443 = _4441 + (-0.0);
                float _4445 = 0.0 + _4443;
                bool _4447 = _4445 != as_type<float>(0x7f800000u /* inf */);
                bool _4449 = isnan(_4445);
                bool _4451 = _4447 || _4449;
                bool _4453 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4455 = _4451 || _4453;
                int _4457 = as_type<int>(_4445);
                _4393 = _4455 ? (-1) : 0;
                if (!_4455)
                {
                    _4457 = _4368;
                }
                int _4459 = _4457;
                bool _4461 = !_4455;
                _4401 = _4459;
                if (!_4461)
                {
                    float _4463 = as_type<float>(_4368) * 18446744073709551616.0;
                    float _4465 = rsqrt(_4463);
                    float _4467 = _4463 * _4465;
                    float _4469 = _4465 * 0.5;
                    float _4471 = -_4467;
                    float _4473 = 0.0 + _4471;
                    float _4475 = fma(_4469, _4473, 0.5);
                    float _4477 = fma(_4467, _4475, _4467);
                    float _4479 = -_4477;
                    float _4481 = 0.0 + _4479;
                    float _4483 = fma(_4477, _4481, _4463);
                    float _4485 = fma(_4469, _4483, _4477);
                    float _4487 = _4485 * 2.3283064365386962890625e-10;
                    _4401 = as_type<int>(_4487);
                    _4391 = as_type<int>(_4477);
                }
            }
        }
    }
    int _4489 = _4401;
    int _4491 = _4391;
    int _4493 = _4393;
    _4370 = _4489;
    _4371 = _4369;
    _4372 = 0;
    _4373 = _4491;
    _4374 = _4493;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _995 = false;
    bool _280 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_51.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_51.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_51.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _90 = _86 != 0;
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _96 = _94 != 0;
    int _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _100 = _98 != 0;
    float _102 = precise::max(0.0, _92);
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _106 = _104 != 0;
    int _108 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _110 = _108 != 0;
    int _112 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _114 = _112 != 0;
    int _116 = int(_90);
    float _118 = 1.0 / _66;
    float _120 = _118 * _72;
    float _122 = _118 * _78;
    float _124 = _118 * _84;
    float _126 = _120 * _120;
    float _128 = fma(_122, _122, _126);
    float _130 = fma(_124, _124, _128);
    float _132 = rsqrt(_130);
    float _134 = _122 * _132;
    float _136 = _124 * _132;
    float _138 = _120 * _132;
    float _140 = _134 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _144 = -_138;
    float _146 = -_102;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[13].z, _146);
    float _150 = _140 * _140;
    float _152 = _142 * _142;
    float _154 = _150 + _152;
    float _156 = sqrt(_154);
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _160 = _102;
    float _162 = _132;
    float _164 = _148;
    float _166 = _140;
    float _168 = _142;
    if (!_158)
    {
        _160 = _152;
    }
    float _170 = _160;
    float _172 = _170;
    if (!_158)
    {
        _162 = _150;
    }
    float _174 = _162;
    bool _176 = !_158;
    float _178 = _174;
    if (!_176)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _184 = _156 + _182;
        float _186 = _148 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _188 = rsqrt(_154);
        float _190 = _184 * _180;
        float _192 = _190 * 0.15915493667125701904296875;
        float _194 = _192 * 6.283185482025146484375;
        float _196 = sin(_194);
        float _198 = _192 * 6.283185482025146484375;
        float _200 = cos(_198);
        float _202 = fma(_196, _186, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _204 = _188 * _202;
        float _206 = _200 + (-1.0);
        float _208 = _140 * _204;
        float _210 = _142 * _204;
        float _212 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _214 = _210 * _210;
        float _216 = fma(_148, _200, _212);
        float _218 = _208 * _208;
        _164 = _216;
        _178 = _218;
        _172 = _214;
        _166 = _208;
        _168 = _210;
    }
    float _220 = _164;
    float _222 = _178;
    float _224 = _172;
    float _226 = _166;
    float _228 = _168;
    float _230 = fma(_220, _220, _222);
    float _232 = _230 + _224;
    float _234 = rsqrt(_232);
    float _236 = _234 * _220;
    float _238 = -_236;
    float _240 = precise::max(0.0, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = fma(_240, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _250 = as_type<int>(_246) + (-218103808);
    float _252 = fma(_240, _248, -0.212114393711090087890625);
    bool _254 = uint(_250) >= 1920991232u;
    float _256 = fma(_240, _252, 1.570728778839111328125);
    bool _258 = !_254;
    float _278;
    if (!_258)
    {
        int _260 = 0;
        int _262 = 0;
        int _264 = as_type<int>(_246);
        int _266 = 1200;
        int _268;
        int _270;
        int _272;
        int _274;
        int _276;
        _62(_260, _262, _264, _266, _268, _270, _272, _274, _276);
        _278 = as_type<float>(_268);
        _280 = true;
    }
    else
    {
        float _282 = rsqrt(_246);
        float _284 = _246 * _282;
        float _286 = _282 * 0.5;
        float _288 = -_284;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, 0.5);
        float _294 = fma(_284, _292, _284);
        float _296 = -_294;
        float _298 = 0.0 + _296;
        float _300 = fma(_294, _298, _246);
        float _302 = fma(_286, _300, _294);
        _278 = _302;
    }
    _280 = false;
    float _304 = _278;
    bool _306 = _236 > 0.0;
    float _308 = _136 * _136;
    float _310 = _134 * _134;
    float _312 = _308 + _310;
    if (_306)
    {
        discard_fragment();
    }
    float _314 = rsqrt(_312);
    float _316 = _256 * _304;
    float _318 = in.m_53.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_53.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _316 * 0.636619746685028076171875;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = -_332;
    float _336 = _334 + 1.0;
    float _338 = sqrt(_336);
    float _340 = _136 * _314;
    float _342 = _134 * _314;
    float _344 = abs(_340);
    float _346 = abs(_342);
    float _348 = precise::max(_344, _346);
    float _350 = precise::max(_348, 9.9999997473787516355514526367188e-05);
    float _352 = -_338;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _350;
    float _358 = _118 * _322;
    float _360 = _354 * 0.5;
    float _362 = _118 * _328;
    float _364 = -_356;
    float _366 = _340 * _364;
    float _368 = _342 * _356;
    float _370 = fma(_366, _360, 0.5);
    float _372 = fma(_368, _360, 0.5);
    float2 _2157;
    _2157.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_370, _372));
    _2157.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_370, _372));
    float _374 = _2157.x;
    float _376 = _374 * 256.0;
    int _378 = int(_376);
    float2 _2167 = float2(_358, _362);
    float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2167, float2(0.0), isnan(_2167))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2167, float2(0.0), isnan(_2167))).xyz;
    float _384 = _382.x;
    float _386 = _382.y;
    float _388 = _382.z;
    float2 _2183 = float2(_358, _362);
    float2 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2183, float2(0.0), isnan(_2183))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2183, float2(0.0), isnan(_2183))).xy;
    float _394 = _392.x;
    float _396 = _392.y;
    if (_306)
    {
        out.m_56.x = 0.0;
        out.m_56.y = 0.0;
        out.m_56.z = 0.0;
        out.m_56.w = 0.0;
        return out;
    }
    float _398 = float(uint(_378));
    float _400 = _398 * 0.00390625;
    float2 _2209 = float2(_370, _372);
    float4 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2209, float2(0.0), isnan(_2209)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2209, float2(0.0), isnan(_2209)), level(_400)).xyzw;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = _403.w;
    float _413 = -_138;
    float _415 = _413 + 1.0;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = -_138;
    float _421 = fma(_419, _138, 1.0);
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _234 * _226;
    int _427 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _429 = _427 != 0;
    float _431 = _234 * _228;
    float _433 = fma(_236, -0.5, 0.5);
    float _435 = _417;
    if (_429)
    {
        float _437 = sqrt(_423);
        _435 = _437;
    }
    float _439 = _435;
    float _441 = abs(_439);
    float _443 = log2(_441);
    float _445 = _443 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _447 = exp2(_445);
    float _449 = _447 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _451 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = _425 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _457 = -_453;
    float _459 = _457 + 1.0;
    float _461 = -_455;
    float _463 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[11].y, _461);
    float _465 = abs(_459);
    float _467 = log2(_465);
    float _469 = -_431;
    float _471 = fma(_469, (*spvDescriptorSet0.fp_c3)._m0[11].z, _463);
    float _473 = fma(_471, -0.5, 0.5);
    float _475 = fma(_471, 0.5, 0.5);
    float _477 = fma(_475, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _479 = sqrt(_473);
    float _481 = fma(_475, _477, -0.212114393711090087890625);
    float _483 = _467 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _485 = fma(_475, _481, 1.570728778839111328125);
    float _487 = _236 + 1.0;
    float _489 = exp2(_483);
    float _491 = _479 * 0.636619746685028076171875;
    float _493 = -_485;
    float _495 = fma(_491, _493, 1.0);
    float _497 = -_236;
    float _499 = fma(_489, _487, _497);
    float _501 = fma(_499, 0.5, 0.5);
    float2 _2350 = float2(_370, _372);
    float2 _503 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2350, float2(0.0), isnan(_2350)), level(_400)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2350, float2(0.0), isnan(_2350)), level(_400)).xy;
    float _505 = _503.x;
    float _507 = _503.y;
    float2 _2363 = float2(_370, _372);
    float4 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2363, float2(0.0), isnan(_2363)), level(_400)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2363, float2(0.0), isnan(_2363)), level(_400)).xyzw;
    float _511 = _509.x;
    float _513 = _509.y;
    float _515 = _509.z;
    float _517 = _509.w;
    float2 _2380 = float2(_370, _372);
    float2 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2380, float2(0.0), isnan(_2380)), level(_400)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2380, float2(0.0), isnan(_2380)), level(_400)).xy;
    float _521 = _519.x;
    float _523 = _519.y;
    float2 _2393 = float2(_370, _372);
    float4 _525 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2393, float2(0.0), isnan(_2393)), level(_400)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2393, float2(0.0), isnan(_2393)), level(_400)).xyzw;
    float _527 = _525.x;
    float _529 = _525.y;
    float _531 = _525.z;
    float _533 = _525.w;
    float2 _2410 = float2(_370, _372);
    float2 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2410, float2(0.0), isnan(_2410)), level(_400)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2410, float2(0.0), isnan(_2410)), level(_400)).xy;
    float _537 = _535.x;
    float _539 = _535.y;
    float2 _2423 = float2(_370, _372);
    float2 _541 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2423, float2(0.0), isnan(_2423)), level(_400)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2423, float2(0.0), isnan(_2423)), level(_400)).xy;
    float _543 = _541.x;
    float _545 = _541.y;
    float2 _2436 = float2(_370, _372);
    float4 _547 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2436, float2(0.0), isnan(_2436)), level(_400)), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2436, float2(0.0), isnan(_2436)), level(_400)).xyzw;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = _547.w;
    float _557 = _411 * _411;
    float _559 = _557 * _557;
    float2 _2459 = float2(_495, _433);
    float3 _561 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2459, float2(0.0), isnan(_2459))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2459, float2(0.0), isnan(_2459))).xyz;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float2 _2473 = float2(_495, _501);
    float3 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2473, float2(0.0), isnan(_2473))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2473, float2(0.0), isnan(_2473))).xyz;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _559 * 16.0;
    float _579 = _384 * _386;
    int _581 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _583 = _581 != 0;
    float _585 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _587 = _585 + 1.0;
    int _589 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _591 = _589 != 0;
    float _593 = _577 * _507;
    float _595 = _517 * _517;
    float _597 = _533 * _533;
    float _599 = _405 * _593;
    float _601 = _407 * _593;
    float _603 = _595 * _595;
    float _605 = _409 * _593;
    float _607 = -_507;
    float _609 = _607 + _523;
    float _611 = _505 * _507;
    float _613 = _603 * 16.0;
    float _615 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[0].x, _507);
    float _617 = -_611;
    float _619 = fma(_521, _523, _617);
    float _621 = _613 * _523;
    float _623 = -_579;
    float _625 = _623 + 1.0;
    float _627 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _629 = _627 + 1.0;
    float _631 = fma(_619, (*spvDescriptorSet0.fp_c3)._m0[0].x, _611);
    float _633 = _597 * _597;
    float _635 = -_599;
    float _637 = fma(_511, _621, _635);
    float _639 = fma(_625, _629, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _641 = fma(_625, _587, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _643 = precise::max(_615, 1.52587890625e-05);
    float _645 = -_601;
    float _647 = fma(_513, _621, _645);
    float _649 = -_605;
    float _651 = fma(_515, _621, _649);
    float _653 = _633 * 16.0;
    float _655 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[0].x, _599);
    float _657 = fma(_647, (*spvDescriptorSet0.fp_c3)._m0[0].x, _601);
    float _659 = 1.0 / _643;
    float _661 = fma(_651, (*spvDescriptorSet0.fp_c3)._m0[0].x, _605);
    float _663 = _653 * _539;
    float _665 = _555 * _555;
    float _667 = _527 * _663;
    float _669 = _531 * _663;
    float _671 = _665 * _665;
    float _673 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _675 = _615 * _659;
    float _677 = _631 * _675;
    float _679 = -_539;
    float _681 = _679 + _545;
    float _683 = _655 * _675;
    float _685 = _657 * _675;
    float _687 = _661 * _675;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].x, _539);
    float _691 = _537 * _539;
    float _693 = _529 * _663;
    float _695 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _697 = precise::max(_689, 1.52587890625e-05);
    float _699 = -_691;
    float _701 = fma(_543, _545, _699);
    float _703 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _705 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _691);
    float _707 = 1.0 / _697;
    float _709 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _711 = fma(_138, _703, _709);
    float _713 = -_136;
    float _715 = fma(_713, _673, _711);
    float _717 = fma(_136, _673, _711);
    float _719 = _671 * 16.0;
    float _721 = -_134;
    float _723 = fma(_721, _695, _715);
    float _725 = fma(_134, _695, _717);
    float _727 = _719 * _545;
    float _729 = _705 * _707;
    float _731 = _639 * _707;
    float _733 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _735 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _737 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _739 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _741 = -_667;
    float _743 = fma(_549, _727, _741);
    float _745 = fma(_138, _733, _735);
    float _747 = -_693;
    float _749 = fma(_551, _727, _747);
    float _751 = _729 * _641;
    float _753 = -_669;
    float _755 = fma(_553, _727, _753);
    float _757 = -_136;
    float _759 = fma(_757, _737, _745);
    float _761 = fma(_136, _737, _745);
    float _763 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _765 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float _767 = _689 * _731;
    float _769 = -_677;
    float _771 = fma(_689, _751, _769);
    float _773 = -_134;
    float _775 = fma(_773, _763, _759);
    float _777 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _779 = fma(_134, _763, _761);
    float _781 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _783 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _785 = fma(_138, _777, _739);
    float _787 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[0].x, _669);
    float _789 = -_683;
    float _791 = fma(_765, _767, _789);
    float _793 = _136 * (-3.0);
    float _795 = -_136;
    float _797 = fma(_795, _781, _785);
    float _799 = fma(_136, _781, _785);
    float _801 = -_615;
    float _803 = _801 + _689;
    float _805 = _787 * _731;
    float _807 = -_134;
    float _809 = fma(_807, _783, _797);
    float _811 = fma(_134, _783, _799);
    float _813 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[0].x, _693);
    float _815 = fma(_384, _771, _677);
    float _817 = -_138;
    float _819 = _134 * _817;
    float _821 = _134 * _136;
    float _823 = -_685;
    float _825 = fma(_813, _767, _823);
    float _827 = _134 * _134;
    float _829 = _134 * _138;
    float _831 = -_136;
    float _833 = _138 * _831;
    float _835 = fma(_384, _803, _615);
    float _837 = -_138;
    float _839 = fma(_837, _138, _827);
    float _841 = _138 * _136;
    float _843 = -_136;
    float _845 = fma(_843, _793, -1.0);
    float _847 = -_687;
    float _849 = fma(_689, _805, _847);
    float _851 = fma(_384, _791, _683);
    float _853 = fma(_384, _825, _685);
    float _855 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _857 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _859 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _861 = fma(_384, _849, _687);
    float _863 = fma(_855, _819, _723);
    float _865 = fma(_855, _829, _725);
    float _867 = fma(_857, _833, _863);
    float _869 = fma(_857, _841, _865);
    float _871 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _873 = fma(_871, _819, _775);
    float _875 = fma(_871, _829, _779);
    float _877 = fma(_859, _819, _809);
    float _879 = fma(_859, _829, _811);
    float _881 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _883 = fma(_881, _833, _873);
    float _885 = fma(_881, _841, _875);
    float _887 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _889 = fma(_887, _833, _877);
    float _891 = fma(_887, _841, _879);
    float _893 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _895 = -_388;
    float _897 = _895 + 1.0;
    float _899 = fma(_893, _821, _867);
    float _901 = fma(_893, _821, _869);
    float _903 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _905 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _907 = _835 * _897;
    float _909 = fma(_903, _821, _889);
    float _911 = fma(_905, _821, _883);
    float _913 = fma(_905, _821, _885);
    float _915 = fma(_903, _821, _891);
    float _917 = _907 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _919 = fma(_308, 3.0, -1.0);
    float _921 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _923 = fma(_921, _845, _899);
    float _925 = fma(_921, _919, _901);
    float _927 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _929 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _931 = fma(_927, _919, _913);
    float _933 = fma(_929, _845, _909);
    float _935 = fma(_929, _919, _915);
    float _937 = fma(_927, _845, _911);
    float _939 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _941 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _943 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _945 = fma(_939, _839, _923);
    float _947 = fma(_939, _839, _925);
    float _949 = fma(_941, _839, _937);
    float _951 = fma(_941, _839, _931);
    float _953 = fma(_943, _839, _933);
    float _955 = fma(_943, _839, _935);
    float _957 = precise::max(_835, 1.52587890625e-05);
    float _959 = 1.0 / _957;
    float _961 = _815 * _959;
    bool _963 = !_583;
    float _965 = _963 ? _961 : 0.0;
    bool _967 = !_591;
    int _969 = _591 ? (-1) : 0;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    int _993;
    if (!_967)
    {
        float _971 = _775 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _973 = _725 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _975 = _723 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _977 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _979 = _779 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _981 = _811 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _983 = as_type<int>(_973);
        _985 = as_type<int>(_979);
        _987 = as_type<int>(_981);
        _989 = as_type<int>(_971);
        _991 = as_type<int>(_977);
        _993 = as_type<int>(_975);
        _995 = true;
    }
    else
    {
        int _997 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _999 = _997 != 0;
        float _1001 = _945 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1003 = _949 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1005 = _953 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1007 = _947 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1009 = _951 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1011 = _955 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1013 = as_type<int>(_1001);
        int _1015 = as_type<int>(_1003);
        int _1017 = as_type<int>(_1005);
        int _1019 = as_type<int>(_1007);
        int _1021 = as_type<int>(_1009);
        _969 = _999 ? (-1) : 0;
        _987 = as_type<int>(_1011);
        if (_999)
        {
            float _1023 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1013 = as_type<int>(_1023);
        }
        int _1025 = _1013;
        _993 = _1025;
        if (_999)
        {
            float _1027 = _735 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1015 = as_type<int>(_1027);
        }
        int _1029 = _1015;
        _989 = _1029;
        if (_999)
        {
            float _1031 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1017 = as_type<int>(_1031);
        }
        int _1033 = _1017;
        _991 = _1033;
        if (_999)
        {
            _1019 = _1025;
        }
        int _1035 = _1019;
        _983 = _1035;
        if (_999)
        {
            _1021 = _1029;
        }
        int _1037 = _1021;
        _985 = _1037;
        if (_999)
        {
            _987 = _1033;
        }
    }
    _995 = false;
    int _1039 = _969;
    int _1041 = _983;
    int _1043 = _985;
    int _1045 = _987;
    int _1047 = _989;
    int _1049 = _991;
    int _1051 = _993;
    int _1053 = 0;
    int _1055 = _1039;
    if (!_110)
    {
        int _1057 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _1059 = _1057 != 0;
        _1053 = _1059 ? (-1) : 0;
    }
    int _1061 = _1053;
    if (_110)
    {
        _1055 = -1;
    }
    int _1063 = _1055;
    float _1065 = fma(_394, 2.0, -1.0);
    float _1067 = fma(_396, 2.0, -1.0);
    int _1069 = _1063;
    if (!_110)
    {
        int _1071 = ~_1061;
        bool _1073 = !_114;
        int _1075 = _1071 & (_1073 ? (-1) : 0);
        _1069 = _1075;
    }
    int _1077 = _1069;
    float _1079 = fma(_1065, (*spvDescriptorSet0.fp_c3)._m0[22].x, _358);
    float _1081 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[22].y, _362);
    bool _1083 = _116 != 0;
    float2 _3332 = float2(_1079, _1081);
    float4 _1085 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_3332, float2(0.0), isnan(_3332))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_3332, float2(0.0), isnan(_3332))).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float _1095 = _467 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _1097 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _1099 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _1101 = exp2(_1095);
    int _1103 = _1077;
    if (_106)
    {
        _1103 = -1;
    }
    int _1105 = _1103;
    int _1107 = ~_1077;
    float _1109 = (_1107 != 0) ? as_type<float>(_1041) : 0.0;
    int _1111 = _1105;
    if (!_106)
    {
        bool _1113 = !_114;
        bool _1115 = _1113 && _100;
        bool _1117 = !_1083;
        bool _1119 = _1115 && _1117;
        _1111 = _1119 ? (-1) : 0;
    }
    int _1121 = _1111;
    int _1123 = ~_1077;
    float _1125 = (_1123 != 0) ? as_type<float>(_1043) : 0.0;
    float _1127 = _579 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _1129 = ~_1077;
    float _1131 = (_1129 != 0) ? as_type<float>(_1045) : 0.0;
    float _1133 = _851 * _959;
    float _1135 = _853 * _959;
    float _1137 = _861 * _959;
    float _1139 = -_1101;
    float _1141 = _1139 + 1.0;
    float _1143 = _1141 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1145 = !_114;
    bool _1147 = _100 && _1145;
    int _1149 = ~_1121;
    float _1151 = (_1149 != 0) ? as_type<float>(_1047) : 0.0;
    float _1153 = -_1143;
    float _1155 = _1153 + 1.0;
    float _1157 = abs(_1155);
    float _1159 = log2(_1157);
    int _1161 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1163 = _1161 != 0;
    bool _1165 = !_1147;
    float _1167 = _1165 ? _1097 : 0.0;
    bool _1169 = !_1147;
    float _1171 = _1169 ? _1099 : 0.0;
    int _1173 = ~_1121;
    float _1175 = (_1173 != 0) ? as_type<float>(_1049) : 0.0;
    float _1177 = _1167 * _1125;
    bool _1179 = !_1163;
    float _1181 = _1167 * _1131;
    bool _1183 = !_1163;
    float _1185 = fma(_1151, _1171, _1177);
    int _1187 = ~_1121;
    float _1189 = (_1187 != 0) ? as_type<float>(_1051) : 0.0;
    float _1191 = _1167 * _1109;
    bool _1193 = !_1179;
    float _1195 = _1193 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1197 = fma(_1175, _1171, _1181);
    float _1199 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _1201 = !_1183;
    float _1203 = _1201 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1205 = fma(_1189, _1171, _1191);
    bool _1207 = !_1163;
    float _1209 = _1195 * _1185;
    float _1211 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1213 = _1203 * _1205;
    bool _1215 = !_1207;
    float _1217 = _1215 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1219 = exp2(_1199);
    float _1221 = _1209 * 0.715200006961822509765625;
    int _1223 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1225 = _1223 != 0;
    float _1227 = _1217 * _1197;
    float _1229 = fma(_1213, 0.2125999927520751953125, _1221);
    float _1231 = exp2(_1211);
    float _1233 = fma(_1227, 0.072200000286102294921875, _1229);
    bool _1235 = !_1225;
    bool _1237 = !_1225;
    float _1239 = -_1213;
    float _1241 = _1239 + _1233;
    float _1243 = -_1209;
    float _1245 = _1243 + _1233;
    float _1247 = _1235 ? _1133 : 0.0;
    float _1249 = -_1227;
    float _1251 = _1249 + _1233;
    bool _1253 = !_96;
    float _1255 = _1253 ? _1219 : 1.0;
    float _1257 = fma(_1127, _1241, _1213);
    float _1259 = fma(_1127, _1245, _1209);
    float _1261 = fma(_1127, _1251, _1227);
    float _1263 = _1237 ? _1135 : 0.0;
    float _1265 = _965 * _1255;
    float _1267 = _1255 * _1257;
    bool _1269 = !_96;
    float _1271 = _1269 ? _1231 : 1.0;
    float _1273 = _1255 * _1259;
    float _1275 = _100 ? _1265 : _1267;
    float _1277 = _1271 * _1247;
    float _1279 = _1271 * _1263;
    float _1281 = _100 ? _1265 : _1273;
    float _1283 = _1275 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1285 = !_1225;
    float _1287 = _1265;
    float _1289 = _1271;
    float _1291 = _1261;
    float _1293 = _1255;
    float _1295 = _1277;
    float _1297 = _1143;
    if (!_100)
    {
        float _1299 = _1255 * _1261;
        _1287 = _1299;
    }
    float _1301 = _1287;
    float _1303 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1283);
    float _1305 = _1281 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1307 = _1285 ? _1137 : 0.0;
    float _1309 = _1301 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1311 = fma(_1279, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1305);
    int _1313 = as_type<int>(_1305);
    if (_96)
    {
        _1313 = as_type<int>(_917);
    }
    int _1315 = _1313;
    float _1317 = _1271 * _1307;
    float _1319 = fma(_1317, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1309);
    int _1321 = _1315;
    int _1323 = _1315;
    float _1325 = _1319;
    if (_96)
    {
        _1289 = 0.0;
    }
    float _1327 = _1289;
    bool _1329 = !_96;
    float _1331 = _1329 ? _1143 : 0.0;
    float _1333 = _1327;
    if (_96)
    {
        _1291 = 0.0;
    }
    float _1335 = _1291;
    float _1337 = _1335;
    if (_96)
    {
        _1293 = 0.0;
    }
    float _1339 = _1293;
    float _1341 = _1339;
    if (_96)
    {
        _1295 = _1303;
    }
    float _1343 = _1295;
    float _1345 = _1343;
    float _1347 = _1343;
    if (_96)
    {
        _1297 = _1311;
    }
    float _1349 = _1297;
    float _1351 = _1349;
    float _1353 = _1349;
    if (!_96)
    {
        int _1355 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1357 = _1355 != 0;
        float _1359 = _573 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1361 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1363 = _1361 != 0;
        float _1365 = _571 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1367 = _575 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1369 = !_1363;
        float _1371 = _1369 ? _1365 : 0.0;
        bool _1373 = !_1363;
        float _1375 = _1373 ? _1359 : 0.0;
        bool _1377 = !_1363;
        float _1379 = _1377 ? _1367 : 0.0;
        float _1381 = _1331 * _1371;
        _1333 = _1381;
        if (!_1357)
        {
            _1321 = as_type<int>(_917);
        }
        int _1383 = _1321;
        float _1385 = _1331 * _1375;
        _1337 = _1385;
        _1323 = _1383;
        if (!_1357)
        {
            _1345 = _1303;
        }
        float _1387 = _1345;
        float _1389 = _1331 * _1379;
        _1347 = _1387;
        _1341 = _1389;
        if (!_1357)
        {
            _1351 = _1311;
        }
        float _1391 = _1351;
        bool _1393 = !_1357;
        _1353 = _1391;
        if (!_1393)
        {
            float _1395 = -_1331;
            float _1397 = _1395 + 1.0;
            float _1399 = precise::clamp(_1397, 0.0, 1.0);
            float _1401 = _917 * _1399;
            float _1403 = precise::max(_1401, 9.9999997473787516355514526367188e-05);
            float _1405 = 1.0 / _1403;
            float _1407 = _917 * _1405;
            float _1409 = _1303 * _1407;
            float _1411 = _1311 * _1407;
            float _1413 = _1319 * _1407;
            _1353 = _1411;
            _1337 = 0.0;
            _1347 = _1409;
            _1333 = 0.0;
            _1323 = as_type<int>(_1401);
            _1325 = _1413;
            _1341 = 0.0;
        }
    }
    float _1415 = _1353;
    float _1417 = _1337;
    float _1419 = _1347;
    float _1421 = _1333;
    int _1423 = _1323;
    float _1425 = _1325;
    float _1427 = _1341;
    int _1429 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1431 = _1429 != 0;
    int _1433 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1435 = _1433 != 0;
    float _1437 = _565 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1439 = _1415 + _1417;
    float _1441 = _563 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1443 = _1419 + _1421;
    bool _1445 = !_1435;
    float _1447 = _1445 ? as_type<float>(_1423) : 1.0;
    float _1449 = _567 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1451 = _1425 + _1427;
    float _1453 = -_1447;
    float _1455 = _1453 + 1.0;
    float _1457 = abs(_1455);
    float _1459 = log2(_1457);
    float _1461 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1463 = exp2(_1461);
    float _1465 = -_1463;
    float _1467 = spvFAdd(_1465, 1.00010001659393310546875);
    float _1469 = -_1463;
    float _1471 = _1469 + 1.0;
    float _1473 = -_1447;
    float _1475 = _1473 + _1471;
    float _1477 = 1.0 / _1467;
    float _1479 = _1437 * _1475;
    float _1481 = _1441 * _1475;
    float _1483 = _1449 * _1475;
    float _1485 = fma(_1439, _1447, _1479);
    float _1487 = fma(_1443, _1447, _1481);
    float _1489 = _1477 * _1485;
    float _1491 = fma(_1451, _1447, _1483);
    float _1493 = _1477 * _1487;
    float _1495 = _1489 * 0.715200006961822509765625;
    float _1497 = _1477 * _1491;
    float _1499 = fma(_1493, 0.2125999927520751953125, _1495);
    float _1501 = fma(_1497, 0.072200000286102294921875, _1499);
    float _1503 = 1.0 / _1501;
    float _1505 = _1503 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1507 = precise::clamp(_1505, 0.0, 1.0);
    float _1509 = fma(_1507, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1511 = _1509 * _1093;
    float _1513 = fma(_1493, _1511, _1087);
    float _1515 = fma(_1489, _1511, _1089);
    float _1517 = fma(_1497, _1511, _1091);
    bool _1519 = !_1431;
    float _1521 = _1463;
    float _1523 = _1515;
    float _1525 = _1497;
    int _1527 = as_type<int>(_1463);
    int _1529 = as_type<int>(_1497);
    float _1531 = _1515;
    if (!_1519)
    {
        bool _1533 = _1471 != 1.0;
        bool _1535 = isnan(_1471);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan(1.0);
        bool _1541 = _1537 || _1539;
        float _1543 = -_1463;
        bool _1545 = _1543 != (-1.0);
        bool _1547 = isnan(_1543);
        bool _1549 = _1545 || _1547;
        bool _1551 = isnan(-1.0);
        bool _1553 = _1549 || _1551;
        float _1555 = -_1463;
        bool _1557 = _1555 == (-1.0);
        bool _1559 = !_1541;
        bool _1561 = _1557 || _1559;
        bool _1563 = _1471 == 1.0;
        bool _1565 = _1563 && _1553;
        bool _1567 = !_1561;
        float _1569 = _1567 ? _1471 : 0.0;
        bool _1571 = !_1565;
        float _1573 = _1571 ? 0.0 : 1.0;
        float _1575 = _1561 ? 0.0 : 0.5;
        float _1577 = _1569 * 0.715200006961822509765625;
        float _1579 = fma(_1573, 0.2125999927520751953125, _1577);
        float _1581 = fma(_1575, 0.072200000286102294921875, _1579);
        float _1583 = 1.0 / _1581;
        float _1585 = _1583 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1587 = precise::clamp(_1585, 0.0, 1.0);
        float _1589 = fma(_1587, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1591 = _1573 * _1589;
        float _1593 = _1569 * _1589;
        float _1595 = _1575 * _1589;
        out.m_56.x = _1591;
        out.m_56.y = _1593;
        out.m_56.z = _1595;
        out.m_56.w = 1.0;
        return out;
    }
    bool _1597 = _116 != 0;
    bool _1599 = !_1597;
    if (!_1599)
    {
        if (_106)
        {
            _1521 = 0.0;
        }
        float _1601 = _1521;
        float _1603 = _1601;
        if (_106)
        {
            _1523 = 0.0;
        }
        float _1605 = _1523;
        float _1607 = _1605;
        if (!_106)
        {
            float _1609 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1607 = _1609;
        }
        float _1611 = _1607;
        float _1613 = _1611;
        if (!_106)
        {
            float _1615 = _1189 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1603 = _1615;
        }
        float _1617 = _1603;
        float _1619 = _1617;
        if (!_110)
        {
            float _1621 = fma(_1125, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1611);
            _1613 = _1621;
        }
        float _1623 = _1613;
        if (_106)
        {
            _1525 = 0.0;
        }
        float _1625 = _1525;
        float _1627 = _1625;
        if (!_106)
        {
            float _1629 = _1175 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1627 = _1629;
        }
        float _1631 = _1627;
        float _1633 = _1623 * 0.715200006961822509765625;
        float _1635 = _1631;
        if (!_110)
        {
            float _1637 = fma(_1109, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1617);
            _1619 = _1637;
        }
        float _1639 = _1619;
        if (!_110)
        {
            float _1641 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1631);
            _1635 = _1641;
        }
        float _1643 = _1635;
        float _1645 = fma(_1639, 0.2125999927520751953125, _1633);
        float _1647 = fma(_1643, 0.072200000286102294921875, _1645);
        float _1649 = 1.0 / _1647;
        float _1651 = _1649 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1653 = precise::clamp(_1651, 0.0, 1.0);
        float _1655 = fma(_1653, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1657 = _1655 * _1639;
        float _1659 = _1655 * _1623;
        float _1661 = _1655 * _1643;
        out.m_56.x = _1657;
        out.m_56.y = _1659;
        out.m_56.z = _1661;
        out.m_56.w = 1.0;
        return out;
    }
    if (!_114)
    {
        _1527 = as_type<int>(_1513);
    }
    int _1663 = _1527;
    float _1665 = as_type<float>(_1663);
    if (!_114)
    {
        _1529 = as_type<int>(_1471);
    }
    int _1667 = _1529;
    float _1669 = as_type<float>(_1667);
    if (!_114)
    {
        out.m_56.x = as_type<float>(_1663);
        out.m_56.y = _1515;
        out.m_56.z = _1517;
        out.m_56.w = as_type<float>(_1667);
        return out;
    }
    if (_106)
    {
        _1665 = 0.0;
    }
    float _1671 = _1665;
    float _1673 = _1671;
    if (_106)
    {
        _1531 = 0.0;
    }
    float _1675 = _1531;
    float _1677 = _1675;
    if (!_106)
    {
        float _1679 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1677 = _1679;
    }
    float _1681 = _1677;
    float _1683 = _1681;
    if (!_106)
    {
        float _1685 = _1189 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1673 = _1685;
    }
    float _1687 = _1673;
    float _1689 = _1687;
    if (!_110)
    {
        float _1691 = fma(_1125, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1681);
        _1683 = _1691;
    }
    float _1693 = _1683;
    if (_106)
    {
        _1669 = 0.0;
    }
    float _1695 = _1669;
    float _1697 = _1695;
    if (!_106)
    {
        float _1699 = _1175 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1697 = _1699;
    }
    float _1701 = _1697;
    float _1703 = _1693 * 0.715200006961822509765625;
    float _1705 = _1701;
    if (!_110)
    {
        float _1707 = fma(_1109, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1687);
        _1689 = _1707;
    }
    float _1709 = _1689;
    if (!_110)
    {
        float _1711 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1701);
        _1705 = _1711;
    }
    float _1713 = _1705;
    float _1715 = fma(_1709, 0.2125999927520751953125, _1703);
    float _1717 = fma(_1713, 0.072200000286102294921875, _1715);
    float _1719 = 1.0 / _1717;
    float _1721 = _1719 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1723 = precise::clamp(_1721, 0.0, 1.0);
    float _1725 = fma(_1723, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1727 = _1725 * _1709;
    float _1729 = _1725 * _1693;
    float _1731 = _1725 * _1713;
    out.m_56.x = _1727;
    out.m_56.y = _1729;
    out.m_56.z = _1731;
    out.m_56.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_56 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _995 = false;
    bool _280 = false;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_51.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_51.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_51.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _90 = _86 != 0;
    float _92 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _96 = _94 != 0;
    int _98 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _100 = _98 != 0;
    float _102 = precise::max(0.0, _92);
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _106 = _104 != 0;
    int _108 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _110 = _108 != 0;
    int _112 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _114 = _112 != 0;
    int _116 = int(_90);
    float _118 = 1.0 / _66;
    float _120 = _118 * _72;
    float _122 = _118 * _78;
    float _124 = _118 * _84;
    float _126 = _120 * _120;
    float _128 = fma(_122, _122, _126);
    float _130 = fma(_124, _124, _128);
    float _132 = rsqrt(_130);
    float _134 = _122 * _132;
    float _136 = _124 * _132;
    float _138 = _120 * _132;
    float _140 = _134 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _144 = -_138;
    float _146 = -_102;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[13].z, _146);
    float _150 = _140 * _140;
    float _152 = _142 * _142;
    float _154 = _150 + _152;
    float _156 = sqrt(_154);
    bool _158 = _156 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _160 = _102;
    float _162 = _132;
    float _164 = _148;
    float _166 = _140;
    float _168 = _142;
    if (!_158)
    {
        _160 = _152;
    }
    float _170 = _160;
    float _172 = _170;
    if (!_158)
    {
        _162 = _150;
    }
    float _174 = _162;
    bool _176 = !_158;
    float _178 = _174;
    if (!_176)
    {
        float _180 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _182 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _184 = _156 + _182;
        float _186 = _148 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _188 = rsqrt(_154);
        float _190 = _184 * _180;
        float _192 = _190 * 0.15915493667125701904296875;
        float _194 = _192 * 6.283185482025146484375;
        float _196 = sin(_194);
        float _198 = _192 * 6.283185482025146484375;
        float _200 = cos(_198);
        float _202 = fma(_196, _186, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _204 = _188 * _202;
        float _206 = _200 + (-1.0);
        float _208 = _140 * _204;
        float _210 = _142 * _204;
        float _212 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _214 = _210 * _210;
        float _216 = fma(_148, _200, _212);
        float _218 = _208 * _208;
        _164 = _216;
        _178 = _218;
        _172 = _214;
        _166 = _208;
        _168 = _210;
    }
    float _220 = _164;
    float _222 = _178;
    float _224 = _172;
    float _226 = _166;
    float _228 = _168;
    float _230 = fma(_220, _220, _222);
    float _232 = _230 + _224;
    float _234 = rsqrt(_232);
    float _236 = _234 * _220;
    float _238 = -_236;
    float _240 = precise::max(0.0, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = fma(_240, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _250 = as_type<int>(_246) + (-218103808);
    float _252 = fma(_240, _248, -0.212114393711090087890625);
    bool _254 = uint(_250) >= 1920991232u;
    float _256 = fma(_240, _252, 1.570728778839111328125);
    bool _258 = !_254;
    float _278;
    if (!_258)
    {
        int _260 = 0;
        int _262 = 0;
        int _264 = as_type<int>(_246);
        int _266 = 1200;
        int _268;
        int _270;
        int _272;
        int _274;
        int _276;
        _62(_260, _262, _264, _266, _268, _270, _272, _274, _276);
        _278 = as_type<float>(_268);
        _280 = true;
    }
    else
    {
        float _282 = rsqrt(_246);
        float _284 = _246 * _282;
        float _286 = _282 * 0.5;
        float _288 = -_284;
        float _290 = 0.0 + _288;
        float _292 = fma(_286, _290, 0.5);
        float _294 = fma(_284, _292, _284);
        float _296 = -_294;
        float _298 = 0.0 + _296;
        float _300 = fma(_294, _298, _246);
        float _302 = fma(_286, _300, _294);
        _278 = _302;
    }
    _280 = false;
    float _304 = _278;
    bool _306 = _236 > 0.0;
    float _308 = _136 * _136;
    float _310 = _134 * _134;
    float _312 = _308 + _310;
    if (_306)
    {
        discard_fragment();
    }
    float _314 = rsqrt(_312);
    float _316 = _256 * _304;
    float _318 = in.m_53.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_53.y;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = _316 * 0.636619746685028076171875;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = -_332;
    float _336 = _334 + 1.0;
    float _338 = sqrt(_336);
    float _340 = _136 * _314;
    float _342 = _134 * _314;
    float _344 = abs(_340);
    float _346 = abs(_342);
    float _348 = precise::max(_344, _346);
    float _350 = precise::max(_348, 9.9999997473787516355514526367188e-05);
    float _352 = -_338;
    float _354 = _352 + 1.0;
    float _356 = 1.0 / _350;
    float _358 = _118 * _322;
    float _360 = _354 * 0.5;
    float _362 = _118 * _328;
    float _364 = -_356;
    float _366 = _340 * _364;
    float _368 = _342 * _356;
    float _370 = fma(_366, _360, 0.5);
    float _372 = fma(_368, _360, 0.5);
    float2 _2157;
    _2157.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_370, _372));
    _2157.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_370, _372));
    float _374 = _2157.x;
    float _376 = _374 * 256.0;
    int _378 = int(_376);
    float2 _2167 = float2(_358, _362);
    float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2167, float2(0.0), isnan(_2167))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2167, float2(0.0), isnan(_2167))).xyz;
    float _384 = _382.x;
    float _386 = _382.y;
    float _388 = _382.z;
    float2 _2183 = float2(_358, _362);
    float2 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2183, float2(0.0), isnan(_2183))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2183, float2(0.0), isnan(_2183))).xy;
    float _394 = _392.x;
    float _396 = _392.y;
    if (_306)
    {
        out.m_56.x = 0.0;
        out.m_56.y = 0.0;
        out.m_56.z = 0.0;
        out.m_56.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_56)};
    }
    float _398 = float(uint(_378));
    float _400 = _398 * 0.00390625;
    float2 _2209 = float2(_370, _372);
    float4 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2209, float2(0.0), isnan(_2209)), level(_400)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2209, float2(0.0), isnan(_2209)), level(_400)).xyzw;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = _403.w;
    float _413 = -_138;
    float _415 = _413 + 1.0;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    float _419 = -_138;
    float _421 = fma(_419, _138, 1.0);
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = _234 * _226;
    int _427 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _429 = _427 != 0;
    float _431 = _234 * _228;
    float _433 = fma(_236, -0.5, 0.5);
    float _435 = _417;
    if (_429)
    {
        float _437 = sqrt(_423);
        _435 = _437;
    }
    float _439 = _435;
    float _441 = abs(_439);
    float _443 = log2(_441);
    float _445 = _443 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _447 = exp2(_445);
    float _449 = _447 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _451 = fma(_449, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = _425 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _457 = -_453;
    float _459 = _457 + 1.0;
    float _461 = -_455;
    float _463 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[11].y, _461);
    float _465 = abs(_459);
    float _467 = log2(_465);
    float _469 = -_431;
    float _471 = fma(_469, (*spvDescriptorSet0.fp_c3)._m0[11].z, _463);
    float _473 = fma(_471, -0.5, 0.5);
    float _475 = fma(_471, 0.5, 0.5);
    float _477 = fma(_475, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _479 = sqrt(_473);
    float _481 = fma(_475, _477, -0.212114393711090087890625);
    float _483 = _467 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _485 = fma(_475, _481, 1.570728778839111328125);
    float _487 = _236 + 1.0;
    float _489 = exp2(_483);
    float _491 = _479 * 0.636619746685028076171875;
    float _493 = -_485;
    float _495 = fma(_491, _493, 1.0);
    float _497 = -_236;
    float _499 = fma(_489, _487, _497);
    float _501 = fma(_499, 0.5, 0.5);
    float2 _2350 = float2(_370, _372);
    float2 _503 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2350, float2(0.0), isnan(_2350)), level(_400)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2350, float2(0.0), isnan(_2350)), level(_400)).xy;
    float _505 = _503.x;
    float _507 = _503.y;
    float2 _2363 = float2(_370, _372);
    float4 _509 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2363, float2(0.0), isnan(_2363)), level(_400)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2363, float2(0.0), isnan(_2363)), level(_400)).xyzw;
    float _511 = _509.x;
    float _513 = _509.y;
    float _515 = _509.z;
    float _517 = _509.w;
    float2 _2380 = float2(_370, _372);
    float2 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2380, float2(0.0), isnan(_2380)), level(_400)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2380, float2(0.0), isnan(_2380)), level(_400)).xy;
    float _521 = _519.x;
    float _523 = _519.y;
    float2 _2393 = float2(_370, _372);
    float4 _525 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2393, float2(0.0), isnan(_2393)), level(_400)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2393, float2(0.0), isnan(_2393)), level(_400)).xyzw;
    float _527 = _525.x;
    float _529 = _525.y;
    float _531 = _525.z;
    float _533 = _525.w;
    float2 _2410 = float2(_370, _372);
    float2 _535 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2410, float2(0.0), isnan(_2410)), level(_400)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2410, float2(0.0), isnan(_2410)), level(_400)).xy;
    float _537 = _535.x;
    float _539 = _535.y;
    float2 _2423 = float2(_370, _372);
    float2 _541 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2423, float2(0.0), isnan(_2423)), level(_400)), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2423, float2(0.0), isnan(_2423)), level(_400)).xy;
    float _543 = _541.x;
    float _545 = _541.y;
    float2 _2436 = float2(_370, _372);
    float4 _547 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2436, float2(0.0), isnan(_2436)), level(_400)), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2436, float2(0.0), isnan(_2436)), level(_400)).xyzw;
    float _549 = _547.x;
    float _551 = _547.y;
    float _553 = _547.z;
    float _555 = _547.w;
    float _557 = _411 * _411;
    float _559 = _557 * _557;
    float2 _2459 = float2(_495, _433);
    float3 _561 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2459, float2(0.0), isnan(_2459))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2459, float2(0.0), isnan(_2459))).xyz;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float2 _2473 = float2(_495, _501);
    float3 _569 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2473, float2(0.0), isnan(_2473))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2473, float2(0.0), isnan(_2473))).xyz;
    float _571 = _569.x;
    float _573 = _569.y;
    float _575 = _569.z;
    float _577 = _559 * 16.0;
    float _579 = _384 * _386;
    int _581 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _583 = _581 != 0;
    float _585 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _587 = _585 + 1.0;
    int _589 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _591 = _589 != 0;
    float _593 = _577 * _507;
    float _595 = _517 * _517;
    float _597 = _533 * _533;
    float _599 = _405 * _593;
    float _601 = _407 * _593;
    float _603 = _595 * _595;
    float _605 = _409 * _593;
    float _607 = -_507;
    float _609 = _607 + _523;
    float _611 = _505 * _507;
    float _613 = _603 * 16.0;
    float _615 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[0].x, _507);
    float _617 = -_611;
    float _619 = fma(_521, _523, _617);
    float _621 = _613 * _523;
    float _623 = -_579;
    float _625 = _623 + 1.0;
    float _627 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _629 = _627 + 1.0;
    float _631 = fma(_619, (*spvDescriptorSet0.fp_c3)._m0[0].x, _611);
    float _633 = _597 * _597;
    float _635 = -_599;
    float _637 = fma(_511, _621, _635);
    float _639 = fma(_625, _629, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _641 = fma(_625, _587, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _643 = precise::max(_615, 1.52587890625e-05);
    float _645 = -_601;
    float _647 = fma(_513, _621, _645);
    float _649 = -_605;
    float _651 = fma(_515, _621, _649);
    float _653 = _633 * 16.0;
    float _655 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[0].x, _599);
    float _657 = fma(_647, (*spvDescriptorSet0.fp_c3)._m0[0].x, _601);
    float _659 = 1.0 / _643;
    float _661 = fma(_651, (*spvDescriptorSet0.fp_c3)._m0[0].x, _605);
    float _663 = _653 * _539;
    float _665 = _555 * _555;
    float _667 = _527 * _663;
    float _669 = _531 * _663;
    float _671 = _665 * _665;
    float _673 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _675 = _615 * _659;
    float _677 = _631 * _675;
    float _679 = -_539;
    float _681 = _679 + _545;
    float _683 = _655 * _675;
    float _685 = _657 * _675;
    float _687 = _661 * _675;
    float _689 = fma(_681, (*spvDescriptorSet0.fp_c3)._m0[0].x, _539);
    float _691 = _537 * _539;
    float _693 = _529 * _663;
    float _695 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _697 = precise::max(_689, 1.52587890625e-05);
    float _699 = -_691;
    float _701 = fma(_543, _545, _699);
    float _703 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _705 = fma(_701, (*spvDescriptorSet0.fp_c3)._m0[0].x, _691);
    float _707 = 1.0 / _697;
    float _709 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _711 = fma(_138, _703, _709);
    float _713 = -_136;
    float _715 = fma(_713, _673, _711);
    float _717 = fma(_136, _673, _711);
    float _719 = _671 * 16.0;
    float _721 = -_134;
    float _723 = fma(_721, _695, _715);
    float _725 = fma(_134, _695, _717);
    float _727 = _719 * _545;
    float _729 = _705 * _707;
    float _731 = _639 * _707;
    float _733 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _735 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _737 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _739 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _741 = -_667;
    float _743 = fma(_549, _727, _741);
    float _745 = fma(_138, _733, _735);
    float _747 = -_693;
    float _749 = fma(_551, _727, _747);
    float _751 = _729 * _641;
    float _753 = -_669;
    float _755 = fma(_553, _727, _753);
    float _757 = -_136;
    float _759 = fma(_757, _737, _745);
    float _761 = fma(_136, _737, _745);
    float _763 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _765 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[0].x, _667);
    float _767 = _689 * _731;
    float _769 = -_677;
    float _771 = fma(_689, _751, _769);
    float _773 = -_134;
    float _775 = fma(_773, _763, _759);
    float _777 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _779 = fma(_134, _763, _761);
    float _781 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _783 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _785 = fma(_138, _777, _739);
    float _787 = fma(_755, (*spvDescriptorSet0.fp_c3)._m0[0].x, _669);
    float _789 = -_683;
    float _791 = fma(_765, _767, _789);
    float _793 = _136 * (-3.0);
    float _795 = -_136;
    float _797 = fma(_795, _781, _785);
    float _799 = fma(_136, _781, _785);
    float _801 = -_615;
    float _803 = _801 + _689;
    float _805 = _787 * _731;
    float _807 = -_134;
    float _809 = fma(_807, _783, _797);
    float _811 = fma(_134, _783, _799);
    float _813 = fma(_749, (*spvDescriptorSet0.fp_c3)._m0[0].x, _693);
    float _815 = fma(_384, _771, _677);
    float _817 = -_138;
    float _819 = _134 * _817;
    float _821 = _134 * _136;
    float _823 = -_685;
    float _825 = fma(_813, _767, _823);
    float _827 = _134 * _134;
    float _829 = _134 * _138;
    float _831 = -_136;
    float _833 = _138 * _831;
    float _835 = fma(_384, _803, _615);
    float _837 = -_138;
    float _839 = fma(_837, _138, _827);
    float _841 = _138 * _136;
    float _843 = -_136;
    float _845 = fma(_843, _793, -1.0);
    float _847 = -_687;
    float _849 = fma(_689, _805, _847);
    float _851 = fma(_384, _791, _683);
    float _853 = fma(_384, _825, _685);
    float _855 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _857 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _859 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _861 = fma(_384, _849, _687);
    float _863 = fma(_855, _819, _723);
    float _865 = fma(_855, _829, _725);
    float _867 = fma(_857, _833, _863);
    float _869 = fma(_857, _841, _865);
    float _871 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _873 = fma(_871, _819, _775);
    float _875 = fma(_871, _829, _779);
    float _877 = fma(_859, _819, _809);
    float _879 = fma(_859, _829, _811);
    float _881 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _883 = fma(_881, _833, _873);
    float _885 = fma(_881, _841, _875);
    float _887 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _889 = fma(_887, _833, _877);
    float _891 = fma(_887, _841, _879);
    float _893 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _895 = -_388;
    float _897 = _895 + 1.0;
    float _899 = fma(_893, _821, _867);
    float _901 = fma(_893, _821, _869);
    float _903 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _905 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _907 = _835 * _897;
    float _909 = fma(_903, _821, _889);
    float _911 = fma(_905, _821, _883);
    float _913 = fma(_905, _821, _885);
    float _915 = fma(_903, _821, _891);
    float _917 = _907 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _919 = fma(_308, 3.0, -1.0);
    float _921 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _923 = fma(_921, _845, _899);
    float _925 = fma(_921, _919, _901);
    float _927 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _929 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _931 = fma(_927, _919, _913);
    float _933 = fma(_929, _845, _909);
    float _935 = fma(_929, _919, _915);
    float _937 = fma(_927, _845, _911);
    float _939 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _941 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _943 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _945 = fma(_939, _839, _923);
    float _947 = fma(_939, _839, _925);
    float _949 = fma(_941, _839, _937);
    float _951 = fma(_941, _839, _931);
    float _953 = fma(_943, _839, _933);
    float _955 = fma(_943, _839, _935);
    float _957 = precise::max(_835, 1.52587890625e-05);
    float _959 = 1.0 / _957;
    float _961 = _815 * _959;
    bool _963 = !_583;
    float _965 = _963 ? _961 : 0.0;
    bool _967 = !_591;
    int _969 = _591 ? (-1) : 0;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    int _993;
    if (!_967)
    {
        float _971 = _775 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _973 = _725 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _975 = _723 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _977 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _979 = _779 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _981 = _811 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _983 = as_type<int>(_973);
        _985 = as_type<int>(_979);
        _987 = as_type<int>(_981);
        _989 = as_type<int>(_971);
        _991 = as_type<int>(_977);
        _993 = as_type<int>(_975);
        _995 = true;
    }
    else
    {
        int _997 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _999 = _997 != 0;
        float _1001 = _945 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1003 = _949 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1005 = _953 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1007 = _947 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1009 = _951 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1011 = _955 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1013 = as_type<int>(_1001);
        int _1015 = as_type<int>(_1003);
        int _1017 = as_type<int>(_1005);
        int _1019 = as_type<int>(_1007);
        int _1021 = as_type<int>(_1009);
        _969 = _999 ? (-1) : 0;
        _987 = as_type<int>(_1011);
        if (_999)
        {
            float _1023 = _709 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1013 = as_type<int>(_1023);
        }
        int _1025 = _1013;
        _993 = _1025;
        if (_999)
        {
            float _1027 = _735 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1015 = as_type<int>(_1027);
        }
        int _1029 = _1015;
        _989 = _1029;
        if (_999)
        {
            float _1031 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1017 = as_type<int>(_1031);
        }
        int _1033 = _1017;
        _991 = _1033;
        if (_999)
        {
            _1019 = _1025;
        }
        int _1035 = _1019;
        _983 = _1035;
        if (_999)
        {
            _1021 = _1029;
        }
        int _1037 = _1021;
        _985 = _1037;
        if (_999)
        {
            _987 = _1033;
        }
    }
    _995 = false;
    int _1039 = _969;
    int _1041 = _983;
    int _1043 = _985;
    int _1045 = _987;
    int _1047 = _989;
    int _1049 = _991;
    int _1051 = _993;
    int _1053 = 0;
    int _1055 = _1039;
    if (!_110)
    {
        int _1057 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _1059 = _1057 != 0;
        _1053 = _1059 ? (-1) : 0;
    }
    int _1061 = _1053;
    if (_110)
    {
        _1055 = -1;
    }
    int _1063 = _1055;
    float _1065 = fma(_394, 2.0, -1.0);
    float _1067 = fma(_396, 2.0, -1.0);
    int _1069 = _1063;
    if (!_110)
    {
        int _1071 = ~_1061;
        bool _1073 = !_114;
        int _1075 = _1071 & (_1073 ? (-1) : 0);
        _1069 = _1075;
    }
    int _1077 = _1069;
    float _1079 = fma(_1065, (*spvDescriptorSet0.fp_c3)._m0[22].x, _358);
    float _1081 = fma(_1067, (*spvDescriptorSet0.fp_c3)._m0[22].y, _362);
    bool _1083 = _116 != 0;
    float2 _3332 = float2(_1079, _1081);
    float4 _1085 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_3332, float2(0.0), isnan(_3332))), spvDescriptorSet0.dm_border, 11u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_3332, float2(0.0), isnan(_3332))).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float _1095 = _467 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _1097 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _1099 = _965 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _1101 = exp2(_1095);
    int _1103 = _1077;
    if (_106)
    {
        _1103 = -1;
    }
    int _1105 = _1103;
    int _1107 = ~_1077;
    float _1109 = (_1107 != 0) ? as_type<float>(_1041) : 0.0;
    int _1111 = _1105;
    if (!_106)
    {
        bool _1113 = !_114;
        bool _1115 = _1113 && _100;
        bool _1117 = !_1083;
        bool _1119 = _1115 && _1117;
        _1111 = _1119 ? (-1) : 0;
    }
    int _1121 = _1111;
    int _1123 = ~_1077;
    float _1125 = (_1123 != 0) ? as_type<float>(_1043) : 0.0;
    float _1127 = _579 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    int _1129 = ~_1077;
    float _1131 = (_1129 != 0) ? as_type<float>(_1045) : 0.0;
    float _1133 = _851 * _959;
    float _1135 = _853 * _959;
    float _1137 = _861 * _959;
    float _1139 = -_1101;
    float _1141 = _1139 + 1.0;
    float _1143 = _1141 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1145 = !_114;
    bool _1147 = _100 && _1145;
    int _1149 = ~_1121;
    float _1151 = (_1149 != 0) ? as_type<float>(_1047) : 0.0;
    float _1153 = -_1143;
    float _1155 = _1153 + 1.0;
    float _1157 = abs(_1155);
    float _1159 = log2(_1157);
    int _1161 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1163 = _1161 != 0;
    bool _1165 = !_1147;
    float _1167 = _1165 ? _1097 : 0.0;
    bool _1169 = !_1147;
    float _1171 = _1169 ? _1099 : 0.0;
    int _1173 = ~_1121;
    float _1175 = (_1173 != 0) ? as_type<float>(_1049) : 0.0;
    float _1177 = _1167 * _1125;
    bool _1179 = !_1163;
    float _1181 = _1167 * _1131;
    bool _1183 = !_1163;
    float _1185 = fma(_1151, _1171, _1177);
    int _1187 = ~_1121;
    float _1189 = (_1187 != 0) ? as_type<float>(_1051) : 0.0;
    float _1191 = _1167 * _1109;
    bool _1193 = !_1179;
    float _1195 = _1193 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1197 = fma(_1175, _1171, _1181);
    float _1199 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _1201 = !_1183;
    float _1203 = _1201 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1205 = fma(_1189, _1171, _1191);
    bool _1207 = !_1163;
    float _1209 = _1195 * _1185;
    float _1211 = _1159 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1213 = _1203 * _1205;
    bool _1215 = !_1207;
    float _1217 = _1215 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1219 = exp2(_1199);
    float _1221 = _1209 * 0.715200006961822509765625;
    int _1223 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1225 = _1223 != 0;
    float _1227 = _1217 * _1197;
    float _1229 = fma(_1213, 0.2125999927520751953125, _1221);
    float _1231 = exp2(_1211);
    float _1233 = fma(_1227, 0.072200000286102294921875, _1229);
    bool _1235 = !_1225;
    bool _1237 = !_1225;
    float _1239 = -_1213;
    float _1241 = _1239 + _1233;
    float _1243 = -_1209;
    float _1245 = _1243 + _1233;
    float _1247 = _1235 ? _1133 : 0.0;
    float _1249 = -_1227;
    float _1251 = _1249 + _1233;
    bool _1253 = !_96;
    float _1255 = _1253 ? _1219 : 1.0;
    float _1257 = fma(_1127, _1241, _1213);
    float _1259 = fma(_1127, _1245, _1209);
    float _1261 = fma(_1127, _1251, _1227);
    float _1263 = _1237 ? _1135 : 0.0;
    float _1265 = _965 * _1255;
    float _1267 = _1255 * _1257;
    bool _1269 = !_96;
    float _1271 = _1269 ? _1231 : 1.0;
    float _1273 = _1255 * _1259;
    float _1275 = _100 ? _1265 : _1267;
    float _1277 = _1271 * _1247;
    float _1279 = _1271 * _1263;
    float _1281 = _100 ? _1265 : _1273;
    float _1283 = _1275 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    bool _1285 = !_1225;
    float _1287 = _1265;
    float _1289 = _1271;
    float _1291 = _1261;
    float _1293 = _1255;
    float _1295 = _1277;
    float _1297 = _1143;
    if (!_100)
    {
        float _1299 = _1255 * _1261;
        _1287 = _1299;
    }
    float _1301 = _1287;
    float _1303 = fma(_1277, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1283);
    float _1305 = _1281 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1307 = _1285 ? _1137 : 0.0;
    float _1309 = _1301 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1311 = fma(_1279, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1305);
    int _1313 = as_type<int>(_1305);
    if (_96)
    {
        _1313 = as_type<int>(_917);
    }
    int _1315 = _1313;
    float _1317 = _1271 * _1307;
    float _1319 = fma(_1317, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1309);
    int _1321 = _1315;
    int _1323 = _1315;
    float _1325 = _1319;
    if (_96)
    {
        _1289 = 0.0;
    }
    float _1327 = _1289;
    bool _1329 = !_96;
    float _1331 = _1329 ? _1143 : 0.0;
    float _1333 = _1327;
    if (_96)
    {
        _1291 = 0.0;
    }
    float _1335 = _1291;
    float _1337 = _1335;
    if (_96)
    {
        _1293 = 0.0;
    }
    float _1339 = _1293;
    float _1341 = _1339;
    if (_96)
    {
        _1295 = _1303;
    }
    float _1343 = _1295;
    float _1345 = _1343;
    float _1347 = _1343;
    if (_96)
    {
        _1297 = _1311;
    }
    float _1349 = _1297;
    float _1351 = _1349;
    float _1353 = _1349;
    if (!_96)
    {
        int _1355 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1357 = _1355 != 0;
        float _1359 = _573 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1361 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1363 = _1361 != 0;
        float _1365 = _571 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1367 = _575 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1369 = !_1363;
        float _1371 = _1369 ? _1365 : 0.0;
        bool _1373 = !_1363;
        float _1375 = _1373 ? _1359 : 0.0;
        bool _1377 = !_1363;
        float _1379 = _1377 ? _1367 : 0.0;
        float _1381 = _1331 * _1371;
        _1333 = _1381;
        if (!_1357)
        {
            _1321 = as_type<int>(_917);
        }
        int _1383 = _1321;
        float _1385 = _1331 * _1375;
        _1337 = _1385;
        _1323 = _1383;
        if (!_1357)
        {
            _1345 = _1303;
        }
        float _1387 = _1345;
        float _1389 = _1331 * _1379;
        _1347 = _1387;
        _1341 = _1389;
        if (!_1357)
        {
            _1351 = _1311;
        }
        float _1391 = _1351;
        bool _1393 = !_1357;
        _1353 = _1391;
        if (!_1393)
        {
            float _1395 = -_1331;
            float _1397 = _1395 + 1.0;
            float _1399 = precise::clamp(_1397, 0.0, 1.0);
            float _1401 = _917 * _1399;
            float _1403 = precise::max(_1401, 9.9999997473787516355514526367188e-05);
            float _1405 = 1.0 / _1403;
            float _1407 = _917 * _1405;
            float _1409 = _1303 * _1407;
            float _1411 = _1311 * _1407;
            float _1413 = _1319 * _1407;
            _1353 = _1411;
            _1337 = 0.0;
            _1347 = _1409;
            _1333 = 0.0;
            _1323 = as_type<int>(_1401);
            _1325 = _1413;
            _1341 = 0.0;
        }
    }
    float _1415 = _1353;
    float _1417 = _1337;
    float _1419 = _1347;
    float _1421 = _1333;
    int _1423 = _1323;
    float _1425 = _1325;
    float _1427 = _1341;
    int _1429 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1431 = _1429 != 0;
    int _1433 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1435 = _1433 != 0;
    float _1437 = _565 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1439 = _1415 + _1417;
    float _1441 = _563 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1443 = _1419 + _1421;
    bool _1445 = !_1435;
    float _1447 = _1445 ? as_type<float>(_1423) : 1.0;
    float _1449 = _567 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1451 = _1425 + _1427;
    float _1453 = -_1447;
    float _1455 = _1453 + 1.0;
    float _1457 = abs(_1455);
    float _1459 = log2(_1457);
    float _1461 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1463 = exp2(_1461);
    float _1465 = -_1463;
    float _1467 = spvFAdd(_1465, 1.00010001659393310546875);
    float _1469 = -_1463;
    float _1471 = _1469 + 1.0;
    float _1473 = -_1447;
    float _1475 = _1473 + _1471;
    float _1477 = 1.0 / _1467;
    float _1479 = _1437 * _1475;
    float _1481 = _1441 * _1475;
    float _1483 = _1449 * _1475;
    float _1485 = fma(_1439, _1447, _1479);
    float _1487 = fma(_1443, _1447, _1481);
    float _1489 = _1477 * _1485;
    float _1491 = fma(_1451, _1447, _1483);
    float _1493 = _1477 * _1487;
    float _1495 = _1489 * 0.715200006961822509765625;
    float _1497 = _1477 * _1491;
    float _1499 = fma(_1493, 0.2125999927520751953125, _1495);
    float _1501 = fma(_1497, 0.072200000286102294921875, _1499);
    float _1503 = 1.0 / _1501;
    float _1505 = _1503 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1507 = precise::clamp(_1505, 0.0, 1.0);
    float _1509 = fma(_1507, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1511 = _1509 * _1093;
    float _1513 = fma(_1493, _1511, _1087);
    float _1515 = fma(_1489, _1511, _1089);
    float _1517 = fma(_1497, _1511, _1091);
    bool _1519 = !_1431;
    float _1521 = _1463;
    float _1523 = _1515;
    float _1525 = _1497;
    int _1527 = as_type<int>(_1463);
    int _1529 = as_type<int>(_1497);
    float _1531 = _1515;
    if (!_1519)
    {
        bool _1533 = _1471 != 1.0;
        bool _1535 = isnan(_1471);
        bool _1537 = _1533 || _1535;
        bool _1539 = isnan(1.0);
        bool _1541 = _1537 || _1539;
        float _1543 = -_1463;
        bool _1545 = _1543 != (-1.0);
        bool _1547 = isnan(_1543);
        bool _1549 = _1545 || _1547;
        bool _1551 = isnan(-1.0);
        bool _1553 = _1549 || _1551;
        float _1555 = -_1463;
        bool _1557 = _1555 == (-1.0);
        bool _1559 = !_1541;
        bool _1561 = _1557 || _1559;
        bool _1563 = _1471 == 1.0;
        bool _1565 = _1563 && _1553;
        bool _1567 = !_1561;
        float _1569 = _1567 ? _1471 : 0.0;
        bool _1571 = !_1565;
        float _1573 = _1571 ? 0.0 : 1.0;
        float _1575 = _1561 ? 0.0 : 0.5;
        float _1577 = _1569 * 0.715200006961822509765625;
        float _1579 = fma(_1573, 0.2125999927520751953125, _1577);
        float _1581 = fma(_1575, 0.072200000286102294921875, _1579);
        float _1583 = 1.0 / _1581;
        float _1585 = _1583 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1587 = precise::clamp(_1585, 0.0, 1.0);
        float _1589 = fma(_1587, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1591 = _1573 * _1589;
        float _1593 = _1569 * _1589;
        float _1595 = _1575 * _1589;
        out.m_56.x = _1591;
        out.m_56.y = _1593;
        out.m_56.z = _1595;
        out.m_56.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_56)};
    }
    bool _1597 = _116 != 0;
    bool _1599 = !_1597;
    if (!_1599)
    {
        if (_106)
        {
            _1521 = 0.0;
        }
        float _1601 = _1521;
        float _1603 = _1601;
        if (_106)
        {
            _1523 = 0.0;
        }
        float _1605 = _1523;
        float _1607 = _1605;
        if (!_106)
        {
            float _1609 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1607 = _1609;
        }
        float _1611 = _1607;
        float _1613 = _1611;
        if (!_106)
        {
            float _1615 = _1189 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1603 = _1615;
        }
        float _1617 = _1603;
        float _1619 = _1617;
        if (!_110)
        {
            float _1621 = fma(_1125, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1611);
            _1613 = _1621;
        }
        float _1623 = _1613;
        if (_106)
        {
            _1525 = 0.0;
        }
        float _1625 = _1525;
        float _1627 = _1625;
        if (!_106)
        {
            float _1629 = _1175 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1627 = _1629;
        }
        float _1631 = _1627;
        float _1633 = _1623 * 0.715200006961822509765625;
        float _1635 = _1631;
        if (!_110)
        {
            float _1637 = fma(_1109, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1617);
            _1619 = _1637;
        }
        float _1639 = _1619;
        if (!_110)
        {
            float _1641 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1631);
            _1635 = _1641;
        }
        float _1643 = _1635;
        float _1645 = fma(_1639, 0.2125999927520751953125, _1633);
        float _1647 = fma(_1643, 0.072200000286102294921875, _1645);
        float _1649 = 1.0 / _1647;
        float _1651 = _1649 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1653 = precise::clamp(_1651, 0.0, 1.0);
        float _1655 = fma(_1653, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1657 = _1655 * _1639;
        float _1659 = _1655 * _1623;
        float _1661 = _1655 * _1643;
        out.m_56.x = _1657;
        out.m_56.y = _1659;
        out.m_56.z = _1661;
        out.m_56.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_56)};
    }
    if (!_114)
    {
        _1527 = as_type<int>(_1513);
    }
    int _1663 = _1527;
    float _1665 = as_type<float>(_1663);
    if (!_114)
    {
        _1529 = as_type<int>(_1471);
    }
    int _1667 = _1529;
    float _1669 = as_type<float>(_1667);
    if (!_114)
    {
        out.m_56.x = as_type<float>(_1663);
        out.m_56.y = _1515;
        out.m_56.z = _1517;
        out.m_56.w = as_type<float>(_1667);
        return main0_out_u{as_type<uint4>(out.m_56)};
    }
    if (_106)
    {
        _1665 = 0.0;
    }
    float _1671 = _1665;
    float _1673 = _1671;
    if (_106)
    {
        _1531 = 0.0;
    }
    float _1675 = _1531;
    float _1677 = _1675;
    if (!_106)
    {
        float _1679 = _1151 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1677 = _1679;
    }
    float _1681 = _1677;
    float _1683 = _1681;
    if (!_106)
    {
        float _1685 = _1189 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1673 = _1685;
    }
    float _1687 = _1673;
    float _1689 = _1687;
    if (!_110)
    {
        float _1691 = fma(_1125, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1681);
        _1683 = _1691;
    }
    float _1693 = _1683;
    if (_106)
    {
        _1669 = 0.0;
    }
    float _1695 = _1669;
    float _1697 = _1695;
    if (!_106)
    {
        float _1699 = _1175 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1697 = _1699;
    }
    float _1701 = _1697;
    float _1703 = _1693 * 0.715200006961822509765625;
    float _1705 = _1701;
    if (!_110)
    {
        float _1707 = fma(_1109, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1687);
        _1689 = _1707;
    }
    float _1709 = _1689;
    if (!_110)
    {
        float _1711 = fma(_1131, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1701);
        _1705 = _1711;
    }
    float _1713 = _1705;
    float _1715 = fma(_1709, 0.2125999927520751953125, _1703);
    float _1717 = fma(_1713, 0.072200000286102294921875, _1715);
    float _1719 = 1.0 / _1717;
    float _1721 = _1719 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1723 = precise::clamp(_1721, 0.0, 1.0);
    float _1725 = fma(_1723, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1727 = _1725 * _1709;
    float _1729 = _1725 * _1693;
    float _1731 = _1725 * _1713;
    out.m_56.x = _1727;
    out.m_56.y = _1729;
    out.m_56.z = _1731;
    out.m_56.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_56)};
}

