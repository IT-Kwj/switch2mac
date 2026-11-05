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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _112 = false;
    bool _110 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _352 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_352, float2(0.0), isnan(_352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_352, float2(0.0), isnan(_352))).x;
    float _56 = in.m_40.y;
    float _58 = -_54;
    float _60 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _62 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].z, _60);
    float _64 = _62 * _56;
    float _66 = -_62;
    bool _70 = _66 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _72 = -_62;
    bool _74 = _72 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _76 = !_70;
    uint _79 = uint(_76 ? 0 : 1);
    uint _81 = 2u;
    if (!_70)
    {
        _81 = 1u;
    }
    uint _83 = _81;
    uint _85 = _83;
    if (!_74)
    {
        _85 = _79;
    }
    uint _87 = _85;
    uint _89 = min(_87, 2u);
    int _92 = int(_89) << 2;
    float _94 = in.m_40.x;
    uint _96 = uint(int(uint(_92) >> uint(2)));
    uint _98 = uint(int(uint(int(_96)) >> uint(2)));
    int _100 = int(_96) & 3;
    float _102 = (*spvDescriptorSet0.fp_c1)._m0[int(_98)][_100];
    float _104 = _62 * _94;
    bool _106 = as_type<int>(_102) == 336;
    if (!_106)
    {
        bool _108 = as_type<int>(_102) == 608;
        _110 = _108;
        if (!_110)
        {
            _112 = true;
        }
    }
    float _146;
    float _148;
    float _150;
    float _152;
    if (!_110)
    {
        if (!_112)
        {
            float _114 = _64 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _116 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _118 = _64 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _120 = _64 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _122 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[1].x, _114);
            float _124 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[2].x, _116);
            float _126 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[0].x, _118);
            float _128 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[3].x, _120);
            float _130 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[1].z, _122);
            float _132 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[2].z, _124);
            float _134 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[0].z, _126);
            float _136 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[3].z, _128);
            float _138 = _130 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _146 = _144;
            _148 = _142;
            _150 = _138;
            _152 = _140;
        }
    }
    if ((false || _112) || _110)
    {
        if ((!_112) || _110)
        {
            _110 = false;
            float _154 = _64 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _156 = _64 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _158 = _64 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _160 = _64 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _162 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[5].x, _154);
            float _164 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[6].x, _156);
            float _166 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[4].x, _158);
            float _168 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
            float _170 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[5].z, _162);
            float _172 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[6].z, _164);
            float _174 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[4].z, _166);
            float _176 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
            float _178 = _170 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _146 = _184;
            _148 = _182;
            _150 = _178;
            _152 = _180;
        }
        if (false || _112)
        {
            _112 = false;
            float _186 = _64 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _188 = _64 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _190 = _64 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _192 = _64 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _194 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
            float _196 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[10].x, _188);
            float _198 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[8].x, _190);
            float _200 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[11].x, _192);
            float _202 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[9].z, _194);
            float _204 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].z, _196);
            float _206 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[8].z, _198);
            float _208 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[11].z, _200);
            float _210 = _202 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _146 = _216;
            _148 = _214;
            _150 = _210;
            _152 = _212;
        }
    }
    float _218 = _146;
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float2 _723 = float2(_50, _52);
    float2 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_723, float2(0.0), isnan(_723))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_723, float2(0.0), isnan(_723))).xy;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = float(int(_87));
    float _236 = 1.0 / _218;
    float _238 = rint(_234);
    float _240 = precise::max(_238, 0.0);
    uint _242 = uint(_240);
    uint _244 = clamp(_242, 0u, 65535u);
    float _246 = _236 * _220;
    float _248 = _236 * _222;
    float _250 = _236 * _224;
    float _252 = precise::clamp(_250, 0.0, 1.0);
    float _254 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _256 = fma(_252, _254, _246);
    float _258 = fma(_230, 2.0, -1.0);
    float _260 = fma(_232, 2.0, -1.0);
    float _262 = _258 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _264 = _260 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _266 = -_254;
    float _268 = fma(_252, _266, _246);
    float _270 = fma(_262, 2.0, _50);
    float _272 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _274 = fma(_264, 2.0, _52);
    float _276 = fma(_252, _272, _248);
    float _278 = -_272;
    float _280 = fma(_252, _278, _248);
    float3 _819 = float3(_246, _276, float(int(_244)));
    float3 _823 = select(_819, float3(0.0), isnan(_819));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _823.xy, uint(rint(_823.z)), _252);
    float3 _832 = float3(_256, _276, float(int(_244)));
    float3 _834 = select(_832, float3(0.0), isnan(_832));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _834.xy, uint(rint(_834.z)), _252);
    float3 _843 = float3(_268, _276, float(int(_244)));
    float3 _845 = select(_843, float3(0.0), isnan(_843));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _845.xy, uint(rint(_845.z)), _252);
    float3 _854 = float3(_256, _248, float(int(_244)));
    float3 _856 = select(_854, float3(0.0), isnan(_854));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _856.xy, uint(rint(_856.z)), _252);
    float3 _865 = float3(_246, _248, float(int(_244)));
    float3 _867 = select(_865, float3(0.0), isnan(_865));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _867.xy, uint(rint(_867.z)), _252);
    float3 _876 = float3(_268, _248, float(int(_244)));
    float3 _878 = select(_876, float3(0.0), isnan(_876));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _878.xy, uint(rint(_878.z)), _252);
    float3 _887 = float3(_256, _280, float(int(_244)));
    float3 _889 = select(_887, float3(0.0), isnan(_887));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _889.xy, uint(rint(_889.z)), _252);
    float3 _898 = float3(_246, _280, float(int(_244)));
    float3 _900 = select(_898, float3(0.0), isnan(_898));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _900.xy, uint(rint(_900.z)), _252);
    float3 _909 = float3(_268, _280, float(int(_244)));
    float3 _911 = select(_909, float3(0.0), isnan(_909));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _911.xy, uint(rint(_911.z)), _252);
    float2 _917 = float2(_270, _274);
    float _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_917, float2(0.0), isnan(_917))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_917, float2(0.0), isnan(_917))).x;
    float _302 = -_62;
    float _304 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _306 = _302 + _304;
    float _308 = -_62;
    float _310 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _312 = _308 + _310;
    float _314 = _306 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _316 = precise::clamp(_314, 0.0, 1.0);
    float _318 = _312 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[34].w;
    float _324 = _284 + _282;
    float _326 = _324 + _286;
    float _328 = _326 + _288;
    float _330 = _328 + _290;
    float _332 = _330 + _292;
    float _334 = _332 + _294;
    float _336 = _334 + _296;
    float _338 = _336 + _298;
    float _340 = fma(_338, 0.111111111938953399658203125, _316);
    out.m_43.x = _300;
    out.m_43.y = _340;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _322;
    return out;
}

