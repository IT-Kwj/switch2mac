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
    texture2d<float> fp_t_tcb_14 [[id(3)]];
    sampler fp_t_tcb_14Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_18 [[id(5)]];
    sampler fp_t_tcb_18Smplr [[id(6)]];
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
    texture2d<float> fp_t_tcb_1A [[id(19)]];
    sampler fp_t_tcb_1ASmplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_14Smplr_w [[id(22)]];
    sampler fp_t_tcb_18Smplr_w [[id(23)]];
    sampler fp_t_tcb_ASmplr_w [[id(24)]];
    sampler fp_t_tcb_10Smplr_w [[id(25)]];
    sampler fp_t_tcb_12Smplr_w [[id(26)]];
    sampler fp_t_tcb_CSmplr_w [[id(27)]];
    sampler fp_t_tcb_ESmplr_w [[id(28)]];
    sampler fp_t_tcb_16Smplr_w [[id(29)]];
    sampler fp_t_tcb_1ASmplr_w [[id(30)]];
    constant dm_border_t* dm_border [[id(31)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _58(thread const int& _4188, thread const int& _4189, thread const int& _4190, thread const int& _4191, thread int& _4192, thread int& _4193, thread int& _4194, thread int& _4195, thread int& _4196)
{
    float _4199 = as_type<float>(_4190) + 0.0;
    bool _4201 = _4199 != 0.0;
    bool _4203 = isnan(_4199);
    bool _4205 = _4201 || _4203;
    bool _4207 = isnan(0.0);
    bool _4209 = _4205 || _4207;
    int _4211 = as_type<int>(_4199);
    int _4213 = _4189;
    int _4215 = _4209 ? (-1) : 0;
    if (!_4209)
    {
        float _4217 = as_type<float>(_4190) * 1.0;
        _4211 = as_type<int>(_4217);
    }
    int _4219 = _4211;
    bool _4221 = !_4209;
    int _4223 = _4219;
    if (!_4221)
    {
        float _4225 = as_type<float>(_4190) + 0.0;
        bool _4227 = _4225 >= 0.0;
        bool _4229 = isnan(_4225);
        bool _4231 = _4227 || _4229;
        bool _4233 = isnan(0.0);
        bool _4235 = _4231 || _4233;
        int _4237 = as_type<int>(_4225);
        _4215 = _4235 ? (-1) : 0;
        if (!_4235)
        {
            _4237 = 2147483647;
        }
        int _4239 = _4237;
        bool _4241 = !_4235;
        _4223 = _4239;
        if (!_4241)
        {
            float _4243 = abs(as_type<float>(_4190));
            float _4245 = _4243 + 0.0;
            bool _4247 = _4245 > as_type<float>(0x7f800000u /* inf */);
            bool _4249 = isnan(_4245);
            bool _4251 = _4247 || _4249;
            bool _4253 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4255 = _4251 || _4253;
            int _4257 = as_type<int>(_4245);
            _4215 = _4255 ? (-1) : 0;
            if (_4255)
            {
                float _4259 = as_type<float>(_4190) + 1.0;
                _4257 = as_type<int>(_4259);
            }
            int _4261 = _4257;
            _4223 = _4261;
            if (!_4255)
            {
                float _4263 = abs(as_type<float>(_4190));
                float _4265 = _4263 + (-0.0);
                float _4267 = 0.0 + _4265;
                bool _4269 = _4267 != as_type<float>(0x7f800000u /* inf */);
                bool _4271 = isnan(_4267);
                bool _4273 = _4269 || _4271;
                bool _4275 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4277 = _4273 || _4275;
                int _4279 = as_type<int>(_4267);
                _4215 = _4277 ? (-1) : 0;
                if (!_4277)
                {
                    _4279 = _4190;
                }
                int _4281 = _4279;
                bool _4283 = !_4277;
                _4223 = _4281;
                if (!_4283)
                {
                    float _4285 = as_type<float>(_4190) * 18446744073709551616.0;
                    float _4287 = rsqrt(_4285);
                    float _4289 = _4285 * _4287;
                    float _4291 = _4287 * 0.5;
                    float _4293 = -_4289;
                    float _4295 = 0.0 + _4293;
                    float _4297 = fma(_4291, _4295, 0.5);
                    float _4299 = fma(_4289, _4297, _4289);
                    float _4301 = -_4299;
                    float _4303 = 0.0 + _4301;
                    float _4305 = fma(_4299, _4303, _4285);
                    float _4307 = fma(_4291, _4305, _4299);
                    float _4309 = _4307 * 2.3283064365386962890625e-10;
                    _4223 = as_type<int>(_4309);
                    _4213 = as_type<int>(_4299);
                }
            }
        }
    }
    int _4311 = _4223;
    int _4313 = _4213;
    int _4315 = _4215;
    _4192 = _4311;
    _4193 = _4191;
    _4194 = 0;
    _4195 = _4313;
    _4196 = _4315;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _917 = false;
    bool _276 = false;
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
    float _88 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _92 = _90 != 0;
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _96 = _94 != 0;
    float _98 = precise::max(0.0, _88);
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _106 = _104 != 0;
    int _108 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _110 = _108 != 0;
    int _112 = int(_86);
    float _114 = 1.0 / _62;
    float _116 = _114 * _68;
    float _118 = _114 * _74;
    float _120 = _114 * _80;
    float _122 = _116 * _116;
    float _124 = fma(_118, _118, _122);
    float _126 = fma(_120, _120, _124);
    float _128 = rsqrt(_126);
    float _130 = _118 * _128;
    float _132 = _120 * _128;
    float _134 = _116 * _128;
    float _136 = _130 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -_134;
    float _142 = -_98;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float _146 = _136 * _136;
    float _148 = _138 * _138;
    float _150 = _146 + _148;
    float _152 = sqrt(_150);
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _156 = _98;
    float _158 = _128;
    float _160 = _144;
    float _162 = _136;
    float _164 = _138;
    if (!_154)
    {
        _156 = _148;
    }
    float _166 = _156;
    float _168 = _166;
    if (!_154)
    {
        _158 = _146;
    }
    float _170 = _158;
    bool _172 = !_154;
    float _174 = _170;
    if (!_172)
    {
        float _176 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _180 = _152 + _178;
        float _182 = _144 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = rsqrt(_150);
        float _186 = _180 * _176;
        float _188 = _186 * 0.15915493667125701904296875;
        float _190 = _188 * 6.283185482025146484375;
        float _192 = sin(_190);
        float _194 = _188 * 6.283185482025146484375;
        float _196 = cos(_194);
        float _198 = fma(_192, _182, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _200 = _184 * _198;
        float _202 = _196 + (-1.0);
        float _204 = _136 * _200;
        float _206 = _138 * _200;
        float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _210 = _206 * _206;
        float _212 = fma(_144, _196, _208);
        float _214 = _204 * _204;
        _160 = _212;
        _174 = _214;
        _168 = _210;
        _162 = _204;
        _164 = _206;
    }
    float _216 = _160;
    float _218 = _174;
    float _220 = _168;
    float _222 = _162;
    float _224 = _164;
    float _226 = fma(_216, _216, _218);
    float _228 = _226 + _220;
    float _230 = rsqrt(_228);
    float _232 = _230 * _216;
    float _234 = -_232;
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
        int _258 = 0;
        int _260 = as_type<int>(_242);
        int _262 = 1200;
        int _264;
        int _266;
        int _268;
        int _270;
        int _272;
        _58(_256, _258, _260, _262, _264, _266, _268, _270, _272);
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
    bool _302 = _232 > 0.0;
    float _304 = _132 * _132;
    float _306 = _130 * _130;
    float _308 = _304 + _306;
    if (_302)
    {
        discard_fragment();
    }
    float _310 = rsqrt(_308);
    float _312 = _252 * _300;
    float _314 = in.m_49.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_49.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _312 * 0.636619746685028076171875;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = -_328;
    float _332 = _330 + 1.0;
    float _334 = sqrt(_332);
    float _336 = _132 * _310;
    float _338 = _130 * _310;
    float _340 = abs(_336);
    float _342 = abs(_338);
    float _344 = precise::max(_340, _342);
    float _346 = precise::max(_344, 9.9999997473787516355514526367188e-05);
    float _348 = -_334;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _346;
    float _354 = _114 * _318;
    float _356 = _350 * 0.5;
    float _358 = _114 * _324;
    float _360 = -_352;
    float _362 = _336 * _360;
    float _364 = _338 * _352;
    float _366 = fma(_362, _356, 0.5);
    float _368 = fma(_364, _356, 0.5);
    float2 _2085;
    _2085.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_366, _368));
    _2085.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_366, _368));
    float _370 = _2085.x;
    float _372 = _370 * 256.0;
    int _374 = int(_372);
    float2 _2095 = float2(_354, _358);
    float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2095, float2(0.0), isnan(_2095))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2095, float2(0.0), isnan(_2095))).xyz;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float2 _2111 = float2(_354, _358);
    float2 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2111, float2(0.0), isnan(_2111))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2111, float2(0.0), isnan(_2111))).xy;
    float _390 = _388.x;
    float _392 = _388.y;
    if (_302)
    {
        out.m_52.x = 0.0;
        out.m_52.y = 0.0;
        out.m_52.z = 0.0;
        out.m_52.w = 0.0;
        return out;
    }
    float _394 = -_134;
    float _396 = _394 + 1.0;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = -_134;
    float _402 = fma(_400, _134, 1.0);
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _230 * _222;
    int _408 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _410 = _408 != 0;
    float _412 = _230 * _224;
    float _414 = float(uint(_374));
    float _416 = fma(_232, -0.5, 0.5);
    float _418 = _414 * 0.00390625;
    float _420 = _398;
    if (_410)
    {
        float _422 = sqrt(_404);
        _420 = _422;
    }
    float _424 = _420;
    float _426 = abs(_424);
    float _428 = log2(_426);
    float _430 = _428 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _432 = exp2(_430);
    float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _406 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _442 = -_438;
    float _444 = _442 + 1.0;
    float _446 = -_440;
    float _448 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[11].y, _446);
    float _450 = abs(_444);
    float _452 = log2(_450);
    float _454 = -_412;
    float _456 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[11].z, _448);
    float _458 = fma(_456, -0.5, 0.5);
    float _460 = fma(_456, 0.5, 0.5);
    float _462 = fma(_460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _464 = sqrt(_458);
    float _466 = fma(_460, _462, -0.212114393711090087890625);
    float _468 = _232 + 1.0;
    float _470 = _452 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _472 = fma(_460, _466, 1.570728778839111328125);
    float _474 = exp2(_470);
    float _476 = _464 * 0.636619746685028076171875;
    float _478 = -_472;
    float _480 = fma(_476, _478, 1.0);
    float _482 = -_232;
    float _484 = fma(_474, _468, _482);
    float _486 = fma(_484, 0.5, 0.5);
    float2 _2261 = float2(_366, _368);
    float4 _489 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2261, float2(0.0), isnan(_2261)), level(_418)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2261, float2(0.0), isnan(_2261)), level(_418)).xyzw;
    float _491 = _489.x;
    float _493 = _489.y;
    float _495 = _489.z;
    float _497 = _489.w;
    float2 _2278 = float2(_366, _368);
    float2 _499 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2278, float2(0.0), isnan(_2278)), level(_418)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2278, float2(0.0), isnan(_2278)), level(_418)).xy;
    float _501 = _499.x;
    float _503 = _499.y;
    float2 _2291 = float2(_366, _368);
    float4 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2291, float2(0.0), isnan(_2291)), level(_418)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2291, float2(0.0), isnan(_2291)), level(_418)).xyzw;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    float _513 = _505.w;
    float2 _2308 = float2(_366, _368);
    float2 _515 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2308, float2(0.0), isnan(_2308)), level(_418)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2308, float2(0.0), isnan(_2308)), level(_418)).xy;
    float _517 = _515.x;
    float _519 = _515.y;
    float2 _2321 = float2(_366, _368);
    float4 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2321, float2(0.0), isnan(_2321)), level(_418)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2321, float2(0.0), isnan(_2321)), level(_418)).xyzw;
    float _523 = _521.x;
    float _525 = _521.y;
    float _527 = _521.z;
    float _529 = _521.w;
    float2 _2338 = float2(_366, _368);
    float2 _531 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2338, float2(0.0), isnan(_2338)), level(_418)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2338, float2(0.0), isnan(_2338)), level(_418)).xy;
    float _533 = _531.x;
    float _535 = _531.y;
    float2 _2351 = float2(_480, _416);
    float3 _537 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2351, float2(0.0), isnan(_2351))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2351, float2(0.0), isnan(_2351))).xyz;
    float _539 = _537.x;
    float _541 = _537.y;
    float _543 = _537.z;
    float2 _2365 = float2(_480, _486);
    float3 _545 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2365, float2(0.0), isnan(_2365))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2365, float2(0.0), isnan(_2365))).xyz;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _380 * _382;
    int _555 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _557 = _555 != 0;
    float _559 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _561 = _559 + 1.0;
    float _563 = -_553;
    float _565 = _563 + 1.0;
    int _567 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _569 = _567 != 0;
    float _571 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _573 = _571 + 1.0;
    float _575 = fma(_565, _561, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _577 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _579 = fma(_565, _573, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _581 = _497 * _497;
    float _583 = _501 * _503;
    float _585 = _513 * _513;
    float _587 = _581 * _581;
    float _589 = -_583;
    float _591 = fma(_517, _519, _589);
    float _593 = _585 * _585;
    float _595 = _533 * _579;
    float _597 = _587 * 16.0;
    float _599 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[0].x, _583);
    float _601 = -_503;
    float _603 = _601 + _519;
    float _605 = _597 * _503;
    float _607 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _609 = fma(_603, (*spvDescriptorSet0.fp_c3)._m0[0].x, _503);
    float _611 = _491 * _605;
    float _613 = _493 * _605;
    float _615 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _617 = _495 * _605;
    float _619 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _621 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _623 = fma(_134, _615, _607);
    float _625 = -_132;
    float _627 = fma(_625, _619, _623);
    float _629 = fma(_132, _619, _623);
    float _631 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _633 = -_130;
    float _635 = fma(_633, _631, _627);
    float _637 = fma(_130, _631, _629);
    float _639 = _593 * 16.0;
    float _641 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _643 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _645 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _647 = _639 * _519;
    float _649 = fma(_134, _621, _641);
    float _651 = fma(_134, _577, _643);
    float _653 = -_611;
    float _655 = fma(_507, _647, _653);
    float _657 = -_613;
    float _659 = fma(_509, _647, _657);
    float _661 = -_617;
    float _663 = fma(_511, _647, _661);
    float _665 = -_132;
    float _667 = fma(_665, _645, _649);
    float _669 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[0].x, _611);
    float _671 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _673 = fma(_132, _645, _649);
    float _675 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _677 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[0].x, _613);
    float _679 = -_132;
    float _681 = fma(_679, _671, _651);
    float _683 = fma(_132, _671, _651);
    float _685 = precise::max(_609, 1.52587890625e-05);
    float _687 = -_130;
    float _689 = fma(_687, _675, _667);
    float _691 = fma(_130, _675, _673);
    float _693 = _529 * _529;
    float _695 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _697 = fma(_663, (*spvDescriptorSet0.fp_c3)._m0[0].x, _617);
    float _699 = 1.0 / _685;
    float _701 = _693 * _693;
    float _703 = -_130;
    float _705 = fma(_703, _695, _681);
    float _707 = fma(_130, _695, _683);
    float _709 = _130 * _134;
    float _711 = _701 * 16.0;
    float _713 = _711 * _575;
    float _715 = _132 * (-3.0);
    float _717 = _535 * _713;
    float _719 = _527 * _713;
    float _721 = _130 * _132;
    float _723 = _609 * _699;
    float _725 = -_132;
    float _727 = _134 * _725;
    float _729 = _669 * _723;
    float _731 = _677 * _723;
    float _733 = _599 * _723;
    float _735 = _697 * _723;
    float _737 = -_729;
    float _739 = fma(_523, _717, _737);
    float _741 = -_731;
    float _743 = fma(_525, _717, _741);
    float _745 = -_134;
    float _747 = _130 * _745;
    float _749 = -_735;
    float _751 = fma(_535, _719, _749);
    float _753 = fma(_380, _739, _729);
    float _755 = _130 * _130;
    float _757 = fma(_380, _743, _731);
    float _759 = -_134;
    float _761 = fma(_759, _134, _755);
    float _763 = _134 * _132;
    float _765 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _767 = -_132;
    float _769 = fma(_767, _715, -1.0);
    float _771 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _773 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _775 = fma(_765, _747, _705);
    float _777 = fma(_765, _709, _707);
    float _779 = fma(_771, _727, _775);
    float _781 = fma(_771, _763, _777);
    float _783 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _785 = fma(_783, _747, _635);
    float _787 = fma(_783, _709, _637);
    float _789 = fma(_773, _747, _689);
    float _791 = fma(_773, _709, _691);
    float _793 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _795 = fma(_793, _727, _785);
    float _797 = fma(_793, _763, _787);
    float _799 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _801 = fma(_799, _727, _789);
    float _803 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _805 = fma(_799, _763, _791);
    float _807 = fma(_803, _721, _779);
    float _809 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _811 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _813 = fma(_803, _721, _781);
    float _815 = fma(_809, _721, _795);
    float _817 = fma(_811, _721, _801);
    float _819 = fma(_811, _721, _805);
    float _821 = fma(_809, _721, _797);
    float _823 = fma(_304, 3.0, -1.0);
    float _825 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _827 = fma(_825, _769, _807);
    float _829 = fma(_825, _823, _813);
    float _831 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _833 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _835 = fma(_831, _769, _815);
    float _837 = fma(_833, _769, _817);
    float _839 = fma(_833, _823, _819);
    float _841 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _843 = fma(_831, _823, _821);
    float _845 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _847 = fma(_841, _761, _827);
    float _849 = fma(_841, _761, _829);
    float _851 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _853 = -_609;
    float _855 = _853 + _535;
    float _857 = fma(_845, _761, _835);
    float _859 = fma(_845, _761, _843);
    float _861 = fma(_851, _761, _837);
    float _863 = fma(_851, _761, _839);
    float _865 = fma(_380, _855, _609);
    float _867 = -_733;
    float _869 = fma(_535, _595, _867);
    float _871 = precise::max(_865, 1.52587890625e-05);
    float _873 = fma(_380, _869, _733);
    float _875 = 1.0 / _871;
    float _877 = _873 * _875;
    float _879 = fma(_380, _751, _735);
    bool _881 = !_557;
    int _883 = _881 ? as_type<int>(_877) : 0;
    bool _885 = !_569;
    int _887 = as_type<int>(_641);
    int _889 = _569 ? (-1) : 0;
    int _891 = _883;
    int _905;
    int _907;
    int _909;
    int _911;
    int _913;
    int _915;
    if (!_885)
    {
        float _893 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _895 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _897 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _899 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _901 = _637 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _903 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _905 = as_type<int>(_901);
        _907 = as_type<int>(_899);
        _909 = as_type<int>(_895);
        _911 = as_type<int>(_893);
        _913 = as_type<int>(_903);
        _915 = as_type<int>(_897);
        _917 = true;
    }
    else
    {
        int _919 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _921 = _919 != 0;
        float _923 = _847 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _925 = _857 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _927 = _861 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _929 = _849 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _931 = _859 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _933 = _863 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _935 = as_type<int>(_923);
        int _937 = as_type<int>(_925);
        int _939 = as_type<int>(_927);
        int _941 = as_type<int>(_931);
        _889 = _921 ? (-1) : 0;
        _913 = as_type<int>(_933);
        if (_921)
        {
            float _943 = _643 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _935 = as_type<int>(_943);
        }
        int _945 = _935;
        _911 = _945;
        if (_921)
        {
            float _947 = _607 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _937 = as_type<int>(_947);
        }
        int _949 = _937;
        _909 = _949;
        if (_921)
        {
            float _951 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _939 = as_type<int>(_951);
        }
        int _953 = _939;
        _915 = _953;
        if (!_921)
        {
            _887 = as_type<int>(_929);
        }
        int _955 = _887;
        int _957 = _955;
        if (_921)
        {
            _957 = _945;
        }
        int _959 = _957;
        _907 = _959;
        if (_921)
        {
            _941 = _949;
        }
        int _961 = _941;
        _905 = _961;
        if (_921)
        {
            _913 = _953;
        }
    }
    _917 = false;
    int _963 = _889;
    int _965 = _905;
    int _967 = _907;
    int _969 = _909;
    int _971 = _911;
    int _973 = _913;
    int _975 = _915;
    int _977 = 0;
    int _979 = _963;
    if (!_106)
    {
        int _981 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _983 = _981 != 0;
        _977 = _983 ? (-1) : 0;
    }
    int _985 = _977;
    if (_106)
    {
        _979 = -1;
    }
    int _987 = _979;
    float _989 = fma(_390, 2.0, -1.0);
    float _991 = fma(_392, 2.0, -1.0);
    int _993 = _987;
    if (!_106)
    {
        int _995 = ~_985;
        bool _997 = !_110;
        int _999 = _995 & (_997 ? (-1) : 0);
        _993 = _999;
    }
    int _1001 = _993;
    float _1003 = fma(_989, (*spvDescriptorSet0.fp_c3)._m0[22].x, _354);
    float _1005 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[22].y, _358);
    bool _1007 = _112 != 0;
    float2 _3142 = float2(_1003, _1005);
    float4 _1009 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3142, float2(0.0), isnan(_3142))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3142, float2(0.0), isnan(_3142))).xyzw;
    float _1011 = _1009.x;
    float _1013 = _1009.y;
    float _1015 = _1009.z;
    float _1017 = _1009.w;
    float _1019 = _452 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _1021 = as_type<float>(_883) * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _1023 = fma(_380, _855, _609);
    int _1025 = _1001;
    if (_102)
    {
        _1025 = -1;
    }
    int _1027 = _1025;
    float _1029 = exp2(_1019);
    int _1031 = _1027;
    if (!_102)
    {
        bool _1033 = !_110;
        bool _1035 = _1033 && _96;
        bool _1037 = !_1007;
        bool _1039 = _1035 && _1037;
        _1031 = _1039 ? (-1) : 0;
    }
    int _1041 = _1031;
    int _1043 = ~_1001;
    float _1045 = (_1043 != 0) ? as_type<float>(_965) : 0.0;
    float _1047 = as_type<float>(_883) * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _1049 = ~_1001;
    float _1051 = (_1049 != 0) ? as_type<float>(_967) : 0.0;
    float _1053 = _753 * _875;
    float _1055 = _757 * _875;
    float _1057 = _879 * _875;
    float _1059 = _553 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    bool _1061 = !_110;
    bool _1063 = _96 && _1061;
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    int _1069 = ~_1041;
    float _1071 = (_1069 != 0) ? as_type<float>(_969) : 0.0;
    int _1073 = ~_1041;
    float _1075 = (_1073 != 0) ? as_type<float>(_971) : 0.0;
    float _1077 = _1067 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _1079 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1081 = _1079 != 0;
    bool _1083 = !_1063;
    float _1085 = _1083 ? _1047 : 0.0;
    float _1087 = -_1077;
    float _1089 = _1087 + 1.0;
    bool _1091 = !_1063;
    float _1093 = _1091 ? _1021 : 0.0;
    int _1095 = ~_1001;
    float _1097 = (_1095 != 0) ? as_type<float>(_973) : 0.0;
    float _1099 = _1085 * _1051;
    bool _1101 = !_1081;
    float _1103 = abs(_1089);
    float _1105 = log2(_1103);
    bool _1107 = !_1081;
    float _1109 = _1085 * _1045;
    bool _1111 = !_1101;
    float _1113 = _1111 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1115 = fma(_1075, _1093, _1099);
    bool _1117 = !_1107;
    float _1119 = _1117 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1121 = fma(_1071, _1093, _1109);
    bool _1123 = !_1081;
    float _1125 = _1113 * _1115;
    int _1127 = ~_1041;
    float _1129 = (_1127 != 0) ? as_type<float>(_975) : 0.0;
    float _1131 = _1085 * _1097;
    float _1133 = _1119 * _1121;
    bool _1135 = !_1123;
    float _1137 = _1135 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1141 = _1139 != 0;
    float _1143 = fma(_1129, _1093, _1131);
    float _1145 = _1133 * 0.715200006961822509765625;
    float _1147 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1149 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1151 = _1137 * _1143;
    float _1153 = fma(_1125, 0.2125999927520751953125, _1145);
    float _1155 = -_384;
    float _1157 = _1155 + 1.0;
    bool _1159 = !_1141;
    float _1161 = exp2(_1147);
    float _1163 = fma(_1151, 0.072200000286102294921875, _1153);
    float _1165 = _1023 * _1157;
    bool _1167 = !_1141;
    float _1169 = -_1133;
    float _1171 = _1169 + _1163;
    float _1173 = -_1125;
    float _1175 = _1173 + _1163;
    float _1177 = -_1151;
    float _1179 = _1177 + _1163;
    float _1181 = exp2(_1149);
    float _1183 = fma(_1059, _1171, _1133);
    float _1185 = _1159 ? _1053 : 0.0;
    float _1187 = fma(_1059, _1175, _1125);
    float _1189 = fma(_1059, _1179, _1151);
    float _1191 = _1165 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _1193 = !_92;
    float _1195 = _1193 ? _1161 : 1.0;
    float _1197 = _1167 ? _1055 : 0.0;
    float _1199 = as_type<float>(_883) * _1195;
    float _1201 = _1195 * _1187;
    float _1203 = _1195 * _1183;
    bool _1205 = !_1141;
    bool _1207 = !_92;
    float _1209 = _1207 ? _1181 : 1.0;
    float _1211 = _1205 ? _1057 : 0.0;
    float _1213 = _96 ? _1199 : _1201;
    float _1215 = _1209 * _1185;
    float _1217 = _96 ? _1199 : _1203;
    float _1219 = _1199;
    float _1221 = _1195;
    float _1223 = _1215;
    if (!_96)
    {
        float _1225 = _1195 * _1189;
        _1219 = _1225;
    }
    float _1227 = _1219;
    float _1229 = _1209 * _1211;
    float _1231 = _1209 * _1197;
    float _1233 = _1227 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1235 = _1213 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1237 = fma(_1229, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1233);
    float _1239 = _1233;
    if (_92)
    {
        _1239 = 0.0;
    }
    float _1241 = _1239;
    float _1243 = _1217 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1245 = fma(_1215, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1235);
    float _1247 = fma(_1231, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1243);
    float _1249 = _1243;
    float _1251 = _1247;
    float _1253 = _1245;
    float _1255 = _1241;
    if (_92)
    {
        _1221 = 0.0;
    }
    float _1257 = _1221;
    float _1259 = _1257;
    if (_92)
    {
        _1223 = 0.0;
    }
    float _1261 = _1223;
    float _1263 = _1261;
    if (_92)
    {
        _891 = as_type<int>(_1191);
    }
    int _1265 = _891;
    bool _1267 = !_92;
    float _1269 = _1267 ? _1077 : 0.0;
    int _1271 = _1265;
    int _1273 = _1265;
    if (_92)
    {
        _1249 = _1237;
    }
    float _1275 = _1249;
    float _1277 = _1275;
    float _1279 = _1275;
    float _1281 = _1013;
    int _1283 = as_type<int>(_1015);
    int _1285 = as_type<int>(_1013);
    if (!_92)
    {
        int _1287 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1289 = _1287 != 0;
        float _1291 = _549 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1293 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1295 = _1293 != 0;
        float _1297 = _547 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1299 = _551 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1301 = !_1295;
        float _1303 = _1301 ? _1297 : 0.0;
        bool _1305 = !_1295;
        float _1307 = _1305 ? _1291 : 0.0;
        bool _1309 = !_1295;
        float _1311 = _1309 ? _1299 : 0.0;
        float _1313 = _1269 * _1303;
        _1255 = _1313;
        if (!_1289)
        {
            _1271 = as_type<int>(_1191);
        }
        int _1315 = _1271;
        float _1317 = _1269 * _1307;
        float _1319 = _1269 * _1311;
        _1259 = _1317;
        _1273 = _1315;
        _1263 = _1319;
        if (!_1289)
        {
            _1277 = _1237;
        }
        float _1321 = _1277;
        bool _1323 = !_1289;
        _1279 = _1321;
        if (!_1323)
        {
            float _1325 = -_1269;
            float _1327 = _1325 + 1.0;
            float _1329 = precise::clamp(_1327, 0.0, 1.0);
            float _1331 = _1329 * _1191;
            float _1333 = precise::max(_1331, 9.9999997473787516355514526367188e-05);
            float _1335 = 1.0 / _1333;
            float _1337 = _1335 * _1191;
            float _1339 = _1245 * _1337;
            float _1341 = _1247 * _1337;
            float _1343 = _1237 * _1337;
            _1251 = _1341;
            _1259 = 0.0;
            _1253 = _1339;
            _1255 = 0.0;
            _1273 = as_type<int>(_1331);
            _1279 = _1343;
            _1263 = 0.0;
        }
    }
    float _1345 = _1251;
    float _1347 = _1259;
    float _1349 = _1253;
    float _1351 = _1255;
    int _1353 = _1273;
    float _1355 = _1279;
    float _1357 = _1263;
    int _1359 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1361 = _1359 != 0;
    int _1363 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1365 = _1363 != 0;
    float _1367 = _541 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1369 = _1345 + _1347;
    float _1371 = _539 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1373 = _1349 + _1351;
    bool _1375 = !_1365;
    float _1377 = _1375 ? as_type<float>(_1353) : 1.0;
    float _1379 = _1355 + _1357;
    float _1381 = -_1377;
    float _1383 = _1381 + 1.0;
    float _1385 = abs(_1383);
    float _1387 = log2(_1385);
    float _1389 = _1387 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1391 = exp2(_1389);
    float _1393 = -_1391;
    float _1395 = spvFAdd(_1393, 1.00010001659393310546875);
    float _1397 = -_1391;
    float _1399 = _1397 + 1.0;
    float _1401 = -_1377;
    float _1403 = _1401 + _1399;
    float _1405 = 1.0 / _1395;
    float _1407 = _1367 * _1403;
    float _1409 = _543 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1411 = _1371 * _1403;
    float _1413 = fma(_1369, _1377, _1407);
    float _1415 = _1409 * _1403;
    float _1417 = fma(_1373, _1377, _1411);
    float _1419 = _1405 * _1413;
    float _1421 = fma(_1379, _1377, _1415);
    float _1423 = _1405 * _1417;
    float _1425 = _1419 * 0.715200006961822509765625;
    float _1427 = _1405 * _1421;
    float _1429 = fma(_1423, 0.2125999927520751953125, _1425);
    float _1431 = fma(_1427, 0.072200000286102294921875, _1429);
    float _1433 = 1.0 / _1431;
    float _1435 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1437 = precise::clamp(_1435, 0.0, 1.0);
    float _1439 = fma(_1437, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1441 = _1439 * _1017;
    float _1443 = fma(_1423, _1441, _1011);
    float _1445 = fma(_1419, _1441, _1013);
    float _1447 = fma(_1427, _1441, _1015);
    bool _1449 = !_1361;
    float _1451 = _1445;
    float _1453 = _1443;
    int _1455 = as_type<int>(_1443);
    float _1457 = _1445;
    if (!_1449)
    {
        bool _1459 = _1399 != 1.0;
        bool _1461 = isnan(_1399);
        bool _1463 = _1459 || _1461;
        bool _1465 = isnan(1.0);
        bool _1467 = _1463 || _1465;
        float _1469 = -_1391;
        bool _1471 = _1469 != (-1.0);
        bool _1473 = isnan(_1469);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan(-1.0);
        bool _1479 = _1475 || _1477;
        float _1481 = -_1391;
        bool _1483 = _1481 == (-1.0);
        bool _1485 = !_1467;
        bool _1487 = _1483 || _1485;
        bool _1489 = _1399 == 1.0;
        bool _1491 = _1489 && _1479;
        bool _1493 = !_1487;
        float _1495 = _1493 ? _1399 : 0.0;
        bool _1497 = !_1491;
        float _1499 = _1497 ? 0.0 : 1.0;
        float _1501 = _1487 ? 0.0 : 0.5;
        float _1503 = _1495 * 0.715200006961822509765625;
        float _1505 = fma(_1499, 0.2125999927520751953125, _1503);
        float _1507 = fma(_1501, 0.072200000286102294921875, _1505);
        float _1509 = 1.0 / _1507;
        float _1511 = _1509 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1513 = precise::clamp(_1511, 0.0, 1.0);
        float _1515 = fma(_1513, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1517 = _1499 * _1515;
        float _1519 = _1495 * _1515;
        float _1521 = _1501 * _1515;
        out.m_52.x = _1517;
        out.m_52.y = _1519;
        out.m_52.z = _1521;
        out.m_52.w = 1.0;
        return out;
    }
    bool _1523 = _112 != 0;
    bool _1525 = !_1523;
    if (!_1525)
    {
        if (_102)
        {
            _1281 = 0.0;
        }
        float _1527 = _1281;
        float _1529 = _1527;
        if (_102)
        {
            _1451 = 0.0;
        }
        float _1531 = _1451;
        float _1533 = _1531;
        if (!_102)
        {
            float _1535 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1533 = _1535;
        }
        float _1537 = _1533;
        float _1539 = _1537;
        if (!_102)
        {
            float _1541 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1529 = _1541;
        }
        float _1543 = _1529;
        float _1545 = _1543;
        if (!_106)
        {
            float _1547 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1537);
            _1539 = _1547;
        }
        float _1549 = _1539;
        if (_102)
        {
            _1453 = 0.0;
        }
        float _1551 = _1453;
        float _1553 = _1551;
        if (!_102)
        {
            float _1555 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1553 = _1555;
        }
        float _1557 = _1553;
        float _1559 = _1549 * 0.715200006961822509765625;
        float _1561 = _1557;
        if (!_106)
        {
            float _1563 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1543);
            _1545 = _1563;
        }
        float _1565 = _1545;
        if (!_106)
        {
            float _1567 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1557);
            _1561 = _1567;
        }
        float _1569 = _1561;
        float _1571 = fma(_1565, 0.2125999927520751953125, _1559);
        float _1573 = fma(_1569, 0.072200000286102294921875, _1571);
        float _1575 = 1.0 / _1573;
        float _1577 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1579 = precise::clamp(_1577, 0.0, 1.0);
        float _1581 = fma(_1579, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1583 = _1581 * _1565;
        float _1585 = _1581 * _1549;
        float _1587 = _1581 * _1569;
        out.m_52.x = _1583;
        out.m_52.y = _1585;
        out.m_52.z = _1587;
        out.m_52.w = 1.0;
        return out;
    }
    if (!_110)
    {
        _1283 = as_type<int>(_1443);
    }
    int _1589 = _1283;
    if (!_110)
    {
        _1455 = as_type<int>(_1447);
    }
    int _1591 = _1455;
    float _1593 = as_type<float>(_1591);
    if (!_110)
    {
        _1285 = as_type<int>(_1399);
    }
    int _1595 = _1285;
    float _1597 = as_type<float>(_1595);
    if (!_110)
    {
        out.m_52.x = as_type<float>(_1589);
        out.m_52.y = _1445;
        out.m_52.z = as_type<float>(_1591);
        out.m_52.w = as_type<float>(_1595);
        return out;
    }
    if (_102)
    {
        _1597 = 0.0;
    }
    float _1599 = _1597;
    float _1601 = _1599;
    if (_102)
    {
        _1457 = 0.0;
    }
    float _1603 = _1457;
    float _1605 = _1603;
    if (!_102)
    {
        float _1607 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1609;
    if (!_102)
    {
        float _1613 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1601 = _1613;
    }
    float _1615 = _1601;
    float _1617 = _1615;
    if (!_106)
    {
        float _1619 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1609);
        _1611 = _1619;
    }
    float _1621 = _1611;
    if (_102)
    {
        _1593 = 0.0;
    }
    float _1623 = _1593;
    float _1625 = _1623;
    if (!_102)
    {
        float _1627 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1625 = _1627;
    }
    float _1629 = _1625;
    float _1631 = _1621 * 0.715200006961822509765625;
    float _1633 = _1629;
    if (!_106)
    {
        float _1635 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1615);
        _1617 = _1635;
    }
    float _1637 = _1617;
    if (!_106)
    {
        float _1639 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1629);
        _1633 = _1639;
    }
    float _1641 = _1633;
    float _1643 = fma(_1637, 0.2125999927520751953125, _1631);
    float _1645 = fma(_1641, 0.072200000286102294921875, _1643);
    float _1647 = 1.0 / _1645;
    float _1649 = _1647 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = fma(_1651, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1655 = _1653 * _1637;
    float _1657 = _1653 * _1621;
    float _1659 = _1653 * _1641;
    out.m_52.x = _1655;
    out.m_52.y = _1657;
    out.m_52.z = _1659;
    out.m_52.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_52 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _917 = false;
    bool _276 = false;
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
    float _88 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    int _90 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1;
    bool _92 = _90 != 0;
    int _94 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8;
    bool _96 = _94 != 0;
    float _98 = precise::max(0.0, _88);
    int _100 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 32;
    bool _102 = _100 != 0;
    int _104 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 64;
    bool _106 = _104 != 0;
    int _108 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 8192;
    bool _110 = _108 != 0;
    int _112 = int(_86);
    float _114 = 1.0 / _62;
    float _116 = _114 * _68;
    float _118 = _114 * _74;
    float _120 = _114 * _80;
    float _122 = _116 * _116;
    float _124 = fma(_118, _118, _122);
    float _126 = fma(_120, _120, _124);
    float _128 = rsqrt(_126);
    float _130 = _118 * _128;
    float _132 = _120 * _128;
    float _134 = _116 * _128;
    float _136 = _130 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _140 = -_134;
    float _142 = -_98;
    float _144 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[13].z, _142);
    float _146 = _136 * _136;
    float _148 = _138 * _138;
    float _150 = _146 + _148;
    float _152 = sqrt(_150);
    bool _154 = _152 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _156 = _98;
    float _158 = _128;
    float _160 = _144;
    float _162 = _136;
    float _164 = _138;
    if (!_154)
    {
        _156 = _148;
    }
    float _166 = _156;
    float _168 = _166;
    if (!_154)
    {
        _158 = _146;
    }
    float _170 = _158;
    bool _172 = !_154;
    float _174 = _170;
    if (!_172)
    {
        float _176 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _178 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _180 = _152 + _178;
        float _182 = _144 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _184 = rsqrt(_150);
        float _186 = _180 * _176;
        float _188 = _186 * 0.15915493667125701904296875;
        float _190 = _188 * 6.283185482025146484375;
        float _192 = sin(_190);
        float _194 = _188 * 6.283185482025146484375;
        float _196 = cos(_194);
        float _198 = fma(_192, _182, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _200 = _184 * _198;
        float _202 = _196 + (-1.0);
        float _204 = _136 * _200;
        float _206 = _138 * _200;
        float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _210 = _206 * _206;
        float _212 = fma(_144, _196, _208);
        float _214 = _204 * _204;
        _160 = _212;
        _174 = _214;
        _168 = _210;
        _162 = _204;
        _164 = _206;
    }
    float _216 = _160;
    float _218 = _174;
    float _220 = _168;
    float _222 = _162;
    float _224 = _164;
    float _226 = fma(_216, _216, _218);
    float _228 = _226 + _220;
    float _230 = rsqrt(_228);
    float _232 = _230 * _216;
    float _234 = -_232;
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
        int _258 = 0;
        int _260 = as_type<int>(_242);
        int _262 = 1200;
        int _264;
        int _266;
        int _268;
        int _270;
        int _272;
        _58(_256, _258, _260, _262, _264, _266, _268, _270, _272);
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
    bool _302 = _232 > 0.0;
    float _304 = _132 * _132;
    float _306 = _130 * _130;
    float _308 = _304 + _306;
    if (_302)
    {
        discard_fragment();
    }
    float _310 = rsqrt(_308);
    float _312 = _252 * _300;
    float _314 = in.m_49.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_49.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _312 * 0.636619746685028076171875;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = -_328;
    float _332 = _330 + 1.0;
    float _334 = sqrt(_332);
    float _336 = _132 * _310;
    float _338 = _130 * _310;
    float _340 = abs(_336);
    float _342 = abs(_338);
    float _344 = precise::max(_340, _342);
    float _346 = precise::max(_344, 9.9999997473787516355514526367188e-05);
    float _348 = -_334;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _346;
    float _354 = _114 * _318;
    float _356 = _350 * 0.5;
    float _358 = _114 * _324;
    float _360 = -_352;
    float _362 = _336 * _360;
    float _364 = _338 * _352;
    float _366 = fma(_362, _356, 0.5);
    float _368 = fma(_364, _356, 0.5);
    float2 _2085;
    _2085.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_366, _368));
    _2085.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_366, _368));
    float _370 = _2085.x;
    float _372 = _370 * 256.0;
    int _374 = int(_372);
    float2 _2095 = float2(_354, _358);
    float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2095, float2(0.0), isnan(_2095))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2095, float2(0.0), isnan(_2095))).xyz;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float2 _2111 = float2(_354, _358);
    float2 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2111, float2(0.0), isnan(_2111))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2111, float2(0.0), isnan(_2111))).xy;
    float _390 = _388.x;
    float _392 = _388.y;
    if (_302)
    {
        out.m_52.x = 0.0;
        out.m_52.y = 0.0;
        out.m_52.z = 0.0;
        out.m_52.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_52)};
    }
    float _394 = -_134;
    float _396 = _394 + 1.0;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = -_134;
    float _402 = fma(_400, _134, 1.0);
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _230 * _222;
    int _408 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2;
    bool _410 = _408 != 0;
    float _412 = _230 * _224;
    float _414 = float(uint(_374));
    float _416 = fma(_232, -0.5, 0.5);
    float _418 = _414 * 0.00390625;
    float _420 = _398;
    if (_410)
    {
        float _422 = sqrt(_404);
        _420 = _422;
    }
    float _424 = _420;
    float _426 = abs(_424);
    float _428 = log2(_426);
    float _430 = _428 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _432 = exp2(_430);
    float _434 = _432 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _436 = fma(_434, (*spvDescriptorSet0.fp_c3)._m0[12].x, (*spvDescriptorSet0.fp_c3)._m0[12].y);
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _406 * (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _442 = -_438;
    float _444 = _442 + 1.0;
    float _446 = -_440;
    float _448 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[11].y, _446);
    float _450 = abs(_444);
    float _452 = log2(_450);
    float _454 = -_412;
    float _456 = fma(_454, (*spvDescriptorSet0.fp_c3)._m0[11].z, _448);
    float _458 = fma(_456, -0.5, 0.5);
    float _460 = fma(_456, 0.5, 0.5);
    float _462 = fma(_460, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _464 = sqrt(_458);
    float _466 = fma(_460, _462, -0.212114393711090087890625);
    float _468 = _232 + 1.0;
    float _470 = _452 * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _472 = fma(_460, _466, 1.570728778839111328125);
    float _474 = exp2(_470);
    float _476 = _464 * 0.636619746685028076171875;
    float _478 = -_472;
    float _480 = fma(_476, _478, 1.0);
    float _482 = -_232;
    float _484 = fma(_474, _468, _482);
    float _486 = fma(_484, 0.5, 0.5);
    float2 _2261 = float2(_366, _368);
    float4 _489 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_2261, float2(0.0), isnan(_2261)), level(_418)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_2261, float2(0.0), isnan(_2261)), level(_418)).xyzw;
    float _491 = _489.x;
    float _493 = _489.y;
    float _495 = _489.z;
    float _497 = _489.w;
    float2 _2278 = float2(_366, _368);
    float2 _499 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2278, float2(0.0), isnan(_2278)), level(_418)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2278, float2(0.0), isnan(_2278)), level(_418)).xy;
    float _501 = _499.x;
    float _503 = _499.y;
    float2 _2291 = float2(_366, _368);
    float4 _505 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2291, float2(0.0), isnan(_2291)), level(_418)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2291, float2(0.0), isnan(_2291)), level(_418)).xyzw;
    float _507 = _505.x;
    float _509 = _505.y;
    float _511 = _505.z;
    float _513 = _505.w;
    float2 _2308 = float2(_366, _368);
    float2 _515 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2308, float2(0.0), isnan(_2308)), level(_418)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2308, float2(0.0), isnan(_2308)), level(_418)).xy;
    float _517 = _515.x;
    float _519 = _515.y;
    float2 _2321 = float2(_366, _368);
    float4 _521 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2321, float2(0.0), isnan(_2321)), level(_418)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2321, float2(0.0), isnan(_2321)), level(_418)).xyzw;
    float _523 = _521.x;
    float _525 = _521.y;
    float _527 = _521.z;
    float _529 = _521.w;
    float2 _2338 = float2(_366, _368);
    float2 _531 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2338, float2(0.0), isnan(_2338)), level(_418)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2338, float2(0.0), isnan(_2338)), level(_418)).xy;
    float _533 = _531.x;
    float _535 = _531.y;
    float2 _2351 = float2(_480, _416);
    float3 _537 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2351, float2(0.0), isnan(_2351))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2351, float2(0.0), isnan(_2351))).xyz;
    float _539 = _537.x;
    float _541 = _537.y;
    float _543 = _537.z;
    float2 _2365 = float2(_480, _486);
    float3 _545 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2365, float2(0.0), isnan(_2365))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2365, float2(0.0), isnan(_2365))).xyz;
    float _547 = _545.x;
    float _549 = _545.y;
    float _551 = _545.z;
    float _553 = _380 * _382;
    int _555 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 1024;
    bool _557 = _555 != 0;
    float _559 = -(*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _561 = _559 + 1.0;
    float _563 = -_553;
    float _565 = _563 + 1.0;
    int _567 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 256;
    bool _569 = _567 != 0;
    float _571 = -(*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _573 = _571 + 1.0;
    float _575 = fma(_565, _561, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _577 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _579 = fma(_565, _573, (*spvDescriptorSet0.fp_c3)._m0[2].z);
    float _581 = _497 * _497;
    float _583 = _501 * _503;
    float _585 = _513 * _513;
    float _587 = _581 * _581;
    float _589 = -_583;
    float _591 = fma(_517, _519, _589);
    float _593 = _585 * _585;
    float _595 = _533 * _579;
    float _597 = _587 * 16.0;
    float _599 = fma(_591, (*spvDescriptorSet0.fp_c3)._m0[0].x, _583);
    float _601 = -_503;
    float _603 = _601 + _519;
    float _605 = _597 * _503;
    float _607 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _609 = fma(_603, (*spvDescriptorSet0.fp_c3)._m0[0].x, _503);
    float _611 = _491 * _605;
    float _613 = _493 * _605;
    float _615 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _617 = _495 * _605;
    float _619 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _621 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _623 = fma(_134, _615, _607);
    float _625 = -_132;
    float _627 = fma(_625, _619, _623);
    float _629 = fma(_132, _619, _623);
    float _631 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _633 = -_130;
    float _635 = fma(_633, _631, _627);
    float _637 = fma(_130, _631, _629);
    float _639 = _593 * 16.0;
    float _641 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _643 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _645 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _647 = _639 * _519;
    float _649 = fma(_134, _621, _641);
    float _651 = fma(_134, _577, _643);
    float _653 = -_611;
    float _655 = fma(_507, _647, _653);
    float _657 = -_613;
    float _659 = fma(_509, _647, _657);
    float _661 = -_617;
    float _663 = fma(_511, _647, _661);
    float _665 = -_132;
    float _667 = fma(_665, _645, _649);
    float _669 = fma(_655, (*spvDescriptorSet0.fp_c3)._m0[0].x, _611);
    float _671 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _673 = fma(_132, _645, _649);
    float _675 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _677 = fma(_659, (*spvDescriptorSet0.fp_c3)._m0[0].x, _613);
    float _679 = -_132;
    float _681 = fma(_679, _671, _651);
    float _683 = fma(_132, _671, _651);
    float _685 = precise::max(_609, 1.52587890625e-05);
    float _687 = -_130;
    float _689 = fma(_687, _675, _667);
    float _691 = fma(_130, _675, _673);
    float _693 = _529 * _529;
    float _695 = 1.02332699298858642578125 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _697 = fma(_663, (*spvDescriptorSet0.fp_c3)._m0[0].x, _617);
    float _699 = 1.0 / _685;
    float _701 = _693 * _693;
    float _703 = -_130;
    float _705 = fma(_703, _695, _681);
    float _707 = fma(_130, _695, _683);
    float _709 = _130 * _134;
    float _711 = _701 * 16.0;
    float _713 = _711 * _575;
    float _715 = _132 * (-3.0);
    float _717 = _535 * _713;
    float _719 = _527 * _713;
    float _721 = _130 * _132;
    float _723 = _609 * _699;
    float _725 = -_132;
    float _727 = _134 * _725;
    float _729 = _669 * _723;
    float _731 = _677 * _723;
    float _733 = _599 * _723;
    float _735 = _697 * _723;
    float _737 = -_729;
    float _739 = fma(_523, _717, _737);
    float _741 = -_731;
    float _743 = fma(_525, _717, _741);
    float _745 = -_134;
    float _747 = _130 * _745;
    float _749 = -_735;
    float _751 = fma(_535, _719, _749);
    float _753 = fma(_380, _739, _729);
    float _755 = _130 * _130;
    float _757 = fma(_380, _743, _731);
    float _759 = -_134;
    float _761 = fma(_759, _134, _755);
    float _763 = _134 * _132;
    float _765 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _767 = -_132;
    float _769 = fma(_767, _715, -1.0);
    float _771 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _773 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _775 = fma(_765, _747, _705);
    float _777 = fma(_765, _709, _707);
    float _779 = fma(_771, _727, _775);
    float _781 = fma(_771, _763, _777);
    float _783 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _785 = fma(_783, _747, _635);
    float _787 = fma(_783, _709, _637);
    float _789 = fma(_773, _747, _689);
    float _791 = fma(_773, _709, _691);
    float _793 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _795 = fma(_793, _727, _785);
    float _797 = fma(_793, _763, _787);
    float _799 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _801 = fma(_799, _727, _789);
    float _803 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _805 = fma(_799, _763, _791);
    float _807 = fma(_803, _721, _779);
    float _809 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _811 = 0.85808598995208740234375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _813 = fma(_803, _721, _781);
    float _815 = fma(_809, _721, _795);
    float _817 = fma(_811, _721, _801);
    float _819 = fma(_811, _721, _805);
    float _821 = fma(_809, _721, _797);
    float _823 = fma(_304, 3.0, -1.0);
    float _825 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _827 = fma(_825, _769, _807);
    float _829 = fma(_825, _823, _813);
    float _831 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _833 = 0.2477079927921295166015625 * (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _835 = fma(_831, _769, _815);
    float _837 = fma(_833, _769, _817);
    float _839 = fma(_833, _823, _819);
    float _841 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _843 = fma(_831, _823, _821);
    float _845 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _847 = fma(_841, _761, _827);
    float _849 = fma(_841, _761, _829);
    float _851 = 0.429042994976043701171875 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _853 = -_609;
    float _855 = _853 + _535;
    float _857 = fma(_845, _761, _835);
    float _859 = fma(_845, _761, _843);
    float _861 = fma(_851, _761, _837);
    float _863 = fma(_851, _761, _839);
    float _865 = fma(_380, _855, _609);
    float _867 = -_733;
    float _869 = fma(_535, _595, _867);
    float _871 = precise::max(_865, 1.52587890625e-05);
    float _873 = fma(_380, _869, _733);
    float _875 = 1.0 / _871;
    float _877 = _873 * _875;
    float _879 = fma(_380, _751, _735);
    bool _881 = !_557;
    int _883 = _881 ? as_type<int>(_877) : 0;
    bool _885 = !_569;
    int _887 = as_type<int>(_641);
    int _889 = _569 ? (-1) : 0;
    int _891 = _883;
    int _905;
    int _907;
    int _909;
    int _911;
    int _913;
    int _915;
    if (!_885)
    {
        float _893 = _705 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _895 = _635 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _897 = _689 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _899 = _707 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _901 = _637 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _903 = _691 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        _905 = as_type<int>(_901);
        _907 = as_type<int>(_899);
        _909 = as_type<int>(_895);
        _911 = as_type<int>(_893);
        _913 = as_type<int>(_903);
        _915 = as_type<int>(_897);
        _917 = true;
    }
    else
    {
        int _919 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 128;
        bool _921 = _919 != 0;
        float _923 = _847 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _925 = _857 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _927 = _861 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _929 = _849 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _931 = _859 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _933 = _863 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _935 = as_type<int>(_923);
        int _937 = as_type<int>(_925);
        int _939 = as_type<int>(_927);
        int _941 = as_type<int>(_931);
        _889 = _921 ? (-1) : 0;
        _913 = as_type<int>(_933);
        if (_921)
        {
            float _943 = _643 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _935 = as_type<int>(_943);
        }
        int _945 = _935;
        _911 = _945;
        if (_921)
        {
            float _947 = _607 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _937 = as_type<int>(_947);
        }
        int _949 = _937;
        _909 = _949;
        if (_921)
        {
            float _951 = _641 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
            _939 = as_type<int>(_951);
        }
        int _953 = _939;
        _915 = _953;
        if (!_921)
        {
            _887 = as_type<int>(_929);
        }
        int _955 = _887;
        int _957 = _955;
        if (_921)
        {
            _957 = _945;
        }
        int _959 = _957;
        _907 = _959;
        if (_921)
        {
            _941 = _949;
        }
        int _961 = _941;
        _905 = _961;
        if (_921)
        {
            _913 = _953;
        }
    }
    _917 = false;
    int _963 = _889;
    int _965 = _905;
    int _967 = _907;
    int _969 = _909;
    int _971 = _911;
    int _973 = _913;
    int _975 = _915;
    int _977 = 0;
    int _979 = _963;
    if (!_106)
    {
        int _981 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4104;
        bool _983 = _981 != 0;
        _977 = _983 ? (-1) : 0;
    }
    int _985 = _977;
    if (_106)
    {
        _979 = -1;
    }
    int _987 = _979;
    float _989 = fma(_390, 2.0, -1.0);
    float _991 = fma(_392, 2.0, -1.0);
    int _993 = _987;
    if (!_106)
    {
        int _995 = ~_985;
        bool _997 = !_110;
        int _999 = _995 & (_997 ? (-1) : 0);
        _993 = _999;
    }
    int _1001 = _993;
    float _1003 = fma(_989, (*spvDescriptorSet0.fp_c3)._m0[22].x, _354);
    float _1005 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[22].y, _358);
    bool _1007 = _112 != 0;
    float2 _3142 = float2(_1003, _1005);
    float4 _1009 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3142, float2(0.0), isnan(_3142))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3142, float2(0.0), isnan(_3142))).xyzw;
    float _1011 = _1009.x;
    float _1013 = _1009.y;
    float _1015 = _1009.z;
    float _1017 = _1009.w;
    float _1019 = _452 * (*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _1021 = as_type<float>(_883) * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _1023 = fma(_380, _855, _609);
    int _1025 = _1001;
    if (_102)
    {
        _1025 = -1;
    }
    int _1027 = _1025;
    float _1029 = exp2(_1019);
    int _1031 = _1027;
    if (!_102)
    {
        bool _1033 = !_110;
        bool _1035 = _1033 && _96;
        bool _1037 = !_1007;
        bool _1039 = _1035 && _1037;
        _1031 = _1039 ? (-1) : 0;
    }
    int _1041 = _1031;
    int _1043 = ~_1001;
    float _1045 = (_1043 != 0) ? as_type<float>(_965) : 0.0;
    float _1047 = as_type<float>(_883) * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    int _1049 = ~_1001;
    float _1051 = (_1049 != 0) ? as_type<float>(_967) : 0.0;
    float _1053 = _753 * _875;
    float _1055 = _757 * _875;
    float _1057 = _879 * _875;
    float _1059 = _553 * (*spvDescriptorSet0.fp_c3)._m0[2].x;
    bool _1061 = !_110;
    bool _1063 = _96 && _1061;
    float _1065 = -_1029;
    float _1067 = _1065 + 1.0;
    int _1069 = ~_1041;
    float _1071 = (_1069 != 0) ? as_type<float>(_969) : 0.0;
    int _1073 = ~_1041;
    float _1075 = (_1073 != 0) ? as_type<float>(_971) : 0.0;
    float _1077 = _1067 * (*spvDescriptorSet0.fp_c3)._m0[12].w;
    int _1079 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16;
    bool _1081 = _1079 != 0;
    bool _1083 = !_1063;
    float _1085 = _1083 ? _1047 : 0.0;
    float _1087 = -_1077;
    float _1089 = _1087 + 1.0;
    bool _1091 = !_1063;
    float _1093 = _1091 ? _1021 : 0.0;
    int _1095 = ~_1001;
    float _1097 = (_1095 != 0) ? as_type<float>(_973) : 0.0;
    float _1099 = _1085 * _1051;
    bool _1101 = !_1081;
    float _1103 = abs(_1089);
    float _1105 = log2(_1103);
    bool _1107 = !_1081;
    float _1109 = _1085 * _1045;
    bool _1111 = !_1101;
    float _1113 = _1111 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _1115 = fma(_1075, _1093, _1099);
    bool _1117 = !_1107;
    float _1119 = _1117 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _1121 = fma(_1071, _1093, _1109);
    bool _1123 = !_1081;
    float _1125 = _1113 * _1115;
    int _1127 = ~_1041;
    float _1129 = (_1127 != 0) ? as_type<float>(_975) : 0.0;
    float _1131 = _1085 * _1097;
    float _1133 = _1119 * _1121;
    bool _1135 = !_1123;
    float _1137 = _1135 ? 1.0 : (*spvDescriptorSet0.fp_c3)._m0[23].z;
    int _1139 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 512;
    bool _1141 = _1139 != 0;
    float _1143 = fma(_1129, _1093, _1131);
    float _1145 = _1133 * 0.715200006961822509765625;
    float _1147 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _1149 = _1105 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _1151 = _1137 * _1143;
    float _1153 = fma(_1125, 0.2125999927520751953125, _1145);
    float _1155 = -_384;
    float _1157 = _1155 + 1.0;
    bool _1159 = !_1141;
    float _1161 = exp2(_1147);
    float _1163 = fma(_1151, 0.072200000286102294921875, _1153);
    float _1165 = _1023 * _1157;
    bool _1167 = !_1141;
    float _1169 = -_1133;
    float _1171 = _1169 + _1163;
    float _1173 = -_1125;
    float _1175 = _1173 + _1163;
    float _1177 = -_1151;
    float _1179 = _1177 + _1163;
    float _1181 = exp2(_1149);
    float _1183 = fma(_1059, _1171, _1133);
    float _1185 = _1159 ? _1053 : 0.0;
    float _1187 = fma(_1059, _1175, _1125);
    float _1189 = fma(_1059, _1179, _1151);
    float _1191 = _1165 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    bool _1193 = !_92;
    float _1195 = _1193 ? _1161 : 1.0;
    float _1197 = _1167 ? _1055 : 0.0;
    float _1199 = as_type<float>(_883) * _1195;
    float _1201 = _1195 * _1187;
    float _1203 = _1195 * _1183;
    bool _1205 = !_1141;
    bool _1207 = !_92;
    float _1209 = _1207 ? _1181 : 1.0;
    float _1211 = _1205 ? _1057 : 0.0;
    float _1213 = _96 ? _1199 : _1201;
    float _1215 = _1209 * _1185;
    float _1217 = _96 ? _1199 : _1203;
    float _1219 = _1199;
    float _1221 = _1195;
    float _1223 = _1215;
    if (!_96)
    {
        float _1225 = _1195 * _1189;
        _1219 = _1225;
    }
    float _1227 = _1219;
    float _1229 = _1209 * _1211;
    float _1231 = _1209 * _1197;
    float _1233 = _1227 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _1235 = _1213 * (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _1237 = fma(_1229, (*spvDescriptorSet0.fp_c3)._m0[27].z, _1233);
    float _1239 = _1233;
    if (_92)
    {
        _1239 = 0.0;
    }
    float _1241 = _1239;
    float _1243 = _1217 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _1245 = fma(_1215, (*spvDescriptorSet0.fp_c3)._m0[27].x, _1235);
    float _1247 = fma(_1231, (*spvDescriptorSet0.fp_c3)._m0[27].y, _1243);
    float _1249 = _1243;
    float _1251 = _1247;
    float _1253 = _1245;
    float _1255 = _1241;
    if (_92)
    {
        _1221 = 0.0;
    }
    float _1257 = _1221;
    float _1259 = _1257;
    if (_92)
    {
        _1223 = 0.0;
    }
    float _1261 = _1223;
    float _1263 = _1261;
    if (_92)
    {
        _891 = as_type<int>(_1191);
    }
    int _1265 = _891;
    bool _1267 = !_92;
    float _1269 = _1267 ? _1077 : 0.0;
    int _1271 = _1265;
    int _1273 = _1265;
    if (_92)
    {
        _1249 = _1237;
    }
    float _1275 = _1249;
    float _1277 = _1275;
    float _1279 = _1275;
    float _1281 = _1013;
    int _1283 = as_type<int>(_1015);
    int _1285 = as_type<int>(_1013);
    if (!_92)
    {
        int _1287 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 4;
        bool _1289 = _1287 != 0;
        float _1291 = _549 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        int _1293 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 5;
        bool _1295 = _1293 != 0;
        float _1297 = _547 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        float _1299 = _551 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
        bool _1301 = !_1295;
        float _1303 = _1301 ? _1297 : 0.0;
        bool _1305 = !_1295;
        float _1307 = _1305 ? _1291 : 0.0;
        bool _1309 = !_1295;
        float _1311 = _1309 ? _1299 : 0.0;
        float _1313 = _1269 * _1303;
        _1255 = _1313;
        if (!_1289)
        {
            _1271 = as_type<int>(_1191);
        }
        int _1315 = _1271;
        float _1317 = _1269 * _1307;
        float _1319 = _1269 * _1311;
        _1259 = _1317;
        _1273 = _1315;
        _1263 = _1319;
        if (!_1289)
        {
            _1277 = _1237;
        }
        float _1321 = _1277;
        bool _1323 = !_1289;
        _1279 = _1321;
        if (!_1323)
        {
            float _1325 = -_1269;
            float _1327 = _1325 + 1.0;
            float _1329 = precise::clamp(_1327, 0.0, 1.0);
            float _1331 = _1329 * _1191;
            float _1333 = precise::max(_1331, 9.9999997473787516355514526367188e-05);
            float _1335 = 1.0 / _1333;
            float _1337 = _1335 * _1191;
            float _1339 = _1245 * _1337;
            float _1341 = _1247 * _1337;
            float _1343 = _1237 * _1337;
            _1251 = _1341;
            _1259 = 0.0;
            _1253 = _1339;
            _1255 = 0.0;
            _1273 = as_type<int>(_1331);
            _1279 = _1343;
            _1263 = 0.0;
        }
    }
    float _1345 = _1251;
    float _1347 = _1259;
    float _1349 = _1253;
    float _1351 = _1255;
    int _1353 = _1273;
    float _1355 = _1279;
    float _1357 = _1263;
    int _1359 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 2048;
    bool _1361 = _1359 != 0;
    int _1363 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[1].w) & 16384;
    bool _1365 = _1363 != 0;
    float _1367 = _541 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1369 = _1345 + _1347;
    float _1371 = _539 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1373 = _1349 + _1351;
    bool _1375 = !_1365;
    float _1377 = _1375 ? as_type<float>(_1353) : 1.0;
    float _1379 = _1355 + _1357;
    float _1381 = -_1377;
    float _1383 = _1381 + 1.0;
    float _1385 = abs(_1383);
    float _1387 = log2(_1385);
    float _1389 = _1387 * (*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _1391 = exp2(_1389);
    float _1393 = -_1391;
    float _1395 = spvFAdd(_1393, 1.00010001659393310546875);
    float _1397 = -_1391;
    float _1399 = _1397 + 1.0;
    float _1401 = -_1377;
    float _1403 = _1401 + _1399;
    float _1405 = 1.0 / _1395;
    float _1407 = _1367 * _1403;
    float _1409 = _543 * (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _1411 = _1371 * _1403;
    float _1413 = fma(_1369, _1377, _1407);
    float _1415 = _1409 * _1403;
    float _1417 = fma(_1373, _1377, _1411);
    float _1419 = _1405 * _1413;
    float _1421 = fma(_1379, _1377, _1415);
    float _1423 = _1405 * _1417;
    float _1425 = _1419 * 0.715200006961822509765625;
    float _1427 = _1405 * _1421;
    float _1429 = fma(_1423, 0.2125999927520751953125, _1425);
    float _1431 = fma(_1427, 0.072200000286102294921875, _1429);
    float _1433 = 1.0 / _1431;
    float _1435 = _1433 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1437 = precise::clamp(_1435, 0.0, 1.0);
    float _1439 = fma(_1437, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1441 = _1439 * _1017;
    float _1443 = fma(_1423, _1441, _1011);
    float _1445 = fma(_1419, _1441, _1013);
    float _1447 = fma(_1427, _1441, _1015);
    bool _1449 = !_1361;
    float _1451 = _1445;
    float _1453 = _1443;
    int _1455 = as_type<int>(_1443);
    float _1457 = _1445;
    if (!_1449)
    {
        bool _1459 = _1399 != 1.0;
        bool _1461 = isnan(_1399);
        bool _1463 = _1459 || _1461;
        bool _1465 = isnan(1.0);
        bool _1467 = _1463 || _1465;
        float _1469 = -_1391;
        bool _1471 = _1469 != (-1.0);
        bool _1473 = isnan(_1469);
        bool _1475 = _1471 || _1473;
        bool _1477 = isnan(-1.0);
        bool _1479 = _1475 || _1477;
        float _1481 = -_1391;
        bool _1483 = _1481 == (-1.0);
        bool _1485 = !_1467;
        bool _1487 = _1483 || _1485;
        bool _1489 = _1399 == 1.0;
        bool _1491 = _1489 && _1479;
        bool _1493 = !_1487;
        float _1495 = _1493 ? _1399 : 0.0;
        bool _1497 = !_1491;
        float _1499 = _1497 ? 0.0 : 1.0;
        float _1501 = _1487 ? 0.0 : 0.5;
        float _1503 = _1495 * 0.715200006961822509765625;
        float _1505 = fma(_1499, 0.2125999927520751953125, _1503);
        float _1507 = fma(_1501, 0.072200000286102294921875, _1505);
        float _1509 = 1.0 / _1507;
        float _1511 = _1509 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1513 = precise::clamp(_1511, 0.0, 1.0);
        float _1515 = fma(_1513, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1517 = _1499 * _1515;
        float _1519 = _1495 * _1515;
        float _1521 = _1501 * _1515;
        out.m_52.x = _1517;
        out.m_52.y = _1519;
        out.m_52.z = _1521;
        out.m_52.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_52)};
    }
    bool _1523 = _112 != 0;
    bool _1525 = !_1523;
    if (!_1525)
    {
        if (_102)
        {
            _1281 = 0.0;
        }
        float _1527 = _1281;
        float _1529 = _1527;
        if (_102)
        {
            _1451 = 0.0;
        }
        float _1531 = _1451;
        float _1533 = _1531;
        if (!_102)
        {
            float _1535 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1533 = _1535;
        }
        float _1537 = _1533;
        float _1539 = _1537;
        if (!_102)
        {
            float _1541 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1529 = _1541;
        }
        float _1543 = _1529;
        float _1545 = _1543;
        if (!_106)
        {
            float _1547 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1537);
            _1539 = _1547;
        }
        float _1549 = _1539;
        if (_102)
        {
            _1453 = 0.0;
        }
        float _1551 = _1453;
        float _1553 = _1551;
        if (!_102)
        {
            float _1555 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
            _1553 = _1555;
        }
        float _1557 = _1553;
        float _1559 = _1549 * 0.715200006961822509765625;
        float _1561 = _1557;
        if (!_106)
        {
            float _1563 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1543);
            _1545 = _1563;
        }
        float _1565 = _1545;
        if (!_106)
        {
            float _1567 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1557);
            _1561 = _1567;
        }
        float _1569 = _1561;
        float _1571 = fma(_1565, 0.2125999927520751953125, _1559);
        float _1573 = fma(_1569, 0.072200000286102294921875, _1571);
        float _1575 = 1.0 / _1573;
        float _1577 = _1575 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
        float _1579 = precise::clamp(_1577, 0.0, 1.0);
        float _1581 = fma(_1579, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
        float _1583 = _1581 * _1565;
        float _1585 = _1581 * _1549;
        float _1587 = _1581 * _1569;
        out.m_52.x = _1583;
        out.m_52.y = _1585;
        out.m_52.z = _1587;
        out.m_52.w = 1.0;
        return main0_out_u{as_type<uint4>(out.m_52)};
    }
    if (!_110)
    {
        _1283 = as_type<int>(_1443);
    }
    int _1589 = _1283;
    if (!_110)
    {
        _1455 = as_type<int>(_1447);
    }
    int _1591 = _1455;
    float _1593 = as_type<float>(_1591);
    if (!_110)
    {
        _1285 = as_type<int>(_1399);
    }
    int _1595 = _1285;
    float _1597 = as_type<float>(_1595);
    if (!_110)
    {
        out.m_52.x = as_type<float>(_1589);
        out.m_52.y = _1445;
        out.m_52.z = as_type<float>(_1591);
        out.m_52.w = as_type<float>(_1595);
        return main0_out_u{as_type<uint4>(out.m_52)};
    }
    if (_102)
    {
        _1597 = 0.0;
    }
    float _1599 = _1597;
    float _1601 = _1599;
    if (_102)
    {
        _1457 = 0.0;
    }
    float _1603 = _1457;
    float _1605 = _1603;
    if (!_102)
    {
        float _1607 = _1071 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1609;
    if (!_102)
    {
        float _1613 = _1075 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1601 = _1613;
    }
    float _1615 = _1601;
    float _1617 = _1615;
    if (!_106)
    {
        float _1619 = fma(_1045, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1609);
        _1611 = _1619;
    }
    float _1621 = _1611;
    if (_102)
    {
        _1593 = 0.0;
    }
    float _1623 = _1593;
    float _1625 = _1623;
    if (!_102)
    {
        float _1627 = _1129 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
        _1625 = _1627;
    }
    float _1629 = _1625;
    float _1631 = _1621 * 0.715200006961822509765625;
    float _1633 = _1629;
    if (!_106)
    {
        float _1635 = fma(_1051, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1615);
        _1617 = _1635;
    }
    float _1637 = _1617;
    if (!_106)
    {
        float _1639 = fma(_1097, (*spvDescriptorSet0.fp_c3)._m0[1].y, _1629);
        _1633 = _1639;
    }
    float _1641 = _1633;
    float _1643 = fma(_1637, 0.2125999927520751953125, _1631);
    float _1645 = fma(_1641, 0.072200000286102294921875, _1643);
    float _1647 = 1.0 / _1645;
    float _1649 = _1647 * (*spvDescriptorSet0.fp_c3)._m0[21].z;
    float _1651 = precise::clamp(_1649, 0.0, 1.0);
    float _1653 = fma(_1651, (*spvDescriptorSet0.fp_c3)._m0[21].y, (*spvDescriptorSet0.fp_c3)._m0[21].x);
    float _1655 = _1653 * _1637;
    float _1657 = _1653 * _1621;
    float _1659 = _1653 * _1641;
    out.m_52.x = _1655;
    out.m_52.y = _1657;
    out.m_52.z = _1659;
    out.m_52.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_52)};
}

