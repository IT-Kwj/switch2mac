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
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
void _42(thread const int& _814, thread const int& _815, thread const int& _816, thread const int& _817, thread int& _818, thread int& _819, thread int& _820, thread int& _821, thread int& _822, thread int& _823)
{
    float _826 = as_type<float>(_816) + 0.0;
    bool _828 = _826 != 0.0;
    bool _830 = isnan(_826);
    bool _832 = _828 || _830;
    bool _834 = isnan(0.0);
    bool _836 = _832 || _834;
    int _838 = _814;
    int _840 = _815;
    int _842 = _816;
    int _844 = _836 ? (-1) : 0;
    if (!_836)
    {
        float _846 = as_type<float>(_816) * 1.0;
        _838 = as_type<int>(_846);
    }
    int _848 = _838;
    bool _850 = !_836;
    int _852 = _848;
    int _854 = _848;
    if (!_850)
    {
        float _856 = as_type<float>(_816) + 0.0;
        bool _858 = _856 >= 0.0;
        bool _860 = isnan(_856);
        bool _862 = _858 || _860;
        bool _864 = isnan(0.0);
        bool _866 = _862 || _864;
        _844 = _866 ? (-1) : 0;
        if (!_866)
        {
            _852 = 2147483647;
        }
        int _868 = _852;
        bool _870 = !_866;
        int _872 = _868;
        _854 = _868;
        if (!_870)
        {
            float _874 = abs(as_type<float>(_816));
            float _876 = _874 + 0.0;
            bool _878 = _876 > as_type<float>(0x7f800000u /* inf */);
            bool _880 = isnan(_876);
            bool _882 = _878 || _880;
            bool _884 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _886 = _882 || _884;
            _844 = _886 ? (-1) : 0;
            if (_886)
            {
                float _888 = as_type<float>(_816) + 1.0;
                _872 = as_type<int>(_888);
            }
            int _890 = _872;
            int _892 = _890;
            _854 = _890;
            if (!_886)
            {
                float _894 = abs(as_type<float>(_816));
                float _896 = _894 + (-0.0);
                float _898 = 0.0 + _896;
                bool _900 = _898 != as_type<float>(0x7f800000u /* inf */);
                bool _902 = isnan(_898);
                bool _904 = _900 || _902;
                bool _906 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _908 = _904 || _906;
                _844 = _908 ? (-1) : 0;
                if (!_908)
                {
                    _892 = _816;
                }
                int _910 = _892;
                bool _912 = !_908;
                _854 = _910;
                if (!_912)
                {
                    float _914 = as_type<float>(_816) * 18446744073709551616.0;
                    float _916 = rsqrt(_914);
                    float _918 = _914 * _916;
                    float _920 = _916 * 0.5;
                    float _922 = -_918;
                    float _924 = 0.0 + _922;
                    float _926 = fma(_920, _924, 0.5);
                    float _928 = fma(_918, _926, _918);
                    float _930 = -_928;
                    float _932 = 0.0 + _930;
                    float _934 = fma(_928, _932, _914);
                    float _936 = fma(_920, _934, _928);
                    float _938 = _936 * 2.3283064365386962890625e-10;
                    _854 = as_type<int>(_938);
                    _840 = as_type<int>(_928);
                    _842 = as_type<int>(_924);
                }
            }
        }
    }
    int _940 = _854;
    int _942 = _840;
    int _944 = _842;
    int _946 = _844;
    _818 = _817;
    _819 = 0;
    _820 = _940;
    _821 = _942;
    _822 = _944;
    _823 = _946;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _232 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_33.z;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _46;
    float _68 = _66 * _52;
    float _70 = _66 * _58;
    float _72 = _66 * _64;
    float _74 = _68 * _68;
    float _76 = fma(_70, _70, _74);
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _80 = fma(_72, _72, _76);
    float _82 = precise::max(0.0, _78);
    float _84 = rsqrt(_80);
    float _86 = _70 * _84;
    float _88 = _72 * _84;
    float _90 = _68 * _84;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = -_90;
    float _98 = -_82;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[13].z, _98);
    float _102 = _92 * _92;
    float _104 = _94 * _94;
    float _106 = _102 + _104;
    float _108 = sqrt(_106);
    bool _112 = _108 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _114 = _90;
    float _116 = _82;
    float _118 = _100;
    int _120 = as_type<int>(_102);
    if (!_112)
    {
        _114 = _104;
    }
    float _122 = _114;
    float _124 = _122;
    if (!_112)
    {
        _116 = _102;
    }
    float _126 = _116;
    bool _128 = !_112;
    float _130 = _126;
    if (!_128)
    {
        float _132 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _134 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _136 = _108 + _134;
        float _138 = _100 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _140 = rsqrt(_106);
        float _142 = _136 * _132;
        float _144 = _142 * 0.15915493667125701904296875;
        float _146 = _144 * 6.283185482025146484375;
        float _148 = sin(_146);
        float _150 = _144 * 6.283185482025146484375;
        float _152 = cos(_150);
        float _154 = fma(_148, _138, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _156 = _140 * _154;
        float _158 = _152 + (-1.0);
        float _160 = _92 * _156;
        float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _164 = _94 * _156;
        float _166 = fma(_100, _152, _162);
        float _168 = _160 * _160;
        float _170 = _164 * _164;
        _118 = _166;
        _130 = _168;
        _124 = _170;
        _120 = as_type<int>(_156);
    }
    float _172 = _118;
    float _174 = _130;
    float _176 = _124;
    int _178 = _120;
    float _180 = fma(_172, _172, _174);
    float _182 = _180 + _176;
    float _184 = rsqrt(_182);
    float _186 = _184 * _172;
    float _188 = -_186;
    float _190 = precise::max(0.0, _188);
    float _192 = abs(_190);
    float _194 = -_192;
    float _196 = _194 + 1.0;
    float _198 = fma(_190, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _200 = as_type<int>(_196) + (-218103808);
    float _202 = fma(_190, _198, -0.212114393711090087890625);
    bool _204 = uint(_200) >= 1920991232u;
    float _206 = fma(_190, _202, 1.570728778839111328125);
    bool _208 = !_204;
    float _230;
    if (!_208)
    {
        int _210 = as_type<int>(_202);
        int _212 = _178;
        int _214 = as_type<int>(_196);
        int _216 = 1040;
        int _218;
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        _42(_210, _212, _214, _216, _218, _220, _222, _224, _226, _228);
        _230 = as_type<float>(_222);
        _232 = true;
    }
    else
    {
        float _234 = rsqrt(_196);
        float _236 = _196 * _234;
        float _238 = _234 * 0.5;
        float _240 = -_236;
        float _242 = 0.0 + _240;
        float _244 = fma(_238, _242, 0.5);
        float _246 = fma(_236, _244, _236);
        float _248 = -_246;
        float _250 = 0.0 + _248;
        float _252 = fma(_246, _250, _196);
        float _254 = fma(_238, _252, _246);
        _230 = _254;
    }
    _232 = false;
    float _256 = _230;
    float _258 = _86 * _86;
    float _260 = _206 * _256;
    bool _262 = _186 > 0.0;
    float _264 = fma(_88, _88, _258);
    float _266 = _260 * 0.636619746685028076171875;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = rsqrt(_264);
    float _276 = sqrt(_272);
    float _278 = _88 * _274;
    float _280 = _86 * _274;
    float _282 = abs(_278);
    float _284 = abs(_280);
    float _286 = precise::max(_282, _284);
    float _288 = -_276;
    float _290 = _288 + 1.0;
    int _292 = as_type<int>(_276);
    int _294 = as_type<int>(_290);
    if (_262)
    {
        _292 = 1065353216;
    }
    int _296 = _292;
    float _298 = precise::max(_286, 9.9999997473787516355514526367188e-05);
    float _300 = _290 * 0.5;
    int _302 = as_type<int>(_300);
    if (_262)
    {
        _294 = 1065353216;
    }
    int _304 = _294;
    float _306 = 1.0 / _298;
    float _308 = -_306;
    float _310 = _278 * _308;
    float _312 = _280 * _306;
    int _314 = as_type<int>(_306);
    if (_262)
    {
        _314 = 1065353216;
    }
    int _316 = _314;
    float _318 = fma(_310, _300, 0.5);
    float _320 = fma(_312, _300, 0.5);
    if (_262)
    {
        _302 = 1065353216;
    }
    int _322 = _302;
    if (_262)
    {
        out.m_36.x = as_type<float>(_304);
        out.m_36.y = as_type<float>(_296);
        out.m_36.z = as_type<float>(_316);
        out.m_36.w = as_type<float>(_322);
        return out;
    }
    float2 _750;
    _750.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _750.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _324 = _750.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = float(uint(_328));
    float _332 = _330 * 0.00390625;
    float2 _766 = float2(_318, _320);
    float _334 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_766, float2(0.0), isnan(_766)), level(_332)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_766, float2(0.0), isnan(_766)), level(_332)).y;
    float2 _777 = float2(_318, _320);
    float _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_777, float2(0.0), isnan(_777)), level(_332)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_777, float2(0.0), isnan(_777)), level(_332)).y;
    float _338 = -_334;
    float _340 = _338 + _336;
    float _342 = _340 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _344 = _342 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _346 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[29].x, _344);
    float _348 = _346 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_36.x = _348;
    out.m_36.y = _348;
    out.m_36.z = _348;
    out.m_36.w = _348;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _232 = false;
    float _46 = gl_FragCoord.w;
    float _48 = in.m_33.y;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_33.x;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = in.m_33.z;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = 1.0 / _46;
    float _68 = _66 * _52;
    float _70 = _66 * _58;
    float _72 = _66 * _64;
    float _74 = _68 * _68;
    float _76 = fma(_70, _70, _74);
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _80 = fma(_72, _72, _76);
    float _82 = precise::max(0.0, _78);
    float _84 = rsqrt(_80);
    float _86 = _70 * _84;
    float _88 = _72 * _84;
    float _90 = _68 * _84;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _96 = -_90;
    float _98 = -_82;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[13].z, _98);
    float _102 = _92 * _92;
    float _104 = _94 * _94;
    float _106 = _102 + _104;
    float _108 = sqrt(_106);
    bool _112 = _108 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _114 = _90;
    float _116 = _82;
    float _118 = _100;
    int _120 = as_type<int>(_102);
    if (!_112)
    {
        _114 = _104;
    }
    float _122 = _114;
    float _124 = _122;
    if (!_112)
    {
        _116 = _102;
    }
    float _126 = _116;
    bool _128 = !_112;
    float _130 = _126;
    if (!_128)
    {
        float _132 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _134 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _136 = _108 + _134;
        float _138 = _100 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _140 = rsqrt(_106);
        float _142 = _136 * _132;
        float _144 = _142 * 0.15915493667125701904296875;
        float _146 = _144 * 6.283185482025146484375;
        float _148 = sin(_146);
        float _150 = _144 * 6.283185482025146484375;
        float _152 = cos(_150);
        float _154 = fma(_148, _138, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _156 = _140 * _154;
        float _158 = _152 + (-1.0);
        float _160 = _92 * _156;
        float _162 = _158 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _164 = _94 * _156;
        float _166 = fma(_100, _152, _162);
        float _168 = _160 * _160;
        float _170 = _164 * _164;
        _118 = _166;
        _130 = _168;
        _124 = _170;
        _120 = as_type<int>(_156);
    }
    float _172 = _118;
    float _174 = _130;
    float _176 = _124;
    int _178 = _120;
    float _180 = fma(_172, _172, _174);
    float _182 = _180 + _176;
    float _184 = rsqrt(_182);
    float _186 = _184 * _172;
    float _188 = -_186;
    float _190 = precise::max(0.0, _188);
    float _192 = abs(_190);
    float _194 = -_192;
    float _196 = _194 + 1.0;
    float _198 = fma(_190, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _200 = as_type<int>(_196) + (-218103808);
    float _202 = fma(_190, _198, -0.212114393711090087890625);
    bool _204 = uint(_200) >= 1920991232u;
    float _206 = fma(_190, _202, 1.570728778839111328125);
    bool _208 = !_204;
    float _230;
    if (!_208)
    {
        int _210 = as_type<int>(_202);
        int _212 = _178;
        int _214 = as_type<int>(_196);
        int _216 = 1040;
        int _218;
        int _220;
        int _222;
        int _224;
        int _226;
        int _228;
        _42(_210, _212, _214, _216, _218, _220, _222, _224, _226, _228);
        _230 = as_type<float>(_222);
        _232 = true;
    }
    else
    {
        float _234 = rsqrt(_196);
        float _236 = _196 * _234;
        float _238 = _234 * 0.5;
        float _240 = -_236;
        float _242 = 0.0 + _240;
        float _244 = fma(_238, _242, 0.5);
        float _246 = fma(_236, _244, _236);
        float _248 = -_246;
        float _250 = 0.0 + _248;
        float _252 = fma(_246, _250, _196);
        float _254 = fma(_238, _252, _246);
        _230 = _254;
    }
    _232 = false;
    float _256 = _230;
    float _258 = _86 * _86;
    float _260 = _206 * _256;
    bool _262 = _186 > 0.0;
    float _264 = fma(_88, _88, _258);
    float _266 = _260 * 0.636619746685028076171875;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = -_268;
    float _272 = _270 + 1.0;
    float _274 = rsqrt(_264);
    float _276 = sqrt(_272);
    float _278 = _88 * _274;
    float _280 = _86 * _274;
    float _282 = abs(_278);
    float _284 = abs(_280);
    float _286 = precise::max(_282, _284);
    float _288 = -_276;
    float _290 = _288 + 1.0;
    int _292 = as_type<int>(_276);
    int _294 = as_type<int>(_290);
    if (_262)
    {
        _292 = 1065353216;
    }
    int _296 = _292;
    float _298 = precise::max(_286, 9.9999997473787516355514526367188e-05);
    float _300 = _290 * 0.5;
    int _302 = as_type<int>(_300);
    if (_262)
    {
        _294 = 1065353216;
    }
    int _304 = _294;
    float _306 = 1.0 / _298;
    float _308 = -_306;
    float _310 = _278 * _308;
    float _312 = _280 * _306;
    int _314 = as_type<int>(_306);
    if (_262)
    {
        _314 = 1065353216;
    }
    int _316 = _314;
    float _318 = fma(_310, _300, 0.5);
    float _320 = fma(_312, _300, 0.5);
    if (_262)
    {
        _302 = 1065353216;
    }
    int _322 = _302;
    if (_262)
    {
        out.m_36.x = as_type<float>(_304);
        out.m_36.y = as_type<float>(_296);
        out.m_36.z = as_type<float>(_316);
        out.m_36.w = as_type<float>(_322);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _750;
    _750.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    _750.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_318, _320));
    float _324 = _750.x;
    float _326 = _324 * 256.0;
    int _328 = int(_326);
    float _330 = float(uint(_328));
    float _332 = _330 * 0.00390625;
    float2 _766 = float2(_318, _320);
    float _334 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_766, float2(0.0), isnan(_766)), level(_332)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_766, float2(0.0), isnan(_766)), level(_332)).y;
    float2 _777 = float2(_318, _320);
    float _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_777, float2(0.0), isnan(_777)), level(_332)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_777, float2(0.0), isnan(_777)), level(_332)).y;
    float _338 = -_334;
    float _340 = _338 + _336;
    float _342 = _340 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _344 = _342 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _346 = fma(_334, (*spvDescriptorSet0.fp_c3)._m0[29].x, _344);
    float _348 = _346 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_36.x = _348;
    out.m_36.y = _348;
    out.m_36.z = _348;
    out.m_36.w = _348;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

