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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _46(thread const int& _881, thread const int& _882, thread const int& _883, thread const int& _884, thread int& _885, thread int& _886, thread int& _887, thread int& _888, thread int& _889, thread int& _890)
{
    float _893 = as_type<float>(_882) + 0.0;
    bool _895 = _893 != 0.0;
    bool _897 = isnan(_893);
    bool _899 = _895 || _897;
    bool _901 = isnan(0.0);
    bool _903 = _899 || _901;
    int _905 = _881;
    int _907 = _882;
    int _909 = _883;
    int _911 = _903 ? (-1) : 0;
    if (!_903)
    {
        float _913 = as_type<float>(_882) * 1.0;
        _905 = as_type<int>(_913);
    }
    int _915 = _905;
    bool _917 = !_903;
    int _919 = _915;
    int _921 = _915;
    if (!_917)
    {
        float _923 = as_type<float>(_882) + 0.0;
        bool _925 = _923 >= 0.0;
        bool _927 = isnan(_923);
        bool _929 = _925 || _927;
        bool _931 = isnan(0.0);
        bool _933 = _929 || _931;
        _911 = _933 ? (-1) : 0;
        if (!_933)
        {
            _919 = 2147483647;
        }
        int _935 = _919;
        bool _937 = !_933;
        int _939 = _935;
        _921 = _935;
        if (!_937)
        {
            float _941 = abs(as_type<float>(_882));
            float _943 = _941 + 0.0;
            bool _945 = _943 > as_type<float>(0x7f800000u /* inf */);
            bool _947 = isnan(_943);
            bool _949 = _945 || _947;
            bool _951 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _953 = _949 || _951;
            _911 = _953 ? (-1) : 0;
            if (_953)
            {
                float _955 = as_type<float>(_882) + 1.0;
                _939 = as_type<int>(_955);
            }
            int _957 = _939;
            int _959 = _957;
            _921 = _957;
            if (!_953)
            {
                float _961 = abs(as_type<float>(_882));
                float _963 = _961 + (-0.0);
                float _965 = 0.0 + _963;
                bool _967 = _965 != as_type<float>(0x7f800000u /* inf */);
                bool _969 = isnan(_965);
                bool _971 = _967 || _969;
                bool _973 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _975 = _971 || _973;
                _911 = _975 ? (-1) : 0;
                if (!_975)
                {
                    _959 = _882;
                }
                int _977 = _959;
                bool _979 = !_975;
                _921 = _977;
                if (!_979)
                {
                    float _981 = as_type<float>(_882) * 18446744073709551616.0;
                    float _983 = rsqrt(_981);
                    float _985 = _981 * _983;
                    float _987 = _983 * 0.5;
                    float _989 = -_985;
                    float _991 = 0.0 + _989;
                    float _993 = fma(_987, _991, 0.5);
                    float _995 = fma(_985, _993, _985);
                    float _997 = -_995;
                    float _999 = 0.0 + _997;
                    float _1001 = fma(_995, _999, _981);
                    float _1003 = fma(_987, _1001, _995);
                    float _1005 = _1003 * 2.3283064365386962890625e-10;
                    _921 = as_type<int>(_1005);
                    _907 = as_type<int>(_991);
                    _909 = as_type<int>(_995);
                }
            }
        }
    }
    int _1007 = _921;
    int _1009 = _907;
    int _1011 = _909;
    int _1013 = _911;
    _885 = _884;
    _886 = 0;
    _887 = _1007;
    _888 = _1009;
    _889 = _1011;
    _890 = _1013;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = fma(_76, _76, _80);
    float _86 = precise::max(0.0, _82);
    float _88 = rsqrt(_84);
    float _90 = _74 * _88;
    float _92 = _76 * _88;
    float _94 = _72 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_86;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _94;
    float _120 = _86;
    float _122 = _104;
    int _124 = as_type<int>(_108);
    if (!_116)
    {
        _118 = _108;
    }
    float _126 = _118;
    float _128 = _126;
    if (!_116)
    {
        _120 = _106;
    }
    float _130 = _120;
    bool _132 = !_116;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _112 + _138;
        float _142 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_110);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _96 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _98 * _160;
        float _170 = fma(_104, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _122 = _170;
        _134 = _172;
        _128 = _174;
        _124 = as_type<int>(_160);
    }
    float _176 = _122;
    float _178 = _134;
    float _180 = _128;
    int _182 = _124;
    float _184 = fma(_176, _176, _178);
    float _186 = _184 + _180;
    float _188 = rsqrt(_186);
    float _190 = _188 * _176;
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
    float _234;
    if (!_212)
    {
        int _214 = as_type<int>(_206);
        int _216 = as_type<int>(_200);
        int _218 = _182;
        int _220 = 1040;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _46(_214, _216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_226);
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
    float _262 = _90 * _90;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_92, _92, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    float _280 = sqrt(_276);
    float _282 = _92 * _278;
    float _284 = _90 * _278;
    float _286 = abs(_282);
    float _288 = abs(_284);
    float _290 = precise::max(_286, _288);
    float _292 = -_280;
    float _294 = _292 + 1.0;
    int _296 = as_type<int>(_280);
    int _298 = as_type<int>(_294);
    if (_266)
    {
        _296 = 1065353216;
    }
    int _300 = _296;
    float _302 = precise::max(_290, 9.9999997473787516355514526367188e-05);
    float _304 = _294 * 0.5;
    int _306 = as_type<int>(_304);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _308 = _298;
    float _310 = 1.0 / _302;
    float _312 = -_310;
    float _314 = _282 * _312;
    float _316 = _284 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _304, 0.5);
    float _324 = fma(_316, _304, 0.5);
    if (_266)
    {
        _306 = 1065353216;
    }
    int _326 = _306;
    if (_266)
    {
        out.m_38.x = as_type<float>(_308);
        out.m_38.y = as_type<float>(_300);
        out.m_38.z = as_type<float>(_320);
        out.m_38.w = as_type<float>(_326);
        return out;
    }
    float2 _781;
    _781.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _781.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _328 = _781.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = in.m_40.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_40.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _70 * _338;
    float _348 = _70 * _344;
    float _350 = float(uint(_332));
    float _352 = _350 * 0.00390625;
    float2 _817 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_817, float2(0.0), isnan(_817)), level(_352)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_817, float2(0.0), isnan(_817)), level(_352)).y;
    float2 _828 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_828, float2(0.0), isnan(_828)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_828, float2(0.0), isnan(_828)), level(_352)).y;
    float2 _837 = float2(_346, _348);
    float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_837, float2(0.0), isnan(_837))).xz;
    float _362 = _360.x;
    float _364 = _360.y;
    float _366 = _354 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _368 = -_366;
    float _370 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[29].y, _368);
    float _372 = -_364;
    float _374 = _372 + 1.0;
    float _376 = fma(_362, _370, _366);
    float _378 = _376 * _374;
    float _380 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_38.x = _380;
    out.m_38.y = _380;
    out.m_38.z = _380;
    out.m_38.w = _380;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _236 = false;
    float _50 = gl_FragCoord.w;
    float _52 = in.m_35.y;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_35.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_35.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _50;
    float _72 = _70 * _56;
    float _74 = _70 * _62;
    float _76 = _70 * _68;
    float _78 = _72 * _72;
    float _80 = fma(_74, _74, _78);
    float _82 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _84 = fma(_76, _76, _80);
    float _86 = precise::max(0.0, _82);
    float _88 = rsqrt(_84);
    float _90 = _74 * _88;
    float _92 = _76 * _88;
    float _94 = _72 * _88;
    float _96 = _90 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _98 = _92 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _100 = -_94;
    float _102 = -_86;
    float _104 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[13].z, _102);
    float _106 = _96 * _96;
    float _108 = _98 * _98;
    float _110 = _106 + _108;
    float _112 = sqrt(_110);
    bool _116 = _112 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _118 = _94;
    float _120 = _86;
    float _122 = _104;
    int _124 = as_type<int>(_108);
    if (!_116)
    {
        _118 = _108;
    }
    float _126 = _118;
    float _128 = _126;
    if (!_116)
    {
        _120 = _106;
    }
    float _130 = _120;
    bool _132 = !_116;
    float _134 = _130;
    if (!_132)
    {
        float _136 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _140 = _112 + _138;
        float _142 = _104 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _144 = rsqrt(_110);
        float _146 = _140 * _136;
        float _148 = _146 * 0.15915493667125701904296875;
        float _150 = _148 * 6.283185482025146484375;
        float _152 = sin(_150);
        float _154 = _148 * 6.283185482025146484375;
        float _156 = cos(_154);
        float _158 = fma(_152, _142, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _160 = _144 * _158;
        float _162 = _156 + (-1.0);
        float _164 = _96 * _160;
        float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _168 = _98 * _160;
        float _170 = fma(_104, _156, _166);
        float _172 = _164 * _164;
        float _174 = _168 * _168;
        _122 = _170;
        _134 = _172;
        _128 = _174;
        _124 = as_type<int>(_160);
    }
    float _176 = _122;
    float _178 = _134;
    float _180 = _128;
    int _182 = _124;
    float _184 = fma(_176, _176, _178);
    float _186 = _184 + _180;
    float _188 = rsqrt(_186);
    float _190 = _188 * _176;
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
    float _234;
    if (!_212)
    {
        int _214 = as_type<int>(_206);
        int _216 = as_type<int>(_200);
        int _218 = _182;
        int _220 = 1040;
        int _222;
        int _224;
        int _226;
        int _228;
        int _230;
        int _232;
        _46(_214, _216, _218, _220, _222, _224, _226, _228, _230, _232);
        _234 = as_type<float>(_226);
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
    float _262 = _90 * _90;
    float _264 = _210 * _260;
    bool _266 = _190 > 0.0;
    float _268 = fma(_92, _92, _262);
    float _270 = _264 * 0.636619746685028076171875;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = rsqrt(_268);
    float _280 = sqrt(_276);
    float _282 = _92 * _278;
    float _284 = _90 * _278;
    float _286 = abs(_282);
    float _288 = abs(_284);
    float _290 = precise::max(_286, _288);
    float _292 = -_280;
    float _294 = _292 + 1.0;
    int _296 = as_type<int>(_280);
    int _298 = as_type<int>(_294);
    if (_266)
    {
        _296 = 1065353216;
    }
    int _300 = _296;
    float _302 = precise::max(_290, 9.9999997473787516355514526367188e-05);
    float _304 = _294 * 0.5;
    int _306 = as_type<int>(_304);
    if (_266)
    {
        _298 = 1065353216;
    }
    int _308 = _298;
    float _310 = 1.0 / _302;
    float _312 = -_310;
    float _314 = _282 * _312;
    float _316 = _284 * _310;
    int _318 = as_type<int>(_310);
    if (_266)
    {
        _318 = 1065353216;
    }
    int _320 = _318;
    float _322 = fma(_314, _304, 0.5);
    float _324 = fma(_316, _304, 0.5);
    if (_266)
    {
        _306 = 1065353216;
    }
    int _326 = _306;
    if (_266)
    {
        out.m_38.x = as_type<float>(_308);
        out.m_38.y = as_type<float>(_300);
        out.m_38.z = as_type<float>(_320);
        out.m_38.w = as_type<float>(_326);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _781;
    _781.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    _781.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_322, _324));
    float _328 = _781.x;
    float _330 = _328 * 256.0;
    int _332 = int(_330);
    float _334 = in.m_40.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_40.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _70 * _338;
    float _348 = _70 * _344;
    float _350 = float(uint(_332));
    float _352 = _350 * 0.00390625;
    float2 _817 = float2(_322, _324);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_817, float2(0.0), isnan(_817)), level(_352)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_817, float2(0.0), isnan(_817)), level(_352)).y;
    float2 _828 = float2(_322, _324);
    float _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_828, float2(0.0), isnan(_828)), level(_352)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_828, float2(0.0), isnan(_828)), level(_352)).y;
    float2 _837 = float2(_346, _348);
    float2 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_837, float2(0.0), isnan(_837))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_837, float2(0.0), isnan(_837))).xz;
    float _362 = _360.x;
    float _364 = _360.y;
    float _366 = _354 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _368 = -_366;
    float _370 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[29].y, _368);
    float _372 = -_364;
    float _374 = _372 + 1.0;
    float _376 = fma(_362, _370, _366);
    float _378 = _376 * _374;
    float _380 = _378 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_38.x = _380;
    out.m_38.y = _380;
    out.m_38.z = _380;
    out.m_38.w = _380;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

