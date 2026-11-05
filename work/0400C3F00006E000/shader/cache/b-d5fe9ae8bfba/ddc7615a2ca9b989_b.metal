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
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

static inline __attribute__((always_inline))
void _40(thread const int& _779, thread const int& _780, thread const int& _781, thread const int& _782, thread int& _783, thread int& _784, thread int& _785, thread int& _786, thread int& _787, thread int& _788)
{
    float _791 = as_type<float>(_781) + 0.0;
    bool _793 = _791 != 0.0;
    bool _795 = isnan(_791);
    bool _797 = _793 || _795;
    bool _799 = isnan(0.0);
    bool _801 = _797 || _799;
    int _803 = _779;
    int _805 = _780;
    int _807 = _781;
    int _809 = _801 ? (-1) : 0;
    if (!_801)
    {
        float _811 = as_type<float>(_781) * 1.0;
        _803 = as_type<int>(_811);
    }
    int _813 = _803;
    bool _815 = !_801;
    int _817 = _813;
    int _819 = _813;
    if (!_815)
    {
        float _821 = as_type<float>(_781) + 0.0;
        bool _823 = _821 >= 0.0;
        bool _825 = isnan(_821);
        bool _827 = _823 || _825;
        bool _829 = isnan(0.0);
        bool _831 = _827 || _829;
        _809 = _831 ? (-1) : 0;
        if (!_831)
        {
            _817 = 2147483647;
        }
        int _833 = _817;
        bool _835 = !_831;
        int _837 = _833;
        _819 = _833;
        if (!_835)
        {
            float _839 = abs(as_type<float>(_781));
            float _841 = _839 + 0.0;
            bool _843 = _841 > as_type<float>(0x7f800000u /* inf */);
            bool _845 = isnan(_841);
            bool _847 = _843 || _845;
            bool _849 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _851 = _847 || _849;
            _809 = _851 ? (-1) : 0;
            if (_851)
            {
                float _853 = as_type<float>(_781) + 1.0;
                _837 = as_type<int>(_853);
            }
            int _855 = _837;
            int _857 = _855;
            _819 = _855;
            if (!_851)
            {
                float _859 = abs(as_type<float>(_781));
                float _861 = _859 + (-0.0);
                float _863 = 0.0 + _861;
                bool _865 = _863 != as_type<float>(0x7f800000u /* inf */);
                bool _867 = isnan(_863);
                bool _869 = _865 || _867;
                bool _871 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _873 = _869 || _871;
                _809 = _873 ? (-1) : 0;
                if (!_873)
                {
                    _857 = _781;
                }
                int _875 = _857;
                bool _877 = !_873;
                _819 = _875;
                if (!_877)
                {
                    float _879 = as_type<float>(_781) * 18446744073709551616.0;
                    float _881 = rsqrt(_879);
                    float _883 = _879 * _881;
                    float _885 = _881 * 0.5;
                    float _887 = -_883;
                    float _889 = 0.0 + _887;
                    float _891 = fma(_885, _889, 0.5);
                    float _893 = fma(_883, _891, _883);
                    float _895 = -_893;
                    float _897 = 0.0 + _895;
                    float _899 = fma(_893, _897, _879);
                    float _901 = fma(_885, _899, _893);
                    float _903 = _901 * 2.3283064365386962890625e-10;
                    _819 = as_type<int>(_903);
                    _805 = as_type<int>(_893);
                    _807 = as_type<int>(_889);
                }
            }
        }
    }
    int _905 = _819;
    int _907 = _805;
    int _909 = _807;
    int _911 = _809;
    _783 = _782;
    _784 = 0;
    _785 = _905;
    _786 = _907;
    _787 = _909;
    _788 = _911;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _230 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.y;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_31.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float _72 = _66 * _66;
    float _74 = fma(_68, _68, _72);
    float _76 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _78 = fma(_70, _70, _74);
    float _80 = precise::max(0.0, _76);
    float _82 = rsqrt(_78);
    float _84 = _68 * _82;
    float _86 = _70 * _82;
    float _88 = _66 * _82;
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = -_88;
    float _96 = -_80;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[13].z, _96);
    float _100 = _90 * _90;
    float _102 = _92 * _92;
    float _104 = _100 + _102;
    float _106 = sqrt(_104);
    bool _110 = _106 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _112 = _88;
    float _114 = _80;
    float _116 = _98;
    int _118 = as_type<int>(_100);
    if (!_110)
    {
        _112 = _102;
    }
    float _120 = _112;
    float _122 = _120;
    if (!_110)
    {
        _114 = _100;
    }
    float _124 = _114;
    bool _126 = !_110;
    float _128 = _124;
    if (!_126)
    {
        float _130 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _132 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _134 = _106 + _132;
        float _136 = _98 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = rsqrt(_104);
        float _140 = _134 * _130;
        float _142 = _140 * 0.15915493667125701904296875;
        float _144 = _142 * 6.283185482025146484375;
        float _146 = sin(_144);
        float _148 = _142 * 6.283185482025146484375;
        float _150 = cos(_148);
        float _152 = fma(_146, _136, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _154 = _138 * _152;
        float _156 = _150 + (-1.0);
        float _158 = _90 * _154;
        float _160 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _162 = _92 * _154;
        float _164 = fma(_98, _150, _160);
        float _166 = _158 * _158;
        float _168 = _162 * _162;
        _116 = _164;
        _128 = _166;
        _122 = _168;
        _118 = as_type<int>(_154);
    }
    float _170 = _116;
    float _172 = _128;
    float _174 = _122;
    int _176 = _118;
    float _178 = fma(_170, _170, _172);
    float _180 = _178 + _174;
    float _182 = rsqrt(_180);
    float _184 = _182 * _170;
    float _186 = -_184;
    float _188 = precise::max(0.0, _186);
    float _190 = abs(_188);
    float _192 = -_190;
    float _194 = _192 + 1.0;
    float _196 = fma(_188, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _198 = as_type<int>(_194) + (-218103808);
    float _200 = fma(_188, _196, -0.212114393711090087890625);
    bool _202 = uint(_198) >= 1920991232u;
    float _204 = fma(_188, _200, 1.570728778839111328125);
    bool _206 = !_202;
    float _228;
    if (!_206)
    {
        int _208 = as_type<int>(_200);
        int _210 = _176;
        int _212 = as_type<int>(_194);
        int _214 = 1040;
        int _216;
        int _218;
        int _220;
        int _222;
        int _224;
        int _226;
        _40(_208, _210, _212, _214, _216, _218, _220, _222, _224, _226);
        _228 = as_type<float>(_220);
        _230 = true;
    }
    else
    {
        float _232 = rsqrt(_194);
        float _234 = _194 * _232;
        float _236 = _232 * 0.5;
        float _238 = -_234;
        float _240 = 0.0 + _238;
        float _242 = fma(_236, _240, 0.5);
        float _244 = fma(_234, _242, _234);
        float _246 = -_244;
        float _248 = 0.0 + _246;
        float _250 = fma(_244, _248, _194);
        float _252 = fma(_236, _250, _244);
        _228 = _252;
    }
    _230 = false;
    float _254 = _228;
    float _256 = _84 * _84;
    float _258 = _204 * _254;
    bool _260 = _184 > 0.0;
    float _262 = fma(_86, _86, _256);
    float _264 = _258 * 0.636619746685028076171875;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = rsqrt(_262);
    float _274 = sqrt(_270);
    float _276 = _86 * _272;
    float _278 = _84 * _272;
    float _280 = abs(_276);
    float _282 = abs(_278);
    float _284 = precise::max(_280, _282);
    float _286 = -_274;
    float _288 = _286 + 1.0;
    int _290 = as_type<int>(_274);
    int _292 = as_type<int>(_288);
    if (_260)
    {
        _290 = 1065353216;
    }
    int _294 = _290;
    float _296 = precise::max(_284, 9.9999997473787516355514526367188e-05);
    float _298 = _288 * 0.5;
    int _300 = as_type<int>(_298);
    if (_260)
    {
        _292 = 1065353216;
    }
    int _302 = _292;
    float _304 = 1.0 / _296;
    float _306 = -_304;
    float _308 = _276 * _306;
    float _310 = _278 * _304;
    int _312 = as_type<int>(_304);
    if (_260)
    {
        _312 = 1065353216;
    }
    int _314 = _312;
    float _316 = fma(_308, _298, 0.5);
    float _318 = fma(_310, _298, 0.5);
    if (_260)
    {
        _300 = 1065353216;
    }
    int _320 = _300;
    if (_260)
    {
        out.m_34.x = as_type<float>(_302);
        out.m_34.y = as_type<float>(_294);
        out.m_34.z = as_type<float>(_314);
        out.m_34.w = as_type<float>(_320);
        return out;
    }
    float2 _738;
    _738.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    _738.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    float _322 = _738.x;
    float _324 = _322 * 256.0;
    int _326 = int(_324);
    float _328 = float(uint(_326));
    float _330 = _328 * 0.00390625;
    float2 _754 = float2(_316, _318);
    float _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_754, float2(0.0), isnan(_754)), level(_330)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_754, float2(0.0), isnan(_754)), level(_330)).y;
    float _334 = _332 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _336 = _334 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_34.x = _336;
    out.m_34.y = _336;
    out.m_34.z = _336;
    out.m_34.w = _336;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _230 = false;
    float _44 = gl_FragCoord.w;
    float _46 = in.m_31.y;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_31.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_31.z;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _44;
    float _66 = _64 * _50;
    float _68 = _64 * _56;
    float _70 = _64 * _62;
    float _72 = _66 * _66;
    float _74 = fma(_68, _68, _72);
    float _76 = (*spvDescriptorSet0.fp_c3)._m0[13].w + (-220.0);
    float _78 = fma(_70, _70, _74);
    float _80 = precise::max(0.0, _76);
    float _82 = rsqrt(_78);
    float _84 = _68 * _82;
    float _86 = _70 * _82;
    float _88 = _66 * _82;
    float _90 = _84 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _92 = _86 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _94 = -_88;
    float _96 = -_80;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[13].z, _96);
    float _100 = _90 * _90;
    float _102 = _92 * _92;
    float _104 = _100 + _102;
    float _106 = sqrt(_104);
    bool _110 = _106 > (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _112 = _88;
    float _114 = _80;
    float _116 = _98;
    int _118 = as_type<int>(_100);
    if (!_110)
    {
        _112 = _102;
    }
    float _120 = _112;
    float _122 = _120;
    if (!_110)
    {
        _114 = _100;
    }
    float _124 = _114;
    bool _126 = !_110;
    float _128 = _124;
    if (!_126)
    {
        float _130 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _132 = -(*spvDescriptorSet0.fp_c3)._m0[13].x;
        float _134 = _106 + _132;
        float _136 = _98 + (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _138 = rsqrt(_104);
        float _140 = _134 * _130;
        float _142 = _140 * 0.15915493667125701904296875;
        float _144 = _142 * 6.283185482025146484375;
        float _146 = sin(_144);
        float _148 = _142 * 6.283185482025146484375;
        float _150 = cos(_148);
        float _152 = fma(_146, _136, (*spvDescriptorSet0.fp_c3)._m0[13].x);
        float _154 = _138 * _152;
        float _156 = _150 + (-1.0);
        float _158 = _90 * _154;
        float _160 = _156 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
        float _162 = _92 * _154;
        float _164 = fma(_98, _150, _160);
        float _166 = _158 * _158;
        float _168 = _162 * _162;
        _116 = _164;
        _128 = _166;
        _122 = _168;
        _118 = as_type<int>(_154);
    }
    float _170 = _116;
    float _172 = _128;
    float _174 = _122;
    int _176 = _118;
    float _178 = fma(_170, _170, _172);
    float _180 = _178 + _174;
    float _182 = rsqrt(_180);
    float _184 = _182 * _170;
    float _186 = -_184;
    float _188 = precise::max(0.0, _186);
    float _190 = abs(_188);
    float _192 = -_190;
    float _194 = _192 + 1.0;
    float _196 = fma(_188, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _198 = as_type<int>(_194) + (-218103808);
    float _200 = fma(_188, _196, -0.212114393711090087890625);
    bool _202 = uint(_198) >= 1920991232u;
    float _204 = fma(_188, _200, 1.570728778839111328125);
    bool _206 = !_202;
    float _228;
    if (!_206)
    {
        int _208 = as_type<int>(_200);
        int _210 = _176;
        int _212 = as_type<int>(_194);
        int _214 = 1040;
        int _216;
        int _218;
        int _220;
        int _222;
        int _224;
        int _226;
        _40(_208, _210, _212, _214, _216, _218, _220, _222, _224, _226);
        _228 = as_type<float>(_220);
        _230 = true;
    }
    else
    {
        float _232 = rsqrt(_194);
        float _234 = _194 * _232;
        float _236 = _232 * 0.5;
        float _238 = -_234;
        float _240 = 0.0 + _238;
        float _242 = fma(_236, _240, 0.5);
        float _244 = fma(_234, _242, _234);
        float _246 = -_244;
        float _248 = 0.0 + _246;
        float _250 = fma(_244, _248, _194);
        float _252 = fma(_236, _250, _244);
        _228 = _252;
    }
    _230 = false;
    float _254 = _228;
    float _256 = _84 * _84;
    float _258 = _204 * _254;
    bool _260 = _184 > 0.0;
    float _262 = fma(_86, _86, _256);
    float _264 = _258 * 0.636619746685028076171875;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = rsqrt(_262);
    float _274 = sqrt(_270);
    float _276 = _86 * _272;
    float _278 = _84 * _272;
    float _280 = abs(_276);
    float _282 = abs(_278);
    float _284 = precise::max(_280, _282);
    float _286 = -_274;
    float _288 = _286 + 1.0;
    int _290 = as_type<int>(_274);
    int _292 = as_type<int>(_288);
    if (_260)
    {
        _290 = 1065353216;
    }
    int _294 = _290;
    float _296 = precise::max(_284, 9.9999997473787516355514526367188e-05);
    float _298 = _288 * 0.5;
    int _300 = as_type<int>(_298);
    if (_260)
    {
        _292 = 1065353216;
    }
    int _302 = _292;
    float _304 = 1.0 / _296;
    float _306 = -_304;
    float _308 = _276 * _306;
    float _310 = _278 * _304;
    int _312 = as_type<int>(_304);
    if (_260)
    {
        _312 = 1065353216;
    }
    int _314 = _312;
    float _316 = fma(_308, _298, 0.5);
    float _318 = fma(_310, _298, 0.5);
    if (_260)
    {
        _300 = 1065353216;
    }
    int _320 = _300;
    if (_260)
    {
        out.m_34.x = as_type<float>(_302);
        out.m_34.y = as_type<float>(_294);
        out.m_34.z = as_type<float>(_314);
        out.m_34.w = as_type<float>(_320);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float2 _738;
    _738.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    _738.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_316, _318));
    float _322 = _738.x;
    float _324 = _322 * 256.0;
    int _326 = int(_324);
    float _328 = float(uint(_326));
    float _330 = _328 * 0.00390625;
    float2 _754 = float2(_316, _318);
    float _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_754, float2(0.0), isnan(_754)), level(_330)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_754, float2(0.0), isnan(_754)), level(_330)).y;
    float _334 = _332 * (*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _336 = _334 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    out.m_34.x = _336;
    out.m_34.y = _336;
    out.m_34.z = _336;
    out.m_34.w = _336;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

