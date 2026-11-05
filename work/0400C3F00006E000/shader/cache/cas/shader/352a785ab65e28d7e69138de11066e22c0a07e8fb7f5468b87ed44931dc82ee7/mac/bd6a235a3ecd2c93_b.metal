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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_16 [[id(15)]];
    sampler fp_t_tcb_16Smplr [[id(16)]];
    sampler fp_t_tcb_8Smplr_w [[id(17)]];
    sampler fp_t_tcb_ASmplr_w [[id(18)]];
    sampler fp_t_tcb_10Smplr_w [[id(19)]];
    sampler fp_t_tcb_12Smplr_w [[id(20)]];
    sampler fp_t_tcb_14Smplr_w [[id(21)]];
    sampler fp_t_tcb_ESmplr_w [[id(22)]];
    sampler fp_t_tcb_CSmplr_w [[id(23)]];
    sampler fp_t_tcb_16Smplr_w [[id(24)]];
    constant dm_border_t* dm_border [[id(25)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _54(thread const int& _4292, thread const int& _4293, thread const int& _4294, thread const int& _4295, thread int& _4296, thread int& _4297, thread int& _4298, thread int& _4299, thread int& _4300)
{
    float _4303 = as_type<float>(_4293) + 0.0;
    bool _4305 = _4303 != 0.0;
    bool _4307 = isnan(_4303);
    bool _4309 = _4305 || _4307;
    bool _4311 = isnan(0.0);
    bool _4313 = _4309 || _4311;
    int _4315 = as_type<int>(_4303);
    int _4317 = _4294;
    int _4319 = _4313 ? (-1) : 0;
    if (!_4313)
    {
        float _4321 = as_type<float>(_4293) * 1.0;
        _4315 = as_type<int>(_4321);
    }
    int _4323 = _4315;
    bool _4325 = !_4313;
    int _4327 = _4323;
    if (!_4325)
    {
        float _4329 = as_type<float>(_4293) + 0.0;
        bool _4331 = _4329 >= 0.0;
        bool _4333 = isnan(_4329);
        bool _4335 = _4331 || _4333;
        bool _4337 = isnan(0.0);
        bool _4339 = _4335 || _4337;
        int _4341 = as_type<int>(_4329);
        _4319 = _4339 ? (-1) : 0;
        if (!_4339)
        {
            _4341 = 2147483647;
        }
        int _4343 = _4341;
        bool _4345 = !_4339;
        _4327 = _4343;
        if (!_4345)
        {
            float _4347 = abs(as_type<float>(_4293));
            float _4349 = _4347 + 0.0;
            bool _4351 = _4349 > as_type<float>(0x7f800000u /* inf */);
            bool _4353 = isnan(_4349);
            bool _4355 = _4351 || _4353;
            bool _4357 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4359 = _4355 || _4357;
            int _4361 = as_type<int>(_4349);
            _4319 = _4359 ? (-1) : 0;
            if (_4359)
            {
                float _4363 = as_type<float>(_4293) + 1.0;
                _4361 = as_type<int>(_4363);
            }
            int _4365 = _4361;
            _4327 = _4365;
            if (!_4359)
            {
                float _4367 = abs(as_type<float>(_4293));
                float _4369 = _4367 + (-0.0);
                float _4371 = 0.0 + _4369;
                bool _4373 = _4371 != as_type<float>(0x7f800000u /* inf */);
                bool _4375 = isnan(_4371);
                bool _4377 = _4373 || _4375;
                bool _4379 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4381 = _4377 || _4379;
                int _4383 = as_type<int>(_4371);
                _4319 = _4381 ? (-1) : 0;
                if (!_4381)
                {
                    _4383 = _4293;
                }
                int _4385 = _4383;
                bool _4387 = !_4381;
                _4327 = _4385;
                if (!_4387)
                {
                    float _4389 = as_type<float>(_4293) * 18446744073709551616.0;
                    float _4391 = rsqrt(_4389);
                    float _4393 = _4389 * _4391;
                    float _4395 = _4391 * 0.5;
                    float _4397 = -_4393;
                    float _4399 = 0.0 + _4397;
                    float _4401 = fma(_4395, _4399, 0.5);
                    float _4403 = fma(_4393, _4401, _4393);
                    float _4405 = -_4403;
                    float _4407 = 0.0 + _4405;
                    float _4409 = fma(_4403, _4407, _4389);
                    float _4411 = fma(_4395, _4409, _4403);
                    float _4413 = _4411 * 2.3283064365386962890625e-10;
                    _4327 = as_type<int>(_4413);
                    _4317 = as_type<int>(_4403);
                }
            }
        }
    }
    int _4415 = _4327;
    int _4417 = _4317;
    int _4419 = _4319;
    _4296 = _4415;
    _4297 = _4295;
    _4298 = 0;
    _4299 = _4417;
    _4300 = _4419;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _901 = false;
    bool _276 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _92 = _90 != 0;
    float _94 = precise::max(0.0, _84);
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_82);
    float _110 = 1.0 / _58;
    float _112 = _110 * _64;
    float _114 = _110 * _70;
    float _116 = _110 * _76;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = fma(_116, _116, _120);
    float _124 = rsqrt(_122);
    float _126 = _114 * _124;
    float _128 = _116 * _124;
    float _130 = _112 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_94;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _94;
    float _154 = _124;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = _226 * _218;
    float _232 = _226 * _220;
    float _234 = -_228;
    float _236 = precise::max(0.0, _234);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = fma(_236, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _246 = as_type<int>(_242) + (-218103808);
    float _248 = fma(_236, _244, -0.212114393711090087890625);
    bool _250 = uint(_246) >= 1920991232u;
    float _252 = fma(_236, _248, 1.570728778839111328125);
    bool _254 = !_250;
    float _274;
    if (!_254)
    {
        int _256 = 0;
        int _258 = as_type<int>(_242);
        int _260 = 0;
        int _262 = 1232;
        int _264;
        int _266;
        int _268;
        int _270;
        int _272;
        _54(_256, _258, _260, _262, _264, _266, _268, _270, _272);
        _274 = as_type<float>(_264);
        _276 = true;
    }
    else
    {
        float _278 = rsqrt(_242);
        float _280 = _242 * _278;
        float _282 = _278 * 0.5;
        float _284 = -_280;
        float _286 = 0.0 + _284;
        float _288 = fma(_282, _286, 0.5);
        float _290 = fma(_280, _288, _280);
        float _292 = -_290;
        float _294 = 0.0 + _292;
        float _296 = fma(_290, _294, _242);
        float _298 = fma(_282, _296, _290);
        _274 = _298;
    }
    _276 = false;
    float _300 = _274;
    bool _302 = _228 > 0.0;
    float _304 = _128 * _128;
    float _306 = _126 * _126;
    float _308 = _304 + _306;
    if (_302)
    {
        discard_fragment();
    }
    float _310 = rsqrt(_308);
    float _312 = _252 * _300;
    float _314 = _312 * 0.636619746685028076171875;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_316;
    float _320 = _318 + 1.0;
    float _322 = sqrt(_320);
    float _324 = _128 * _310;
    float _326 = _126 * _310;
    float _328 = abs(_324);
    float _330 = abs(_326);
    float _332 = precise::max(_328, _330);
    float _334 = precise::max(_332, 9.9999997473787516355514526367188e-05);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = 1.0 / _334;
    float _342 = _338 * 0.5;
    float _344 = -_340;
    float _346 = _324 * _344;
    float _348 = _326 * _340;
    float _350 = fma(_346, _342, 0.5);
    float _352 = fma(_348, _342, 0.5);
    if (_302)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float2 _2123;
    _2123.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_350, _352));
    _2123.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_350, _352));
    float _354 = _2123.x;
    float _356 = _354 * 256.0;
    int _358 = int(_356);
    float _360 = float(uint(_358));
    float _362 = _360 * 0.00390625;
    float2 _2139 = float2(_350, _352);
    float4 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2139, float2(0.0), isnan(_2139)), level(_362)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2139, float2(0.0), isnan(_2139)), level(_362)).xyzw;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    float _373 = _365.w;
    float2 _2158 = float2(_350, _352);
    float2 _377 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2158, float2(0.0), isnan(_2158)), level(_362)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2158, float2(0.0), isnan(_2158)), level(_362)).xy;
    float _379 = _377.x;
    float _381 = _377.y;
    float _383 = -_130;
    float _385 = _383 + 1.0;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = -_130;
    float _391 = fma(_389, _130, 1.0);
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _126 * _130;
    int _397 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _399 = _397 != 0;
    float _401 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    int _403 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _405 = _403 != 0;
    float _407 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _409 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _411 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _413 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _415 = fma(_130, _409, _407);
    float _417 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _419 = _387;
    if (_399)
    {
        float _421 = sqrt(_393);
        _419 = _421;
    }
    float _423 = _419;
    float _425 = fma(_304, 3.0, -1.0);
    float _427 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _429 = -_128;
    float _431 = fma(_429, _417, _415);
    float _433 = fma(_128, _417, _415);
    float _435 = fma(_130, _413, _401);
    float _437 = fma(_130, _427, _411);
    float _439 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _441 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _443 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _445 = -_126;
    float _447 = fma(_445, _439, _431);
    float _449 = fma(_126, _439, _433);
    float _451 = _128 * (-3.0);
    float _453 = -_128;
    float _455 = fma(_453, _441, _435);
    float _457 = fma(_128, _441, _435);
    float _459 = abs(_423);
    float _461 = log2(_459);
    float _463 = -_128;
    float _465 = fma(_463, _443, _437);
    float _467 = fma(_128, _443, _437);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _471 = -_130;
    float _473 = fma(_471, _130, _306);
    float _475 = _126 * _128;
    float _477 = -_128;
    float _479 = _130 * _477;
    float _481 = -_128;
    float _483 = fma(_481, _451, -1.0);
    float _485 = _130 * _128;
    float _487 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _489 = -_126;
    float _491 = fma(_489, _469, _455);
    float _493 = fma(_126, _469, _457);
    float _495 = -_130;
    float _497 = _126 * _495;
    float _499 = -_126;
    float _501 = fma(_499, _487, _465);
    float _503 = fma(_126, _487, _467);
    float _505 = _461 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _507 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _509 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _511 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _513 = exp2(_505);
    float _515 = fma(_507, _497, _447);
    float _517 = fma(_509, _497, _491);
    float _519 = fma(_511, _497, _501);
    float _521 = fma(_511, _395, _503);
    float _523 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _525 = fma(_507, _395, _449);
    float _527 = fma(_509, _395, _493);
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _531 = fma(_523, _479, _515);
    float _533 = fma(_523, _485, _525);
    float _535 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _537 = fma(_529, _479, _517);
    float _539 = fma(_529, _485, _527);
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _543 = _513 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _545 = fma(_535, _479, _519);
    float _547 = fma(_535, _485, _521);
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _551 = fma(_543, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _557 = fma(_541, _475, _531);
    float _559 = -_553;
    float _561 = _559 + 1.0;
    float _563 = fma(_549, _475, _539);
    float _565 = fma(_541, _475, _533);
    float _567 = fma(_549, _475, _537);
    float _569 = abs(_561);
    float _571 = log2(_569);
    float _573 = fma(_555, _475, _545);
    float _575 = fma(_555, _475, _547);
    float _577 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _579 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _581 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _583 = fma(_577, _483, _567);
    float _585 = _230 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _587 = fma(_579, _483, _573);
    float _589 = fma(_577, _425, _563);
    float _591 = -_585;
    float _593 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _591);
    float _595 = fma(_581, _425, _565);
    float _597 = fma(_581, _483, _557);
    float _599 = fma(_579, _425, _575);
    float _601 = _571 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _603 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _605 = in.m_48.x;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = in.m_48.y;
    float _613 = gl_FragCoord.w;
    float _615 = _611 * _613;
    float _617 = exp2(_601);
    float _619 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _621 = -_232;
    float _623 = fma(_621, (*spvDescriptorSet0.fp_c3)._m0[11].z, _593);
    float _625 = fma(_603, _473, _597);
    float _627 = fma(_603, _473, _595);
    float _629 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _631 = fma(_623, -0.5, 0.5);
    float _633 = fma(_619, _473, _583);
    float _635 = fma(_619, _473, _589);
    float _637 = _228 + 1.0;
    float _639 = fma(_629, _473, _587);
    float _641 = fma(_629, _473, _599);
    float _643 = fma(_623, 0.5, 0.5);
    float _645 = sqrt(_631);
    float _647 = -_228;
    float _649 = fma(_617, _637, _647);
    float _651 = fma(_643, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _653 = fma(_649, 0.5, 0.5);
    float _655 = fma(_643, _651, -0.212114393711090087890625);
    float _657 = fma(_643, _655, 1.570728778839111328125);
    float _659 = _645 * 0.636619746685028076171875;
    float _661 = _110 * _609;
    float _663 = _110 * _615;
    float _665 = -_657;
    float _667 = fma(_659, _665, 1.0);
    float _669 = fma(_228, -0.5, 0.5);
    float _671 = _373 * _373;
    float _673 = _671 * _671;
    float _675 = _673 * 16.0;
    float _677 = _675 * _381;
    float _679 = _367 * _677;
    float _681 = _369 * _677;
    float _683 = _371 * _677;
    float2 _2657 = float2(_350, _352);
    float4 _685 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2657, float2(0.0), isnan(_2657)), level(_362)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2657, float2(0.0), isnan(_2657)), level(_362)).xyzw;
    float _687 = _685.x;
    float _689 = _685.y;
    float _691 = _685.z;
    float _693 = _685.w;
    float2 _2674 = float2(_350, _352);
    float2 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2674, float2(0.0), isnan(_2674)), level(_362)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2674, float2(0.0), isnan(_2674)), level(_362)).xy;
    float _697 = _695.x;
    float _699 = _695.y;
    float2 _2687 = float2(_661, _663);
    float3 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2687, float2(0.0), isnan(_2687))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2687, float2(0.0), isnan(_2687))).xyz;
    float _705 = _703.x;
    float _707 = _703.y;
    float _709 = _703.z;
    float2 _2701 = float2(_350, _352);
    float2 _711 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2701, float2(0.0), isnan(_2701)), level(_362)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2701, float2(0.0), isnan(_2701)), level(_362)).xy;
    float _713 = _711.x;
    float _715 = _711.y;
    float2 _2714 = float2(_350, _352);
    float4 _717 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2714, float2(0.0), isnan(_2714)), level(_362)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2714, float2(0.0), isnan(_2714)), level(_362)).xyzw;
    float _719 = _717.x;
    float _721 = _717.y;
    float _723 = _717.z;
    float _725 = _717.w;
    float2 _2731 = float2(_667, _669);
    float3 _727 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2731, float2(0.0), isnan(_2731))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2731, float2(0.0), isnan(_2731))).xyz;
    float _729 = _727.x;
    float _731 = _727.y;
    float _733 = _727.z;
    float2 _2745 = float2(_667, _653);
    float3 _735 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2745, float2(0.0), isnan(_2745))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2745, float2(0.0), isnan(_2745))).xyz;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    int _743 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _745 = _743 != 0;
    float _747 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _749 = _747 + 1.0;
    float _751 = _693 * _693;
    float _753 = _705 * _707;
    float _755 = _751 * _751;
    float _757 = _379 * _381;
    float _759 = _725 * _725;
    float _761 = _755 * 16.0;
    float _763 = -_757;
    float _765 = fma(_697, _699, _763);
    float _767 = -_381;
    float _769 = _767 + _699;
    float _771 = _759 * _759;
    float _773 = _761 * _699;
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _777 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _381);
    float _779 = -_679;
    float _781 = fma(_687, _773, _779);
    float _783 = -_681;
    float _785 = fma(_689, _773, _783);
    float _787 = -_683;
    float _789 = fma(_691, _773, _787);
    float _791 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[0].x, _679);
    float _793 = precise::max(_777, 1.52587890625e-05);
    float _795 = fma(_785, (*spvDescriptorSet0.fp_c3)._m0[0].x, _681);
    float _797 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _799 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _801 = _799 + 1.0;
    float _803 = -_753;
    float _805 = _803 + 1.0;
    float _807 = _771 * 16.0;
    float _809 = 1.0 / _793;
    float _811 = fma(_805, _801, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _813 = fma(_805, _749, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _815 = -_777;
    float _817 = _815 + _715;
    float _819 = _807 * _811;
    float _821 = _713 * _813;
    float _823 = fma(_705, _817, _777);
    float _825 = _723 * _819;
    float _827 = precise::max(_823, 1.52587890625e-05);
    float _829 = _777 * _809;
    float _831 = 1.0 / _827;
    float _833 = _775 * _829;
    float _835 = _791 * _829;
    float _837 = _795 * _829;
    float _839 = _797 * _829;
    float _841 = -_833;
    float _843 = fma(_715, _821, _841);
    float _845 = _715 * _819;
    float _847 = -_839;
    float _849 = fma(_715, _825, _847);
    float _851 = fma(_705, _843, _833);
    float _853 = -_835;
    float _855 = fma(_719, _845, _853);
    float _857 = -_837;
    float _859 = fma(_721, _845, _857);
    float _861 = fma(_705, _849, _839);
    float _863 = fma(_705, _855, _835);
    float _865 = _851 * _831;
    float _867 = fma(_705, _859, _837);
    bool _869 = !_405;
    float _871 = _869 ? _865 : 0.0;
    bool _873 = !_745;
    int _875 = _745 ? (-1) : 0;
    int _889;
    int _891;
    int _893;
    int _895;
    int _897;
    int _899;
    if (!_873)
    {
        float _877 = _447 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _879 = _491 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _881 = _501 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _883 = _449 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _885 = _493 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _887 = _503 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _889 = as_type<int>(_883);
        _891 = as_type<int>(_885);
        _893 = as_type<int>(_887);
        _895 = as_type<int>(_879);
        _897 = as_type<int>(_877);
        _899 = as_type<int>(_881);
        _901 = true;
    }
    else
    {
        int _903 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _905 = _903 != 0;
        float _907 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _909 = _625 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _911 = _633 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _913 = _627 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _915 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _917 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _919 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _921 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _923 = as_type<int>(_907);
        int _925 = as_type<int>(_909);
        int _927 = as_type<int>(_911);
        int _929 = as_type<int>(_921);
        int _931 = as_type<int>(_913);
        _875 = _905 ? (-1) : 0;
        _891 = as_type<int>(_919);
        if (_905)
        {
            float _933 = _411 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _923 = as_type<int>(_933);
        }
        int _935 = _923;
        _899 = _935;
        if (_905)
        {
            float _937 = _915 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _925 = as_type<int>(_937);
        }
        int _939 = _925;
        _897 = _939;
        if (_905)
        {
            float _941 = _917 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _927 = as_type<int>(_941);
        }
        int _943 = _927;
        _895 = _943;
        if (_905)
        {
            _929 = _935;
        }
        int _945 = _929;
        _893 = _945;
        if (_905)
        {
            _931 = _939;
        }
        int _947 = _931;
        _889 = _947;
        if (_905)
        {
            _891 = _943;
        }
    }
    _901 = false;
    int _949 = _875;
    int _951 = _889;
    int _953 = _891;
    int _955 = _893;
    int _957 = _895;
    int _959 = _897;
    int _961 = _899;
    int _963 = 0;
    int _965 = _949;
    if (!_102)
    {
        int _967 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _969 = _967 != 0;
        _963 = _969 ? (-1) : 0;
    }
    int _971 = _963;
    float _973 = _571 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_102)
    {
        _965 = -1;
    }
    int _975 = _965;
    float _977 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _979 = _975;
    if (!_102)
    {
        int _981 = ~_971;
        bool _983 = !_106;
        int _985 = _981 & (_983 ? (-1) : 0);
        _979 = _985;
    }
    int _987 = _979;
    float _989 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _991 = _108 != 0;
    float _993 = exp2(_973);
    float _995 = _863 * _831;
    float _997 = _867 * _831;
    float _999 = _861 * _831;
    float _1001 = -_709;
    float _1003 = _1001 + 1.0;
    int _1005 = _987;
    if (_98)
    {
        _1005 = -1;
    }
    int _1007 = _1005;
    int _1009 = ~_987;
    float _1011 = (_1009 != 0) ? as_type<float>(_951) : 0.0;
    int _1013 = _1007;
    if (!_98)
    {
        bool _1015 = !_106;
        bool _1017 = _1015 && _92;
        bool _1019 = !_991;
        bool _1021 = _1017 && _1019;
        _1013 = _1021 ? (-1) : 0;
    }
    int _1023 = _1013;
    int _1025 = ~_987;
    float _1027 = (_1025 != 0) ? as_type<float>(_953) : 0.0;
    int _1029 = ~_987;
    float _1031 = (_1029 != 0) ? as_type<float>(_955) : 0.0;
    bool _1033 = !_106;
    bool _1035 = _92 && _1033;
    int _1037 = ~_1023;
    float _1039 = (_1037 != 0) ? as_type<float>(_957) : 0.0;
    int _1041 = ~_1023;
    float _1043 = (_1041 != 0) ? as_type<float>(_959) : 0.0;
    int _1045 = ~_1023;
    float _1047 = (_1045 != 0) ? as_type<float>(_961) : 0.0;
    int _1049 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1051 = _1049 != 0;
    bool _1053 = !_1035;
    float _1055 = _1053 ? _977 : 0.0;
    float _1057 = -_993;
    float _1059 = _1057 + 1.0;
    bool _1061 = !_1035;
    float _1063 = _1061 ? _989 : 0.0;
    float _1065 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1067 = !_1051;
    float _1069 = _1055 * _1027;
    bool _1071 = !_1051;
    float _1073 = -_1065;
    float _1075 = _1073 + 1.0;
    bool _1077 = !_1067;
    float _1079 = _1077 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1081 = _1055 * _1011;
    bool _1083 = !_1051;
    float _1085 = _1055 * _1031;
    bool _1087 = !_1071;
    float _1089 = _1087 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1091 = abs(_1075);
    float _1093 = log2(_1091);
    float _1095 = fma(_1039, _1063, _1069);
    bool _1097 = !_1083;
    float _1099 = _1097 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1101 = fma(_1043, _1063, _1081);
    float _1103 = fma(_1047, _1063, _1085);
    float _1105 = _1089 * _1095;
    float _1107 = fma(_705, _817, _777);
    float _1109 = _1079 * _1101;
    float _1111 = _1099 * _1103;
    float _1113 = _1105 * 0.715200006961822509765625;
    float _1115 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1117 = _228 * _1115;
    int _1119 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1121 = _1119 != 0;
    float _1123 = fma(_1109, 0.2125999927520751953125, _1113);
    float _1125 = _1107 * _1003;
    float _1127 = _753 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1129 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1131 = fma(_1111, 0.072200000286102294921875, _1123);
    float _1133 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1117);
    float _1135 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1137 = -_1109;
    float _1139 = _1137 + _1131;
    float _1141 = exp2(_1129);
    float _1143 = -_1105;
    float _1145 = _1143 + _1131;
    float _1147 = -_1111;
    float _1149 = _1147 + _1131;
    float _1151 = fma(_1127, _1139, _1109);
    bool _1153 = !_1121;
    float _1155 = fma(_1127, _1145, _1105);
    float _1157 = fma(_1127, _1149, _1111);
    float _1159 = exp2(_1135);
    float _1161 = _1153 ? _995 : 0.0;
    float _1163 = _228 * (-10000.0);
    bool _1165 = !_1121;
    float _1167 = _1165 ? _999 : 0.0;
    bool _1169 = !_88;
    float _1171 = _1169 ? _1141 : 1.0;
    bool _1173 = !_1121;
    int _1175 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1177 = _1175 != 0;
    float _1179 = _871 * _1171;
    float _1181 = _1171 * _1151;
    float _1183 = _1171 * _1155;
    bool _1185 = !_88;
    float _1187 = _1185 ? _1159 : 1.0;
    float _1189 = _1173 ? _997 : 0.0;
    float _1191 = _92 ? _1179 : _1181;
    float _1193 = _1187 * _1161;
    float _1195 = _92 ? _1179 : _1183;
    float _1197 = _1179;
    float _1199 = _1187;
    float _1201 = _1193;
    if (!_92)
    {
        float _1203 = _1171 * _1157;
        _1197 = _1203;
    }
    float _1205 = _1197;
    float _1207 = _1187 * _1189;
    float _1209 = _1187 * _1167;
    float _1211 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1213 = _1195 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1215 = _1125 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1217 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1219 = fma(_1209, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1211);
    float _1221 = fma(_1207, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1213);
    float _1223 = fma(_1193, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1217);
    int _1225 = as_type<int>(_1207);
    float _1227 = _1211;
    float _1229 = _1219;
    float _1231 = _1221;
    float _1233 = _1223;
    if (_88)
    {
        _1225 = as_type<int>(_1215);
    }
    int _1235 = _1225;
    int _1237 = _1235;
    int _1239 = _1235;
    if (_88)
    {
        _1199 = 0.0;
    }
    float _1241 = _1199;
    float _1243 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1245 = _1241;
    if (_88)
    {
        _1201 = 0.0;
    }
    float _1247 = _1201;
    float _1249 = _1247;
    if (_88)
    {
        _1227 = 0.0;
    }
    float _1251 = _1227;
    bool _1253 = !_88;
    float _1255 = _1253 ? _1065 : 0.0;
    float _1257 = _1251;
    if (!_88)
    {
        int _1259 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1261 = _1259 != 0;
        float _1263 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1265 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1267 = _1265 != 0;
        float _1269 = _737 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1271 = _741 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1273 = !_1267;
        float _1275 = _1273 ? _1269 : 0.0;
        bool _1277 = !_1267;
        float _1279 = _1277 ? _1263 : 0.0;
        bool _1281 = !_1267;
        float _1283 = _1281 ? _1271 : 0.0;
        float _1285 = _1255 * _1275;
        _1245 = _1285;
        if (!_1261)
        {
            _1237 = as_type<int>(_1215);
        }
        int _1287 = _1237;
        float _1289 = _1255 * _1279;
        float _1291 = _1255 * _1283;
        bool _1293 = !_1261;
        _1239 = _1287;
        _1257 = _1291;
        _1249 = _1289;
        if (!_1293)
        {
            float _1295 = -_1255;
            float _1297 = _1295 + 1.0;
            float _1299 = precise::clamp(_1297, 0.0, 1.0);
            float _1301 = _1299 * _1215;
            float _1303 = precise::max(_1301, 9.9999997473787516355514526367188e-05);
            float _1305 = 1.0 / _1303;
            float _1307 = _1305 * _1215;
            float _1309 = _1223 * _1307;
            float _1311 = _1221 * _1307;
            float _1313 = _1219 * _1307;
            _1239 = as_type<int>(_1301);
            _1229 = _1313;
            _1257 = 0.0;
            _1231 = _1311;
            _1249 = 0.0;
            _1233 = _1309;
            _1245 = 0.0;
        }
    }
    int _1315 = _1239;
    float _1317 = _1229;
    float _1319 = _1257;
    float _1321 = _1231;
    float _1323 = _1249;
    float _1325 = _1233;
    float _1327 = _1245;
    bool _1329 = !_1177;
    float _1331 = _1329 ? as_type<float>(_1315) : 1.0;
    float _1333 = -_1243;
    float _1335 = exp2(_1333);
    float _1337 = abs(_1163);
    bool _1339 = _1337 > 0.00999999977648258209228515625;
    float _1341 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1133);
    float _1343 = -_1331;
    float _1345 = _1343 + 1.0;
    float _1347 = _1339 ? _1163 : 0.00999999977648258209228515625;
    float _1349 = _1317 + _1319;
    float _1351 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1353 = fma(_1341, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1355 = _731 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1357 = abs(_1345);
    float _1359 = log2(_1357);
    float _1361 = _1347 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1363 = fma(_1353, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1365 = _1321 + _1323;
    int _1367 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1369 = _1367 != 0;
    float _1371 = precise::max(_1361, -127.0);
    float _1373 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1375 = fma(_1373, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1377 = abs(_1363);
    float _1379 = log2(_1377);
    float _1381 = _1359 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1383 = -_1371;
    float _1385 = exp2(_1383);
    float _1387 = _1325 + _1327;
    float _1389 = _1379 * 1.5;
    float _1391 = exp2(_1381);
    float _1393 = _733 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    float _1399 = 1.0 / _1371;
    float _1401 = _1335 * _1397;
    float _1403 = -_1391;
    float _1405 = spvFAdd(_1403, 1.00010001659393310546875);
    float _1407 = -_1391;
    float _1409 = _1407 + 1.0;
    float _1411 = exp2(_1389);
    float _1413 = -_1331;
    float _1415 = _1413 + _1409;
    float _1417 = _1355 * _1415;
    float _1419 = 1.0 / _1405;
    float _1421 = _1351 * _1415;
    float _1423 = _1393 * _1415;
    float _1425 = fma(_1365, _1331, _1417);
    float _1427 = _1401 * _1399;
    float _1429 = fma(_1387, _1331, _1421);
    float _1431 = fma(_1349, _1331, _1423);
    float _1433 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1435 = _1411 * 12.56637096405029296875;
    float _1437 = _1427 * _1433;
    float _1439 = 1.0 / _1435;
    float _1441 = _1419 * _1425;
    float _1443 = _1419 * _1429;
    float _1445 = _1419 * _1431;
    float _1447 = _1441 * 0.715200006961822509765625;
    float _1449 = -_1437;
    float _1451 = exp2(_1449);
    float _1453 = fma(_1443, 0.2125999927520751953125, _1447);
    float _1455 = fma(_1445, 0.072200000286102294921875, _1453);
    float _1457 = _1375 * _1439;
    float _1459 = 1.0 / _1455;
    float _1461 = -_1451;
    float _1463 = _1461 + 1.0;
    float _1465 = _1463 * _1457;
    float _1467 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1469 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1471 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1477 = fma(_1473, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1479 = _1477 * _1451;
    float _1481 = fma(_1443, _1479, _1467);
    float _1483 = fma(_1441, _1479, _1469);
    float _1485 = fma(_1445, _1479, _1475);
    bool _1487 = !_1369;
    float _1489 = _1469;
    float _1491 = _1391;
    float _1493 = _1483;
    int _1495 = as_type<int>(_1391);
    int _1497 = as_type<int>(_1469);
    int _1499 = as_type<int>(_1483);
    if (!_1487)
    {
        bool _1501 = _1409 != 1.0;
        bool _1503 = isnan(_1409);
        bool _1505 = _1501 || _1503;
        bool _1507 = isnan(1.0);
        bool _1509 = _1505 || _1507;
        float _1511 = -_1391;
        bool _1513 = _1511 != (-1.0);
        bool _1515 = isnan(_1511);
        bool _1517 = _1513 || _1515;
        bool _1519 = isnan(-1.0);
        bool _1521 = _1517 || _1519;
        float _1523 = -_1391;
        bool _1525 = _1523 == (-1.0);
        bool _1527 = !_1509;
        bool _1529 = _1525 || _1527;
        bool _1531 = _1409 == 1.0;
        bool _1533 = _1531 && _1521;
        bool _1535 = !_1529;
        float _1537 = _1535 ? _1409 : 0.0;
        bool _1539 = !_1533;
        float _1541 = _1539 ? 0.0 : 1.0;
        float _1543 = _1529 ? 0.0 : 0.5;
        float _1545 = _1537 * 0.715200006961822509765625;
        float _1547 = fma(_1541, 0.2125999927520751953125, _1545);
        float _1549 = fma(_1543, 0.072200000286102294921875, _1547);
        float _1551 = 1.0 / _1549;
        float _1553 = _1551 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        float _1557 = fma(_1555, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1559 = _1541 * _1557;
        float _1561 = _1537 * _1557;
        float _1563 = _1543 * _1557;
        out.m_46.x = _1559;
        out.m_46.y = _1561;
        out.m_46.z = _1563;
        out.m_46.w = 1.0;
        return out;
    }
    bool _1565 = _108 != 0;
    bool _1567 = !_1565;
    if (!_1567)
    {
        if (_98)
        {
            _1489 = 0.0;
        }
        float _1569 = _1489;
        float _1571 = _1569;
        if (_98)
        {
            _1491 = 0.0;
        }
        float _1573 = _1491;
        float _1575 = _1573;
        if (!_98)
        {
            float _1577 = _1039 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1575 = _1577;
        }
        float _1579 = _1575;
        float _1581 = _1579;
        if (!_98)
        {
            float _1583 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1571 = _1583;
        }
        float _1585 = _1571;
        float _1587 = _1585;
        if (!_102)
        {
            float _1589 = fma(_1027, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1579);
            _1581 = _1589;
        }
        float _1591 = _1581;
        if (_98)
        {
            _1493 = 0.0;
        }
        float _1593 = _1493;
        float _1595 = _1593;
        if (!_98)
        {
            float _1597 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1595 = _1597;
        }
        float _1599 = _1595;
        float _1601 = _1591 * 0.715200006961822509765625;
        float _1603 = _1599;
        if (!_102)
        {
            float _1605 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1585);
            _1587 = _1605;
        }
        float _1607 = _1587;
        if (!_102)
        {
            float _1609 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1599);
            _1603 = _1609;
        }
        float _1611 = _1603;
        float _1613 = fma(_1607, 0.2125999927520751953125, _1601);
        float _1615 = fma(_1611, 0.072200000286102294921875, _1613);
        float _1617 = 1.0 / _1615;
        float _1619 = _1617 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        float _1623 = fma(_1621, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1625 = _1623 * _1607;
        float _1627 = _1623 * _1591;
        float _1629 = _1623 * _1611;
        out.m_46.x = _1625;
        out.m_46.y = _1627;
        out.m_46.z = _1629;
        out.m_46.w = 1.0;
        return out;
    }
    if (!_106)
    {
        _1495 = as_type<int>(_1483);
    }
    int _1631 = _1495;
    float _1633 = as_type<float>(_1631);
    if (!_106)
    {
        _1497 = as_type<int>(_1481);
    }
    int _1635 = _1497;
    float _1637 = as_type<float>(_1635);
    if (!_106)
    {
        _1499 = as_type<int>(_1409);
    }
    int _1639 = _1499;
    float _1641 = as_type<float>(_1639);
    if (!_106)
    {
        out.m_46.x = as_type<float>(_1635);
        out.m_46.y = as_type<float>(_1631);
        out.m_46.z = _1485;
        out.m_46.w = as_type<float>(_1639);
        return out;
    }
    if (_98)
    {
        _1637 = 0.0;
    }
    float _1643 = _1637;
    float _1645 = _1643;
    if (_98)
    {
        _1633 = 0.0;
    }
    float _1647 = _1633;
    float _1649 = _1647;
    if (!_98)
    {
        float _1651 = _1039 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1649 = _1651;
    }
    float _1653 = _1649;
    float _1655 = _1653;
    if (!_98)
    {
        float _1657 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1645 = _1657;
    }
    float _1659 = _1645;
    float _1661 = _1659;
    if (!_102)
    {
        float _1663 = fma(_1027, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1653);
        _1655 = _1663;
    }
    float _1665 = _1655;
    if (_98)
    {
        _1641 = 0.0;
    }
    float _1667 = _1641;
    float _1669 = _1667;
    if (!_98)
    {
        float _1671 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1669 = _1671;
    }
    float _1673 = _1669;
    float _1675 = _1665 * 0.715200006961822509765625;
    float _1677 = _1673;
    if (!_102)
    {
        float _1679 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1659);
        _1661 = _1679;
    }
    float _1681 = _1661;
    if (!_102)
    {
        float _1683 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1673);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = fma(_1681, 0.2125999927520751953125, _1675);
    float _1689 = fma(_1685, 0.072200000286102294921875, _1687);
    float _1691 = 1.0 / _1689;
    float _1693 = _1691 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = fma(_1695, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1699 = _1697 * _1681;
    float _1701 = _1697 * _1665;
    float _1703 = _1697 * _1685;
    out.m_46.x = _1699;
    out.m_46.y = _1701;
    out.m_46.z = _1703;
    out.m_46.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_46 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _901 = false;
    bool _276 = false;
    float _58 = gl_FragCoord.w;
    float _60 = in.m_43.y;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_43.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_43.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    int _78 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _82 = _78 != 0;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _86 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _88 = _86 != 0;
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _92 = _90 != 0;
    float _94 = precise::max(0.0, _84);
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_82);
    float _110 = 1.0 / _58;
    float _112 = _110 * _64;
    float _114 = _110 * _70;
    float _116 = _110 * _76;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = fma(_116, _116, _120);
    float _124 = rsqrt(_122);
    float _126 = _114 * _124;
    float _128 = _116 * _124;
    float _130 = _112 * _124;
    float _132 = _126 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _136 = -_130;
    float _138 = -_94;
    float _140 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[13].z, _138);
    float _142 = _132 * _132;
    float _144 = _134 * _134;
    float _146 = _142 + _144;
    float _148 = sqrt(_146);
    bool _150 = _148 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _152 = _94;
    float _154 = _124;
    float _156 = _140;
    float _158 = _132;
    float _160 = _134;
    if (!_150)
    {
        _152 = _144;
    }
    float _162 = _152;
    float _164 = _162;
    if (!_150)
    {
        _154 = _142;
    }
    float _166 = _154;
    bool _168 = !_150;
    float _170 = _166;
    if (!_168)
    {
        float _172 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _174 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _176 = _148 + _174;
        float _178 = _140 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = rsqrt(_146);
        float _182 = _176 * _172;
        float _184 = _182 * 0.15915493667125701904296875;
        float _186 = _184 * 6.283185482025146484375;
        float _188 = sin(_186);
        float _190 = _184 * 6.283185482025146484375;
        float _192 = cos(_190);
        float _194 = fma(_188, _178, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _196 = _180 * _194;
        float _198 = _192 + (-1.0);
        float _200 = _132 * _196;
        float _202 = _134 * _196;
        float _204 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _206 = _202 * _202;
        float _208 = fma(_140, _192, _204);
        float _210 = _200 * _200;
        _156 = _208;
        _170 = _210;
        _164 = _206;
        _158 = _200;
        _160 = _202;
    }
    float _212 = _156;
    float _214 = _170;
    float _216 = _164;
    float _218 = _158;
    float _220 = _160;
    float _222 = fma(_212, _212, _214);
    float _224 = _222 + _216;
    float _226 = rsqrt(_224);
    float _228 = _226 * _212;
    float _230 = _226 * _218;
    float _232 = _226 * _220;
    float _234 = -_228;
    float _236 = precise::max(0.0, _234);
    float _238 = abs(_236);
    float _240 = -_238;
    float _242 = _240 + 1.0;
    float _244 = fma(_236, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _246 = as_type<int>(_242) + (-218103808);
    float _248 = fma(_236, _244, -0.212114393711090087890625);
    bool _250 = uint(_246) >= 1920991232u;
    float _252 = fma(_236, _248, 1.570728778839111328125);
    bool _254 = !_250;
    float _274;
    if (!_254)
    {
        int _256 = 0;
        int _258 = as_type<int>(_242);
        int _260 = 0;
        int _262 = 1232;
        int _264;
        int _266;
        int _268;
        int _270;
        int _272;
        _54(_256, _258, _260, _262, _264, _266, _268, _270, _272);
        _274 = as_type<float>(_264);
        _276 = true;
    }
    else
    {
        float _278 = rsqrt(_242);
        float _280 = _242 * _278;
        float _282 = _278 * 0.5;
        float _284 = -_280;
        float _286 = 0.0 + _284;
        float _288 = fma(_282, _286, 0.5);
        float _290 = fma(_280, _288, _280);
        float _292 = -_290;
        float _294 = 0.0 + _292;
        float _296 = fma(_290, _294, _242);
        float _298 = fma(_282, _296, _290);
        _274 = _298;
    }
    _276 = false;
    float _300 = _274;
    bool _302 = _228 > 0.0;
    float _304 = _128 * _128;
    float _306 = _126 * _126;
    float _308 = _304 + _306;
    if (_302)
    {
        discard_fragment();
    }
    float _310 = rsqrt(_308);
    float _312 = _252 * _300;
    float _314 = _312 * 0.636619746685028076171875;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = -_316;
    float _320 = _318 + 1.0;
    float _322 = sqrt(_320);
    float _324 = _128 * _310;
    float _326 = _126 * _310;
    float _328 = abs(_324);
    float _330 = abs(_326);
    float _332 = precise::max(_328, _330);
    float _334 = precise::max(_332, 9.9999997473787516355514526367188e-05);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = 1.0 / _334;
    float _342 = _338 * 0.5;
    float _344 = -_340;
    float _346 = _324 * _344;
    float _348 = _326 * _340;
    float _350 = fma(_346, _342, 0.5);
    float _352 = fma(_348, _342, 0.5);
    if (_302)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    float2 _2123;
    _2123.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_350, _352));
    _2123.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_350, _352));
    float _354 = _2123.x;
    float _356 = _354 * 256.0;
    int _358 = int(_356);
    float _360 = float(uint(_358));
    float _362 = _360 * 0.00390625;
    float2 _2139 = float2(_350, _352);
    float4 _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2139, float2(0.0), isnan(_2139)), level(_362)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2139, float2(0.0), isnan(_2139)), level(_362)).xyzw;
    float _367 = _365.x;
    float _369 = _365.y;
    float _371 = _365.z;
    float _373 = _365.w;
    float2 _2158 = float2(_350, _352);
    float2 _377 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2158, float2(0.0), isnan(_2158)), level(_362)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2158, float2(0.0), isnan(_2158)), level(_362)).xy;
    float _379 = _377.x;
    float _381 = _377.y;
    float _383 = -_130;
    float _385 = _383 + 1.0;
    float _387 = precise::clamp(_385, 0.0, 1.0);
    float _389 = -_130;
    float _391 = fma(_389, _130, 1.0);
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _126 * _130;
    int _397 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _399 = _397 != 0;
    float _401 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    int _403 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _405 = _403 != 0;
    float _407 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _409 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _411 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _413 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _415 = fma(_130, _409, _407);
    float _417 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _419 = _387;
    if (_399)
    {
        float _421 = sqrt(_393);
        _419 = _421;
    }
    float _423 = _419;
    float _425 = fma(_304, 3.0, -1.0);
    float _427 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _429 = -_128;
    float _431 = fma(_429, _417, _415);
    float _433 = fma(_128, _417, _415);
    float _435 = fma(_130, _413, _401);
    float _437 = fma(_130, _427, _411);
    float _439 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _441 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _443 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _445 = -_126;
    float _447 = fma(_445, _439, _431);
    float _449 = fma(_126, _439, _433);
    float _451 = _128 * (-3.0);
    float _453 = -_128;
    float _455 = fma(_453, _441, _435);
    float _457 = fma(_128, _441, _435);
    float _459 = abs(_423);
    float _461 = log2(_459);
    float _463 = -_128;
    float _465 = fma(_463, _443, _437);
    float _467 = fma(_128, _443, _437);
    float _469 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _471 = -_130;
    float _473 = fma(_471, _130, _306);
    float _475 = _126 * _128;
    float _477 = -_128;
    float _479 = _130 * _477;
    float _481 = -_128;
    float _483 = fma(_481, _451, -1.0);
    float _485 = _130 * _128;
    float _487 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _489 = -_126;
    float _491 = fma(_489, _469, _455);
    float _493 = fma(_126, _469, _457);
    float _495 = -_130;
    float _497 = _126 * _495;
    float _499 = -_126;
    float _501 = fma(_499, _487, _465);
    float _503 = fma(_126, _487, _467);
    float _505 = _461 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _507 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _509 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _511 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _513 = exp2(_505);
    float _515 = fma(_507, _497, _447);
    float _517 = fma(_509, _497, _491);
    float _519 = fma(_511, _497, _501);
    float _521 = fma(_511, _395, _503);
    float _523 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _525 = fma(_507, _395, _449);
    float _527 = fma(_509, _395, _493);
    float _529 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _531 = fma(_523, _479, _515);
    float _533 = fma(_523, _485, _525);
    float _535 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _537 = fma(_529, _479, _517);
    float _539 = fma(_529, _485, _527);
    float _541 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _543 = _513 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _545 = fma(_535, _479, _519);
    float _547 = fma(_535, _485, _521);
    float _549 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _551 = fma(_543, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _553 = precise::clamp(_551, 0.0, 1.0);
    float _555 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _557 = fma(_541, _475, _531);
    float _559 = -_553;
    float _561 = _559 + 1.0;
    float _563 = fma(_549, _475, _539);
    float _565 = fma(_541, _475, _533);
    float _567 = fma(_549, _475, _537);
    float _569 = abs(_561);
    float _571 = log2(_569);
    float _573 = fma(_555, _475, _545);
    float _575 = fma(_555, _475, _547);
    float _577 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _579 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _581 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _583 = fma(_577, _483, _567);
    float _585 = _230 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _587 = fma(_579, _483, _573);
    float _589 = fma(_577, _425, _563);
    float _591 = -_585;
    float _593 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[11].y, _591);
    float _595 = fma(_581, _425, _565);
    float _597 = fma(_581, _483, _557);
    float _599 = fma(_579, _425, _575);
    float _601 = _571 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _603 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _605 = in.m_48.x;
    float _607 = gl_FragCoord.w;
    float _609 = _605 * _607;
    float _611 = in.m_48.y;
    float _613 = gl_FragCoord.w;
    float _615 = _611 * _613;
    float _617 = exp2(_601);
    float _619 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _621 = -_232;
    float _623 = fma(_621, (*spvDescriptorSet0.fp_c3)._m0[11].z, _593);
    float _625 = fma(_603, _473, _597);
    float _627 = fma(_603, _473, _595);
    float _629 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _631 = fma(_623, -0.5, 0.5);
    float _633 = fma(_619, _473, _583);
    float _635 = fma(_619, _473, _589);
    float _637 = _228 + 1.0;
    float _639 = fma(_629, _473, _587);
    float _641 = fma(_629, _473, _599);
    float _643 = fma(_623, 0.5, 0.5);
    float _645 = sqrt(_631);
    float _647 = -_228;
    float _649 = fma(_617, _637, _647);
    float _651 = fma(_643, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _653 = fma(_649, 0.5, 0.5);
    float _655 = fma(_643, _651, -0.212114393711090087890625);
    float _657 = fma(_643, _655, 1.570728778839111328125);
    float _659 = _645 * 0.636619746685028076171875;
    float _661 = _110 * _609;
    float _663 = _110 * _615;
    float _665 = -_657;
    float _667 = fma(_659, _665, 1.0);
    float _669 = fma(_228, -0.5, 0.5);
    float _671 = _373 * _373;
    float _673 = _671 * _671;
    float _675 = _673 * 16.0;
    float _677 = _675 * _381;
    float _679 = _367 * _677;
    float _681 = _369 * _677;
    float _683 = _371 * _677;
    float2 _2657 = float2(_350, _352);
    float4 _685 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2657, float2(0.0), isnan(_2657)), level(_362)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2657, float2(0.0), isnan(_2657)), level(_362)).xyzw;
    float _687 = _685.x;
    float _689 = _685.y;
    float _691 = _685.z;
    float _693 = _685.w;
    float2 _2674 = float2(_350, _352);
    float2 _695 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2674, float2(0.0), isnan(_2674)), level(_362)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2674, float2(0.0), isnan(_2674)), level(_362)).xy;
    float _697 = _695.x;
    float _699 = _695.y;
    float2 _2687 = float2(_661, _663);
    float3 _703 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2687, float2(0.0), isnan(_2687))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2687, float2(0.0), isnan(_2687))).xyz;
    float _705 = _703.x;
    float _707 = _703.y;
    float _709 = _703.z;
    float2 _2701 = float2(_350, _352);
    float2 _711 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2701, float2(0.0), isnan(_2701)), level(_362)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2701, float2(0.0), isnan(_2701)), level(_362)).xy;
    float _713 = _711.x;
    float _715 = _711.y;
    float2 _2714 = float2(_350, _352);
    float4 _717 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2714, float2(0.0), isnan(_2714)), level(_362)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2714, float2(0.0), isnan(_2714)), level(_362)).xyzw;
    float _719 = _717.x;
    float _721 = _717.y;
    float _723 = _717.z;
    float _725 = _717.w;
    float2 _2731 = float2(_667, _669);
    float3 _727 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2731, float2(0.0), isnan(_2731))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2731, float2(0.0), isnan(_2731))).xyz;
    float _729 = _727.x;
    float _731 = _727.y;
    float _733 = _727.z;
    float2 _2745 = float2(_667, _653);
    float3 _735 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2745, float2(0.0), isnan(_2745))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2745, float2(0.0), isnan(_2745))).xyz;
    float _737 = _735.x;
    float _739 = _735.y;
    float _741 = _735.z;
    int _743 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _745 = _743 != 0;
    float _747 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _749 = _747 + 1.0;
    float _751 = _693 * _693;
    float _753 = _705 * _707;
    float _755 = _751 * _751;
    float _757 = _379 * _381;
    float _759 = _725 * _725;
    float _761 = _755 * 16.0;
    float _763 = -_757;
    float _765 = fma(_697, _699, _763);
    float _767 = -_381;
    float _769 = _767 + _699;
    float _771 = _759 * _759;
    float _773 = _761 * _699;
    float _775 = fma(_765, (*spvDescriptorSet0.fp_c3)._m0[0].x, _757);
    float _777 = fma(_769, (*spvDescriptorSet0.fp_c3)._m0[0].x, _381);
    float _779 = -_679;
    float _781 = fma(_687, _773, _779);
    float _783 = -_681;
    float _785 = fma(_689, _773, _783);
    float _787 = -_683;
    float _789 = fma(_691, _773, _787);
    float _791 = fma(_781, (*spvDescriptorSet0.fp_c3)._m0[0].x, _679);
    float _793 = precise::max(_777, 1.52587890625e-05);
    float _795 = fma(_785, (*spvDescriptorSet0.fp_c3)._m0[0].x, _681);
    float _797 = fma(_789, (*spvDescriptorSet0.fp_c3)._m0[0].x, _683);
    float _799 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _801 = _799 + 1.0;
    float _803 = -_753;
    float _805 = _803 + 1.0;
    float _807 = _771 * 16.0;
    float _809 = 1.0 / _793;
    float _811 = fma(_805, _801, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _813 = fma(_805, _749, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _815 = -_777;
    float _817 = _815 + _715;
    float _819 = _807 * _811;
    float _821 = _713 * _813;
    float _823 = fma(_705, _817, _777);
    float _825 = _723 * _819;
    float _827 = precise::max(_823, 1.52587890625e-05);
    float _829 = _777 * _809;
    float _831 = 1.0 / _827;
    float _833 = _775 * _829;
    float _835 = _791 * _829;
    float _837 = _795 * _829;
    float _839 = _797 * _829;
    float _841 = -_833;
    float _843 = fma(_715, _821, _841);
    float _845 = _715 * _819;
    float _847 = -_839;
    float _849 = fma(_715, _825, _847);
    float _851 = fma(_705, _843, _833);
    float _853 = -_835;
    float _855 = fma(_719, _845, _853);
    float _857 = -_837;
    float _859 = fma(_721, _845, _857);
    float _861 = fma(_705, _849, _839);
    float _863 = fma(_705, _855, _835);
    float _865 = _851 * _831;
    float _867 = fma(_705, _859, _837);
    bool _869 = !_405;
    float _871 = _869 ? _865 : 0.0;
    bool _873 = !_745;
    int _875 = _745 ? (-1) : 0;
    int _889;
    int _891;
    int _893;
    int _895;
    int _897;
    int _899;
    if (!_873)
    {
        float _877 = _447 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _879 = _491 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _881 = _501 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _883 = _449 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _885 = _493 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _887 = _503 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _889 = as_type<int>(_883);
        _891 = as_type<int>(_885);
        _893 = as_type<int>(_887);
        _895 = as_type<int>(_879);
        _897 = as_type<int>(_877);
        _899 = as_type<int>(_881);
        _901 = true;
    }
    else
    {
        int _903 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _905 = _903 != 0;
        float _907 = _639 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _909 = _625 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _911 = _633 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _913 = _627 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _915 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
        float _917 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _919 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _921 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _923 = as_type<int>(_907);
        int _925 = as_type<int>(_909);
        int _927 = as_type<int>(_911);
        int _929 = as_type<int>(_921);
        int _931 = as_type<int>(_913);
        _875 = _905 ? (-1) : 0;
        _891 = as_type<int>(_919);
        if (_905)
        {
            float _933 = _411 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _923 = as_type<int>(_933);
        }
        int _935 = _923;
        _899 = _935;
        if (_905)
        {
            float _937 = _915 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _925 = as_type<int>(_937);
        }
        int _939 = _925;
        _897 = _939;
        if (_905)
        {
            float _941 = _917 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _927 = as_type<int>(_941);
        }
        int _943 = _927;
        _895 = _943;
        if (_905)
        {
            _929 = _935;
        }
        int _945 = _929;
        _893 = _945;
        if (_905)
        {
            _931 = _939;
        }
        int _947 = _931;
        _889 = _947;
        if (_905)
        {
            _891 = _943;
        }
    }
    _901 = false;
    int _949 = _875;
    int _951 = _889;
    int _953 = _891;
    int _955 = _893;
    int _957 = _895;
    int _959 = _897;
    int _961 = _899;
    int _963 = 0;
    int _965 = _949;
    if (!_102)
    {
        int _967 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _969 = _967 != 0;
        _963 = _969 ? (-1) : 0;
    }
    int _971 = _963;
    float _973 = _571 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_102)
    {
        _965 = -1;
    }
    int _975 = _965;
    float _977 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _979 = _975;
    if (!_102)
    {
        int _981 = ~_971;
        bool _983 = !_106;
        int _985 = _981 & (_983 ? (-1) : 0);
        _979 = _985;
    }
    int _987 = _979;
    float _989 = _871 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    bool _991 = _108 != 0;
    float _993 = exp2(_973);
    float _995 = _863 * _831;
    float _997 = _867 * _831;
    float _999 = _861 * _831;
    float _1001 = -_709;
    float _1003 = _1001 + 1.0;
    int _1005 = _987;
    if (_98)
    {
        _1005 = -1;
    }
    int _1007 = _1005;
    int _1009 = ~_987;
    float _1011 = (_1009 != 0) ? as_type<float>(_951) : 0.0;
    int _1013 = _1007;
    if (!_98)
    {
        bool _1015 = !_106;
        bool _1017 = _1015 && _92;
        bool _1019 = !_991;
        bool _1021 = _1017 && _1019;
        _1013 = _1021 ? (-1) : 0;
    }
    int _1023 = _1013;
    int _1025 = ~_987;
    float _1027 = (_1025 != 0) ? as_type<float>(_953) : 0.0;
    int _1029 = ~_987;
    float _1031 = (_1029 != 0) ? as_type<float>(_955) : 0.0;
    bool _1033 = !_106;
    bool _1035 = _92 && _1033;
    int _1037 = ~_1023;
    float _1039 = (_1037 != 0) ? as_type<float>(_957) : 0.0;
    int _1041 = ~_1023;
    float _1043 = (_1041 != 0) ? as_type<float>(_959) : 0.0;
    int _1045 = ~_1023;
    float _1047 = (_1045 != 0) ? as_type<float>(_961) : 0.0;
    int _1049 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1051 = _1049 != 0;
    bool _1053 = !_1035;
    float _1055 = _1053 ? _977 : 0.0;
    float _1057 = -_993;
    float _1059 = _1057 + 1.0;
    bool _1061 = !_1035;
    float _1063 = _1061 ? _989 : 0.0;
    float _1065 = _1059 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1067 = !_1051;
    float _1069 = _1055 * _1027;
    bool _1071 = !_1051;
    float _1073 = -_1065;
    float _1075 = _1073 + 1.0;
    bool _1077 = !_1067;
    float _1079 = _1077 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1081 = _1055 * _1011;
    bool _1083 = !_1051;
    float _1085 = _1055 * _1031;
    bool _1087 = !_1071;
    float _1089 = _1087 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1091 = abs(_1075);
    float _1093 = log2(_1091);
    float _1095 = fma(_1039, _1063, _1069);
    bool _1097 = !_1083;
    float _1099 = _1097 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1101 = fma(_1043, _1063, _1081);
    float _1103 = fma(_1047, _1063, _1085);
    float _1105 = _1089 * _1095;
    float _1107 = fma(_705, _817, _777);
    float _1109 = _1079 * _1101;
    float _1111 = _1099 * _1103;
    float _1113 = _1105 * 0.715200006961822509765625;
    float _1115 = -(*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _1117 = _228 * _1115;
    int _1119 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1121 = _1119 != 0;
    float _1123 = fma(_1109, 0.2125999927520751953125, _1113);
    float _1125 = _1107 * _1003;
    float _1127 = _753 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1129 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1131 = fma(_1111, 0.072200000286102294921875, _1123);
    float _1133 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[26].x, _1117);
    float _1135 = _1093 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1137 = -_1109;
    float _1139 = _1137 + _1131;
    float _1141 = exp2(_1129);
    float _1143 = -_1105;
    float _1145 = _1143 + _1131;
    float _1147 = -_1111;
    float _1149 = _1147 + _1131;
    float _1151 = fma(_1127, _1139, _1109);
    bool _1153 = !_1121;
    float _1155 = fma(_1127, _1145, _1105);
    float _1157 = fma(_1127, _1149, _1111);
    float _1159 = exp2(_1135);
    float _1161 = _1153 ? _995 : 0.0;
    float _1163 = _228 * (-10000.0);
    bool _1165 = !_1121;
    float _1167 = _1165 ? _999 : 0.0;
    bool _1169 = !_88;
    float _1171 = _1169 ? _1141 : 1.0;
    bool _1173 = !_1121;
    int _1175 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1177 = _1175 != 0;
    float _1179 = _871 * _1171;
    float _1181 = _1171 * _1151;
    float _1183 = _1171 * _1155;
    bool _1185 = !_88;
    float _1187 = _1185 ? _1159 : 1.0;
    float _1189 = _1173 ? _997 : 0.0;
    float _1191 = _92 ? _1179 : _1181;
    float _1193 = _1187 * _1161;
    float _1195 = _92 ? _1179 : _1183;
    float _1197 = _1179;
    float _1199 = _1187;
    float _1201 = _1193;
    if (!_92)
    {
        float _1203 = _1171 * _1157;
        _1197 = _1203;
    }
    float _1205 = _1197;
    float _1207 = _1187 * _1189;
    float _1209 = _1187 * _1167;
    float _1211 = _1205 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1213 = _1195 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1215 = _1125 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _1217 = _1191 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1219 = fma(_1209, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1211);
    float _1221 = fma(_1207, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1213);
    float _1223 = fma(_1193, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1217);
    int _1225 = as_type<int>(_1207);
    float _1227 = _1211;
    float _1229 = _1219;
    float _1231 = _1221;
    float _1233 = _1223;
    if (_88)
    {
        _1225 = as_type<int>(_1215);
    }
    int _1235 = _1225;
    int _1237 = _1235;
    int _1239 = _1235;
    if (_88)
    {
        _1199 = 0.0;
    }
    float _1241 = _1199;
    float _1243 = (*spvDescriptorSet0.fp_c3)._m0[24].x * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _1245 = _1241;
    if (_88)
    {
        _1201 = 0.0;
    }
    float _1247 = _1201;
    float _1249 = _1247;
    if (_88)
    {
        _1227 = 0.0;
    }
    float _1251 = _1227;
    bool _1253 = !_88;
    float _1255 = _1253 ? _1065 : 0.0;
    float _1257 = _1251;
    if (!_88)
    {
        int _1259 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1261 = _1259 != 0;
        float _1263 = _739 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1265 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1267 = _1265 != 0;
        float _1269 = _737 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1271 = _741 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1273 = !_1267;
        float _1275 = _1273 ? _1269 : 0.0;
        bool _1277 = !_1267;
        float _1279 = _1277 ? _1263 : 0.0;
        bool _1281 = !_1267;
        float _1283 = _1281 ? _1271 : 0.0;
        float _1285 = _1255 * _1275;
        _1245 = _1285;
        if (!_1261)
        {
            _1237 = as_type<int>(_1215);
        }
        int _1287 = _1237;
        float _1289 = _1255 * _1279;
        float _1291 = _1255 * _1283;
        bool _1293 = !_1261;
        _1239 = _1287;
        _1257 = _1291;
        _1249 = _1289;
        if (!_1293)
        {
            float _1295 = -_1255;
            float _1297 = _1295 + 1.0;
            float _1299 = precise::clamp(_1297, 0.0, 1.0);
            float _1301 = _1299 * _1215;
            float _1303 = precise::max(_1301, 9.9999997473787516355514526367188e-05);
            float _1305 = 1.0 / _1303;
            float _1307 = _1305 * _1215;
            float _1309 = _1223 * _1307;
            float _1311 = _1221 * _1307;
            float _1313 = _1219 * _1307;
            _1239 = as_type<int>(_1301);
            _1229 = _1313;
            _1257 = 0.0;
            _1231 = _1311;
            _1249 = 0.0;
            _1233 = _1309;
            _1245 = 0.0;
        }
    }
    int _1315 = _1239;
    float _1317 = _1229;
    float _1319 = _1257;
    float _1321 = _1231;
    float _1323 = _1249;
    float _1325 = _1233;
    float _1327 = _1245;
    bool _1329 = !_1177;
    float _1331 = _1329 ? as_type<float>(_1315) : 1.0;
    float _1333 = -_1243;
    float _1335 = exp2(_1333);
    float _1337 = abs(_1163);
    bool _1339 = _1337 > 0.00999999977648258209228515625;
    float _1341 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[26].z, _1133);
    float _1343 = -_1331;
    float _1345 = _1343 + 1.0;
    float _1347 = _1339 ? _1163 : 0.00999999977648258209228515625;
    float _1349 = _1317 + _1319;
    float _1351 = _729 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1353 = fma(_1341, 2.0, (*spvDescriptorSet0.fp_c3)._m0[24].w);
    float _1355 = _731 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1357 = abs(_1345);
    float _1359 = log2(_1357);
    float _1361 = _1347 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _1363 = fma(_1353, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1365 = _1321 + _1323;
    int _1367 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1369 = _1367 != 0;
    float _1371 = precise::max(_1361, -127.0);
    float _1373 = -(*spvDescriptorSet0.fp_c3)._m0[24].w;
    float _1375 = fma(_1373, (*spvDescriptorSet0.fp_c3)._m0[24].w, 1.0);
    float _1377 = abs(_1363);
    float _1379 = log2(_1377);
    float _1381 = _1359 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1383 = -_1371;
    float _1385 = exp2(_1383);
    float _1387 = _1325 + _1327;
    float _1389 = _1379 * 1.5;
    float _1391 = exp2(_1381);
    float _1393 = _733 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1395 = -_1385;
    float _1397 = _1395 + 1.0;
    float _1399 = 1.0 / _1371;
    float _1401 = _1335 * _1397;
    float _1403 = -_1391;
    float _1405 = spvFAdd(_1403, 1.00010001659393310546875);
    float _1407 = -_1391;
    float _1409 = _1407 + 1.0;
    float _1411 = exp2(_1389);
    float _1413 = -_1331;
    float _1415 = _1413 + _1409;
    float _1417 = _1355 * _1415;
    float _1419 = 1.0 / _1405;
    float _1421 = _1351 * _1415;
    float _1423 = _1393 * _1415;
    float _1425 = fma(_1365, _1331, _1417);
    float _1427 = _1401 * _1399;
    float _1429 = fma(_1387, _1331, _1421);
    float _1431 = fma(_1349, _1331, _1423);
    float _1433 = (*spvDescriptorSet0.fp_c3)._m0[24].z * 10000.0;
    float _1435 = _1411 * 12.56637096405029296875;
    float _1437 = _1427 * _1433;
    float _1439 = 1.0 / _1435;
    float _1441 = _1419 * _1425;
    float _1443 = _1419 * _1429;
    float _1445 = _1419 * _1431;
    float _1447 = _1441 * 0.715200006961822509765625;
    float _1449 = -_1437;
    float _1451 = exp2(_1449);
    float _1453 = fma(_1443, 0.2125999927520751953125, _1447);
    float _1455 = fma(_1445, 0.072200000286102294921875, _1453);
    float _1457 = _1375 * _1439;
    float _1459 = 1.0 / _1455;
    float _1461 = -_1451;
    float _1463 = _1461 + 1.0;
    float _1465 = _1463 * _1457;
    float _1467 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].x;
    float _1469 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _1471 = _1459 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1473 = precise::clamp(_1471, 0.0, 1.0);
    float _1475 = _1465 * (*spvDescriptorSet0.fp_c3)._m0[25].z;
    float _1477 = fma(_1473, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1479 = _1477 * _1451;
    float _1481 = fma(_1443, _1479, _1467);
    float _1483 = fma(_1441, _1479, _1469);
    float _1485 = fma(_1445, _1479, _1475);
    bool _1487 = !_1369;
    float _1489 = _1469;
    float _1491 = _1391;
    float _1493 = _1483;
    int _1495 = as_type<int>(_1391);
    int _1497 = as_type<int>(_1469);
    int _1499 = as_type<int>(_1483);
    if (!_1487)
    {
        bool _1501 = _1409 != 1.0;
        bool _1503 = isnan(_1409);
        bool _1505 = _1501 || _1503;
        bool _1507 = isnan(1.0);
        bool _1509 = _1505 || _1507;
        float _1511 = -_1391;
        bool _1513 = _1511 != (-1.0);
        bool _1515 = isnan(_1511);
        bool _1517 = _1513 || _1515;
        bool _1519 = isnan(-1.0);
        bool _1521 = _1517 || _1519;
        float _1523 = -_1391;
        bool _1525 = _1523 == (-1.0);
        bool _1527 = !_1509;
        bool _1529 = _1525 || _1527;
        bool _1531 = _1409 == 1.0;
        bool _1533 = _1531 && _1521;
        bool _1535 = !_1529;
        float _1537 = _1535 ? _1409 : 0.0;
        bool _1539 = !_1533;
        float _1541 = _1539 ? 0.0 : 1.0;
        float _1543 = _1529 ? 0.0 : 0.5;
        float _1545 = _1537 * 0.715200006961822509765625;
        float _1547 = fma(_1541, 0.2125999927520751953125, _1545);
        float _1549 = fma(_1543, 0.072200000286102294921875, _1547);
        float _1551 = 1.0 / _1549;
        float _1553 = _1551 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1555 = precise::clamp(_1553, 0.0, 1.0);
        float _1557 = fma(_1555, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1559 = _1541 * _1557;
        float _1561 = _1537 * _1557;
        float _1563 = _1543 * _1557;
        out.m_46.x = _1559;
        out.m_46.y = _1561;
        out.m_46.z = _1563;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    bool _1565 = _108 != 0;
    bool _1567 = !_1565;
    if (!_1567)
    {
        if (_98)
        {
            _1489 = 0.0;
        }
        float _1569 = _1489;
        float _1571 = _1569;
        if (_98)
        {
            _1491 = 0.0;
        }
        float _1573 = _1491;
        float _1575 = _1573;
        if (!_98)
        {
            float _1577 = _1039 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1575 = _1577;
        }
        float _1579 = _1575;
        float _1581 = _1579;
        if (!_98)
        {
            float _1583 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1571 = _1583;
        }
        float _1585 = _1571;
        float _1587 = _1585;
        if (!_102)
        {
            float _1589 = fma(_1027, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1579);
            _1581 = _1589;
        }
        float _1591 = _1581;
        if (_98)
        {
            _1493 = 0.0;
        }
        float _1593 = _1493;
        float _1595 = _1593;
        if (!_98)
        {
            float _1597 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1595 = _1597;
        }
        float _1599 = _1595;
        float _1601 = _1591 * 0.715200006961822509765625;
        float _1603 = _1599;
        if (!_102)
        {
            float _1605 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1585);
            _1587 = _1605;
        }
        float _1607 = _1587;
        if (!_102)
        {
            float _1609 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1599);
            _1603 = _1609;
        }
        float _1611 = _1603;
        float _1613 = fma(_1607, 0.2125999927520751953125, _1601);
        float _1615 = fma(_1611, 0.072200000286102294921875, _1613);
        float _1617 = 1.0 / _1615;
        float _1619 = _1617 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1621 = precise::clamp(_1619, 0.0, 1.0);
        float _1623 = fma(_1621, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1625 = _1623 * _1607;
        float _1627 = _1623 * _1591;
        float _1629 = _1623 * _1611;
        out.m_46.x = _1625;
        out.m_46.y = _1627;
        out.m_46.z = _1629;
        out.m_46.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (!_106)
    {
        _1495 = as_type<int>(_1483);
    }
    int _1631 = _1495;
    float _1633 = as_type<float>(_1631);
    if (!_106)
    {
        _1497 = as_type<int>(_1481);
    }
    int _1635 = _1497;
    float _1637 = as_type<float>(_1635);
    if (!_106)
    {
        _1499 = as_type<int>(_1409);
    }
    int _1639 = _1499;
    float _1641 = as_type<float>(_1639);
    if (!_106)
    {
        out.m_46.x = as_type<float>(_1635);
        out.m_46.y = as_type<float>(_1631);
        out.m_46.z = _1485;
        out.m_46.w = as_type<float>(_1639);
        return main0_out_u{as_type<uint4>(out.m_46)};
    }
    if (_98)
    {
        _1637 = 0.0;
    }
    float _1643 = _1637;
    float _1645 = _1643;
    if (_98)
    {
        _1633 = 0.0;
    }
    float _1647 = _1633;
    float _1649 = _1647;
    if (!_98)
    {
        float _1651 = _1039 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1649 = _1651;
    }
    float _1653 = _1649;
    float _1655 = _1653;
    if (!_98)
    {
        float _1657 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1645 = _1657;
    }
    float _1659 = _1645;
    float _1661 = _1659;
    if (!_102)
    {
        float _1663 = fma(_1027, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1653);
        _1655 = _1663;
    }
    float _1665 = _1655;
    if (_98)
    {
        _1641 = 0.0;
    }
    float _1667 = _1641;
    float _1669 = _1667;
    if (!_98)
    {
        float _1671 = _1047 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1669 = _1671;
    }
    float _1673 = _1669;
    float _1675 = _1665 * 0.715200006961822509765625;
    float _1677 = _1673;
    if (!_102)
    {
        float _1679 = fma(_1011, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1659);
        _1661 = _1679;
    }
    float _1681 = _1661;
    if (!_102)
    {
        float _1683 = fma(_1031, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1673);
        _1677 = _1683;
    }
    float _1685 = _1677;
    float _1687 = fma(_1681, 0.2125999927520751953125, _1675);
    float _1689 = fma(_1685, 0.072200000286102294921875, _1687);
    float _1691 = 1.0 / _1689;
    float _1693 = _1691 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    float _1697 = fma(_1695, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1699 = _1697 * _1681;
    float _1701 = _1697 * _1665;
    float _1703 = _1697 * _1685;
    out.m_46.x = _1699;
    out.m_46.y = _1701;
    out.m_46.z = _1703;
    out.m_46.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_46)};
}

