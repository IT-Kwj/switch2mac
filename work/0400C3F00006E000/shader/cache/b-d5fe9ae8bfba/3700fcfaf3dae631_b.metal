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
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_ESmplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_12Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _50(thread const int& _945, thread const int& _946, thread const int& _947, thread const int& _948, thread int& _949, thread int& _950, thread int& _951, thread int& _952, thread int& _953)
{
    float _956 = as_type<float>(_947) + 0.0;
    bool _958 = _956 != 0.0;
    bool _960 = isnan(_956);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    int _968 = as_type<int>(_956);
    int _970 = _946;
    int _972 = _966 ? (-1) : 0;
    if (!_966)
    {
        float _974 = as_type<float>(_947) * 1.0;
        _968 = as_type<int>(_974);
    }
    int _976 = _968;
    bool _978 = !_966;
    int _980 = _976;
    if (!_978)
    {
        float _982 = as_type<float>(_947) + 0.0;
        bool _984 = _982 >= 0.0;
        bool _986 = isnan(_982);
        bool _988 = _984 || _986;
        bool _990 = isnan(0.0);
        bool _992 = _988 || _990;
        int _994 = as_type<int>(_982);
        _972 = _992 ? (-1) : 0;
        if (!_992)
        {
            _994 = 2147483647;
        }
        int _996 = _994;
        bool _998 = !_992;
        _980 = _996;
        if (!_998)
        {
            float _1000 = abs(as_type<float>(_947));
            float _1002 = _1000 + 0.0;
            bool _1004 = _1002 > as_type<float>(0x7f800000u /* inf */);
            bool _1006 = isnan(_1002);
            bool _1008 = _1004 || _1006;
            bool _1010 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1012 = _1008 || _1010;
            int _1014 = as_type<int>(_1002);
            _972 = _1012 ? (-1) : 0;
            if (_1012)
            {
                float _1016 = as_type<float>(_947) + 1.0;
                _1014 = as_type<int>(_1016);
            }
            int _1018 = _1014;
            _980 = _1018;
            if (!_1012)
            {
                float _1020 = abs(as_type<float>(_947));
                float _1022 = _1020 + (-0.0);
                float _1024 = 0.0 + _1022;
                bool _1026 = _1024 != as_type<float>(0x7f800000u /* inf */);
                bool _1028 = isnan(_1024);
                bool _1030 = _1026 || _1028;
                bool _1032 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _1034 = _1030 || _1032;
                int _1036 = as_type<int>(_1024);
                _972 = _1034 ? (-1) : 0;
                if (!_1034)
                {
                    _1036 = _947;
                }
                int _1038 = _1036;
                bool _1040 = !_1034;
                _980 = _1038;
                if (!_1040)
                {
                    float _1042 = as_type<float>(_947) * 18446744073709551616.0;
                    float _1044 = rsqrt(_1042);
                    float _1046 = _1042 * _1044;
                    float _1048 = _1044 * 0.5;
                    float _1050 = -_1046;
                    float _1052 = 0.0 + _1050;
                    float _1054 = fma(_1048, _1052, 0.5);
                    float _1056 = fma(_1046, _1054, _1046);
                    float _1058 = -_1056;
                    float _1060 = 0.0 + _1058;
                    float _1062 = fma(_1056, _1060, _1042);
                    float _1064 = fma(_1048, _1062, _1056);
                    float _1066 = _1064 * 2.3283064365386962890625e-10;
                    _980 = as_type<int>(_1066);
                    _970 = as_type<int>(_1056);
                }
            }
        }
    }
    int _1068 = _980;
    int _1070 = _970;
    int _1072 = _972;
    _949 = _1068;
    _950 = _948;
    _951 = 0;
    _952 = _1070;
    _953 = _1072;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _76 = precise::max(0.0, _74);
    float _78 = 1.0 / _54;
    float _80 = _78 * _60;
    float _82 = _78 * _66;
    float _84 = _78 * _72;
    float _86 = _80 * _80;
    float _88 = fma(_82, _82, _86);
    float _90 = fma(_84, _84, _88);
    float _92 = rsqrt(_90);
    float _94 = _82 * _92;
    float _96 = _84 * _92;
    float _98 = _80 * _92;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_76;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _98;
    float _124 = _76;
    float _126 = _108;
    if (!_120)
    {
        _122 = _112;
    }
    float _128 = _122;
    float _130 = _128;
    if (!_120)
    {
        _124 = _110;
    }
    float _132 = _124;
    bool _134 = !_120;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _140 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _142 = _116 + _140;
        float _144 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _146 = rsqrt(_114);
        float _148 = _142 * _138;
        float _150 = _148 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = sin(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = fma(_154, _144, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _162 = _146 * _160;
        float _164 = _158 + (-1.0);
        float _166 = _100 * _162;
        float _168 = _164 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = _102 * _162;
        float _172 = fma(_108, _158, _168);
        float _174 = _166 * _166;
        float _176 = _170 * _170;
        _126 = _172;
        _136 = _174;
        _130 = _176;
    }
    float _178 = _126;
    float _180 = _136;
    float _182 = _130;
    float _184 = fma(_178, _178, _180);
    float _186 = _184 + _182;
    float _188 = rsqrt(_186);
    float _190 = _188 * _178;
    float _192 = -_190;
    float _194 = precise::max(0.0, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = fma(_194, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _204 = as_type<int>(_200) + (-218103808);
    float _206 = fma(_194, _202, -0.212114393711090087890625);
    bool _208 = uint(_204) >= 1920991232u;
    float _210 = fma(_194, _206, 1.570728778839111328125);
    bool _212 = !_208;
    int _214 = as_type<int>(_190);
    float _234;
    if (!_212)
    {
        int _216 = as_type<int>(_102);
        int _218 = as_type<int>(_206);
        int _220 = as_type<int>(_200);
        int _222 = 1040;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _50(_216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_224);
        _236 = true;
    }
    else
    {
        float _238 = rsqrt(_200);
        float _240 = _200 * _238;
        float _242 = _238 * 0.5;
        float _244 = -_240;
        float _246 = 0.0 + _244;
        float _248 = fma(_242, _246, 0.5);
        float _250 = fma(_240, _248, _240);
        float _252 = -_250;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, _200);
        float _258 = fma(_242, _256, _250);
        _234 = _258;
    }
    _236 = false;
    float _260 = _234;
    float _262 = _94 * _94;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_96, _96, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    if (_266)
    {
        _214 = 1065353216;
    }
    int _280 = _214;
    float _282 = sqrt(_276);
    float _284 = _96 * _278;
    float _286 = _94 * _278;
    float _288 = abs(_284);
    float _290 = abs(_286);
    float _292 = precise::max(_288, _290);
    float _294 = -_282;
    float _296 = _294 + 1.0;
    int _298 = as_type<int>(_282);
    int _300 = as_type<int>(_296);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _302 = _298;
    float _304 = precise::max(_292, 9.9999997473787516355514526367188e-05);
    float _306 = _296 * 0.5;
    if (_266)
    {
        _300 = 1065353216;
    }
    int _308 = _300;
    float _310 = 1.0 / _304;
    float _312 = -_310;
    float _314 = _284 * _312;
    float _316 = _286 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _306, 0.5);
    float _324 = fma(_316, _306, 0.5);
    if (_266)
    {
        out.m_42.x = as_type<float>(_308);
        out.m_42.y = as_type<float>(_302);
        out.m_42.z = as_type<float>(_320);
        out.m_42.w = as_type<float>(_280);
        return out;
    }
    float2 _797;
    _797.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _797.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _326 = _797.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = in.m_44.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_44.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _78 * _336;
    float _346 = _78 * _342;
    float _348 = float(uint(_330));
    float _350 = _348 * 0.00390625;
    float2 _833 = float2(_322, _324);
    float _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_833, float2(0.0), isnan(_833)), level(_350)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_833, float2(0.0), isnan(_833)), level(_350)).y;
    float2 _844 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_844, float2(0.0), isnan(_844)), level(_350)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_844, float2(0.0), isnan(_844)), level(_350)).y;
    float2 _853 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_853, float2(0.0), isnan(_853)), level(_350)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_853, float2(0.0), isnan(_853)), level(_350)).y;
    float2 _862 = float2(_322, _324);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_862, float2(0.0), isnan(_862)), level(_350)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_862, float2(0.0), isnan(_862)), level(_350)).y;
    float2 _871 = float2(_344, _346);
    float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_871, float2(0.0), isnan(_871))).xz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = -_352;
    float _370 = _368 + _354;
    float _372 = -_356;
    float _374 = _372 + _358;
    float _376 = _370 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _378 = _374 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _380 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _382 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _384 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[29].x, _380);
    float _386 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[29].y, _382);
    float _388 = -_384;
    float _390 = _388 + _386;
    float _392 = -_366;
    float _394 = _392 + 1.0;
    float _396 = fma(_364, _390, _384);
    float _398 = _396 * _394;
    float _400 = _398 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_42.x = _400;
    out.m_42.y = _400;
    out.m_42.z = _400;
    out.m_42.w = _400;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _54 = gl_FragCoord.w;
    float _56 = in.m_39.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_39.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_39.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _76 = precise::max(0.0, _74);
    float _78 = 1.0 / _54;
    float _80 = _78 * _60;
    float _82 = _78 * _66;
    float _84 = _78 * _72;
    float _86 = _80 * _80;
    float _88 = fma(_82, _82, _86);
    float _90 = fma(_84, _84, _88);
    float _92 = rsqrt(_90);
    float _94 = _82 * _92;
    float _96 = _84 * _92;
    float _98 = _80 * _92;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _102 = _96 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _104 = -_98;
    float _106 = -_76;
    float _108 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[13].z, _106);
    float _110 = _100 * _100;
    float _112 = _102 * _102;
    float _114 = _110 + _112;
    float _116 = sqrt(_114);
    bool _120 = _116 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _122 = _98;
    float _124 = _76;
    float _126 = _108;
    if (!_120)
    {
        _122 = _112;
    }
    float _128 = _122;
    float _130 = _128;
    if (!_120)
    {
        _124 = _110;
    }
    float _132 = _124;
    bool _134 = !_120;
    float _136 = _132;
    if (!_134)
    {
        float _138 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _140 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _142 = _116 + _140;
        float _144 = _108 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _146 = rsqrt(_114);
        float _148 = _142 * _138;
        float _150 = _148 * 0.15915493667125701904296875;
        float _152 = _150 * 6.283185482025146484375;
        float _154 = sin(_152);
        float _156 = _150 * 6.283185482025146484375;
        float _158 = cos(_156);
        float _160 = fma(_154, _144, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _162 = _146 * _160;
        float _164 = _158 + (-1.0);
        float _166 = _100 * _162;
        float _168 = _164 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _170 = _102 * _162;
        float _172 = fma(_108, _158, _168);
        float _174 = _166 * _166;
        float _176 = _170 * _170;
        _126 = _172;
        _136 = _174;
        _130 = _176;
    }
    float _178 = _126;
    float _180 = _136;
    float _182 = _130;
    float _184 = fma(_178, _178, _180);
    float _186 = _184 + _182;
    float _188 = rsqrt(_186);
    float _190 = _188 * _178;
    float _192 = -_190;
    float _194 = precise::max(0.0, _192);
    float _196 = abs(_194);
    float _198 = -_196;
    float _200 = _198 + 1.0;
    float _202 = fma(_194, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _204 = as_type<int>(_200) + (-218103808);
    float _206 = fma(_194, _202, -0.212114393711090087890625);
    bool _208 = uint(_204) >= 1920991232u;
    float _210 = fma(_194, _206, 1.570728778839111328125);
    bool _212 = !_208;
    int _214 = as_type<int>(_190);
    float _234;
    if (!_212)
    {
        int _216 = as_type<int>(_102);
        int _218 = as_type<int>(_206);
        int _220 = as_type<int>(_200);
        int _222 = 1040;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _50(_216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_224);
        _236 = true;
    }
    else
    {
        float _238 = rsqrt(_200);
        float _240 = _200 * _238;
        float _242 = _238 * 0.5;
        float _244 = -_240;
        float _246 = 0.0 + _244;
        float _248 = fma(_242, _246, 0.5);
        float _250 = fma(_240, _248, _240);
        float _252 = -_250;
        float _254 = 0.0 + _252;
        float _256 = fma(_250, _254, _200);
        float _258 = fma(_242, _256, _250);
        _234 = _258;
    }
    _236 = false;
    float _260 = _234;
    float _262 = _94 * _94;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_96, _96, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    if (_266)
    {
        _214 = 1065353216;
    }
    int _280 = _214;
    float _282 = sqrt(_276);
    float _284 = _96 * _278;
    float _286 = _94 * _278;
    float _288 = abs(_284);
    float _290 = abs(_286);
    float _292 = precise::max(_288, _290);
    float _294 = -_282;
    float _296 = _294 + 1.0;
    int _298 = as_type<int>(_282);
    int _300 = as_type<int>(_296);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _302 = _298;
    float _304 = precise::max(_292, 9.9999997473787516355514526367188e-05);
    float _306 = _296 * 0.5;
    if (_266)
    {
        _300 = 1065353216;
    }
    int _308 = _300;
    float _310 = 1.0 / _304;
    float _312 = -_310;
    float _314 = _284 * _312;
    float _316 = _286 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _306, 0.5);
    float _324 = fma(_316, _306, 0.5);
    if (_266)
    {
        out.m_42.x = as_type<float>(_308);
        out.m_42.y = as_type<float>(_302);
        out.m_42.z = as_type<float>(_320);
        out.m_42.w = as_type<float>(_280);
        return main0_out_u{as_type<uint4>(out.m_42)};
    }
    float2 _797;
    _797.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _797.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _326 = _797.x;
    float _328 = _326 * 256.0;
    int _330 = int(_328);
    float _332 = in.m_44.x;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_44.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _78 * _336;
    float _346 = _78 * _342;
    float _348 = float(uint(_330));
    float _350 = _348 * 0.00390625;
    float2 _833 = float2(_322, _324);
    float _352 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_833, float2(0.0), isnan(_833)), level(_350)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_833, float2(0.0), isnan(_833)), level(_350)).y;
    float2 _844 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_844, float2(0.0), isnan(_844)), level(_350)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_844, float2(0.0), isnan(_844)), level(_350)).y;
    float2 _853 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_853, float2(0.0), isnan(_853)), level(_350)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_853, float2(0.0), isnan(_853)), level(_350)).y;
    float2 _862 = float2(_322, _324);
    float _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_862, float2(0.0), isnan(_862)), level(_350)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_862, float2(0.0), isnan(_862)), level(_350)).y;
    float2 _871 = float2(_344, _346);
    float2 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_871, float2(0.0), isnan(_871))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_871, float2(0.0), isnan(_871))).xz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = -_352;
    float _370 = _368 + _354;
    float _372 = -_356;
    float _374 = _372 + _358;
    float _376 = _370 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _378 = _374 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _380 = _376 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _382 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _384 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[29].x, _380);
    float _386 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[29].y, _382);
    float _388 = -_384;
    float _390 = _388 + _386;
    float _392 = -_366;
    float _394 = _392 + 1.0;
    float _396 = fma(_364, _390, _384);
    float _398 = _396 * _394;
    float _400 = _398 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_42.x = _400;
    out.m_42.y = _400;
    out.m_42.z = _400;
    out.m_42.w = _400;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

