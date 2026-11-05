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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_E [[id(11)]];
    sampler fp_t_tcb_ESmplr [[id(12)]];
    texture2d<float> fp_t_tcb_16 [[id(13)]];
    sampler fp_t_tcb_16Smplr [[id(14)]];
    texture2d<float> fp_t_tcb_14 [[id(15)]];
    sampler fp_t_tcb_14Smplr [[id(16)]];
    texture2d<float> fp_t_tcb_18 [[id(17)]];
    sampler fp_t_tcb_18Smplr [[id(18)]];
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_10Smplr_w [[id(22)]];
    sampler fp_t_tcb_ASmplr_w [[id(23)]];
    sampler fp_t_tcb_12Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_16Smplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_18Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _58(thread const int& _4248, thread const int& _4249, thread const int& _4250, thread const int& _4251, thread int& _4252, thread int& _4253, thread int& _4254, thread int& _4255, thread int& _4256, thread int& _4257, thread int& _4258)
{
    float _4261 = as_type<float>(_4249) + 0.0;
    bool _4263 = _4261 != 0.0;
    bool _4265 = isnan(_4261);
    bool _4267 = _4263 || _4265;
    bool _4269 = isnan(0.0);
    bool _4271 = _4267 || _4269;
    int _4273 = as_type<int>(_4261);
    int _4275 = _4248;
    int _4277 = _4249;
    int _4279 = _4250;
    int _4281 = _4271 ? (-1) : 0;
    if (!_4271)
    {
        float _4283 = as_type<float>(_4249) * 1.0;
        _4273 = as_type<int>(_4283);
    }
    int _4285 = _4273;
    bool _4287 = !_4271;
    int _4289 = _4285;
    if (!_4287)
    {
        float _4291 = as_type<float>(_4249) + 0.0;
        bool _4293 = _4291 >= 0.0;
        bool _4295 = isnan(_4291);
        bool _4297 = _4293 || _4295;
        bool _4299 = isnan(0.0);
        bool _4301 = _4297 || _4299;
        int _4303 = as_type<int>(_4291);
        _4281 = _4301 ? (-1) : 0;
        if (!_4301)
        {
            _4303 = 2147483647;
        }
        int _4305 = _4303;
        bool _4307 = !_4301;
        _4289 = _4305;
        if (!_4307)
        {
            float _4309 = abs(as_type<float>(_4249));
            float _4311 = _4309 + 0.0;
            bool _4313 = _4311 > as_type<float>(0x7f800000u /* inf */);
            bool _4315 = isnan(_4311);
            bool _4317 = _4313 || _4315;
            bool _4319 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4321 = _4317 || _4319;
            int _4323 = as_type<int>(_4311);
            _4281 = _4321 ? (-1) : 0;
            if (_4321)
            {
                float _4325 = as_type<float>(_4249) + 1.0;
                _4323 = as_type<int>(_4325);
            }
            int _4327 = _4323;
            _4289 = _4327;
            if (!_4321)
            {
                float _4329 = abs(as_type<float>(_4249));
                float _4331 = _4329 + (-0.0);
                float _4333 = 0.0 + _4331;
                bool _4335 = _4333 != as_type<float>(0x7f800000u /* inf */);
                bool _4337 = isnan(_4333);
                bool _4339 = _4335 || _4337;
                bool _4341 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4343 = _4339 || _4341;
                int _4345 = as_type<int>(_4333);
                _4281 = _4343 ? (-1) : 0;
                if (!_4343)
                {
                    _4345 = _4249;
                }
                int _4347 = _4345;
                bool _4349 = !_4343;
                _4289 = _4347;
                if (!_4349)
                {
                    float _4351 = as_type<float>(_4249) * 18446744073709551616.0;
                    float _4353 = rsqrt(_4351);
                    float _4355 = _4351 * _4353;
                    float _4357 = _4353 * 0.5;
                    float _4359 = -_4355;
                    float _4361 = 0.0 + _4359;
                    float _4363 = fma(_4357, _4361, 0.5);
                    float _4365 = fma(_4355, _4363, _4355);
                    float _4367 = -_4365;
                    float _4369 = 0.0 + _4367;
                    float _4371 = fma(_4365, _4369, _4351);
                    float _4373 = fma(_4357, _4371, _4365);
                    float _4375 = _4373 * 2.3283064365386962890625e-10;
                    _4289 = as_type<int>(_4375);
                    _4275 = as_type<int>(_4351);
                    _4277 = as_type<int>(_4361);
                    _4279 = as_type<int>(_4365);
                }
            }
        }
    }
    int _4377 = _4289;
    int _4379 = _4275;
    int _4381 = _4277;
    int _4383 = _4279;
    int _4385 = _4281;
    _4252 = _4377;
    _4253 = _4379;
    _4254 = _4381;
    _4255 = _4251;
    _4256 = 0;
    _4257 = _4383;
    _4258 = _4385;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _993 = false;
    bool _284 = false;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_47.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_47.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_47.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    int _82 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4096;
    bool _86 = _82 != 0;
    int _88 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _90 = _88 != 0;
    int _92 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _94 = _92 != 0;
    int _96 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _98 = _96 != 0;
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _106 = _104 != 0;
    int _108 = int(_86);
    float _110 = 1.0 / _62;
    float _112 = _110 * _68;
    float _114 = _110 * _74;
    float _116 = _110 * _80;
    float _118 = _112 * _112;
    float _120 = fma(_114, _114, _118);
    float _122 = fma(_116, _116, _120);
    float _124 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _126 = rsqrt(_122);
    float _128 = precise::max(0.0, _124);
    float _130 = _114 * _126;
    float _132 = _116 * _126;
    float _134 = _112 * _126;
    float _136 = _130 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -_134;
    float _142 = -_128;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float _146 = _136 * _136;
    float _148 = _138 * _138;
    float _150 = _146 + _148;
    float _152 = sqrt(_150);
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _156 = _124;
    float _158 = _126;
    float _160 = _144;
    int _162 = as_type<int>(_152);
    float _164 = _136;
    float _166 = _138;
    if (!_154)
    {
        _156 = _148;
    }
    float _168 = _156;
    float _170 = _168;
    if (!_154)
    {
        _158 = _146;
    }
    float _172 = _158;
    bool _174 = !_154;
    float _176 = _172;
    if (!_174)
    {
        float _178 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _180 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _182 = _152 + _180;
        float _184 = _144 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _186 = rsqrt(_150);
        float _188 = _182 * _178;
        float _190 = _188 * 0.15915493667125701904296875;
        float _192 = _190 * 6.283185482025146484375;
        float _194 = sin(_192);
        float _196 = _190 * 6.283185482025146484375;
        float _198 = cos(_196);
        float _200 = fma(_194, _184, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _202 = _186 * _200;
        float _204 = _198 + (-1.0);
        float _206 = _136 * _202;
        float _208 = _138 * _202;
        float _210 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _212 = _208 * _208;
        float _214 = fma(_144, _198, _210);
        float _216 = _206 * _206;
        _160 = _214;
        _176 = _216;
        _170 = _212;
        _162 = as_type<int>(_190);
        _164 = _206;
        _166 = _208;
    }
    float _218 = _160;
    float _220 = _176;
    float _222 = _170;
    int _224 = _162;
    float _226 = _164;
    float _228 = _166;
    float _230 = fma(_218, _218, _220);
    float _232 = _230 + _222;
    float _234 = rsqrt(_232);
    float _236 = _234 * _218;
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
    float _282;
    if (!_258)
    {
        int _260 = _224;
        int _262 = as_type<int>(_246);
        int _264 = 0;
        int _266 = 1200;
        int _268;
        int _270;
        int _272;
        int _274;
        int _276;
        int _278;
        int _280;
        _58(_260, _262, _264, _266, _268, _270, _272, _274, _276, _278, _280);
        _282 = as_type<float>(_268);
        _284 = true;
    }
    else
    {
        float _286 = rsqrt(_246);
        float _288 = _246 * _286;
        float _290 = _286 * 0.5;
        float _292 = -_288;
        float _294 = 0.0 + _292;
        float _296 = fma(_290, _294, 0.5);
        float _298 = fma(_288, _296, _288);
        float _300 = -_298;
        float _302 = 0.0 + _300;
        float _304 = fma(_298, _302, _246);
        float _306 = fma(_290, _304, _298);
        _282 = _306;
    }
    _284 = false;
    float _308 = _282;
    bool _310 = _236 > 0.0;
    float _312 = _132 * _132;
    float _314 = _130 * _130;
    float _316 = _312 + _314;
    if (_310)
    {
        discard_fragment();
    }
    float _318 = rsqrt(_316);
    float _320 = _256 * _308;
    float _322 = _320 * 0.636619746685028076171875;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = -_324;
    float _328 = _326 + 1.0;
    float _330 = sqrt(_328);
    float _332 = _132 * _318;
    float _334 = _130 * _318;
    float _336 = abs(_332);
    float _338 = abs(_334);
    float _340 = precise::max(_336, _338);
    float _342 = precise::max(_340, 9.9999997473787516355514526367188e-05);
    float _344 = -_330;
    float _346 = _344 + 1.0;
    float _348 = 1.0 / _342;
    float _350 = _346 * 0.5;
    float _352 = -_348;
    float _354 = _332 * _352;
    float _356 = _334 * _348;
    float _358 = fma(_354, _350, 0.5);
    float _360 = fma(_356, _350, 0.5);
    if (_310)
    {
        out.m_50.x = 0.0;
        out.m_50.y = 0.0;
        out.m_50.z = 0.0;
        out.m_50.w = 0.0;
        return out;
    }
    float2 _2113;
    _2113.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_358, _360));
    _2113.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_358, _360));
    float _362 = _2113.x;
    float _364 = _362 * 256.0;
    int _366 = int(_364);
    float _368 = float(uint(_366));
    float _370 = _368 * 0.00390625;
    float2 _2129 = float2(_358, _360);
    float4 _373 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2129, float2(0.0), isnan(_2129)), level(_370)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2129, float2(0.0), isnan(_2129)), level(_370)).xyzw;
    float _375 = _373.x;
    float _377 = _373.y;
    float _379 = _373.z;
    float _381 = _373.w;
    float2 _2148 = float2(_358, _360);
    float4 _383 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2148, float2(0.0), isnan(_2148)), level(_370)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2148, float2(0.0), isnan(_2148)), level(_370)).xyzw;
    float _385 = _383.x;
    float _387 = _383.y;
    float _389 = _383.z;
    float _391 = _383.w;
    float2 _2165 = float2(_358, _360);
    float2 _395 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2165, float2(0.0), isnan(_2165)), level(_370)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2165, float2(0.0), isnan(_2165)), level(_370)).xy;
    float _397 = _395.x;
    float _399 = _395.y;
    float2 _2178 = float2(_358, _360);
    float2 _401 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2178, float2(0.0), isnan(_2178)), level(_370)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2178, float2(0.0), isnan(_2178)), level(_370)).xy;
    float _403 = _401.x;
    float _405 = _401.y;
    float _407 = -_132;
    float _409 = _134 * _407;
    float _411 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _413 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _415 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _417 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _419 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _421 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _423 = fma(_134, _415, _411);
    float _425 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _427 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _429 = fma(_134, _421, _417);
    float _431 = -_132;
    float _433 = fma(_431, _419, _423);
    float _435 = fma(_132, _419, _423);
    float _437 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _439 = fma(_134, _425, _413);
    float _441 = -_132;
    float _443 = fma(_441, _427, _429);
    float _445 = fma(_132, _427, _429);
    float _447 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _449 = -_132;
    float _451 = fma(_449, _437, _439);
    float _453 = fma(_132, _437, _439);
    float _455 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _457 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _459 = -_130;
    float _461 = fma(_459, _447, _433);
    float _463 = -_130;
    float _465 = fma(_463, _455, _443);
    float _467 = fma(_130, _455, _445);
    float _469 = fma(_130, _447, _435);
    float _471 = -_130;
    float _473 = fma(_471, _457, _451);
    float _475 = -_134;
    float _477 = _130 * _475;
    float _479 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _481 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _483 = fma(_130, _457, _453);
    float _485 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _487 = _130 * _134;
    float _489 = fma(_479, _477, _473);
    float _491 = fma(_481, _477, _461);
    float _493 = fma(_485, _477, _465);
    float _495 = fma(_479, _487, _483);
    float _497 = fma(_481, _487, _469);
    float _499 = fma(_485, _487, _467);
    float _501 = _134 * _132;
    float _503 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _505 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _507 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _509 = fma(_503, _409, _491);
    float _511 = fma(_503, _501, _497);
    float _513 = fma(_505, _409, _489);
    float _515 = fma(_505, _501, _495);
    float _517 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    int _519 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _521 = _519 != 0;
    float _523 = _130 * _130;
    float _525 = fma(_517, _409, _493);
    float _527 = -_134;
    float _529 = _527 + 1.0;
    float _531 = precise::clamp(_529, 0.0, 1.0);
    float _533 = fma(_517, _501, _499);
    float _535 = -_134;
    float _537 = fma(_535, _134, 1.0);
    float _539 = precise::clamp(_537, 0.0, 1.0);
    float _541 = _234 * _226;
    float _543 = _234 * _228;
    float _545 = _541 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _547 = -_134;
    float _549 = fma(_547, _134, _523);
    float _551 = _531;
    if (_521)
    {
        float _553 = sqrt(_539);
        _551 = _553;
    }
    float _555 = _551;
    int _557 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _559 = _557 != 0;
    float _561 = _130 * _132;
    float _563 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _565 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _567 = -_545;
    float _569 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[11].y, _567);
    float _571 = fma(_563, _561, _513);
    float _573 = fma(_563, _561, _515);
    float _575 = fma(_565, _561, _525);
    float _577 = fma(_565, _561, _533);
    float _579 = -_543;
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c3)._m0[11].z, _569);
    float _583 = _132 * (-3.0);
    float _585 = fma(_507, _561, _509);
    float _587 = fma(_507, _561, _511);
    float _589 = abs(_555);
    float _591 = log2(_589);
    float _593 = fma(_581, 0.5, 0.5);
    float _595 = -_132;
    float _597 = fma(_595, _583, -1.0);
    float _599 = fma(_581, -0.5, 0.5);
    float _601 = in.m_52.x;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = fma(_593, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _609 = fma(_593, _607, -0.212114393711090087890625);
    float _611 = sqrt(_599);
    float _613 = fma(_593, _609, 1.570728778839111328125);
    float _615 = _591 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _617 = exp2(_615);
    float _619 = _611 * 0.636619746685028076171875;
    float _621 = -_613;
    float _623 = fma(_619, _621, 1.0);
    float _625 = _617 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _627 = fma(_625, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _629 = precise::clamp(_627, 0.0, 1.0);
    float _631 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _633 = -_629;
    float _635 = _633 + 1.0;
    float _637 = fma(_312, 3.0, -1.0);
    float _639 = fma(_631, _597, _571);
    float _641 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _643 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _645 = fma(_631, _637, _573);
    float _647 = abs(_635);
    float _649 = log2(_647);
    float _651 = fma(_641, _597, _585);
    float _653 = fma(_641, _637, _587);
    float _655 = fma(_643, _597, _575);
    float _657 = fma(_643, _637, _577);
    float _659 = in.m_52.y;
    float _661 = gl_FragCoord.w;
    float _663 = _659 * _661;
    float _665 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _667 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _669 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _671 = fma(_665, _549, _639);
    float _673 = fma(_665, _549, _645);
    float _675 = _649 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _677 = _236 + 1.0;
    float _679 = fma(_667, _549, _651);
    float _681 = fma(_667, _549, _653);
    float _683 = fma(_669, _549, _655);
    float _685 = fma(_669, _549, _657);
    float _687 = exp2(_675);
    float _689 = _110 * _605;
    float _691 = -_236;
    float _693 = fma(_687, _677, _691);
    float _695 = _110 * _663;
    float _697 = fma(_236, -0.5, 0.5);
    float _699 = fma(_693, 0.5, 0.5);
    float _701 = _381 * _381;
    float _703 = _391 * _391;
    float _705 = _701 * _701;
    float _707 = _703 * _703;
    float _709 = _705 * 16.0;
    float _711 = _707 * 16.0;
    float _713 = _709 * _399;
    float _715 = _711 * _405;
    float _717 = _397 * _399;
    float _719 = -_399;
    float _721 = _719 + _405;
    float _723 = _375 * _713;
    float _725 = _377 * _713;
    float _727 = _379 * _713;
    float _729 = fma(_721, (*spvDescriptorSet0.fp_c3)._m0[0].x, _399);
    float _731 = -_723;
    float _733 = fma(_385, _715, _731);
    float _735 = -_725;
    float _737 = fma(_387, _715, _735);
    float _739 = -_727;
    float _741 = fma(_389, _715, _739);
    float _743 = -_717;
    float _745 = fma(_403, _405, _743);
    float _747 = fma(_733, (*spvDescriptorSet0.fp_c3)._m0[0].x, _723);
    float _749 = fma(_737, (*spvDescriptorSet0.fp_c3)._m0[0].x, _725);
    float2 _2744 = float2(_358, _360);
    float4 _751 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2744, float2(0.0), isnan(_2744)), level(_370)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2744, float2(0.0), isnan(_2744)), level(_370)).xyzw;
    float _753 = _751.x;
    float _755 = _751.y;
    float _757 = _751.z;
    float _759 = _751.w;
    float2 _2761 = float2(_358, _360);
    float2 _761 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2761, float2(0.0), isnan(_2761)), level(_370)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2761, float2(0.0), isnan(_2761)), level(_370)).xy;
    float _763 = _761.x;
    float _765 = _761.y;
    float2 _2774 = float2(_358, _360);
    float2 _767 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2774, float2(0.0), isnan(_2774)), level(_370)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2774, float2(0.0), isnan(_2774)), level(_370)).xy;
    float _769 = _767.x;
    float _771 = _767.y;
    float2 _2787 = float2(_358, _360);
    float4 _773 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2787, float2(0.0), isnan(_2787)), level(_370)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2787, float2(0.0), isnan(_2787)), level(_370)).xyzw;
    float _775 = _773.x;
    float _777 = _773.y;
    float _779 = _773.z;
    float _781 = _773.w;
    float2 _2804 = float2(_689, _695);
    float3 _785 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2804, float2(0.0), isnan(_2804))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2804, float2(0.0), isnan(_2804))).xyz;
    float _787 = _785.x;
    float _789 = _785.y;
    float _791 = _785.z;
    float _793 = fma(_745, (*spvDescriptorSet0.fp_c3)._m0[0].x, _717);
    float2 _2823 = float2(_623, _697);
    float3 _795 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2823, float2(0.0), isnan(_2823))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2823, float2(0.0), isnan(_2823))).xyz;
    float _797 = _795.x;
    float _799 = _795.y;
    float _801 = _795.z;
    float2 _2837 = float2(_623, _699);
    float3 _803 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2837, float2(0.0), isnan(_2837))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2837, float2(0.0), isnan(_2837))).xyz;
    float _805 = _803.x;
    float _807 = _803.y;
    float _809 = _803.z;
    float _811 = fma(_741, (*spvDescriptorSet0.fp_c3)._m0[0].x, _727);
    float _813 = precise::max(_729, 1.52587890625e-05);
    int _815 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _817 = _815 != 0;
    float _819 = 1.0 / _813;
    float _821 = _729 * _819;
    float _823 = _793 * _821;
    float _825 = _747 * _821;
    float _827 = _749 * _821;
    float _829 = _811 * _821;
    float _831 = _759 * _759;
    float _833 = _781 * _781;
    float _835 = _831 * _831;
    float _837 = _833 * _833;
    float _839 = _835 * 16.0;
    float _841 = _763 * _765;
    float _843 = -_765;
    float _845 = _843 + _771;
    float _847 = _837 * 16.0;
    float _849 = _839 * _765;
    float _851 = -_841;
    float _853 = fma(_769, _771, _851);
    float _855 = fma(_845, (*spvDescriptorSet0.fp_c3)._m0[0].x, _765);
    float _857 = _847 * _771;
    float _859 = _753 * _849;
    float _861 = _755 * _849;
    float _863 = _757 * _849;
    float _865 = precise::max(_855, 1.52587890625e-05);
    float _867 = -_729;
    float _869 = _867 + _855;
    float _871 = -_859;
    float _873 = fma(_775, _857, _871);
    float _875 = -_861;
    float _877 = fma(_777, _857, _875);
    float _879 = -_863;
    float _881 = fma(_779, _857, _879);
    float _883 = 1.0 / _865;
    float _885 = _787 * _789;
    float _887 = fma(_787, _869, _729);
    float _889 = fma(_877, (*spvDescriptorSet0.fp_c3)._m0[0].x, _861);
    float _891 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _893 = _891 + 1.0;
    float _895 = -_885;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _901 = _899 + 1.0;
    float _903 = fma(_853, (*spvDescriptorSet0.fp_c3)._m0[0].x, _841);
    float _905 = precise::max(_887, 1.52587890625e-05);
    float _907 = fma(_873, (*spvDescriptorSet0.fp_c3)._m0[0].x, _859);
    float _909 = fma(_897, _893, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _911 = fma(_897, _901, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _913 = fma(_881, (*spvDescriptorSet0.fp_c3)._m0[0].x, _863);
    float _915 = 1.0 / _905;
    float _917 = -_791;
    float _919 = _917 + 1.0;
    float _921 = _903 * _883;
    float _923 = _909 * _883;
    float _925 = _887 * _919;
    float _927 = _921 * _911;
    float _929 = _855 * _923;
    float _931 = _913 * _923;
    float _933 = _925 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _935 = -_823;
    float _937 = fma(_855, _927, _935);
    float _939 = -_825;
    float _941 = fma(_907, _929, _939);
    float _943 = -_827;
    float _945 = fma(_889, _929, _943);
    float _947 = -_829;
    float _949 = fma(_855, _931, _947);
    float _951 = fma(_787, _937, _823);
    float _953 = fma(_787, _941, _825);
    float _955 = fma(_787, _945, _827);
    float _957 = fma(_787, _949, _829);
    float _959 = _951 * _915;
    bool _961 = !_559;
    float _963 = _961 ? _959 : 0.0;
    bool _965 = !_817;
    int _967 = _817 ? (-1) : 0;
    int _981;
    int _983;
    int _985;
    int _987;
    int _989;
    int _991;
    if (!_965)
    {
        float _969 = _473 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _971 = _461 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _973 = _465 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _975 = _483 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _977 = _469 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _979 = _467 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _981 = as_type<int>(_975);
        _983 = as_type<int>(_977);
        _985 = as_type<int>(_979);
        _987 = as_type<int>(_969);
        _989 = as_type<int>(_971);
        _991 = as_type<int>(_973);
        _993 = true;
    }
    else
    {
        int _995 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _997 = _995 != 0;
        float _999 = _671 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1001 = _679 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1003 = _683 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1005 = _673 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1007 = _681 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1009 = _685 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1011 = as_type<int>(_999);
        int _1013 = as_type<int>(_1001);
        int _1015 = as_type<int>(_1003);
        int _1017 = as_type<int>(_1005);
        int _1019 = as_type<int>(_1007);
        _967 = _997 ? (-1) : 0;
        _985 = as_type<int>(_1009);
        if (_997)
        {
            float _1021 = _413 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1011 = as_type<int>(_1021);
        }
        int _1023 = _1011;
        _987 = _1023;
        if (_997)
        {
            float _1025 = _411 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1013 = as_type<int>(_1025);
        }
        int _1027 = _1013;
        _989 = _1027;
        if (_997)
        {
            float _1029 = _417 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _1015 = as_type<int>(_1029);
        }
        int _1031 = _1015;
        _991 = _1031;
        if (_997)
        {
            _1017 = _1023;
        }
        int _1033 = _1017;
        _981 = _1033;
        if (_997)
        {
            _1019 = _1027;
        }
        int _1035 = _1019;
        _983 = _1035;
        if (_997)
        {
            _985 = _1031;
        }
    }
    _993 = false;
    int _1037 = _967;
    int _1039 = _981;
    int _1041 = _983;
    int _1043 = _985;
    int _1045 = _987;
    int _1047 = _989;
    int _1049 = _991;
    int _1051 = 0;
    int _1053 = _1037;
    if (!_102)
    {
        int _1055 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _1057 = _1055 != 0;
        _1051 = _1057 ? (-1) : 0;
    }
    int _1059 = _1051;
    float _1061 = _649 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    if (_102)
    {
        _1053 = -1;
    }
    int _1063 = _1053;
    float _1065 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    int _1067 = _1063;
    if (!_102)
    {
        int _1069 = ~_1059;
        bool _1071 = !_106;
        int _1073 = _1069 & (_1071 ? (-1) : 0);
        _1067 = _1073;
    }
    int _1075 = _1067;
    float _1077 = _963 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _1079 = _108 != 0;
    float _1081 = exp2(_1061);
    float _1083 = _953 * _915;
    float _1085 = _955 * _915;
    float _1087 = _957 * _915;
    int _1089 = _1075;
    if (_98)
    {
        _1089 = -1;
    }
    int _1091 = _1089;
    int _1093 = ~_1075;
    float _1095 = (_1093 != 0) ? as_type<float>(_1039) : 0.0;
    int _1097 = _1091;
    if (!_98)
    {
        bool _1099 = !_106;
        bool _1101 = _1099 && _94;
        bool _1103 = !_1079;
        bool _1105 = _1101 && _1103;
        _1097 = _1105 ? (-1) : 0;
    }
    int _1107 = _1097;
    float _1109 = -_1081;
    float _1111 = _1109 + 1.0;
    int _1113 = ~_1075;
    float _1115 = (_1113 != 0) ? as_type<float>(_1041) : 0.0;
    int _1117 = ~_1075;
    float _1119 = (_1117 != 0) ? as_type<float>(_1043) : 0.0;
    float _1121 = _1111 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    bool _1123 = !_106;
    bool _1125 = _94 && _1123;
    int _1127 = ~_1107;
    float _1129 = (_1127 != 0) ? as_type<float>(_1045) : 0.0;
    int _1131 = ~_1107;
    float _1133 = (_1131 != 0) ? as_type<float>(_1047) : 0.0;
    int _1135 = ~_1107;
    float _1137 = (_1135 != 0) ? as_type<float>(_1049) : 0.0;
    int _1139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1141 = _1139 != 0;
    bool _1143 = !_1125;
    float _1145 = _1143 ? _1065 : 0.0;
    float _1147 = -_1121;
    float _1149 = _1147 + 1.0;
    bool _1151 = !_1125;
    float _1153 = _1151 ? _1077 : 0.0;
    float _1155 = abs(_1149);
    float _1157 = log2(_1155);
    bool _1159 = !_1141;
    float _1161 = _1153 * _1115;
    float _1163 = _1153 * _1095;
    float _1165 = _1153 * _1119;
    bool _1167 = !_1141;
    float _1169 = fma(_1133, _1145, _1161);
    bool _1171 = !_1159;
    float _1173 = _1171 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1175 = fma(_1129, _1145, _1163);
    float _1177 = fma(_1137, _1145, _1165);
    bool _1179 = !_1167;
    float _1181 = _1179 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    bool _1183 = !_1141;
    float _1185 = _1173 * _1169;
    float _1187 = _885 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _1189 = _1181 * _1175;
    float _1191 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    bool _1193 = !_1183;
    float _1195 = _1193 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _1197 = _1185 * 0.715200006961822509765625;
    float _1199 = _1157 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    int _1201 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1203 = _1201 != 0;
    float _1205 = exp2(_1191);
    float _1207 = _1195 * _1177;
    float _1209 = fma(_1189, 0.2125999927520751953125, _1197);
    bool _1211 = !_1203;
    float _1213 = fma(_1207, 0.072200000286102294921875, _1209);
    bool _1215 = !_1203;
    float _1217 = exp2(_1199);
    bool _1219 = !_1203;
    float _1221 = -_1189;
    float _1223 = _1221 + _1213;
    float _1225 = -_1185;
    float _1227 = _1225 + _1213;
    float _1229 = -_1207;
    float _1231 = _1229 + _1213;
    float _1233 = _1211 ? _1087 : 0.0;
    float _1235 = fma(_1187, _1223, _1189);
    float _1237 = fma(_1187, _1227, _1185);
    bool _1239 = !_90;
    float _1241 = _1239 ? _1205 : 1.0;
    float _1243 = fma(_1187, _1231, _1207);
    float _1245 = _1215 ? _1083 : 0.0;
    float _1247 = _963 * _1241;
    float _1249 = _1241 * _1235;
    float _1251 = _1241 * _1237;
    bool _1253 = !_90;
    float _1255 = _1253 ? _1217 : 1.0;
    float _1257 = _94 ? _1247 : _1249;
    float _1259 = _1255 * _1245;
    float _1261 = _1255 * _1233;
    float _1263 = _1219 ? _1085 : 0.0;
    float _1265 = _94 ? _1247 : _1251;
    float _1267 = _1247;
    int _1269 = as_type<int>(_1205);
    float _1271 = _1259;
    float _1273 = _1243;
    float _1275 = _1121;
    if (!_94)
    {
        float _1277 = _1241 * _1243;
        _1267 = _1277;
    }
    float _1279 = _1267;
    float _1281 = _1255 * _1263;
    float _1283 = _1257 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1285 = _1279 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1287 = fma(_1259, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1283);
    float _1289 = _1287;
    if (_90)
    {
        _1269 = as_type<int>(_933);
    }
    int _1291 = _1269;
    float _1293 = _1265 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1295 = fma(_1261, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1285);
    float _1297 = _1293;
    int _1299 = _1291;
    int _1301 = _1291;
    if (_90)
    {
        _1271 = 0.0;
    }
    float _1303 = _1271;
    float _1305 = fma(_1281, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1293);
    bool _1307 = !_90;
    float _1309 = _1307 ? _1121 : 0.0;
    float _1311 = _1305;
    float _1313 = _1303;
    if (_90)
    {
        _1297 = 0.0;
    }
    float _1315 = _1297;
    float _1317 = _1315;
    if (_90)
    {
        _1273 = 0.0;
    }
    float _1319 = _1273;
    float _1321 = _1319;
    if (_90)
    {
        _1275 = _1295;
    }
    float _1323 = _1275;
    float _1325 = _1323;
    float _1327 = _1323;
    if (!_90)
    {
        int _1329 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1331 = _1329 != 0;
        float _1333 = _807 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1335 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1337 = _1335 != 0;
        float _1339 = _805 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1341 = _809 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1343 = !_1337;
        float _1345 = _1343 ? _1339 : 0.0;
        bool _1347 = !_1337;
        float _1349 = _1347 ? _1333 : 0.0;
        bool _1351 = !_1337;
        float _1353 = _1351 ? _1341 : 0.0;
        float _1355 = _1309 * _1345;
        _1313 = _1355;
        if (!_1331)
        {
            _1299 = as_type<int>(_933);
        }
        int _1357 = _1299;
        float _1359 = _1309 * _1349;
        float _1361 = _1309 * _1353;
        _1317 = _1359;
        _1301 = _1357;
        _1321 = _1361;
        if (!_1331)
        {
            _1325 = _1295;
        }
        float _1363 = _1325;
        bool _1365 = !_1331;
        _1327 = _1363;
        if (!_1365)
        {
            float _1367 = -_1309;
            float _1369 = _1367 + 1.0;
            float _1371 = precise::clamp(_1369, 0.0, 1.0);
            float _1373 = _933 * _1371;
            float _1375 = precise::max(_1373, 9.9999997473787516355514526367188e-05);
            float _1377 = 1.0 / _1375;
            float _1379 = _933 * _1377;
            float _1381 = _1287 * _1379;
            float _1383 = _1305 * _1379;
            float _1385 = _1295 * _1379;
            _1311 = _1383;
            _1317 = 0.0;
            _1289 = _1381;
            _1313 = 0.0;
            _1301 = as_type<int>(_1373);
            _1327 = _1385;
            _1321 = 0.0;
        }
    }
    float _1387 = _1311;
    float _1389 = _1317;
    float _1391 = _1289;
    float _1393 = _1313;
    int _1395 = _1301;
    float _1397 = _1327;
    float _1399 = _1321;
    int _1401 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1403 = _1401 != 0;
    int _1405 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1407 = _1405 != 0;
    float _1409 = _799 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1411 = _1387 + _1389;
    float _1413 = _797 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1415 = _1391 + _1393;
    bool _1417 = !_1407;
    float _1419 = _1417 ? as_type<float>(_1395) : 1.0;
    float _1421 = _801 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1423 = _1397 + _1399;
    float _1425 = -_1419;
    float _1427 = _1425 + 1.0;
    float _1429 = abs(_1427);
    float _1431 = log2(_1429);
    float _1433 = _1431 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1435 = exp2(_1433);
    float _1437 = -_1435;
    float _1439 = spvFAdd(_1437, 1.00010001659393310546875);
    float _1441 = -_1435;
    float _1443 = _1441 + 1.0;
    float _1445 = -_1419;
    float _1447 = _1445 + _1443;
    float _1449 = 1.0 / _1439;
    float _1451 = _1409 * _1447;
    float _1453 = _1413 * _1447;
    float _1455 = _1421 * _1447;
    float _1457 = fma(_1411, _1419, _1451);
    float _1459 = fma(_1415, _1419, _1453);
    float _1461 = _1449 * _1457;
    float _1463 = fma(_1423, _1419, _1455);
    float _1465 = _1449 * _1459;
    float _1467 = _1461 * 0.715200006961822509765625;
    float _1469 = _1449 * _1463;
    float _1471 = fma(_1465, 0.2125999927520751953125, _1467);
    float _1473 = fma(_1469, 0.072200000286102294921875, _1471);
    float _1475 = 1.0 / _1473;
    float _1477 = _1475 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1479 = precise::clamp(_1477, 0.0, 1.0);
    float _1481 = fma(_1479, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1483 = _1465 * _1481;
    float _1485 = _1461 * _1481;
    float _1487 = _1469 * _1481;
    bool _1489 = !_1403;
    float _1491 = _1485;
    float _1493 = _1487;
    float _1495 = _1443;
    float _1497 = _1485;
    float _1499 = _1487;
    float _1501 = _1443;
    if (!_1489)
    {
        bool _1503 = _1443 != 1.0;
        bool _1505 = isnan(_1443);
        bool _1507 = _1503 || _1505;
        bool _1509 = isnan(1.0);
        bool _1511 = _1507 || _1509;
        float _1513 = -_1435;
        bool _1515 = _1513 != (-1.0);
        bool _1517 = isnan(_1513);
        bool _1519 = _1515 || _1517;
        bool _1521 = isnan(-1.0);
        bool _1523 = _1519 || _1521;
        float _1525 = -_1435;
        bool _1527 = _1525 == (-1.0);
        bool _1529 = !_1511;
        bool _1531 = _1527 || _1529;
        bool _1533 = _1443 == 1.0;
        bool _1535 = _1533 && _1523;
        bool _1537 = !_1531;
        float _1539 = _1537 ? _1443 : 0.0;
        bool _1541 = !_1535;
        float _1543 = _1541 ? 0.0 : 1.0;
        float _1545 = _1531 ? 0.0 : 0.5;
        float _1547 = _1539 * 0.715200006961822509765625;
        float _1549 = fma(_1543, 0.2125999927520751953125, _1547);
        float _1551 = fma(_1545, 0.072200000286102294921875, _1549);
        float _1553 = 1.0 / _1551;
        float _1555 = _1553 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1557 = precise::clamp(_1555, 0.0, 1.0);
        float _1559 = fma(_1557, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1561 = _1543 * _1559;
        float _1563 = _1539 * _1559;
        float _1565 = _1545 * _1559;
        out.m_50.x = _1561;
        out.m_50.y = _1563;
        out.m_50.z = _1565;
        out.m_50.w = 1.0;
        return out;
    }
    bool _1567 = _108 != 0;
    bool _1569 = !_1567;
    if (!_1569)
    {
        if (_98)
        {
            _1491 = 0.0;
        }
        float _1571 = _1491;
        float _1573 = _1571;
        if (_98)
        {
            _1493 = 0.0;
        }
        float _1575 = _1493;
        float _1577 = _1575;
        if (!_98)
        {
            float _1579 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1577 = _1579;
        }
        float _1581 = _1577;
        float _1583 = _1581;
        if (!_98)
        {
            float _1585 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1573 = _1585;
        }
        float _1587 = _1573;
        float _1589 = _1587;
        if (!_102)
        {
            float _1591 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1581);
            _1583 = _1591;
        }
        float _1593 = _1583;
        if (_98)
        {
            _1495 = 0.0;
        }
        float _1595 = _1495;
        float _1597 = _1595;
        if (!_98)
        {
            float _1599 = _1137 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1597 = _1599;
        }
        float _1601 = _1597;
        float _1603 = _1593 * 0.715200006961822509765625;
        float _1605 = _1601;
        if (!_102)
        {
            float _1607 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1587);
            _1589 = _1607;
        }
        float _1609 = _1589;
        if (!_102)
        {
            float _1611 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1601);
            _1605 = _1611;
        }
        float _1613 = _1605;
        float _1615 = fma(_1609, 0.2125999927520751953125, _1603);
        float _1617 = fma(_1613, 0.072200000286102294921875, _1615);
        float _1619 = 1.0 / _1617;
        float _1621 = _1619 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        float _1625 = fma(_1623, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1627 = _1625 * _1609;
        float _1629 = _1625 * _1593;
        float _1631 = _1625 * _1613;
        out.m_50.x = _1627;
        out.m_50.y = _1629;
        out.m_50.z = _1631;
        out.m_50.w = 1.0;
        return out;
    }
    if (!_106)
    {
        out.m_50.x = _1483;
        out.m_50.y = _1485;
        out.m_50.z = _1487;
        out.m_50.w = _1443;
        return out;
    }
    if (_98)
    {
        _1497 = 0.0;
    }
    float _1633 = _1497;
    float _1635 = _1633;
    if (_98)
    {
        _1499 = 0.0;
    }
    float _1637 = _1499;
    float _1639 = _1637;
    if (!_98)
    {
        float _1641 = _1133 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = _1643;
    if (!_98)
    {
        float _1647 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1635 = _1647;
    }
    float _1649 = _1635;
    float _1651 = _1649;
    if (!_102)
    {
        float _1653 = fma(_1115, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1643);
        _1645 = _1653;
    }
    float _1655 = _1645;
    if (_98)
    {
        _1501 = 0.0;
    }
    float _1657 = _1501;
    float _1659 = _1657;
    if (!_98)
    {
        float _1661 = _1137 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1659 = _1661;
    }
    float _1663 = _1659;
    float _1665 = _1655 * 0.715200006961822509765625;
    float _1667 = _1663;
    if (!_102)
    {
        float _1669 = fma(_1095, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1649);
        _1651 = _1669;
    }
    float _1671 = _1651;
    if (!_102)
    {
        float _1673 = fma(_1119, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1663);
        _1667 = _1673;
    }
    float _1675 = _1667;
    float _1677 = fma(_1671, 0.2125999927520751953125, _1665);
    float _1679 = fma(_1675, 0.072200000286102294921875, _1677);
    float _1681 = 1.0 / _1679;
    float _1683 = _1681 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1685 = precise::clamp(_1683, 0.0, 1.0);
    float _1687 = fma(_1685, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1689 = _1687 * _1671;
    float _1691 = _1687 * _1655;
    float _1693 = _1687 * _1675;
    out.m_50.x = _1689;
    out.m_50.y = _1691;
    out.m_50.z = _1693;
    out.m_50.w = 1.0;
    return out;
}

